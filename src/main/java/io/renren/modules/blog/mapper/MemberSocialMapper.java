package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.blog.entity.MemberSocialEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Mapper
public interface MemberSocialMapper extends BaseMapper<MemberSocialEntity> {

}
