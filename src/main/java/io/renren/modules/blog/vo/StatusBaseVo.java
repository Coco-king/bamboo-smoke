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
public class StatusBaseVo {

    @NotEmpty(message = "需要操作的对象ID不能为空")
    private List<Long> ids;

    @NotNull(message = "必须输入将要修改的状态")
    private Integer status;

}
