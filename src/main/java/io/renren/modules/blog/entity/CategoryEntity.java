package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_category")
public class CategoryEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 标题 */
    private String name;

    /** 链接 */
    private String href;

    /** 内容描述 */
    private String content;

    /** 分类概要 */
    private String summary;

    /** 图标 */
    private String icon;

    /** 该分类的内容数量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer articleCount;

    /** 排序编码 */
    @TableField("`order`")
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer order;

    /** 父级分类的ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long parentId;

    /** SEO关键字 */
    private String metaKeywords;

    /** SEO描述内容 */
    private String metaDescription;

    /** 分类状态 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer status;

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

}
