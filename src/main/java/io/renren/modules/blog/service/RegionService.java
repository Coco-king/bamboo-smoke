package io.renren.modules.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.vo.RegionParentVo;

import java.util.List;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
public interface RegionService extends IService<RegionEntity> {

    List<RegionEntity> findAll();

    void initRegion();

    List<RegionParentVo> findAllWithTree();
}

