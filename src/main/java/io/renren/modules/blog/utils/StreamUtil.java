package io.renren.modules.blog.utils;

import cn.hutool.core.util.StrUtil;
import io.renren.common.exception.RRException;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * @author wanggang
 * @since 2021年09月14日 下午 3:12
 */
@Slf4j
public class StreamUtil {

    /**
     * 将一个字符串转化为输入流
     */
    public static InputStream toStream(String inputString) {
        if (StrUtil.isBlank(inputString)) {
            throw new RRException("字符串转化为输入流失败，传入的inputString不能为空");
        }

        try {
            return new ByteArrayInputStream(inputString.getBytes());
        } catch (Exception e) {
            log.error("字符串转化为输入流失败", e);
            throw new RRException("字符串转化为输入流失败", e);
        }
    }

    /**
     * 将一个输入流转化为字符串
     */
    public static String toString(InputStream inputStream) {
        if (inputStream == null) {
            throw new RRException("输入流转化为字符串失败，传入的inputStream不能为空");
        }

        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            StringBuilder builder = new StringBuilder();
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                builder.append(line);
            }
            return builder.toString();
        } catch (Exception e) {
            log.error("输入流转化为字符串失败", e);
            throw new RRException("输入流转化为字符串失败", e);
        }
    }
}
