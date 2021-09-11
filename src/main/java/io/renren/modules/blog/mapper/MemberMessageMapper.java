package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.blog.entity.MemberMessageEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Mapper
public interface MemberMessageMapper extends BaseMapper<MemberMessageEntity> {

}
