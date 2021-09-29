package io.renren.modules.blog.controller.api;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.google.common.collect.Maps;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.blog.dto.AccountProfileDto;
import io.renren.modules.blog.entity.MemberEntity;
import io.renren.modules.blog.form.MemberLoginForm;
import io.renren.modules.blog.service.MemberService;
import io.renren.modules.blog.service.VerifyService;
import io.renren.modules.blog.utils.ThreadLocalUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

/**
 * @author codecrab
 * @since 2021年09月26日 下午 1:31
 */
@RestController
@RequestMapping("api/verify")
public class VerifyController {

    @Resource
    private VerifyService verifyService;

    @Resource
    private MemberService memberService;

    @Resource
    private JwtUtils jwtUtils;

    @GetMapping("/captcha.jpg")
    public void captcha(HttpServletResponse response, String uuid) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        //获取图片验证码
        BufferedImage image = verifyService.getCaptcha(uuid);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }

    @PostMapping("/login")
    public R login(@RequestBody MemberLoginForm form) {
        ValidatorUtils.validateEntity(form);

        boolean captcha = verifyService.validate(form.getUuid(), form.getCaptcha());
        Assert.isTrue(captcha, "验证码不正确");

        MemberEntity member = memberService.getUserByLoginName(form.getLoginName());

        //账号不存在、密码错误
        Assert.isTrue(member != null && member.getPassword().equals(BCrypt.hashpw(form.getPassword(), member.getSalt())), "账号或密码不正确");
        //账号被封禁
        Assert.isFalse(member.getStatus() == -1, "账号已被封禁");
        //账号已注销
        Assert.isFalse(member.getStatus() == -10, "账号已注销");

        //创建jwt载荷信息
        Map<String, Object> claims = Maps.newHashMapWithExpectedSize(1);
        claims.put(JwtUtils.MEMBER_CLAIM, BeanUtil.copyProperties(member, AccountProfileDto.class));

        //生成token返回页面
        String token = jwtUtils.generateToken(member.getId(), claims);
        return R.ok().push("jwtToken", token);
    }

    @PostMapping("/registry")
    public R registry(@RequestBody MemberLoginForm form) {
        return R.ok();
    }

    @PostMapping("/logout")
    public R logout() {
        ThreadLocalUtils.remove();
        return R.ok();
    }

}
