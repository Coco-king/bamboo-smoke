package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.PostEntity;
import io.renren.modules.blog.service.PostService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@RestController
@RequestMapping("api/post")
public class PostController {

    @Resource
    private PostService postService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = postService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        PostEntity post = postService.getById(id);

        return R.ok().push("post", post);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody PostEntity post) {
        postService.save(post);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody PostEntity post) {
        postService.updateById(post);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        postService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
