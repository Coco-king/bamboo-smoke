package io.renren.modules.blog.admin.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.CategoryEntity;
import io.renren.modules.blog.service.CategoryService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@RestController
@RequestMapping("admin/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = categoryService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        CategoryEntity category = categoryService.getById(id);

        return R.ok().push("category", category);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody CategoryEntity category) {
        categoryService.save(category);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody CategoryEntity category) {
        categoryService.updateById(category);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        categoryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
