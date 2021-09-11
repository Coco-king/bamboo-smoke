package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.MemberSocialEntity;
import io.renren.modules.blog.service.MemberSocialService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@RestController
@RequestMapping("api/membersocial")
public class MemberSocialController {

    @Resource
    private MemberSocialService memberSocialService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberSocialService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberSocialEntity memberSocial = memberSocialService.getById(id);

        return R.ok().push("memberSocial", memberSocial);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody MemberSocialEntity memberSocial) {
        memberSocialService.save(memberSocial);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody MemberSocialEntity memberSocial) {
        memberSocialService.updateById(memberSocial);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberSocialService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
