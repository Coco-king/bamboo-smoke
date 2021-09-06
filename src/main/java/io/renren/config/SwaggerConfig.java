/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.config;

import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.SecurityScheme;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

/**
 * @author Mark sunlightcs@gmail.com
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig implements WebMvcConfigurer {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.OAS_30)
            .enable(true)
            .groupName("api")
            .apiInfo(apiInfoApi())
            .select()
            //加了ApiOperation注解的类，才生成接口文档
            .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
            //包下的类，才生成接口文档
            .apis(RequestHandlerSelectors.basePackage("io.renren.modules.blog.api"))
            .paths(PathSelectors.any())
            .build()
            .securitySchemes(security());
    }

    @Bean
    public Docket createRestAdminApi() {
        return new Docket(DocumentationType.OAS_30)
            .enable(true)
            .groupName("admin")
            .apiInfo(apiInfoAdmin())
            .select()
            //加了ApiOperation注解的类，才生成接口文档
            .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
            //包下的类，才生成接口文档
            .apis(RequestHandlerSelectors.basePackage("io.renren.modules.blog.admin"))
            .paths(PathSelectors.any())
            .build()
            .securitySchemes(security());
    }

    private ApiInfo apiInfoApi() {
        return new ApiInfoBuilder()
            .title("竹隐寒烟社区")
            .description("竹隐寒烟社区文档")
            .termsOfServiceUrl("http://www.codecrab.top")
            .version("1.0.0")
            .build();
    }

    private ApiInfo apiInfoAdmin() {
        return new ApiInfoBuilder()
            .title("竹隐寒烟社区")
            .description("竹隐寒烟社区管理员文档")
            .termsOfServiceUrl("http://www.codecrab.top")
            .version("1.0.0")
            .build();
    }

    private List<SecurityScheme> security() {
        return newArrayList(
            new ApiKey("token", "token", "header")
        );
    }

}
