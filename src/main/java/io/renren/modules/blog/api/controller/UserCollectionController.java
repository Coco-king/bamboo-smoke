package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.UserCollectionEntity;
import io.renren.modules.blog.service.UserCollectionService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/usercollection")
public class UserCollectionController {

    @Resource
    private UserCollectionService userCollectionService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userCollectionService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        UserCollectionEntity userCollection = userCollectionService.getById(id);

        return R.ok().push("userCollection", userCollection);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody UserCollectionEntity userCollection) {
        userCollectionService.save(userCollection);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody UserCollectionEntity userCollection) {
        userCollectionService.updateById(userCollection);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        userCollectionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
