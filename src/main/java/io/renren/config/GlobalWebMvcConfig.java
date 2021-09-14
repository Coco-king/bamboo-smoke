/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import io.renren.common.serializer.CustomizeJsonSerializer;
import io.renren.common.serializer.MyBeanSerializerModifier;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 项目整体MVC配置
 */
@Configuration
public class GlobalWebMvcConfig implements WebMvcConfigurer {

    /**
     * 配置跨域
     * TODO 真实项目建议把跨域挪动到网关
     *
     * @author Mark sunlightcs@gmail.com
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
            .allowedOrigins("*")
            .allowCredentials(true)
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
            .maxAge(3600);
    }

    /**
     * 配置Jackson的序列化方式
     */
    @Bean
    @Primary
    @ConditionalOnMissingBean(ObjectMapper.class)
    public ObjectMapper jacksonObjectMapper(Jackson2ObjectMapperBuilder builder) {
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();
        // 为objectMapper注册一个带有SerializerModifier的Factory
        objectMapper.setSerializerFactory(objectMapper.getSerializerFactory().withSerializerModifier(new MyBeanSerializerModifier()));

        SerializerProvider serializerProvider = objectMapper.getSerializerProvider();
        serializerProvider.setNullValueSerializer(new CustomizeJsonSerializer.NullObjectJsonSerializer());
        return objectMapper;
    }
}
