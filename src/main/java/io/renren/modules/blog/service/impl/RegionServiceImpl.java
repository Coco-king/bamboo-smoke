package io.renren.modules.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.RRException;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.mapper.RegionMapper;
import io.renren.modules.blog.service.RegionService;
import io.renren.modules.blog.utils.StreamUtil;
import io.renren.modules.blog.vo.RegionParentVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
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
    @Cacheable(value = "regionList", key = "#root.methodName", sync = true)
    public List<RegionEntity> findAll() {
        return this.list();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void initRegion() {
        InputStream inputStream = FileUtil.getInputStream("static/data-array.json");
        String json = StreamUtil.toString(inputStream);
        IoUtil.close(inputStream);
        List<RegionEntity> regions = this.initRegionLevel(JSONUtil.toList(json, RegionEntity.class));
        baseMapper.deleteAll();
        this.saveBatch(regions);
    }

    @Override
    @Cacheable(value = "regionTree", key = "#root.methodName", sync = true)
    public List<RegionParentVo> findAllWithTree() {
        List<RegionParentVo> regionEntities = this.list().stream()
            .map(region -> BeanUtil.copyProperties(region, RegionParentVo.class))
            .collect(Collectors.toList());

        //获取所有根节点
        List<RegionParentVo> rootList = regionEntities.stream()
            .filter(regionEntity -> regionEntity.getLevel() == 1)
            .collect(Collectors.toList());

        return rootList.stream()
            .peek(region -> this.buildTree(region, regionEntities))
            .collect(Collectors.toList());
    }

    private void buildTree(RegionParentVo parent, List<RegionParentVo> list) {
        for (RegionParentVo region : list) {
            if (parent.getId().equals(region.getParentId())) {
                parent.getChildren().add(region);
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
                region.setLevel(1);
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
