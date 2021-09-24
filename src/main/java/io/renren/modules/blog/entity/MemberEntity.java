package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import lombok.Data;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 19:29:43
 */
@Data
@TableName("bs_member")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MemberEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    @JsonSerialize(using = ToStringSerializer.class)
    @Null(message = "用户ID必须为空", groups = AddGroup.class)
    @NotNull(message = "用户ID不能为空", groups = UpdateGroup.class)
    private Long id;

    /** 用户名 */
    @NotBlank(message = "用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String memberName;

    /** 密码 */
    @NotBlank(message = "密码不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String password;

    /** 确认密码 */
    @TableField(exist = false)
    @NotBlank(message = "确认密码不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String rePass;

    /** 盐 */
    private String salt;

    /** 社区认证 */
    private String authName;

    /** 邮箱 */
    @NotBlank(message = "邮箱不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Email(message = "邮箱格式不合法", groups = {AddGroup.class, UpdateGroup.class})
    private String email;

    /** 手机号码 */
    @NotBlank(message = "手机号码不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String mobile;

    /** 所在城市 */
    private String city;

    /** 积分 */
    @JsonSerialize(using = ToStringSerializer.class)
    @NotNull(message = "积分不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private Integer point;

    /** 个性签名 */
    private String sign;

    /** 性别 */
    @NotBlank(message = "性别不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private String gender;

    /** 微信号 */
    private String wechat;

    /** vip等级 */
    @JsonSerialize(using = ToStringSerializer.class)
    @NotNull(message = "vip等级不能为空", groups = {AddGroup.class, UpdateGroup.class})
    private Integer vipLevel;

    /** 生日 */
    private LocalDate birthday;

    /** 头像 */
    @NotBlank(message = "头像不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @URL(message = "头像不是一个合法的URL地址", groups = {AddGroup.class, UpdateGroup.class})
    private String avatar;

    /** 内容数量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer articleCount;

    /** 评论数量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer commentCount;

    /** 状态（0：未激活邮箱，1：正常，-1：已封禁，-10：已注销账户） */
    @JsonSerialize(using = ToStringSerializer.class)
    @NotNull(message = "状态不能为空", groups = {AddGroup.class, UpdateGroup.class})
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
