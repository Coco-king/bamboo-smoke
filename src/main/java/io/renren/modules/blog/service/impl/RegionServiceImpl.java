package io.renren.modules.blog.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import io.renren.common.exception.ErrorConstant;
import io.renren.common.exception.RRException;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.mapper.RegionMapper;
import io.renren.modules.blog.service.RegionService;
import io.renren.modules.blog.utils.StreamUtil;
import io.renren.modules.blog.vo.RegionParentVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@Slf4j
@Service("regionService")
public class RegionServiceImpl extends ServiceImpl<RegionMapper, RegionEntity> implements RegionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RegionEntity> page = this.page(
            new Query<RegionEntity>().getPage(params),
            new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void initRegion() {
        InputStream inputStream = FileUtil.getInputStream("static/region-data-array.json");
        String json = StreamUtil.toString(inputStream);
        IoUtil.close(inputStream);
        List<RegionEntity> regions = this.initRegionLevel(JSONUtil.toList(json, RegionEntity.class));
        baseMapper.deleteAll();
        this.saveBatch(regions);
    }

    @Override
//    @Cacheable(value = "regionTree", key = "#root.methodName + ':' + #root.args[0] + ' - ' + #root.args[1] + ' - ' + #root.args[2] + ' - ' + #root.args[3]", sync = true)
    public List<RegionParentVo> findAllWithTree(Integer maxLevel, Long rootId, Boolean isLazy) {
        //表示延迟加载
        if (isLazy) {
            return this.lazyLoad(rootId);
        }
        return this.eagerLoad(maxLevel, rootId);
    }

    @Override
    public List<String> getParentPath(Long id, Boolean excludeSelf) {
        List<String> result = excludeSelf ? Lists.newArrayList() : Lists.newArrayList(id.toString());
        this.getParentPath(id, result);
        Collections.reverse(result);
        return result;
    }

    @Override
    public R checkAndUpdate(RegionEntity region) {
        Long parentId = region.getParentId();
        Long id = region.getId();
        Assert.isNotEqual(parentId, id, ErrorConstant.REGION_PARENT_NOT_EQUAL_SELF);

        List<RegionParentVo> tree = this.findAllWithTree(Integer.MAX_VALUE, id, false);
        Assert.isNotEmpty(tree, ErrorConstant.REGION_NOT_FOUND);
        Assert.isTrue(tree.size() == 1, ErrorConstant.REGION_FOUND_MUST_UNIQUE);

        //获取当前节点的深度
        int depth = getDepth(tree.get(0));

        //获取待移动的父级节点信息
        RegionEntity parent = baseMapper.selectById(parentId);
        Assert.isNotNull(parent, ErrorConstant.REGION_PARENT_NOT_FOUND);
        //获取父级的Level，由于层级是从0开始的，所以加一
        int level = ObjectUtil.defaultIfNull(parent.getLevel(), 0) + 1;

        //如果当前节点的深度 + 父节点的level > 4，就不能移动
        Assert.isTrue(depth + level <= 4, ErrorConstant.REGION_MAX_LEVEL_OVERFLOW);

        RegionEntity update = new RegionEntity();
        update.setId(region.getId());
        update.setParentId(parentId);
        update.setName(region.getName());
        // 设置移动后的层级，为他的父层级 + 1
        update.setLevel(level);
        try {
            baseMapper.updateById(update);
        } catch (Exception e) {
            log.error(ErrorConstant.REGION_UPDATE_UNIQUE_ERROR, e);
            throw new RRException(ErrorConstant.REGION_PARENT_WITH_SAME_NAME);
        }
        return R.ok().push("newParentId", parentId.toString()).push("oldItem", tree.get(0));
    }

    @Override
    public R removeWithChildrenById(Long id) {
        List<RegionParentVo> tree = this.findAllWithTree(Integer.MAX_VALUE, id, false);

        List<Long> ids = Lists.newArrayList(id);
        this.getChildrenId(tree.get(0), ids);
        boolean isSuccess = baseMapper.deleteBatchIds(ids) > 0;
        if (isSuccess) {
            RegionEntity grandFather = baseMapper.selectById(tree.get(0).getParentId());
            if (grandFather != null) {
                return R.ok().push("grandFatherId", grandFather.getParentId().toString());
            }
            return R.ok();
        }
        return R.error("没有任何数据被删除");
    }

    @Override
    public R saveRegion(RegionEntity region) {
        RegionEntity parent = baseMapper.selectById(region.getParentId());
        Assert.isNotNull(parent, "父节点信息有误");
        Assert.isTrue(parent.getLevel() < 3, ErrorConstant.REGION_MAX_LEVEL_OVERFLOW);

        region.setId(Long.parseLong(region.getValue()));
        region.setLevel(parent.getLevel() + 1);

        try {
            baseMapper.insert(region);
        } catch (Exception e) {
            log.error(ErrorConstant.REGION_UPDATE_UNIQUE_ERROR, e);
            throw new RRException(e.getMessage().contains("PRIMARY") ?
                ErrorConstant.REGION_VALUE_MUST_UNIQUE :
                ErrorConstant.REGION_PARENT_WITH_SAME_NAME);
        }

        return R.ok().push("newParentId", region.getParentId().toString());
    }

    private void getChildrenId(RegionParentVo tree, List<Long> childrenIds) {
        List<RegionParentVo> children = tree.getChildren();
        if (CollectionUtil.isNotEmpty(children)) {
            for (RegionParentVo child : children) {
                childrenIds.add(child.getId());
                getChildrenId(child, childrenIds);
            }
        }
    }

    private int getDepth(RegionParentVo tree) {
        List<Integer> depthPool = Lists.newArrayList();
        this.calcDepth(tree, 1, depthPool);
        return depthPool.isEmpty() ? 1 : Collections.max(depthPool);
    }

    private void calcDepth(RegionParentVo tree, int depth, List<Integer> depthPool) {
        List<RegionParentVo> children = tree.getChildren();
        if (CollectionUtil.isNotEmpty(children)) {
            depthPool.add(++depth);
            for (RegionParentVo child : children) {
                calcDepth(child, depth, depthPool);
            }
        }
    }

    /**
     * 递归找到他的所有上级路径，子路径在前 例如：["11001","11000","1"]
     */
    private void getParentPath(Long id, List<String> list) {
        RegionEntity region = baseMapper.selectById(id);
        Long parentId = region.getParentId();
        if (parentId != 0) {
            list.add(parentId.toString());
            getParentPath(parentId, list);
        }
    }

    private List<RegionParentVo> lazyLoad(Long rootId) {
        // 这里是自己写的xml，需指定查询未删除的条件
        List<RegionParentVo> list = baseMapper.selectRegionParentList(
            new QueryWrapper<RegionEntity>()
                .eq("parent_id", rootId)
                .eq("is_deleted", false)
        );

        return list.stream()
            .peek(region -> {
                boolean hasChildren = false;
                //如果他的层级小于3，就没必要再去找他的子区域了
                if (region.getLevel() < 3) {
                    long count = this.count(new QueryWrapper<RegionEntity>().eq("parent_id", region.getId()));
                    hasChildren = count > 0;
                }
                region.setHasChildren(hasChildren);
            })
            .sorted(Comparator.comparing(RegionEntity::getId))
            .collect(Collectors.toList());
    }

    /**
     * 查询指定节点下的所有节点
     */
    private List<RegionParentVo> eagerLoad(Integer maxLevel, Long rootId) {
        // 这里是自己写的xml，需指定查询未删除的条件
        List<RegionParentVo> list = baseMapper.selectRegionParentList(
            new QueryWrapper<RegionEntity>()
                .le("level", maxLevel)
                .eq("is_deleted", false)
        );

        //获取所有根节点
        return list.stream()
            .filter(region -> region.getId().equals(rootId))
            .peek(region -> this.buildTree(region, list))
            .collect(Collectors.toList());
    }

    private void buildTree(RegionParentVo parent, List<RegionParentVo> list) {
        for (RegionParentVo region : list) {
            if (parent.getId().equals(region.getParentId())) {
                parent.getChildren().add(region);
                parent.setHasChildren(true);
                buildTree(region, list);
            }
        }
    }

    private List<RegionEntity> initRegionLevel(List<RegionEntity> regions) {
        Map<String, RegionEntity> map = regions.stream()
            .collect(Collectors.toMap(RegionEntity::getValue, val -> val, (a, b) -> a));

        return regions.stream().distinct().peek(region -> {
            region.setId(Long.parseLong(region.getValue()));
            Long parentId = region.getParentId();
            if (parentId == null) {
                region.setLevel(0);
                region.setParentId(0L);
            } else {
                RegionEntity regionEntity = map.get(parentId.toString());
                if (regionEntity == null) {
                    throw new RRException("Json数据有误，未找到 {} 的上级区域[id='{}']", region.getValue(), parentId);
                }
                region.setLevel(regionEntity.getLevel() + 1);
            }
        }).collect(Collectors.toList());
    }
}
