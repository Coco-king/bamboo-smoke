package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.vo.RegionParentVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@Mapper
public interface RegionMapper extends BaseMapper<RegionEntity> {

    void deleteAll();

    List<RegionParentVo> selectRegionParentList(@Param(Constants.WRAPPER) Wrapper<RegionEntity> wrapper);
}
