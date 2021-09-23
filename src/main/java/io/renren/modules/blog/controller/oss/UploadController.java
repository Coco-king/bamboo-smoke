package io.renren.modules.blog.controller.oss;

import cn.hutool.core.collection.CollectionUtil;
import io.renren.common.exception.ErrorConstant;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.modules.blog.service.UploadService;
import io.renren.modules.blog.vo.EditorUploadVo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping("/api/oss/upload/{type}")
    public EditorUploadVo upload(@PathVariable String type, MultipartFile file) {
        return EditorUploadVo.ok(new EditorUploadVo.DataDTO("https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg", "描述", "https://www.baidu.com"));
    }

    @DeleteMapping("/api/oss/remove")
    public R remove(@RequestBody Map<String, List<String>> params) {
        List<String> urls = params.get("urls");
        Assert.isTrue(CollectionUtil.isNotEmpty(urls), ErrorConstant.OSS_REMOVE_FILE_URL_NULL);

        uploadService.removeFile(urls);
        return R.ok();
    }

}
