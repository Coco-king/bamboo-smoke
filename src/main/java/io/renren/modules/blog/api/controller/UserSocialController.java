package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.UserSocialEntity;
import io.renren.modules.blog.service.UserSocialService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/usersocial")
public class UserSocialController {

    @Resource
    private UserSocialService userSocialService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userSocialService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        UserSocialEntity userSocial = userSocialService.getById(id);

        return R.ok().push("userSocial", userSocial);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserSocialEntity userSocial) {
        userSocialService.save(userSocial);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody UserSocialEntity userSocial) {
        userSocialService.updateById(userSocial);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        userSocialService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
