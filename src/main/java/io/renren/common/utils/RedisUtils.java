/*
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */
package io.renren.common.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * Redis工具类
 *
 * @author Mark sunlightcs@gmail.com
 */
@Component
public class RedisUtils {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Resource
    private ValueOperations<String, Object> valueOperations;

    @Resource
    private HashOperations<String, String, Object> hashOperations;

    @Resource
    private ListOperations<String, Object> listOperations;

    @Resource
    private SetOperations<String, Object> setOperations;

    @Resource
    private ZSetOperations<String, Object> zSetOperations;

    /** 默认过期时长，单位：秒 */
    public final static long DEFAULT_EXPIRE = 60 * 60 * 24;

    /** 不设置过期时长 */
    public final static long NOT_EXPIRE = -1;

    public void set(String key, Object value, long expire) {
        valueOperations.set(key, value);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
    }

    public void set(String key, Object value) {
        set(key, value, DEFAULT_EXPIRE);
    }

    public <T> T get(String key, Class<T> clazz, long expire) {
        Object value = valueOperations.get(key);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
        return value == null ? null : clazz.cast(value);
    }

    public <T> T get(String key, Class<T> clazz) {
        return get(key, clazz, NOT_EXPIRE);
    }

    public Object get(String key, long expire) {
        Object value = valueOperations.get(key);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
        return value;
    }

    public Object get(String key) {
        return get(key, NOT_EXPIRE);
    }

    public void delete(String key) {
        redisTemplate.delete(key);
    }

    public void put(String key, String hashKey, Object value, long expire) {
        hashOperations.put(key, hashKey, value);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
    }

    public void put(String key, String hashKey, Object value) {
        put(key, hashKey, value, DEFAULT_EXPIRE);
    }

    public <T> T get(String key, String hashKey, Class<T> clazz, long expire) {
        Object value = hashOperations.get(key, hashKey);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
        return value == null ? null : clazz.cast(value);
    }

    public <T> T get(String key, String hashKey, Class<T> clazz) {
        return get(key, hashKey, clazz, NOT_EXPIRE);
    }

    public Object get(String key, String hashKey, long expire) {
        Object value = hashOperations.get(key, hashKey);
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(key, expire, TimeUnit.SECONDS);
        }
        return value;
    }

    public Object get(String key, String hashKey) {
        return get(key, hashKey, NOT_EXPIRE);
    }

    public void delete(String key, String... hashKey) {
        hashOperations.delete(key, (Object[]) hashKey);
    }

}
