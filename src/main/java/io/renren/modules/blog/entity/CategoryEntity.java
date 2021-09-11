package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 文章分类表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Data
@TableName("bs_category")
public class CategoryEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 标题 */
    private String name;

    /** 内容描述 */
    private String content;

    /** 分类概要 */
    private String summary;

    /** 图标 */
    private String icon;

    /** 该分类的内容数量 */
    private Integer articleCount;

    /** 排序编码 */
    private Integer order;

    /** 父级分类的ID */
    private Long parentId;

    /** SEO关键字 */
    private String metaKeywords;

    /** SEO描述内容 */
    private String metaDescription;

    /** 分类状态 */
    private Integer status;

    /** 逻辑删除（0：未删除，1：已删除） */
    private Integer isDeleted;

    /** 创建日期 */
    private LocalDateTime createTime;

    /** 修改日期 */
    private LocalDateTime updateTime;

}
