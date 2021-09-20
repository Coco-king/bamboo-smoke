package io.renren.modules.blog.vo;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author codecrab
 * @since 2021年09月20日 下午 05:39
 */
@Data
public class MemberSearchVo {

    private String id;

    private String key;

    private String gender;

    private String status;

    private LocalDateTime createBeginTime;

    private LocalDateTime createEndTime;
}

