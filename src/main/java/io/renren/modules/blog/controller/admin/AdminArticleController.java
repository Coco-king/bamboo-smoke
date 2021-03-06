package io.renren.modules.blog.controller.admin;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.blog.entity.ArticleEntity;
import io.renren.modules.blog.service.ArticleService;
import io.renren.modules.blog.vo.StatusBaseVo;
import io.renren.modules.blog.vo.ArticleVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@RestController
@RequestMapping("admin/article")
public class AdminArticleController {

    @Resource
    private ArticleService articleService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = articleService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        ArticleVo article = articleService.getArticleVoById(id);

        return R.ok().push("article", article);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody ArticleEntity article) {
        articleService.save(article);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody ArticleEntity article) {
        articleService.updateById(article);

        return R.ok();
    }

    /**
     * 审核不通过/通过
     */
    @PutMapping("/examine")
    public R toExamine(@RequestBody StatusBaseVo examineVo) {
        ValidatorUtils.validateEntity(examineVo);

        boolean update = articleService.update(
            new UpdateWrapper<ArticleEntity>()
                .in("id", examineVo.getIds())
                .eq("status", 0)
                .set("status", examineVo.getStatus())
        );

        return update ? R.ok() : R.error("修改失败：没有任何数据被改变");
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        articleService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
