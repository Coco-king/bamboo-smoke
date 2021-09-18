package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_member")
public class MemberEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    @Null(message = "用户ID必须为空", groups = AddGroup.class)
    @NotNull(message = "用户ID不能为空", groups = UpdateGroup.class)
    private Long id;

    /** 用户名 */
    @NotNull(message = "用户名不能为空", groups = AddGroup.class)
    private String memberName;

    /** 密码 */
    @JsonIgnore
    @NotNull(message = "密码不能为空", groups = AddGroup.class)
    private String password;

    /** 确认密码 */
    @JsonIgnore
    @TableField(exist = false)
    @NotNull(message = "确认密码不能为空", groups = AddGroup.class)
    private String rePass;

    /** 盐 */
    private String salt;

    /** 社区认证 */
    private String authName;

    /** 邮箱 */
    private String email;

    /** 手机电话 */
    private String mobile;

    /** 所在城市 */
    private String city;

    /** 积分 */
    private Integer point;

    /** 个性签名 */
    private String sign;

    /** 性别 */
    private String gender;

    /** 微信号 */
    private String wechat;

    /** vip等级 */
    private Integer vipLevel;

    /** 生日 */
    private LocalDateTime birthday;

    /** 头像 */
    private String avatar;

    /** 内容数量 */
    private Integer articleCount;

    /** 评论数量 */
    private Integer commentCount;

    /** 状态（0：未激活邮箱，1：正常，-1：已封禁） */
    private Integer status;

    /** 激活邮件地址 */
    private String code;

    /** 最后的登陆时间 */
    private LocalDateTime lastLoginTime;

    /** 逻辑删除（0：未删除，1：已注销账户） */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Boolean deleted;

    /** 创建日期 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修改日期 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
