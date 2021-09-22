package io.renren.modules.blog.controller.admin;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.CommentEntity;
import io.renren.modules.blog.service.CommentService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户评论表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@RestController
@RequestMapping("admin/comment")
public class AdminCommentController {

    @Resource
    private CommentService commentService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = commentService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        CommentEntity comment = commentService.getById(id);

        return R.ok().push("comment", comment);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CommentEntity comment) {
        commentService.save(comment);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody CommentEntity comment) {
        commentService.updateById(comment);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        commentService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
