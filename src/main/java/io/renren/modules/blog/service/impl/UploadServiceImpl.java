package io.renren.modules.blog.service.impl;

import cn.hutool.core.util.StrUtil;
import com.aliyun.oss.OSS;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;
import com.google.common.collect.Maps;
import io.renren.common.utils.ConfigConstant;
import io.renren.modules.blog.service.UploadService;
import io.renren.modules.oss.cloud.CloudStorageConfig;
import io.renren.modules.sys.service.SysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author wanggang
 * @since 2021年09月10日 上午 10:38
 */
@Slf4j
@Service("uploadService")
public class UploadServiceImpl implements UploadService {

    @Resource
    private SysConfigService sysConfigService;

    @Resource
    private OSS ossClient;

    @Override
    public Map<String, String> createPolicy(String type) {
        CloudStorageConfig cloudConfig = sysConfigService.getConfigObject(ConfigConstant.CLOUD_STORAGE_CONFIG_KEY, CloudStorageConfig.class);

        String host = "https://" + cloudConfig.getAliyunBucketName() + "." + cloudConfig.getAliyunEndPoint();
        // callbackUrl为 上传回调服务器的URL，请将下面的IP和Port配置为您自己的真实信息。
        //String callbackUrl = "http://88.88.88.88:8888";
        String dir = type + new SimpleDateFormat("/yyyy/MM/").format(new Date());

        Map<String, String> respMap = Maps.newLinkedHashMapWithExpectedSize(6);
        try {
            long expireTime = 30;
            long expireEndTime = System.currentTimeMillis() + expireTime * 1000;
            Date expiration = new Date(expireEndTime);
            // PostObject请求最大可支持的文件大小为5 GB，即CONTENT_LENGTH_RANGE为5*1024*1024*1024。
            PolicyConditions policyCons = new PolicyConditions();
            policyCons.addConditionItem(PolicyConditions.COND_CONTENT_LENGTH_RANGE, 0, 1048576000);
            policyCons.addConditionItem(MatchMode.StartWith, PolicyConditions.COND_KEY, dir);

            String postPolicy = ossClient.generatePostPolicy(expiration, policyCons);
            byte[] binaryData = postPolicy.getBytes(StandardCharsets.UTF_8);
            String encodedPolicy = BinaryUtil.toBase64String(binaryData);
            String postSignature = ossClient.calculatePostSignature(postPolicy);
            respMap.put("accessId", cloudConfig.getAliyunAccessKeyId());
            respMap.put("policy", encodedPolicy);
            respMap.put("signature", postSignature);
            respMap.put("dir", dir);
            respMap.put("host", host);
            respMap.put("expire", String.valueOf(expireEndTime / 1000));
            // respMap.put("expire", formatISO8601Date(expiration));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return respMap;
    }

    @Override
    public void removeFile(List<String> urls) {
        CloudStorageConfig cloudConfig = sysConfigService.getConfigObject(ConfigConstant.CLOUD_STORAGE_CONFIG_KEY, CloudStorageConfig.class);

        try {
            // 需要截断的：https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com/
            String host = StrUtil.format("https://{}.{}/", cloudConfig.getAliyunBucketName(), cloudConfig.getAliyunEndPoint());
            urls.forEach(url -> {
                if (StrUtil.isNotBlank(url)) {
                    // 需要的：avatar/2021/04/26/8b40dde3d8ea4a2e8303fa3b279b8daa.jpg
                    String objectName = url.substring(host.length());

                    ossClient.deleteObject(cloudConfig.getAliyunBucketName(), objectName);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
