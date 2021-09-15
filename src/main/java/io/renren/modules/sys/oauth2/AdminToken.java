/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.modules.sys.oauth2;


import io.renren.common.shiro.BaseToken;
import io.renren.common.shiro.ShiroConstant;

/**
 * token
 *
 * @author Mark sunlightcs@gmail.com
 */
public class AdminToken implements BaseToken {

    private final String token;

    public AdminToken(String token) {
        this.token = token;
    }

    @Override
    public String getLoginType() {
        return ShiroConstant.ADMIN_LOGIN_TYPE;
    }

    @Override
    public String getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
