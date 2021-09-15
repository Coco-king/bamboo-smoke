package io.renren.modules.blog.shiro;

import io.renren.common.shiro.MemberToken;
import io.renren.modules.blog.entity.MemberEntity;
import io.renren.modules.blog.service.MemberService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class MemberRealm extends AuthorizingRealm {

    @Resource
    private MemberService memberService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        MemberToken memberToken = (MemberToken) token;

        String loginName = memberToken.getUsername();

        MemberEntity member = memberService.getUserByLoginName(loginName);
        if (member == null) {
            throw new UnknownAccountException("用户不存在！");
        }

        return new SimpleAuthenticationInfo(loginName, member.getPassword(), this.getName());
    }

}
