package io.renren.modules.blog.service;

import java.awt.image.BufferedImage;

/**
 * @author codecrab
 * @since 2021年09月26日 下午 3:04
 */
public interface VerifyService {

    BufferedImage getCaptcha(String uuid);

    boolean validate(String uuid, String captcha);
}
