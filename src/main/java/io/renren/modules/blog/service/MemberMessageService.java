package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.MemberMessageEntity;

import java.util.Map;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
public interface MemberMessageService extends IService<MemberMessageEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

