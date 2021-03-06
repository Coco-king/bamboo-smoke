package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.MemberSocialEntity;

import java.util.Map;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
public interface MemberSocialService extends IService<MemberSocialEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

