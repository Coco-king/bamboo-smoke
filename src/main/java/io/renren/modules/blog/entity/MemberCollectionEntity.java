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
 * 用户收藏表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_member_collection")
public class MemberCollectionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long memberId;

    /** 文章ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleId;

    /** 文章所属的用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleMemberId;

    /** 消息状态 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer status;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
