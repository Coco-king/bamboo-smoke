package io.renren.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.blog.entity.MemberCollectionEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Mapper
public interface MemberCollectionMapper extends BaseMapper<MemberCollectionEntity> {

}
