package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 用户表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Data
@TableName("bs_member")
public class MemberEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 昵称 */
    private String memberName;

    /** 密码 */
    private String password;

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
    private Integer isDeleted;

    /** 创建日期 */
    private LocalDateTime createTime;

    /** 修改时间 */
    private LocalDateTime updateTime;

}
