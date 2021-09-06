package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.UserEntity;

import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

