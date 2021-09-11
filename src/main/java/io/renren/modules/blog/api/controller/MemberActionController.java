package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.MemberActionEntity;
import io.renren.modules.blog.service.MemberActionService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@RestController
@RequestMapping("api/memberaction")
public class MemberActionController {

    @Resource
    private MemberActionService memberActionService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberActionService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberActionEntity memberAction = memberActionService.getById(id);

        return R.ok().push("memberAction", memberAction);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody MemberActionEntity memberAction) {
        memberActionService.save(memberAction);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody MemberActionEntity memberAction) {
        memberActionService.updateById(memberAction);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberActionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
