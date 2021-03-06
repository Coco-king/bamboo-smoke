package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.vo.RegionParentVo;

import java.util.List;
import java.util.Map;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
public interface RegionService extends IService<RegionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void initRegion();

    List<RegionParentVo> findAllWithTree(Integer maxLevel, Long rootId, Boolean isLazy);

    List<String> getParentPath(Long id, Boolean excludeSelf);

    R checkAndUpdate(RegionEntity region);

    R removeWithChildrenById(Long id);

    R saveRegion(RegionEntity region);
}

