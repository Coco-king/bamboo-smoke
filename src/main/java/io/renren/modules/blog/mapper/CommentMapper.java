package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.blog.entity.CommentEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户评论表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Mapper
public interface CommentMapper extends BaseMapper<CommentEntity> {

}
