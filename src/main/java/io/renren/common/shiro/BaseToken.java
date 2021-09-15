package io.renren.common.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author wanggang
 * @since 2021年09月15日 下午 3:59
 */
public interface BaseToken extends AuthenticationToken {

    String getLoginType();

    @Override
    Object getPrincipal();

    @Override
    Object getCredentials();
}
