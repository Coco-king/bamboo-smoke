/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatis-plus配置
 *
 * @author Mark sunlightcs@gmail.com
 */
@Configuration
public class MybatisPlusConfig {

    /**
     * 注册插件
     *
     * @param paginationInterceptor 分页插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(
        PaginationInnerInterceptor paginationInterceptor
    ) {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(paginationInterceptor);
        return interceptor;
    }

    /**
     * 分页插件
     */
    @Bean
    public PaginationInnerInterceptor paginationInterceptor() {

        PaginationInnerInterceptor paginationInterceptor = new PaginationInnerInterceptor(DbType.MYSQL);
        // 设置请求的页面大于最大页后操作， true调回到首页，false 继续请求  默认false
        paginationInterceptor.setOverflow(true);
        // 设置最大单页限制数量，默认 500 条，-1 不受限制
        paginationInterceptor.setMaxLimit(-1L);
        // 开启 count 的 join 优化,只针对部分 left join
        paginationInterceptor.setOptimizeJoin(true);

        return paginationInterceptor;
    }
}
