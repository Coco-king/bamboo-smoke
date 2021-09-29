package io.renren.modules.blog.controller.api;

import io.renren.common.utils.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author codecrab
 * @since 2021年09月29日 上午 11:13
 */
@RestController
@RequestMapping("api")
public class MemberController extends AbstractController {

    /**
     * 获取登录的用户信息
     */
    @GetMapping("/auth/member/info")
    public R info() {
        return R.ok().push("member", getMember());
    }

}
