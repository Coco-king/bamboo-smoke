package io.renren.modules.blog.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author codecrab
 * @since 2021年09月24日 上午 9:25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberStatusVo extends StatusBaseVo {

    private Boolean isActive;

    private Boolean isRecovery;

}
