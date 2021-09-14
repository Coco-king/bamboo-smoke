package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

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
    private Long id;

    /** 该地区的上级区域 */
    private Long parentId;

    /** 地区名称 */
    private String name;

    /** 地区对应值 */
    private String value;

    /** 区域层级 */
    private Integer level;

    /** 逻辑删除（0：未删除，1：已删除） */
    @TableLogic
    @TableField("is_deleted")
    private Boolean deleted;

    /** 创建日期 */
    private LocalDateTime createTime;

    /** 最后修改日期 */
    private LocalDateTime updateTime;

}
