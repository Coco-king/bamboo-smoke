package io.renren.common.exception;

/**
 * @author codecrab
 * @since 2021年09月18日 下午 4:13
 */
public class ErrorConstant {
    public static final String REGION_MAX_LEVEL_OVERFLOW = "区域列表最大层级为4级，精确到（区/县），请检查上级区域是否正确";
    public static final String REGION_PARENT_NOT_EQUAL_SELF = "区域的上级区域不能是自己";
    public static final String REGION_NOT_FOUND = "未找到待修改节点的信息";
    public static final String REGION_FOUND_MUST_UNIQUE = "查询到待修改节点有多个";
    public static final String REGION_PARENT_NOT_FOUND = "未找到待修改节点的父节点信息";
    public static final String REGION_UPDATE_UNIQUE_ERROR = "更新失败，数据库中唯一索引限制，同一个父级区域下不能有名字相同的区域";
    public static final String REGION_PARENT_WITH_SAME_NAME = "同一个父级区域下不能有名字相同的区域";
    public static final String REGION_VALUE_MUST_UNIQUE = "地区对应值重复请更换后重试";

    public static final String OSS_REMOVE_FILE_URL_NULL = "删除的图片路径不能为空";

    public static final String MEMBER_PASS_MUST_EQUAL_REPASS = "两次输入密码不一致";
    public static final String MEMBER_WITH_SAME_MEMBER_NAME = "用户名已存在，请换一个重试";
    public static final String MEMBER_WITH_SAME_EMAIL = "该邮箱已被使用，请换一个重试";
    public static final String MEMBER_WITH_SAME_MOBILE = "该手机号已被使用，请换一个重试";
    public static final String MEMBER_WILL_UPDATE_IS_NULL = "待更新会员信息未找到";
}
