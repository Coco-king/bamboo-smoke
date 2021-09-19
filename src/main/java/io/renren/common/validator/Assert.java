/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.common.validator;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.ObjectUtil;
import io.renren.common.exception.RRException;
import org.apache.commons.lang.StringUtils;

/**
 * 数据校验
 *
 * @author Mark sunlightcs@gmail.com
 */
public abstract class Assert {

    public static void isNotBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new RRException(message);
        }
    }

    public static void isNotNull(Object object, String message) {
        if (object == null) {
            throw new RRException(message);
        }
    }

    public static void isNotEqual(Object o1, Object o2, String message) {
        if (ObjectUtil.equal(o1, o2)) {
            throw new RRException(message);
        }
    }

    public static void isNotEmpty(Iterable<?> iterable, String message) {
        if (CollectionUtil.isEmpty(iterable)) {
            throw new RRException(message);
        }
    }

    public static void isTrue(Boolean bool, String message) {
        if (BooleanUtil.isFalse(bool)) {
            throw new RRException(message);
        }
    }

    public static void isFalse(Boolean bool, String message) {
        if (BooleanUtil.isTrue(bool)) {
            throw new RRException(message);
        }
    }
}
