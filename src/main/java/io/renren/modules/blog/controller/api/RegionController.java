package io.renren.modules.blog.controller.api;

import io.renren.common.utils.R;
import io.renren.modules.blog.service.RegionService;
import io.renren.modules.blog.vo.RegionParentVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021年09月22日 下午 5:00
 */
@RestController
@RequestMapping("api")
public class RegionController {

    @Resource
    private RegionService regionService;

    /**
     * 获取指定parentId和他的所有下级区域信息
     */
    @GetMapping("/region/list/tree")
    public R listTree(
        @RequestParam(required = false, defaultValue = "100") Integer maxLevel,
        @RequestParam(required = false, defaultValue = "false") Boolean isLazy,
        @RequestParam(required = false, defaultValue = "1") Long parentId
    ) {
        List<RegionParentVo> list = regionService.findAllWithTree(maxLevel, parentId, isLazy);

        return R.ok().push("list", list);
    }

    /**
     * 获取父级路径
     */
    @GetMapping("/region/path")
    public R path(
        @RequestParam Long id,
        @RequestParam(defaultValue = "true") Boolean excludeSelf
    ) {
        List<String> cascadeData = regionService.getParentPath(id, excludeSelf);

        return R.ok().push("cascadeData", cascadeData);
    }

}
