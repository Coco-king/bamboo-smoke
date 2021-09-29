package io.renren.modules.blog.controller.api;

import io.renren.common.exception.ErrorConstant;
import io.renren.common.validator.Assert;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.blog.dto.AccountProfileDto;
import io.renren.modules.blog.utils.ThreadLocalUtils;

/**
 * @author codecrab
 * @since 2021年09月29日 下午 3:56
 */
public abstract class AbstractController {

    protected AccountProfileDto getMember() {
        Object cache = ThreadLocalUtils.getCache(JwtUtils.MEMBER_CLAIM);

        Assert.isNotNull(cache, ErrorConstant.VERIFY_TOKEN_EXPIRED);

        Assert.isTrue(cache instanceof AccountProfileDto, ErrorConstant.VERIFY_TOKEN_ERROR);

        return (AccountProfileDto) cache;
    }

    protected Long getMemberId() {
        return getMember().getId();
    }

}
