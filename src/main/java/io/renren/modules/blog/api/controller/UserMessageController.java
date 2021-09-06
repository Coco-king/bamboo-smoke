package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.UserMessageEntity;
import io.renren.modules.blog.service.UserMessageService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/usermessage")
public class UserMessageController {

    @Resource
    private UserMessageService userMessageService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userMessageService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        UserMessageEntity userMessage = userMessageService.getById(id);

        return R.ok().push("userMessage", userMessage);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserMessageEntity userMessage) {
        userMessageService.save(userMessage);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody UserMessageEntity userMessage) {
        userMessageService.updateById(userMessage);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        userMessageService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
