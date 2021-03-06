package io.renren.modules.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.entity.ArticleEntity;
import io.renren.modules.blog.mapper.ArticleMapper;
import io.renren.modules.blog.service.ArticleService;
import io.renren.modules.blog.vo.ArticleVo;
import io.renren.modules.blog.vo.search.ArticleSearchVo;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Service("articleService")
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, ArticleEntity> implements ArticleService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        // 把map转换为搜索实体类
        ArticleSearchVo searchVo = BeanUtil.toBean(params, ArticleSearchVo.class);

        IPage<ArticleVo> page = baseMapper.selectArticleVoPage(
            new Query<ArticleEntity>().getPage(params),
            searchVo.getId(), searchVo.getKey(),
            searchVo.getStatus(), searchVo.getCategoryId()
        );

        return new PageUtils(page);
    }

    @Override
    public ArticleVo getArticleVoById(Long id) {
        return baseMapper.selectArticleVoById(id);
    }

}
