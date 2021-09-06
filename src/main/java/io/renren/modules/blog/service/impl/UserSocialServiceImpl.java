package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.UserSocialMapper;
import io.renren.modules.blog.entity.UserSocialEntity;
import io.renren.modules.blog.service.UserSocialService;

import java.util.Map;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("userSocialService")
public class UserSocialServiceImpl extends ServiceImpl<UserSocialMapper, UserSocialEntity> implements UserSocialService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserSocialEntity> page = this.page(
                new Query<UserSocialEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
