package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.MemberActionEntity;

import java.util.Map;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
public interface MemberActionService extends IService<MemberActionEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

