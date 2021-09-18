package io.renren.modules.blog.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
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

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<RegionParentVo> children = new ArrayList<>();

    private Boolean hasChildren = false;

}
