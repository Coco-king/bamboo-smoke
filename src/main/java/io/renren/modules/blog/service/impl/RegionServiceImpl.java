package io.renren.modules.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.blog.mapper.RegionMapper;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.service.RegionService;

import java.util.Map;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@Service("regionService")
public class RegionServiceImpl extends ServiceImpl<RegionMapper, RegionEntity> implements RegionService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RegionEntity> page = this.page(
            new Query<RegionEntity>().getPage(params),
            new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

}
