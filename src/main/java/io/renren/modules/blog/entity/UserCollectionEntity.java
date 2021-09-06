package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Data
@TableName("m_user_collection")
public class UserCollectionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 文章ID */
    private Long postId;

    /** 文章所属的用户ID */
    private Long postUserId;

    /** 消息状态 */
    private Integer status;

    /** 创建时间 */
    private LocalDateTime createTime;

    /** 修改时间 */
    private LocalDateTime updateTime;

}
