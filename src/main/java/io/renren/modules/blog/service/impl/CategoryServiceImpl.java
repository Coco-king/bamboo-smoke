package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.CategoryMapper;
import io.renren.modules.blog.entity.CategoryEntity;
import io.renren.modules.blog.service.CategoryService;

import java.util.Map;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:36
 */
@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, CategoryEntity> implements CategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
