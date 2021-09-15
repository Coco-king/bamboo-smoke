package io.renren.modules.blog.vo;

import io.renren.modules.blog.entity.RegionEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wanggang
 * @since 2021年09月15日 下午 1:45
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class RegionParentVo extends RegionEntity {

    private List<RegionParentVo> children = new ArrayList<>();

    private String parentName;

}
