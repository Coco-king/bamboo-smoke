package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * 中国各区域信息
 *
 * @author codecrab
 * @since 2021-09-14 13:50:23
 */
@Data
@TableName("bs_region")
public class RegionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 地区信息主键 */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 该地区的上级区域 */
    @NotNull(message = "上级区域不能为空")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long parentId;

    /** 地区名称 */
    @NotBlank(message = "区域名称不能为空")
    private String name;

    /** 地区对应值 */
    @NotBlank(message = "地区对应值不能为空")
    private String value;

    /** 区域层级 */
    private Integer level;

    /** 逻辑删除（0：未删除，1：已删除） */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Boolean deleted;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RegionEntity that = (RegionEntity) o;
        return Objects.equals(value, that.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value);
    }
}
