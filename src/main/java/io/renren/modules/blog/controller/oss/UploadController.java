package io.renren.modules.blog.controller.oss;

import cn.hutool.core.collection.CollectionUtil;
import io.renren.common.exception.ErrorConstant;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.modules.blog.service.UploadService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author wanggang
 * @since 2021年09月03日 下午 5:52
 */
@RestController
public class UploadController {

    @Resource
    private UploadService uploadService;

    @GetMapping("/api/oss/policy")
    public R policy(@RequestParam(defaultValue = "default") String type) {
        Map<String, String> policy = uploadService.createPolicy(type);
        return R.ok().push("data", policy);
    }

    @GetMapping("/api/oss/upload/{type}")
    public R upload(@PathVariable String type) {
        return R.ok().push("data", type);
    }

    @DeleteMapping("/api/oss/remove")
    public R remove(@RequestBody Map<String, List<String>> params) {
        List<String> urls = params.get("urls");
        Assert.isTrue(CollectionUtil.isNotEmpty(urls), ErrorConstant.OSS_REMOVE_FILE_URL_NULL);

        uploadService.removeFile(urls);
        return R.ok();
    }

}
