package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_article")
public class ArticleEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 标题 */
    private String title;

    /** 封面 */
    private String coverImage;

    /** 内容 */
    private String content;

    /** 编辑模式：html可视化，markdown .. */
    private String editMode;

    /** 文章所属分类ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long categoryId;

    /** 用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long memberId;

    /** 用户认证标识 */
    private String memberAuthName;

    /** 点赞人数 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer voteUp;

    /** 点踩人数 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer voteDown;

    /** 访问量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer viewCount;

    /** 评论数量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer commentCount;

    /** 是否为精华 */
    @TableField("is_recommend")
    private Boolean recommend;

    /** 置顶等级 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer level;

    /** 状态（0：审核未通过 1：审核通过） */
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
