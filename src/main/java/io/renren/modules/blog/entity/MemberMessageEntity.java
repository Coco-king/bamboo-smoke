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
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_member_message")
public class MemberMessageEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 发送消息的用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long fromMemberId;

    /** 接收消息的用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long toMemberId;

    /** 消息可能关联的帖子 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleId;

    /** 消息可能关联的评论 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long commentId;

    /** 消息内容 */
    private String content;

    /** 消息类型（0：系统消息，1：回复文章，2：回复评论） */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer type;

    /** 消息状态（0：未读，1：已读） */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer status;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
