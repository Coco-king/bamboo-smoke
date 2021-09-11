package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.MemberCollectionEntity;
import io.renren.modules.blog.service.MemberCollectionService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@RestController
@RequestMapping("api/membercollection")
public class MemberCollectionController {

    @Resource
    private MemberCollectionService memberCollectionService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = memberCollectionService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        MemberCollectionEntity memberCollection = memberCollectionService.getById(id);

        return R.ok().push("memberCollection", memberCollection);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody MemberCollectionEntity memberCollection) {
        memberCollectionService.save(memberCollection);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody MemberCollectionEntity memberCollection) {
        memberCollectionService.updateById(memberCollection);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        memberCollectionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
