package io.renren.modules.blog.controller.admin;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.service.RegionService;
import io.renren.modules.blog.vo.RegionParentVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@RestController
@Api(tags = "区域管理")
@RequestMapping("admin/region")
public class AdminRegionController {

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
     * 获取指定parentId和他的所有下级区域信息
     */
    @ApiOperation("地域信息树型数据")
    @GetMapping("/list/tree")
    public R listTree(
        @RequestParam(required = false, defaultValue = "100") Integer maxLevel,
        @RequestParam(required = false, defaultValue = "false") Boolean isLazy,
        @RequestParam(required = false, defaultValue = "1") Long parentId
    ) {
        List<RegionParentVo> list = regionService.findAllWithTree(maxLevel, parentId, isLazy);

        return R.ok().push("list", list);
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
     * 获取父级路径
     */
    @GetMapping("/path")
    public R path(
        @RequestParam Long id,
        @RequestParam(defaultValue = "true") Boolean excludeSelf
    ) {
        List<String> cascadeData = regionService.getParentPath(id, excludeSelf);

        return R.ok().push("cascadeData", cascadeData);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @CacheEvict(value = "regionTree", allEntries = true)
    public R save(@RequestBody RegionEntity region) {
        ValidatorUtils.validateEntity(region);

        return regionService.saveRegion(region);
    }

    /**
     * 初始化中国各区域信息，若已有信息原信息会被替换
     */
    @PostMapping("/initRegion")
    @CacheEvict(value = "regionTree", allEntries = true)
    public R initRegion() {
        regionService.initRegion();

        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @CacheEvict(value = "regionTree", allEntries = true)
    public R update(@RequestBody RegionEntity region) {
        ValidatorUtils.validateEntity(region);

        return regionService.checkAndUpdate(region);
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    @CacheEvict(value = "regionTree", allEntries = true)
    public R delete(@PathVariable Long id) {
        return regionService.removeWithChildrenById(id);
    }

}
