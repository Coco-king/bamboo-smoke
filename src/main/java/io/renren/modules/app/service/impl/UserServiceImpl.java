/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.RRException;
import io.renren.common.validator.Assert;
import io.renren.modules.app.dao.UserDao;
import io.renren.modules.app.entity.AppUserEntity;
import io.renren.modules.app.form.LoginForm;
import io.renren.modules.app.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

/**
 * @author Mark sunlightcs@gmail.com
 */
@Service("appUserService")
public class UserServiceImpl extends ServiceImpl<UserDao, AppUserEntity> implements UserService {

    @Override
    public AppUserEntity queryByMobile(String mobile) {
        return baseMapper.selectOne(new QueryWrapper<AppUserEntity>().eq("mobile", mobile));
    }

    @Override
    public long login(LoginForm form) {
        AppUserEntity user = queryByMobile(form.getMobile());
        Assert.isNotNull(user, "手机号或密码错误");

        //密码错误
        if (!user.getPassword().equals(DigestUtils.sha256Hex(form.getPassword()))) {
            throw new RRException("手机号或密码错误");
        }

        return user.getUserId();
    }
}
