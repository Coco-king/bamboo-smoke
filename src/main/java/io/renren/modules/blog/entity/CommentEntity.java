package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 用户评论表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_comment")
public class CommentEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 评论的内容 */
    private String content;

    /** 回复的评论ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long parentId;

    /** 评论的内容ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleId;

    /** 评论的用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long memberId;

    /** 用户认证标识 */
    private String memberAuthName;

    /** “顶”的数量 */
    private Integer voteUp;

    /** “踩”的数量 */
    private Integer voteDown;

    /** 置顶等级 */
    private Integer level;

    /** 评论的状态 */
    private Integer status;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
