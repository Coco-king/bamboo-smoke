package io.renren.modules.blog.controller.admin;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.blog.entity.MemberEntity;
import io.renren.modules.blog.service.MemberService;
import io.renren.modules.blog.vo.MemberStatusVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@RestController
@RequestMapping("admin/member")
public class AdminMemberController {

    @Resource
    private MemberService memberService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberEntity member = memberService.getById(id);

        return R.ok().push("member", member);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody MemberEntity member) {
        ValidatorUtils.validateEntity(member, AddGroup.class);
        memberService.saveMember(member);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody MemberEntity member) {
        ValidatorUtils.validateEntity(member, UpdateGroup.class);
        memberService.updateMember(member);

        return R.ok();
    }

    /**
     * 封禁/解封会员
     */
    @PutMapping("/status")
    public R status(@RequestBody MemberStatusVo statusVo) {
        ValidatorUtils.validateEntity(statusVo);

        Integer status = statusVo.getStatus();
        Boolean isActive = statusVo.getIsActive();
        Boolean isRecovery = statusVo.getIsRecovery();

        boolean update = memberService.update(
            new UpdateWrapper<MemberEntity>()
                .in("id", statusVo.getIds())
                // 将要修改的状态为已封禁时，现在的状态必须为 1（正常）
                .eq(status == -1, "status", 1)
                // 将要修改的状态为激活时，现在的状态必须为 0（未激活）
                .eq(isActive && status == 1 && !isRecovery, "status", 0)
                // 将要修改的状态为解封时，现在的状态必须为 -1（封禁）
                .eq(!isActive && status == 1 && !isRecovery, "status", -1)
                // 将要修改的状态为恢复时，现在的状态必须为 -10（已销户）
                .eq(isRecovery && status == 1, "status", -10)
                // 将要修改的状态为注销账户时，现在的状态必须不能为已销户
                .ne(status == -10, "status", -10)
                .set("status", status)
        );

        return update ? R.ok() : R.error("修改失败：没有任何数据被改变");
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
