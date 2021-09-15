package io.renren.common.shiro;

/**
 * 登录类型
 */
public enum LoginTypeEnum {
    //普通用户登录，管理员登录
    USER("User"), ADMIN("Admin");

    private final String type;

    LoginTypeEnum(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type;
    }
}
