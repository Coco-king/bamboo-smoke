package io.renren.modules.blog.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author codecrab
 * @since 2021年09月22日 下午 1:54
 */
@Data
public class ArticleVo {

    /** 主键ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    /** 标题 */
    private String title;

    /** 封面 */
    private String coverImage;

    /** 编辑模式：html可视化，markdown .. */
    private String editMode;

    /** 文章所属分类ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long categoryId;

    /** 文章所属分类名称 */
    private String categoryName;

    /** 用户ID */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long memberId;

    /** 会员名 */
    private String memberName;

    private String content;

    /** 用户认证标识 */
    private String memberAuthName;

    /** 点赞人数 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer voteUp;

    /** 点踩人数 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer voteDown;

    /** 访问量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer viewCount;

    /** 评论数量 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer commentCount;

    /** 是否为精华 */
    private Boolean recommend;

    /** 置顶等级 */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer level;

    /** 状态（0：审核未通过 1：审核通过） */
    @JsonSerialize(using = ToStringSerializer.class)
    private Integer status;

    /** 创建日期 */
    private LocalDateTime createTime;

}
