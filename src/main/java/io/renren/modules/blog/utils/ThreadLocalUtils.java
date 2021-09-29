package io.renren.modules.blog.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author codecrab
 * @since 2021年09月29日 下午 3:44
 */
public class ThreadLocalUtils {

    private static final ThreadLocal<Map<String, Object>> cache = new ThreadLocal<>();

    /**
     * 向ThreadLocal缓存值
     *
     * @param key   要缓存的KEY
     * @param value 要缓存的VALUE
     */
    public static void set(String key, Object value) {
        if (!cacheIsNull()) {
            cache.get().put(key, value);
        } else {
            Map<String, Object> map = new HashMap<>();
            map.put(key, value);
            cache.set(map);
        }
    }

    /**
     * 从ThreadLocal里获取缓存的值
     *
     * @param key 要获取的数据的KEY
     * @return 要获取的值
     */
    public static Object getCache(String key) {
        Map<String, Object> map = cache.get();
        if (cacheIsNull()) {
            return null;
        }
        return map.getOrDefault(key, null);
    }

    /**
     * 从ThreadLocal里获取所有缓存
     *
     * @return 所有线程变量
     */
    public static Map<String, Object> get() {
        return cache.get();
    }

    /**
     * 根据KEY移除缓存里的数据
     */
    public static void removeByKey(String key) {
        if (!cacheIsNull()) {
            cache.get().remove(key);
        }
    }

    /**
     * 移除当前线程缓存
     * 用于释放当前线程threadLocal资源
     */
    public static void remove() {
        cache.remove();
    }

    private static boolean cacheIsNull() {
        return cache.get() == null;
    }

}
