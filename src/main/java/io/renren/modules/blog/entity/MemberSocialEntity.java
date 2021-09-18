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
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_member_social")
public class MemberSocialEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long memberId;

    /** 社交用户id */
    private String socialUid;

    /** 社交平台名称 */
    private String socialName;

    /** 社交平台类型 */
    private String socialType;

    /** 用户此次登录的Access Token */
    private String accessToken;

    /** 针对QQ，在授权自动续期步骤中，获取新的Access_Token时需要提供的参数 */
    private String refreshToken;

    /** Access Token过期时间 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long expiresIn;

    /** 绑定状态 */
    private Integer status;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
