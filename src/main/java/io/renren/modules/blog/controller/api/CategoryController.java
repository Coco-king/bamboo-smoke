package io.renren.modules.blog.controller.api;

import io.renren.common.utils.R;
import io.renren.modules.blog.service.CategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author codecrab
 * @since 2021年09月22日 下午 4:37
 */
@RestController
@RequestMapping("api")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    /**
     * 列表
     */
    @GetMapping("/category/list")
    public R list() {
        return R.ok().push("list", categoryService.list());
    }

    /**
     * 列表
     */
    @GetMapping("/category/path")
    public R path(@RequestParam Long id) {
        List<String> cascadeData = categoryService.getParentPath(id);

        return R.ok().push("cascadeData", cascadeData);
    }

}
