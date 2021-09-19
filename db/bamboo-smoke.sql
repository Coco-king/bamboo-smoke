/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : bamboo-smoke

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 19/09/2021 18:50:01
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_article
-- ----------------------------
DROP TABLE IF EXISTS `bs_article`;
CREATE TABLE `bs_article`
(
    `id`               bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `title`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `cover_image`      varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `content`          longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
    `edit_mode`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '0' COMMENT '编辑模式：html可视化，markdown ..',
    `category_id`      bigint NULL DEFAULT NULL COMMENT '文章所属分类ID',
    `member_id`        bigint NULL DEFAULT NULL COMMENT '用户ID',
    `member_auth_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户认证标识',
    `vote_up`          int UNSIGNED NOT NULL COMMENT '点赞人数',
    `vote_down`        int UNSIGNED NOT NULL COMMENT '点踩人数',
    `view_count`       int UNSIGNED NOT NULL COMMENT '访问量',
    `comment_count`    int                                                           NOT NULL DEFAULT 0 COMMENT '评论数量',
    `is_recommend`     tinyint(1) NULL DEFAULT NULL COMMENT '是否为精华',
    `level`            int                                                           NOT NULL DEFAULT 0 COMMENT '置顶等级',
    `status`           int NULL DEFAULT NULL COMMENT '状态（0：审核未通过 1：审核通过）',
    `is_deleted`       tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：未删除，1：已删除）',
    `create_time`      datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_time`      datetime NULL DEFAULT NULL COMMENT '最后更新日期',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_article
-- ----------------------------

-- ----------------------------
-- Table structure for bs_category
-- ----------------------------
DROP TABLE IF EXISTS `bs_category`;
CREATE TABLE `bs_category`
(
    `id`               bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`             varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `content`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容描述',
    `summary`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分类概要',
    `icon`             varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
    `article_count`    int UNSIGNED NULL DEFAULT NULL COMMENT '该分类的内容数量',
    `order`            int NULL DEFAULT NULL COMMENT '排序编码',
    `parent_id`        bigint UNSIGNED NULL DEFAULT NULL COMMENT '父级分类的ID',
    `meta_keywords`    varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SEO关键字',
    `meta_description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SEO描述内容',
    `status`           int NULL DEFAULT NULL COMMENT '分类状态',
    `is_deleted`       tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：未删除，1：已删除）',
    `create_time`      datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_time`      datetime NULL DEFAULT NULL COMMENT '修改日期',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_category
-- ----------------------------
INSERT INTO `bs_category`
VALUES (1, '提问', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');
INSERT INTO `bs_category`
VALUES (2, '分享', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');
INSERT INTO `bs_category`
VALUES (3, '讨论', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');
INSERT INTO `bs_category`
VALUES (4, '建议', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');
INSERT INTO `bs_category`
VALUES (5, '动态', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');
INSERT INTO `bs_category`
VALUES (6, '公告', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, '2021-09-03 15:16:50', '2021-09-03 15:16:50');

-- ----------------------------
-- Table structure for bs_comment
-- ----------------------------
DROP TABLE IF EXISTS `bs_comment`;
CREATE TABLE `bs_comment`
(
    `id`               bigint   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `content`          longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论的内容',
    `parent_id`        bigint NULL DEFAULT NULL COMMENT '回复的评论ID',
    `article_id`       bigint   NOT NULL COMMENT '评论的内容ID',
    `member_id`        bigint   NOT NULL COMMENT '评论的用户ID',
    `member_auth_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户认证标识',
    `vote_up`          int UNSIGNED NOT NULL COMMENT '“顶”的数量',
    `vote_down`        int UNSIGNED NOT NULL COMMENT '“踩”的数量',
    `level`            int UNSIGNED NOT NULL COMMENT '置顶等级',
    `status`           int NULL DEFAULT NULL COMMENT '评论的状态',
    `create_time`      datetime NOT NULL COMMENT '创建时间',
    `update_time`      datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bs_member
-- ----------------------------
DROP TABLE IF EXISTS `bs_member`;
CREATE TABLE `bs_member`
(
    `id`              bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `member_name`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '昵称',
    `password`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '密码',
    `salt`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
    `auth_name`       varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社区认证',
    `email`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机电话',
    `city`            varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '地球' COMMENT '所在城市',
    `point`           int UNSIGNED NOT NULL COMMENT '积分',
    `sign`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
    `gender`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
    `wechat`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
    `vip_level`       int NULL DEFAULT NULL COMMENT 'vip等级',
    `birthday`        date NULL DEFAULT NULL COMMENT '生日',
    `avatar`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
    `article_count`   int UNSIGNED NOT NULL COMMENT '内容数量',
    `comment_count`   int UNSIGNED NOT NULL COMMENT '评论数量',
    `status`          int                                                           NOT NULL DEFAULT 0 COMMENT '状态（0：未激活邮箱，1：正常，-1：已封禁）',
    `code`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '激活邮件地址',
    `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后的登陆时间',
    `is_deleted`      tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：未删除，1：已注销账户）',
    `create_time`     datetime                                                      NOT NULL COMMENT '创建日期',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `memberName`(`member_name`) USING BTREE,
    UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
    UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member
-- ----------------------------
INSERT INTO `bs_member`
VALUES (1, '竹隐寒烟', '$2a$10$uI5dazR3fvrw4yy1OuTHHOBR1fS33O4Bm.cnygm9E1Kcxz3jGwvz6', '$2a$10$uI5dazR3fvrw4yy1OuTHHO',
        '管理员', '3060550682@qq.com', '17710810624', '411024', 10000000, '我们在青春里遇见，写下纯白的誓言，在夏天来临之前。', '1', 'codecrab', 9,
        '2000-06-24',
        'https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com/avatar/2021/09/505a4825-10a5-4992-8b78-feeede87f47a_v2-7809cca37089b7c2623e8c7b54c2e18f_r.jpg',
        0, 0, 0, 'OW_RQB1wLLxhTdmnE4ytWBO6p2rSY6Rh', NULL, 0, '2021-09-19 15:10:02', '2021-09-19 18:06:09');
INSERT INTO `bs_member`
VALUES (2, 'codecrab', '$2a$10$uI5dazR3fvrw4yy1OuTHHOeFch8G3WViVWXm1PLGtQIIo5rAitQbG', '$2a$10$uI5dazR3fvrw4yy1OuTHHO',
        '测试', '3109309826@qq.com', '13522246024', '310115', 0, '哈哈哈', '0', '', 0, '2000-06-24',
        'https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com/avatar/2021/09/77efbbea-6904-41e6-8536-5677361a2ee3_头像 (2).jpg',
        0, 0, 0, '9GZOCKHHFw_zk2bEVQDMdQ_lvcVttGXX', NULL, 0, '2021-09-19 17:11:44', '2021-09-19 18:22:15');
INSERT INTO `bs_member`
VALUES (3, '北觅', '$2a$10$Ol4a/cKqhUeqNZRGOxD1uuPBW7AnOK2x.lAVCfaTTTTHBOMIupVNG', '$2a$10$Ol4a/cKqhUeqNZRGOxD1uu', '',
        '1753515721@qq.com', '17122840624', '411101', 0, '你好呀', '1', '', 0, '2000-06-24',
        'https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com/avatar/2021/09/efce50be-3360-4678-8dd6-924984e2eeca_QQ图片20200714005625.jpg',
        0, 0, 0, 'lPZvjl9GH59GIQ1aryIGKXxG9HxQSTHMzWGTFEAssC9hmRa_wlFHOfTdKqRfyxQi', NULL, 0, '2021-09-19 18:23:59',
        '2021-09-19 18:23:59');

-- ----------------------------
-- Table structure for bs_member_action
-- ----------------------------
DROP TABLE IF EXISTS `bs_member_action`;
CREATE TABLE `bs_member_action`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `member_id`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
    `action`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动作类型',
    `point`       int NULL DEFAULT NULL COMMENT '得分',
    `article_id`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的帖子ID',
    `comment_id`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的评论ID',
    `status`      int NULL DEFAULT NULL COMMENT '状态',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户动作表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member_action
-- ----------------------------

-- ----------------------------
-- Table structure for bs_member_collection
-- ----------------------------
DROP TABLE IF EXISTS `bs_member_collection`;
CREATE TABLE `bs_member_collection`
(
    `id`                bigint   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `member_id`         bigint   NOT NULL COMMENT '用户ID',
    `article_id`        bigint   NOT NULL COMMENT '文章ID',
    `article_member_id` bigint   NOT NULL COMMENT '文章所属的用户ID',
    `status`            int NULL DEFAULT NULL COMMENT '消息状态',
    `create_time`       datetime NOT NULL COMMENT '创建时间',
    `update_time`       datetime NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member_collection
-- ----------------------------

-- ----------------------------
-- Table structure for bs_member_message
-- ----------------------------
DROP TABLE IF EXISTS `bs_member_message`;
CREATE TABLE `bs_member_message`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `from_member_id` bigint   NOT NULL COMMENT '发送消息的用户ID',
    `to_member_id`   bigint   NOT NULL COMMENT '接收消息的用户ID',
    `article_id`     bigint NULL DEFAULT NULL COMMENT '消息可能关联的帖子',
    `comment_id`     bigint NULL DEFAULT NULL COMMENT '消息可能关联的评论',
    `content`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
    `type`           int NULL DEFAULT NULL COMMENT '消息类型（0：系统消息，1：回复文章，2：回复评论）',
    `status`         int NULL DEFAULT NULL COMMENT '消息状态（0：未读，1：已读）',
    `create_time`    datetime NOT NULL COMMENT '创建时间',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member_message
-- ----------------------------

-- ----------------------------
-- Table structure for bs_member_social
-- ----------------------------
DROP TABLE IF EXISTS `bs_member_social`;
CREATE TABLE `bs_member_social`
(
    `id`            bigint   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `member_id`     bigint   NOT NULL COMMENT '用户ID',
    `social_uid`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社交用户id',
    `social_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社交平台名称',
    `social_type`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社交平台类型',
    `access_token`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户此次登录的Access Token',
    `refresh_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '针对QQ，在授权自动续期步骤中，获取新的Access_Token时需要提供的参数',
    `expires_in`    bigint NULL DEFAULT NULL COMMENT 'Access Token过期时间',
    `status`        int NULL DEFAULT NULL COMMENT '绑定状态',
    `create_time`   datetime NOT NULL COMMENT '创建日期',
    `update_time`   datetime NULL DEFAULT NULL COMMENT '修改日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `member_id_with_social_name`(`member_id`, `social_name`) USING BTREE COMMENT '用户id相同情况下，社交平台不能一致'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与第三方账户绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member_social
-- ----------------------------

-- ----------------------------
-- Table structure for bs_region
-- ----------------------------
DROP TABLE IF EXISTS `bs_region`;
CREATE TABLE `bs_region`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT '地区信息主键',
    `parent_id`   bigint NULL DEFAULT NULL COMMENT '该地区的上级区域',
    `name`        varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区名称',
    `value`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区对应值',
    `level`       int    NOT NULL COMMENT '区域层级',
    `is_deleted`  tinyint NULL DEFAULT NULL COMMENT '逻辑删除（0：未删除，1：已删除）',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
    `update_time` datetime NULL DEFAULT NULL COMMENT '最后修改日期',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name_with_parent_id_indexes`(`parent_id`, `name`) USING BTREE COMMENT '同一个父级元素下的区域，name是唯一的'
) ENGINE = InnoDB AUTO_INCREMENT = 460400504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '中国各区域信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_region
-- ----------------------------
INSERT INTO `bs_region`
VALUES (1, 0, '中华人民共和国', '1', 0, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110000, 1, '北京市', '110000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110100, 110000, '市辖区', '110100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110101, 110100, '东城区', '110101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110102, 110100, '西城区', '110102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110105, 110100, '朝阳区', '110105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110106, 110100, '丰台区', '110106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110107, 110100, '石景山区', '110107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110108, 110100, '海淀区', '110108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110109, 110100, '门头沟区', '110109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110111, 110100, '房山区', '110111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110112, 110100, '通州区', '110112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110113, 110100, '顺义区', '110113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110114, 110100, '昌平区', '110114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110115, 110100, '大兴区', '110115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110116, 110100, '怀柔区', '110116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110117, 110100, '平谷区', '110117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110118, 110100, '密云区', '110118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (110119, 110100, '延庆区', '110119', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120000, 1, '天津市', '120000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120100, 120000, '市辖区', '120100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120101, 120100, '和平区', '120101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120102, 120100, '河东区', '120102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120103, 120100, '河西区', '120103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120104, 120100, '南开区', '120104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120105, 120100, '河北区', '120105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120106, 120100, '红桥区', '120106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120110, 120100, '东丽区', '120110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120111, 120100, '西青区', '120111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120112, 120100, '津南区', '120112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120113, 120100, '北辰区', '120113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120114, 120100, '武清区', '120114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120115, 120100, '宝坻区', '120115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120116, 120100, '滨海新区', '120116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120117, 120100, '宁河区', '120117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120118, 120100, '静海区', '120118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (120119, 120100, '蓟州区', '120119', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130000, 1, '河北省', '130000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130100, 130000, '石家庄市', '130100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130101, 130100, '市辖区', '130101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130102, 130100, '长安区', '130102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130104, 130100, '桥西区', '130104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130105, 130100, '新华区', '130105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130107, 130100, '井陉矿区', '130107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130108, 130100, '裕华区', '130108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130109, 130100, '藁城区', '130109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130110, 130100, '鹿泉区', '130110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130111, 130100, '栾城区', '130111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130121, 130100, '井陉县', '130121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130123, 130100, '正定县', '130123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130125, 130100, '行唐县', '130125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130126, 130100, '灵寿县', '130126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130127, 130100, '高邑县', '130127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130128, 130100, '深泽县', '130128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130129, 130100, '赞皇县', '130129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130130, 130100, '无极县', '130130', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130131, 130100, '平山县', '130131', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130132, 130100, '元氏县', '130132', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130133, 130100, '赵县', '130133', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130171, 130100, '石家庄高新技术产业开发区', '130171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130172, 130100, '石家庄循环化工园区', '130172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130181, 130100, '辛集市', '130181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130183, 130100, '晋州市', '130183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130184, 130100, '新乐市', '130184', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130200, 130000, '唐山市', '130200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130201, 130200, '市辖区', '130201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130202, 130200, '路南区', '130202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130203, 130200, '路北区', '130203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130204, 130200, '古冶区', '130204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130205, 130200, '开平区', '130205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130207, 130200, '丰南区', '130207', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130208, 130200, '丰润区', '130208', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130209, 130200, '曹妃甸区', '130209', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130224, 130200, '滦南县', '130224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130225, 130200, '乐亭县', '130225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130227, 130200, '迁西县', '130227', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130229, 130200, '玉田县', '130229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130271, 130200, '河北唐山芦台经济开发区', '130271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130272, 130200, '唐山市汉沽管理区', '130272', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130273, 130200, '唐山高新技术产业开发区', '130273', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130274, 130200, '河北唐山海港经济开发区', '130274', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130281, 130200, '遵化市', '130281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130283, 130200, '迁安市', '130283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130284, 130200, '滦州市', '130284', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130300, 130000, '秦皇岛市', '130300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130301, 130300, '市辖区', '130301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130302, 130300, '海港区', '130302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130303, 130300, '山海关区', '130303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130304, 130300, '北戴河区', '130304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130306, 130300, '抚宁区', '130306', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130321, 130300, '青龙满族自治县', '130321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130322, 130300, '昌黎县', '130322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130324, 130300, '卢龙县', '130324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130371, 130300, '秦皇岛市经济技术开发区', '130371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130372, 130300, '北戴河新区', '130372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130400, 130000, '邯郸市', '130400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130401, 130400, '市辖区', '130401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130402, 130400, '邯山区', '130402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130403, 130400, '丛台区', '130403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130404, 130400, '复兴区', '130404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130406, 130400, '峰峰矿区', '130406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130407, 130400, '肥乡区', '130407', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130408, 130400, '永年区', '130408', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130423, 130400, '临漳县', '130423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130424, 130400, '成安县', '130424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130425, 130400, '大名县', '130425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130426, 130400, '涉县', '130426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130427, 130400, '磁县', '130427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130430, 130400, '邱县', '130430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130431, 130400, '鸡泽县', '130431', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130432, 130400, '广平县', '130432', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130433, 130400, '馆陶县', '130433', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130434, 130400, '魏县', '130434', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130435, 130400, '曲周县', '130435', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130471, 130400, '邯郸经济技术开发区', '130471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130473, 130400, '邯郸冀南新区', '130473', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130481, 130400, '武安市', '130481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130500, 130000, '邢台市', '130500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130501, 130500, '市辖区', '130501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130502, 130500, '桥东区', '130502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130503, 130500, '桥西区', '130503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130521, 130500, '邢台县', '130521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130522, 130500, '临城县', '130522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130523, 130500, '内丘县', '130523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130524, 130500, '柏乡县', '130524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130525, 130500, '隆尧县', '130525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130526, 130500, '任县', '130526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130527, 130500, '南和县', '130527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130528, 130500, '宁晋县', '130528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130529, 130500, '巨鹿县', '130529', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130530, 130500, '新河县', '130530', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130531, 130500, '广宗县', '130531', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130532, 130500, '平乡县', '130532', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130533, 130500, '威县', '130533', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130534, 130500, '清河县', '130534', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130535, 130500, '临西县', '130535', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130571, 130500, '河北邢台经济开发区', '130571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130581, 130500, '南宫市', '130581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130582, 130500, '沙河市', '130582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130600, 130000, '保定市', '130600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130601, 130600, '市辖区', '130601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130602, 130600, '竞秀区', '130602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130606, 130600, '莲池区', '130606', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130607, 130600, '满城区', '130607', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130608, 130600, '清苑区', '130608', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130609, 130600, '徐水区', '130609', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130623, 130600, '涞水县', '130623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130624, 130600, '阜平县', '130624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130626, 130600, '定兴县', '130626', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130627, 130600, '唐县', '130627', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130628, 130600, '高阳县', '130628', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130629, 130600, '容城县', '130629', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130630, 130600, '涞源县', '130630', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130631, 130600, '望都县', '130631', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130632, 130600, '安新县', '130632', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130633, 130600, '易县', '130633', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130634, 130600, '曲阳县', '130634', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130635, 130600, '蠡县', '130635', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130636, 130600, '顺平县', '130636', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130637, 130600, '博野县', '130637', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130638, 130600, '雄县', '130638', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130671, 130600, '保定高新技术产业开发区', '130671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130672, 130600, '保定白沟新城', '130672', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130681, 130600, '涿州市', '130681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130682, 130600, '定州市', '130682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130683, 130600, '安国市', '130683', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130684, 130600, '高碑店市', '130684', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130700, 130000, '张家口市', '130700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130701, 130700, '市辖区', '130701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130702, 130700, '桥东区', '130702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130703, 130700, '桥西区', '130703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130705, 130700, '宣化区', '130705', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130706, 130700, '下花园区', '130706', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130708, 130700, '万全区', '130708', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130709, 130700, '崇礼区', '130709', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130722, 130700, '张北县', '130722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130723, 130700, '康保县', '130723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130724, 130700, '沽源县', '130724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130725, 130700, '尚义县', '130725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130726, 130700, '蔚县', '130726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130727, 130700, '阳原县', '130727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130728, 130700, '怀安县', '130728', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130730, 130700, '怀来县', '130730', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130731, 130700, '涿鹿县', '130731', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130732, 130700, '赤城县', '130732', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130771, 130700, '张家口经济开发区', '130771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130772, 130700, '张家口市察北管理区', '130772', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130773, 130700, '张家口市塞北管理区', '130773', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130800, 130000, '承德市', '130800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130801, 130800, '市辖区', '130801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130802, 130800, '双桥区', '130802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130803, 130800, '双滦区', '130803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130804, 130800, '鹰手营子矿区', '130804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130821, 130800, '承德县', '130821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130822, 130800, '兴隆县', '130822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130824, 130800, '滦平县', '130824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130825, 130800, '隆化县', '130825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130826, 130800, '丰宁满族自治县', '130826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130827, 130800, '宽城满族自治县', '130827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130828, 130800, '围场满族蒙古族自治县', '130828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130871, 130800, '承德高新技术产业开发区', '130871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130881, 130800, '平泉市', '130881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130900, 130000, '沧州市', '130900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130901, 130900, '市辖区', '130901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130902, 130900, '新华区', '130902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130903, 130900, '运河区', '130903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130921, 130900, '沧县', '130921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130922, 130900, '青县', '130922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130923, 130900, '东光县', '130923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130924, 130900, '海兴县', '130924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130925, 130900, '盐山县', '130925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130926, 130900, '肃宁县', '130926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130927, 130900, '南皮县', '130927', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130928, 130900, '吴桥县', '130928', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130929, 130900, '献县', '130929', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130930, 130900, '孟村回族自治县', '130930', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130971, 130900, '河北沧州经济开发区', '130971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130972, 130900, '沧州高新技术产业开发区', '130972', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130973, 130900, '沧州渤海新区', '130973', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130981, 130900, '泊头市', '130981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130982, 130900, '任丘市', '130982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130983, 130900, '黄骅市', '130983', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (130984, 130900, '河间市', '130984', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131000, 130000, '廊坊市', '131000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131001, 131000, '市辖区', '131001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131002, 131000, '安次区', '131002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131003, 131000, '广阳区', '131003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131022, 131000, '固安县', '131022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131023, 131000, '永清县', '131023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131024, 131000, '香河县', '131024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131025, 131000, '大城县', '131025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131026, 131000, '文安县', '131026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131028, 131000, '大厂回族自治县', '131028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131071, 131000, '廊坊经济技术开发区', '131071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131081, 131000, '霸州市', '131081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131082, 131000, '三河市', '131082', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131100, 130000, '衡水市', '131100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131101, 131100, '市辖区', '131101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131102, 131100, '桃城区', '131102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131103, 131100, '冀州区', '131103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131121, 131100, '枣强县', '131121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131122, 131100, '武邑县', '131122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131123, 131100, '武强县', '131123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131124, 131100, '饶阳县', '131124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131125, 131100, '安平县', '131125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131126, 131100, '故城县', '131126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131127, 131100, '景县', '131127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131128, 131100, '阜城县', '131128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131171, 131100, '河北衡水高新技术产业开发区', '131171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131172, 131100, '衡水滨湖新区', '131172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (131182, 131100, '深州市', '131182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140000, 1, '山西省', '140000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140100, 140000, '太原市', '140100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140101, 140100, '市辖区', '140101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140105, 140100, '小店区', '140105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140106, 140100, '迎泽区', '140106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140107, 140100, '杏花岭区', '140107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140108, 140100, '尖草坪区', '140108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140109, 140100, '万柏林区', '140109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140110, 140100, '晋源区', '140110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140121, 140100, '清徐县', '140121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140122, 140100, '阳曲县', '140122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140123, 140100, '娄烦县', '140123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140171, 140100, '山西转型综合改革示范区', '140171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140181, 140100, '古交市', '140181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140200, 140000, '大同市', '140200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140201, 140200, '市辖区', '140201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140212, 140200, '新荣区', '140212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140213, 140200, '平城区', '140213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140214, 140200, '云冈区', '140214', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140215, 140200, '云州区', '140215', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140221, 140200, '阳高县', '140221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140222, 140200, '天镇县', '140222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140223, 140200, '广灵县', '140223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140224, 140200, '灵丘县', '140224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140225, 140200, '浑源县', '140225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140226, 140200, '左云县', '140226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140271, 140200, '山西大同经济开发区', '140271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140300, 140000, '阳泉市', '140300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140301, 140300, '市辖区', '140301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140302, 140300, '城区', '140302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140303, 140300, '矿区', '140303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140311, 140300, '郊区', '140311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140321, 140300, '平定县', '140321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140322, 140300, '盂县', '140322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140400, 140000, '长治市', '140400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140401, 140400, '市辖区', '140401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140403, 140400, '潞州区', '140403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140404, 140400, '上党区', '140404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140405, 140400, '屯留区', '140405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140406, 140400, '潞城区', '140406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140423, 140400, '襄垣县', '140423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140425, 140400, '平顺县', '140425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140426, 140400, '黎城县', '140426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140427, 140400, '壶关县', '140427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140428, 140400, '长子县', '140428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140429, 140400, '武乡县', '140429', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140430, 140400, '沁县', '140430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140431, 140400, '沁源县', '140431', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140471, 140400, '山西长治高新技术产业园区', '140471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140500, 140000, '晋城市', '140500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140501, 140500, '市辖区', '140501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140502, 140500, '城区', '140502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140521, 140500, '沁水县', '140521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140522, 140500, '阳城县', '140522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140524, 140500, '陵川县', '140524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140525, 140500, '泽州县', '140525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140581, 140500, '高平市', '140581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140600, 140000, '朔州市', '140600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140601, 140600, '市辖区', '140601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140602, 140600, '朔城区', '140602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140603, 140600, '平鲁区', '140603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140621, 140600, '山阴县', '140621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140622, 140600, '应县', '140622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140623, 140600, '右玉县', '140623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140671, 140600, '山西朔州经济开发区', '140671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140681, 140600, '怀仁市', '140681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140700, 140000, '晋中市', '140700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140701, 140700, '市辖区', '140701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140702, 140700, '榆次区', '140702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140721, 140700, '榆社县', '140721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140722, 140700, '左权县', '140722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140723, 140700, '和顺县', '140723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140724, 140700, '昔阳县', '140724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140725, 140700, '寿阳县', '140725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140726, 140700, '太谷县', '140726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140727, 140700, '祁县', '140727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140728, 140700, '平遥县', '140728', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140729, 140700, '灵石县', '140729', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140781, 140700, '介休市', '140781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140800, 140000, '运城市', '140800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140801, 140800, '市辖区', '140801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140802, 140800, '盐湖区', '140802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140821, 140800, '临猗县', '140821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140822, 140800, '万荣县', '140822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140823, 140800, '闻喜县', '140823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140824, 140800, '稷山县', '140824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140825, 140800, '新绛县', '140825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140826, 140800, '绛县', '140826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140827, 140800, '垣曲县', '140827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140828, 140800, '夏县', '140828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140829, 140800, '平陆县', '140829', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140830, 140800, '芮城县', '140830', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140881, 140800, '永济市', '140881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140882, 140800, '河津市', '140882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140900, 140000, '忻州市', '140900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140901, 140900, '市辖区', '140901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140902, 140900, '忻府区', '140902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140921, 140900, '定襄县', '140921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140922, 140900, '五台县', '140922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140923, 140900, '代县', '140923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140924, 140900, '繁峙县', '140924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140925, 140900, '宁武县', '140925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140926, 140900, '静乐县', '140926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140927, 140900, '神池县', '140927', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140928, 140900, '五寨县', '140928', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140929, 140900, '岢岚县', '140929', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140930, 140900, '河曲县', '140930', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140931, 140900, '保德县', '140931', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140932, 140900, '偏关县', '140932', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140971, 140900, '五台山风景名胜区', '140971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (140981, 140900, '原平市', '140981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141000, 140000, '临汾市', '141000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141001, 141000, '市辖区', '141001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141002, 141000, '尧都区', '141002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141021, 141000, '曲沃县', '141021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141022, 141000, '翼城县', '141022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141023, 141000, '襄汾县', '141023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141024, 141000, '洪洞县', '141024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141025, 141000, '古县', '141025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141026, 141000, '安泽县', '141026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141027, 141000, '浮山县', '141027', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141028, 141000, '吉县', '141028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141029, 141000, '乡宁县', '141029', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141030, 141000, '大宁县', '141030', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141031, 141000, '隰县', '141031', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141032, 141000, '永和县', '141032', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141033, 141000, '蒲县', '141033', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141034, 141000, '汾西县', '141034', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141081, 141000, '侯马市', '141081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141082, 141000, '霍州市', '141082', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141100, 140000, '吕梁市', '141100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141101, 141100, '市辖区', '141101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141102, 141100, '离石区', '141102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141121, 141100, '文水县', '141121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141122, 141100, '交城县', '141122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141123, 141100, '兴县', '141123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141124, 141100, '临县', '141124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141125, 141100, '柳林县', '141125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141126, 141100, '石楼县', '141126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141127, 141100, '岚县', '141127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141128, 141100, '方山县', '141128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141129, 141100, '中阳县', '141129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141130, 141100, '交口县', '141130', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141181, 141100, '孝义市', '141181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (141182, 141100, '汾阳市', '141182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150000, 1, '内蒙古自治区', '150000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150100, 150000, '呼和浩特市', '150100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150101, 150100, '市辖区', '150101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150102, 150100, '新城区', '150102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150103, 150100, '回民区', '150103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150104, 150100, '玉泉区', '150104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150105, 150100, '赛罕区', '150105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150121, 150100, '土默特左旗', '150121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150122, 150100, '托克托县', '150122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150123, 150100, '和林格尔县', '150123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150124, 150100, '清水河县', '150124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150125, 150100, '武川县', '150125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150171, 150100, '呼和浩特金海工业园区', '150171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150172, 150100, '呼和浩特经济技术开发区', '150172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150200, 150000, '包头市', '150200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150201, 150200, '市辖区', '150201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150202, 150200, '东河区', '150202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150203, 150200, '昆都仑区', '150203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150204, 150200, '青山区', '150204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150205, 150200, '石拐区', '150205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150206, 150200, '白云鄂博矿区', '150206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150207, 150200, '九原区', '150207', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150221, 150200, '土默特右旗', '150221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150222, 150200, '固阳县', '150222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150223, 150200, '达尔罕茂明安联合旗', '150223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150271, 150200, '包头稀土高新技术产业开发区', '150271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150300, 150000, '乌海市', '150300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150301, 150300, '市辖区', '150301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150302, 150300, '海勃湾区', '150302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150303, 150300, '海南区', '150303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150304, 150300, '乌达区', '150304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150400, 150000, '赤峰市', '150400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150401, 150400, '市辖区', '150401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150402, 150400, '红山区', '150402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150403, 150400, '元宝山区', '150403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150404, 150400, '松山区', '150404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150421, 150400, '阿鲁科尔沁旗', '150421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150422, 150400, '巴林左旗', '150422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150423, 150400, '巴林右旗', '150423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150424, 150400, '林西县', '150424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150425, 150400, '克什克腾旗', '150425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150426, 150400, '翁牛特旗', '150426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150428, 150400, '喀喇沁旗', '150428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150429, 150400, '宁城县', '150429', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150430, 150400, '敖汉旗', '150430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150500, 150000, '通辽市', '150500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150501, 150500, '市辖区', '150501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150502, 150500, '科尔沁区', '150502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150521, 150500, '科尔沁左翼中旗', '150521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150522, 150500, '科尔沁左翼后旗', '150522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150523, 150500, '开鲁县', '150523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150524, 150500, '库伦旗', '150524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150525, 150500, '奈曼旗', '150525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150526, 150500, '扎鲁特旗', '150526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150571, 150500, '通辽经济技术开发区', '150571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150581, 150500, '霍林郭勒市', '150581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150600, 150000, '鄂尔多斯市', '150600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150601, 150600, '市辖区', '150601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150602, 150600, '东胜区', '150602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150603, 150600, '康巴什区', '150603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150621, 150600, '达拉特旗', '150621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150622, 150600, '准格尔旗', '150622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150623, 150600, '鄂托克前旗', '150623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150624, 150600, '鄂托克旗', '150624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150625, 150600, '杭锦旗', '150625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150626, 150600, '乌审旗', '150626', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150627, 150600, '伊金霍洛旗', '150627', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150700, 150000, '呼伦贝尔市', '150700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150701, 150700, '市辖区', '150701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150702, 150700, '海拉尔区', '150702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150703, 150700, '扎赉诺尔区', '150703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150721, 150700, '阿荣旗', '150721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150722, 150700, '莫力达瓦达斡尔族自治旗', '150722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150723, 150700, '鄂伦春自治旗', '150723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150724, 150700, '鄂温克族自治旗', '150724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150725, 150700, '陈巴尔虎旗', '150725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150726, 150700, '新巴尔虎左旗', '150726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150727, 150700, '新巴尔虎右旗', '150727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150781, 150700, '满洲里市', '150781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150782, 150700, '牙克石市', '150782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150783, 150700, '扎兰屯市', '150783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150784, 150700, '额尔古纳市', '150784', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150785, 150700, '根河市', '150785', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150800, 150000, '巴彦淖尔市', '150800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150801, 150800, '市辖区', '150801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150802, 150800, '临河区', '150802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150821, 150800, '五原县', '150821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150822, 150800, '磴口县', '150822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150823, 150800, '乌拉特前旗', '150823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150824, 150800, '乌拉特中旗', '150824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150825, 150800, '乌拉特后旗', '150825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150826, 150800, '杭锦后旗', '150826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150900, 150000, '乌兰察布市', '150900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150901, 150900, '市辖区', '150901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150902, 150900, '集宁区', '150902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150921, 150900, '卓资县', '150921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150922, 150900, '化德县', '150922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150923, 150900, '商都县', '150923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150924, 150900, '兴和县', '150924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150925, 150900, '凉城县', '150925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150926, 150900, '察哈尔右翼前旗', '150926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150927, 150900, '察哈尔右翼中旗', '150927', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150928, 150900, '察哈尔右翼后旗', '150928', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150929, 150900, '四子王旗', '150929', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (150981, 150900, '丰镇市', '150981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152200, 150000, '兴安盟', '152200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152201, 152200, '乌兰浩特市', '152201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152202, 152200, '阿尔山市', '152202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152221, 152200, '科尔沁右翼前旗', '152221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152222, 152200, '科尔沁右翼中旗', '152222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152223, 152200, '扎赉特旗', '152223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152224, 152200, '突泉县', '152224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152500, 150000, '锡林郭勒盟', '152500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152501, 152500, '二连浩特市', '152501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152502, 152500, '锡林浩特市', '152502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152522, 152500, '阿巴嘎旗', '152522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152523, 152500, '苏尼特左旗', '152523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152524, 152500, '苏尼特右旗', '152524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152525, 152500, '东乌珠穆沁旗', '152525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152526, 152500, '西乌珠穆沁旗', '152526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152527, 152500, '太仆寺旗', '152527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152528, 152500, '镶黄旗', '152528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152529, 152500, '正镶白旗', '152529', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152530, 152500, '正蓝旗', '152530', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152531, 152500, '多伦县', '152531', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152571, 152500, '乌拉盖管委会', '152571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152900, 150000, '阿拉善盟', '152900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152921, 152900, '阿拉善左旗', '152921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152922, 152900, '阿拉善右旗', '152922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152923, 152900, '额济纳旗', '152923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (152971, 152900, '内蒙古阿拉善经济开发区', '152971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210000, 1, '辽宁省', '210000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210100, 210000, '沈阳市', '210100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210101, 210100, '市辖区', '210101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210102, 210100, '和平区', '210102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210103, 210100, '沈河区', '210103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210104, 210100, '大东区', '210104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210105, 210100, '皇姑区', '210105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210106, 210100, '铁西区', '210106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210111, 210100, '苏家屯区', '210111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210112, 210100, '浑南区', '210112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210113, 210100, '沈北新区', '210113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210114, 210100, '于洪区', '210114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210115, 210100, '辽中区', '210115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210123, 210100, '康平县', '210123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210124, 210100, '法库县', '210124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210181, 210100, '新民市', '210181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210200, 210000, '大连市', '210200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210201, 210200, '市辖区', '210201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210202, 210200, '中山区', '210202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210203, 210200, '西岗区', '210203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210204, 210200, '沙河口区', '210204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210211, 210200, '甘井子区', '210211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210212, 210200, '旅顺口区', '210212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210213, 210200, '金州区', '210213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210214, 210200, '普兰店区', '210214', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210224, 210200, '长海县', '210224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210281, 210200, '瓦房店市', '210281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210283, 210200, '庄河市', '210283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210300, 210000, '鞍山市', '210300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210301, 210300, '市辖区', '210301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210302, 210300, '铁东区', '210302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210303, 210300, '铁西区', '210303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210304, 210300, '立山区', '210304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210311, 210300, '千山区', '210311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210321, 210300, '台安县', '210321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210323, 210300, '岫岩满族自治县', '210323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210381, 210300, '海城市', '210381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210400, 210000, '抚顺市', '210400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210401, 210400, '市辖区', '210401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210402, 210400, '新抚区', '210402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210403, 210400, '东洲区', '210403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210404, 210400, '望花区', '210404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210411, 210400, '顺城区', '210411', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210421, 210400, '抚顺县', '210421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210422, 210400, '新宾满族自治县', '210422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210423, 210400, '清原满族自治县', '210423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210500, 210000, '本溪市', '210500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210501, 210500, '市辖区', '210501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210502, 210500, '平山区', '210502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210503, 210500, '溪湖区', '210503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210504, 210500, '明山区', '210504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210505, 210500, '南芬区', '210505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210521, 210500, '本溪满族自治县', '210521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210522, 210500, '桓仁满族自治县', '210522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210600, 210000, '丹东市', '210600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210601, 210600, '市辖区', '210601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210602, 210600, '元宝区', '210602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210603, 210600, '振兴区', '210603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210604, 210600, '振安区', '210604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210624, 210600, '宽甸满族自治县', '210624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210681, 210600, '东港市', '210681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210682, 210600, '凤城市', '210682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210700, 210000, '锦州市', '210700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210701, 210700, '市辖区', '210701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210702, 210700, '古塔区', '210702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210703, 210700, '凌河区', '210703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210711, 210700, '太和区', '210711', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210726, 210700, '黑山县', '210726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210727, 210700, '义县', '210727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210781, 210700, '凌海市', '210781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210782, 210700, '北镇市', '210782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210800, 210000, '营口市', '210800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210801, 210800, '市辖区', '210801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210802, 210800, '站前区', '210802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210803, 210800, '西市区', '210803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210804, 210800, '鲅鱼圈区', '210804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210811, 210800, '老边区', '210811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210881, 210800, '盖州市', '210881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210882, 210800, '大石桥市', '210882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210900, 210000, '阜新市', '210900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210901, 210900, '市辖区', '210901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210902, 210900, '海州区', '210902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210903, 210900, '新邱区', '210903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210904, 210900, '太平区', '210904', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210905, 210900, '清河门区', '210905', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210911, 210900, '细河区', '210911', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210921, 210900, '阜新蒙古族自治县', '210921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (210922, 210900, '彰武县', '210922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211000, 210000, '辽阳市', '211000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211001, 211000, '市辖区', '211001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211002, 211000, '白塔区', '211002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211003, 211000, '文圣区', '211003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211004, 211000, '宏伟区', '211004', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211005, 211000, '弓长岭区', '211005', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211011, 211000, '太子河区', '211011', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211021, 211000, '辽阳县', '211021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211081, 211000, '灯塔市', '211081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211100, 210000, '盘锦市', '211100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211101, 211100, '市辖区', '211101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211102, 211100, '双台子区', '211102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211103, 211100, '兴隆台区', '211103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211104, 211100, '大洼区', '211104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211122, 211100, '盘山县', '211122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211200, 210000, '铁岭市', '211200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211201, 211200, '市辖区', '211201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211202, 211200, '银州区', '211202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211204, 211200, '清河区', '211204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211221, 211200, '铁岭县', '211221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211223, 211200, '西丰县', '211223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211224, 211200, '昌图县', '211224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211281, 211200, '调兵山市', '211281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211282, 211200, '开原市', '211282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211300, 210000, '朝阳市', '211300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211301, 211300, '市辖区', '211301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211302, 211300, '双塔区', '211302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211303, 211300, '龙城区', '211303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211321, 211300, '朝阳县', '211321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211322, 211300, '建平县', '211322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211324, 211300, '喀喇沁左翼蒙古族自治县', '211324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211381, 211300, '北票市', '211381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211382, 211300, '凌源市', '211382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211400, 210000, '葫芦岛市', '211400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211401, 211400, '市辖区', '211401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211402, 211400, '连山区', '211402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211403, 211400, '龙港区', '211403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211404, 211400, '南票区', '211404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211421, 211400, '绥中县', '211421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211422, 211400, '建昌县', '211422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (211481, 211400, '兴城市', '211481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220000, 1, '吉林省', '220000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220100, 220000, '长春市', '220100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220101, 220100, '市辖区', '220101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220102, 220100, '南关区', '220102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220103, 220100, '宽城区', '220103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220104, 220100, '朝阳区', '220104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220105, 220100, '二道区', '220105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220106, 220100, '绿园区', '220106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220112, 220100, '双阳区', '220112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220113, 220100, '九台区', '220113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220122, 220100, '农安县', '220122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220171, 220100, '长春经济技术开发区', '220171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220172, 220100, '长春净月高新技术产业开发区', '220172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220173, 220100, '长春高新技术产业开发区', '220173', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220174, 220100, '长春汽车经济技术开发区', '220174', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220182, 220100, '榆树市', '220182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220183, 220100, '德惠市', '220183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220200, 220000, '吉林市', '220200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220201, 220200, '市辖区', '220201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220202, 220200, '昌邑区', '220202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220203, 220200, '龙潭区', '220203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220204, 220200, '船营区', '220204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220211, 220200, '丰满区', '220211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220221, 220200, '永吉县', '220221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220271, 220200, '吉林经济开发区', '220271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220272, 220200, '吉林高新技术产业开发区', '220272', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220273, 220200, '吉林中国新加坡食品区', '220273', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220281, 220200, '蛟河市', '220281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220282, 220200, '桦甸市', '220282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220283, 220200, '舒兰市', '220283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220284, 220200, '磐石市', '220284', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220300, 220000, '四平市', '220300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220301, 220300, '市辖区', '220301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220302, 220300, '铁西区', '220302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220303, 220300, '铁东区', '220303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220322, 220300, '梨树县', '220322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220323, 220300, '伊通满族自治县', '220323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220381, 220300, '公主岭市', '220381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220382, 220300, '双辽市', '220382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220400, 220000, '辽源市', '220400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220401, 220400, '市辖区', '220401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220402, 220400, '龙山区', '220402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220403, 220400, '西安区', '220403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220421, 220400, '东丰县', '220421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220422, 220400, '东辽县', '220422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220500, 220000, '通化市', '220500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220501, 220500, '市辖区', '220501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220502, 220500, '东昌区', '220502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220503, 220500, '二道江区', '220503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220521, 220500, '通化县', '220521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220523, 220500, '辉南县', '220523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220524, 220500, '柳河县', '220524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220581, 220500, '梅河口市', '220581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220582, 220500, '集安市', '220582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220600, 220000, '白山市', '220600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220601, 220600, '市辖区', '220601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220602, 220600, '浑江区', '220602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220605, 220600, '江源区', '220605', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220621, 220600, '抚松县', '220621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220622, 220600, '靖宇县', '220622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220623, 220600, '长白朝鲜族自治县', '220623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220681, 220600, '临江市', '220681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220700, 220000, '松原市', '220700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220701, 220700, '市辖区', '220701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220702, 220700, '宁江区', '220702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220721, 220700, '前郭尔罗斯蒙古族自治县', '220721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220722, 220700, '长岭县', '220722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220723, 220700, '乾安县', '220723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220771, 220700, '吉林松原经济开发区', '220771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220781, 220700, '扶余市', '220781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220800, 220000, '白城市', '220800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220801, 220800, '市辖区', '220801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220802, 220800, '洮北区', '220802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220821, 220800, '镇赉县', '220821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220822, 220800, '通榆县', '220822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220871, 220800, '吉林白城经济开发区', '220871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220881, 220800, '洮南市', '220881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (220882, 220800, '大安市', '220882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222400, 220000, '延边朝鲜族自治州', '222400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222401, 222400, '延吉市', '222401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222402, 222400, '图们市', '222402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222403, 222400, '敦化市', '222403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222404, 222400, '珲春市', '222404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222405, 222400, '龙井市', '222405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222406, 222400, '和龙市', '222406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222424, 222400, '汪清县', '222424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (222426, 222400, '安图县', '222426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230000, 1, '黑龙江省', '230000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230100, 230000, '哈尔滨市', '230100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230101, 230100, '市辖区', '230101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230102, 230100, '道里区', '230102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230103, 230100, '南岗区', '230103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230104, 230100, '道外区', '230104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230108, 230100, '平房区', '230108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230109, 230100, '松北区', '230109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230110, 230100, '香坊区', '230110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230111, 230100, '呼兰区', '230111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230112, 230100, '阿城区', '230112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230113, 230100, '双城区', '230113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230123, 230100, '依兰县', '230123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230124, 230100, '方正县', '230124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230125, 230100, '宾县', '230125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230126, 230100, '巴彦县', '230126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230127, 230100, '木兰县', '230127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230128, 230100, '通河县', '230128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230129, 230100, '延寿县', '230129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230183, 230100, '尚志市', '230183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230184, 230100, '五常市', '230184', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230200, 230000, '齐齐哈尔市', '230200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230201, 230200, '市辖区', '230201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230202, 230200, '龙沙区', '230202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230203, 230200, '建华区', '230203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230204, 230200, '铁锋区', '230204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230205, 230200, '昂昂溪区', '230205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230206, 230200, '富拉尔基区', '230206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230207, 230200, '碾子山区', '230207', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230208, 230200, '梅里斯达斡尔族区', '230208', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230221, 230200, '龙江县', '230221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230223, 230200, '依安县', '230223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230224, 230200, '泰来县', '230224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230225, 230200, '甘南县', '230225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230227, 230200, '富裕县', '230227', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230229, 230200, '克山县', '230229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230230, 230200, '克东县', '230230', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230231, 230200, '拜泉县', '230231', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230281, 230200, '讷河市', '230281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230300, 230000, '鸡西市', '230300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230301, 230300, '市辖区', '230301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230302, 230300, '鸡冠区', '230302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230303, 230300, '恒山区', '230303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230304, 230300, '滴道区', '230304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230305, 230300, '梨树区', '230305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230306, 230300, '城子河区', '230306', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230307, 230300, '麻山区', '230307', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230321, 230300, '鸡东县', '230321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230381, 230300, '虎林市', '230381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230382, 230300, '密山市', '230382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230400, 230000, '鹤岗市', '230400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230401, 230400, '市辖区', '230401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230402, 230400, '向阳区', '230402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230403, 230400, '工农区', '230403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230404, 230400, '南山区', '230404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230405, 230400, '兴安区', '230405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230406, 230400, '东山区', '230406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230407, 230400, '兴山区', '230407', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230421, 230400, '萝北县', '230421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230422, 230400, '绥滨县', '230422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230500, 230000, '双鸭山市', '230500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230501, 230500, '市辖区', '230501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230502, 230500, '尖山区', '230502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230503, 230500, '岭东区', '230503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230505, 230500, '四方台区', '230505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230506, 230500, '宝山区', '230506', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230521, 230500, '集贤县', '230521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230522, 230500, '友谊县', '230522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230523, 230500, '宝清县', '230523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230524, 230500, '饶河县', '230524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230600, 230000, '大庆市', '230600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230601, 230600, '市辖区', '230601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230602, 230600, '萨尔图区', '230602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230603, 230600, '龙凤区', '230603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230604, 230600, '让胡路区', '230604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230605, 230600, '红岗区', '230605', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230606, 230600, '大同区', '230606', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230621, 230600, '肇州县', '230621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230622, 230600, '肇源县', '230622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230623, 230600, '林甸县', '230623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230624, 230600, '杜尔伯特蒙古族自治县', '230624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230671, 230600, '大庆高新技术产业开发区', '230671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230700, 230000, '伊春市', '230700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230701, 230700, '市辖区', '230701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230717, 230700, '伊美区', '230717', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230718, 230700, '乌翠区', '230718', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230719, 230700, '友好区', '230719', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230722, 230700, '嘉荫县', '230722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230723, 230700, '汤旺县', '230723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230724, 230700, '丰林县', '230724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230725, 230700, '大箐山县', '230725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230726, 230700, '南岔县', '230726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230751, 230700, '金林区', '230751', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230781, 230700, '铁力市', '230781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230800, 230000, '佳木斯市', '230800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230801, 230800, '市辖区', '230801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230803, 230800, '向阳区', '230803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230804, 230800, '前进区', '230804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230805, 230800, '东风区', '230805', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230811, 230800, '郊区', '230811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230822, 230800, '桦南县', '230822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230826, 230800, '桦川县', '230826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230828, 230800, '汤原县', '230828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230881, 230800, '同江市', '230881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230882, 230800, '富锦市', '230882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230883, 230800, '抚远市', '230883', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230900, 230000, '七台河市', '230900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230901, 230900, '市辖区', '230901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230902, 230900, '新兴区', '230902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230903, 230900, '桃山区', '230903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230904, 230900, '茄子河区', '230904', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (230921, 230900, '勃利县', '230921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231000, 230000, '牡丹江市', '231000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231001, 231000, '市辖区', '231001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231002, 231000, '东安区', '231002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231003, 231000, '阳明区', '231003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231004, 231000, '爱民区', '231004', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231005, 231000, '西安区', '231005', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231025, 231000, '林口县', '231025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231071, 231000, '牡丹江经济技术开发区', '231071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231081, 231000, '绥芬河市', '231081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231083, 231000, '海林市', '231083', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231084, 231000, '宁安市', '231084', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231085, 231000, '穆棱市', '231085', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231086, 231000, '东宁市', '231086', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231100, 230000, '黑河市', '231100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231101, 231100, '市辖区', '231101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231102, 231100, '爱辉区', '231102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231123, 231100, '逊克县', '231123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231124, 231100, '孙吴县', '231124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231181, 231100, '北安市', '231181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231182, 231100, '五大连池市', '231182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231183, 231100, '嫩江市', '231183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231200, 230000, '绥化市', '231200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231201, 231200, '市辖区', '231201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231202, 231200, '北林区', '231202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231221, 231200, '望奎县', '231221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231222, 231200, '兰西县', '231222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231223, 231200, '青冈县', '231223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231224, 231200, '庆安县', '231224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231225, 231200, '明水县', '231225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231226, 231200, '绥棱县', '231226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231281, 231200, '安达市', '231281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231282, 231200, '肇东市', '231282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (231283, 231200, '海伦市', '231283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232700, 230000, '大兴安岭地区', '232700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232701, 232700, '漠河市', '232701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232721, 232700, '呼玛县', '232721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232722, 232700, '塔河县', '232722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232761, 232700, '加格达奇区', '232761', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232762, 232700, '松岭区', '232762', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232763, 232700, '新林区', '232763', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (232764, 232700, '呼中区', '232764', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310000, 1, '上海市', '310000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310100, 310000, '市辖区', '310100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310101, 310100, '黄浦区', '310101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310104, 310100, '徐汇区', '310104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310105, 310100, '长宁区', '310105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310106, 310100, '静安区', '310106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310107, 310100, '普陀区', '310107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310109, 310100, '虹口区', '310109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310110, 310100, '杨浦区', '310110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310112, 310100, '闵行区', '310112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310113, 310100, '宝山区', '310113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310114, 310100, '嘉定区', '310114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310115, 310100, '浦东新区', '310115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310116, 310100, '金山区', '310116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310117, 310100, '松江区', '310117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310118, 310100, '青浦区', '310118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310120, 310100, '奉贤区', '310120', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (310151, 310100, '崇明区', '310151', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320000, 1, '江苏省', '320000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320100, 320000, '南京市', '320100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320101, 320100, '市辖区', '320101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320102, 320100, '玄武区', '320102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320104, 320100, '秦淮区', '320104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320105, 320100, '建邺区', '320105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320106, 320100, '鼓楼区', '320106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320111, 320100, '浦口区', '320111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320113, 320100, '栖霞区', '320113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320114, 320100, '雨花台区', '320114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320115, 320100, '江宁区', '320115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320116, 320100, '六合区', '320116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320117, 320100, '溧水区', '320117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320118, 320100, '高淳区', '320118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320200, 320000, '无锡市', '320200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320201, 320200, '市辖区', '320201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320205, 320200, '锡山区', '320205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320206, 320200, '惠山区', '320206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320211, 320200, '滨湖区', '320211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320213, 320200, '梁溪区', '320213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320214, 320200, '新吴区', '320214', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320281, 320200, '江阴市', '320281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320282, 320200, '宜兴市', '320282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320300, 320000, '徐州市', '320300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320301, 320300, '市辖区', '320301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320302, 320300, '鼓楼区', '320302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320303, 320300, '云龙区', '320303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320305, 320300, '贾汪区', '320305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320311, 320300, '泉山区', '320311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320312, 320300, '铜山区', '320312', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320321, 320300, '丰县', '320321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320322, 320300, '沛县', '320322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320324, 320300, '睢宁县', '320324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320371, 320300, '徐州经济技术开发区', '320371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320381, 320300, '新沂市', '320381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320382, 320300, '邳州市', '320382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320400, 320000, '常州市', '320400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320401, 320400, '市辖区', '320401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320402, 320400, '天宁区', '320402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320404, 320400, '钟楼区', '320404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320411, 320400, '新北区', '320411', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320412, 320400, '武进区', '320412', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320413, 320400, '金坛区', '320413', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320481, 320400, '溧阳市', '320481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320500, 320000, '苏州市', '320500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320501, 320500, '市辖区', '320501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320505, 320500, '虎丘区', '320505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320506, 320500, '吴中区', '320506', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320507, 320500, '相城区', '320507', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320508, 320500, '姑苏区', '320508', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320509, 320500, '吴江区', '320509', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320571, 320500, '苏州工业园区', '320571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320581, 320500, '常熟市', '320581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320582, 320500, '张家港市', '320582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320583, 320500, '昆山市', '320583', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320585, 320500, '太仓市', '320585', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320600, 320000, '南通市', '320600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320601, 320600, '市辖区', '320601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320602, 320600, '崇川区', '320602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320611, 320600, '港闸区', '320611', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320612, 320600, '通州区', '320612', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320623, 320600, '如东县', '320623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320671, 320600, '南通经济技术开发区', '320671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320681, 320600, '启东市', '320681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320682, 320600, '如皋市', '320682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320684, 320600, '海门市', '320684', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320685, 320600, '海安市', '320685', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320700, 320000, '连云港市', '320700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320701, 320700, '市辖区', '320701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320703, 320700, '连云区', '320703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320706, 320700, '海州区', '320706', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320707, 320700, '赣榆区', '320707', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320722, 320700, '东海县', '320722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320723, 320700, '灌云县', '320723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320724, 320700, '灌南县', '320724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320771, 320700, '连云港经济技术开发区', '320771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320772, 320700, '连云港高新技术产业开发区', '320772', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320800, 320000, '淮安市', '320800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320801, 320800, '市辖区', '320801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320803, 320800, '淮安区', '320803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320804, 320800, '淮阴区', '320804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320812, 320800, '清江浦区', '320812', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320813, 320800, '洪泽区', '320813', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320826, 320800, '涟水县', '320826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320830, 320800, '盱眙县', '320830', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320831, 320800, '金湖县', '320831', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320871, 320800, '淮安经济技术开发区', '320871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320900, 320000, '盐城市', '320900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320901, 320900, '市辖区', '320901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320902, 320900, '亭湖区', '320902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320903, 320900, '盐都区', '320903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320904, 320900, '大丰区', '320904', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320921, 320900, '响水县', '320921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320922, 320900, '滨海县', '320922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320923, 320900, '阜宁县', '320923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320924, 320900, '射阳县', '320924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320925, 320900, '建湖县', '320925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320971, 320900, '盐城经济技术开发区', '320971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (320981, 320900, '东台市', '320981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321000, 320000, '扬州市', '321000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321001, 321000, '市辖区', '321001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321002, 321000, '广陵区', '321002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321003, 321000, '邗江区', '321003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321012, 321000, '江都区', '321012', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321023, 321000, '宝应县', '321023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321071, 321000, '扬州经济技术开发区', '321071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321081, 321000, '仪征市', '321081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321084, 321000, '高邮市', '321084', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321100, 320000, '镇江市', '321100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321101, 321100, '市辖区', '321101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321102, 321100, '京口区', '321102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321111, 321100, '润州区', '321111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321112, 321100, '丹徒区', '321112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321171, 321100, '镇江新区', '321171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321181, 321100, '丹阳市', '321181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321182, 321100, '扬中市', '321182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321183, 321100, '句容市', '321183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321200, 320000, '泰州市', '321200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321201, 321200, '市辖区', '321201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321202, 321200, '海陵区', '321202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321203, 321200, '高港区', '321203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321204, 321200, '姜堰区', '321204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321271, 321200, '泰州医药高新技术产业开发区', '321271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321281, 321200, '兴化市', '321281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321282, 321200, '靖江市', '321282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321283, 321200, '泰兴市', '321283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321300, 320000, '宿迁市', '321300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321301, 321300, '市辖区', '321301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321302, 321300, '宿城区', '321302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321311, 321300, '宿豫区', '321311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321322, 321300, '沭阳县', '321322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321323, 321300, '泗阳县', '321323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321324, 321300, '泗洪县', '321324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (321371, 321300, '宿迁经济技术开发区', '321371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330000, 1, '浙江省', '330000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330100, 330000, '杭州市', '330100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330101, 330100, '市辖区', '330101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330102, 330100, '上城区', '330102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330103, 330100, '下城区', '330103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330104, 330100, '江干区', '330104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330105, 330100, '拱墅区', '330105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330106, 330100, '西湖区', '330106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330108, 330100, '滨江区', '330108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330109, 330100, '萧山区', '330109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330110, 330100, '余杭区', '330110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330111, 330100, '富阳区', '330111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330112, 330100, '临安区', '330112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330122, 330100, '桐庐县', '330122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330127, 330100, '淳安县', '330127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330182, 330100, '建德市', '330182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330200, 330000, '宁波市', '330200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330201, 330200, '市辖区', '330201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330203, 330200, '海曙区', '330203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330205, 330200, '江北区', '330205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330206, 330200, '北仑区', '330206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330211, 330200, '镇海区', '330211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330212, 330200, '鄞州区', '330212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330213, 330200, '奉化区', '330213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330225, 330200, '象山县', '330225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330226, 330200, '宁海县', '330226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330281, 330200, '余姚市', '330281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330282, 330200, '慈溪市', '330282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330300, 330000, '温州市', '330300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330301, 330300, '市辖区', '330301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330302, 330300, '鹿城区', '330302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330303, 330300, '龙湾区', '330303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330304, 330300, '瓯海区', '330304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330305, 330300, '洞头区', '330305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330324, 330300, '永嘉县', '330324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330326, 330300, '平阳县', '330326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330327, 330300, '苍南县', '330327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330328, 330300, '文成县', '330328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330329, 330300, '泰顺县', '330329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330371, 330300, '温州经济技术开发区', '330371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330381, 330300, '瑞安市', '330381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330382, 330300, '乐清市', '330382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330383, 330300, '龙港市', '330383', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330400, 330000, '嘉兴市', '330400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330401, 330400, '市辖区', '330401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330402, 330400, '南湖区', '330402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330411, 330400, '秀洲区', '330411', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330421, 330400, '嘉善县', '330421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330424, 330400, '海盐县', '330424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330481, 330400, '海宁市', '330481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330482, 330400, '平湖市', '330482', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330483, 330400, '桐乡市', '330483', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330500, 330000, '湖州市', '330500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330501, 330500, '市辖区', '330501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330502, 330500, '吴兴区', '330502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330503, 330500, '南浔区', '330503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330521, 330500, '德清县', '330521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330522, 330500, '长兴县', '330522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330523, 330500, '安吉县', '330523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330600, 330000, '绍兴市', '330600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330601, 330600, '市辖区', '330601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330602, 330600, '越城区', '330602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330603, 330600, '柯桥区', '330603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330604, 330600, '上虞区', '330604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330624, 330600, '新昌县', '330624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330681, 330600, '诸暨市', '330681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330683, 330600, '嵊州市', '330683', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330700, 330000, '金华市', '330700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330701, 330700, '市辖区', '330701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330702, 330700, '婺城区', '330702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330703, 330700, '金东区', '330703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330723, 330700, '武义县', '330723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330726, 330700, '浦江县', '330726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330727, 330700, '磐安县', '330727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330781, 330700, '兰溪市', '330781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330782, 330700, '义乌市', '330782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330783, 330700, '东阳市', '330783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330784, 330700, '永康市', '330784', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330800, 330000, '衢州市', '330800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330801, 330800, '市辖区', '330801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330802, 330800, '柯城区', '330802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330803, 330800, '衢江区', '330803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330822, 330800, '常山县', '330822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330824, 330800, '开化县', '330824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330825, 330800, '龙游县', '330825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330881, 330800, '江山市', '330881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330900, 330000, '舟山市', '330900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330901, 330900, '市辖区', '330901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330902, 330900, '定海区', '330902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330903, 330900, '普陀区', '330903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330921, 330900, '岱山县', '330921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (330922, 330900, '嵊泗县', '330922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331000, 330000, '台州市', '331000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331001, 331000, '市辖区', '331001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331002, 331000, '椒江区', '331002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331003, 331000, '黄岩区', '331003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331004, 331000, '路桥区', '331004', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331022, 331000, '三门县', '331022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331023, 331000, '天台县', '331023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331024, 331000, '仙居县', '331024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331081, 331000, '温岭市', '331081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331082, 331000, '临海市', '331082', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331083, 331000, '玉环市', '331083', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331100, 330000, '丽水市', '331100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331101, 331100, '市辖区', '331101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331102, 331100, '莲都区', '331102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331121, 331100, '青田县', '331121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331122, 331100, '缙云县', '331122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331123, 331100, '遂昌县', '331123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331124, 331100, '松阳县', '331124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331125, 331100, '云和县', '331125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331126, 331100, '庆元县', '331126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331127, 331100, '景宁畲族自治县', '331127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (331181, 331100, '龙泉市', '331181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340000, 1, '安徽省', '340000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340100, 340000, '合肥市', '340100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340101, 340100, '市辖区', '340101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340102, 340100, '瑶海区', '340102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340103, 340100, '庐阳区', '340103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340104, 340100, '蜀山区', '340104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340111, 340100, '包河区', '340111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340121, 340100, '长丰县', '340121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340122, 340100, '肥东县', '340122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340123, 340100, '肥西县', '340123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340124, 340100, '庐江县', '340124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340171, 340100, '合肥高新技术产业开发区', '340171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340172, 340100, '合肥经济技术开发区', '340172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340173, 340100, '合肥新站高新技术产业开发区', '340173', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340181, 340100, '巢湖市', '340181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340200, 340000, '芜湖市', '340200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340201, 340200, '市辖区', '340201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340202, 340200, '镜湖区', '340202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340203, 340200, '弋江区', '340203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340207, 340200, '鸠江区', '340207', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340208, 340200, '三山区', '340208', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340221, 340200, '芜湖县', '340221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340222, 340200, '繁昌县', '340222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340223, 340200, '南陵县', '340223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340225, 340200, '无为县', '340225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340271, 340200, '芜湖经济技术开发区', '340271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340272, 340200, '安徽芜湖长江大桥经济开发区', '340272', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340300, 340000, '蚌埠市', '340300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340301, 340300, '市辖区', '340301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340302, 340300, '龙子湖区', '340302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340303, 340300, '蚌山区', '340303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340304, 340300, '禹会区', '340304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340311, 340300, '淮上区', '340311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340321, 340300, '怀远县', '340321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340322, 340300, '五河县', '340322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340323, 340300, '固镇县', '340323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340371, 340300, '蚌埠市高新技术开发区', '340371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340372, 340300, '蚌埠市经济开发区', '340372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340400, 340000, '淮南市', '340400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340401, 340400, '市辖区', '340401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340402, 340400, '大通区', '340402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340403, 340400, '田家庵区', '340403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340404, 340400, '谢家集区', '340404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340405, 340400, '八公山区', '340405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340406, 340400, '潘集区', '340406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340421, 340400, '凤台县', '340421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340422, 340400, '寿县', '340422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340500, 340000, '马鞍山市', '340500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340501, 340500, '市辖区', '340501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340503, 340500, '花山区', '340503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340504, 340500, '雨山区', '340504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340506, 340500, '博望区', '340506', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340521, 340500, '当涂县', '340521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340522, 340500, '含山县', '340522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340523, 340500, '和县', '340523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340600, 340000, '淮北市', '340600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340601, 340600, '市辖区', '340601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340602, 340600, '杜集区', '340602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340603, 340600, '相山区', '340603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340604, 340600, '烈山区', '340604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340621, 340600, '濉溪县', '340621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340700, 340000, '铜陵市', '340700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340701, 340700, '市辖区', '340701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340705, 340700, '铜官区', '340705', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340706, 340700, '义安区', '340706', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340711, 340700, '郊区', '340711', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340722, 340700, '枞阳县', '340722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340800, 340000, '安庆市', '340800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340801, 340800, '市辖区', '340801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340802, 340800, '迎江区', '340802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340803, 340800, '大观区', '340803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340811, 340800, '宜秀区', '340811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340822, 340800, '怀宁县', '340822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340825, 340800, '太湖县', '340825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340826, 340800, '宿松县', '340826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340827, 340800, '望江县', '340827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340828, 340800, '岳西县', '340828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340871, 340800, '安徽安庆经济开发区', '340871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340881, 340800, '桐城市', '340881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (340882, 340800, '潜山市', '340882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341000, 340000, '黄山市', '341000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341001, 341000, '市辖区', '341001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341002, 341000, '屯溪区', '341002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341003, 341000, '黄山区', '341003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341004, 341000, '徽州区', '341004', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341021, 341000, '歙县', '341021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341022, 341000, '休宁县', '341022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341023, 341000, '黟县', '341023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341024, 341000, '祁门县', '341024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341100, 340000, '滁州市', '341100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341101, 341100, '市辖区', '341101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341102, 341100, '琅琊区', '341102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341103, 341100, '南谯区', '341103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341122, 341100, '来安县', '341122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341124, 341100, '全椒县', '341124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341125, 341100, '定远县', '341125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341126, 341100, '凤阳县', '341126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341171, 341100, '苏滁现代产业园', '341171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341172, 341100, '滁州经济技术开发区', '341172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341181, 341100, '天长市', '341181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341182, 341100, '明光市', '341182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341200, 340000, '阜阳市', '341200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341201, 341200, '市辖区', '341201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341202, 341200, '颍州区', '341202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341203, 341200, '颍东区', '341203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341204, 341200, '颍泉区', '341204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341221, 341200, '临泉县', '341221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341222, 341200, '太和县', '341222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341225, 341200, '阜南县', '341225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341226, 341200, '颍上县', '341226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341271, 341200, '阜阳合肥现代产业园区', '341271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341272, 341200, '阜阳经济技术开发区', '341272', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341282, 341200, '界首市', '341282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341300, 340000, '宿州市', '341300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341301, 341300, '市辖区', '341301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341302, 341300, '埇桥区', '341302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341321, 341300, '砀山县', '341321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341322, 341300, '萧县', '341322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341323, 341300, '灵璧县', '341323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341324, 341300, '泗县', '341324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341371, 341300, '宿州马鞍山现代产业园区', '341371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341372, 341300, '宿州经济技术开发区', '341372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341500, 340000, '六安市', '341500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341501, 341500, '市辖区', '341501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341502, 341500, '金安区', '341502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341503, 341500, '裕安区', '341503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341504, 341500, '叶集区', '341504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341522, 341500, '霍邱县', '341522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341523, 341500, '舒城县', '341523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341524, 341500, '金寨县', '341524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341525, 341500, '霍山县', '341525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341600, 340000, '亳州市', '341600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341601, 341600, '市辖区', '341601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341602, 341600, '谯城区', '341602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341621, 341600, '涡阳县', '341621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341622, 341600, '蒙城县', '341622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341623, 341600, '利辛县', '341623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341700, 340000, '池州市', '341700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341701, 341700, '市辖区', '341701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341702, 341700, '贵池区', '341702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341721, 341700, '东至县', '341721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341722, 341700, '石台县', '341722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341723, 341700, '青阳县', '341723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341800, 340000, '宣城市', '341800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341801, 341800, '市辖区', '341801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341802, 341800, '宣州区', '341802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341821, 341800, '郎溪县', '341821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341823, 341800, '泾县', '341823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341824, 341800, '绩溪县', '341824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341825, 341800, '旌德县', '341825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341871, 341800, '宣城市经济开发区', '341871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341881, 341800, '宁国市', '341881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (341882, 341800, '广德市', '341882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350000, 1, '福建省', '350000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350100, 350000, '福州市', '350100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350101, 350100, '市辖区', '350101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350102, 350100, '鼓楼区', '350102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350103, 350100, '台江区', '350103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350104, 350100, '仓山区', '350104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350105, 350100, '马尾区', '350105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350111, 350100, '晋安区', '350111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350112, 350100, '长乐区', '350112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350121, 350100, '闽侯县', '350121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350122, 350100, '连江县', '350122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350123, 350100, '罗源县', '350123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350124, 350100, '闽清县', '350124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350125, 350100, '永泰县', '350125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350128, 350100, '平潭县', '350128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350181, 350100, '福清市', '350181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350200, 350000, '厦门市', '350200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350201, 350200, '市辖区', '350201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350203, 350200, '思明区', '350203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350205, 350200, '海沧区', '350205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350206, 350200, '湖里区', '350206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350211, 350200, '集美区', '350211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350212, 350200, '同安区', '350212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350213, 350200, '翔安区', '350213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350300, 350000, '莆田市', '350300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350301, 350300, '市辖区', '350301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350302, 350300, '城厢区', '350302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350303, 350300, '涵江区', '350303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350304, 350300, '荔城区', '350304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350305, 350300, '秀屿区', '350305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350322, 350300, '仙游县', '350322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350400, 350000, '三明市', '350400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350401, 350400, '市辖区', '350401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350402, 350400, '梅列区', '350402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350403, 350400, '三元区', '350403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350421, 350400, '明溪县', '350421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350423, 350400, '清流县', '350423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350424, 350400, '宁化县', '350424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350425, 350400, '大田县', '350425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350426, 350400, '尤溪县', '350426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350427, 350400, '沙县', '350427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350428, 350400, '将乐县', '350428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350429, 350400, '泰宁县', '350429', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350430, 350400, '建宁县', '350430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350481, 350400, '永安市', '350481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350500, 350000, '泉州市', '350500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350501, 350500, '市辖区', '350501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350502, 350500, '鲤城区', '350502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350503, 350500, '丰泽区', '350503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350504, 350500, '洛江区', '350504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350505, 350500, '泉港区', '350505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350521, 350500, '惠安县', '350521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350524, 350500, '安溪县', '350524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350525, 350500, '永春县', '350525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350526, 350500, '德化县', '350526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350527, 350500, '金门县', '350527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350581, 350500, '石狮市', '350581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350582, 350500, '晋江市', '350582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350583, 350500, '南安市', '350583', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350600, 350000, '漳州市', '350600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350601, 350600, '市辖区', '350601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350602, 350600, '芗城区', '350602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350603, 350600, '龙文区', '350603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350622, 350600, '云霄县', '350622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350623, 350600, '漳浦县', '350623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350624, 350600, '诏安县', '350624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350625, 350600, '长泰县', '350625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350626, 350600, '东山县', '350626', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350627, 350600, '南靖县', '350627', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350628, 350600, '平和县', '350628', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350629, 350600, '华安县', '350629', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350681, 350600, '龙海市', '350681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350700, 350000, '南平市', '350700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350701, 350700, '市辖区', '350701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350702, 350700, '延平区', '350702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350703, 350700, '建阳区', '350703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350721, 350700, '顺昌县', '350721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350722, 350700, '浦城县', '350722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350723, 350700, '光泽县', '350723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350724, 350700, '松溪县', '350724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350725, 350700, '政和县', '350725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350781, 350700, '邵武市', '350781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350782, 350700, '武夷山市', '350782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350783, 350700, '建瓯市', '350783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350800, 350000, '龙岩市', '350800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350801, 350800, '市辖区', '350801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350802, 350800, '新罗区', '350802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350803, 350800, '永定区', '350803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350821, 350800, '长汀县', '350821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350823, 350800, '上杭县', '350823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350824, 350800, '武平县', '350824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350825, 350800, '连城县', '350825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350881, 350800, '漳平市', '350881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350900, 350000, '宁德市', '350900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350901, 350900, '市辖区', '350901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350902, 350900, '蕉城区', '350902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350921, 350900, '霞浦县', '350921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350922, 350900, '古田县', '350922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350923, 350900, '屏南县', '350923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350924, 350900, '寿宁县', '350924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350925, 350900, '周宁县', '350925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350926, 350900, '柘荣县', '350926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350981, 350900, '福安市', '350981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (350982, 350900, '福鼎市', '350982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360000, 1, '江西省', '360000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360100, 360000, '南昌市', '360100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360101, 360100, '市辖区', '360101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360102, 360100, '东湖区', '360102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360103, 360100, '西湖区', '360103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360104, 360100, '青云谱区', '360104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360105, 360100, '湾里区', '360105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360111, 360100, '青山湖区', '360111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360112, 360100, '新建区', '360112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360121, 360100, '南昌县', '360121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360123, 360100, '安义县', '360123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360124, 360100, '进贤县', '360124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360200, 360000, '景德镇市', '360200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360201, 360200, '市辖区', '360201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360202, 360200, '昌江区', '360202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360203, 360200, '珠山区', '360203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360222, 360200, '浮梁县', '360222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360281, 360200, '乐平市', '360281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360300, 360000, '萍乡市', '360300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360301, 360300, '市辖区', '360301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360302, 360300, '安源区', '360302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360313, 360300, '湘东区', '360313', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360321, 360300, '莲花县', '360321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360322, 360300, '上栗县', '360322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360323, 360300, '芦溪县', '360323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360400, 360000, '九江市', '360400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360401, 360400, '市辖区', '360401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360402, 360400, '濂溪区', '360402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360403, 360400, '浔阳区', '360403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360404, 360400, '柴桑区', '360404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360423, 360400, '武宁县', '360423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360424, 360400, '修水县', '360424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360425, 360400, '永修县', '360425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360426, 360400, '德安县', '360426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360428, 360400, '都昌县', '360428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360429, 360400, '湖口县', '360429', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360430, 360400, '彭泽县', '360430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360481, 360400, '瑞昌市', '360481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360482, 360400, '共青城市', '360482', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360483, 360400, '庐山市', '360483', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360500, 360000, '新余市', '360500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360501, 360500, '市辖区', '360501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360502, 360500, '渝水区', '360502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360521, 360500, '分宜县', '360521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360600, 360000, '鹰潭市', '360600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360601, 360600, '市辖区', '360601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360602, 360600, '月湖区', '360602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360603, 360600, '余江区', '360603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360681, 360600, '贵溪市', '360681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360700, 360000, '赣州市', '360700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360701, 360700, '市辖区', '360701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360702, 360700, '章贡区', '360702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360703, 360700, '南康区', '360703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360704, 360700, '赣县区', '360704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360722, 360700, '信丰县', '360722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360723, 360700, '大余县', '360723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360724, 360700, '上犹县', '360724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360725, 360700, '崇义县', '360725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360726, 360700, '安远县', '360726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360727, 360700, '龙南县', '360727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360728, 360700, '定南县', '360728', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360729, 360700, '全南县', '360729', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360730, 360700, '宁都县', '360730', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360731, 360700, '于都县', '360731', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360732, 360700, '兴国县', '360732', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360733, 360700, '会昌县', '360733', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360734, 360700, '寻乌县', '360734', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360735, 360700, '石城县', '360735', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360781, 360700, '瑞金市', '360781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360800, 360000, '吉安市', '360800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360801, 360800, '市辖区', '360801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360802, 360800, '吉州区', '360802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360803, 360800, '青原区', '360803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360821, 360800, '吉安县', '360821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360822, 360800, '吉水县', '360822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360823, 360800, '峡江县', '360823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360824, 360800, '新干县', '360824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360825, 360800, '永丰县', '360825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360826, 360800, '泰和县', '360826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360827, 360800, '遂川县', '360827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360828, 360800, '万安县', '360828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360829, 360800, '安福县', '360829', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360830, 360800, '永新县', '360830', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360881, 360800, '井冈山市', '360881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360900, 360000, '宜春市', '360900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360901, 360900, '市辖区', '360901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360902, 360900, '袁州区', '360902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360921, 360900, '奉新县', '360921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360922, 360900, '万载县', '360922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360923, 360900, '上高县', '360923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360924, 360900, '宜丰县', '360924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360925, 360900, '靖安县', '360925', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360926, 360900, '铜鼓县', '360926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360981, 360900, '丰城市', '360981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360982, 360900, '樟树市', '360982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (360983, 360900, '高安市', '360983', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361000, 360000, '抚州市', '361000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361001, 361000, '市辖区', '361001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361002, 361000, '临川区', '361002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361003, 361000, '东乡区', '361003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361021, 361000, '南城县', '361021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361022, 361000, '黎川县', '361022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361023, 361000, '南丰县', '361023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361024, 361000, '崇仁县', '361024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361025, 361000, '乐安县', '361025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361026, 361000, '宜黄县', '361026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361027, 361000, '金溪县', '361027', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361028, 361000, '资溪县', '361028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361030, 361000, '广昌县', '361030', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361100, 360000, '上饶市', '361100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361101, 361100, '市辖区', '361101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361102, 361100, '信州区', '361102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361103, 361100, '广丰区', '361103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361104, 361100, '广信区', '361104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361123, 361100, '玉山县', '361123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361124, 361100, '铅山县', '361124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361125, 361100, '横峰县', '361125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361126, 361100, '弋阳县', '361126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361127, 361100, '余干县', '361127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361128, 361100, '鄱阳县', '361128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361129, 361100, '万年县', '361129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361130, 361100, '婺源县', '361130', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (361181, 361100, '德兴市', '361181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370000, 1, '山东省', '370000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370100, 370000, '济南市', '370100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370101, 370100, '市辖区', '370101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370102, 370100, '历下区', '370102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370103, 370100, '市中区', '370103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370104, 370100, '槐荫区', '370104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370105, 370100, '天桥区', '370105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370112, 370100, '历城区', '370112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370113, 370100, '长清区', '370113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370114, 370100, '章丘区', '370114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370115, 370100, '济阳区', '370115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370116, 370100, '莱芜区', '370116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370117, 370100, '钢城区', '370117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370124, 370100, '平阴县', '370124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370126, 370100, '商河县', '370126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370171, 370100, '济南高新技术产业开发区', '370171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370200, 370000, '青岛市', '370200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370201, 370200, '市辖区', '370201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370202, 370200, '市南区', '370202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370203, 370200, '市北区', '370203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370211, 370200, '黄岛区', '370211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370212, 370200, '崂山区', '370212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370213, 370200, '李沧区', '370213', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370214, 370200, '城阳区', '370214', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370215, 370200, '即墨区', '370215', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370271, 370200, '青岛高新技术产业开发区', '370271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370281, 370200, '胶州市', '370281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370283, 370200, '平度市', '370283', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370285, 370200, '莱西市', '370285', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370300, 370000, '淄博市', '370300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370301, 370300, '市辖区', '370301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370302, 370300, '淄川区', '370302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370303, 370300, '张店区', '370303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370304, 370300, '博山区', '370304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370305, 370300, '临淄区', '370305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370306, 370300, '周村区', '370306', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370321, 370300, '桓台县', '370321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370322, 370300, '高青县', '370322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370323, 370300, '沂源县', '370323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370400, 370000, '枣庄市', '370400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370401, 370400, '市辖区', '370401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370402, 370400, '市中区', '370402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370403, 370400, '薛城区', '370403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370404, 370400, '峄城区', '370404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370405, 370400, '台儿庄区', '370405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370406, 370400, '山亭区', '370406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370481, 370400, '滕州市', '370481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370500, 370000, '东营市', '370500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370501, 370500, '市辖区', '370501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370502, 370500, '东营区', '370502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370503, 370500, '河口区', '370503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370505, 370500, '垦利区', '370505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370522, 370500, '利津县', '370522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370523, 370500, '广饶县', '370523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370571, 370500, '东营经济技术开发区', '370571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370572, 370500, '东营港经济开发区', '370572', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370600, 370000, '烟台市', '370600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370601, 370600, '市辖区', '370601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370602, 370600, '芝罘区', '370602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370611, 370600, '福山区', '370611', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370612, 370600, '牟平区', '370612', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370613, 370600, '莱山区', '370613', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370634, 370600, '长岛县', '370634', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370671, 370600, '烟台高新技术产业开发区', '370671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370672, 370600, '烟台经济技术开发区', '370672', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370681, 370600, '龙口市', '370681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370682, 370600, '莱阳市', '370682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370683, 370600, '莱州市', '370683', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370684, 370600, '蓬莱市', '370684', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370685, 370600, '招远市', '370685', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370686, 370600, '栖霞市', '370686', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370687, 370600, '海阳市', '370687', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370700, 370000, '潍坊市', '370700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370701, 370700, '市辖区', '370701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370702, 370700, '潍城区', '370702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370703, 370700, '寒亭区', '370703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370704, 370700, '坊子区', '370704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370705, 370700, '奎文区', '370705', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370724, 370700, '临朐县', '370724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370725, 370700, '昌乐县', '370725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370772, 370700, '潍坊滨海经济技术开发区', '370772', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370781, 370700, '青州市', '370781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370782, 370700, '诸城市', '370782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370783, 370700, '寿光市', '370783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370784, 370700, '安丘市', '370784', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370785, 370700, '高密市', '370785', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370786, 370700, '昌邑市', '370786', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370800, 370000, '济宁市', '370800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370801, 370800, '市辖区', '370801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370811, 370800, '任城区', '370811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370812, 370800, '兖州区', '370812', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370826, 370800, '微山县', '370826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370827, 370800, '鱼台县', '370827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370828, 370800, '金乡县', '370828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370829, 370800, '嘉祥县', '370829', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370830, 370800, '汶上县', '370830', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370831, 370800, '泗水县', '370831', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370832, 370800, '梁山县', '370832', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370871, 370800, '济宁高新技术产业开发区', '370871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370881, 370800, '曲阜市', '370881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370883, 370800, '邹城市', '370883', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370900, 370000, '泰安市', '370900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370901, 370900, '市辖区', '370901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370902, 370900, '泰山区', '370902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370911, 370900, '岱岳区', '370911', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370921, 370900, '宁阳县', '370921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370923, 370900, '东平县', '370923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370982, 370900, '新泰市', '370982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (370983, 370900, '肥城市', '370983', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371000, 370000, '威海市', '371000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371001, 371000, '市辖区', '371001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371002, 371000, '环翠区', '371002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371003, 371000, '文登区', '371003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371071, 371000, '威海火炬高技术产业开发区', '371071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371072, 371000, '威海经济技术开发区', '371072', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371073, 371000, '威海临港经济技术开发区', '371073', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371082, 371000, '荣成市', '371082', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371083, 371000, '乳山市', '371083', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371100, 370000, '日照市', '371100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371101, 371100, '市辖区', '371101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371102, 371100, '东港区', '371102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371103, 371100, '岚山区', '371103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371121, 371100, '五莲县', '371121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371122, 371100, '莒县', '371122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371171, 371100, '日照经济技术开发区', '371171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371300, 370000, '临沂市', '371300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371301, 371300, '市辖区', '371301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371302, 371300, '兰山区', '371302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371311, 371300, '罗庄区', '371311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371312, 371300, '河东区', '371312', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371321, 371300, '沂南县', '371321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371322, 371300, '郯城县', '371322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371323, 371300, '沂水县', '371323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371324, 371300, '兰陵县', '371324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371325, 371300, '费县', '371325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371326, 371300, '平邑县', '371326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371327, 371300, '莒南县', '371327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371328, 371300, '蒙阴县', '371328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371329, 371300, '临沭县', '371329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371371, 371300, '临沂高新技术产业开发区', '371371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371372, 371300, '临沂经济技术开发区', '371372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371373, 371300, '临沂临港经济开发区', '371373', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371400, 370000, '德州市', '371400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371401, 371400, '市辖区', '371401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371402, 371400, '德城区', '371402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371403, 371400, '陵城区', '371403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371422, 371400, '宁津县', '371422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371423, 371400, '庆云县', '371423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371424, 371400, '临邑县', '371424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371425, 371400, '齐河县', '371425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371426, 371400, '平原县', '371426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371427, 371400, '夏津县', '371427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371428, 371400, '武城县', '371428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371471, 371400, '德州经济技术开发区', '371471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371472, 371400, '德州运河经济开发区', '371472', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371481, 371400, '乐陵市', '371481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371482, 371400, '禹城市', '371482', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371500, 370000, '聊城市', '371500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371501, 371500, '市辖区', '371501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371502, 371500, '东昌府区', '371502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371503, 371500, '茌平区', '371503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371521, 371500, '阳谷县', '371521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371522, 371500, '莘县', '371522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371524, 371500, '东阿县', '371524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371525, 371500, '冠县', '371525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371526, 371500, '高唐县', '371526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371581, 371500, '临清市', '371581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371600, 370000, '滨州市', '371600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371601, 371600, '市辖区', '371601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371602, 371600, '滨城区', '371602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371603, 371600, '沾化区', '371603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371621, 371600, '惠民县', '371621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371622, 371600, '阳信县', '371622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371623, 371600, '无棣县', '371623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371625, 371600, '博兴县', '371625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371681, 371600, '邹平市', '371681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371700, 370000, '菏泽市', '371700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371701, 371700, '市辖区', '371701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371702, 371700, '牡丹区', '371702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371703, 371700, '定陶区', '371703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371721, 371700, '曹县', '371721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371722, 371700, '单县', '371722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371723, 371700, '成武县', '371723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371724, 371700, '巨野县', '371724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371725, 371700, '郓城县', '371725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371726, 371700, '鄄城县', '371726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371728, 371700, '东明县', '371728', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371771, 371700, '菏泽经济技术开发区', '371771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (371772, 371700, '菏泽高新技术开发区', '371772', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410000, 1, '河南省', '410000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410100, 410000, '郑州市', '410100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410101, 410100, '市辖区', '410101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410102, 410100, '中原区', '410102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410103, 410100, '二七区', '410103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410104, 410100, '管城回族区', '410104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410105, 410100, '金水区', '410105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410106, 410100, '上街区', '410106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410108, 410100, '惠济区', '410108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410122, 410100, '中牟县', '410122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410171, 410100, '郑州经济技术开发区', '410171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410172, 410100, '郑州高新技术产业开发区', '410172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410173, 410100, '郑州航空港经济综合实验区', '410173', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410181, 410100, '巩义市', '410181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410182, 410100, '荥阳市', '410182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410183, 410100, '新密市', '410183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410184, 410100, '新郑市', '410184', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410185, 410100, '登封市', '410185', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410200, 410000, '开封市', '410200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410201, 410200, '市辖区', '410201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410202, 410200, '龙亭区', '410202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410203, 410200, '顺河回族区', '410203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410204, 410200, '鼓楼区', '410204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410205, 410200, '禹王台区', '410205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410212, 410200, '祥符区', '410212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410221, 410200, '杞县', '410221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410222, 410200, '通许县', '410222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410223, 410200, '尉氏县', '410223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410225, 410200, '兰考县', '410225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410300, 410000, '洛阳市', '410300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410301, 410300, '市辖区', '410301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410302, 410300, '老城区', '410302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410303, 410300, '西工区', '410303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410304, 410300, '瀍河回族区', '410304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410305, 410300, '涧西区', '410305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410306, 410300, '吉利区', '410306', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410311, 410300, '洛龙区', '410311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410322, 410300, '孟津县', '410322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410323, 410300, '新安县', '410323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410324, 410300, '栾川县', '410324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410325, 410300, '嵩县', '410325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410326, 410300, '汝阳县', '410326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410327, 410300, '宜阳县', '410327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410328, 410300, '洛宁县', '410328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410329, 410300, '伊川县', '410329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410371, 410300, '洛阳高新技术产业开发区', '410371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410381, 410300, '偃师市', '410381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410400, 410000, '平顶山市', '410400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410401, 410400, '市辖区', '410401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410402, 410400, '新华区', '410402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410403, 410400, '卫东区', '410403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410404, 410400, '石龙区', '410404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410411, 410400, '湛河区', '410411', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410421, 410400, '宝丰县', '410421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410422, 410400, '叶县', '410422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410423, 410400, '鲁山县', '410423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410425, 410400, '郏县', '410425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410471, 410400, '平顶山高新技术产业开发区', '410471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410472, 410400, '平顶山市城乡一体化示范区', '410472', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410481, 410400, '舞钢市', '410481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410482, 410400, '汝州市', '410482', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410500, 410000, '安阳市', '410500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410501, 410500, '市辖区', '410501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410502, 410500, '文峰区', '410502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410503, 410500, '北关区', '410503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410505, 410500, '殷都区', '410505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410506, 410500, '龙安区', '410506', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410522, 410500, '安阳县', '410522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410523, 410500, '汤阴县', '410523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410526, 410500, '滑县', '410526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410527, 410500, '内黄县', '410527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410571, 410500, '安阳高新技术产业开发区', '410571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410581, 410500, '林州市', '410581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410600, 410000, '鹤壁市', '410600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410601, 410600, '市辖区', '410601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410602, 410600, '鹤山区', '410602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410603, 410600, '山城区', '410603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410611, 410600, '淇滨区', '410611', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410621, 410600, '浚县', '410621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410622, 410600, '淇县', '410622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410671, 410600, '鹤壁经济技术开发区', '410671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410700, 410000, '新乡市', '410700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410701, 410700, '市辖区', '410701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410702, 410700, '红旗区', '410702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410703, 410700, '卫滨区', '410703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410704, 410700, '凤泉区', '410704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410711, 410700, '牧野区', '410711', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410721, 410700, '新乡县', '410721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410724, 410700, '获嘉县', '410724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410725, 410700, '原阳县', '410725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410726, 410700, '延津县', '410726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410727, 410700, '封丘县', '410727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410771, 410700, '新乡高新技术产业开发区', '410771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410772, 410700, '新乡经济技术开发区', '410772', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410773, 410700, '新乡市平原城乡一体化示范区', '410773', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410781, 410700, '卫辉市', '410781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410782, 410700, '辉县市', '410782', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410783, 410700, '长垣市', '410783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410800, 410000, '焦作市', '410800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410801, 410800, '市辖区', '410801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410802, 410800, '解放区', '410802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410803, 410800, '中站区', '410803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410804, 410800, '马村区', '410804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410811, 410800, '山阳区', '410811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410821, 410800, '修武县', '410821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410822, 410800, '博爱县', '410822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410823, 410800, '武陟县', '410823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410825, 410800, '温县', '410825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410871, 410800, '焦作城乡一体化示范区', '410871', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410882, 410800, '沁阳市', '410882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410883, 410800, '孟州市', '410883', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410900, 410000, '濮阳市', '410900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410901, 410900, '市辖区', '410901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410902, 410900, '华龙区', '410902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410922, 410900, '清丰县', '410922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410923, 410900, '南乐县', '410923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410926, 410900, '范县', '410926', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410927, 410900, '台前县', '410927', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410928, 410900, '濮阳县', '410928', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410971, 410900, '河南濮阳工业园区', '410971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (410972, 410900, '濮阳经济技术开发区', '410972', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411000, 410000, '许昌市', '411000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411001, 411000, '市辖区', '411001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411002, 411000, '魏都区', '411002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411003, 411000, '建安区', '411003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411024, 411000, '鄢陵县', '411024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411025, 411000, '襄城县', '411025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411071, 411000, '许昌经济技术开发区', '411071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411081, 411000, '禹州市', '411081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411082, 411000, '长葛市', '411082', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411100, 410000, '漯河市', '411100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411101, 411100, '市辖区', '411101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411102, 411100, '源汇区', '411102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411103, 411100, '郾城区', '411103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411104, 411100, '召陵区', '411104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411121, 411100, '舞阳县', '411121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411122, 411100, '临颍县', '411122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411171, 411100, '漯河经济技术开发区', '411171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411200, 410000, '三门峡市', '411200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411201, 411200, '市辖区', '411201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411202, 411200, '湖滨区', '411202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411203, 411200, '陕州区', '411203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411221, 411200, '渑池县', '411221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411224, 411200, '卢氏县', '411224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411271, 411200, '河南三门峡经济开发区', '411271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411281, 411200, '义马市', '411281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411282, 411200, '灵宝市', '411282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411300, 410000, '南阳市', '411300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411301, 411300, '市辖区', '411301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411302, 411300, '宛城区', '411302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411303, 411300, '卧龙区', '411303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411321, 411300, '南召县', '411321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411322, 411300, '方城县', '411322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411323, 411300, '西峡县', '411323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411324, 411300, '镇平县', '411324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411325, 411300, '内乡县', '411325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411326, 411300, '淅川县', '411326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411327, 411300, '社旗县', '411327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411328, 411300, '唐河县', '411328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411329, 411300, '新野县', '411329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411330, 411300, '桐柏县', '411330', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411371, 411300, '南阳高新技术产业开发区', '411371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411372, 411300, '南阳市城乡一体化示范区', '411372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411381, 411300, '邓州市', '411381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411400, 410000, '商丘市', '411400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411401, 411400, '市辖区', '411401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411402, 411400, '梁园区', '411402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411403, 411400, '睢阳区', '411403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411421, 411400, '民权县', '411421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411422, 411400, '睢县', '411422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411423, 411400, '宁陵县', '411423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411424, 411400, '柘城县', '411424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411425, 411400, '虞城县', '411425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411426, 411400, '夏邑县', '411426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411471, 411400, '豫东综合物流产业聚集区', '411471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411472, 411400, '河南商丘经济开发区', '411472', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411481, 411400, '永城市', '411481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411500, 410000, '信阳市', '411500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411501, 411500, '市辖区', '411501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411502, 411500, '浉河区', '411502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411503, 411500, '平桥区', '411503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411521, 411500, '罗山县', '411521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411522, 411500, '光山县', '411522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411523, 411500, '新县', '411523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411524, 411500, '商城县', '411524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411525, 411500, '固始县', '411525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411526, 411500, '潢川县', '411526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411527, 411500, '淮滨县', '411527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411528, 411500, '息县', '411528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411571, 411500, '信阳高新技术产业开发区', '411571', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411600, 410000, '周口市', '411600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411601, 411600, '市辖区', '411601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411602, 411600, '川汇区', '411602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411603, 411600, '淮阳区', '411603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411621, 411600, '扶沟县', '411621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411622, 411600, '西华县', '411622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411623, 411600, '商水县', '411623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411624, 411600, '沈丘县', '411624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411625, 411600, '郸城县', '411625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411627, 411600, '太康县', '411627', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411628, 411600, '鹿邑县', '411628', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411671, 411600, '河南周口经济开发区', '411671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411681, 411600, '项城市', '411681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411700, 410000, '驻马店市', '411700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411701, 411700, '市辖区', '411701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411702, 411700, '驿城区', '411702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411721, 411700, '西平县', '411721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411722, 411700, '上蔡县', '411722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411723, 411700, '平舆县', '411723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411724, 411700, '正阳县', '411724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411725, 411700, '确山县', '411725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411726, 411700, '泌阳县', '411726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411727, 411700, '汝南县', '411727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411728, 411700, '遂平县', '411728', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411729, 411700, '新蔡县', '411729', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (411771, 411700, '河南驻马店经济开发区', '411771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (419000, 410000, '省直辖县级行政区划', '419000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (419001, 419000, '济源市', '419001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420000, 1, '湖北省', '420000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420100, 420000, '武汉市', '420100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420101, 420100, '市辖区', '420101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420102, 420100, '江岸区', '420102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420103, 420100, '江汉区', '420103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420104, 420100, '硚口区', '420104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420105, 420100, '汉阳区', '420105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420106, 420100, '武昌区', '420106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420107, 420100, '青山区', '420107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420111, 420100, '洪山区', '420111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420112, 420100, '东西湖区', '420112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420113, 420100, '汉南区', '420113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420114, 420100, '蔡甸区', '420114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420115, 420100, '江夏区', '420115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420116, 420100, '黄陂区', '420116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420117, 420100, '新洲区', '420117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420200, 420000, '黄石市', '420200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420201, 420200, '市辖区', '420201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420202, 420200, '黄石港区', '420202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420203, 420200, '西塞山区', '420203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420204, 420200, '下陆区', '420204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420205, 420200, '铁山区', '420205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420222, 420200, '阳新县', '420222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420281, 420200, '大冶市', '420281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420300, 420000, '十堰市', '420300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420301, 420300, '市辖区', '420301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420302, 420300, '茅箭区', '420302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420303, 420300, '张湾区', '420303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420304, 420300, '郧阳区', '420304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420322, 420300, '郧西县', '420322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420323, 420300, '竹山县', '420323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420324, 420300, '竹溪县', '420324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420325, 420300, '房县', '420325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420381, 420300, '丹江口市', '420381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420500, 420000, '宜昌市', '420500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420501, 420500, '市辖区', '420501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420502, 420500, '西陵区', '420502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420503, 420500, '伍家岗区', '420503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420504, 420500, '点军区', '420504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420505, 420500, '猇亭区', '420505', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420506, 420500, '夷陵区', '420506', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420525, 420500, '远安县', '420525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420526, 420500, '兴山县', '420526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420527, 420500, '秭归县', '420527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420528, 420500, '长阳土家族自治县', '420528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420529, 420500, '五峰土家族自治县', '420529', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420581, 420500, '宜都市', '420581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420582, 420500, '当阳市', '420582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420583, 420500, '枝江市', '420583', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420600, 420000, '襄阳市', '420600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420601, 420600, '市辖区', '420601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420602, 420600, '襄城区', '420602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420606, 420600, '樊城区', '420606', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420607, 420600, '襄州区', '420607', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420624, 420600, '南漳县', '420624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420625, 420600, '谷城县', '420625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420626, 420600, '保康县', '420626', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420682, 420600, '老河口市', '420682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420683, 420600, '枣阳市', '420683', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420684, 420600, '宜城市', '420684', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420700, 420000, '鄂州市', '420700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420701, 420700, '市辖区', '420701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420702, 420700, '梁子湖区', '420702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420703, 420700, '华容区', '420703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420704, 420700, '鄂城区', '420704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420800, 420000, '荆门市', '420800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420801, 420800, '市辖区', '420801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420802, 420800, '东宝区', '420802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420804, 420800, '掇刀区', '420804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420822, 420800, '沙洋县', '420822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420881, 420800, '钟祥市', '420881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420882, 420800, '京山市', '420882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420900, 420000, '孝感市', '420900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420901, 420900, '市辖区', '420901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420902, 420900, '孝南区', '420902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420921, 420900, '孝昌县', '420921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420922, 420900, '大悟县', '420922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420923, 420900, '云梦县', '420923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420981, 420900, '应城市', '420981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420982, 420900, '安陆市', '420982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (420984, 420900, '汉川市', '420984', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421000, 420000, '荆州市', '421000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421001, 421000, '市辖区', '421001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421002, 421000, '沙市区', '421002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421003, 421000, '荆州区', '421003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421022, 421000, '公安县', '421022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421023, 421000, '监利县', '421023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421024, 421000, '江陵县', '421024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421071, 421000, '荆州经济技术开发区', '421071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421081, 421000, '石首市', '421081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421083, 421000, '洪湖市', '421083', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421087, 421000, '松滋市', '421087', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421100, 420000, '黄冈市', '421100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421101, 421100, '市辖区', '421101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421102, 421100, '黄州区', '421102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421121, 421100, '团风县', '421121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421122, 421100, '红安县', '421122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421123, 421100, '罗田县', '421123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421124, 421100, '英山县', '421124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421125, 421100, '浠水县', '421125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421126, 421100, '蕲春县', '421126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421127, 421100, '黄梅县', '421127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421171, 421100, '龙感湖管理区', '421171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421181, 421100, '麻城市', '421181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421182, 421100, '武穴市', '421182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421200, 420000, '咸宁市', '421200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421201, 421200, '市辖区', '421201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421202, 421200, '咸安区', '421202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421221, 421200, '嘉鱼县', '421221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421222, 421200, '通城县', '421222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421223, 421200, '崇阳县', '421223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421224, 421200, '通山县', '421224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421281, 421200, '赤壁市', '421281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421300, 420000, '随州市', '421300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421301, 421300, '市辖区', '421301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421303, 421300, '曾都区', '421303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421321, 421300, '随县', '421321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (421381, 421300, '广水市', '421381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422800, 420000, '恩施土家族苗族自治州', '422800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422801, 422800, '恩施市', '422801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422802, 422800, '利川市', '422802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422822, 422800, '建始县', '422822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422823, 422800, '巴东县', '422823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422825, 422800, '宣恩县', '422825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422826, 422800, '咸丰县', '422826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422827, 422800, '来凤县', '422827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (422828, 422800, '鹤峰县', '422828', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (429000, 420000, '省直辖县级行政区划', '429000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (429004, 429000, '仙桃市', '429004', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (429005, 429000, '潜江市', '429005', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (429006, 429000, '天门市', '429006', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (429021, 429000, '神农架林区', '429021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430000, 1, '湖南省', '430000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430100, 430000, '长沙市', '430100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430101, 430100, '市辖区', '430101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430102, 430100, '芙蓉区', '430102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430103, 430100, '天心区', '430103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430104, 430100, '岳麓区', '430104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430105, 430100, '开福区', '430105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430111, 430100, '雨花区', '430111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430112, 430100, '望城区', '430112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430121, 430100, '长沙县', '430121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430181, 430100, '浏阳市', '430181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430182, 430100, '宁乡市', '430182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430200, 430000, '株洲市', '430200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430201, 430200, '市辖区', '430201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430202, 430200, '荷塘区', '430202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430203, 430200, '芦淞区', '430203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430204, 430200, '石峰区', '430204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430211, 430200, '天元区', '430211', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430212, 430200, '渌口区', '430212', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430223, 430200, '攸县', '430223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430224, 430200, '茶陵县', '430224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430225, 430200, '炎陵县', '430225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430271, 430200, '云龙示范区', '430271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430281, 430200, '醴陵市', '430281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430300, 430000, '湘潭市', '430300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430301, 430300, '市辖区', '430301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430302, 430300, '雨湖区', '430302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430304, 430300, '岳塘区', '430304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430321, 430300, '湘潭县', '430321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430371, 430300, '湖南湘潭高新技术产业园区', '430371', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430372, 430300, '湘潭昭山示范区', '430372', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430373, 430300, '湘潭九华示范区', '430373', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430381, 430300, '湘乡市', '430381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430382, 430300, '韶山市', '430382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430400, 430000, '衡阳市', '430400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430401, 430400, '市辖区', '430401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430405, 430400, '珠晖区', '430405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430406, 430400, '雁峰区', '430406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430407, 430400, '石鼓区', '430407', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430408, 430400, '蒸湘区', '430408', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430412, 430400, '南岳区', '430412', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430421, 430400, '衡阳县', '430421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430422, 430400, '衡南县', '430422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430423, 430400, '衡山县', '430423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430424, 430400, '衡东县', '430424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430426, 430400, '祁东县', '430426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430471, 430400, '衡阳综合保税区', '430471', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430472, 430400, '湖南衡阳高新技术产业园区', '430472', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430473, 430400, '湖南衡阳松木经济开发区', '430473', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430481, 430400, '耒阳市', '430481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430482, 430400, '常宁市', '430482', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430500, 430000, '邵阳市', '430500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430501, 430500, '市辖区', '430501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430502, 430500, '双清区', '430502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430503, 430500, '大祥区', '430503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430511, 430500, '北塔区', '430511', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430522, 430500, '新邵县', '430522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430523, 430500, '邵阳县', '430523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430524, 430500, '隆回县', '430524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430525, 430500, '洞口县', '430525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430527, 430500, '绥宁县', '430527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430528, 430500, '新宁县', '430528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430529, 430500, '城步苗族自治县', '430529', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430581, 430500, '武冈市', '430581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430582, 430500, '邵东市', '430582', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430600, 430000, '岳阳市', '430600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430601, 430600, '市辖区', '430601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430602, 430600, '岳阳楼区', '430602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430603, 430600, '云溪区', '430603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430611, 430600, '君山区', '430611', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430621, 430600, '岳阳县', '430621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430623, 430600, '华容县', '430623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430624, 430600, '湘阴县', '430624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430626, 430600, '平江县', '430626', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430671, 430600, '岳阳市屈原管理区', '430671', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430681, 430600, '汨罗市', '430681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430682, 430600, '临湘市', '430682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430700, 430000, '常德市', '430700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430701, 430700, '市辖区', '430701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430702, 430700, '武陵区', '430702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430703, 430700, '鼎城区', '430703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430721, 430700, '安乡县', '430721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430722, 430700, '汉寿县', '430722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430723, 430700, '澧县', '430723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430724, 430700, '临澧县', '430724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430725, 430700, '桃源县', '430725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430726, 430700, '石门县', '430726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430771, 430700, '常德市西洞庭管理区', '430771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430781, 430700, '津市市', '430781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430800, 430000, '张家界市', '430800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430801, 430800, '市辖区', '430801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430802, 430800, '永定区', '430802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430811, 430800, '武陵源区', '430811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430821, 430800, '慈利县', '430821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430822, 430800, '桑植县', '430822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430900, 430000, '益阳市', '430900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430901, 430900, '市辖区', '430901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430902, 430900, '资阳区', '430902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430903, 430900, '赫山区', '430903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430921, 430900, '南县', '430921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430922, 430900, '桃江县', '430922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430923, 430900, '安化县', '430923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430971, 430900, '益阳市大通湖管理区', '430971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430972, 430900, '湖南益阳高新技术产业园区', '430972', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (430981, 430900, '沅江市', '430981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431000, 430000, '郴州市', '431000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431001, 431000, '市辖区', '431001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431002, 431000, '北湖区', '431002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431003, 431000, '苏仙区', '431003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431021, 431000, '桂阳县', '431021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431022, 431000, '宜章县', '431022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431023, 431000, '永兴县', '431023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431024, 431000, '嘉禾县', '431024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431025, 431000, '临武县', '431025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431026, 431000, '汝城县', '431026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431027, 431000, '桂东县', '431027', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431028, 431000, '安仁县', '431028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431081, 431000, '资兴市', '431081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431100, 430000, '永州市', '431100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431101, 431100, '市辖区', '431101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431102, 431100, '零陵区', '431102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431103, 431100, '冷水滩区', '431103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431121, 431100, '祁阳县', '431121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431122, 431100, '东安县', '431122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431123, 431100, '双牌县', '431123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431124, 431100, '道县', '431124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431125, 431100, '江永县', '431125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431126, 431100, '宁远县', '431126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431127, 431100, '蓝山县', '431127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431128, 431100, '新田县', '431128', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431129, 431100, '江华瑶族自治县', '431129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431171, 431100, '永州经济技术开发区', '431171', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431172, 431100, '永州市金洞管理区', '431172', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431173, 431100, '永州市回龙圩管理区', '431173', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431200, 430000, '怀化市', '431200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431201, 431200, '市辖区', '431201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431202, 431200, '鹤城区', '431202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431221, 431200, '中方县', '431221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431222, 431200, '沅陵县', '431222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431223, 431200, '辰溪县', '431223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431224, 431200, '溆浦县', '431224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431225, 431200, '会同县', '431225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431226, 431200, '麻阳苗族自治县', '431226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431227, 431200, '新晃侗族自治县', '431227', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431228, 431200, '芷江侗族自治县', '431228', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431229, 431200, '靖州苗族侗族自治县', '431229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431230, 431200, '通道侗族自治县', '431230', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431271, 431200, '怀化市洪江管理区', '431271', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431281, 431200, '洪江市', '431281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431300, 430000, '娄底市', '431300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431301, 431300, '市辖区', '431301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431302, 431300, '娄星区', '431302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431321, 431300, '双峰县', '431321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431322, 431300, '新化县', '431322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431381, 431300, '冷水江市', '431381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (431382, 431300, '涟源市', '431382', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433100, 430000, '湘西土家族苗族自治州', '433100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433101, 433100, '吉首市', '433101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433122, 433100, '泸溪县', '433122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433123, 433100, '凤凰县', '433123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433124, 433100, '花垣县', '433124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433125, 433100, '保靖县', '433125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433126, 433100, '古丈县', '433126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433127, 433100, '永顺县', '433127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433130, 433100, '龙山县', '433130', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (433173, 433100, '湖南永顺经济开发区', '433173', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440000, 1, '广东省', '440000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440100, 440000, '广州市', '440100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440101, 440100, '市辖区', '440101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440103, 440100, '荔湾区', '440103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440104, 440100, '越秀区', '440104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440105, 440100, '海珠区', '440105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440106, 440100, '天河区', '440106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440111, 440100, '白云区', '440111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440112, 440100, '黄埔区', '440112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440113, 440100, '番禺区', '440113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440114, 440100, '花都区', '440114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440115, 440100, '南沙区', '440115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440117, 440100, '从化区', '440117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440118, 440100, '增城区', '440118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440200, 440000, '韶关市', '440200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440201, 440200, '市辖区', '440201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440203, 440200, '武江区', '440203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440204, 440200, '浈江区', '440204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440205, 440200, '曲江区', '440205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440222, 440200, '始兴县', '440222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440224, 440200, '仁化县', '440224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440229, 440200, '翁源县', '440229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440232, 440200, '乳源瑶族自治县', '440232', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440233, 440200, '新丰县', '440233', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440281, 440200, '乐昌市', '440281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440282, 440200, '南雄市', '440282', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440300, 440000, '深圳市', '440300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440301, 440300, '市辖区', '440301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440303, 440300, '罗湖区', '440303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440304, 440300, '福田区', '440304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440305, 440300, '南山区', '440305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440306, 440300, '宝安区', '440306', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440307, 440300, '龙岗区', '440307', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440308, 440300, '盐田区', '440308', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440309, 440300, '龙华区', '440309', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440310, 440300, '坪山区', '440310', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440311, 440300, '光明区', '440311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440400, 440000, '珠海市', '440400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440401, 440400, '市辖区', '440401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440402, 440400, '香洲区', '440402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440403, 440400, '斗门区', '440403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440404, 440400, '金湾区', '440404', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440500, 440000, '汕头市', '440500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440501, 440500, '市辖区', '440501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440507, 440500, '龙湖区', '440507', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440511, 440500, '金平区', '440511', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440512, 440500, '濠江区', '440512', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440513, 440500, '潮阳区', '440513', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440514, 440500, '潮南区', '440514', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440515, 440500, '澄海区', '440515', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440523, 440500, '南澳县', '440523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440600, 440000, '佛山市', '440600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440601, 440600, '市辖区', '440601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440604, 440600, '禅城区', '440604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440605, 440600, '南海区', '440605', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440606, 440600, '顺德区', '440606', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440607, 440600, '三水区', '440607', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440608, 440600, '高明区', '440608', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440700, 440000, '江门市', '440700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440701, 440700, '市辖区', '440701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440703, 440700, '蓬江区', '440703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440704, 440700, '江海区', '440704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440705, 440700, '新会区', '440705', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440781, 440700, '台山市', '440781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440783, 440700, '开平市', '440783', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440784, 440700, '鹤山市', '440784', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440785, 440700, '恩平市', '440785', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440800, 440000, '湛江市', '440800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440801, 440800, '市辖区', '440801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440802, 440800, '赤坎区', '440802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440803, 440800, '霞山区', '440803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440804, 440800, '坡头区', '440804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440811, 440800, '麻章区', '440811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440823, 440800, '遂溪县', '440823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440825, 440800, '徐闻县', '440825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440881, 440800, '廉江市', '440881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440882, 440800, '雷州市', '440882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440883, 440800, '吴川市', '440883', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440900, 440000, '茂名市', '440900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440901, 440900, '市辖区', '440901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440902, 440900, '茂南区', '440902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440904, 440900, '电白区', '440904', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440981, 440900, '高州市', '440981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440982, 440900, '化州市', '440982', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (440983, 440900, '信宜市', '440983', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441200, 440000, '肇庆市', '441200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441201, 441200, '市辖区', '441201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441202, 441200, '端州区', '441202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441203, 441200, '鼎湖区', '441203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441204, 441200, '高要区', '441204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441223, 441200, '广宁县', '441223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441224, 441200, '怀集县', '441224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441225, 441200, '封开县', '441225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441226, 441200, '德庆县', '441226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441284, 441200, '四会市', '441284', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441300, 440000, '惠州市', '441300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441301, 441300, '市辖区', '441301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441302, 441300, '惠城区', '441302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441303, 441300, '惠阳区', '441303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441322, 441300, '博罗县', '441322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441323, 441300, '惠东县', '441323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441324, 441300, '龙门县', '441324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441400, 440000, '梅州市', '441400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441401, 441400, '市辖区', '441401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441402, 441400, '梅江区', '441402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441403, 441400, '梅县区', '441403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441422, 441400, '大埔县', '441422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441423, 441400, '丰顺县', '441423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441424, 441400, '五华县', '441424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441426, 441400, '平远县', '441426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441427, 441400, '蕉岭县', '441427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441481, 441400, '兴宁市', '441481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441500, 440000, '汕尾市', '441500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441501, 441500, '市辖区', '441501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441502, 441500, '城区', '441502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441521, 441500, '海丰县', '441521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441523, 441500, '陆河县', '441523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441581, 441500, '陆丰市', '441581', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441600, 440000, '河源市', '441600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441601, 441600, '市辖区', '441601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441602, 441600, '源城区', '441602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441621, 441600, '紫金县', '441621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441622, 441600, '龙川县', '441622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441623, 441600, '连平县', '441623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441624, 441600, '和平县', '441624', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441625, 441600, '东源县', '441625', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441700, 440000, '阳江市', '441700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441701, 441700, '市辖区', '441701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441702, 441700, '江城区', '441702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441704, 441700, '阳东区', '441704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441721, 441700, '阳西县', '441721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441781, 441700, '阳春市', '441781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441800, 440000, '清远市', '441800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441801, 441800, '市辖区', '441801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441802, 441800, '清城区', '441802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441803, 441800, '清新区', '441803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441821, 441800, '佛冈县', '441821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441823, 441800, '阳山县', '441823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441825, 441800, '连山壮族瑶族自治县', '441825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441826, 441800, '连南瑶族自治县', '441826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441881, 441800, '英德市', '441881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441882, 441800, '连州市', '441882', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441900, 440000, '东莞市', '441900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (442000, 440000, '中山市', '442000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445100, 440000, '潮州市', '445100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445101, 445100, '市辖区', '445101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445102, 445100, '湘桥区', '445102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445103, 445100, '潮安区', '445103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445122, 445100, '饶平县', '445122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445200, 440000, '揭阳市', '445200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445201, 445200, '市辖区', '445201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445202, 445200, '榕城区', '445202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445203, 445200, '揭东区', '445203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445222, 445200, '揭西县', '445222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445224, 445200, '惠来县', '445224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445281, 445200, '普宁市', '445281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445300, 440000, '云浮市', '445300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445301, 445300, '市辖区', '445301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445302, 445300, '云城区', '445302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445303, 445300, '云安区', '445303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445321, 445300, '新兴县', '445321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445322, 445300, '郁南县', '445322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (445381, 445300, '罗定市', '445381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450000, 1, '广西壮族自治区', '450000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450100, 450000, '南宁市', '450100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450101, 450100, '市辖区', '450101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450102, 450100, '兴宁区', '450102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450103, 450100, '青秀区', '450103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450105, 450100, '江南区', '450105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450107, 450100, '西乡塘区', '450107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450108, 450100, '良庆区', '450108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450109, 450100, '邕宁区', '450109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450110, 450100, '武鸣区', '450110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450123, 450100, '隆安县', '450123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450124, 450100, '马山县', '450124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450125, 450100, '上林县', '450125', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450126, 450100, '宾阳县', '450126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450127, 450100, '横县', '450127', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450200, 450000, '柳州市', '450200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450201, 450200, '市辖区', '450201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450202, 450200, '城中区', '450202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450203, 450200, '鱼峰区', '450203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450204, 450200, '柳南区', '450204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450205, 450200, '柳北区', '450205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450206, 450200, '柳江区', '450206', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450222, 450200, '柳城县', '450222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450223, 450200, '鹿寨县', '450223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450224, 450200, '融安县', '450224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450225, 450200, '融水苗族自治县', '450225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450226, 450200, '三江侗族自治县', '450226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450300, 450000, '桂林市', '450300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450301, 450300, '市辖区', '450301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450302, 450300, '秀峰区', '450302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450303, 450300, '叠彩区', '450303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450304, 450300, '象山区', '450304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450305, 450300, '七星区', '450305', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450311, 450300, '雁山区', '450311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450312, 450300, '临桂区', '450312', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450321, 450300, '阳朔县', '450321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450323, 450300, '灵川县', '450323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450324, 450300, '全州县', '450324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450325, 450300, '兴安县', '450325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450326, 450300, '永福县', '450326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450327, 450300, '灌阳县', '450327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450328, 450300, '龙胜各族自治县', '450328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450329, 450300, '资源县', '450329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450330, 450300, '平乐县', '450330', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450332, 450300, '恭城瑶族自治县', '450332', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450381, 450300, '荔浦市', '450381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450400, 450000, '梧州市', '450400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450401, 450400, '市辖区', '450401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450403, 450400, '万秀区', '450403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450405, 450400, '长洲区', '450405', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450406, 450400, '龙圩区', '450406', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450421, 450400, '苍梧县', '450421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450422, 450400, '藤县', '450422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450423, 450400, '蒙山县', '450423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450481, 450400, '岑溪市', '450481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450500, 450000, '北海市', '450500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450501, 450500, '市辖区', '450501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450502, 450500, '海城区', '450502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450503, 450500, '银海区', '450503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450512, 450500, '铁山港区', '450512', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450521, 450500, '合浦县', '450521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450600, 450000, '防城港市', '450600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450601, 450600, '市辖区', '450601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450602, 450600, '港口区', '450602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450603, 450600, '防城区', '450603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450621, 450600, '上思县', '450621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450681, 450600, '东兴市', '450681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450700, 450000, '钦州市', '450700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450701, 450700, '市辖区', '450701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450702, 450700, '钦南区', '450702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450703, 450700, '钦北区', '450703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450721, 450700, '灵山县', '450721', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450722, 450700, '浦北县', '450722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450800, 450000, '贵港市', '450800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450801, 450800, '市辖区', '450801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450802, 450800, '港北区', '450802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450803, 450800, '港南区', '450803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450804, 450800, '覃塘区', '450804', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450821, 450800, '平南县', '450821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450881, 450800, '桂平市', '450881', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450900, 450000, '玉林市', '450900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450901, 450900, '市辖区', '450901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450902, 450900, '玉州区', '450902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450903, 450900, '福绵区', '450903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450921, 450900, '容县', '450921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450922, 450900, '陆川县', '450922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450923, 450900, '博白县', '450923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450924, 450900, '兴业县', '450924', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (450981, 450900, '北流市', '450981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451000, 450000, '百色市', '451000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451001, 451000, '市辖区', '451001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451002, 451000, '右江区', '451002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451003, 451000, '田阳区', '451003', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451022, 451000, '田东县', '451022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451023, 451000, '平果县', '451023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451024, 451000, '德保县', '451024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451026, 451000, '那坡县', '451026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451027, 451000, '凌云县', '451027', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451028, 451000, '乐业县', '451028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451029, 451000, '田林县', '451029', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451030, 451000, '西林县', '451030', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451031, 451000, '隆林各族自治县', '451031', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451081, 451000, '靖西市', '451081', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451100, 450000, '贺州市', '451100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451101, 451100, '市辖区', '451101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451102, 451100, '八步区', '451102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451103, 451100, '平桂区', '451103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451121, 451100, '昭平县', '451121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451122, 451100, '钟山县', '451122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451123, 451100, '富川瑶族自治县', '451123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451200, 450000, '河池市', '451200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451201, 451200, '市辖区', '451201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451202, 451200, '金城江区', '451202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451203, 451200, '宜州区', '451203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451221, 451200, '南丹县', '451221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451222, 451200, '天峨县', '451222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451223, 451200, '凤山县', '451223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451224, 451200, '东兰县', '451224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451225, 451200, '罗城仫佬族自治县', '451225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451226, 451200, '环江毛南族自治县', '451226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451227, 451200, '巴马瑶族自治县', '451227', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451228, 451200, '都安瑶族自治县', '451228', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451229, 451200, '大化瑶族自治县', '451229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451300, 450000, '来宾市', '451300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451301, 451300, '市辖区', '451301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451302, 451300, '兴宾区', '451302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451321, 451300, '忻城县', '451321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451322, 451300, '象州县', '451322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451323, 451300, '武宣县', '451323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451324, 451300, '金秀瑶族自治县', '451324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451381, 451300, '合山市', '451381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451400, 450000, '崇左市', '451400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451401, 451400, '市辖区', '451401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451402, 451400, '江州区', '451402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451421, 451400, '扶绥县', '451421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451422, 451400, '宁明县', '451422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451423, 451400, '龙州县', '451423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451424, 451400, '大新县', '451424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451425, 451400, '天等县', '451425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (451481, 451400, '凭祥市', '451481', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460000, 1, '海南省', '460000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460100, 460000, '海口市', '460100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460101, 460100, '市辖区', '460101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460105, 460100, '秀英区', '460105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460106, 460100, '龙华区', '460106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460107, 460100, '琼山区', '460107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460108, 460100, '美兰区', '460108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460200, 460000, '三亚市', '460200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460201, 460200, '市辖区', '460201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460202, 460200, '海棠区', '460202', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460203, 460200, '吉阳区', '460203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460204, 460200, '天涯区', '460204', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460205, 460200, '崖州区', '460205', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460300, 460000, '三沙市', '460300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460321, 460300, '西沙群岛', '460321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460322, 460300, '南沙群岛', '460322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460323, 460300, '中沙群岛的岛礁及其海域', '460323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (460400, 460000, '儋州市', '460400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469000, 460000, '省直辖县级行政区划', '469000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469001, 469000, '五指山市', '469001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469002, 469000, '琼海市', '469002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469005, 469000, '文昌市', '469005', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469006, 469000, '万宁市', '469006', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469007, 469000, '东方市', '469007', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469021, 469000, '定安县', '469021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469022, 469000, '屯昌县', '469022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469023, 469000, '澄迈县', '469023', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469024, 469000, '临高县', '469024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469025, 469000, '白沙黎族自治县', '469025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469026, 469000, '昌江黎族自治县', '469026', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469027, 469000, '乐东黎族自治县', '469027', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469028, 469000, '陵水黎族自治县', '469028', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469029, 469000, '保亭黎族苗族自治县', '469029', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (469030, 469000, '琼中黎族苗族自治县', '469030', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500000, 1, '重庆市', '500000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500100, 500000, '市辖区', '500100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500101, 500100, '万州区', '500101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500102, 500100, '涪陵区', '500102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500103, 500100, '渝中区', '500103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500104, 500100, '大渡口区', '500104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500105, 500100, '江北区', '500105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500106, 500100, '沙坪坝区', '500106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500107, 500100, '九龙坡区', '500107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500108, 500100, '南岸区', '500108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500109, 500100, '北碚区', '500109', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500110, 500100, '綦江区', '500110', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500111, 500100, '大足区', '500111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500112, 500100, '渝北区', '500112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500113, 500100, '巴南区', '500113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500114, 500100, '黔江区', '500114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500115, 500100, '长寿区', '500115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500116, 500100, '江津区', '500116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500117, 500100, '合川区', '500117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500118, 500100, '永川区', '500118', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500119, 500100, '南川区', '500119', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500120, 500100, '璧山区', '500120', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500151, 500100, '铜梁区', '500151', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500152, 500100, '潼南区', '500152', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500153, 500100, '荣昌区', '500153', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500154, 500100, '开州区', '500154', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500155, 500100, '梁平区', '500155', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500156, 500100, '武隆区', '500156', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500200, 500000, '县', '500200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500229, 500200, '城口县', '500229', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500230, 500200, '丰都县', '500230', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500231, 500200, '垫江县', '500231', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500233, 500200, '忠县', '500233', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500235, 500200, '云阳县', '500235', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500236, 500200, '奉节县', '500236', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500237, 500200, '巫山县', '500237', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500238, 500200, '巫溪县', '500238', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500240, 500200, '石柱土家族自治县', '500240', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500241, 500200, '秀山土家族苗族自治县', '500241', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500242, 500200, '酉阳土家族苗族自治县', '500242', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (500243, 500200, '彭水苗族土家族自治县', '500243', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510000, 1, '四川省', '510000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510100, 510000, '成都市', '510100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510101, 510100, '市辖区', '510101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510104, 510100, '锦江区', '510104', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510105, 510100, '青羊区', '510105', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510106, 510100, '金牛区', '510106', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510107, 510100, '武侯区', '510107', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510108, 510100, '成华区', '510108', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510112, 510100, '龙泉驿区', '510112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510113, 510100, '青白江区', '510113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510114, 510100, '新都区', '510114', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510115, 510100, '温江区', '510115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510116, 510100, '双流区', '510116', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510117, 510100, '郫都区', '510117', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510121, 510100, '金堂县', '510121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510129, 510100, '大邑县', '510129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510131, 510100, '蒲江县', '510131', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510132, 510100, '新津县', '510132', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510181, 510100, '都江堰市', '510181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510182, 510100, '彭州市', '510182', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510183, 510100, '邛崃市', '510183', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510184, 510100, '崇州市', '510184', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510185, 510100, '简阳市', '510185', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510300, 510000, '自贡市', '510300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510301, 510300, '市辖区', '510301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510302, 510300, '自流井区', '510302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510303, 510300, '贡井区', '510303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510304, 510300, '大安区', '510304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510311, 510300, '沿滩区', '510311', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510321, 510300, '荣县', '510321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510322, 510300, '富顺县', '510322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510400, 510000, '攀枝花市', '510400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510401, 510400, '市辖区', '510401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510402, 510400, '东区', '510402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510403, 510400, '西区', '510403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510411, 510400, '仁和区', '510411', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510421, 510400, '米易县', '510421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510422, 510400, '盐边县', '510422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510500, 510000, '泸州市', '510500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510501, 510500, '市辖区', '510501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510502, 510500, '江阳区', '510502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510503, 510500, '纳溪区', '510503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510504, 510500, '龙马潭区', '510504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510521, 510500, '泸县', '510521', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510522, 510500, '合江县', '510522', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510524, 510500, '叙永县', '510524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510525, 510500, '古蔺县', '510525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510600, 510000, '德阳市', '510600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510601, 510600, '市辖区', '510601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510603, 510600, '旌阳区', '510603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510604, 510600, '罗江区', '510604', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510623, 510600, '中江县', '510623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510681, 510600, '广汉市', '510681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510682, 510600, '什邡市', '510682', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510683, 510600, '绵竹市', '510683', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510700, 510000, '绵阳市', '510700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510701, 510700, '市辖区', '510701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510703, 510700, '涪城区', '510703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510704, 510700, '游仙区', '510704', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510705, 510700, '安州区', '510705', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510722, 510700, '三台县', '510722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510723, 510700, '盐亭县', '510723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510725, 510700, '梓潼县', '510725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510726, 510700, '北川羌族自治县', '510726', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510727, 510700, '平武县', '510727', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510781, 510700, '江油市', '510781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510800, 510000, '广元市', '510800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510801, 510800, '市辖区', '510801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510802, 510800, '利州区', '510802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510811, 510800, '昭化区', '510811', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510812, 510800, '朝天区', '510812', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510821, 510800, '旺苍县', '510821', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510822, 510800, '青川县', '510822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510823, 510800, '剑阁县', '510823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510824, 510800, '苍溪县', '510824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510900, 510000, '遂宁市', '510900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510901, 510900, '市辖区', '510901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510903, 510900, '船山区', '510903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510904, 510900, '安居区', '510904', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510921, 510900, '蓬溪县', '510921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510923, 510900, '大英县', '510923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (510981, 510900, '射洪市', '510981', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511000, 510000, '内江市', '511000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511001, 511000, '市辖区', '511001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511002, 511000, '市中区', '511002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511011, 511000, '东兴区', '511011', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511024, 511000, '威远县', '511024', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511025, 511000, '资中县', '511025', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511071, 511000, '内江经济开发区', '511071', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511083, 511000, '隆昌市', '511083', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511100, 510000, '乐山市', '511100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511101, 511100, '市辖区', '511101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511102, 511100, '市中区', '511102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511111, 511100, '沙湾区', '511111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511112, 511100, '五通桥区', '511112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511113, 511100, '金口河区', '511113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511123, 511100, '犍为县', '511123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511124, 511100, '井研县', '511124', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511126, 511100, '夹江县', '511126', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511129, 511100, '沐川县', '511129', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511132, 511100, '峨边彝族自治县', '511132', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511133, 511100, '马边彝族自治县', '511133', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511181, 511100, '峨眉山市', '511181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511300, 510000, '南充市', '511300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511301, 511300, '市辖区', '511301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511302, 511300, '顺庆区', '511302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511303, 511300, '高坪区', '511303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511304, 511300, '嘉陵区', '511304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511321, 511300, '南部县', '511321', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511322, 511300, '营山县', '511322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511323, 511300, '蓬安县', '511323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511324, 511300, '仪陇县', '511324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511325, 511300, '西充县', '511325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511381, 511300, '阆中市', '511381', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511400, 510000, '眉山市', '511400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511401, 511400, '市辖区', '511401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511402, 511400, '东坡区', '511402', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511403, 511400, '彭山区', '511403', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511421, 511400, '仁寿县', '511421', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511423, 511400, '洪雅县', '511423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511424, 511400, '丹棱县', '511424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511425, 511400, '青神县', '511425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511500, 510000, '宜宾市', '511500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511501, 511500, '市辖区', '511501', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511502, 511500, '翠屏区', '511502', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511503, 511500, '南溪区', '511503', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511504, 511500, '叙州区', '511504', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511523, 511500, '江安县', '511523', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511524, 511500, '长宁县', '511524', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511525, 511500, '高县', '511525', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511526, 511500, '珙县', '511526', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511527, 511500, '筠连县', '511527', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511528, 511500, '兴文县', '511528', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511529, 511500, '屏山县', '511529', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511600, 510000, '广安市', '511600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511601, 511600, '市辖区', '511601', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511602, 511600, '广安区', '511602', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511603, 511600, '前锋区', '511603', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511621, 511600, '岳池县', '511621', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511622, 511600, '武胜县', '511622', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511623, 511600, '邻水县', '511623', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511681, 511600, '华蓥市', '511681', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511700, 510000, '达州市', '511700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511701, 511700, '市辖区', '511701', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511702, 511700, '通川区', '511702', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511703, 511700, '达川区', '511703', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511722, 511700, '宣汉县', '511722', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511723, 511700, '开江县', '511723', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511724, 511700, '大竹县', '511724', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511725, 511700, '渠县', '511725', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511771, 511700, '达州经济开发区', '511771', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511781, 511700, '万源市', '511781', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511800, 510000, '雅安市', '511800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511801, 511800, '市辖区', '511801', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511802, 511800, '雨城区', '511802', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511803, 511800, '名山区', '511803', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511822, 511800, '荥经县', '511822', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511823, 511800, '汉源县', '511823', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511824, 511800, '石棉县', '511824', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511825, 511800, '天全县', '511825', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511826, 511800, '芦山县', '511826', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511827, 511800, '宝兴县', '511827', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511900, 510000, '巴中市', '511900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511901, 511900, '市辖区', '511901', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511902, 511900, '巴州区', '511902', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511903, 511900, '恩阳区', '511903', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511921, 511900, '通江县', '511921', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511922, 511900, '南江县', '511922', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511923, 511900, '平昌县', '511923', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (511971, 511900, '巴中经济开发区', '511971', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (512000, 510000, '资阳市', '512000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (512001, 512000, '市辖区', '512001', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (512002, 512000, '雁江区', '512002', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (512021, 512000, '安岳县', '512021', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (512022, 512000, '乐至县', '512022', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513200, 510000, '阿坝藏族羌族自治州', '513200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513201, 513200, '马尔康市', '513201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513221, 513200, '汶川县', '513221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513222, 513200, '理县', '513222', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513223, 513200, '茂县', '513223', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513224, 513200, '松潘县', '513224', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513225, 513200, '九寨沟县', '513225', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513226, 513200, '金川县', '513226', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513227, 513200, '小金县', '513227', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513228, 513200, '黑水县', '513228', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513230, 513200, '壤塘县', '513230', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513231, 513200, '阿坝县', '513231', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513232, 513200, '若尔盖县', '513232', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513233, 513200, '红原县', '513233', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513300, 510000, '甘孜藏族自治州', '513300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513301, 513300, '康定市', '513301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513322, 513300, '泸定县', '513322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513323, 513300, '丹巴县', '513323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513324, 513300, '九龙县', '513324', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513325, 513300, '雅江县', '513325', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513326, 513300, '道孚县', '513326', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513327, 513300, '炉霍县', '513327', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513328, 513300, '甘孜县', '513328', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513329, 513300, '新龙县', '513329', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513330, 513300, '德格县', '513330', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513331, 513300, '白玉县', '513331', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513332, 513300, '石渠县', '513332', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513333, 513300, '色达县', '513333', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513334, 513300, '理塘县', '513334', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513335, 513300, '巴塘县', '513335', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513336, 513300, '乡城县', '513336', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513337, 513300, '稻城县', '513337', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513338, 513300, '得荣县', '513338', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513400, 510000, '凉山彝族自治州', '513400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513401, 513400, '西昌市', '513401', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513422, 513400, '木里藏族自治县', '513422', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513423, 513400, '盐源县', '513423', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513424, 513400, '德昌县', '513424', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513425, 513400, '会理县', '513425', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513426, 513400, '会东县', '513426', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513427, 513400, '宁南县', '513427', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513428, 513400, '普格县', '513428', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513429, 513400, '布拖县', '513429', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513430, 513400, '金阳县', '513430', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513431, 513400, '昭觉县', '513431', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513432, 513400, '喜德县', '513432', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513433, 513400, '冕宁县', '513433', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513434, 513400, '越西县', '513434', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513435, 513400, '甘洛县', '513435', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513436, 513400, '美姑县', '513436', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (513437, 513400, '雷波县', '513437', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520000, 1, '贵州省', '520000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520100, 520000, '贵阳市', '520100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520101, 520100, '市辖区', '520101', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520102, 520100, '南明区', '520102', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520103, 520100, '云岩区', '520103', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520111, 520100, '花溪区', '520111', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520112, 520100, '乌当区', '520112', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520113, 520100, '白云区', '520113', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520115, 520100, '观山湖区', '520115', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520121, 520100, '开阳县', '520121', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520122, 520100, '息烽县', '520122', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520123, 520100, '修文县', '520123', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520181, 520100, '清镇市', '520181', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520200, 520000, '六盘水市', '520200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520201, 520200, '钟山区', '520201', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520203, 520200, '六枝特区', '520203', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520221, 520200, '水城县', '520221', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520281, 520200, '盘州市', '520281', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520300, 520000, '遵义市', '520300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520301, 520300, '市辖区', '520301', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520302, 520300, '红花岗区', '520302', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520303, 520300, '汇川区', '520303', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520304, 520300, '播州区', '520304', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520322, 520300, '桐梓县', '520322', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520323, 520300, '绥阳县', '520323', 3, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520324, 520300, '正安县', '520324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520325, 520300, '道真仡佬族苗族自治县', '520325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520326, 520300, '务川仡佬族苗族自治县', '520326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520327, 520300, '凤冈县', '520327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520328, 520300, '湄潭县', '520328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520329, 520300, '余庆县', '520329', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520330, 520300, '习水县', '520330', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520381, 520300, '赤水市', '520381', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520382, 520300, '仁怀市', '520382', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520400, 520000, '安顺市', '520400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520401, 520400, '市辖区', '520401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520402, 520400, '西秀区', '520402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520403, 520400, '平坝区', '520403', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520422, 520400, '普定县', '520422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520423, 520400, '镇宁布依族苗族自治县', '520423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520424, 520400, '关岭布依族苗族自治县', '520424', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520425, 520400, '紫云苗族布依族自治县', '520425', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520500, 520000, '毕节市', '520500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520501, 520500, '市辖区', '520501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520502, 520500, '七星关区', '520502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520521, 520500, '大方县', '520521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520522, 520500, '黔西县', '520522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520523, 520500, '金沙县', '520523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520524, 520500, '织金县', '520524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520525, 520500, '纳雍县', '520525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520526, 520500, '威宁彝族回族苗族自治县', '520526', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520527, 520500, '赫章县', '520527', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520600, 520000, '铜仁市', '520600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (520601, 520600, '市辖区', '520601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520602, 520600, '碧江区', '520602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520603, 520600, '万山区', '520603', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520621, 520600, '江口县', '520621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520622, 520600, '玉屏侗族自治县', '520622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520623, 520600, '石阡县', '520623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520624, 520600, '思南县', '520624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520625, 520600, '印江土家族苗族自治县', '520625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520626, 520600, '德江县', '520626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520627, 520600, '沿河土家族自治县', '520627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (520628, 520600, '松桃苗族自治县', '520628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522300, 520000, '黔西南布依族苗族自治州', '522300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (522301, 522300, '兴义市', '522301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522302, 522300, '兴仁市', '522302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522323, 522300, '普安县', '522323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522324, 522300, '晴隆县', '522324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522325, 522300, '贞丰县', '522325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522326, 522300, '望谟县', '522326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522327, 522300, '册亨县', '522327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522328, 522300, '安龙县', '522328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522600, 520000, '黔东南苗族侗族自治州', '522600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (522601, 522600, '凯里市', '522601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522622, 522600, '黄平县', '522622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522623, 522600, '施秉县', '522623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522624, 522600, '三穗县', '522624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522625, 522600, '镇远县', '522625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522626, 522600, '岑巩县', '522626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522627, 522600, '天柱县', '522627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522628, 522600, '锦屏县', '522628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522629, 522600, '剑河县', '522629', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522630, 522600, '台江县', '522630', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522631, 522600, '黎平县', '522631', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522632, 522600, '榕江县', '522632', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522633, 522600, '从江县', '522633', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522634, 522600, '雷山县', '522634', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522635, 522600, '麻江县', '522635', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522636, 522600, '丹寨县', '522636', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522700, 520000, '黔南布依族苗族自治州', '522700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (522701, 522700, '都匀市', '522701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522702, 522700, '福泉市', '522702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522722, 522700, '荔波县', '522722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522723, 522700, '贵定县', '522723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522725, 522700, '瓮安县', '522725', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522726, 522700, '独山县', '522726', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522727, 522700, '平塘县', '522727', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522728, 522700, '罗甸县', '522728', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522729, 522700, '长顺县', '522729', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522730, 522700, '龙里县', '522730', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522731, 522700, '惠水县', '522731', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (522732, 522700, '三都水族自治县', '522732', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530000, 1, '云南省', '530000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530100, 530000, '昆明市', '530100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530101, 530100, '市辖区', '530101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530102, 530100, '五华区', '530102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530103, 530100, '盘龙区', '530103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530111, 530100, '官渡区', '530111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530112, 530100, '西山区', '530112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530113, 530100, '东川区', '530113', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530114, 530100, '呈贡区', '530114', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530115, 530100, '晋宁区', '530115', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530124, 530100, '富民县', '530124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530125, 530100, '宜良县', '530125', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530126, 530100, '石林彝族自治县', '530126', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530127, 530100, '嵩明县', '530127', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530128, 530100, '禄劝彝族苗族自治县', '530128', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530129, 530100, '寻甸回族彝族自治县', '530129', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530181, 530100, '安宁市', '530181', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530300, 530000, '曲靖市', '530300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530301, 530300, '市辖区', '530301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530302, 530300, '麒麟区', '530302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530303, 530300, '沾益区', '530303', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530304, 530300, '马龙区', '530304', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530322, 530300, '陆良县', '530322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530323, 530300, '师宗县', '530323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530324, 530300, '罗平县', '530324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530325, 530300, '富源县', '530325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530326, 530300, '会泽县', '530326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530381, 530300, '宣威市', '530381', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530400, 530000, '玉溪市', '530400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530401, 530400, '市辖区', '530401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530402, 530400, '红塔区', '530402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530403, 530400, '江川区', '530403', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530422, 530400, '澄江县', '530422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530423, 530400, '通海县', '530423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530424, 530400, '华宁县', '530424', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530425, 530400, '易门县', '530425', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530426, 530400, '峨山彝族自治县', '530426', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530427, 530400, '新平彝族傣族自治县', '530427', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530428, 530400, '元江哈尼族彝族傣族自治县', '530428', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530500, 530000, '保山市', '530500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530501, 530500, '市辖区', '530501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530502, 530500, '隆阳区', '530502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530521, 530500, '施甸县', '530521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530523, 530500, '龙陵县', '530523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530524, 530500, '昌宁县', '530524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530581, 530500, '腾冲市', '530581', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530600, 530000, '昭通市', '530600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530601, 530600, '市辖区', '530601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530602, 530600, '昭阳区', '530602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530621, 530600, '鲁甸县', '530621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530622, 530600, '巧家县', '530622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530623, 530600, '盐津县', '530623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530624, 530600, '大关县', '530624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530625, 530600, '永善县', '530625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530626, 530600, '绥江县', '530626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530627, 530600, '镇雄县', '530627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530628, 530600, '彝良县', '530628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530629, 530600, '威信县', '530629', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530681, 530600, '水富市', '530681', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530700, 530000, '丽江市', '530700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530701, 530700, '市辖区', '530701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530702, 530700, '古城区', '530702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530721, 530700, '玉龙纳西族自治县', '530721', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530722, 530700, '永胜县', '530722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530723, 530700, '华坪县', '530723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530724, 530700, '宁蒗彝族自治县', '530724', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530800, 530000, '普洱市', '530800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530801, 530800, '市辖区', '530801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530802, 530800, '思茅区', '530802', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530821, 530800, '宁洱哈尼族彝族自治县', '530821', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530822, 530800, '墨江哈尼族自治县', '530822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530823, 530800, '景东彝族自治县', '530823', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530824, 530800, '景谷傣族彝族自治县', '530824', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530825, 530800, '镇沅彝族哈尼族拉祜族自治县', '530825', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530826, 530800, '江城哈尼族彝族自治县', '530826', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530827, 530800, '孟连傣族拉祜族佤族自治县', '530827', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530828, 530800, '澜沧拉祜族自治县', '530828', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530829, 530800, '西盟佤族自治县', '530829', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530900, 530000, '临沧市', '530900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (530901, 530900, '市辖区', '530901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530902, 530900, '临翔区', '530902', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530921, 530900, '凤庆县', '530921', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530922, 530900, '云县', '530922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530923, 530900, '永德县', '530923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530924, 530900, '镇康县', '530924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530925, 530900, '双江拉祜族佤族布朗族傣族自治县', '530925', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530926, 530900, '耿马傣族佤族自治县', '530926', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (530927, 530900, '沧源佤族自治县', '530927', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532300, 530000, '楚雄彝族自治州', '532300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (532301, 532300, '楚雄市', '532301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532322, 532300, '双柏县', '532322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532323, 532300, '牟定县', '532323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532324, 532300, '南华县', '532324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532325, 532300, '姚安县', '532325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532326, 532300, '大姚县', '532326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532327, 532300, '永仁县', '532327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532328, 532300, '元谋县', '532328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532329, 532300, '武定县', '532329', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532331, 532300, '禄丰县', '532331', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532500, 530000, '红河哈尼族彝族自治州', '532500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (532501, 532500, '个旧市', '532501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532502, 532500, '开远市', '532502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532503, 532500, '蒙自市', '532503', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532504, 532500, '弥勒市', '532504', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532523, 532500, '屏边苗族自治县', '532523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532524, 532500, '建水县', '532524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532525, 532500, '石屏县', '532525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532527, 532500, '泸西县', '532527', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532528, 532500, '元阳县', '532528', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532529, 532500, '红河县', '532529', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532530, 532500, '金平苗族瑶族傣族自治县', '532530', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532531, 532500, '绿春县', '532531', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532532, 532500, '河口瑶族自治县', '532532', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532600, 530000, '文山壮族苗族自治州', '532600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (532601, 532600, '文山市', '532601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532622, 532600, '砚山县', '532622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532623, 532600, '西畴县', '532623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532624, 532600, '麻栗坡县', '532624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532625, 532600, '马关县', '532625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532626, 532600, '丘北县', '532626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532627, 532600, '广南县', '532627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532628, 532600, '富宁县', '532628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532800, 530000, '西双版纳傣族自治州', '532800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (532801, 532800, '景洪市', '532801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532822, 532800, '勐海县', '532822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532823, 532800, '勐腊县', '532823', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532900, 530000, '大理白族自治州', '532900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (532901, 532900, '大理市', '532901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532922, 532900, '漾濞彝族自治县', '532922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532923, 532900, '祥云县', '532923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532924, 532900, '宾川县', '532924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532925, 532900, '弥渡县', '532925', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532926, 532900, '南涧彝族自治县', '532926', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532927, 532900, '巍山彝族回族自治县', '532927', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532928, 532900, '永平县', '532928', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532929, 532900, '云龙县', '532929', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532930, 532900, '洱源县', '532930', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532931, 532900, '剑川县', '532931', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (532932, 532900, '鹤庆县', '532932', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533100, 530000, '德宏傣族景颇族自治州', '533100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (533102, 533100, '瑞丽市', '533102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533103, 533100, '芒市', '533103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533122, 533100, '梁河县', '533122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533123, 533100, '盈江县', '533123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533124, 533100, '陇川县', '533124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533300, 530000, '怒江傈僳族自治州', '533300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (533301, 533300, '泸水市', '533301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533323, 533300, '福贡县', '533323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533324, 533300, '贡山独龙族怒族自治县', '533324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533325, 533300, '兰坪白族普米族自治县', '533325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533400, 530000, '迪庆藏族自治州', '533400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (533401, 533400, '香格里拉市', '533401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533422, 533400, '德钦县', '533422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (533423, 533400, '维西傈僳族自治县', '533423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540000, 1, '西藏自治区', '540000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540100, 540000, '拉萨市', '540100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540101, 540100, '市辖区', '540101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540102, 540100, '城关区', '540102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540103, 540100, '堆龙德庆区', '540103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540104, 540100, '达孜区', '540104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540121, 540100, '林周县', '540121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540122, 540100, '当雄县', '540122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540123, 540100, '尼木县', '540123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540124, 540100, '曲水县', '540124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540127, 540100, '墨竹工卡县', '540127', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540171, 540100, '格尔木藏青工业园区', '540171', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540172, 540100, '拉萨经济技术开发区', '540172', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540173, 540100, '西藏文化旅游创意园区', '540173', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540174, 540100, '达孜工业园区', '540174', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540200, 540000, '日喀则市', '540200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540202, 540200, '桑珠孜区', '540202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540221, 540200, '南木林县', '540221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540222, 540200, '江孜县', '540222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540223, 540200, '定日县', '540223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540224, 540200, '萨迦县', '540224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540225, 540200, '拉孜县', '540225', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540226, 540200, '昂仁县', '540226', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540227, 540200, '谢通门县', '540227', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540228, 540200, '白朗县', '540228', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540229, 540200, '仁布县', '540229', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540230, 540200, '康马县', '540230', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540231, 540200, '定结县', '540231', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540232, 540200, '仲巴县', '540232', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540233, 540200, '亚东县', '540233', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540234, 540200, '吉隆县', '540234', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540235, 540200, '聂拉木县', '540235', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540236, 540200, '萨嘎县', '540236', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540237, 540200, '岗巴县', '540237', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540300, 540000, '昌都市', '540300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540302, 540300, '卡若区', '540302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540321, 540300, '江达县', '540321', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540322, 540300, '贡觉县', '540322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540323, 540300, '类乌齐县', '540323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540324, 540300, '丁青县', '540324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540325, 540300, '察雅县', '540325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540326, 540300, '八宿县', '540326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540327, 540300, '左贡县', '540327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540328, 540300, '芒康县', '540328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540329, 540300, '洛隆县', '540329', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540330, 540300, '边坝县', '540330', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540400, 540000, '林芝市', '540400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540402, 540400, '巴宜区', '540402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540421, 540400, '工布江达县', '540421', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540422, 540400, '米林县', '540422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540423, 540400, '墨脱县', '540423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540424, 540400, '波密县', '540424', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540425, 540400, '察隅县', '540425', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540426, 540400, '朗县', '540426', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540500, 540000, '山南市', '540500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540501, 540500, '市辖区', '540501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540502, 540500, '乃东区', '540502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540521, 540500, '扎囊县', '540521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540522, 540500, '贡嘎县', '540522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540523, 540500, '桑日县', '540523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540524, 540500, '琼结县', '540524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540525, 540500, '曲松县', '540525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540526, 540500, '措美县', '540526', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540527, 540500, '洛扎县', '540527', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540528, 540500, '加查县', '540528', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540529, 540500, '隆子县', '540529', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540530, 540500, '错那县', '540530', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540531, 540500, '浪卡子县', '540531', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540600, 540000, '那曲市', '540600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (540602, 540600, '色尼区', '540602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540621, 540600, '嘉黎县', '540621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540622, 540600, '比如县', '540622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540623, 540600, '聂荣县', '540623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540624, 540600, '安多县', '540624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540625, 540600, '申扎县', '540625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540626, 540600, '索县', '540626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540627, 540600, '班戈县', '540627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540628, 540600, '巴青县', '540628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540629, 540600, '尼玛县', '540629', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (540630, 540600, '双湖县', '540630', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542500, 540000, '阿里地区', '542500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (542521, 542500, '普兰县', '542521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542522, 542500, '札达县', '542522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542523, 542500, '噶尔县', '542523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542524, 542500, '日土县', '542524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542525, 542500, '革吉县', '542525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542526, 542500, '改则县', '542526', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (542527, 542500, '措勤县', '542527', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610000, 1, '陕西省', '610000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610100, 610000, '西安市', '610100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610101, 610100, '市辖区', '610101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610102, 610100, '新城区', '610102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610103, 610100, '碑林区', '610103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610104, 610100, '莲湖区', '610104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610111, 610100, '灞桥区', '610111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610112, 610100, '未央区', '610112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610113, 610100, '雁塔区', '610113', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610114, 610100, '阎良区', '610114', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610115, 610100, '临潼区', '610115', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610116, 610100, '长安区', '610116', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610117, 610100, '高陵区', '610117', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610118, 610100, '鄠邑区', '610118', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610122, 610100, '蓝田县', '610122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610124, 610100, '周至县', '610124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610200, 610000, '铜川市', '610200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610201, 610200, '市辖区', '610201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610202, 610200, '王益区', '610202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610203, 610200, '印台区', '610203', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610204, 610200, '耀州区', '610204', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610222, 610200, '宜君县', '610222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610300, 610000, '宝鸡市', '610300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610301, 610300, '市辖区', '610301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610302, 610300, '渭滨区', '610302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610303, 610300, '金台区', '610303', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610304, 610300, '陈仓区', '610304', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610322, 610300, '凤翔县', '610322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610323, 610300, '岐山县', '610323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610324, 610300, '扶风县', '610324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610326, 610300, '眉县', '610326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610327, 610300, '陇县', '610327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610328, 610300, '千阳县', '610328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610329, 610300, '麟游县', '610329', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610330, 610300, '凤县', '610330', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610331, 610300, '太白县', '610331', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610400, 610000, '咸阳市', '610400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610401, 610400, '市辖区', '610401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610402, 610400, '秦都区', '610402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610403, 610400, '杨陵区', '610403', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610404, 610400, '渭城区', '610404', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610422, 610400, '三原县', '610422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610423, 610400, '泾阳县', '610423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610424, 610400, '乾县', '610424', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610425, 610400, '礼泉县', '610425', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610426, 610400, '永寿县', '610426', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610428, 610400, '长武县', '610428', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610429, 610400, '旬邑县', '610429', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610430, 610400, '淳化县', '610430', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610431, 610400, '武功县', '610431', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610481, 610400, '兴平市', '610481', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610482, 610400, '彬州市', '610482', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610500, 610000, '渭南市', '610500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610501, 610500, '市辖区', '610501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610502, 610500, '临渭区', '610502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610503, 610500, '华州区', '610503', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610522, 610500, '潼关县', '610522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610523, 610500, '大荔县', '610523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610524, 610500, '合阳县', '610524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610525, 610500, '澄城县', '610525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610526, 610500, '蒲城县', '610526', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610527, 610500, '白水县', '610527', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610528, 610500, '富平县', '610528', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610581, 610500, '韩城市', '610581', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610582, 610500, '华阴市', '610582', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610600, 610000, '延安市', '610600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610601, 610600, '市辖区', '610601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610602, 610600, '宝塔区', '610602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610603, 610600, '安塞区', '610603', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610621, 610600, '延长县', '610621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610622, 610600, '延川县', '610622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610625, 610600, '志丹县', '610625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610626, 610600, '吴起县', '610626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610627, 610600, '甘泉县', '610627', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610628, 610600, '富县', '610628', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610629, 610600, '洛川县', '610629', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610630, 610600, '宜川县', '610630', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610631, 610600, '黄龙县', '610631', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610632, 610600, '黄陵县', '610632', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610681, 610600, '子长市', '610681', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610700, 610000, '汉中市', '610700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610701, 610700, '市辖区', '610701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610702, 610700, '汉台区', '610702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610703, 610700, '南郑区', '610703', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610722, 610700, '城固县', '610722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610723, 610700, '洋县', '610723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610724, 610700, '西乡县', '610724', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610725, 610700, '勉县', '610725', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610726, 610700, '宁强县', '610726', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610727, 610700, '略阳县', '610727', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610728, 610700, '镇巴县', '610728', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610729, 610700, '留坝县', '610729', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610730, 610700, '佛坪县', '610730', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610800, 610000, '榆林市', '610800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610801, 610800, '市辖区', '610801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610802, 610800, '榆阳区', '610802', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610803, 610800, '横山区', '610803', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610822, 610800, '府谷县', '610822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610824, 610800, '靖边县', '610824', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610825, 610800, '定边县', '610825', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610826, 610800, '绥德县', '610826', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610827, 610800, '米脂县', '610827', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610828, 610800, '佳县', '610828', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610829, 610800, '吴堡县', '610829', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610830, 610800, '清涧县', '610830', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610831, 610800, '子洲县', '610831', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610881, 610800, '神木市', '610881', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610900, 610000, '安康市', '610900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (610901, 610900, '市辖区', '610901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610902, 610900, '汉滨区', '610902', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610921, 610900, '汉阴县', '610921', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610922, 610900, '石泉县', '610922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610923, 610900, '宁陕县', '610923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610924, 610900, '紫阳县', '610924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610925, 610900, '岚皋县', '610925', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610926, 610900, '平利县', '610926', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610927, 610900, '镇坪县', '610927', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610928, 610900, '旬阳县', '610928', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (610929, 610900, '白河县', '610929', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611000, 610000, '商洛市', '611000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (611001, 611000, '市辖区', '611001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611002, 611000, '商州区', '611002', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611021, 611000, '洛南县', '611021', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611022, 611000, '丹凤县', '611022', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611023, 611000, '商南县', '611023', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611024, 611000, '山阳县', '611024', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611025, 611000, '镇安县', '611025', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (611026, 611000, '柞水县', '611026', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620000, 1, '甘肃省', '620000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620100, 620000, '兰州市', '620100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620101, 620100, '市辖区', '620101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620102, 620100, '城关区', '620102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620103, 620100, '七里河区', '620103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620104, 620100, '西固区', '620104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620105, 620100, '安宁区', '620105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620111, 620100, '红古区', '620111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620121, 620100, '永登县', '620121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620122, 620100, '皋兰县', '620122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620123, 620100, '榆中县', '620123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620171, 620100, '兰州新区', '620171', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620200, 620000, '嘉峪关市', '620200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620201, 620200, '市辖区', '620201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620300, 620000, '金昌市', '620300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620301, 620300, '市辖区', '620301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620302, 620300, '金川区', '620302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620321, 620300, '永昌县', '620321', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620400, 620000, '白银市', '620400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620401, 620400, '市辖区', '620401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620402, 620400, '白银区', '620402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620403, 620400, '平川区', '620403', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620421, 620400, '靖远县', '620421', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620422, 620400, '会宁县', '620422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620423, 620400, '景泰县', '620423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620500, 620000, '天水市', '620500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620501, 620500, '市辖区', '620501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620502, 620500, '秦州区', '620502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620503, 620500, '麦积区', '620503', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620521, 620500, '清水县', '620521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620522, 620500, '秦安县', '620522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620523, 620500, '甘谷县', '620523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620524, 620500, '武山县', '620524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620525, 620500, '张家川回族自治县', '620525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620600, 620000, '武威市', '620600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620601, 620600, '市辖区', '620601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620602, 620600, '凉州区', '620602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620621, 620600, '民勤县', '620621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620622, 620600, '古浪县', '620622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620623, 620600, '天祝藏族自治县', '620623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620700, 620000, '张掖市', '620700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620701, 620700, '市辖区', '620701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620702, 620700, '甘州区', '620702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620721, 620700, '肃南裕固族自治县', '620721', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620722, 620700, '民乐县', '620722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620723, 620700, '临泽县', '620723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620724, 620700, '高台县', '620724', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620725, 620700, '山丹县', '620725', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620800, 620000, '平凉市', '620800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620801, 620800, '市辖区', '620801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620802, 620800, '崆峒区', '620802', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620821, 620800, '泾川县', '620821', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620822, 620800, '灵台县', '620822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620823, 620800, '崇信县', '620823', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620825, 620800, '庄浪县', '620825', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620826, 620800, '静宁县', '620826', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620881, 620800, '华亭市', '620881', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620900, 620000, '酒泉市', '620900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (620901, 620900, '市辖区', '620901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620902, 620900, '肃州区', '620902', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620921, 620900, '金塔县', '620921', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620922, 620900, '瓜州县', '620922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620923, 620900, '肃北蒙古族自治县', '620923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620924, 620900, '阿克塞哈萨克族自治县', '620924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620981, 620900, '玉门市', '620981', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (620982, 620900, '敦煌市', '620982', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621000, 620000, '庆阳市', '621000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (621001, 621000, '市辖区', '621001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621002, 621000, '西峰区', '621002', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621021, 621000, '庆城县', '621021', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621022, 621000, '环县', '621022', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621023, 621000, '华池县', '621023', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621024, 621000, '合水县', '621024', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621025, 621000, '正宁县', '621025', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621026, 621000, '宁县', '621026', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621027, 621000, '镇原县', '621027', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621100, 620000, '定西市', '621100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (621101, 621100, '市辖区', '621101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621102, 621100, '安定区', '621102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621121, 621100, '通渭县', '621121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621122, 621100, '陇西县', '621122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621123, 621100, '渭源县', '621123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621124, 621100, '临洮县', '621124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621125, 621100, '漳县', '621125', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621126, 621100, '岷县', '621126', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621200, 620000, '陇南市', '621200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (621201, 621200, '市辖区', '621201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621202, 621200, '武都区', '621202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621221, 621200, '成县', '621221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621222, 621200, '文县', '621222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621223, 621200, '宕昌县', '621223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621224, 621200, '康县', '621224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621225, 621200, '西和县', '621225', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621226, 621200, '礼县', '621226', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621227, 621200, '徽县', '621227', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (621228, 621200, '两当县', '621228', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622900, 620000, '临夏回族自治州', '622900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (622901, 622900, '临夏市', '622901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622921, 622900, '临夏县', '622921', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622922, 622900, '康乐县', '622922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622923, 622900, '永靖县', '622923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622924, 622900, '广河县', '622924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622925, 622900, '和政县', '622925', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622926, 622900, '东乡族自治县', '622926', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (622927, 622900, '积石山保安族东乡族撒拉族自治县', '622927', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623000, 620000, '甘南藏族自治州', '623000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (623001, 623000, '合作市', '623001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623021, 623000, '临潭县', '623021', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623022, 623000, '卓尼县', '623022', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623023, 623000, '舟曲县', '623023', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623024, 623000, '迭部县', '623024', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623025, 623000, '玛曲县', '623025', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623026, 623000, '碌曲县', '623026', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (623027, 623000, '夏河县', '623027', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630000, 1, '青海省', '630000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (630100, 630000, '西宁市', '630100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (630101, 630100, '市辖区', '630101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630102, 630100, '城东区', '630102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630103, 630100, '城中区', '630103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630104, 630100, '城西区', '630104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630105, 630100, '城北区', '630105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630121, 630100, '大通回族土族自治县', '630121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630122, 630100, '湟中县', '630122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630123, 630100, '湟源县', '630123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630200, 630000, '海东市', '630200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (630202, 630200, '乐都区', '630202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630203, 630200, '平安区', '630203', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630222, 630200, '民和回族土族自治县', '630222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630223, 630200, '互助土族自治县', '630223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630224, 630200, '化隆回族自治县', '630224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (630225, 630200, '循化撒拉族自治县', '630225', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632200, 630000, '海北藏族自治州', '632200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632221, 632200, '门源回族自治县', '632221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632222, 632200, '祁连县', '632222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632223, 632200, '海晏县', '632223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632224, 632200, '刚察县', '632224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632300, 630000, '黄南藏族自治州', '632300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632321, 632300, '同仁县', '632321', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632322, 632300, '尖扎县', '632322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632323, 632300, '泽库县', '632323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632324, 632300, '河南蒙古族自治县', '632324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632500, 630000, '海南藏族自治州', '632500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632521, 632500, '共和县', '632521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632522, 632500, '同德县', '632522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632523, 632500, '贵德县', '632523', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632524, 632500, '兴海县', '632524', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632525, 632500, '贵南县', '632525', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632600, 630000, '果洛藏族自治州', '632600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632621, 632600, '玛沁县', '632621', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632622, 632600, '班玛县', '632622', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632623, 632600, '甘德县', '632623', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632624, 632600, '达日县', '632624', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632625, 632600, '久治县', '632625', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632626, 632600, '玛多县', '632626', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632700, 630000, '玉树藏族自治州', '632700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632701, 632700, '玉树市', '632701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632722, 632700, '杂多县', '632722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632723, 632700, '称多县', '632723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632724, 632700, '治多县', '632724', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632725, 632700, '囊谦县', '632725', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632726, 632700, '曲麻莱县', '632726', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632800, 630000, '海西蒙古族藏族自治州', '632800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (632801, 632800, '格尔木市', '632801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632802, 632800, '德令哈市', '632802', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632803, 632800, '茫崖市', '632803', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632821, 632800, '乌兰县', '632821', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632822, 632800, '都兰县', '632822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632823, 632800, '天峻县', '632823', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (632857, 632800, '大柴旦行政委员会', '632857', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640000, 1, '宁夏回族自治区', '640000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640100, 640000, '银川市', '640100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640101, 640100, '市辖区', '640101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640104, 640100, '兴庆区', '640104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640105, 640100, '西夏区', '640105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640106, 640100, '金凤区', '640106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640121, 640100, '永宁县', '640121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640122, 640100, '贺兰县', '640122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640181, 640100, '灵武市', '640181', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640200, 640000, '石嘴山市', '640200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640201, 640200, '市辖区', '640201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640202, 640200, '大武口区', '640202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640205, 640200, '惠农区', '640205', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640221, 640200, '平罗县', '640221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640300, 640000, '吴忠市', '640300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640301, 640300, '市辖区', '640301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640302, 640300, '利通区', '640302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640303, 640300, '红寺堡区', '640303', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640323, 640300, '盐池县', '640323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640324, 640300, '同心县', '640324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640381, 640300, '青铜峡市', '640381', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640400, 640000, '固原市', '640400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640401, 640400, '市辖区', '640401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640402, 640400, '原州区', '640402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640422, 640400, '西吉县', '640422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640423, 640400, '隆德县', '640423', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640424, 640400, '泾源县', '640424', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640425, 640400, '彭阳县', '640425', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640500, 640000, '中卫市', '640500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (640501, 640500, '市辖区', '640501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640502, 640500, '沙坡头区', '640502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640521, 640500, '中宁县', '640521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (640522, 640500, '海原县', '640522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650000, 1, '新疆维吾尔自治区', '650000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (650100, 650000, '乌鲁木齐市', '650100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (650101, 650100, '市辖区', '650101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650102, 650100, '天山区', '650102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650103, 650100, '沙依巴克区', '650103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650104, 650100, '新市区', '650104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650105, 650100, '水磨沟区', '650105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650106, 650100, '头屯河区', '650106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650107, 650100, '达坂城区', '650107', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650109, 650100, '米东区', '650109', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650121, 650100, '乌鲁木齐县', '650121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650200, 650000, '克拉玛依市', '650200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (650201, 650200, '市辖区', '650201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650202, 650200, '独山子区', '650202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650203, 650200, '克拉玛依区', '650203', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650204, 650200, '白碱滩区', '650204', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650205, 650200, '乌尔禾区', '650205', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650400, 650000, '吐鲁番市', '650400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (650402, 650400, '高昌区', '650402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650421, 650400, '鄯善县', '650421', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650422, 650400, '托克逊县', '650422', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650500, 650000, '哈密市', '650500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (650502, 650500, '伊州区', '650502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650521, 650500, '巴里坤哈萨克自治县', '650521', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (650522, 650500, '伊吾县', '650522', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652300, 650000, '昌吉回族自治州', '652300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (652301, 652300, '昌吉市', '652301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652302, 652300, '阜康市', '652302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652323, 652300, '呼图壁县', '652323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652324, 652300, '玛纳斯县', '652324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652325, 652300, '奇台县', '652325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652327, 652300, '吉木萨尔县', '652327', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652328, 652300, '木垒哈萨克自治县', '652328', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652700, 650000, '博尔塔拉蒙古自治州', '652700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (652701, 652700, '博乐市', '652701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652702, 652700, '阿拉山口市', '652702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652722, 652700, '精河县', '652722', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652723, 652700, '温泉县', '652723', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652800, 650000, '巴音郭楞蒙古自治州', '652800', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (652801, 652800, '库尔勒市', '652801', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652822, 652800, '轮台县', '652822', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652823, 652800, '尉犁县', '652823', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652824, 652800, '若羌县', '652824', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652825, 652800, '且末县', '652825', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652826, 652800, '焉耆回族自治县', '652826', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652827, 652800, '和静县', '652827', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652828, 652800, '和硕县', '652828', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652829, 652800, '博湖县', '652829', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652871, 652800, '库尔勒经济技术开发区', '652871', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652900, 650000, '阿克苏地区', '652900', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (652901, 652900, '阿克苏市', '652901', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652922, 652900, '温宿县', '652922', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652923, 652900, '库车县', '652923', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652924, 652900, '沙雅县', '652924', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652925, 652900, '新和县', '652925', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652926, 652900, '拜城县', '652926', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652927, 652900, '乌什县', '652927', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652928, 652900, '阿瓦提县', '652928', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (652929, 652900, '柯坪县', '652929', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653000, 650000, '克孜勒苏柯尔克孜自治州', '653000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (653001, 653000, '阿图什市', '653001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653022, 653000, '阿克陶县', '653022', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653023, 653000, '阿合奇县', '653023', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653024, 653000, '乌恰县', '653024', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653100, 650000, '喀什地区', '653100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (653101, 653100, '喀什市', '653101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653121, 653100, '疏附县', '653121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653122, 653100, '疏勒县', '653122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653123, 653100, '英吉沙县', '653123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653124, 653100, '泽普县', '653124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653125, 653100, '莎车县', '653125', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653126, 653100, '叶城县', '653126', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653127, 653100, '麦盖提县', '653127', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653128, 653100, '岳普湖县', '653128', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653129, 653100, '伽师县', '653129', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653130, 653100, '巴楚县', '653130', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653131, 653100, '塔什库尔干塔吉克自治县', '653131', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653200, 650000, '和田地区', '653200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (653201, 653200, '和田市', '653201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653221, 653200, '和田县', '653221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653222, 653200, '墨玉县', '653222', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653223, 653200, '皮山县', '653223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653224, 653200, '洛浦县', '653224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653225, 653200, '策勒县', '653225', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653226, 653200, '于田县', '653226', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (653227, 653200, '民丰县', '653227', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654000, 650000, '伊犁哈萨克自治州', '654000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (654002, 654000, '伊宁市', '654002', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654003, 654000, '奎屯市', '654003', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654004, 654000, '霍尔果斯市', '654004', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654021, 654000, '伊宁县', '654021', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654022, 654000, '察布查尔锡伯自治县', '654022', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654023, 654000, '霍城县', '654023', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654024, 654000, '巩留县', '654024', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654025, 654000, '新源县', '654025', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654026, 654000, '昭苏县', '654026', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654027, 654000, '特克斯县', '654027', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654028, 654000, '尼勒克县', '654028', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654200, 650000, '塔城地区', '654200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (654201, 654200, '塔城市', '654201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654202, 654200, '乌苏市', '654202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654221, 654200, '额敏县', '654221', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654223, 654200, '沙湾县', '654223', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654224, 654200, '托里县', '654224', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654225, 654200, '裕民县', '654225', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654226, 654200, '和布克赛尔蒙古自治县', '654226', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654300, 650000, '阿勒泰地区', '654300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (654301, 654300, '阿勒泰市', '654301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654321, 654300, '布尔津县', '654321', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654322, 654300, '富蕴县', '654322', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654323, 654300, '福海县', '654323', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654324, 654300, '哈巴河县', '654324', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654325, 654300, '青河县', '654325', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (654326, 654300, '吉木乃县', '654326', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (659000, 650000, '自治区直辖县级行政区划', '659000', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (659001, 659000, '石河子市', '659001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (659002, 659000, '阿拉尔市', '659002', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (659003, 659000, '图木舒克市', '659003', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (659004, 659000, '五家渠市', '659004', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (659006, 659000, '铁门关市', '659006', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710000, 1, '台湾省', '710000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710100, 710000, '台北市', '710100', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710101, 710100, '内湖区', '710101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710102, 710100, '南港区', '710102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710103, 710100, '中正区', '710103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710104, 710100, '松山区', '710104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710105, 710100, '信义区', '710105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710106, 710100, '大安区', '710106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710107, 710100, '中山区', '710107', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710108, 710100, '文山区', '710108', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710109, 710100, '大同区', '710109', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710110, 710100, '万华区', '710110', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710111, 710100, '士林区', '710111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710112, 710100, '北投区', '710112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710200, 710000, '高雄市', '710200', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710201, 710200, '新兴区', '710201', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710202, 710200, '前金区', '710202', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710203, 710200, '芩雅区', '710203', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710204, 710200, '盐埕区', '710204', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710205, 710200, '鼓山区', '710205', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710206, 710200, '旗津区', '710206', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710207, 710200, '前镇区', '710207', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710208, 710200, '三民区', '710208', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710209, 710200, '左营区', '710209', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710210, 710200, '楠梓区', '710210', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710211, 710200, '小港区', '710211', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710300, 710000, '基隆市', '710300', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710301, 710300, '仁爱区', '710301', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710302, 710300, '信义区', '710302', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710303, 710300, '中正区', '710303', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710304, 710300, '暖暖区', '710304', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710305, 710300, '安乐区', '710305', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710306, 710400, '北屯区', '710306', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710307, 710300, '七堵区', '710307', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710308, 710400, '南屯区', '710308', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710400, 710000, '台中市', '710400', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710500, 710000, '台南市', '710500', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710501, 710500, '中西区', '710501', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710502, 710500, '东区', '710502', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710503, 710500, '南区', '710503', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710504, 710500, '北区', '710504', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710505, 710500, '安平区', '710505', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710506, 710500, '安南区', '710506', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710600, 710000, '新竹市', '710600', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710601, 710600, '东区', '710601', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710602, 710600, '北区', '710602', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710603, 710600, '香山区', '710603', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710700, 710000, '嘉义市', '710700', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (710701, 710700, '东区', '710701', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (710702, 710700, '西区', '710702', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (810000, 1, '香港特别行政区', '810000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810001, 810000, '中西區', '810001', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810002, 810000, '灣仔區', '810002', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810003, 810000, '東區', '810003', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810004, 810000, '南區', '810004', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810005, 810000, '油尖旺區', '810005', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810006, 810000, '深水埗區', '810006', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810007, 810000, '九龍城區', '810007', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810008, 810000, '黃大仙區', '810008', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810009, 810000, '觀塘區', '810009', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810010, 810000, '荃灣區', '810010', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810011, 810000, '屯門區', '810011', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810012, 810000, '元朗區', '810012', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810013, 810000, '北區', '810013', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810014, 810000, '大埔區', '810014', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810015, 810000, '西貢區', '810015', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810016, 810000, '沙田區', '810016', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810017, 810000, '葵青區', '810017', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (810018, 810000, '離島區', '810018', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820000, 1, '澳门特别行政区', '820000', 1, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820001, 820000, '花地瑪堂區', '820001', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820002, 820000, '花王堂區', '820002', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820003, 820000, '望德堂區', '820003', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820004, 820000, '大堂區', '820004', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820005, 820000, '風順堂區', '820005', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820006, 820000, '嘉模堂區', '820006', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820007, 820000, '路氹填海區', '820007', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (820008, 820000, '聖方濟各堂區', '820008', 2, 0, '2021-09-18 18:20:39', '2021-09-18 18:20:39');
INSERT INTO `bs_region`
VALUES (441900003, 441900, '东城街道', '441900003', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900004, 441900, '南城街道', '441900004', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900005, 441900, '万江街道', '441900005', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900006, 441900, '莞城街道', '441900006', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900101, 441900, '石碣镇', '441900101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900102, 441900, '石龙镇', '441900102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900103, 441900, '茶山镇', '441900103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900104, 441900, '石排镇', '441900104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900105, 441900, '企石镇', '441900105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900106, 441900, '横沥镇', '441900106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900107, 441900, '桥头镇', '441900107', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900108, 441900, '谢岗镇', '441900108', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900109, 441900, '东坑镇', '441900109', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900110, 441900, '常平镇', '441900110', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900111, 441900, '寮步镇', '441900111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900112, 441900, '樟木头镇', '441900112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900113, 441900, '大朗镇', '441900113', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900114, 441900, '黄江镇', '441900114', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900115, 441900, '清溪镇', '441900115', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900116, 441900, '塘厦镇', '441900116', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900117, 441900, '凤岗镇', '441900117', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900118, 441900, '大岭山镇', '441900118', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900119, 441900, '长安镇', '441900119', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900121, 441900, '虎门镇', '441900121', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900122, 441900, '厚街镇', '441900122', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900123, 441900, '沙田镇', '441900123', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900124, 441900, '道滘镇', '441900124', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900125, 441900, '洪梅镇', '441900125', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900126, 441900, '麻涌镇', '441900126', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900127, 441900, '望牛墩镇', '441900127', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900128, 441900, '中堂镇', '441900128', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900129, 441900, '高埗镇', '441900129', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900401, 441900, '松山湖', '441900401', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900402, 441900, '东莞港', '441900402', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (441900403, 441900, '东莞生态园', '441900403', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000001, 442000, '石岐街道', '442000001', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000002, 442000, '东区街道', '442000002', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000003, 442000, '中山港街道', '442000003', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000004, 442000, '西区街道', '442000004', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000005, 442000, '南区街道', '442000005', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000006, 442000, '五桂山街道', '442000006', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000100, 442000, '小榄镇', '442000100', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000101, 442000, '黄圃镇', '442000101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000102, 442000, '民众镇', '442000102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000103, 442000, '东凤镇', '442000103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000104, 442000, '东升镇', '442000104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000105, 442000, '古镇镇', '442000105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000106, 442000, '沙溪镇', '442000106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000107, 442000, '坦洲镇', '442000107', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000108, 442000, '港口镇', '442000108', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000109, 442000, '三角镇', '442000109', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000110, 442000, '横栏镇', '442000110', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000111, 442000, '南头镇', '442000111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000112, 442000, '阜沙镇', '442000112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000113, 442000, '南朗镇', '442000113', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000114, 442000, '三乡镇', '442000114', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000115, 442000, '板芙镇', '442000115', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000116, 442000, '大涌镇', '442000116', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (442000117, 442000, '神湾镇', '442000117', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400100, 460400, '那大镇', '460400100', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400101, 460400, '和庆镇', '460400101', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400102, 460400, '南丰镇', '460400102', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400103, 460400, '大成镇', '460400103', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400104, 460400, '雅星镇', '460400104', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400105, 460400, '兰洋镇', '460400105', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400106, 460400, '光村镇', '460400106', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400107, 460400, '木棠镇', '460400107', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400108, 460400, '海头镇', '460400108', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400109, 460400, '峨蔓镇', '460400109', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400111, 460400, '王五镇', '460400111', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400112, 460400, '白马井镇', '460400112', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400113, 460400, '中和镇', '460400113', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400114, 460400, '排浦镇', '460400114', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400115, 460400, '东成镇', '460400115', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400116, 460400, '新州镇', '460400116', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400499, 460400, '洋浦经济开发区', '460400499', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');
INSERT INTO `bs_region`
VALUES (460400500, 460400, '华南热作学院', '460400500', 3, 0, '2021-09-18 18:20:40', '2021-09-18 18:20:40');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `BLOB_DATA`     blob NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX           `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `CALENDAR`      blob                                                    NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TIME_ZONE_ID`    varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers`
VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ENTRY_ID`          varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `TRIGGER_NAME`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `FIRED_TIME`        bigint                                                  NOT NULL,
    `SCHED_TIME`        bigint                                                  NOT NULL,
    `PRIORITY`          int                                                     NOT NULL,
    `STATE`             varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX               `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `JOB_NAME`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `JOB_GROUP`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `DESCRIPTION`       varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `JOB_CLASS_NAME`    varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `IS_DURABLE`        varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `IS_NONCONCURRENT`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `IS_UPDATE_DATA`    varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `JOB_DATA`          blob NULL,
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX               `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
    INDEX               `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details`
VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017AE86906B87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `LOCK_NAME`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks`
VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks`
VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`
(
    `SCHED_NAME`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `INSTANCE_NAME`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `LAST_CHECKIN_TIME` bigint                                                  NOT NULL,
    `CHECKIN_INTERVAL`  bigint                                                  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state`
VALUES ('RenrenScheduler', 'Codecrab1632045797012', 1632048259125, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `SCHED_NAME`      varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_NAME`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `REPEAT_COUNT`    bigint                                                  NOT NULL,
    `REPEAT_INTERVAL` bigint                                                  NOT NULL,
    `TIMES_TRIGGERED` bigint                                                  NOT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`
(
    `SCHED_NAME`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_NAME`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `STR_PROP_1`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `STR_PROP_2`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `STR_PROP_3`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `INT_PROP_1`    int NULL DEFAULT NULL,
    `INT_PROP_2`    int NULL DEFAULT NULL,
    `LONG_PROP_1`   bigint NULL DEFAULT NULL,
    `LONG_PROP_2`   bigint NULL DEFAULT NULL,
    `DEC_PROP_1`    decimal(13, 4) NULL DEFAULT NULL,
    `DEC_PROP_2`    decimal(13, 4) NULL DEFAULT NULL,
    `BOOL_PROP_1`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `BOOL_PROP_2`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `SCHED_NAME`     varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_NAME`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `TRIGGER_GROUP`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `JOB_NAME`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `JOB_GROUP`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `DESCRIPTION`    varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
    `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
    `PRIORITY`       int NULL DEFAULT NULL,
    `TRIGGER_STATE`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `TRIGGER_TYPE`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `START_TIME`     bigint                                                  NOT NULL,
    `END_TIME`       bigint NULL DEFAULT NULL,
    `CALENDAR_NAME`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `MISFIRE_INSTR`  smallint NULL DEFAULT NULL,
    `JOB_DATA`       blob NULL,
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX            `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX            `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
    INDEX            `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
    INDEX            `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
    INDEX            `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
    INDEX            `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
    INDEX            `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
    INDEX            `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX            `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX            `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
    INDEX            `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
    INDEX            `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers`
VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1632049200000, 1632047400000, 5, 'WAITING',
        'CRON', 1627479868000, 0, NULL, 2,
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017AE86906B87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`
(
    `job_id`          bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
    `bean_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
    `params`          varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
    `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron表达式',
    `status`          tinyint NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
    `remark`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`     datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job`
VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-07-27 22:40:35');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`
(
    `log_id`      bigint  NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
    `job_id`      bigint  NOT NULL COMMENT '任务id',
    `bean_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
    `params`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
    `status`      tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
    `error`       varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败信息',
    `times`       int     NOT NULL COMMENT '耗时(单位：毫秒)',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`log_id`) USING BTREE,
    INDEX         `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log`
VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2021-07-28 22:00:00');
INSERT INTO `schedule_job_log`
VALUES (2, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 22:30:00');
INSERT INTO `schedule_job_log`
VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 23:00:00');
INSERT INTO `schedule_job_log`
VALUES (4, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 23:07:40');
INSERT INTO `schedule_job_log`
VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 23:08:58');
INSERT INTO `schedule_job_log`
VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 23:09:40');
INSERT INTO `schedule_job_log`
VALUES (7, 1, 'testTask', 'renren', 0, NULL, 0, '2021-07-28 23:10:28');
INSERT INTO `schedule_job_log`
VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2021-07-28 23:30:00');
INSERT INTO `schedule_job_log`
VALUES (9, 1, 'testTask', 'renren', 0, NULL, 4, '2021-07-29 00:00:02');
INSERT INTO `schedule_job_log`
VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-03 10:00:00');
INSERT INTO `schedule_job_log`
VALUES (11, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 10:30:00');
INSERT INTO `schedule_job_log`
VALUES (12, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (14, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-03 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (16, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-03 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (18, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (19, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-03 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (20, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-06 09:30:00');
INSERT INTO `schedule_job_log`
VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-06 10:00:00');
INSERT INTO `schedule_job_log`
VALUES (22, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-06 10:30:00');
INSERT INTO `schedule_job_log`
VALUES (23, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-06 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (24, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-06 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-06 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-06 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (27, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-06 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (28, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-06 13:30:00');
INSERT INTO `schedule_job_log`
VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-06 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (30, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-06 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (31, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-06 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (32, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-06 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-09 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (34, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-09 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (35, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-09 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-09 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (37, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (40, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-10 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-10 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-10 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (46, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-14 13:30:00');
INSERT INTO `schedule_job_log`
VALUES (47, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-14 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-14 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (49, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-14 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-14 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (51, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-14 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-14 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-14 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (54, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-14 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 10:30:00');
INSERT INTO `schedule_job_log`
VALUES (56, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-15 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (59, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-15 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-15 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (62, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-15 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (64, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (65, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-15 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-15 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 10:00:00');
INSERT INTO `schedule_job_log`
VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 10:30:00');
INSERT INTO `schedule_job_log`
VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (70, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-16 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (72, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (75, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-16 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (76, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (77, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-16 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (78, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-16 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (80, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-16 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (81, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (82, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-16 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (83, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-17 09:30:00');
INSERT INTO `schedule_job_log`
VALUES (84, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 10:00:00');
INSERT INTO `schedule_job_log`
VALUES (85, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-17 10:30:00');
INSERT INTO `schedule_job_log`
VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (87, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-17 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-17 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (89, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-17 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 13:30:00');
INSERT INTO `schedule_job_log`
VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (93, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-17 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (95, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-18 11:00:00');
INSERT INTO `schedule_job_log`
VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (97, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (98, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-18 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-18 13:30:00');
INSERT INTO `schedule_job_log`
VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (102, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (106, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-18 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (107, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (108, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-18 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-18 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 11:30:00');
INSERT INTO `schedule_job_log`
VALUES (111, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 12:00:00');
INSERT INTO `schedule_job_log`
VALUES (112, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 12:30:00');
INSERT INTO `schedule_job_log`
VALUES (113, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 13:00:00');
INSERT INTO `schedule_job_log`
VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 13:30:00');
INSERT INTO `schedule_job_log`
VALUES (115, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 14:00:00');
INSERT INTO `schedule_job_log`
VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 14:30:00');
INSERT INTO `schedule_job_log`
VALUES (117, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 15:00:00');
INSERT INTO `schedule_job_log`
VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 15:30:00');
INSERT INTO `schedule_job_log`
VALUES (119, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 16:00:00');
INSERT INTO `schedule_job_log`
VALUES (120, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 16:30:00');
INSERT INTO `schedule_job_log`
VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-19 17:00:00');
INSERT INTO `schedule_job_log`
VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 17:30:00');
INSERT INTO `schedule_job_log`
VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 18:00:00');
INSERT INTO `schedule_job_log`
VALUES (124, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-19 18:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`
(
    `uuid`        char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT 'uuid',
    `code`        varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
    `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
    PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统验证码' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha`
VALUES ('2df4b40e-d598-47de-8b00-7b0819ee5ee6', 'y6p8p', '2021-07-28 21:49:39');
INSERT INTO `sys_captcha`
VALUES ('2f9b1b5e-25d2-4716-8df3-6b95bb087032', 'fw2ad', '2021-09-18 15:39:16');
INSERT INTO `sys_captcha`
VALUES ('31271459-c5a3-4c05-8d68-d7278bd8b304', 'pc8pn', '2021-09-09 15:52:25');
INSERT INTO `sys_captcha`
VALUES ('42388cf5-c7b4-4b03-8931-4192db5de90d', '45xnw', '2021-09-17 14:46:21');
INSERT INTO `sys_captcha`
VALUES ('61b1cb08-24d2-408e-8d4c-f82b307a3881', '4cyan', '2021-09-17 15:37:18');
INSERT INTO `sys_captcha`
VALUES ('7bb702f7-8525-4a40-8880-f49c5dd86696', 'n8d74', '2021-09-19 17:40:11');
INSERT INTO `sys_captcha`
VALUES ('86ddbf19-7da4-4779-8b1f-0b07263fbabd', 'n6666', '2021-09-03 15:56:24');
INSERT INTO `sys_captcha`
VALUES ('a13abdf6-77fb-4cc5-8ded-243216c3bc63', 'm6nyx', '2021-07-28 21:49:30');
INSERT INTO `sys_captcha`
VALUES ('c87913aa-b973-427f-8ab2-6bcc4b8affc2', '7dndw', '2021-09-15 15:37:18');
INSERT INTO `sys_captcha`
VALUES ('dc093cbd-bc1b-45ef-84ed-bf11e075597e', '5n2x3', '2021-09-15 16:31:06');
INSERT INTO `sys_captcha`
VALUES ('e53479a8-5e11-4524-820e-bf8687ebd1cf', 'bdcnc', '2021-07-28 21:49:38');
INSERT INTO `sys_captcha`
VALUES ('edd281a5-ca8e-4033-8102-c5af1f0d54af', 'p3ey7', '2021-09-15 15:57:11');
INSERT INTO `sys_captcha`
VALUES ('f8a00a8e-50c8-4093-86f4-37a9c88a5979', '6gf88', '2021-09-17 16:32:31');
INSERT INTO `sys_captcha`
VALUES ('f994919c-3b4f-4879-8114-e1d8c0a4a418', 'wbdg8', '2021-07-28 21:49:37');
INSERT INTO `sys_captcha`
VALUES ('fe229c13-7134-4dae-8f71-1b19f9f0b71b', 'b884n', '2021-09-19 15:43:27');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `param_key`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
    `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
    `status`      tinyint NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY',
        '{\"type\":2,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com\",\"aliyunPrefix\":\"root/tmp\",\"aliyunEndPoint\":\"oss-cn-shanghai.aliyuncs.com\",\"aliyunAccessKeyId\":\"LTAI5tSk34LPSLhwLHYuCQ4r\",\"aliyunAccessKeySecret\":\"SPdfT1v2CopG27s656Yqpf4g1zwx30\",\"aliyunBucketName\":\"bamboo-smoke-img\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"-null-null\"}',
        0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `username`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
    `operation`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
    `method`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方法',
    `params`      varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
    `time`        bigint NOT NULL COMMENT '执行时长(毫秒)',
    `ip`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
    `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log`
VALUES (1, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:9999/renren-fast/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]',
        8, '0:0:0:0:0:0:0:1', '2021-07-28 22:13:57');
INSERT INTO `sys_log`
VALUES (2, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()',
        '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"codecrab.top@gmail.com\",\"mobile\":\"17122840624\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]',
        77, '0:0:0:0:0:0:0:1', '2021-07-28 22:32:33');
INSERT INTO `sys_log`
VALUES (3, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()',
        '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"codecrab.top@gmail.com\",\"mobile\":\"17122840624\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]',
        3, '0:0:0:0:0:0:0:1', '2021-07-28 22:33:26');
INSERT INTO `sys_log`
VALUES (4, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()',
        '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"codecrab.top@gmail.com\",\"mobile\":\"17122840624\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]',
        4, '0:0:0:0:0:0:0:1', '2021-07-28 22:41:30');
INSERT INTO `sys_log`
VALUES (5, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()',
        '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"codecrab.top@gmail.com\",\"mobile\":\"17122840624\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]',
        3, '0:0:0:0:0:0:0:1', '2021-07-28 22:50:07');
INSERT INTO `sys_log`
VALUES (6, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Jul 28, 2021 10:51:06 PM\"}]',
        52, '0:0:0:0:0:0:0:1', '2021-07-28 22:51:07');
INSERT INTO `sys_log`
VALUES (7, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]',
        32, '0:0:0:0:0:0:0:1', '2021-07-28 22:52:13');
INSERT INTO `sys_log`
VALUES (8, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]',
        97, '0:0:0:0:0:0:0:1', '2021-07-28 22:59:27');
INSERT INTO `sys_log`
VALUES (9, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]',
        17, '0:0:0:0:0:0:0:1', '2021-07-28 22:59:39');
INSERT INTO `sys_log`
VALUES (10, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]',
        116, '0:0:0:0:0:0:0:1', '2021-07-28 23:00:30');
INSERT INTO `sys_log`
VALUES (11, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()',
        '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]',
        81, '0:0:0:0:0:0:0:1', '2021-07-28 23:06:30');
INSERT INTO `sys_log`
VALUES (12, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 18,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:07:26');
INSERT INTO `sys_log`
VALUES (13, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 8,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:08:58');
INSERT INTO `sys_log`
VALUES (14, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 8,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:09:21');
INSERT INTO `sys_log`
VALUES (15, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[[1]]', 16,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:10:15');
INSERT INTO `sys_log`
VALUES (16, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1]]', 36,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:42:39');
INSERT INTO `sys_log`
VALUES (17, 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1]]', 19,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:42:59');
INSERT INTO `sys_log`
VALUES (18, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1,2]]', 10,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:43:38');
INSERT INTO `sys_log`
VALUES (19, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1,2]]', 9,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:43:42');
INSERT INTO `sys_log`
VALUES (20, 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1,2]]', 43,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:59:12');
INSERT INTO `sys_log`
VALUES (21, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[[1]]', 19,
        '0:0:0:0:0:0:0:1', '2021-07-28 23:59:37');
INSERT INTO `sys_log`
VALUES (22, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()',
        '[{\"menuId\":111,\"parentId\":0,\"name\":\"社区管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]',
        8, '0:0:0:0:0:0:0:1', '2021-09-03 16:00:38');
INSERT INTO `sys_log`
VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":71,\"parentId\":111,\"name\":\"文章分类\",\"url\":\"api/category\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]',
        11, '0:0:0:0:0:0:0:1', '2021-09-03 16:01:50');
INSERT INTO `sys_log`
VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":76,\"parentId\":111,\"name\":\"用户评论\",\"url\":\"api/comment\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":6}]',
        4, '0:0:0:0:0:0:0:1', '2021-09-03 16:02:20');
INSERT INTO `sys_log`
VALUES (25, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":81,\"parentId\":111,\"name\":\"文章管理\",\"url\":\"api/post\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":6}]',
        6, '0:0:0:0:0:0:0:1', '2021-09-03 16:03:05');
INSERT INTO `sys_log`
VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":86,\"parentId\":111,\"name\":\"会员管理\",\"url\":\"api/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":6}]',
        6, '0:0:0:0:0:0:0:1', '2021-09-03 16:03:39');
INSERT INTO `sys_log`
VALUES (27, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":91,\"parentId\":111,\"name\":\"会员动作管理\",\"url\":\"api/useraction\",\"type\":1,\"icon\":\"geren\",\"orderNum\":6}]',
        7, '0:0:0:0:0:0:0:1', '2021-09-03 16:05:55');
INSERT INTO `sys_log`
VALUES (28, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()',
        '[{\"menuId\":112,\"parentId\":111,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]',
        7, '0:0:0:0:0:0:0:1', '2021-09-03 16:07:04');
INSERT INTO `sys_log`
VALUES (29, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":86,\"parentId\":112,\"name\":\"会员管理\",\"url\":\"api/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":6}]',
        7, '0:0:0:0:0:0:0:1', '2021-09-03 16:07:41');
INSERT INTO `sys_log`
VALUES (30, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":112,\"parentId\":111,\"name\":\"会员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]',
        19, '0:0:0:0:0:0:0:1', '2021-09-03 16:18:00');
INSERT INTO `sys_log`
VALUES (31, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":91,\"parentId\":112,\"name\":\"会员动作管理\",\"url\":\"api/useraction\",\"type\":1,\"icon\":\"geren\",\"orderNum\":6}]',
        7, '0:0:0:0:0:0:0:1', '2021-09-03 16:19:48');
INSERT INTO `sys_log`
VALUES (32, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":96,\"parentId\":112,\"name\":\"用户收藏管理\",\"url\":\"api/usercollection\",\"type\":1,\"icon\":\"shoucangfill\",\"orderNum\":6}]',
        7, '0:0:0:0:0:0:0:1', '2021-09-03 16:20:25');
INSERT INTO `sys_log`
VALUES (33, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":101,\"parentId\":112,\"name\":\"用户消息管理\",\"url\":\"api/usermessage\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":6}]',
        5, '0:0:0:0:0:0:0:1', '2021-09-03 16:20:48');
INSERT INTO `sys_log`
VALUES (34, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":106,\"parentId\":112,\"name\":\"会员社交登录管理\",\"url\":\"api/usersocial\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":6}]',
        6, '0:0:0:0:0:0:0:1', '2021-09-03 16:21:25');
INSERT INTO `sys_log`
VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":96,\"parentId\":112,\"name\":\"会员收藏管理\",\"url\":\"api/usercollection\",\"type\":1,\"icon\":\"shoucangfill\",\"orderNum\":6}]',
        8, '0:0:0:0:0:0:0:1', '2021-09-03 16:21:37');
INSERT INTO `sys_log`
VALUES (36, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":101,\"parentId\":112,\"name\":\"会员消息管理\",\"url\":\"api/usermessage\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":6}]',
        4, '0:0:0:0:0:0:0:1', '2021-09-03 16:21:50');
INSERT INTO `sys_log`
VALUES (37, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()',
        '[{\"id\":2,\"paramKey\":\"CLOUD_STORAGE_AVATAR_KEY\",\"paramValue\":\"{\\\"type\\\":2,\\\"qiniuDomain\\\":\\\"http://7xqbwh.dl1.z0.glb.clouddn.com\\\",\\\"qiniuPrefix\\\":\\\"upload\\\",\\\"qiniuAccessKey\\\":\\\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\\\",\\\"qiniuSecretKey\\\":\\\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\\\",\\\"qiniuBucketName\\\":\\\"ios-app\\\",\\\"aliyunDomain\\\":\\\"https://bamboo-smoke-img.oss-cn-shanghai.aliyuncs.com\\\",\\\"aliyunPrefix\\\":\\\"root/tmp\\\",\\\"aliyunEndPoint\\\":\\\"oss-cn-shanghai.aliyuncs.com\\\",\\\"aliyunAccessKeyId\\\":\\\"LTAI5tSk34LPSLhwLHYuCQ4r\\\",\\\"aliyunAccessKeySecret\\\":\\\"SPdfT1v2CopG27s656Yqpf4g1zwx30\\\",\\\"aliyunBucketName\\\":\\\"bamboo-smoke-img\\\",\\\"qcloudDomain\\\":\\\"\\\",\\\"qcloudPrefix\\\":\\\"\\\",\\\"qcloudSecretId\\\":\\\"\\\",\\\"qcloudSecretKey\\\":\\\"\\\",\\\"qcloudBucketName\\\":\\\"-null-null\\\"}\",\"remark\":\"\"}]',
        86, '0:0:0:0:0:0:0:1', '2021-09-10 14:56:12');
INSERT INTO `sys_log`
VALUES (38, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()',
        '[{\"menuId\":113,\"parentId\":111,\"name\":\"地区管理\",\"url\":\"api/region\",\"perms\":\"\",\"type\":1,\"icon\":\"dangdifill\",\"orderNum\":6}]',
        14, '0:0:0:0:0:0:0:1', '2021-09-14 13:57:57');
INSERT INTO `sys_log`
VALUES (39, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()',
        '[{\"menuId\":118,\"parentId\":113,\"name\":\"初始化\",\"url\":\"\",\"perms\":\"admin:region:init\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',
        27, '0:0:0:0:0:0:0:1', '2021-09-14 15:48:27');
INSERT INTO `sys_log`
VALUES (40, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[118]', 22,
        '0:0:0:0:0:0:0:1', '2021-09-14 17:50:41');
INSERT INTO `sys_log`
VALUES (41, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()',
        '[{\"menuId\":119,\"parentId\":113,\"name\":\"初始化\",\"url\":\"\",\"perms\":\"admin:region:init\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]',
        16, '0:0:0:0:0:0:0:1', '2021-09-15 13:41:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`   bigint NOT NULL AUTO_INCREMENT,
    `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
    `name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名称',
    `url`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
    `perms`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
    `type`      int NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
    `icon`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
    `order_num` int NULL DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu`
VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu`
VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu`
VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu`
VALUES (5, 1, 'SQL监控', 'http://localhost:9999/bamboosmoke/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu`
VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu`
VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu`
VALUES (27, 1, '参数管理', 'sys/config',
        'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu`
VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu`
VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu`
VALUES (71, 111, '文章分类', 'admin/category', NULL, 1, 'config', 6);
INSERT INTO `sys_menu`
VALUES (72, 71, '查看', NULL, 'admin:category:list,admin:category:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (73, 71, '新增', NULL, 'admin:category:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (74, 71, '修改', NULL, 'admin:category:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (75, 71, '删除', NULL, 'admin:category:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (76, 111, '用户评论', 'admin/comment', NULL, 1, 'pinglun', 6);
INSERT INTO `sys_menu`
VALUES (77, 76, '查看', NULL, 'admin:comment:list,admin:comment:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (78, 76, '新增', NULL, 'admin:comment:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (79, 76, '修改', NULL, 'admin:comment:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (80, 76, '删除', NULL, 'admin:comment:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (81, 111, '文章管理', 'admin/article', NULL, 1, 'bianji', 6);
INSERT INTO `sys_menu`
VALUES (82, 81, '查看', NULL, 'admin:article:list,admin:article:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (83, 81, '新增', NULL, 'admin:article:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (84, 81, '修改', NULL, 'admin:article:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (85, 81, '删除', NULL, 'admin:article:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (86, 112, '会员管理', 'admin/member', NULL, 1, 'admin', 6);
INSERT INTO `sys_menu`
VALUES (87, 86, '查看', NULL, 'admin:member:list,admin:member:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (88, 86, '新增', NULL, 'admin:member:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (89, 86, '修改', NULL, 'admin:member:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (90, 86, '删除', NULL, 'admin:member:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (91, 112, '会员动作管理', 'admin/memberaction', NULL, 1, 'geren', 6);
INSERT INTO `sys_menu`
VALUES (92, 91, '查看', NULL, 'admin:memberaction:list,admin:memberaction:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (93, 91, '新增', NULL, 'admin:memberaction:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (94, 91, '修改', NULL, 'admin:memberaction:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (95, 91, '删除', NULL, 'admin:memberaction:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (96, 112, '会员收藏管理', 'admin/membercollection', NULL, 1, 'shoucangfill', 6);
INSERT INTO `sys_menu`
VALUES (97, 96, '查看', NULL, 'admin:membercollection:list,admin:membercollection:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (98, 96, '新增', NULL, 'admin:membercollection:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (99, 96, '修改', NULL, 'admin:membercollection:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (100, 96, '删除', NULL, 'admin:membercollection:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (101, 112, '会员消息管理', 'admin/membermessage', NULL, 1, 'duanxin', 6);
INSERT INTO `sys_menu`
VALUES (102, 101, '查看', NULL, 'admin:membermessage:list,admin:membermessage:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (103, 101, '新增', NULL, 'admin:membermessage:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (104, 101, '修改', NULL, 'admin:membermessage:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (105, 101, '删除', NULL, 'admin:membermessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (106, 112, '会员社交登录管理', 'admin/membersocial', NULL, 1, 'mudedi', 6);
INSERT INTO `sys_menu`
VALUES (107, 106, '查看', NULL, 'admin:membersocial:list,admin:membersocial:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (108, 106, '新增', NULL, 'admin:membersocial:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (109, 106, '修改', NULL, 'admin:membersocial:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (110, 106, '删除', NULL, 'admin:membersocial:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (111, 0, '社区管理', '', '', 0, 'zonghe', 0);
INSERT INTO `sys_menu`
VALUES (112, 111, '会员管理', '', '', 0, 'tubiao', 0);
INSERT INTO `sys_menu`
VALUES (113, 111, '地区管理', 'admin/region', '', 1, 'dangdifill', 6);
INSERT INTO `sys_menu`
VALUES (114, 113, '查看', NULL, 'admin:region:list,admin:region:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (115, 113, '新增', NULL, 'admin:region:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (116, 113, '修改', NULL, 'admin:region:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (117, 113, '删除', NULL, 'admin:region:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (119, 113, '初始化', '', 'admin:region:init', 2, '', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `url`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL地址',
    `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件上传' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`        bigint NOT NULL AUTO_INCREMENT,
    `role_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
    `remark`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, 'admin', '系统管理员', 1, '2021-07-28 22:51:07');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint NOT NULL AUTO_INCREMENT,
    `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
    `menu_id` bigint NULL DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (1, 1, 1);
INSERT INTO `sys_role_menu`
VALUES (2, 1, 2);
INSERT INTO `sys_role_menu`
VALUES (3, 1, 15);
INSERT INTO `sys_role_menu`
VALUES (4, 1, 16);
INSERT INTO `sys_role_menu`
VALUES (5, 1, 17);
INSERT INTO `sys_role_menu`
VALUES (6, 1, 18);
INSERT INTO `sys_role_menu`
VALUES (7, 1, 3);
INSERT INTO `sys_role_menu`
VALUES (8, 1, 19);
INSERT INTO `sys_role_menu`
VALUES (9, 1, 20);
INSERT INTO `sys_role_menu`
VALUES (10, 1, 21);
INSERT INTO `sys_role_menu`
VALUES (11, 1, 22);
INSERT INTO `sys_role_menu`
VALUES (12, 1, 4);
INSERT INTO `sys_role_menu`
VALUES (13, 1, 23);
INSERT INTO `sys_role_menu`
VALUES (14, 1, 24);
INSERT INTO `sys_role_menu`
VALUES (15, 1, 25);
INSERT INTO `sys_role_menu`
VALUES (16, 1, 26);
INSERT INTO `sys_role_menu`
VALUES (17, 1, 5);
INSERT INTO `sys_role_menu`
VALUES (18, 1, 6);
INSERT INTO `sys_role_menu`
VALUES (19, 1, 7);
INSERT INTO `sys_role_menu`
VALUES (20, 1, 8);
INSERT INTO `sys_role_menu`
VALUES (21, 1, 9);
INSERT INTO `sys_role_menu`
VALUES (22, 1, 10);
INSERT INTO `sys_role_menu`
VALUES (23, 1, 11);
INSERT INTO `sys_role_menu`
VALUES (24, 1, 12);
INSERT INTO `sys_role_menu`
VALUES (25, 1, 13);
INSERT INTO `sys_role_menu`
VALUES (26, 1, 14);
INSERT INTO `sys_role_menu`
VALUES (27, 1, 27);
INSERT INTO `sys_role_menu`
VALUES (28, 1, 29);
INSERT INTO `sys_role_menu`
VALUES (29, 1, 30);
INSERT INTO `sys_role_menu`
VALUES (30, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`        bigint                                                       NOT NULL AUTO_INCREMENT,
    `username`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
    `password`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
    `salt`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '盐',
    `email`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
    `status`         tinyint NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
    `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者ID',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e',
        'codecrab.top@gmail.com', '17122840624', 1, 1, '2021-09-03 09:49:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`      bigint NOT NULL AUTO_INCREMENT,
    `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`
(
    `user_id`     bigint                                                        NOT NULL,
    `token`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
    `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token`
VALUES (1, 'c52901999621b8b0529af39887d4c10f', '2021-09-20 05:35:19', '2021-09-19 17:35:19');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`
(
    `user_id`     bigint                                                       NOT NULL AUTO_INCREMENT,
    `username`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
    `mobile`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
    `password`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user`
VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
        '2017-03-23 22:37:41');

SET
FOREIGN_KEY_CHECKS = 1;
