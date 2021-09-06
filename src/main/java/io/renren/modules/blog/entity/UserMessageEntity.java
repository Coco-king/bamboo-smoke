package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 消息表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Data
@TableName("m_user_message")
public class UserMessageEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 发送消息的用户ID */
    private Long fromUserId;

    /** 接收消息的用户ID */
    private Long toUserId;

    /** 消息可能关联的帖子 */
    private Long postId;

    /** 消息可能关联的评论 */
    private Long commentId;

    /** 消息内容 */
    private String content;

    /** 消息类型（0：系统消息，1：回复文章，2：回复评论） */
    private Integer type;

    /** 消息状态（0：未读，1：已读） */
    private Integer status;

    /** 创建时间 */
    private LocalDateTime createTime;

    /** 修改时间 */
    private LocalDateTime updateTime;

}
