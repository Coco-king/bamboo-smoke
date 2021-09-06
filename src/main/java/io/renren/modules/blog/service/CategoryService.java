package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.CategoryEntity;

import java.util.Map;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:36
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

