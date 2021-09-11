package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.blog.entity.MemberActionEntity;
import io.renren.modules.blog.mapper.MemberActionMapper;
import io.renren.modules.blog.service.MemberActionService;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import java.util.Map;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Service("memberActionService")
public class MemberActionServiceImpl extends ServiceImpl<MemberActionMapper, MemberActionEntity> implements MemberActionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberActionEntity> page = this.page(
                new Query<MemberActionEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
