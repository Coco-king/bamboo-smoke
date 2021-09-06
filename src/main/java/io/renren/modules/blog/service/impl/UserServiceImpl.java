package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.UserMapper;
import io.renren.modules.blog.entity.UserEntity;
import io.renren.modules.blog.service.UserService;

import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserEntity> page = this.page(
                new Query<UserEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
