package io.renren.modules.blog.controller.api;

import io.renren.common.utils.R;
import io.renren.modules.blog.service.UploadService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author wanggang
 * @since 2021年09月03日 下午 5:52
 */
@RestController
public class UploadController {

    @Resource
    private UploadService uploadService;

    @GetMapping("/api/upload/policy")
    public R upload(@RequestParam(defaultValue = "default") String type) {
        Map<String, String> policy = uploadService.createPolicy(type);
        return R.ok().push("data", policy);
    }

}
