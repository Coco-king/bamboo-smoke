package io.renren.common.serializer;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.BeanSerializerModifier;

import java.util.Collection;
import java.util.List;

public class MyBeanSerializerModifier extends BeanSerializerModifier {

    @Override
    public List<BeanPropertyWriter> changeProperties(
        SerializationConfig config,
        BeanDescription beanDesc,
        List<BeanPropertyWriter> beanProperties
    ) {
        // 循环所有的beanPropertyWriter
        for (BeanPropertyWriter writer : beanProperties) {
            // 判断字段的类型，如果是数组或集合则注册nullSerializer
            if (isArrayType(writer)) {
                // 给writer注册一个自己的nullSerializer   
                writer.assignNullSerializer(new CustomizeJsonSerializer.NullArrayJsonSerializer());
            }
            if (isStringType(writer)) {
                writer.assignNullSerializer(new CustomizeJsonSerializer.NullStringJsonSerializer());
            }
            if (isLongType(writer)) {
                // Long类型使用字符串类型渲染
                writer.assignSerializer(new CustomizeJsonSerializer.NumberJsonSerializer());
            }
        }
        return beanProperties;
    }

    /**
     * 是否是数组
     */
    private boolean isArrayType(BeanPropertyWriter writer) {
        Class<?> clazz = writer.getType().getRawClass();
        return clazz.isArray() || Collection.class.isAssignableFrom(clazz);
    }

    /**
     * 是否是String
     */
    private boolean isStringType(BeanPropertyWriter writer) {
        Class<?> clazz = writer.getType().getRawClass();
        return CharSequence.class.isAssignableFrom(clazz) || Character.class.isAssignableFrom(clazz);
    }

    /**
     * 是否是Long类型
     */
    private boolean isLongType(BeanPropertyWriter writer) {
        Class<?> clazz = writer.getType().getRawClass();
        return Long.class.equals(clazz);
    }
}
