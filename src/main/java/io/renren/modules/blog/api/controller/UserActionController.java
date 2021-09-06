package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.UserActionEntity;
import io.renren.modules.blog.service.UserActionService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/useraction")
public class UserActionController {

    @Resource
    private UserActionService userActionService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userActionService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        UserActionEntity userAction = userActionService.getById(id);

        return R.ok().push("userAction", userAction);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserActionEntity userAction) {
        userActionService.save(userAction);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody UserActionEntity userAction) {
        userActionService.updateById(userAction);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        userActionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
