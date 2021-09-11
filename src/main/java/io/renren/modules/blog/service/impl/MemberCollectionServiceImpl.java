package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.blog.service.MemberCollectionService;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.MemberCollectionMapper;
import io.renren.modules.blog.entity.MemberCollectionEntity;

import java.util.Map;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Service("memberCollectionService")
public class MemberCollectionServiceImpl extends ServiceImpl<MemberCollectionMapper, MemberCollectionEntity> implements MemberCollectionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberCollectionEntity> page = this.page(
                new Query<MemberCollectionEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
