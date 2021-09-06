package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import io.renren.modules.blog.entity.UserActionEntity;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Mapper
public interface UserActionMapper extends BaseMapper<UserActionEntity> {

}
