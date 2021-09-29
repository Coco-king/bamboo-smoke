package io.renren.modules.blog.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

/**
 * @author codecrab
 * @since 2021年09月26日 下午 6:04
 */
@Data
public class AccountProfileDto {

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private String memberName;

    private String email;

    private String avatar;

    private String authName;

    private String mobile;
}
