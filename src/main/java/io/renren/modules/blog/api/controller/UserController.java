package io.renren.modules.blog.api.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.UserEntity;
import io.renren.modules.blog.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/user")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        UserEntity user = userService.getById(id);

        return R.ok().push("user", user);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserEntity user) {
        userService.save(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody UserEntity user) {
        userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        userService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
