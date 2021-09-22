package io.renren.modules.blog.vo.search;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author codecrab
 * @since 2021年09月20日 下午 05:39
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberSearchVo extends SearchBaseVo {

    private String gender;

    private String status;

    private LocalDateTime createBeginTime;

    private LocalDateTime createEndTime;

}

