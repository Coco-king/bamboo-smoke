package io.renren;

import cn.hutool.core.io.FileUtil;
import cn.hutool.json.JSONUtil;
import com.google.common.collect.Maps;
import io.renren.modules.blog.entity.RegionEntity;
import io.renren.modules.blog.service.RegionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author wanggang
 * @since 2021年09月16日 上午 10:35
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class RegionTest {

    @Resource
    private RegionService regionService;

    @Test
    public void buildRegionData() throws IOException {
        List<Map<String, String>> maps = regionService.list().stream()
            .sorted(Comparator.comparing(RegionEntity::getLevel))
            .map(region -> {
                Map<String, String> map = Maps.newLinkedHashMapWithExpectedSize(3);
                map.put("name", region.getName());
                map.put("value", region.getValue());
                map.put("parentId", region.getParentId() != null ? region.getParentId().toString() : null);
                return map;
            })
            .collect(Collectors.toList());

        String str = JSONUtil.parse(maps).toJSONString(2);

        BufferedOutputStream outputStream = FileUtil.getOutputStream("C:\\Users\\ex_wanggang1\\Documents\\wanggang\\bamboo-smoke\\src\\main\\resources\\static\\region-data-array.json");
        outputStream.write(str.getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
    }
}
