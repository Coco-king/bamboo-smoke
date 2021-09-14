package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import io.renren.modules.blog.entity.RegionEntity;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@Mapper
public interface RegionMapper extends BaseMapper<RegionEntity> {

    void deleteAll();
}
