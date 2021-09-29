package io.renren.modules.blog.shiro;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.google.gson.Gson;
import io.jsonwebtoken.Claims;
import io.renren.common.exception.ErrorConstant;
import io.renren.common.utils.HttpContextUtils;
import io.renren.common.utils.R;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.blog.dto.AccountProfileDto;
import io.renren.modules.blog.utils.ThreadLocalUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author wanggang
 * @since 2021年09月15日 下午 4:39
 */
public class MemberFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {

        JwtUtils jwtUtils = SpringUtil.getBean(JwtUtils.class);

        // 如果是预检请求则直接放行
        if (request.getMethod().equals(RequestMethod.OPTIONS.name())) {
            chain.doFilter(request, response);
            return;
        }

        //从header中获取token
        String token = request.getHeader("jwtToken");

        //如果header中不存在token，则从参数中获取token
        if (StringUtils.isBlank(token) || "null".equals(token)) {
            token = request.getParameter("jwtToken");
        }

        // 如果token为空，直接返回401
        if (StringUtils.isBlank(token) || "null".equals(token)) {
            // 删除线程变量中的数据
            ThreadLocalUtils.removeByKey(JwtUtils.MEMBER_CLAIM);

            response.setHeader("Access-Control-Allow-Credentials", "true");
            response.setHeader("Access-Control-Allow-Origin", HttpContextUtils.getOrigin());

            String json = new Gson().toJson(R.error(HttpStatus.SC_UNAUTHORIZED, "invalid jwtToken"));
            response.getWriter().print(json);
            return;
        }

        Claims claims = jwtUtils.getClaimByToken(token);

        // 判断token是否过期
        if (jwtUtils.isTokenExpired(claims.getExpiration())) {
            // 删除线程变量中的数据
            ThreadLocalUtils.removeByKey(JwtUtils.MEMBER_CLAIM);

            response.setHeader("Access-Control-Allow-Credentials", "true");
            response.setHeader("Access-Control-Allow-Origin", HttpContextUtils.getOrigin());

            String json = new Gson().toJson(R.error(HttpStatus.SC_UNAUTHORIZED, ErrorConstant.VERIFY_TOKEN_EXPIRED));
            response.getWriter().print(json);
            return;
        }

        //获取载荷中的会员信息
        Object profileMap = claims.get(JwtUtils.MEMBER_CLAIM);
        if (profileMap == null) {
            // 删除线程变量中的数据
            ThreadLocalUtils.removeByKey(JwtUtils.MEMBER_CLAIM);

            response.setHeader("Access-Control-Allow-Credentials", "true");
            response.setHeader("Access-Control-Allow-Origin", HttpContextUtils.getOrigin());

            String json = new Gson().toJson(R.error(HttpStatus.SC_UNAUTHORIZED, ErrorConstant.VERIFY_TOKEN_ERROR));
            response.getWriter().print(json);
            return;
        }

        //把map转为用户对象
        AccountProfileDto profileDto = BeanUtil.toBean(profileMap, AccountProfileDto.class);

        //存入线程变量中
        ThreadLocalUtils.set(JwtUtils.MEMBER_CLAIM, profileDto);

        chain.doFilter(request, response);
    }
}
