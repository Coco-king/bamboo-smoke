package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.UserMessageMapper;
import io.renren.modules.blog.entity.UserMessageEntity;
import io.renren.modules.blog.service.UserMessageService;

import java.util.Map;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("userMessageService")
public class UserMessageServiceImpl extends ServiceImpl<UserMessageMapper, UserMessageEntity> implements UserMessageService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserMessageEntity> page = this.page(
                new Query<UserMessageEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
