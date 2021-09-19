package io.renren.config;

import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalTimeSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 * @author wanggang
 * @since 2021年09月15日 上午 11:15
 */
@Configuration
public class TimeSerializerConfig {

    @Value("${spring.jackson.date-format:yyyy-MM-dd HH:mm:ss}")
    private String pattern;

    @Value("${spring.jackson.time-zone:GMT+8}")
    private String timeZone;

    @Bean
    public LocalDateTimeSerializer localDateTimeDeserializer() {
        return new LocalDateTimeSerializer(DateTimeFormatter.ofPattern(pattern));
    }

    @Bean
    public LocalDateSerializer localDateDeserializer() {
        return new LocalDateSerializer(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    @Bean
    public LocalTimeSerializer localTimeDeserializer() {
        return new LocalTimeSerializer(DateTimeFormatter.ofPattern("HH:mm:ss"));
    }

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer(
        LocalDateTimeSerializer localDateTimeDeserializer,
        LocalDateSerializer localDateDeserializer,
        LocalTimeSerializer localTimeDeserializer
    ) {
        return builder -> builder.timeZone(timeZone)
            .serializerByType(LocalDateTime.class, localDateTimeDeserializer)
            .serializerByType(LocalDate.class, localDateDeserializer)
            .serializerByType(LocalTime.class, localTimeDeserializer);
    }
}
