package io.renren.modules.blog.vo.search;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author codecrab
 * @since 2021年09月23日 下午 5:24
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleSearchVo extends SearchBaseVo {

    private String categoryId;

    private String status;

}
