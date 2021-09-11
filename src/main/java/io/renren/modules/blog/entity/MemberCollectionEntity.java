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
 * @since 2021-09-11 18:59:37
 */
@Data
@TableName("bs_member_collection")
public class MemberCollectionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 用户ID */
    private Long memberId;

    /** 文章ID */
    private Long articleId;

    /** 文章所属的用户ID */
    private Long articleMemberId;

    /** 消息状态 */
    private Integer status;

    /** 创建时间 */
    private LocalDateTime createTime;

    /** 修改时间 */
    private LocalDateTime updateTime;

}
