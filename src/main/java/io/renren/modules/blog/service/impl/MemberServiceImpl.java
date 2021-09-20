package io.renren.modules.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.ErrorConstant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.validator.Assert;
import io.renren.modules.blog.entity.MemberEntity;
import io.renren.modules.blog.mapper.MemberMapper;
import io.renren.modules.blog.service.MemberService;
import io.renren.modules.blog.vo.MemberSearchVo;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Service("memberService")
public class MemberServiceImpl extends ServiceImpl<MemberMapper, MemberEntity> implements MemberService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        // 把map转换为搜索实体类
        MemberSearchVo searchVo = BeanUtil.toBean(params, MemberSearchVo.class);
        // 搜索Id
        String id = searchVo.getId();
        // 搜索关键字
        String key = searchVo.getKey();
        // 性别条件
        String gender = searchVo.getGender();
        // 状态条件
        String status = searchVo.getStatus();
        // 注册日期区间条件
        LocalDateTime beginTime = searchVo.getCreateBeginTime();
        LocalDateTime endTime = searchVo.getCreateEndTime();

        IPage<MemberEntity> page = this.page(
            new Query<MemberEntity>().getPage(params),
            new QueryWrapper<MemberEntity>()
                .eq(StrUtil.isNotBlank(id), "id", id)
                .and(StrUtil.isNotBlank(key), wrapper -> wrapper
                    .like("email", key).or()
                    .like("member_name", key).or()
                    .like("mobile", key))
                .eq(StrUtil.isNotBlank(gender), "gender", gender)
                .eq(StrUtil.isNotBlank(status), "status", status)
                .between(!ObjectUtil.hasNull(beginTime, endTime), "create_time", beginTime, endTime)
        );

        return new PageUtils(page);
    }

    @Override
    public MemberEntity getUserByLoginName(String loginName) {
        return null;
    }

    @Override
    public void saveMember(MemberEntity member) {
        Assert.isTrue(
            member.getPassword().equals(member.getRePass()),
            ErrorConstant.MEMBER_PASS_MUST_EQUAL_REPASS
        );

        checkMemberExists(member, null);

        member.setSalt(BCrypt.gensalt());
        member.setPassword(BCrypt.hashpw(member.getPassword(), member.getSalt()));
        member.setArticleCount(0);
        member.setCommentCount(0);
        member.setCode(IdUtil.nanoId(64));
        baseMapper.insert(member);
    }

    @Override
    public void updateMember(MemberEntity member) {
        MemberEntity byId = baseMapper.selectById(member.getId());
        Assert.isNotNull(byId, ErrorConstant.MEMBER_WILL_UPDATE_IS_NULL);

        checkMemberExists(member, member.getId());

        MemberEntity update = new MemberEntity();
        // 如果不是$开头，则表示密码被更改，这里其实不严谨，不过这是后台管理，自己谨慎点就好
        if (!member.getPassword().startsWith("$")) {
            update.setPassword(BCrypt.hashpw(member.getPassword(), byId.getSalt()));
        }

        BeanUtil.copyProperties(member, update, "salt", "articleCount", "commentCount", "code", "password");
        baseMapper.updateById(update);
    }

    private void checkMemberExists(MemberEntity member, Object id) {
        Assert.isFalse(
            exists(new QueryWrapper<MemberEntity>().eq("member_name", member.getMemberName()).ne(id != null, "id", id)),
            ErrorConstant.MEMBER_WITH_SAME_MEMBER_NAME
        );
        Assert.isFalse(
            exists(new QueryWrapper<MemberEntity>().eq("email", member.getEmail()).ne(id != null, "id", id)),
            ErrorConstant.MEMBER_WITH_SAME_EMAIL
        );
        Assert.isFalse(
            exists(new QueryWrapper<MemberEntity>().eq("mobile", member.getMobile()).ne(id != null, "id", id)),
            ErrorConstant.MEMBER_WITH_SAME_MOBILE
        );
    }

    private boolean exists(Wrapper<MemberEntity> wrapper) {
        return baseMapper.selectCount(wrapper) > 0;
    }

}
