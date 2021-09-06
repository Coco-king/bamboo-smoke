package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.UserCollectionMapper;
import io.renren.modules.blog.entity.UserCollectionEntity;
import io.renren.modules.blog.service.UserCollectionService;

import java.util.Map;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("userCollectionService")
public class UserCollectionServiceImpl extends ServiceImpl<UserCollectionMapper, UserCollectionEntity> implements UserCollectionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserCollectionEntity> page = this.page(
                new Query<UserCollectionEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
