package io.renren.modules.blog.api.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wanggang
 * @since 2021年09月03日 下午 5:52
 */
@RestController
public class UploadController {

    @PostMapping("/api/upload/{type}")
    public String upload(@PathVariable String type) {

        return "url";
    }

}
