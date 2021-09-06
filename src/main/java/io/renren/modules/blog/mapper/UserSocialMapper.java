package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import io.renren.modules.blog.entity.UserSocialEntity;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Mapper
public interface UserSocialMapper extends BaseMapper<UserSocialEntity> {

}
