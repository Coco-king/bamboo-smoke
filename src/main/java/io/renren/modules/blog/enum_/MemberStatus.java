package io.renren.modules.blog.enum_;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author codecrab
 * @since 2021年09月24日 下午 2:36
 */
@Getter
@AllArgsConstructor
public enum MemberStatus {

    NOT_ACTIVE(0, "未激活"),
    NORMAL(1, "正常"),
    BANNED(-1, "封禁"),
    LOGGED_OFF(-10, "已注销");

    private final Integer code;

    private final String desc;
}
