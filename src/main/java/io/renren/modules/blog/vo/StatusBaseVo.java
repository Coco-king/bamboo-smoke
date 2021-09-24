package io.renren.modules.blog.vo;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author codecrab
 * @since 2021年09月23日 下午 4:43
 */
@Data
public class ArticleExamineVo {

    @NotEmpty(message = "需要审核的文章不能为空")
    private List<Long> ids;

    @NotNull(message = "必须选择是否审核通过")
    private Integer status;

}
