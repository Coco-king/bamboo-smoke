package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.blog.service.MemberSocialService;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.MemberSocialMapper;
import io.renren.modules.blog.entity.MemberSocialEntity;

import java.util.Map;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Service("memberSocialService")
public class MemberSocialServiceImpl extends ServiceImpl<MemberSocialMapper, MemberSocialEntity> implements MemberSocialService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberSocialEntity> page = this.page(
                new Query<MemberSocialEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
