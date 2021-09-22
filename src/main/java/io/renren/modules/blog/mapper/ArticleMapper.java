package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.blog.entity.ArticleEntity;
import io.renren.modules.blog.vo.ArticleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Mapper
public interface ArticleMapper extends BaseMapper<ArticleEntity> {

    IPage<ArticleVo> selectArticleVoPage(
        @Param("page") IPage<ArticleEntity> page,
        @Param(Constants.WRAPPER) Wrapper<ArticleEntity> wrapper
    );
}
