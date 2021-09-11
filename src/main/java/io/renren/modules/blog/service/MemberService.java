package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.MemberEntity;

import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

