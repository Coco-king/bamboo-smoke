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

 Date: 11/09/2021 19:47:53
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
    `member_name`     varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
    `password`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
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
    `birthday`        datetime NULL DEFAULT NULL COMMENT '生日',
    `avatar`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
    `article_count`   int UNSIGNED NOT NULL COMMENT '内容数量',
    `comment_count`   int UNSIGNED NOT NULL COMMENT '评论数量',
    `status`          int                                                           NOT NULL DEFAULT 0 COMMENT '状态（0：未激活邮箱，1：正常，-1：已封禁）',
    `code`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '激活邮件地址',
    `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后的登陆时间',
    `is_deleted`      tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0：未删除，1：已注销账户）',
    `create_time`     datetime                                                      NOT NULL COMMENT '创建日期',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `memberName`(`member_name`) USING BTREE,
    UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
    UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bs_member
-- ----------------------------

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
    `id`              bigint   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `frobs_member_id` bigint   NOT NULL COMMENT '发送消息的用户ID',
    `to_member_id`    bigint   NOT NULL COMMENT '接收消息的用户ID',
    `article_id`      bigint NULL DEFAULT NULL COMMENT '消息可能关联的帖子',
    `comment_id`      bigint NULL DEFAULT NULL COMMENT '消息可能关联的评论',
    `content`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
    `type`            int NULL DEFAULT NULL COMMENT '消息类型（0：系统消息，1：回复文章，2：回复评论）',
    `status`          int NULL DEFAULT NULL COMMENT '消息状态（0：未读，1：已读）',
    `create_time`     datetime NOT NULL COMMENT '创建时间',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '修改时间',
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
VALUES ('RenrenScheduler', 'Codecrab1631360514672', 1631360741581, 15000);

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
VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1631361600000, -1, 5, 'WAITING', 'CRON',
        1627479868000, 0, NULL, 2,
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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = DYNAMIC;

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
VALUES ('31271459-c5a3-4c05-8d68-d7278bd8b304', 'pc8pn', '2021-09-09 15:52:25');
INSERT INTO `sys_captcha`
VALUES ('86ddbf19-7da4-4779-8b1f-0b07263fbabd', 'n6666', '2021-09-03 15:56:24');
INSERT INTO `sys_captcha`
VALUES ('a13abdf6-77fb-4cc5-8ded-243216c3bc63', 'm6nyx', '2021-07-28 21:49:30');
INSERT INTO `sys_captcha`
VALUES ('e53479a8-5e11-4524-820e-bf8687ebd1cf', 'bdcnc', '2021-07-28 21:49:38');
INSERT INTO `sys_captcha`
VALUES ('f994919c-3b4f-4879-8114-e1d8c0a4a418', 'wbdg8', '2021-07-28 21:49:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

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
VALUES (5, 1, 'SQL监控', 'http://localhost:9999/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
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
VALUES (71, 111, '文章分类', 'api/category', NULL, 1, 'config', 6);
INSERT INTO `sys_menu`
VALUES (72, 71, '查看', NULL, 'api:category:list,api:category:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (73, 71, '新增', NULL, 'api:category:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (74, 71, '修改', NULL, 'api:category:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (75, 71, '删除', NULL, 'api:category:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (76, 111, '用户评论', 'api/comment', NULL, 1, 'pinglun', 6);
INSERT INTO `sys_menu`
VALUES (77, 76, '查看', NULL, 'api:comment:list,api:comment:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (78, 76, '新增', NULL, 'api:comment:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (79, 76, '修改', NULL, 'api:comment:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (80, 76, '删除', NULL, 'api:comment:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (81, 111, '文章管理', 'api/article', NULL, 1, 'bianji', 6);
INSERT INTO `sys_menu`
VALUES (82, 81, '查看', NULL, 'api:article:list,api:article:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (83, 81, '新增', NULL, 'api:article:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (84, 81, '修改', NULL, 'api:article:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (85, 81, '删除', NULL, 'api:article:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (86, 112, '会员管理', 'api/member', NULL, 1, 'admin', 6);
INSERT INTO `sys_menu`
VALUES (87, 86, '查看', NULL, 'api:member:list,api:member:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (88, 86, '新增', NULL, 'api:member:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (89, 86, '修改', NULL, 'api:member:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (90, 86, '删除', NULL, 'api:member:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (91, 112, '会员动作管理', 'api/memberaction', NULL, 1, 'geren', 6);
INSERT INTO `sys_menu`
VALUES (92, 91, '查看', NULL, 'api:memberaction:list,api:memberaction:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (93, 91, '新增', NULL, 'api:memberaction:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (94, 91, '修改', NULL, 'api:memberaction:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (95, 91, '删除', NULL, 'api:memberaction:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (96, 112, '会员收藏管理', 'api/membercollection', NULL, 1, 'shoucangfill', 6);
INSERT INTO `sys_menu`
VALUES (97, 96, '查看', NULL, 'api:membercollection:list,api:membercollection:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (98, 96, '新增', NULL, 'api:membercollection:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (99, 96, '修改', NULL, 'api:membercollection:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (100, 96, '删除', NULL, 'api:membercollection:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (101, 112, '会员消息管理', 'api/membermessage', NULL, 1, 'duanxin', 6);
INSERT INTO `sys_menu`
VALUES (102, 101, '查看', NULL, 'api:membermessage:list,api:membermessage:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (103, 101, '新增', NULL, 'api:membermessage:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (104, 101, '修改', NULL, 'api:membermessage:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (105, 101, '删除', NULL, 'api:membermessage:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (106, 112, '会员社交登录管理', 'api/membersocial', NULL, 1, 'mudedi', 6);
INSERT INTO `sys_menu`
VALUES (107, 106, '查看', NULL, 'api:membersocial:list,api:membersocial:info', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (108, 106, '新增', NULL, 'api:membersocial:save', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (109, 106, '修改', NULL, 'api:membersocial:update', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (110, 106, '删除', NULL, 'api:membersocial:delete', 2, NULL, 6);
INSERT INTO `sys_menu`
VALUES (111, 0, '社区管理', '', '', 0, 'zonghe', 0);
INSERT INTO `sys_menu`
VALUES (112, 111, '会员管理', '', '', 0, 'tubiao', 0);

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
VALUES (1, 'd84492ca2bf7b88adcb8bab6bc9e0ebd', '2021-09-12 07:42:22', '2021-09-11 19:42:22');

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