/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */
package io.renren.config;

import com.google.common.collect.Maps;
import io.renren.common.shiro.CustomizedModularRealmAuthenticator;
import io.renren.modules.blog.shiro.MemberFilter;
import io.renren.modules.blog.shiro.MemberRealm;
import io.renren.modules.sys.oauth2.AdminFilter;
import io.renren.modules.sys.oauth2.AdminRealm;
import org.apache.shiro.authc.pam.AtLeastOneSuccessfulStrategy;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.Arrays;
import java.util.Map;

/**
 * Shiro配置
 *
 * @author Mark sunlightcs@gmail.com
 */
@Configuration
public class ShiroConfig {

    @Bean("securityManager")
    public SecurityManager securityManager(
        AdminRealm adminRealm,
        MemberRealm memberRealm,
        CustomizedModularRealmAuthenticator authenticator
    ) {
        //配置认证策略，只要有一个Realm认证成功即可，并且返回所有认证成功信息
        authenticator.setAuthenticationStrategy(new AtLeastOneSuccessfulStrategy());
        authenticator.setRealms(Arrays.asList(adminRealm, memberRealm));
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //可以配置多个Realm，其实会把realms属性赋值给ModularRealmAuthenticator的realms属性
        securityManager.setRealms(Arrays.asList(adminRealm, memberRealm));
        //配置使用自定义认证器，可以实现多Realm认证，并且可以指定特定Realm处理特定类型的验证
        securityManager.setAuthenticator(authenticator);
        securityManager.setRememberMeManager(null);
        return securityManager;
    }

    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);

        //oauth过滤
        Map<String, Filter> filters = Maps.newHashMapWithExpectedSize(1);
        filters.put("admin", new AdminFilter());
        filters.put("member", new MemberFilter());
        shiroFilter.setFilters(filters);

        Map<String, String> filterMap = Maps.newLinkedHashMapWithExpectedSize(9);
        filterMap.put("/webjars/**", "anon");
        filterMap.put("/druid/**", "anon");
        filterMap.put("/app/**", "anon");
        filterMap.put("/sys/login", "anon");
        filterMap.put("/swagger**/**", "anon");
        filterMap.put("/v3/**", "anon");
        filterMap.put("/docs.html", "anon");
        filterMap.put("/captcha.jpg", "anon");
        filterMap.put("/api/**", "member");
        filterMap.put("/admin/**", "admin");
        filterMap.put("/**", "admin");
        shiroFilter.setFilterChainDefinitionMap(filterMap);

        return shiroFilter;
    }

    @Bean("lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager);
        return advisor;
    }

}
