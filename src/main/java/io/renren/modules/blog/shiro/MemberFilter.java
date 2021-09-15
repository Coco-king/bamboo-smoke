package io.renren.modules.blog.shiro;

import cn.hutool.json.JSONUtil;
import io.renren.common.utils.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.UserFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

/**
 * @author wanggang
 * @since 2021年09月15日 下午 4:39
 */
public class MemberFilter extends UserFilter {
    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        //判断是否登录
        boolean authenticated = SecurityUtils.getSubject().isAuthenticated();
        if (!authenticated) {
            //返回json数据
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(JSONUtil.toJsonStr(R.error("登录授权信息已过期或未登录，请刷新页面或登陆")));
        }
    }
}
