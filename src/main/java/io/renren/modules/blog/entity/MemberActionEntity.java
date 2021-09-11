package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 用户动作表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Data
@TableName("bs_member_action")
public class MemberActionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 用户ID */
    private String memberId;

    /** 动作类型 */
    private String action;

    /** 得分 */
    private Integer point;

    /** 关联的帖子ID */
    private String articleId;

    /** 关联的评论ID */
    private String commentId;

    /** 状态 */
    private Integer status;

    /** 创建时间 */
    private LocalDateTime createTime;

    /** 修改时间 */
    private LocalDateTime updateTime;

}
