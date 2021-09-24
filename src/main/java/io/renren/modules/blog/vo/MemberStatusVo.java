package io.renren.modules.blog.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * @author codecrab
 * @since 2021年09月24日 上午 9:25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberStatusVo extends StatusBaseVo {

    @NotNull(message = "必须指定是否是激活类型")
    private Boolean isActive;

    @NotNull(message = "必须指定是否是恢复正常类型")
    private Boolean isRecovery;

}
