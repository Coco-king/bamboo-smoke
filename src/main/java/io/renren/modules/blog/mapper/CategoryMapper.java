package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import io.renren.modules.blog.entity.CategoryEntity;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:36
 */
@Mapper
public interface CategoryMapper extends BaseMapper<CategoryEntity> {

}
