package io.renren.modules.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.entity.CategoryEntity;
import io.renren.modules.blog.mapper.CategoryMapper;
import io.renren.modules.blog.service.CategoryService;
import io.renren.modules.blog.vo.search.SearchBaseVo;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, CategoryEntity> implements CategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        SearchBaseVo searchVo = BeanUtil.toBean(params, SearchBaseVo.class);
        String id = searchVo.getId();
        String key = searchVo.getKey();

        IPage<CategoryEntity> page = this.page(
            new Query<CategoryEntity>().getPage(params),
            new QueryWrapper<CategoryEntity>()
                .eq(StrUtil.isNotBlank(id), "id", id)
                .and(StrUtil.isNotBlank(key), wrapper -> wrapper
                    .like("name", key).or()
                    .like("meta_keywords", key))
        );

        return new PageUtils(page);
    }

}
