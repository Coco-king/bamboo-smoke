package io.renren.config;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import io.renren.common.utils.ConfigConstant;
import io.renren.modules.oss.cloud.CloudStorageConfig;
import io.renren.modules.sys.service.SysConfigService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author codecrab
 * @since 2021年09月19日 下午 01:34
 */
@Configuration
public class OSSConfig {

    @Bean(destroyMethod = "shutdown")
    public OSS ossClient(SysConfigService sysConfigService) {
        CloudStorageConfig cloudConfig = sysConfigService.getConfigObject(ConfigConstant.CLOUD_STORAGE_CONFIG_KEY, CloudStorageConfig.class);

        // 创建OSSClient实例。
        return new OSSClientBuilder().build(
            cloudConfig.getAliyunEndPoint(),
            cloudConfig.getAliyunAccessKeyId(),
            cloudConfig.getAliyunAccessKeySecret()
        );
    }

}
