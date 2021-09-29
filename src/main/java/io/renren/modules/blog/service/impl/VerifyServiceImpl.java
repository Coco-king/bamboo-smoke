package io.renren.modules.blog.service.impl;

import com.google.code.kaptcha.Producer;
import io.renren.common.utils.RedisUtils;
import io.renren.common.validator.Assert;
import io.renren.modules.blog.service.VerifyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.awt.image.BufferedImage;

/**
 * @author codecrab
 * @since 2021年09月26日 下午 3:04
 */
@Service("verifyService")
public class VerifyServiceImpl implements VerifyService {

    @Resource
    private Producer producer;

    @Resource
    private RedisUtils redisUtils;

    @Override
    public BufferedImage getCaptcha(String uuid) {
        Assert.isNotBlank(uuid, "uuid不能为空");

        //生成文字验证码
        String text = producer.createText();
        //存入Redis中，5分钟过期时间
        redisUtils.set(uuid, text, 5 * 60);
        //生成图片验证码
        return producer.createImage(text);
    }

    @Override
    public boolean validate(String uuid, String captcha) {
        Object code = redisUtils.get(uuid);
        return code != null && captcha.equalsIgnoreCase(code.toString());
    }

}
