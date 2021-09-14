package io.renren.modules.blog.admin.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.service.RegionService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@RestController
@RequestMapping("admin/region")
public class RegionController {

    @Resource
    private RegionService regionService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = regionService.queryPage(params);

        return R.ok().push("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        RegionEntity region = regionService.getById(id);

        return R.ok().push("region", region);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody RegionEntity region) {
        regionService.save(region);

        return R.ok();
    }

    /**
     * 保存
     */
    @PostMapping("/import")
    public R importRegion(@RequestBody RegionEntity region) {
        regionService.save(region);

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public R update(@RequestBody RegionEntity region) {
        regionService.updateById(region);

        return R.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        regionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
