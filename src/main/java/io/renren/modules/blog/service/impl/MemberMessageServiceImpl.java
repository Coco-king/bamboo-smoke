package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.blog.entity.MemberMessageEntity;
import io.renren.modules.blog.mapper.MemberMessageMapper;
import io.renren.modules.blog.service.MemberMessageService;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import java.util.Map;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Service("memberMessageService")
public class MemberMessageServiceImpl extends ServiceImpl<MemberMessageMapper, MemberMessageEntity> implements MemberMessageService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberMessageEntity> page = this.page(
                new Query<MemberMessageEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
