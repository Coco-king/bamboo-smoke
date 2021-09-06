package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.PostMapper;
import io.renren.modules.blog.entity.PostEntity;
import io.renren.modules.blog.service.PostService;

import java.util.Map;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("postService")
public class PostServiceImpl extends ServiceImpl<PostMapper, PostEntity> implements PostService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PostEntity> page = this.page(
                new Query<PostEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
