package io.renren.modules.blog.form;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author codecrab
 * @since 2021年09月26日 下午 5:12
 */
@Data
public class MemberLoginForm {

    @NotBlank(message = "用户名/邮箱/手机号不能为空")
    private String loginName;

    @NotBlank(message = "密码不能为空")
    private String password;

    @NotBlank(message = "验证码不能为空")
    private String captcha;

    private String uuid;

}
