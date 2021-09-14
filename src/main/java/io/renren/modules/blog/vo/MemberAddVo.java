package io.renren.modules.blog.vo;

import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 * @author wanggang
 * @since 2021年09月13日 上午 9:39
 */
@Data
@NoArgsConstructor
public class MemberAddVo {

    @Null(message = "用户ID必须为空", groups = AddGroup.class)
    @NotNull(message = "用户ID不能为空", groups = UpdateGroup.class)
    private Long id;

    @NotNull(message = "用户名不能为空", groups = AddGroup.class)
    private String memberName;

    @NotNull(message = "密码不能为空", groups = AddGroup.class)
    private String password;

    @NotNull(message = "确认密码不能为空", groups = AddGroup.class)
    private String rePass;

    private String authName;

    private String email;

    private String mobile;

    private String city;

    private String point;

    private String sign;

    private String gender;

    private String wechat;

    private String vipLevel;

    private String birthday;

    private String avatar;

    private String status;
}
