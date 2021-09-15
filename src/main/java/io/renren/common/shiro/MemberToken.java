package io.renren.common.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

public class MemberToken extends UsernamePasswordToken implements BaseToken {

    public MemberToken(final String username, final String password) {
        super(username, password);
    }

    @Override
    public String getLoginType() {
        return ShiroConstant.MEMBER_LOGIN_TYPE;
    }

}
