package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.MemberMessageEntity;
import io.renren.modules.blog.service.MemberMessageService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@RestController
@RequestMapping("api/membermessage")
public class MemberMessageController {

    @Resource
    private MemberMessageService memberMessageService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberMessageService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberMessageEntity memberMessage = memberMessageService.getById(id);

        return R.ok().push("memberMessage", memberMessage);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody MemberMessageEntity memberMessage) {
        memberMessageService.save(memberMessage);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody MemberMessageEntity memberMessage) {
        memberMessageService.updateById(memberMessage);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberMessageService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
