package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 用户与第三方账户绑定表
 *
 * @author codecrab
 * @since 2021-09-03 15:32:37
 */
@Data
@TableName("m_user_social")
public class UserSocialEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 用户ID */
    private Long userId;

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
    private Long expiresIn;

    /** 绑定状态 */
    private Integer status;

    /** 创建日期 */
    private LocalDateTime createTime;

    /** 修改日期 */
    private LocalDateTime updateTime;

}
