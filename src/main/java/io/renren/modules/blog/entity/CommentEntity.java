package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

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
    private Long id;

    /** 评论的内容 */
    private String content;

    /** 回复的评论ID */
    private Long parentId;

    /** 评论的内容ID */
    private Long articleId;

    /** 评论的用户ID */
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

    /** 创建时间 */
    private LocalDateTime createTime;

    /** 更新时间 */
    private LocalDateTime updateTime;

}
