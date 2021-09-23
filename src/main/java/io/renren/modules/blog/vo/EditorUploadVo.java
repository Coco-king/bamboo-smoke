package io.renren.modules.blog.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author codecrab
 * @since 2021年09月23日 下午 2:34
 */
@Data
@Accessors(chain = true)
public class EditorUploadVo {

    /** errno 即错误代码，0 表示没有错误，如果有错误，errno != 0 */
    private Integer errno;

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<DataDTO> data = new ArrayList<>();

    public static EditorUploadVo ok(DataDTO... dataDTOS) {
        EditorUploadVo vo = new EditorUploadVo();
        vo.getData().addAll(Arrays.asList(dataDTOS));
        return vo.setErrno(0);
    }

    public EditorUploadVo data(DataDTO... dataDTOS) {
        this.getData().addAll(Arrays.asList(dataDTOS));
        return this;
    }

    public static EditorUploadVo error() {
        return new EditorUploadVo().setErrno(99999);
    }

    public static EditorUploadVo error(Integer errno) {
        return new EditorUploadVo().setErrno(errno);
    }

    @Data
    @Accessors(chain = true)
    public static class DataDTO {

        public DataDTO(String url, String alt, String href) {
            this.url = url;
            this.alt = alt;
            this.href = href;
        }

        /** 图片地址 */
        private String url;

        /** 图片文字说明 */
        private String alt;

        /** 跳转链接 */
        private String href;

    }
}
