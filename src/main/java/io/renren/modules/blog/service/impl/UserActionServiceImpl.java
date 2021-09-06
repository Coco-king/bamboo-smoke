package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.UserActionMapper;
import io.renren.modules.blog.entity.UserActionEntity;
import io.renren.modules.blog.service.UserActionService;

import java.util.Map;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("userActionService")
public class UserActionServiceImpl extends ServiceImpl<UserActionMapper, UserActionEntity> implements UserActionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserActionEntity> page = this.page(
                new Query<UserActionEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
