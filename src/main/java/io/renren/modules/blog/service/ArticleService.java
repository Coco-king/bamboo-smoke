package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.blog.entity.ArticleEntity;

import java.util.Map;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
public interface ArticleService extends IService<ArticleEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

