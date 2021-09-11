package io.renren.modules.blog.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * 文章表
 *
 * @author codecrab
 * @since 2021-09-11 18:59:37
 */
@Data
@TableName("bs_article")
public class ArticleEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId
    private Long id;

    /** 标题 */
    private String title;

    /** 标题 */
    private String coverImage;

    /** 内容 */
    private String content;

    /** 编辑模式：html可视化，markdown .. */
    private String editMode;

    /** 文章所属分类ID */
    private Long categoryId;

    /** 用户ID */
    private Long memberId;

    /** 用户认证标识 */
    private String memberAuthName;

    /** 点赞人数 */
    private Integer voteUp;

    /** 点踩人数 */
    private Integer voteDown;

    /** 访问量 */
    private Integer viewCount;

    /** 评论数量 */
    private Integer commentCount;

    /** 是否为精华 */
    private Integer recommend;

    /** 置顶等级 */
    private Integer level;

    /** 状态（0：审核未通过 1：审核通过） */
    private Integer status;

    /** 逻辑删除（0：未删除，1：已删除） */
    private Integer isDeleted;

    /** 创建日期 */
    private LocalDateTime createTime;

    /** 最后更新日期 */
    private LocalDateTime updateTime;

}
