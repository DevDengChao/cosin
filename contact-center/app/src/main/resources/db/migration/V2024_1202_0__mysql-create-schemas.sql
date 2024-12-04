-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 192.168.2.219    Database: cosinee
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cs_chatbot
-- ----------------------------
DROP TABLE IF EXISTS `cs_chatbot`;
CREATE TABLE `cs_chatbot`
(
    `ID`                     varchar(32)  NOT NULL COMMENT '主键ID',
    `base_url`               varchar(255) NOT NULL COMMENT '基础URL',
    `client_id`              varchar(32)  NOT NULL COMMENT 'Client Id',
    `secret`                 varchar(32)  NOT NULL COMMENT 'Client Secret',
    `creater`                varchar(32)  NOT NULL COMMENT '创建人',
    `createtime`             datetime     NOT NULL COMMENT '创建时间',
    `updatetime`             datetime     NOT NULL COMMENT '更新时间',
    `name`                   varchar(255) NOT NULL COMMENT '聊天机器人名字',
    `description`            varchar(255) DEFAULT NULL COMMENT '描述',
    `primary_language`       varchar(20)  DEFAULT NULL COMMENT '首选语言',
    `fallback`               varchar(255) DEFAULT NULL COMMENT '兜底回复',
    `welcome`                varchar(255) DEFAULT NULL COMMENT '欢迎语',
    `channel`                varchar(32)  NOT NULL COMMENT '渠道类型',
    `sns_account_identifier` varchar(100) NOT NULL COMMENT '渠道标识',
    `enabled`                tinyint(1)   DEFAULT '0' COMMENT '是否开启',
    `workmode`               varchar(32)  NOT NULL COMMENT '工作模式',
    `aisuggest`              tinyint(1)   DEFAULT '0' COMMENT '启用智能建议',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE KEY `snsid` (`sns_account_identifier`) USING BTREE COMMENT '按照渠道标识唯一'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='机器人客服表';

-- ----------------------------
-- Records of cs_chatbot
-- ----------------------------

-- ----------------------------
-- Table structure for cs_contact_notes
-- ----------------------------
DROP TABLE IF EXISTS `cs_contact_notes`;
CREATE TABLE `cs_contact_notes`
(
    `id`         varchar(32) NOT NULL COMMENT 'ID',
    `contactid`  varchar(32) NOT NULL COMMENT '联系人ID',
    `createtime` datetime    NOT NULL COMMENT '创建时间',
    `updatetime` datetime    NOT NULL COMMENT '更新时间',
    `category`   varchar(200)         DEFAULT NULL COMMENT '内容类型',
    `content`    text COMMENT '内容',
    `creater`    varchar(32)          DEFAULT NULL COMMENT '创建人',
    `datastatus` tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否已删除',
    `agentuser`  varchar(32)          DEFAULT NULL COMMENT '在线访客记录ID',
    `onlineuser` varchar(32)          DEFAULT NULL COMMENT '在线访客信息ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='联系人笔记表';

-- ----------------------------
-- Records of cs_contact_notes
-- ----------------------------

-- ----------------------------
-- Table structure for cs_fb_messenger
-- ----------------------------
DROP TABLE IF EXISTS `cs_fb_messenger`;
CREATE TABLE `cs_fb_messenger`
(
    `id`           varchar(32)  NOT NULL,
    `page_id`      varchar(100) NOT NULL,
    `token`        varchar(300) NOT NULL,
    `verify_token` varchar(100) NOT NULL,
    `name`         varchar(100) NOT NULL,
    `status`       varchar(100) NOT NULL,
    `organ`        varchar(32)  NOT NULL,
    `aiid`         varchar(32)   DEFAULT NULL,
    `ai`           tinyint(4)    DEFAULT '0' COMMENT '启用AI',
    `aisuggest`    tinyint(4)    DEFAULT '0' COMMENT '启用智能建议',
    `config`       varchar(1000) DEFAULT NULL COMMENT '文案配置',
    `createtime`   datetime     NOT NULL,
    `updatetime`   datetime     NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='FB渠道';

-- ----------------------------
-- Records of cs_fb_messenger
-- ----------------------------

-- ----------------------------
-- Table structure for cs_fb_otn
-- ----------------------------
DROP TABLE IF EXISTS `cs_fb_otn`;
CREATE TABLE `cs_fb_otn`
(
    `id`              varchar(32)   NOT NULL,
    `name`            varchar(100)  NOT NULL,
    `page_id`         varchar(100)  NOT NULL,
    `pre_sub_message` varchar(500) DEFAULT NULL,
    `sub_message`     varchar(500)  NOT NULL,
    `success_message` varchar(500) DEFAULT NULL,
    `otn_message`     varchar(1000) NOT NULL,
    `status`          varchar(50)   NOT NULL,
    `createtime`      datetime      NOT NULL,
    `updatetime`      datetime      NOT NULL,
    `sendtime`        datetime     DEFAULT NULL,
    `sub_num`         int(11)       NOT NULL,
    `melink_num`      int(11)       NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='FB OTN';

-- ----------------------------
-- Records of cs_fb_otn
-- ----------------------------

-- ----------------------------
-- Table structure for cs_fb_otn_follow
-- ----------------------------
DROP TABLE IF EXISTS `cs_fb_otn_follow`;
CREATE TABLE `cs_fb_otn_follow`
(
    `id`         varchar(32)  NOT NULL,
    `page_id`    varchar(32)  NOT NULL,
    `otn_id`     varchar(32)  NOT NULL,
    `user_id`    varchar(300) NOT NULL,
    `otn_token`  varchar(300) NOT NULL,
    `createtime` datetime     NOT NULL,
    `updatetime` datetime     NOT NULL,
    `sendtime`   datetime DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='FB OTN 订阅';

-- ----------------------------
-- Records of cs_fb_otn_follow
-- ----------------------------

-- ----------------------------
-- Table structure for cs_metakv
-- ----------------------------
DROP TABLE IF EXISTS `cs_metakv`;
CREATE TABLE `cs_metakv`
(
    `metakey`    varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '元数据字段名，唯一标识',
    `metavalue`  text COLLATE utf8mb4_unicode_ci COMMENT '元数据值',
    `createtime` datetime                                         DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updatetime` datetime                                         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `datatype`   varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string' COMMENT '数据类型',
    `comment`    varchar(1024) COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '字段备注描述',
    PRIMARY KEY (`metakey`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='系统内置元数据';

-- ----------------------------
-- Records of cs_metakv
-- ----------------------------

-- ----------------------------
-- Table structure for cs_organ_user
-- ----------------------------
DROP TABLE IF EXISTS `cs_organ_user`;
CREATE TABLE `cs_organ_user`
(
    `userid`     varchar(32) NOT NULL COMMENT '用户ID',
    `organ`      varchar(32) NOT NULL COMMENT '组织机构ID',
    `createtime` datetime    DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `creator`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `updatetime` datetime    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`userid`, `organ`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='部门人员表';

-- ----------------------------
-- Records of cs_organ_user
-- ----------------------------
INSERT INTO `cs_organ_user`
VALUES ('2c9e80867d65eb5c017d65f68569006b', '2c9e80867d65eb5c017d65f17ceb0019', null, null, null);
INSERT INTO `cs_organ_user`
VALUES ('4028cac3614cd2f901614cf8be1f0324', '4028a0866f9403f1016f9405a05d000e', null,
        '4028cac3614cd2f901614cf8be1f0324', null);

-- ----------------------------
-- Table structure for cs_stream_file
-- ----------------------------
DROP TABLE IF EXISTS `cs_stream_file`;
CREATE TABLE `cs_stream_file`
(
    `id`          varchar(32)  NOT NULL COMMENT '文件ID',
    `name`        varchar(300) NOT NULL COMMENT '文件名称',
    `fileurl`     varchar(500) DEFAULT NULL COMMENT '文件访问URL路径',
    `data`        mediumblob   NOT NULL COMMENT '原始文件',
    `thumbnail`   mediumblob COMMENT '缩略图',
    `mime`        varchar(200) DEFAULT NULL COMMENT '文件类型 Content Type',
    `cooperation` mediumblob COMMENT '协作文件',
    `createtime`  datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='文件';

-- ----------------------------
-- Records of cs_stream_file
-- ----------------------------

-- ----------------------------
-- Table structure for cs_user
-- ----------------------------
DROP TABLE IF EXISTS `cs_user`;
CREATE TABLE `cs_user`
(
    `ID`               varchar(32) NOT NULL COMMENT '主键ID',
    `LANGUAGE`         varchar(255) DEFAULT NULL COMMENT '语言',
    `USERNAME`         varchar(50)  DEFAULT NULL COMMENT '用户名',
    `PASSWORD`         varchar(255) DEFAULT NULL COMMENT '密码',
    `SECURECONF`       varchar(255) DEFAULT NULL COMMENT '安全级别',
    `email`            varchar(255) DEFAULT NULL COMMENT '邮件',
    `FIRSTNAME`        varchar(255) DEFAULT NULL COMMENT '姓',
    `MIDNAME`          varchar(255) DEFAULT NULL COMMENT '名',
    `LASTNAME`         varchar(255) DEFAULT NULL COMMENT '名',
    `JOBTITLE`         varchar(255) DEFAULT NULL COMMENT '职位',
    `GENDER`           varchar(255) DEFAULT NULL COMMENT '性别',
    `BIRTHDAY`         varchar(255) DEFAULT NULL COMMENT '生日',
    `nickname`         varchar(255) DEFAULT NULL COMMENT '昵称',
    `rulename`         varchar(255) DEFAULT NULL COMMENT '角色',
    `SEARCHPROJECTID`  varchar(255) DEFAULT NULL COMMENT '备用',
    `creater`          varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`       datetime     DEFAULT NULL COMMENT '创建时间',
    `memo`             varchar(255) DEFAULT NULL COMMENT '备注',
    `updatetime`       datetime     DEFAULT NULL COMMENT '更新时间',
    `mobile`           varchar(32)  DEFAULT NULL COMMENT '手机号',
    `passupdatetime`   datetime     DEFAULT NULL COMMENT '最后 一次密码修改时间',
    `sign`             text COMMENT '签名',
    `del`              tinyint(4)   DEFAULT '0' COMMENT '是否已删除',
    `uname`            varchar(100) DEFAULT NULL COMMENT '姓名',
    `musteditpassword` tinyint(4)   DEFAULT NULL COMMENT '登录修改密码',
    `agent`            tinyint(4)   DEFAULT NULL COMMENT '工号',
    `province`         varchar(50)  DEFAULT NULL COMMENT '省份',
    `city`             varchar(50)  DEFAULT NULL COMMENT '城市',
    `fans`             int(11)      DEFAULT NULL COMMENT '关注人数',
    `follows`          int(11)      DEFAULT NULL COMMENT '被关注次数',
    `integral`         int(11)      DEFAULT NULL COMMENT '积分',
    `lastlogintime`    datetime     DEFAULT NULL COMMENT '最后登录时间',
    `status`           varchar(10)  DEFAULT NULL COMMENT '状态',
    `deactivetime`     datetime     DEFAULT NULL COMMENT '离线时间',
    `title`            varchar(50)  DEFAULT NULL COMMENT '标题',
    `datastatus`       tinyint(4)   DEFAULT NULL COMMENT '数据状态',
    `callcenter`       tinyint(4)   DEFAULT NULL COMMENT '启用呼叫中心坐席',
    `superadmin`       tinyint(4)   DEFAULT NULL COMMENT '系统管理员',
    `admin`            tinyint(4)   DEFAULT NULL COMMENT '管理员',
    `maxuser`          int(11)      DEFAULT '0' COMMENT '最大接入访客数量',
    `ordertype`        varchar(20)  DEFAULT NULL COMMENT '默认排序方式',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE KEY `index_username_unique` (`USERNAME`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='用户表';

-- ----------------------------
-- Records of cs_user
-- ----------------------------
INSERT INTO `cs_user`
VALUES ('2c9e80867d65eb5c017d65f68569006b', null, 'zhangsan', 'a3200fc0555130d9db777d6f942c431d', '5',
        'zhangsan@cc.com', null, null, null, null, null, null, null, null, null, null, '2021-11-28 17:53:14', null,
        '2021-11-28 17:53:14', '15899999999', '2021-11-28 17:53:14', null, '0', '张三', null, '1', null, null, '0', '0',
        '0', '2021-12-04 17:04:44', null, null, null, '0', '0', '0', '0', '0', null);
INSERT INTO `cs_user`
VALUES ('4028cac3614cd2f901614cf8be1f0324', null, 'admin', '5d80253b1cd5e5d4ca5ed539f4d72052', '5', 'admin@cc.com',
        null, null, null, null, null, null, '0', null, null, null, '2017-03-16 13:56:34', '北京', '2021-11-28 17:47:03',
        '18888888888', null, null, '0', '系统管理员', '0', '1', '北京', '北京', '2', '1', '0', '2021-12-04 16:58:59',
        null, null, null, '0', '0', '1', '1', '0', null);

-- ----------------------------
-- Table structure for uk_act_callagent
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_callagent`;
CREATE TABLE `uk_act_callagent`
(
    `ID`          varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`        varchar(50) DEFAULT NULL COMMENT '坐席名称',
    `CODE`        varchar(50) DEFAULT NULL COMMENT '坐席代码',
    `CREATETIME`  datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`     varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`  datetime    DEFAULT NULL COMMENT '更新时间',
    `USERNAME`    varchar(50) DEFAULT NULL COMMENT '用户名',
    `STATUS`      varchar(50) DEFAULT NULL COMMENT '坐席状态',
    `PARENTID`    varchar(32) DEFAULT NULL COMMENT '上级ID',
    `FILTERTYPE`  varchar(32) DEFAULT NULL COMMENT '筛选类型（批次筛选/元数据筛选）',
    `BATID`       varchar(32) DEFAULT NULL COMMENT '筛选表单使用的批次ID',
    `TABLEID`     varchar(32) DEFAULT NULL COMMENT '筛选表单使用元数据ID',
    `DATASTATUS`  tinyint(4)  DEFAULT '0' COMMENT '数据状态',
    `INX`         int(11)     DEFAULT '0' COMMENT '分类排序序号',
    `ORGAN`       varchar(32) DEFAULT NULL COMMENT '部门',
    `DESCRIPTION` text COMMENT '描述信息',
    `distype`     varchar(32) DEFAULT NULL COMMENT '分配类型',
    `distarget`   varchar(32) DEFAULT NULL COMMENT '分配对象',
    `disnum`      varchar(32) DEFAULT NULL COMMENT '分配数据',
    `ACTID`       varchar(32) DEFAULT NULL COMMENT '活动ID',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电销活动名单分配表';

-- ----------------------------
-- Records of uk_act_callagent
-- ----------------------------

-- ----------------------------
-- Table structure for uk_act_filter_his
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_filter_his`;
CREATE TABLE `uk_act_filter_his`
(
    `ID`            varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`          varchar(50)  DEFAULT NULL COMMENT '筛选名称',
    `CODE`          varchar(50)  DEFAULT NULL COMMENT '筛选代码',
    `CREATETIME`    datetime     DEFAULT NULL COMMENT '创建时间',
    `CREATER`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`    datetime     DEFAULT NULL COMMENT '更新时间',
    `USERNAME`      varchar(50)  DEFAULT NULL COMMENT '用户名',
    `STATUS`        varchar(50)  DEFAULT NULL COMMENT '状态',
    `PARENTID`      varchar(32)  DEFAULT NULL COMMENT '上级ID',
    `ACTID`         varchar(32)  DEFAULT NULL COMMENT '活动ID',
    `INX`           int(11)      DEFAULT '0' COMMENT '分类排序序号',
    `NAMENUM`       int(11)      DEFAULT '0' COMMENT '批次包含的名单总数',
    `VALIDNUM`      int(11)      DEFAULT '0' COMMENT '批次包含的有效名单总数',
    `INVALIDNUM`    int(11)      DEFAULT '0' COMMENT '批次包含的无效名单总数',
    `ASSIGNED`      int(11)      DEFAULT '0' COMMENT '已分配名单总数',
    `NOTASSIGNED`   int(11)      DEFAULT '0' COMMENT '未分配名单总数',
    `ENABLE`        tinyint(4)   DEFAULT '0' COMMENT '分类状态',
    `DATASTATUS`    tinyint(4)   DEFAULT '0' COMMENT '数据状态',
    `ORGAN`         varchar(32)  DEFAULT NULL COMMENT '部门',
    `DESCRIPTION`   text COMMENT '备注',
    `execnum`       int(11)      DEFAULT '0' COMMENT '导入次数',
    `SOURCE`        varchar(255) DEFAULT NULL COMMENT '来源',
    `BATID`         varchar(32)  DEFAULT NULL COMMENT '批次ID',
    `FILTERID`      varchar(32)  DEFAULT NULL COMMENT '筛选表单ID',
    `ASSIGNEDORGAN` int(11)      DEFAULT '0' COMMENT '分配部门',
    `exectype`      varchar(32)  DEFAULT NULL COMMENT '执行类型',
    `renum`         int(11)      DEFAULT '0' COMMENT '分配数量',
    `reorgannum`    int(11)      DEFAULT '0' COMMENT '部门分配数量',
    `assignedai`    int(11)      DEFAULT '0' COMMENT '分配到AI的名单数量',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='筛选记录表';

-- ----------------------------
-- Records of uk_act_filter_his
-- ----------------------------

-- ----------------------------
-- Table structure for uk_act_formfilter
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_formfilter`;
CREATE TABLE `uk_act_formfilter`
(
    `ID`          varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`        varchar(50) DEFAULT NULL COMMENT '筛选表单名称',
    `CODE`        varchar(50) DEFAULT NULL COMMENT '筛选表单代码',
    `CREATETIME`  datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`     varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`  datetime    DEFAULT NULL COMMENT '更新时间',
    `USERNAME`    varchar(50) DEFAULT NULL COMMENT '创建人名称',
    `STATUS`      varchar(50) DEFAULT NULL COMMENT '状态',
    `PARENTID`    varchar(32) DEFAULT NULL COMMENT '上级ID',
    `FILTERTYPE`  varchar(32) DEFAULT NULL COMMENT '筛选类型（批次筛选/元数据筛选）',
    `BATID`       varchar(32) DEFAULT NULL COMMENT '筛选表单使用的批次ID',
    `TABLEID`     varchar(32) DEFAULT NULL COMMENT '筛选表单使用元数据ID',
    `DATASTATUS`  tinyint(4)  DEFAULT '0' COMMENT '数据状态',
    `INX`         int(11)     DEFAULT '0' COMMENT '分类排序序号',
    `ORGAN`       varchar(32) DEFAULT NULL COMMENT '部门',
    `DESCRIPTION` text COMMENT '备注信息',
    `execnum`     int(11)     DEFAULT '0' COMMENT '导入次数',
    `filternum`   int(11)     DEFAULT '0' COMMENT '筛选次数',
    `conditional` int(11)     DEFAULT '0' COMMENT '条件个数',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='筛选表单';

-- ----------------------------
-- Records of uk_act_formfilter
-- ----------------------------

-- ----------------------------
-- Table structure for uk_act_formfilter_item
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_formfilter_item`;
CREATE TABLE `uk_act_formfilter_item`
(
    `id`           varchar(32) NOT NULL COMMENT '主键ID',
    `creater`      varchar(32) DEFAULT NULL COMMENT '创建人',
    `createtime`   datetime    DEFAULT NULL COMMENT '创建时间',
    `updatetime`   datetime    DEFAULT NULL COMMENT '更新时间',
    `formfilterid` varchar(32) DEFAULT NULL COMMENT '筛选器ID',
    `field`        varchar(32) DEFAULT NULL COMMENT '字段',
    `cond`         varchar(32) DEFAULT NULL COMMENT '条件',
    `value`        varchar(32) DEFAULT NULL COMMENT '取值',
    `contype`      varchar(32) DEFAULT NULL COMMENT '条件类型',
    `itemtype`     varchar(32) DEFAULT NULL COMMENT '类型',
    `comp`         varchar(50) DEFAULT NULL COMMENT '逻辑条件',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='筛选项';

-- ----------------------------
-- Records of uk_act_formfilter_item
-- ----------------------------

-- ----------------------------
-- Table structure for uk_act_role
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_role`;
CREATE TABLE `uk_act_role`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `rolename`   varchar(50) DEFAULT NULL COMMENT '角色名称',
    `roleid`     varchar(50) DEFAULT NULL COMMENT '角色id',
    `bustype`    varchar(50) DEFAULT NULL COMMENT '业务类型',
    `organid`    text COMMENT '授权部门id',
    `createtime` datetime    DEFAULT NULL COMMENT '创建时间',
    `creater`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `updatetime` datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电销角色授权表';

-- ----------------------------
-- Records of uk_act_role
-- ----------------------------

-- ----------------------------
-- Table structure for uk_act_task
-- ----------------------------
DROP TABLE IF EXISTS `uk_act_task`;
CREATE TABLE `uk_act_task`
(
    `ID`            varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`          varchar(50)  DEFAULT NULL COMMENT '任务名称',
    `CODE`          varchar(50)  DEFAULT NULL COMMENT '任务代码',
    `CREATETIME`    datetime     DEFAULT NULL COMMENT '创建时间',
    `CREATER`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`    datetime     DEFAULT NULL COMMENT '更新时间',
    `USERNAME`      varchar(50)  DEFAULT NULL COMMENT '创建人名称',
    `STATUS`        varchar(50)  DEFAULT NULL COMMENT '状态',
    `PARENTID`      varchar(32)  DEFAULT NULL COMMENT '上级ID',
    `ACTID`         varchar(32)  DEFAULT NULL COMMENT '活动ID',
    `INX`           int(11)      DEFAULT '0' COMMENT '分类排序序号',
    `NAMENUM`       int(11)      DEFAULT '0' COMMENT '批次包含的名单总数',
    `VALIDNUM`      int(11)      DEFAULT '0' COMMENT '批次包含的有效名单总数',
    `INVALIDNUM`    int(11)      DEFAULT '0' COMMENT '批次包含的无效名单总数',
    `ASSIGNED`      int(11)      DEFAULT '0' COMMENT '已分配名单总数',
    `NOTASSIGNED`   int(11)      DEFAULT '0' COMMENT '未分配名单总数',
    `ENABLE`        tinyint(4)   DEFAULT '0' COMMENT '分类状态',
    `DATASTATUS`    tinyint(4)   DEFAULT '0' COMMENT '数据状态',
    `ORGAN`         varchar(32)  DEFAULT NULL COMMENT '部门',
    `DESCRIPTION`   text COMMENT '备注信息',
    `execnum`       int(11)      DEFAULT '0' COMMENT '导入次数',
    `SOURCE`        varchar(255) DEFAULT NULL COMMENT '来源信息',
    `BATID`         varchar(32)  DEFAULT NULL COMMENT '批次ID',
    `FILTERID`      varchar(32)  DEFAULT NULL COMMENT '筛选ID',
    `ASSIGNEDORGAN` int(11)      DEFAULT '0' COMMENT '分配给部门',
    `exectype`      varchar(32)  DEFAULT NULL COMMENT '执行类型',
    `renum`         int(11)      DEFAULT '0' COMMENT '分配数量',
    `reorgannum`    int(11)      DEFAULT '0' COMMENT '分配到部门数量',
    `assignedai`    int(11)      DEFAULT '0' COMMENT '分配到AI的名单数量',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电销任务表';

-- ----------------------------
-- Records of uk_act_task
-- ----------------------------

-- ----------------------------
-- Table structure for uk_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `uk_ad_position`;
CREATE TABLE `uk_ad_position`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`       varchar(50)  DEFAULT NULL COMMENT '名称',
    `CODE`       varchar(50)  DEFAULT NULL COMMENT '代码',
    `CREATETIME` datetime     DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime     DEFAULT NULL COMMENT '更新时间',
    `USERNAME`   varchar(50)  DEFAULT NULL COMMENT '创建人名称',
    `PARENTID`   varchar(32)  DEFAULT NULL COMMENT '知识库分类上级ID',
    `INX`        int(11)      DEFAULT NULL COMMENT '分类排序序号',
    `ENABLE`     tinyint(4)   DEFAULT NULL COMMENT '分类状态',
    `AREA`       text COMMENT '分类描述',
    `IMGURL`     varchar(255) DEFAULT NULL COMMENT '图片URL',
    `TIPTEXT`    varchar(100) DEFAULT NULL COMMENT '提示文本',
    `URL`        text COMMENT '路径',
    `CONTENT`    text COMMENT '内容',
    `WEIGHT`     int(11)      DEFAULT NULL COMMENT '权重',
    `ADTYPE`     varchar(50)  DEFAULT NULL COMMENT '广告类型',
    `STATUS`     varchar(32)  DEFAULT NULL COMMENT '广告状态',
    `ADPOS`      varchar(32)  DEFAULT NULL COMMENT '广告位置',
    `skill`      varchar(32)  DEFAULT NULL COMMENT '组织机构ID',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='客服客户端广告位表';

-- ----------------------------
-- Records of uk_ad_position
-- ----------------------------

-- ----------------------------
-- Table structure for uk_agentservice
-- ----------------------------
DROP TABLE IF EXISTS `uk_agentservice`;
CREATE TABLE `uk_agentservice`
(
    `id`                  varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `username`            varchar(100)         DEFAULT '' COMMENT '创建人用户名',
    `agentno`             varchar(100)         DEFAULT '' COMMENT '坐席ID',
    `userid`              varchar(100)         DEFAULT '' COMMENT '用户ID',
    `channeltype`         varchar(100)         DEFAULT '' COMMENT '渠道',
    `logindate`           datetime             DEFAULT NULL COMMENT '登录时间',
    `source`              varchar(100)         DEFAULT '' COMMENT '来源',
    `endtime`             datetime             DEFAULT NULL COMMENT '结束时间',
    `nickname`            varchar(100)         DEFAULT '' COMMENT '昵称',
    `city`                varchar(100)         DEFAULT '' COMMENT '城市',
    `province`            varchar(100)         DEFAULT '' COMMENT '省份',
    `country`             varchar(100)         DEFAULT '' COMMENT '国家',
    `headImgUrl`          varchar(255)         DEFAULT '' COMMENT '头像URL',
    `waittingtime`        int(11)              DEFAULT '0' COMMENT '等待时间',
    `tokenum`             int(11)              DEFAULT '0' COMMENT '未回复消息数量',
    `createtime`          datetime             DEFAULT NULL COMMENT '创建时间',
    `updatetime`          datetime             DEFAULT NULL COMMENT '更新时间',
    `status`              varchar(100)         DEFAULT '' COMMENT '状态',
    `appid`               varchar(100)         DEFAULT '' COMMENT 'SNSID',
    `sessiontype`         varchar(100)         DEFAULT '' COMMENT '会话类型',
    `contextid`           varchar(100)         DEFAULT '' COMMENT '会话ID',
    `agentserviceid`      varchar(100)         DEFAULT '' COMMENT '服务记录ID',
    `snsuser`             varchar(100)         DEFAULT '' COMMENT '用户ID（微信）',
    `lastmessage`         datetime             DEFAULT NULL COMMENT '最后一条消息时间',
    `waittingtimestart`   datetime             DEFAULT NULL COMMENT '进入排队时间',
    `lastgetmessage`      datetime             DEFAULT NULL COMMENT '坐席最后一条消息时间',
    `lastmsg`             text COMMENT '最后一条消息内容',
    `agentskill`          varchar(100)         DEFAULT '' COMMENT '技能组',
    `create_time`         datetime             DEFAULT NULL COMMENT '创建时间',
    `creater`             varchar(255)         DEFAULT NULL COMMENT '创建人',
    `update_time`         datetime             DEFAULT NULL COMMENT '修改时间',
    `update_user`         varchar(255)         DEFAULT NULL COMMENT '修改人',
    `assignedto`          varchar(255)         DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`            varchar(255)         DEFAULT NULL COMMENT '流程状态',
    `shares`              varchar(255)         DEFAULT NULL COMMENT '分享给',
    `owner`               varchar(255)         DEFAULT NULL COMMENT '所属人',
    `datadept`            varchar(255)         DEFAULT NULL COMMENT '创建人部门',
    `intime`              int(32)              DEFAULT NULL COMMENT '接入时间',
    `batid`               varchar(32)          DEFAULT NULL COMMENT '批次ID',
    `ipaddr`              varchar(50)          DEFAULT NULL COMMENT 'IP地址',
    `osname`              varchar(100)         DEFAULT NULL COMMENT '操作系统名称',
    `browser`             varchar(100)         DEFAULT NULL COMMENT '浏览器',
    `sessiontimes`        bigint(64)           DEFAULT NULL COMMENT '会话时长',
    `servicetime`         datetime             DEFAULT NULL COMMENT '服务时长',
    `region`              varchar(255)         DEFAULT NULL COMMENT '区域',
    `agentusername`       varchar(50)          DEFAULT NULL COMMENT '坐席用户名',
    `times`               int(10)              DEFAULT NULL COMMENT '消息数量',
    `dataid`              varchar(32)          DEFAULT NULL COMMENT '数据ID',
    `contactsid`          varchar(32)          DEFAULT NULL COMMENT '联系人ID',
    `createdate`          varchar(32)          DEFAULT NULL COMMENT '消息到达时间',
    `name`                varchar(100)         DEFAULT NULL COMMENT '访客填写的姓名',
    `email`               varchar(100)         DEFAULT NULL COMMENT '访客填写的邮件地址',
    `phone`               varchar(100)         DEFAULT NULL COMMENT '访客填写的电话号码',
    `resion`              varchar(255)         DEFAULT NULL COMMENT '访客填写的来访原因',
    `satisfaction`        tinyint(4)           DEFAULT NULL COMMENT '满意度调查评级',
    `satistime`           datetime             DEFAULT NULL COMMENT '满意度调查时间',
    `satislevel`          varchar(50)          DEFAULT NULL COMMENT '满意度评分',
    `satiscomment`        varchar(255)         DEFAULT NULL COMMENT '满意度备注',
    `trans`               tinyint(4)           DEFAULT NULL COMMENT '是否转接',
    `transtime`           datetime             DEFAULT NULL COMMENT '转接时间',
    `transmemo`           text COMMENT '转接备注',
    `agentreplyinterval`  int(11)              DEFAULT NULL COMMENT '坐席评级回复间隔',
    `agentreplytime`      int(11)              DEFAULT NULL COMMENT '坐席评级回复时间',
    `avgreplyinterval`    int(11)              DEFAULT NULL COMMENT '访客平均回复间隔',
    `avgreplytime`        int(11)              DEFAULT NULL COMMENT '访客回复总时长',
    `agentreplys`         int(11)              DEFAULT NULL COMMENT '坐席回复消息数量',
    `userasks`            int(11)              DEFAULT NULL COMMENT '访客发送消息数量',
    `agentuserid`         varchar(32)          DEFAULT NULL COMMENT '访客ID',
    `sessionid`           varchar(32)          DEFAULT NULL COMMENT '会话ID',
    `qualitystatus`       varchar(20)          DEFAULT NULL COMMENT '质检状态',
    `qualitydisorgan`     varchar(32)          DEFAULT NULL COMMENT '质检分配部门',
    `qualitydisuser`      varchar(32)          DEFAULT NULL COMMENT '质检分配用户',
    `qualityorgan`        varchar(32)          DEFAULT NULL COMMENT '质检部门',
    `qualityuser`         varchar(32)          DEFAULT NULL COMMENT '质检用户',
    `qualitytime`         datetime             DEFAULT NULL COMMENT '质检时间',
    `qualitytype`         varchar(20)          DEFAULT NULL COMMENT '质检方式',
    `qualityscore`        int(11)              DEFAULT '0' COMMENT '质检打分',
    `solvestatus`         varchar(20)          DEFAULT NULL COMMENT '问题解决状态',
    `leavemsg`            tinyint(4)           DEFAULT '0' COMMENT '是否留言',
    `initiator`           varchar(32)          DEFAULT NULL COMMENT '对话发起方',
    `agenttimeout`        int(11)              DEFAULT '0' COMMENT '坐席超时时长',
    `agenttimeouttimes`   int(11)              DEFAULT '0' COMMENT '坐席超时次数',
    `servicetimeout`      tinyint(4)           DEFAULT '0',
    `agentservicetimeout` int(11)              DEFAULT '0' COMMENT '服务超时',
    `agentfrewords`       int(11)              DEFAULT '0' COMMENT '坐席触发敏感词',
    `servicefrewords`     int(11)              DEFAULT '0' COMMENT '访客触发敏感词',
    `leavemsgstatus`      varchar(20)          DEFAULT 'notprocess' COMMENT '留言处理状态',
    `agent`               varchar(32)          DEFAULT NULL COMMENT '坐席',
    `skill`               varchar(32)          DEFAULT NULL COMMENT '技能组',
    `endby`               varchar(20)          DEFAULT NULL COMMENT '终止方',
    `aiid`                varchar(32)          DEFAULT NULL COMMENT 'AIID',
    `aiservice`           tinyint(4)           DEFAULT '0' COMMENT '是否AI服务',
    `foragent`            tinyint(4)           DEFAULT '0' COMMENT '直接转人工',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='在线客服服务记录表';

-- ----------------------------
-- Records of uk_agentservice
-- ----------------------------

-- ----------------------------
-- Table structure for uk_agentstatus
-- ----------------------------
DROP TABLE IF EXISTS `uk_agentstatus`;
CREATE TABLE `uk_agentstatus`
(
    `id`             varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `agentno`        varchar(100)         DEFAULT '' COMMENT '坐席ID',
    `logindate`      datetime             DEFAULT NULL COMMENT '登录时间',
    `status`         varchar(100)         DEFAULT '' COMMENT '状态',
    `agentserviceid` varchar(100)         DEFAULT '' COMMENT '服务ID',
    `serusernum`     int(11)              DEFAULT '0' COMMENT '服务用户数',
    `users`          int(11)              DEFAULT '0' COMMENT '接入用户数',
    `maxusers`       int(11)              DEFAULT '0' COMMENT '最大接入用户数',
    `username`       varchar(100)         DEFAULT '' COMMENT '用户名',
    `name`           varchar(100)         DEFAULT '' COMMENT '名称',
    `updatetime`     datetime             DEFAULT NULL COMMENT '更新时间',
    `userid`         varchar(100)         DEFAULT '' COMMENT '用户ID',
    `createtime`     datetime             DEFAULT NULL COMMENT '创建时间',
    `creater`        varchar(255)         DEFAULT NULL COMMENT '创建人',
    `update_time`    datetime             DEFAULT NULL COMMENT '修改时间',
    `update_user`    varchar(255)         DEFAULT NULL COMMENT '修改人',
    `assignedto`     varchar(255)         DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`       varchar(255)         DEFAULT NULL COMMENT '流程状态',
    `shares`         varchar(255)         DEFAULT NULL COMMENT '分享给',
    `owner`          varchar(255)         DEFAULT NULL COMMENT '所属人',
    `datadept`       varchar(255)         DEFAULT NULL COMMENT '创建人部门',
    `batid`          varchar(32)          DEFAULT NULL COMMENT '批次ID',
    `pulluser`       tinyint(4)           DEFAULT NULL COMMENT '是否允许拉取用户',
    `busy`           tinyint(4)           DEFAULT '0' COMMENT '示忙',
    `workstatus`     varchar(50)          DEFAULT NULL COMMENT '工作状态',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='在线客服坐席状态表';

-- ----------------------------
-- Records of uk_agentstatus
-- ----------------------------

-- ----------------------------
-- Table structure for uk_agentuser
-- ----------------------------
DROP TABLE IF EXISTS `uk_agentuser`;
CREATE TABLE `uk_agentuser`
(
    `id`                  varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `username`            varchar(100)         DEFAULT '' COMMENT '用户名',
    `userid`              varchar(100)         DEFAULT '' COMMENT '用户ID',
    `channeltype`         varchar(100)         DEFAULT '' COMMENT '渠道',
    `logindate`           datetime             DEFAULT NULL COMMENT '登录时间',
    `source`              varchar(100)         DEFAULT '' COMMENT '来源',
    `endtime`             datetime             DEFAULT NULL COMMENT '结束时间',
    `nickname`            varchar(100)         DEFAULT '' COMMENT '昵称',
    `city`                varchar(100)         DEFAULT '' COMMENT '城市',
    `province`            varchar(100)         DEFAULT '' COMMENT '省份',
    `country`             varchar(100)         DEFAULT '' COMMENT '国家',
    `headImgUrl`          varchar(255)         DEFAULT '' COMMENT '头像URL',
    `waittingtime`        int(11)              DEFAULT '0' COMMENT '等待时长',
    `tokenum`             int(11)              DEFAULT '0' COMMENT '接入次数',
    `createtime`          datetime             DEFAULT NULL COMMENT '创建时间',
    `updatetime`          datetime             DEFAULT NULL COMMENT '更新时间',
    `status`              varchar(100)         DEFAULT '' COMMENT '状态',
    `appid`               varchar(100)         DEFAULT '' COMMENT 'SNSID',
    `sessiontype`         varchar(100)         DEFAULT '' COMMENT '会话类型',
    `contextid`           varchar(100)         DEFAULT '' COMMENT '会话ID',
    `agentserviceid`      varchar(100)         DEFAULT '' COMMENT '服务记录ID',
    `snsuser`             varchar(100)         DEFAULT '' COMMENT 'SNS用户ID',
    `lastmessage`         datetime             DEFAULT NULL COMMENT '最后一条消息时间',
    `waittingtimestart`   datetime             DEFAULT NULL COMMENT '进入队列时间',
    `lastgetmessage`      datetime             DEFAULT NULL COMMENT '最后一条消息时间',
    `lastmsg`             text COMMENT '最后一条消息',
    `agentskill`          varchar(100)         DEFAULT '' COMMENT '技能组',
    `create_time`         datetime             DEFAULT NULL COMMENT '创建时间',
    `creater`             varchar(255)         DEFAULT NULL COMMENT '创建人',
    `update_time`         datetime             DEFAULT NULL COMMENT '修改时间',
    `update_user`         varchar(255)         DEFAULT NULL COMMENT '修改人',
    `assignedto`          varchar(255)         DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`            varchar(255)         DEFAULT NULL COMMENT '流程状态',
    `shares`              varchar(255)         DEFAULT NULL COMMENT '分享给',
    `owner`               varchar(255)         DEFAULT NULL COMMENT '所属人',
    `datadept`            varchar(255)         DEFAULT NULL COMMENT '创建人部门',
    `intime`              int(32)              DEFAULT NULL COMMENT '接入时间',
    `batid`               varchar(32)          DEFAULT NULL COMMENT '批次ID',
    `opttype`             varchar(32)          DEFAULT NULL COMMENT '服务处理类型',
    `ipaddr`              varchar(50)          DEFAULT NULL COMMENT 'IP地址',
    `osname`              varchar(100)         DEFAULT NULL COMMENT '操作系统名称',
    `browser`             varchar(100)         DEFAULT NULL COMMENT '浏览器',
    `sessiontimes`        bigint(64)           DEFAULT NULL COMMENT '会话时长',
    `servicetime`         datetime             DEFAULT NULL COMMENT '服务次数',
    `region`              varchar(255)         DEFAULT NULL COMMENT '地区',
    `agentservice`        varchar(32)          DEFAULT NULL COMMENT '服务ID',
    `warnings`            varchar(11)          DEFAULT NULL COMMENT '提醒次数',
    `warningtime`         datetime             DEFAULT NULL COMMENT '提醒时间',
    `reptime`             datetime             DEFAULT NULL COMMENT '坐席最后一次回复时间',
    `reptimes`            varchar(10)          DEFAULT NULL COMMENT '坐席回复次数',
    `agentno`             varchar(100)         DEFAULT '' COMMENT '坐席ID',
    `agentname`           varchar(100)         DEFAULT NULL COMMENT '坐席名字',
    `skill`               varchar(32)          DEFAULT NULL COMMENT '技能组',
    `name`                varchar(100)         DEFAULT NULL COMMENT '用户录入的姓名',
    `phone`               varchar(100)         DEFAULT NULL COMMENT '访客录入的电话',
    `email`               varchar(100)         DEFAULT NULL COMMENT '访客录入的邮件',
    `resion`              varchar(255)         DEFAULT NULL COMMENT '访客录入的来访原因',
    `agentreplyinterval`  int(11)              DEFAULT '0' COMMENT '坐席回复总间隔',
    `agentreplytime`      int(11)              DEFAULT '0' COMMENT '坐席回复时长',
    `agentreplys`         int(11)              DEFAULT '0' COMMENT '坐席回复次数',
    `userasks`            int(11)              DEFAULT '0' COMMENT '访客提问次数',
    `avgreplyinterval`    int(11)              DEFAULT '0' COMMENT '平均回复间隔',
    `avgreplytime`        int(11)              DEFAULT '0' COMMENT '平均回复时长',
    `sessionid`           varchar(32)          DEFAULT NULL COMMENT '会话ID',
    `title`               varchar(255)         DEFAULT NULL COMMENT '标题',
    `url`                 text COMMENT 'URL',
    `traceid`             varchar(32)          DEFAULT NULL COMMENT '跟踪ID',
    `agenttimeout`        int(11)              DEFAULT '0' COMMENT '坐席超时时长',
    `agenttimeouttimes`   int(11)              DEFAULT '0' COMMENT '坐席超时次数',
    `servicetimeout`      tinyint(4)           DEFAULT '0' COMMENT '服务超时时长',
    `agentservicetimeout` int(11)              DEFAULT '0' COMMENT '服务超时次数',
    `agentfrewords`       int(11)              DEFAULT '0' COMMENT '坐席触发敏感词',
    `servicefrewords`     int(11)              DEFAULT '0' COMMENT '访客触发敏感词',
    `topflag`             tinyint(4)           DEFAULT NULL COMMENT '是否置顶',
    `toptimes`            int(20)              DEFAULT NULL COMMENT '置顶时长',
    `toptime`             datetime             DEFAULT NULL COMMENT '置顶时间',
    `firstreplytime`      int(20)              DEFAULT '0' COMMENT '首次响应时间',
    `agentusername`       varchar(32)          DEFAULT NULL COMMENT '坐席姓名',
    `alarm`               int(10)              DEFAULT '0' COMMENT '是否触发预警',
    `initiator`           varchar(32)          DEFAULT NULL COMMENT '会话发起方',
    `chatbotops`          tinyint(1)           DEFAULT '0' COMMENT '是否是机器人客服',
    `chatbotlogicerror`   int(11)              DEFAULT '0' COMMENT '机器人客服不符合逻辑返回累计',
    `chatbotround`        int(11)              DEFAULT '0' COMMENT '机器人客服对话轮次',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `agentuser_userid` (`userid`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='在线客服访客咨询表';

-- ----------------------------
-- Records of uk_agentuser
-- ----------------------------

-- ----------------------------
-- Table structure for uk_agentuser_contacts
-- ----------------------------
DROP TABLE IF EXISTS `uk_agentuser_contacts`;
CREATE TABLE `uk_agentuser_contacts`
(
    `id`          varchar(32) NOT NULL COMMENT '主键ID',
    `appid`       varchar(32)  DEFAULT NULL COMMENT 'SNSID',
    `channeltype` varchar(32)  DEFAULT NULL COMMENT '渠道',
    `userid`      varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `contactsid`  varchar(32)  DEFAULT NULL COMMENT '联系人ID',
    `username`    varchar(100) DEFAULT NULL COMMENT '创建人用户名',
    `creater`     varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime`  datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='访客联系人关联表';

-- ----------------------------
-- Records of uk_agentuser_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for uk_ai
-- ----------------------------
DROP TABLE IF EXISTS `uk_ai`;
CREATE TABLE `uk_ai`
(
    `id`          varchar(32) NOT NULL COMMENT '主键ID',
    `name`        varchar(255)     DEFAULT NULL COMMENT 'AI名称',
    `createtime`  timestamp   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `creater`     varchar(32)      DEFAULT NULL COMMENT '创建人',
    `inx`         int(11)          DEFAULT NULL COMMENT '分类排序序号',
    `updatetime`  datetime         DEFAULT NULL COMMENT '更新时间',
    `description` varchar(255)     DEFAULT NULL COMMENT '分类描述',
    `code`        varchar(32)      DEFAULT NULL COMMENT '代码',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='AI机器人表';

-- ----------------------------
-- Records of uk_ai
-- ----------------------------

-- ----------------------------
-- Table structure for uk_area_type
-- ----------------------------
DROP TABLE IF EXISTS `uk_area_type`;
CREATE TABLE `uk_area_type`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`       varchar(50) DEFAULT NULL COMMENT '名称',
    `CODE`       varchar(50) DEFAULT NULL COMMENT '代码',
    `CREATETIME` datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime    DEFAULT NULL COMMENT '更新时间',
    `USERNAME`   varchar(50) DEFAULT NULL COMMENT '用户名',
    `PARENTID`   varchar(32) DEFAULT NULL COMMENT '知识库分类上级ID',
    `INX`        int(11)     DEFAULT NULL COMMENT '分类排序序号',
    `ENABLE`     tinyint(4)  DEFAULT NULL COMMENT '分类状态',
    `AREA`       text COMMENT '分类描述',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='区域类型';

-- ----------------------------
-- Records of uk_area_type
-- ----------------------------

-- ----------------------------
-- Table structure for uk_attachment_file
-- ----------------------------
DROP TABLE IF EXISTS `uk_attachment_file`;
CREATE TABLE `uk_attachment_file`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `organ`      varchar(32)  DEFAULT NULL COMMENT '组织机构ID',
    `datastatus` tinyint(4)   DEFAULT NULL COMMENT '数据状态（逻辑删除）',
    `title`      varchar(255) DEFAULT NULL COMMENT '标题',
    `url`        text CHARACTER SET utf32 COMMENT '地址',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `filelength` int(11)      DEFAULT NULL COMMENT '文件长度',
    `filetype`   varchar(255) DEFAULT NULL COMMENT '文件类型',
    `image`      tinyint(4)   DEFAULT NULL COMMENT '是否图片',
    `dataid`     varchar(32)  DEFAULT NULL COMMENT '数据ID',
    `model`      varchar(32)  DEFAULT NULL COMMENT '所属功能模块',
    `fileid`     varchar(32)  DEFAULT NULL COMMENT '文件ID',
    `modelid`    varchar(32)  DEFAULT NULL COMMENT '所属模块数据ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='附件表';

-- ----------------------------
-- Records of uk_attachment_file
-- ----------------------------

-- ----------------------------
-- Table structure for uk_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `uk_blacklist`;
CREATE TABLE `uk_blacklist`
(
    `id`             varchar(32) NOT NULL COMMENT '主键ID',
    `userid`         varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `contactid`      varchar(32)  DEFAULT NULL COMMENT '联系人ID',
    `sessionid`      varchar(32)  DEFAULT NULL COMMENT '会话ID',
    `createtime`     datetime     DEFAULT NULL COMMENT '创建时间',
    `channel`        varchar(20)  DEFAULT NULL COMMENT '渠道',
    `creater`        varchar(32)  DEFAULT NULL COMMENT '创家人',
    `agentid`        varchar(32)  DEFAULT NULL COMMENT '坐席ID',
    `phone`          varchar(20)  DEFAULT NULL COMMENT '电话号码',
    `openid`         varchar(100) DEFAULT NULL COMMENT '微信号',
    `description`    text COMMENT '描述',
    `agentserviceid` varchar(32)  DEFAULT NULL COMMENT '坐席服务ID',
    `times`          int(11)      DEFAULT NULL COMMENT '次数',
    `chattime`       int(11)      DEFAULT NULL COMMENT '对话次数',
    `controltime`    int(11)      DEFAULT '1' COMMENT '开始时间',
    `endtime`        datetime     DEFAULT NULL COMMENT '结束时间',
    `agentuser`      varchar(255) DEFAULT NULL COMMENT '访客',
    `skill`          varchar(32)  DEFAULT NULL COMMENT '组织机构ID',
    `agentusername`  varchar(50)  DEFAULT NULL COMMENT '客服',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='黑名单表';

-- ----------------------------
-- Records of uk_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_acl
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_acl`;
CREATE TABLE `uk_callcenter_acl`
(
    `id`           varchar(32) NOT NULL COMMENT '主键ID',
    `creater`      varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`   datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`   datetime     DEFAULT NULL COMMENT '更新时间',
    `name`         varchar(100) DEFAULT NULL COMMENT '名称',
    `hostid`       varchar(32)  DEFAULT NULL COMMENT 'PBX服务器ID',
    `type`         varchar(32)  DEFAULT NULL COMMENT '类型',
    `strategy`     text COMMENT '策略内容',
    `defaultvalue` varchar(50)  DEFAULT NULL COMMENT '默认值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='呼叫中心ACL表';

-- ----------------------------
-- Records of uk_callcenter_acl
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_event
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_event`;
CREATE TABLE `uk_callcenter_event`
(
    `ID`             varchar(100) NOT NULL COMMENT '主键ID',
    `NAME`           varchar(50)    DEFAULT NULL COMMENT '名称',
    `CODE`           varchar(50)    DEFAULT NULL COMMENT '代码',
    `CREATETIME`     datetime       DEFAULT NULL COMMENT '创建时间',
    `CREATER`        varchar(32)    DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`     datetime       DEFAULT NULL COMMENT '更新时间',
    `organ`          varchar(50)    DEFAULT NULL COMMENT '部门',
    `organid`        varchar(32)    DEFAULT NULL COMMENT '部门ID',
    `USERNAME`       varchar(50)    DEFAULT NULL COMMENT '用户名',
    `SOURCE`         varchar(50)    DEFAULT NULL COMMENT '来源',
    `ANSWER`         varchar(50)    DEFAULT NULL COMMENT '应答时间',
    `scurrent`       tinyint(4)     DEFAULT NULL COMMENT '是否当前通话',
    `INIT`           tinyint(4)     DEFAULT NULL COMMENT '初始通话',
    `CALLER`         varchar(50)    DEFAULT NULL COMMENT '呼叫发起号码',
    `CALLING`        varchar(50)    DEFAULT NULL COMMENT '呼叫对象',
    `CALLED`         varchar(50)    DEFAULT NULL COMMENT '被叫号码',
    `AGENTYPE`       varchar(50)    DEFAULT NULL COMMENT '坐席类型',
    `QUENE`          varchar(50)    DEFAULT NULL COMMENT '队列名称',
    `ANI`            varchar(50)    DEFAULT NULL COMMENT '主叫号码',
    `TOUSER`         varchar(50)    DEFAULT NULL COMMENT '目标用户',
    `DIRECTION`      varchar(50)    DEFAULT NULL COMMENT '呼叫方向',
    `STATE`          varchar(50)    DEFAULT NULL COMMENT '状态',
    `AGENT`          varchar(50)    DEFAULT NULL COMMENT '坐席工号',
    `agentname`      varchar(255)   DEFAULT NULL COMMENT '坐席名字',
    `ACTION`         varchar(50)    DEFAULT NULL COMMENT '事件动作',
    `HOST`           varchar(50)    DEFAULT NULL COMMENT '时间主机',
    `IPADDR`         varchar(50)    DEFAULT NULL COMMENT '主机IP',
    `LOCALDATETIME`  varchar(50)    DEFAULT NULL COMMENT '时间发起时间',
    `STATUS`         varchar(50)    DEFAULT NULL COMMENT '状态代码',
    `TIME`           decimal(20, 0) DEFAULT NULL COMMENT '时间秒值',
    `STARTTIME`      datetime       DEFAULT NULL COMMENT '通话开始时间',
    `ENDTIME`        datetime       DEFAULT NULL COMMENT '通话结束时间',
    `DURATION`       int(11)        DEFAULT NULL COMMENT '通话时长',
    `INSIDE`         tinyint(4)     DEFAULT NULL COMMENT '内线',
    `MISSCALL`       tinyint(4)     DEFAULT NULL COMMENT '是否漏话',
    `srecord`        tinyint(4)     DEFAULT NULL COMMENT '是否录音',
    `RECORDTIME`     int(11)        DEFAULT NULL COMMENT '录音时长',
    `STARTRECORD`    datetime       DEFAULT NULL COMMENT '开始录音时间',
    `ENDRECORD`      datetime       DEFAULT NULL COMMENT '结束录音时间',
    `ANSWERTIME`     datetime       DEFAULT NULL COMMENT '应答时间',
    `RINGDURATION`   int(11)        DEFAULT NULL COMMENT '振铃时长',
    `SERVICESUMMARY` tinyint(4)     DEFAULT NULL COMMENT '是否记录服务小结',
    `SERVICEID`      varchar(32)    DEFAULT NULL COMMENT '服务记录ID',
    `RECORDFILE`     varchar(255)   DEFAULT NULL COMMENT '录音文件名',
    `CALLBACK`       tinyint(4)     DEFAULT NULL COMMENT '回呼',
    `CCQUENE`        varchar(50)    DEFAULT NULL COMMENT '转接队列',
    `SERVICESTATUS`  varchar(20)    DEFAULT NULL COMMENT '当前呼叫状态',
    `CHANNELSTATUS`  varchar(50)    DEFAULT NULL COMMENT '事件中的呼叫状态',
    `COUNTRY`        varchar(50)    DEFAULT NULL COMMENT '来电国家',
    `PROVINCE`       varchar(50)    DEFAULT NULL COMMENT '来电号码归属省份',
    `CITY`           varchar(50)    DEFAULT NULL COMMENT '来电归属号码城市',
    `ISP`            varchar(50)    DEFAULT NULL COMMENT '来电号码运营商',
    `VOICECALLED`    varchar(50)    DEFAULT NULL COMMENT '语音呼叫',
    `CONTACTSID`     varchar(32)    DEFAULT NULL COMMENT '联系人ID',
    `EXTENTION`      varchar(32)    DEFAULT NULL COMMENT '分机ID',
    `HOSTID`         varchar(32)    DEFAULT NULL COMMENT 'PBX服务器ID',
    `CALLTYPE`       varchar(20)    DEFAULT NULL COMMENT '呼叫方向类型|计费类型',
    `CALLDIR`        varchar(30)    DEFAULT NULL COMMENT '呼叫方向',
    `OTHERDIR`       varchar(30)    DEFAULT NULL COMMENT '对边呼叫方向',
    `OTHERLEGDEST`   varchar(50)    DEFAULT NULL COMMENT '呼叫另一方号码',
    `BRIDGEID`       varchar(100)   DEFAULT NULL COMMENT '桥接ID',
    `BRIDGE`         tinyint(4)     DEFAULT NULL COMMENT '是否有桥接',
    `RECORDFILENAME` varchar(100)   DEFAULT NULL COMMENT '录音文件名',
    `DISCALLER`      varchar(50)    DEFAULT NULL COMMENT '显示主叫',
    `DISCALLED`      varchar(50)    DEFAULT NULL COMMENT '显示被叫',
    `SATISF`         tinyint(4)     DEFAULT '0' COMMENT '满意度',
    `SATISFACTION`   varchar(32)    DEFAULT NULL COMMENT '满意度结果',
    `SATISFDATE`     datetime       DEFAULT NULL COMMENT '满意度时间',
    `datestr`        varchar(32)    DEFAULT '0' COMMENT '坐席通话日期（yyyy-MM-dd）用于每小时通话数量折线图',
    `hourstr`        varchar(32)    DEFAULT '0' COMMENT '坐席通话时间小时（HH）用于每小时通话数量折线图',
    `taskid`         varchar(32)    DEFAULT NULL COMMENT '任务ID',
    `actid`          varchar(32)    DEFAULT NULL COMMENT '活动ID',
    `batid`          varchar(32)    DEFAULT NULL COMMENT '批次ID',
    `dataid`         varchar(32)    DEFAULT NULL COMMENT '数据ID',
    `statustype`     varchar(32)    DEFAULT NULL COMMENT '号码隐藏状态',
    `disphonenum`    varchar(32)    DEFAULT NULL COMMENT '号码',
    `distype`        varchar(32)    DEFAULT NULL COMMENT '显示类型',
    `nameid`         varchar(50)    DEFAULT NULL COMMENT '名单ID',
    `siptrunk`       varchar(32)    DEFAULT NULL COMMENT '拨打的网关',
    `prefix`         tinyint(4)     DEFAULT '0' COMMENT '是否在号码前加拨0',
    `dialplan`       varchar(32)    DEFAULT NULL COMMENT '呼叫计划ID',
    `callid`         varchar(100)   DEFAULT NULL COMMENT 'FreeSwitch通话ID',
    `voicechannel`   varchar(255)   DEFAULT NULL COMMENT '语音渠道标识',
    `recordingfile`  varchar(150)   DEFAULT NULL COMMENT '录音文件标识',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='通话记录表';

-- ----------------------------
-- Records of uk_callcenter_event
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_extention
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_extention`;
CREATE TABLE `uk_callcenter_extention`
(
    `id`            varchar(32) NOT NULL COMMENT '主键ID',
    `creater`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`    datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`    datetime     DEFAULT NULL COMMENT '更新时间',
    `extention`     varchar(100) DEFAULT NULL COMMENT '分机号',
    `hostid`        varchar(100) DEFAULT NULL COMMENT 'PBX服务ID',
    `agentno`       varchar(50)  DEFAULT NULL COMMENT '坐席工号',
    `password`      varchar(100) DEFAULT NULL COMMENT '密码',
    `callout`       tinyint(4)   DEFAULT NULL COMMENT '允许呼出',
    `playnum`       tinyint(4)   DEFAULT NULL COMMENT '播报工号',
    `srecord`       tinyint(4)   DEFAULT NULL,
    `extype`        varchar(50)  DEFAULT NULL COMMENT '分机类型',
    `description`   varchar(255) DEFAULT NULL COMMENT '描述',
    `subtype`       varchar(50)  DEFAULT NULL COMMENT '分机类型',
    `mediapath`     varchar(255) DEFAULT NULL COMMENT '播报工号语音文件',
    `afterprocess`  tinyint(4)   DEFAULT '0' COMMENT '坐席通话后启用后处理功能',
    `siptrunk`      varchar(50)  DEFAULT NULL,
    `enableai`      tinyint(4)   DEFAULT '0' COMMENT '启用AI机器人',
    `aiid`          varchar(32)  DEFAULT NULL COMMENT 'AI机器人',
    `sceneid`       varchar(32)  DEFAULT NULL COMMENT '启用场景配置',
    `welcomemsg`    text COMMENT '机器人欢迎语',
    `waitmsg`       text COMMENT '机器人等待提示语',
    `tipmessage`    text COMMENT '机器人提示客户说话',
    `asrrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
    `ttsrecordpath` varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
    `errormessage`  varchar(255) DEFAULT NULL COMMENT '异常提示消息',
    `enablewebrtc`  tinyint(4)   DEFAULT '0' COMMENT '启用WebRTC',
    `bustype`       varchar(32)  DEFAULT NULL COMMENT '业务类型（电销sale/问卷quesurvey）',
    `proid`         varchar(32)  DEFAULT NULL COMMENT '（产品ID）',
    `queid`         varchar(32)  DEFAULT NULL COMMENT '（问卷ID）',
    `aitype`        varchar(32)  DEFAULT NULL COMMENT '机器人类型（smartai/quesurvey）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='分机信息表';

-- ----------------------------
-- Records of uk_callcenter_extention
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_media
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_media`;
CREATE TABLE `uk_callcenter_media`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `name`       varchar(100) DEFAULT NULL COMMENT '名称',
    `hostid`     varchar(32)  DEFAULT NULL COMMENT 'PBX服务ID',
    `type`       varchar(32)  DEFAULT NULL COMMENT '类型',
    `filename`   varchar(255) DEFAULT NULL COMMENT '文件名',
    `content`    varchar(50)  DEFAULT NULL COMMENT '文件类型',
    `filelength` int(11)      DEFAULT NULL COMMENT '语音文件长度',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='媒体资源表';

-- ----------------------------
-- Records of uk_callcenter_media
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_pbxhost
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_pbxhost`;
CREATE TABLE `uk_callcenter_pbxhost`
(
    `id`             varchar(32)  NOT NULL COMMENT '主键ID',
    `creater`        varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`     datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`     datetime     DEFAULT NULL COMMENT '更新时间',
    `name`           varchar(100) NOT NULL COMMENT '名称',
    `organ`          varchar(32)  NOT NULL COMMENT '所属组织机构',
    `hostname`       varchar(100) NOT NULL COMMENT '主机名',
    `port`           int(11)      NOT NULL COMMENT 'FreeSWITCH ESL端口',
    `apiport`        int(11)      NOT NULL COMMENT 'Chatopera Switch API端口',
    `password`       varchar(100) DEFAULT NULL COMMENT '密码',
    `ipaddr`         varchar(32)  DEFAULT NULL COMMENT 'IP地址',
    `callbacknumber` varchar(50)  DEFAULT NULL COMMENT '回呼号码',
    `autoanswer`     tinyint(4)   DEFAULT NULL COMMENT '启用自动接听',
    `callcenter`     tinyint(4)   DEFAULT NULL COMMENT '启用呼叫中心功能',
    `recordpath`     varchar(100) DEFAULT NULL COMMENT '录音文件位置',
    `ivrpath`        varchar(100) DEFAULT NULL COMMENT 'IVR文件位置',
    `fspath`         varchar(100) DEFAULT NULL COMMENT 'FS安装路径',
    `device`         varchar(50)  DEFAULT NULL COMMENT '语音设备类型',
    `callbacktype`   varchar(32)  DEFAULT NULL COMMENT '回呼送号号码',
    `sipautoanswer`  tinyint(4)   DEFAULT NULL COMMENT 'SIP自动应答',
    `abscodec`       varchar(50)  DEFAULT NULL COMMENT '通信编码',
    `enableai`       tinyint(4)   DEFAULT NULL COMMENT '启用机器人',
    `aiid`           varchar(32)  DEFAULT NULL COMMENT '机器人ID',
    `sceneid`        varchar(32)  DEFAULT NULL COMMENT '场景ID',
    `welcomemsg`     text COMMENT '机器人欢迎语',
    `waitmsg`        text COMMENT '机器人等待提示语',
    `tipmessage`     text COMMENT '机器人提示客户说话',
    `asrrecordpath`  varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
    `ttsrecordpath`  varchar(255) DEFAULT NULL COMMENT 'ASR结果路径',
    `afterprocess`   tinyint(4)   DEFAULT '0' COMMENT '坐席通话后启用后处理功能',
    `enablewebrtc`   tinyint(4)   DEFAULT '0' COMMENT '启用WebRTC',
    `webrtcaddress`  varchar(100) DEFAULT NULL COMMENT 'WebRTC地址',
    `webrtcport`     int(11)      NOT NULL COMMENT 'WebRTC端口',
    `webrtcssl`      tinyint(4)   DEFAULT '0' COMMENT 'WebRTC启用SSL',
    `dissipphone`    tinyint(4)   DEFAULT '0' COMMENT '外呼隐藏话机上的号码',
    `syncstatus`     varchar(32)  DEFAULT NULL COMMENT '同步执行状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='FS服务器信息';

-- ----------------------------
-- Records of uk_callcenter_pbxhost
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_router
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_router`;
CREATE TABLE `uk_callcenter_router`
(
    `id`            varchar(32) NOT NULL COMMENT '主键ID',
    `creater`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`    datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`    datetime     DEFAULT NULL COMMENT '更新时间',
    `name`          varchar(100) DEFAULT NULL COMMENT '名称',
    `hostid`        varchar(32)  DEFAULT NULL COMMENT 'PBX服务器ID',
    `type`          varchar(32)  DEFAULT NULL COMMENT '类型',
    `regex`         varchar(255) DEFAULT NULL COMMENT '匹配正则',
    `allow`         tinyint(4)   DEFAULT NULL COMMENT '允许',
    `falsebreak`    tinyint(4)   DEFAULT NULL COMMENT '异常终止',
    `routerinx`     int(11)      DEFAULT NULL COMMENT '编号',
    `routercontent` text COMMENT '路由规则',
    `field`         varchar(50)  DEFAULT NULL COMMENT '字段名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='拨号计划表';

-- ----------------------------
-- Records of uk_callcenter_router
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_siptrunk
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_siptrunk`;
CREATE TABLE `uk_callcenter_siptrunk`
(
    `id`              varchar(32) NOT NULL COMMENT '组件ID',
    `creater`         varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`      datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`      datetime     DEFAULT NULL COMMENT '更新时间',
    `name`            varchar(100) DEFAULT NULL COMMENT 'SIP中继名称',
    `hostid`          varchar(32)  DEFAULT NULL COMMENT 'PBX服务器ID',
    `type`            varchar(32)  DEFAULT NULL COMMENT '类型',
    `sipcontent`      text COMMENT 'SIP配置内容',
    `sipserver`       varchar(50)  DEFAULT NULL COMMENT '服务器地址',
    `extention`       varchar(50)  DEFAULT NULL COMMENT '转分机号',
    `outnumber`       varchar(50)  DEFAULT NULL COMMENT '出局号码',
    `prefix`          varchar(50)  DEFAULT NULL COMMENT '前缀',
    `port`            int(11)      DEFAULT NULL COMMENT '端口',
    `exptime`         int(11)      DEFAULT NULL COMMENT '超时时长',
    `retry`           int(11)      DEFAULT NULL COMMENT '重试次数',
    `register`        tinyint(4)   DEFAULT NULL COMMENT '是否注册',
    `fromuser`        tinyint(4)   DEFAULT NULL COMMENT '是否添加FROM',
    `transprotocol`   tinyint(4)   DEFAULT NULL COMMENT '协议',
    `username`        varchar(50)  DEFAULT NULL COMMENT '用户名',
    `authuser`        varchar(50)  DEFAULT NULL COMMENT '认证用户名',
    `password`        varchar(50)  DEFAULT NULL COMMENT '密码',
    `protocol`        varchar(50)  DEFAULT NULL COMMENT '协议',
    `heartbeat`       int(11)      DEFAULT NULL COMMENT '心跳时长',
    `dtmf`            varchar(20)  DEFAULT NULL COMMENT 'DTMF协议',
    `province`        varchar(50)  DEFAULT NULL COMMENT '省份',
    `city`            varchar(50)  DEFAULT NULL COMMENT '城市',
    `defaultsip`      tinyint(4)   DEFAULT '0' COMMENT '默认网关',
    `title`           varchar(50)  DEFAULT NULL COMMENT '标题',
    `busyext`         varchar(50)  DEFAULT NULL COMMENT '坐席忙的时候转到号码',
    `notready`        varchar(50)  DEFAULT NULL COMMENT '坐席不在线的时候转到号码',
    `noname`          varchar(50)  DEFAULT NULL COMMENT '未找到名单或未分配的时候转到号码',
    `enablecallagent` tinyint(4)   DEFAULT '0' COMMENT '坐席不在线转手机',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='SIP网关信息表';

-- ----------------------------
-- Records of uk_callcenter_siptrunk
-- ----------------------------

-- ----------------------------
-- Table structure for uk_callcenter_skill
-- ----------------------------
DROP TABLE IF EXISTS `uk_callcenter_skill`;
CREATE TABLE `uk_callcenter_skill`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `name`       varchar(100) DEFAULT NULL COMMENT '名称',
    `skill`      varchar(50)  DEFAULT NULL COMMENT '技能组名称',
    `password`   varchar(100) DEFAULT NULL COMMENT '密码',
    `quene`      varchar(100) DEFAULT NULL COMMENT '队列名称',
    `hostid`     varchar(32)  DEFAULT NULL COMMENT 'PBX服务器ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电话技能组表';

-- ----------------------------
-- Records of uk_callcenter_skill
-- ----------------------------

-- ----------------------------
-- Table structure for uk_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `uk_chat_message`;
CREATE TABLE `uk_chat_message`
(
    `type`               varchar(100)         DEFAULT '' COMMENT '类型',
    `id`                 varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `calltype`           varchar(32)          DEFAULT NULL COMMENT '对话方向',
    `contextid`          varchar(50)          DEFAULT NULL COMMENT '会话ID',
    `usession`           varchar(100)         DEFAULT NULL COMMENT '会话ID',
    `touser`             varchar(50)          DEFAULT NULL COMMENT '目标用户',
    `channel`            varchar(32)          DEFAULT NULL COMMENT '渠道',
    `appid`              varchar(50)          DEFAULT NULL COMMENT 'SNSID',
    `userid`             varchar(100)         DEFAULT '' COMMENT '用户名',
    `message`            text COMMENT '消息内容',
    `msgtype`            varchar(100)         DEFAULT '' COMMENT '消息类型',
    `msgid`              varchar(100)         DEFAULT '' COMMENT '消息ID（微信）',
    `expmsg`             text COMMENT '原始消息',
    `name`               varchar(255)         DEFAULT NULL COMMENT '名称',
    `createtime`         varchar(50)          DEFAULT NULL COMMENT '创建时间',
    `creater`            varchar(255)         DEFAULT NULL COMMENT '创建人',
    `updatetime`         decimal(20, 0)       DEFAULT NULL COMMENT '修改时间',
    `update_user`        varchar(255)         DEFAULT NULL COMMENT '修改人',
    `username`           varchar(255)         DEFAULT NULL COMMENT '用户名',
    `assignedto`         varchar(255)         DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`           varchar(255)         DEFAULT NULL COMMENT '流程状态',
    `shares`             varchar(255)         DEFAULT NULL COMMENT '分享给',
    `owner`              varchar(255)         DEFAULT NULL COMMENT '所属人',
    `datadept`           varchar(255)         DEFAULT NULL COMMENT '创建人部门',
    `batid`              varchar(32)          DEFAULT NULL COMMENT '批次ID',
    `model`              varchar(32)          DEFAULT '' COMMENT '消息所属组件',
    `chatype`            varchar(32)          DEFAULT NULL COMMENT '对话类型',
    `agentserviceid`     varchar(32)          DEFAULT NULL COMMENT '坐席服务ID',
    `mediaid`            varchar(255)         DEFAULT NULL COMMENT '媒体文件ID（微信）',
    `locx`               varchar(20)          DEFAULT NULL COMMENT '地理位置',
    `locy`               varchar(20)          DEFAULT NULL COMMENT '地理位置',
    `duration`           varchar(30)          DEFAULT NULL COMMENT '会话时长',
    `scale`              varchar(10)          DEFAULT NULL COMMENT '地图级别',
    `filename`           varchar(255)         DEFAULT NULL COMMENT '文件名',
    `filesize`           int(11)              DEFAULT NULL COMMENT '文件尺寸',
    `attachmentid`       varchar(32)          DEFAULT NULL COMMENT '附件ID',
    `lastagentmsgtime`   datetime             DEFAULT NULL COMMENT '最近一次坐席发送消息时间',
    `agentreplytime`     int(11)              DEFAULT NULL COMMENT '坐席回复消息时间',
    `lastmsgtime`        datetime             DEFAULT NULL COMMENT '访客最近一次发送消息时间',
    `agentreplyinterval` int(11)              DEFAULT NULL COMMENT '坐席回复消息时间',
    `sessionid`          varchar(50)          DEFAULT NULL COMMENT '会话ID',
    `cooperation`        tinyint(4)           DEFAULT NULL COMMENT '合并消息',
    `datastatus`         tinyint(4)           DEFAULT '0' COMMENT '数据状态（已删除/未删除）',
    `intervented`        tinyint(4)           DEFAULT '0' COMMENT '是否是会话监控发出的干预消息',
    `supervisorname`     varchar(100)         DEFAULT NULL COMMENT '会话监控人员的名字',
    `aiid`               varchar(32)          DEFAULT '0' COMMENT '机器人ID',
    `topic`              tinyint(4)           DEFAULT '0' COMMENT '是否命中知识库',
    `topicid`            varchar(32)          DEFAULT NULL COMMENT '命中知识库ID',
    `topicatid`          varchar(32)          DEFAULT NULL COMMENT '命中知识库分类ID',
    `aichat`             tinyint(4)           DEFAULT '0' COMMENT '是否在和AI对话',
    `suggestmsg`         text COMMENT '推荐的提示信息',
    `islabel`            bit(1)      NOT NULL DEFAULT b'0' COMMENT '是否添加标记',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `sessionid` (`usession`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='坐席对话表';

-- ----------------------------
-- Records of uk_chat_message
-- ----------------------------

-- ----------------------------
-- Table structure for uk_columnproperties
-- ----------------------------
DROP TABLE IF EXISTS `uk_columnproperties`;
CREATE TABLE `uk_columnproperties`
(
    `id`           varchar(32) NOT NULL COMMENT '主键ID',
    `format`       varchar(255) DEFAULT NULL COMMENT '格式化',
    `prefix`       varchar(255) DEFAULT NULL COMMENT '前缀',
    `width`        varchar(255) DEFAULT NULL COMMENT '组件宽度',
    `suffix`       varchar(255) DEFAULT NULL COMMENT '组件后缀',
    `font`         varchar(255) DEFAULT NULL COMMENT '字体',
    `colname`      varchar(255) DEFAULT NULL COMMENT '字段名称',
    `border`       varchar(255) DEFAULT NULL COMMENT '组件宽度',
    `decimalCount` varchar(255) DEFAULT NULL COMMENT '数字格式化',
    `sepsymbol`    varchar(255) DEFAULT NULL COMMENT '组件标签',
    `alignment`    varchar(255) DEFAULT NULL COMMENT '对齐方式',
    `fontStyle`    varchar(255) DEFAULT NULL COMMENT '字体样式',
    `fontColor`    varchar(255) DEFAULT NULL COMMENT '字体颜色',
    `paramName`    varchar(255) DEFAULT NULL COMMENT '参数名称',
    `dataid`       varchar(255) DEFAULT NULL COMMENT '数据ID',
    `modelid`      varchar(255) DEFAULT NULL COMMENT '组件ID',
    `dataname`     varchar(255) DEFAULT NULL COMMENT '名称',
    `cur`          varchar(255) DEFAULT NULL COMMENT '位置',
    `hyp`          varchar(255) DEFAULT NULL COMMENT '超链',
    `timeFormat`   varchar(255) DEFAULT NULL COMMENT '时间格式化',
    `title`        varchar(255) DEFAULT NULL COMMENT '标题',
    `SORTINDEX`    int(11)      DEFAULT NULL COMMENT '排序位置',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='报表字段映射表';

-- ----------------------------
-- Records of uk_columnproperties
-- ----------------------------

-- ----------------------------
-- Table structure for uk_consult_invite
-- ----------------------------
DROP TABLE IF EXISTS `uk_consult_invite`;
CREATE TABLE `uk_consult_invite`
(
    `id`                         varchar(32) NOT NULL COMMENT '主键ID',
    `impid`                      varchar(32)  DEFAULT NULL COMMENT '批次ID',
    `owner`                      varchar(32)  DEFAULT NULL COMMENT '数据拥有人',
    `processid`                  varchar(32)  DEFAULT NULL COMMENT '流程ID',
    `shares`                     varchar(32)  DEFAULT NULL COMMENT '分享给',
    `update_time`                datetime     DEFAULT NULL COMMENT '更新时间',
    `update_user`                varchar(32)  DEFAULT NULL COMMENT '修改人',
    `username`                   varchar(32)  DEFAULT NULL COMMENT '用户名',
    `wfstatus`                   varchar(32)  DEFAULT NULL COMMENT '流程状态',
    `consult_invite_model`       varchar(32)  DEFAULT NULL COMMENT '邀请模式',
    `consult_invite_content`     varchar(255) DEFAULT NULL COMMENT '邀请框文本',
    `consult_invite_position`    varchar(32)  DEFAULT NULL COMMENT '邀请框位置',
    `consult_invite_color`       varchar(32)  DEFAULT NULL COMMENT '邀请框颜色',
    `consult_invite_right`       int(11)      DEFAULT NULL COMMENT '邀请框距右边位置',
    `consult_invite_left`        int(11)      DEFAULT NULL COMMENT '邀请框距左侧',
    `consult_invite_bottom`      int(11)      DEFAULT NULL COMMENT '邀请框距下边位置',
    `consult_invite_top`         int(11)      DEFAULT NULL COMMENT '邀请框距顶部位置',
    `create_time`                datetime     DEFAULT NULL COMMENT '创建时间',
    `name`                       varchar(50)  DEFAULT NULL COMMENT '名称',
    `consult_invite_width`       int(32)      DEFAULT NULL COMMENT '邀请框宽度',
    `consult_invite_poptype`     varchar(32)  DEFAULT NULL COMMENT '邀请框悬浮位置',
    `consult_invite_fontsize`    int(32)      DEFAULT NULL COMMENT '邀请框文本字体',
    `consult_invite_fontstyle`   varchar(32)  DEFAULT NULL COMMENT '邀请框文本样式',
    `consult_invite_fontcolor`   varchar(32)  DEFAULT NULL COMMENT '邀请框文本颜色',
    `consult_invite_interval`    int(32)      DEFAULT NULL COMMENT '邀请框弹出频率',
    `consult_invite_repeat`      varchar(32)  DEFAULT NULL COMMENT '邀请框背景平铺',
    `consult_invite_hight`       int(32)      DEFAULT NULL COMMENT '邀请框高度',
    `snsaccountid`               varchar(56)  DEFAULT NULL COMMENT 'SNSID',
    `consult_vsitorbtn_position` varchar(32)  DEFAULT NULL COMMENT '悬浮图标位置',
    `consult_vsitorbtn_content`  varchar(32)  DEFAULT NULL COMMENT '悬浮框文本',
    `consult_vsitorbtn_right`    varchar(32)  DEFAULT NULL COMMENT '悬浮框距右侧位置',
    `consult_vsitorbtn_left`     varchar(32)  DEFAULT NULL COMMENT '悬浮框距左侧位置',
    `consult_vsitorbtn_top`      varchar(32)  DEFAULT NULL COMMENT '悬浮框距顶部',
    `consult_vsitorbtn_color`    varchar(32)  DEFAULT NULL COMMENT '悬浮框颜色',
    `consult_vsitorbtn_model`    varchar(32)  DEFAULT NULL COMMENT '悬浮框模式',
    `consult_vsitorbtn_bottom`   varchar(32)  DEFAULT NULL COMMENT '悬浮框距底部',
    `consult_invite_backimg`     varchar(32)  DEFAULT NULL COMMENT '悬浮框背景图片',
    `datadept`                   varchar(32)  DEFAULT NULL COMMENT '数据部门',
    `agent_online`               varchar(32)  DEFAULT NULL COMMENT '坐席在线',
    `consult_dialog_color`       varchar(32)  DEFAULT NULL COMMENT '对话框颜色',
    `consult_dialog_logo`        varchar(300) DEFAULT NULL COMMENT '对话框LOGO',
    `consult_dialog_headimg`     varchar(300) DEFAULT NULL COMMENT '对话框头像',
    `consult_vsitorbtn_delay`    int(11)      DEFAULT NULL COMMENT '显示对话控件按钮延迟毫秒',
    `dialog_name`                varchar(100) DEFAULT NULL COMMENT '对话显示名称',
    `dialog_address`             varchar(100) DEFAULT NULL COMMENT '对话框地址',
    `dialog_phone`               varchar(32)  DEFAULT NULL COMMENT '对话框电话号码',
    `dialog_mail`                varchar(100) DEFAULT NULL COMMENT '对话框邮件',
    `dialog_introduction`        text COMMENT '对话框介绍',
    `dialog_message`             text COMMENT '对话框欢迎信息',
    `dialog_ad`                  varchar(100) DEFAULT NULL COMMENT '对话框广告',
    `consult_invite_enable`      tinyint(4)   DEFAULT NULL COMMENT '启用邀请框',
    `consult_invite_accept`      varchar(50)  DEFAULT NULL COMMENT '邀请框统一按钮文本',
    `consult_invite_later`       varchar(50)  DEFAULT NULL COMMENT '延迟弹出邀请框',
    `consult_invite_delay`       int(11)      DEFAULT NULL COMMENT '邀请框延迟时间',
    `consult_invite_bg`          varchar(100) DEFAULT NULL COMMENT '邀请框背景图片',
    `leavemessage`               tinyint(4)   DEFAULT NULL COMMENT '留言提示文本',
    `lvmname`                    tinyint(4)   DEFAULT NULL COMMENT '留言框显示名称字段',
    `lvmphone`                   tinyint(4)   DEFAULT NULL COMMENT '留言卡电话号码字段',
    `lvmemail`                   tinyint(4)   DEFAULT NULL COMMENT '留言卡Email字段',
    `lvmaddress`                 tinyint(4)   DEFAULT NULL COMMENT '留言卡地址字段',
    `lvmqq`                      tinyint(4)   DEFAULT '0' COMMENT '留言框QQ',
    `lvmcontent`                 tinyint(4)   DEFAULT NULL COMMENT '留言卡留言内容字段',
    `workinghours`               text COMMENT '工作时间段',
    `lvmopentype`                varchar(32)  DEFAULT NULL COMMENT '留言卡弹出模式',
    `skill`                      tinyint(4)   DEFAULT '0' COMMENT '技能组',
    `notinwhmsg`                 text COMMENT '非工作时间段提示文本',
    `consult_skill_fixed`        tinyint(4)   DEFAULT '0' COMMENT '是否绑定单一技能组',
    `consult_skill_fixed_id`     varchar(32)  DEFAULT NULL COMMENT '绑定的单一技能组ID',
    `consult_skill_logo`         varchar(100) DEFAULT NULL COMMENT '技能组图标',
    `consult_skill_title`        varchar(50)  DEFAULT NULL COMMENT '技能组提示标题',
    `consult_skill_img`          varchar(300) DEFAULT NULL COMMENT '技能组显示背景图片',
    `consult_skill_msg`          text COMMENT '技能组提示文本内容',
    `consult_skill_numbers`      int(11)      DEFAULT NULL COMMENT '显示技能组成员数量',
    `consult_skill_maxagent`     int(11)      DEFAULT NULL COMMENT '显示技能组下最大用户数',
    `consult_skill_bottomtitle`  varchar(50)  DEFAULT NULL COMMENT '技能组底部标题',
    `consult_skill_agent`        tinyint(4)   DEFAULT NULL COMMENT '是否显示技能组下的坐席',
    `ai`                         tinyint(4)   DEFAULT '0' COMMENT '启用AI',
    `aifirst`                    tinyint(4)   DEFAULT '0' COMMENT 'AI优先显示',
    `aisearch`                   tinyint(4)   DEFAULT '0' COMMENT 'AI搜索文本',
    `aimsg`                      text COMMENT 'AI欢迎信息',
    `aisuccesstip`               varchar(100) DEFAULT NULL COMMENT 'AI成功命中提示消息',
    `ainame`                     varchar(50)  DEFAULT NULL COMMENT '机器人名称',
    `consult_info`               tinyint(4)   DEFAULT NULL COMMENT '启用咨询信息收集功能',
    `consult_info_name`          tinyint(4)   DEFAULT NULL COMMENT '填写姓名',
    `consult_info_email`         tinyint(4)   DEFAULT NULL COMMENT '填写 邮件地址',
    `consult_info_phone`         tinyint(4)   DEFAULT NULL COMMENT '填写 电话号码',
    `consult_info_resion`        tinyint(4)   DEFAULT NULL COMMENT '填写咨询问题',
    `consult_info_message`       text COMMENT '咨询窗口显示的欢迎语',
    `consult_info_cookies`       tinyint(4)   DEFAULT NULL COMMENT '在Cookies中存储用户信息',
    `recordhis`                  tinyint(4)   DEFAULT NULL COMMENT '是否记录访问轨迹',
    `traceuser`                  tinyint(4)   DEFAULT NULL COMMENT '是否跟踪访客',
    `onlyareaskill`              tinyint(4)   DEFAULT '0' COMMENT '区域技能组',
    `uk_consult_invite`          text COMMENT '提示消息',
    `areaskilltipmsg`            text COMMENT '区域技能组提示消息',
    `aiid`                       varchar(32)  DEFAULT NULL COMMENT '默认的AI',
    `maxwordsnum`                int(11)      DEFAULT '300' COMMENT '访客端允许输入的最大字数',
    `agentshortcutkey`           varchar(32)  DEFAULT NULL COMMENT '坐席默认回复消息快捷键',
    `usershortcutkey`            varchar(32)  DEFAULT NULL COMMENT '访客默认回复消息快捷键',
    `agentctrlenter`             tinyint(4)   DEFAULT '0' COMMENT '启用坐席端CTRL+Enter发送消息',
    `ctrlenter`                  tinyint(4)   DEFAULT '0' COMMENT '启用访客端CTRL+Enter发送消息',
    `whitelist_mode`             tinyint(4)   DEFAULT '0' COMMENT '启用白名单',
    `aisuggest`                  tinyint(4)   DEFAULT '0' COMMENT '启用智能建议',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='访客网站配置表';

-- ----------------------------
-- Records of uk_consult_invite
-- ----------------------------
INSERT INTO `uk_consult_invite`
VALUES ('2c9e80867d65eb5c017d65f6e2690071', null, '4028cac3614cd2f901614cf8be1f0324', null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, '2021-11-28 17:53:38', 'localhost', null, null, null,
        null, null, null, null, null, '104eac', null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, '0', '春松客服', '', '', '', '', '欢迎使用春松客服！如需帮助请联系 info@chatopera.com', null, '0',
        null, null, '0', null, '0', '0', '0', '0', '0', '0', '1', null, 'click', '1', null, '1',
        '2c9e80867d65eb5c017d65f17ceb0019', null, '春松客服', null, '工作时间<br>08:30~17:30', '5', '1',
        '春松客服开源客服系统', '1', '0', '0', '0', null, '', '', '0', '0', '0', '0', '0',
        '您好，请填写以下信息，方便我们更好的为您服务！', '0', '0', '0', '0', null, '您好，您所在的地区没有在线客服人员！',
        '', '0', null, null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for uk_contacts
-- ----------------------------
DROP TABLE IF EXISTS `uk_contacts`;
CREATE TABLE `uk_contacts`
(
    `id`             varchar(32) NOT NULL COMMENT '联系人ID',
    `gender`         varchar(60)  DEFAULT NULL COMMENT '联系人性别',
    `cusbirthday`    varchar(50)  DEFAULT NULL COMMENT '出生日期',
    `ctype`          varchar(60)  DEFAULT NULL COMMENT '联系人类型',
    `ckind`          varchar(60)  DEFAULT NULL COMMENT '联系人类别',
    `clevel`         varchar(60)  DEFAULT NULL COMMENT '联系人级别',
    `ccode`          varchar(60)  DEFAULT NULL COMMENT '联系人代码',
    `nickname`       varchar(64)  DEFAULT NULL COMMENT '联系人昵称',
    `sarea`          varchar(60)  DEFAULT NULL COMMENT '发货地址区县',
    `csource`        varchar(64)  DEFAULT NULL COMMENT '联系人来源',
    `language`       varchar(40)  DEFAULT NULL COMMENT '语言',
    `marriage`       varchar(60)  DEFAULT NULL COMMENT '婚姻状况',
    `education`      varchar(60)  DEFAULT NULL COMMENT '学历',
    `identifytype`   varchar(60)  DEFAULT NULL COMMENT '证件类型',
    `identifynumber` varchar(40)  DEFAULT NULL COMMENT '证件号码',
    `website`        varchar(255) DEFAULT NULL COMMENT '网址',
    `email`          varchar(128) DEFAULT NULL COMMENT '电子邮件',
    `emailalt`       varchar(128) DEFAULT NULL COMMENT '备用电子邮件',
    `mobileno`       varchar(40)  DEFAULT NULL COMMENT '手机号码',
    `mobilealt`      varchar(40)  DEFAULT NULL COMMENT '备用手机号码',
    `phone`          varchar(40)  DEFAULT NULL COMMENT '办公电话',
    `extension`      varchar(40)  DEFAULT NULL COMMENT '办公分机',
    `phonealt`       varchar(40)  DEFAULT NULL COMMENT '备用办公电话',
    `extensionalt`   varchar(40)  DEFAULT NULL COMMENT '备用办公分机',
    `familyphone`    varchar(40)  DEFAULT NULL COMMENT '住宅电话',
    `familyphonealt` varchar(40)  DEFAULT NULL COMMENT '备用住宅电话',
    `fax`            varchar(40)  DEFAULT NULL COMMENT '传真号码',
    `faxalt`         varchar(40)  DEFAULT NULL COMMENT '备用传真号码',
    `country`        varchar(60)  DEFAULT NULL COMMENT '国家',
    `province`       varchar(60)  DEFAULT NULL COMMENT '省',
    `city`           varchar(60)  DEFAULT NULL COMMENT '市(区)县',
    `address`        text COMMENT '地址',
    `postcode`       varchar(40)  DEFAULT NULL COMMENT '邮政编码',
    `enterpriseid`   varchar(60)  DEFAULT NULL COMMENT '企(事)业单位',
    `company`        text COMMENT '公司',
    `department`     varchar(40)  DEFAULT NULL COMMENT '部门',
    `duty`           varchar(40)  DEFAULT NULL COMMENT '职务',
    `deptpr`         varchar(40)  DEFAULT NULL COMMENT '直接上级领导',
    `validstatus`    varchar(50)  DEFAULT NULL COMMENT '效力状态',
    `weixin`         varchar(60)  DEFAULT NULL COMMENT '微信号',
    `weixinname`     varchar(60)  DEFAULT NULL COMMENT '微信昵称',
    `weixinid`       varchar(255) DEFAULT NULL COMMENT '微信ID',
    `weibo`          varchar(255) DEFAULT NULL COMMENT '微博昵称',
    `weiboid`        varchar(255) DEFAULT NULL COMMENT '微博ID',
    `qqcode`         varchar(32)  DEFAULT NULL COMMENT 'QQ账号',
    `touchtime`      datetime     DEFAULT NULL COMMENT '最后联系时间',
    `datastatus`     tinyint(10)  DEFAULT NULL COMMENT '数据状态',
    `processid`      varchar(60)  DEFAULT NULL COMMENT '流程ID',
    `creater`        varchar(60)  DEFAULT NULL COMMENT '创建人ID',
    `username`       varchar(60)  DEFAULT NULL COMMENT '创建人姓名',
    `updateuser`     varchar(60)  DEFAULT NULL COMMENT '修改人ID',
    `memo`           varchar(255) DEFAULT NULL COMMENT '联系人备注',
    `updateusername` varchar(60)  DEFAULT NULL COMMENT '修改人姓名',
    `updatetime`     datetime     DEFAULT NULL COMMENT '修改时间',
    `compper`        varchar(255) DEFAULT NULL,
    `createtime`     datetime     DEFAULT NULL COMMENT '创建时间',
    `name`           varchar(255) DEFAULT NULL COMMENT '名称',
    `assignedto`     varchar(255) DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`       varchar(255) DEFAULT NULL COMMENT '流程状态',
    `shares`         varchar(255) DEFAULT NULL COMMENT '分享给',
    `owner`          varchar(255) DEFAULT NULL COMMENT '所属人',
    `datadept`       varchar(255) DEFAULT NULL COMMENT '创建人部门',
    `entcusid`       varchar(32)  DEFAULT NULL COMMENT '客户ID',
    `pinyin`         varchar(10)  DEFAULT NULL COMMENT '拼音',
    `organ`          varchar(32)  DEFAULT NULL COMMENT '部门',
    `skypeid`        varchar(100) DEFAULT NULL COMMENT 'skypeid',
    `wluid`          varchar(100) DEFAULT NULL COMMENT '人员id',
    `wlusername`     varchar(255) DEFAULT NULL COMMENT '人员名称',
    `wlcid`          varchar(100) DEFAULT NULL COMMENT '公司id',
    `wlcompany_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
    `wlsid`          varchar(100) DEFAULT NULL COMMENT '子系统id',
    `wlsystem_name`  varchar(255) DEFAULT NULL COMMENT '子系统名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='联系人信息表';

-- ----------------------------
-- Records of uk_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for uk_cubelevel
-- ----------------------------
DROP TABLE IF EXISTS `uk_cubelevel`;
CREATE TABLE `uk_cubelevel`
(
    `ID`            varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`          varchar(255)         DEFAULT NULL COMMENT '层级名称',
    `CODE`          varchar(32)          DEFAULT NULL COMMENT '层级代码',
    `CREATETIME`    timestamp   NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `COLUMNAME`     varchar(255)         DEFAULT NULL COMMENT '字段名称',
    `UNIQUEMEMBERS` smallint(6)          DEFAULT NULL COMMENT '唯一约束',
    `TYPE`          varchar(32)          DEFAULT NULL COMMENT '类型',
    `LEVELTYPE`     varchar(32)          DEFAULT NULL COMMENT '层级类型',
    `TABLENAME`     varchar(255)         DEFAULT NULL COMMENT '数据表名',
    `CUBEID`        varchar(32)          DEFAULT NULL COMMENT '立方体ID',
    `SORTINDEX`     int(11)              DEFAULT NULL COMMENT '排序序号',
    `PARAMETERS`    longtext COMMENT '参数',
    `ATTRIBUE`      longtext COMMENT '扩展参数',
    `DIMID`         varchar(32)          DEFAULT NULL COMMENT '唯独ID',
    `PERMISSIONS`   smallint(6)          DEFAULT NULL COMMENT '权限',
    `TABLEPROPERTY` varchar(32)          DEFAULT NULL COMMENT '数据表字段',
    `FORMATSTR`     varchar(255)         DEFAULT NULL COMMENT '格式化字符串',
    `description`   text COMMENT '描述信息',
    `creater`       varchar(32)          DEFAULT NULL COMMENT '创建人信息',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='维度成员表';

-- ----------------------------
-- Records of uk_cubelevel
-- ----------------------------

-- ----------------------------
-- Table structure for uk_cubemeasure
-- ----------------------------
DROP TABLE IF EXISTS `uk_cubemeasure`;
CREATE TABLE `uk_cubemeasure`
(
    `ID`               varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`             varchar(255)         DEFAULT NULL COMMENT '指标名称',
    `CODE`             varchar(32)          DEFAULT NULL COMMENT '指标代码',
    `CREATETIME`       timestamp   NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `COLUMNAME`        varchar(255)         DEFAULT NULL COMMENT '字段名称',
    `UNIQUEMEMBERS`    smallint(6)          DEFAULT NULL COMMENT '索引约束',
    `TYPE`             varchar(32)          DEFAULT NULL COMMENT '字段类型',
    `LEVELTYPE`        varchar(32)          DEFAULT NULL COMMENT '指标类型',
    `TABLENAME`        varchar(255)         DEFAULT NULL COMMENT '数据表名称',
    `CUBEID`           varchar(32)          DEFAULT NULL COMMENT '立方体ID',
    `SORTINDEX`        int(11)              DEFAULT NULL COMMENT '排序序号',
    `PARAMETERS`       longtext COMMENT '参数',
    `ATTRIBUE`         longtext COMMENT '扩展属性',
    `MID`              varchar(32)          DEFAULT NULL COMMENT '指标ID',
    `AGGREGATOR`       varchar(32)          DEFAULT NULL COMMENT '授权给用户',
    `FORMATSTRING`     varchar(255)         DEFAULT NULL COMMENT '格式化字符串',
    `CALCULATEDMEMBER` smallint(6)          DEFAULT NULL COMMENT '计算指标计算方式',
    `MODELTYPE`        varchar(32)          DEFAULT NULL COMMENT '模型类型',
    `MEASURE`          varchar(32)          DEFAULT NULL COMMENT '指标',
    `description`      text COMMENT '指标描述',
    `creater`          varchar(32)          DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='维度指标表';

-- ----------------------------
-- Records of uk_cubemeasure
-- ----------------------------

-- ----------------------------
-- Table structure for uk_cube_type
-- ----------------------------
DROP TABLE IF EXISTS `uk_cube_type`;
CREATE TABLE `uk_cube_type`
(
    `id`          varchar(32) NOT NULL COMMENT '主键ID',
    `name`        varchar(255)     DEFAULT NULL COMMENT '维度名称',
    `createtime`  timestamp   NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `creater`     varchar(32)      DEFAULT NULL COMMENT '创建人',
    `parentid`    varchar(32)      DEFAULT NULL COMMENT '模型分类上级ID',
    `inx`         int(11)          DEFAULT NULL COMMENT '分类排序序号',
    `updatetime`  datetime         DEFAULT NULL COMMENT '更新时间',
    `description` varchar(255)     DEFAULT NULL COMMENT '分类描述'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='立方体分类表';

-- ----------------------------
-- Records of uk_cube_type
-- ----------------------------

-- ----------------------------
-- Table structure for uk_datadic
-- ----------------------------
DROP TABLE IF EXISTS `uk_datadic`;
CREATE TABLE `uk_datadic`
(
    `ID`            varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`          varchar(32)  DEFAULT NULL COMMENT '名称',
    `TITLE`         varchar(32)  DEFAULT NULL COMMENT '标题',
    `CODE`          varchar(32)  DEFAULT NULL COMMENT '代码',
    `PARENTID`      varchar(32)  DEFAULT NULL COMMENT '上级目录ID',
    `TYPE`          varchar(32)  DEFAULT NULL COMMENT '目录类型',
    `MEMO`          varchar(255) DEFAULT NULL COMMENT '备注',
    `STATUS`        varchar(32)  DEFAULT NULL COMMENT '状态',
    `CREATETIME`    datetime     DEFAULT NULL COMMENT '创建时间',
    `UPDATETIME`    datetime     DEFAULT NULL COMMENT '更新时间',
    `CREATER`       varchar(255) DEFAULT NULL COMMENT '创建人',
    `PUBLISHEDTYPE` varchar(32)  DEFAULT NULL COMMENT '发布状态',
    `DESCRIPTION`   varchar(255) DEFAULT NULL COMMENT '描述',
    `TABTYPE`       varchar(32)  DEFAULT NULL COMMENT '数据表类型',
    `DSTYPE`        varchar(32)  DEFAULT NULL COMMENT '数据源类型',
    `DSTEMPLET`     varchar(255) DEFAULT NULL COMMENT '数据源模板',
    `SORTINDEX`     int(11)      DEFAULT NULL COMMENT '排序序号',
    `DICTYPE`       varchar(32)  DEFAULT NULL COMMENT '目录类型',
    `ICONCLASS`     varchar(100) DEFAULT NULL COMMENT '样式CLASS',
    `CSSSTYLE`      varchar(255) DEFAULT NULL COMMENT '样式STYLE',
    `AUTHCODE`      varchar(100) DEFAULT NULL COMMENT '认证代码',
    `DEFAULTMENU`   tinyint(4)   DEFAULT NULL COMMENT '默认菜单',
    `DATAID`        varchar(32)  DEFAULT NULL COMMENT '数据ID',
    `DICICON`       varchar(32)  DEFAULT NULL COMMENT '图标',
    `CURICON`       varchar(32)  DEFAULT NULL COMMENT '当前选中图标',
    `BGCOLOR`       varchar(32)  DEFAULT NULL COMMENT '背景颜色',
    `CURBGCOLOR`    varchar(32)  DEFAULT NULL COMMENT '当前选中颜色',
    `MENUPOS`       varchar(32)  DEFAULT NULL COMMENT '菜单位置',
    `DISTITLE`      varchar(100) DEFAULT NULL COMMENT '显示标题',
    `NAVMENU`       tinyint(4)   DEFAULT '0' COMMENT '导航菜单',
    `QUICKMENU`     tinyint(4)   DEFAULT '0' COMMENT '快捷方式的菜单',
    `PROJECTID`     varchar(32)  DEFAULT NULL COMMENT '项目ID',
    `SPSEARCH`      tinyint(4)   DEFAULT NULL COMMENT '搜索关键词',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `SQL121227155530400` (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='报表目录表';

-- ----------------------------
-- Records of uk_datadic
-- ----------------------------

-- ----------------------------
-- Table structure for uk_dataevent
-- ----------------------------
DROP TABLE IF EXISTS `uk_dataevent`;
CREATE TABLE `uk_dataevent`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `name`       varchar(50)  DEFAULT NULL COMMENT '名称',
    `tpid`       varchar(32)  DEFAULT NULL COMMENT '字段ID',
    `propertity` varchar(50)  DEFAULT NULL COMMENT '属性名称',
    `field`      varchar(50)  DEFAULT NULL COMMENT '字段名称',
    `newvalue`   varchar(255) DEFAULT NULL COMMENT '变更后的值',
    `oldvalue`   varchar(255) DEFAULT NULL COMMENT '变更前的值',
    `modifyid`   varchar(32)  DEFAULT NULL COMMENT '变更ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `dataid`     varchar(32)  DEFAULT NULL COMMENT '数据ID',
    `eventtype`  varchar(32)  DEFAULT NULL COMMENT '事件类型',
    `content`    varchar(255) DEFAULT NULL COMMENT '变更内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='工单数据变更记录';

-- ----------------------------
-- Records of uk_dataevent
-- ----------------------------

-- ----------------------------
-- Table structure for uk_dimension
-- ----------------------------
DROP TABLE IF EXISTS `uk_dimension`;
CREATE TABLE `uk_dimension`
(
    `ID`            varchar(32) NOT NULL COMMENT '数据ID',
    `NAME`          varchar(255) DEFAULT NULL COMMENT '维度名称',
    `CODE`          varchar(255) DEFAULT NULL COMMENT '维度代码',
    `CREATETIME`    datetime     DEFAULT NULL COMMENT '创建时间',
    `CUBEID`        varchar(32)  DEFAULT NULL COMMENT '立方体ID',
    `TYPE`          varchar(32)  DEFAULT NULL COMMENT '维度类型',
    `SORTINDEX`     int(11)      DEFAULT NULL COMMENT '排序序号',
    `PARAMETERS`    longtext COMMENT '参数',
    `ATTRIBUE`      longtext COMMENT '扩展属性',
    `POSLEFT`       varchar(32)  DEFAULT NULL COMMENT '位置',
    `POSTOP`        varchar(32)  DEFAULT NULL COMMENT '位置距顶',
    `FORMATSTR`     varchar(32)  DEFAULT NULL COMMENT '格式化字符串',
    `MODELTYPE`     varchar(32)  DEFAULT NULL COMMENT '模型类型',
    `DIM`           varchar(32)  DEFAULT NULL COMMENT '维度',
    `ALLMEMBERNAME` varchar(32)  DEFAULT NULL COMMENT '小计名称',
    `FKFIELD`       varchar(255) DEFAULT NULL COMMENT '外键字段',
    `FKTABLE`       varchar(255) DEFAULT NULL COMMENT '外键表',
    `FKTABLEID`     varchar(255) DEFAULT NULL COMMENT '外键表ID',
    `CREATER`       varchar(32)  DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='维度表';

-- ----------------------------
-- Records of uk_dimension
-- ----------------------------

-- ----------------------------
-- Table structure for uk_drilldown
-- ----------------------------
DROP TABLE IF EXISTS `uk_drilldown`;
CREATE TABLE `uk_drilldown`
(
    `id`          varchar(32) NOT NULL COMMENT '主键ID',
    `name`        varchar(255) DEFAULT NULL COMMENT '名称',
    `memo`        varchar(255) DEFAULT NULL COMMENT '备注',
    `code`        varchar(255) DEFAULT NULL COMMENT '代码',
    `dataid`      varchar(255) DEFAULT NULL COMMENT '数据ID',
    `dataname`    varchar(255) DEFAULT NULL COMMENT '数据名称',
    `tdstyle`     varchar(255) DEFAULT NULL COMMENT 'TD样式',
    `reportid`    varchar(255) DEFAULT NULL COMMENT '报表ID',
    `modelid`     varchar(255) DEFAULT NULL COMMENT '模型ID',
    `paramname`   varchar(255) DEFAULT NULL COMMENT '参数名称',
    `paramtype`   varchar(255) DEFAULT NULL COMMENT '参数类型',
    `paramurl`    varchar(255) DEFAULT NULL COMMENT '参数URL',
    `paramtarget` varchar(255) DEFAULT NULL COMMENT '目标对象',
    `paramreport` varchar(255) DEFAULT NULL COMMENT '目标报表',
    `paramvalue`  varchar(255) DEFAULT NULL COMMENT '参数值',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='钻取表';

-- ----------------------------
-- Records of uk_drilldown
-- ----------------------------

-- ----------------------------
-- Table structure for cs_account
-- ----------------------------
DROP TABLE IF EXISTS `cs_account`;
CREATE TABLE `cs_account`
(
    `id`                varchar(32) NOT NULL COMMENT '单位ID',
    `name`              varchar(255)  DEFAULT NULL COMMENT '企(事)业单位名称',
    `etype`             varchar(60)   DEFAULT NULL COMMENT '单位性质',
    `ekind`             varchar(60)   DEFAULT NULL COMMENT '客户类别',
    `elevel`            varchar(60)   DEFAULT NULL COMMENT '客户级别',
    `ecode`             varchar(60)   DEFAULT NULL COMMENT '单位代码',
    `nickname`          varchar(64)   DEFAULT NULL COMMENT '单位简称',
    `esource`           varchar(64)   DEFAULT NULL COMMENT '来源',
    `origincode`        varchar(60)   DEFAULT NULL COMMENT '组织机构代码',
    `corporation`       varchar(60)   DEFAULT NULL COMMENT '法人',
    `leadername`        varchar(40)   DEFAULT NULL COMMENT '联系人姓名',
    `leadermobile`      varchar(40)   DEFAULT NULL COMMENT '联系人手机',
    `leadermobile2`     varchar(40)   DEFAULT NULL COMMENT '联系人手机2',
    `leaderphone`       varchar(40)   DEFAULT NULL COMMENT '联系人座机',
    `leaderemail`       varchar(60)   DEFAULT NULL COMMENT '联系人电子邮件',
    `website`           varchar(255)  DEFAULT NULL COMMENT '网址',
    `email`             varchar(128)  DEFAULT NULL COMMENT '电子邮件',
    `emailalt`          varchar(128)  DEFAULT NULL COMMENT '备用电子邮件',
    `phone`             varchar(40)   DEFAULT NULL COMMENT '办公电话',
    `phonealt`          varchar(40)   DEFAULT NULL COMMENT '备用办公电话',
    `fax`               varchar(40)   DEFAULT NULL COMMENT '传真号码',
    `faxalt`            varchar(40)   DEFAULT NULL COMMENT '备用传真号码',
    `country`           varchar(60)   DEFAULT NULL COMMENT '国家',
    `province`          varchar(60)   DEFAULT NULL COMMENT '省',
    `city`              varchar(60)   DEFAULT NULL COMMENT '市区县',
    `sarea`             varchar(60)   DEFAULT NULL COMMENT '区县',
    `address`           varchar(255)  DEFAULT NULL COMMENT '地址',
    `postcode`          varchar(40)   DEFAULT NULL COMMENT '邮政编码',
    `businessscope`     text COMMENT '经营范围',
    `capital`           varchar(40)   DEFAULT NULL COMMENT '注册资本',
    `stockcode`         varchar(40)   DEFAULT NULL COMMENT '股票代码',
    `bankaccount`       varchar(40)   DEFAULT NULL COMMENT '对公银行账号',
    `registeredaddress` text COMMENT '注册地址',
    `esize`             varchar(60)   DEFAULT NULL COMMENT '单位规模',
    `industry`          varchar(60)   DEFAULT NULL COMMENT '所属行业',
    `validstatus`       varchar(50)   DEFAULT NULL COMMENT '效力状态',
    `weixin`            varchar(60)   DEFAULT NULL COMMENT '微信公众号',
    `weibo`             varchar(255)  DEFAULT NULL COMMENT '微博号',
    `touchtime`         datetime      DEFAULT NULL COMMENT '最后联系时间',
    `dzip`              varchar(32)   DEFAULT NULL COMMENT '发货地址邮编',
    `daddress`          varchar(255)  DEFAULT NULL COMMENT '发货地址',
    `darea`             varchar(60)   DEFAULT NULL COMMENT '发货地址-区县',
    `dcity`             varchar(60)   DEFAULT NULL COMMENT '发货地址-城市',
    `dprovince`         varchar(60)   DEFAULT NULL COMMENT '发货地址-省份',
    `datastatus`        varchar(2)    DEFAULT NULL COMMENT '数据状态',
    `processid`         varchar(60)   DEFAULT NULL COMMENT '流程ID',
    `description`       text COMMENT '描述',
    `creater`           varchar(60)   DEFAULT NULL COMMENT '创建人ID',
    `username`          varbinary(60) DEFAULT NULL COMMENT '创建人姓名',
    `updateuser`        varchar(60)   DEFAULT NULL COMMENT '修改人ID',
    `updateusername`    varchar(60)   DEFAULT NULL COMMENT '修改人姓名',
    `updatetime`        datetime      DEFAULT NULL COMMENT '修改时间',
    `createtime`        datetime      DEFAULT NULL COMMENT '创建时间',
    `assignedto`        varchar(255)  DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`          varchar(255)  DEFAULT NULL COMMENT '流程状态',
    `shares`            varchar(255)  DEFAULT NULL COMMENT '分享给',
    `owner`             varchar(255)  DEFAULT NULL COMMENT '所属人',
    `datadept`          varchar(255)  DEFAULT NULL COMMENT '创建人部门',
    `batid`             varchar(32)   DEFAULT NULL COMMENT '批次ID',
    `maturity`          varchar(32)   DEFAULT NULL COMMENT '规模',
    `entcusid`          varchar(32)   DEFAULT NULL COMMENT '客户ID',
    `pinyin`            varchar(10)   DEFAULT NULL COMMENT '首字母缩写拼音',
    `organ`             varchar(32)   DEFAULT NULL COMMENT '部门',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='企(事)业单位信息表';

-- ----------------------------
-- Records of cs_account
-- ----------------------------

-- ----------------------------
-- Table structure for uk_generation
-- ----------------------------
DROP TABLE IF EXISTS `uk_generation`;
CREATE TABLE `uk_generation`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `model`      varchar(32) DEFAULT NULL COMMENT '所属组件',
    `startinx`   int(11)     DEFAULT NULL COMMENT '开始位置',
    `creater`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `createtime` datetime    DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='全局ID生成器';

-- ----------------------------
-- Records of uk_generation
-- ----------------------------

-- ----------------------------
-- Table structure for uk_historyreport
-- ----------------------------
DROP TABLE IF EXISTS `uk_historyreport`;
CREATE TABLE `uk_historyreport`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `BYTES`      int(11)     NOT NULL COMMENT '传输数据量',
    `THREADS`    int(11)     NOT NULL COMMENT '线程数量',
    `TYPE`       varchar(255) DEFAULT NULL COMMENT '类型',
    `STATUS`     varchar(255) DEFAULT NULL COMMENT '状态',
    `ERRORMSG`   varchar(255) DEFAULT NULL COMMENT '错误提示',
    `CREATETIME` datetime     DEFAULT NULL COMMENT '创建时间',
    `STARTTIME`  datetime     DEFAULT NULL COMMENT '开始时间',
    `ENDTIME`    datetime     DEFAULT NULL COMMENT '结束时间',
    `AMOUNT`     varchar(255) DEFAULT NULL COMMENT '提醒',
    `PAGES`      int(11)     NOT NULL COMMENT '记录数量',
    `ERRORS`     int(11)     NOT NULL COMMENT '错误数',
    `TABLEDIRID` varchar(32)  DEFAULT NULL COMMENT '数据表目录ID',
    `TABLEID`    varchar(32)  DEFAULT NULL COMMENT '数据表ID',
    `TOTAL`      int(11)      DEFAULT NULL COMMENT '总数',
    `USERID`     varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `USERNAME`   varchar(50)  DEFAULT '' COMMENT '用户名',
    `dataid`     varchar(32)  DEFAULT NULL COMMENT '批次ID',
    `title`      varchar(100) DEFAULT NULL COMMENT '标题',
    `organ`      varchar(50)  DEFAULT NULL COMMENT '组织机构',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='数据采集历史表';

-- ----------------------------
-- Records of uk_historyreport
-- ----------------------------

-- ----------------------------
-- Table structure for uk_imgroup
-- ----------------------------
DROP TABLE IF EXISTS `uk_imgroup`;
CREATE TABLE `uk_imgroup`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `tipmessage` text COMMENT '提示消息',
    `descript`   text COMMENT '描述',
    `name`       varchar(100) DEFAULT NULL COMMENT '分组名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='企业聊天分组表';

-- ----------------------------
-- Records of uk_imgroup
-- ----------------------------

-- ----------------------------
-- Table structure for uk_imgroup_user
-- ----------------------------
DROP TABLE IF EXISTS `uk_imgroup_user`;
CREATE TABLE `uk_imgroup_user`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `name`       varchar(100) DEFAULT NULL COMMENT '名称',
    `user_id`    varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `imgroup_id` varchar(32)  DEFAULT NULL COMMENT '分组ID',
    `admin`      tinyint(4)   DEFAULT NULL COMMENT '是否管理员',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='企业聊天分组用户';

-- ----------------------------
-- Records of uk_imgroup_user
-- ----------------------------

-- ----------------------------
-- Table structure for uk_instruction
-- ----------------------------
DROP TABLE IF EXISTS `uk_instruction`;
CREATE TABLE `uk_instruction`
(
    `id`             varchar(96) NOT NULL COMMENT '主键ID',
    `name`           varchar(96)  DEFAULT NULL COMMENT '名称',
    `code`           varchar(96)  DEFAULT NULL COMMENT '编码',
    `plugin`         varchar(96)  DEFAULT NULL COMMENT '插件',
    `memo`           text COMMENT '备注',
    `status`         varchar(96)  DEFAULT NULL COMMENT '状态',
    `createtime`     datetime     DEFAULT NULL COMMENT '创建时间',
    `userid`         varchar(96)  DEFAULT NULL COMMENT '用户ID',
    `type`           varchar(96)  DEFAULT NULL COMMENT '类型',
    `parent`         varchar(96)  DEFAULT NULL COMMENT '上级指令',
    `username`       varchar(96)  DEFAULT NULL COMMENT '用户名',
    `scope`          varchar(15)  DEFAULT NULL COMMENT '作用域',
    `tipdefault`     smallint(6)  DEFAULT NULL COMMENT '默认提示',
    `matcherule`     varchar(96)  DEFAULT NULL COMMENT '匹配规则',
    `userbind`       smallint(6)  DEFAULT NULL COMMENT '用户绑定',
    `interfacetype`  varchar(96)  DEFAULT NULL COMMENT '接口类型',
    `adapter`        varchar(96)  DEFAULT NULL COMMENT '适配程序',
    `interfaceurl`   text COMMENT '接口URL',
    `interfaceparam` text COMMENT '接口参数',
    `messagetype`    varchar(96)  DEFAULT NULL COMMENT '消息类型',
    `keyword`        varchar(100) DEFAULT NULL COMMENT '关键词',
    `eventype`       varchar(32)  DEFAULT NULL COMMENT '菜单事件类型',
    `snsid`          varchar(32)  DEFAULT NULL COMMENT 'SNSID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='微信指令表';

-- ----------------------------
-- Records of uk_instruction
-- ----------------------------

-- ----------------------------
-- Table structure for uk_inviterecord
-- ----------------------------
DROP TABLE IF EXISTS `uk_inviterecord`;
CREATE TABLE `uk_inviterecord`
(
    `id`           varchar(32) NOT NULL COMMENT '主键ID',
    `userid`       varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `agentno`      varchar(32)  DEFAULT NULL COMMENT '坐席ID',
    `createtime`   datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime`   datetime     DEFAULT NULL COMMENT '更新时间',
    `result`       varchar(10)  DEFAULT NULL COMMENT '记录',
    `responsetime` int(11)      DEFAULT NULL COMMENT '响应时间',
    `appid`        varchar(32)  DEFAULT NULL COMMENT 'SNSID',
    `title`        varchar(255) DEFAULT NULL COMMENT '标题',
    `url`          text COMMENT '地址',
    `traceid`      varchar(32)  DEFAULT NULL COMMENT '跟踪ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='邀请记录表';

-- ----------------------------
-- Records of uk_inviterecord
-- ----------------------------

-- ----------------------------
-- Table structure for uk_jobdetail
-- ----------------------------
DROP TABLE IF EXISTS `uk_jobdetail`;
CREATE TABLE `uk_jobdetail`
(
    `ID`                varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`              varchar(50)          DEFAULT NULL COMMENT '名称',
    `CODE`              varchar(50)          DEFAULT NULL COMMENT '代码',
    `CREATETIME`        datetime             DEFAULT NULL COMMENT '创建时间',
    `CREATER`           varchar(32)          DEFAULT NULL COMMENT '创建人',
    `UPDATETIME`        datetime             DEFAULT NULL COMMENT '更新时间',
    `USERNAME`          varchar(50)          DEFAULT NULL COMMENT '创建人',
    `STATUS`            varchar(50)          DEFAULT NULL COMMENT '任务状态',
    `PARENTID`          varchar(32)          DEFAULT NULL COMMENT '上级ID',
    `ACTID`             varchar(32)          DEFAULT NULL COMMENT '活动ID',
    `INX`               int(11)              DEFAULT '0' COMMENT '分类排序序号',
    `NAMENUM`           int(11)              DEFAULT '0' COMMENT '批次包含的名单总数',
    `VALIDNUM`          int(11)              DEFAULT '0' COMMENT '批次包含的有效名单总数',
    `INVALIDNUM`        int(11)              DEFAULT '0' COMMENT '批次包含的无效名单总数',
    `ASSIGNED`          int(11)              DEFAULT '0' COMMENT '已分配名单总数',
    `NOTASSIGNED`       int(11)              DEFAULT '0' COMMENT '未分配名单总数',
    `ENABLE`            tinyint(4)  NOT NULL DEFAULT '0' COMMENT '分类状态',
    `DATASTATUS`        tinyint(4)           DEFAULT '0' COMMENT '数据状态',
    `AREA`              text COMMENT '分类描述',
    `imptype`           varchar(50)          DEFAULT NULL COMMENT '导入类型',
    `batchtype`         varchar(32)          DEFAULT NULL COMMENT '批次类型',
    `ORGAN`             varchar(32)          DEFAULT NULL COMMENT '部门',
    `impurl`            text COMMENT '导入URL',
    `filetype`          varchar(50)          DEFAULT NULL COMMENT '文件类型',
    `dbtype`            varchar(50)          DEFAULT NULL COMMENT '数据库类型',
    `jdbcurl`           text COMMENT '数据库URL',
    `driverclazz`       varchar(255)         DEFAULT NULL COMMENT '数据库驱动',
    `password`          varchar(255)         DEFAULT NULL COMMENT '密码',
    `DESCRIPTION`       text COMMENT '描述信息',
    `execnum`           int(11)              DEFAULT '0' COMMENT '导入次数',
    `SOURCE`            varchar(255)         DEFAULT NULL COMMENT '来源',
    `CLAZZ`             varchar(255)         DEFAULT NULL COMMENT '执行的Resource类',
    `TASKFIRETIME`      datetime             DEFAULT NULL COMMENT '启动时间',
    `CRAWLTASKID`       varchar(255)         DEFAULT NULL COMMENT '任务ID',
    `EMAIL`             varchar(255)         DEFAULT NULL COMMENT '邮件地址',
    `NICKNAME`          varchar(255)         DEFAULT NULL COMMENT '昵称',
    `USERID`            varchar(255)         DEFAULT NULL COMMENT '用户ID',
    `TASKTYPE`          varchar(255)         DEFAULT NULL COMMENT '任务类型',
    `TASKID`            varchar(255)         DEFAULT NULL COMMENT '任务ID',
    `FETCHER`           smallint(6) NOT NULL COMMENT '当前状态',
    `PAUSE`             smallint(6) NOT NULL COMMENT '暂停',
    `PLANTASK`          smallint(6) NOT NULL COMMENT '计划任务',
    `SECURE_ID`         varchar(32)          DEFAULT NULL COMMENT '安全规则ID',
    `CONFIGURE_ID`      varchar(32)          DEFAULT NULL COMMENT '配置项ID',
    `TAKSPLAN_ID`       varchar(32)          DEFAULT NULL COMMENT '计划任务ID',
    `CRAWLTASK`         varchar(32)          DEFAULT NULL COMMENT '当前任务状态',
    `TARGETTASK`        varchar(32)          DEFAULT NULL COMMENT '目标任务',
    `STARTINDEX`        int(11)              DEFAULT NULL COMMENT '开始位置',
    `LASTDATE`          datetime             DEFAULT NULL COMMENT '最后更新时间',
    `CREATETABLE`       tinyint(4)           DEFAULT NULL COMMENT '是否创建数据表',
    `MEMO`              text COMMENT '备注',
    `NEXTFIRETIME`      datetime             DEFAULT NULL COMMENT '下次启动时间',
    `CRONEXP`           varchar(255)         DEFAULT NULL COMMENT 'CRON表达式',
    `TASKSTATUS`        varchar(32)          DEFAULT NULL COMMENT '任务执行状态',
    `usearea`           varchar(255)         DEFAULT NULL COMMENT '用户数据',
    `areafield`         varchar(255)         DEFAULT NULL COMMENT '用户字段',
    `areafieldtype`     varchar(32)          DEFAULT NULL COMMENT '用户数据类型',
    `arearule`          varchar(255)         DEFAULT NULL COMMENT '用户数据值',
    `minareavalue`      varchar(255)         DEFAULT NULL COMMENT '最小值',
    `maxareavalue`      varchar(255)         DEFAULT NULL COMMENT '最大值',
    `formatstr`         varchar(255)         DEFAULT NULL COMMENT '格式化字符串',
    `DATAID`            varchar(1000)        DEFAULT NULL COMMENT '报表id字符串',
    `DICID`             varchar(1000)        DEFAULT NULL COMMENT '目录id字符串',
    `taskinfo`          longtext COMMENT 'taskinfo信息',
    `FILTERID`          varchar(32)          DEFAULT NULL COMMENT '筛选表单ID',
    `FETCH_SIZE`        int(11)              DEFAULT NULL COMMENT '采集数据窗口大小',
    `LASTINDEX`         int(11)              DEFAULT NULL COMMENT '结束位置',
    `PAGES`             int(11)              DEFAULT NULL COMMENT '页面数量',
    `plantaskreadtorun` tinyint(4)           DEFAULT NULL COMMENT '计划任务',
    `priority`          int(11)              DEFAULT NULL COMMENT '策略',
    `runserver`         varchar(100)         DEFAULT NULL COMMENT '运行服务器',
    `actype`            varchar(50)          DEFAULT NULL COMMENT '活动类型',
    `distype`           varchar(32)          DEFAULT NULL COMMENT '分配类型',
    `distpolicy`        varchar(50)          DEFAULT NULL COMMENT '分配策略',
    `policynum`         int(11)              DEFAULT NULL COMMENT '分配数量',
    `busstype`          varchar(32)          DEFAULT NULL COMMENT '业务类型',
    `disnum`            varchar(32)          DEFAULT NULL COMMENT '默认分配数量',
    `execmd`            varchar(32)          DEFAULT NULL COMMENT '执行次数',
    `exectarget`        varchar(50)          DEFAULT NULL COMMENT '执行分配目标',
    `exectype`          varchar(32)          DEFAULT NULL COMMENT '执行类型',
    `execto`            varchar(32)          DEFAULT NULL COMMENT '回收数据位置',
    `threads`           int(11)              DEFAULT '0' COMMENT '启动任务的线程数量',
    `siptrunk`          varchar(32)          DEFAULT NULL COMMENT '线路信息',
    `province`          varchar(32)          DEFAULT NULL COMMENT '线路所在省份',
    `city`              varchar(32)          DEFAULT NULL COMMENT '线路所在城市',
    `prefix`            tinyint(4)           DEFAULT '0' COMMENT '线路资源拨号前缀',
    `reportid`          varchar(32)          DEFAULT NULL COMMENT '数据表ID',
    `mapping`           tinyint(4)           DEFAULT '0' COMMENT '默认映射结构',
    PRIMARY KEY (`ID`, `ENABLE`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='作业调度任务/活动/批次表';

-- ----------------------------
-- Records of uk_jobdetail
-- ----------------------------

-- ----------------------------
-- Table structure for uk_leavemsg
-- ----------------------------
DROP TABLE IF EXISTS `uk_leavemsg`;
CREATE TABLE `uk_leavemsg`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `name`       varchar(50)  DEFAULT NULL COMMENT '姓名',
    `mobile`     varchar(32)  DEFAULT NULL COMMENT '手机',
    `email`      varchar(100) DEFAULT NULL COMMENT '邮件',
    `address`    varchar(255) DEFAULT NULL COMMENT '地址',
    `qq`         varchar(30)  DEFAULT NULL COMMENT 'QQ',
    `content`    varchar(255) DEFAULT NULL COMMENT '留言内容',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `msgstatus`  varchar(20)  DEFAULT NULL COMMENT '消息状态',
    `contactsid` varchar(32)  DEFAULT NULL COMMENT '匹配联系人ID',
    `userid`     varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `skill`      varchar(32)  DEFAULT NULL COMMENT '技能组',
    `snsid`      varchar(32)  DEFAULT NULL COMMENT '渠道snsid',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='留言信息表';

-- ----------------------------
-- Records of uk_leavemsg
-- ----------------------------

-- ----------------------------
-- Table structure for uk_log
-- ----------------------------
DROP TABLE IF EXISTS `uk_log`;
CREATE TABLE `uk_log`
(
    `id`             varchar(32) NOT NULL COMMENT '主键ID',
    `flowid`         varchar(32)  DEFAULT NULL COMMENT '页面ID',
    `logtype`        varchar(32)  DEFAULT NULL COMMENT '日志类型',
    `createdate`     datetime     DEFAULT NULL COMMENT '创建时间',
    `msg`            longtext COMMENT '日志消息',
    `LEVELS`         varchar(32)  DEFAULT NULL COMMENT '日志级别',
    `thread`         varchar(255) DEFAULT NULL COMMENT '线程',
    `clazz`          varchar(255) DEFAULT NULL COMMENT 'JAVA类',
    `FILES`          varchar(255) DEFAULT NULL COMMENT '文件位置',
    `linenumber`     varchar(32)  DEFAULT NULL COMMENT '行号',
    `method`         varchar(255) DEFAULT NULL COMMENT '方法名称',
    `startid`        varchar(32)  DEFAULT NULL COMMENT '启动ID',
    `errorinfo`      text COMMENT '错误消息',
    `triggerwarning` varchar(32)  DEFAULT NULL COMMENT '触发警告',
    `triggertime`    varchar(32)  DEFAULT NULL COMMENT '警告时间',
    `triggertimes`   int(11)      DEFAULT NULL COMMENT '警告次数',
    `name`           varchar(32)  DEFAULT NULL COMMENT '日志名称',
    `code`           varchar(32)  DEFAULT NULL COMMENT '日志代码',
    `memo`           varchar(255) DEFAULT NULL COMMENT '备注信息',
    `userid`         varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(32)  DEFAULT NULL COMMENT '日志触发名',
    `logtime`        varchar(32)  DEFAULT NULL COMMENT '日志时间',
    `ipaddr`         varchar(255) DEFAULT NULL COMMENT '服务器地址',
    `port`           varchar(32)  DEFAULT NULL COMMENT '服务器端口',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='日志表';

-- ----------------------------
-- Records of uk_log
-- ----------------------------

-- ----------------------------
-- Table structure for uk_log_request
-- ----------------------------
DROP TABLE IF EXISTS `uk_log_request`;
CREATE TABLE `uk_log_request`
(
    `id`             varchar(32) NOT NULL DEFAULT '主键ID',
    `type`           varchar(255)         DEFAULT NULL COMMENT '类型',
    `parameters`     longtext COMMENT '参数',
    `throwable`      varchar(255)         DEFAULT NULL COMMENT '异常消息',
    `username`       varchar(255)         DEFAULT NULL COMMENT '用户名',
    `usermail`       varchar(255)         DEFAULT NULL COMMENT '用户信息',
    `filename`       varchar(255)         DEFAULT NULL COMMENT '文件名',
    `error`          text COMMENT '错误信息',
    `classname`      varchar(255)         DEFAULT NULL COMMENT '类名',
    `starttime`      datetime             DEFAULT NULL COMMENT '执行的开始时间',
    `endtime`        datetime             DEFAULT NULL COMMENT '执行的结束时间',
    `detailtype`     varchar(255)         DEFAULT NULL COMMENT '详情类型',
    `url`            text COMMENT '访问URL',
    `reportdic`      varchar(255)         DEFAULT NULL COMMENT '报表目录',
    `reportname`     varchar(255)         DEFAULT NULL COMMENT '报表名称',
    `ip`             varchar(255)         DEFAULT NULL COMMENT 'IP地址',
    `hostname`       varchar(255)         DEFAULT NULL COMMENT '主机名称',
    `statues`        varchar(255)         DEFAULT NULL COMMENT '状态',
    `methodname`     text COMMENT '方法名称',
    `linenumber`     varchar(255)         DEFAULT NULL COMMENT '行号',
    `querytime`      int(255)             DEFAULT NULL COMMENT '执行时间',
    `optext`         varchar(255)         DEFAULT NULL COMMENT '操作代码',
    `field6`         varchar(255)         DEFAULT NULL COMMENT '备用字段',
    `field7`         varchar(255)         DEFAULT NULL COMMENT '备用字段',
    `field8`         varchar(255)         DEFAULT NULL COMMENT '备用字段',
    `flowid`         varchar(32)          DEFAULT NULL COMMENT '页面ID',
    `userid`         varchar(255)         DEFAULT NULL COMMENT '用户ID',
    `name`           varchar(32)          DEFAULT NULL COMMENT '名称',
    `funtype`        varchar(32)          DEFAULT NULL COMMENT '方法类型',
    `fundesc`        varchar(255)         DEFAULT NULL COMMENT '方法描述',
    `triggerwarning` varchar(32)          DEFAULT NULL COMMENT '触发警告',
    `triggertime`    varchar(32)          DEFAULT NULL COMMENT '触发时间',
    `createdate`     datetime             DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='请求记录表';

-- ----------------------------
-- Records of uk_log_request
-- ----------------------------

-- ----------------------------
-- Table structure for cs_passport_webim_user
-- ----------------------------
DROP TABLE IF EXISTS `cs_passport_webim_user`;
CREATE TABLE `cs_passport_webim_user`
(
    `assignedto`   varchar(255) NOT NULL DEFAULT '' COMMENT '分配给目标',
    `creater`      varchar(255)          DEFAULT NULL COMMENT '创建人',
    `datastatus`   varchar(255)          DEFAULT NULL COMMENT '时间状态',
    `id`           varchar(32)  NOT NULL COMMENT '主键ID',
    `impid`        varchar(255)          DEFAULT NULL COMMENT '批次ID',
    `ipcode`       varchar(255)          DEFAULT NULL COMMENT 'IP编码',
    `owner`        varchar(255)          DEFAULT NULL COMMENT '所属用户',
    `processid`    varchar(255)          DEFAULT NULL COMMENT '流程ID',
    `shares`       varchar(255)          DEFAULT NULL COMMENT '分享给',
    `updatetime`   datetime              DEFAULT NULL COMMENT '更新时间',
    `updateuser`   varchar(255)          DEFAULT NULL COMMENT '更新用户',
    `username`     varchar(255)          DEFAULT NULL COMMENT '用户名',
    `wfstatus`     varchar(255)          DEFAULT NULL COMMENT '流程状态',
    `resolution`   varchar(255)          DEFAULT NULL COMMENT '分辨率',
    `opersystem`   varchar(100)          DEFAULT NULL COMMENT '操作系统',
    `ip`           varchar(50)           DEFAULT NULL COMMENT 'IP',
    `hostname`     varchar(32)           DEFAULT NULL COMMENT '主机名称',
    `browser`      varchar(32)           DEFAULT NULL COMMENT '浏览器',
    `status`       varchar(11)           DEFAULT NULL COMMENT '状态',
    `userid`       varchar(52)           DEFAULT NULL COMMENT '用户ID',
    `logintime`    datetime              DEFAULT NULL COMMENT '访问时间',
    `sessionid`    varchar(100)          DEFAULT NULL COMMENT '会话ID',
    `createtime`   datetime              DEFAULT NULL COMMENT '创建时间',
    `usertype`     varchar(52)           DEFAULT NULL COMMENT '访客类型',
    `optype`       varchar(52)           DEFAULT NULL COMMENT '操作类型',
    `mobile`       varchar(10)           DEFAULT NULL COMMENT '移动端',
    `phone`        varchar(20)           DEFAULT NULL COMMENT '电话号',
    `olduser`      varchar(10)           DEFAULT NULL COMMENT '老用户',
    `country`      varchar(50)           DEFAULT NULL COMMENT '访客国家',
    `region`       varchar(200)          DEFAULT NULL COMMENT '访客区域',
    `city`         varchar(50)           DEFAULT NULL COMMENT '城市',
    `isp`          varchar(100)          DEFAULT NULL COMMENT '接入运营商',
    `province`     varchar(50)           DEFAULT NULL COMMENT '省份',
    `betweentime`  int(11)               DEFAULT NULL COMMENT '停留时间',
    `datestr`      varchar(20)           DEFAULT NULL COMMENT '时间',
    `keyword`      varchar(100)          DEFAULT NULL COMMENT '搜索引擎关键词',
    `source`       varchar(50)           DEFAULT NULL COMMENT '来源',
    `title`        varchar(255)          DEFAULT NULL COMMENT '标题',
    `url`          text COMMENT '来源URL',
    `useragent`    text COMMENT 'UA',
    `invitetimes`  int(11)               DEFAULT NULL COMMENT '要求次数',
    `invitestatus` varchar(10)           DEFAULT NULL COMMENT '邀请状态',
    `refusetimes`  int(11)               DEFAULT NULL COMMENT '拒绝次数',
    `channel`      varchar(32)           DEFAULT NULL COMMENT '渠道',
    `appid`        varchar(32)           DEFAULT NULL COMMENT 'SNSID',
    `contactsid`   varchar(32)           DEFAULT NULL COMMENT '联系人ID',
    `headimgurl`   varchar(300)          DEFAULT NULL COMMENT '访客头像',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `onlineuser_userid` (`userid`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='在线访客信息表';

-- ----------------------------
-- Records of cs_passport_webim_user
-- ----------------------------

-- ----------------------------
-- Table structure for cs_passport_webim_user_his
-- ----------------------------
DROP TABLE IF EXISTS `cs_passport_webim_user_his`;
CREATE TABLE `cs_passport_webim_user_his`
(
    `assignedto`   varchar(255) NOT NULL DEFAULT '' COMMENT '分配给目标',
    `creater`      varchar(255)          DEFAULT NULL COMMENT '创建人',
    `datastatus`   varchar(255)          DEFAULT NULL COMMENT '时间状态',
    `id`           varchar(32)  NOT NULL COMMENT '主键ID',
    `impid`        varchar(255)          DEFAULT NULL COMMENT '批次ID',
    `ipcode`       varchar(255)          DEFAULT NULL COMMENT 'IP编码',
    `owner`        varchar(255)          DEFAULT NULL COMMENT '所属用户',
    `processid`    varchar(255)          DEFAULT NULL COMMENT '流程ID',
    `shares`       varchar(255)          DEFAULT NULL COMMENT '分享给',
    `updatetime`   datetime              DEFAULT NULL COMMENT '更新时间',
    `updateuser`   varchar(255)          DEFAULT NULL COMMENT '更新用户',
    `username`     varchar(255)          DEFAULT NULL COMMENT '用户名',
    `wfstatus`     varchar(255)          DEFAULT NULL COMMENT '流程状态',
    `resolution`   varchar(255)          DEFAULT NULL COMMENT '分辨率',
    `opersystem`   varchar(100)          DEFAULT NULL COMMENT '操作系统',
    `ip`           varchar(50)           DEFAULT NULL COMMENT 'IP',
    `hostname`     varchar(32)           DEFAULT NULL COMMENT '主机名称',
    `browser`      varchar(32)           DEFAULT NULL COMMENT '浏览器',
    `status`       varchar(11)           DEFAULT NULL COMMENT '状态',
    `userid`       varchar(52)           DEFAULT NULL COMMENT '用户ID',
    `logintime`    datetime              DEFAULT NULL COMMENT '访问时间',
    `sessionid`    varchar(100)          DEFAULT NULL COMMENT '会话ID',
    `createtime`   datetime              DEFAULT NULL COMMENT '创建时间',
    `usertype`     varchar(52)           DEFAULT NULL COMMENT '访客类型',
    `optype`       varchar(52)           DEFAULT NULL COMMENT '操作类型',
    `mobile`       varchar(10)           DEFAULT NULL COMMENT '移动端',
    `olduser`      varchar(10)           DEFAULT NULL COMMENT '老用户',
    `country`      varchar(50)           DEFAULT NULL COMMENT '访客国家',
    `region`       varchar(200)          DEFAULT NULL COMMENT '访客区域',
    `city`         varchar(50)           DEFAULT NULL COMMENT '城市',
    `isp`          varchar(100)          DEFAULT NULL COMMENT '接入运营商',
    `province`     varchar(50)           DEFAULT NULL COMMENT '省份',
    `betweentime`  int(11)               DEFAULT NULL COMMENT '停留时间',
    `datestr`      varchar(20)           DEFAULT NULL COMMENT '时间',
    `keyword`      varchar(100)          DEFAULT NULL COMMENT '搜索引擎关键词',
    `source`       varchar(50)           DEFAULT NULL COMMENT '来源',
    `title`        varchar(255)          DEFAULT NULL COMMENT '标题',
    `url`          text COMMENT '来源URL',
    `useragent`    text COMMENT 'UA',
    `invitetimes`  int(11)               DEFAULT NULL COMMENT '要求次数',
    `invitestatus` varchar(10)           DEFAULT NULL COMMENT '邀请状态',
    `refusetimes`  int(11)               DEFAULT NULL COMMENT '拒绝次数',
    `channel`      varchar(32)           DEFAULT NULL COMMENT '渠道',
    `appid`        varchar(32)           DEFAULT NULL COMMENT 'SNSID',
    `contactsid`   varchar(32)           DEFAULT NULL COMMENT '联系人ID',
    `dataid`       varchar(32)           DEFAULT NULL COMMENT '关联的OnlineUser数据ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='在线访客访问历史表';

-- ----------------------------
-- Records of cs_passport_webim_user_his
-- ----------------------------

-- ----------------------------
-- Table structure for uk_organ
-- ----------------------------
DROP TABLE IF EXISTS `uk_organ`;
CREATE TABLE `uk_organ`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`       varchar(50) DEFAULT NULL COMMENT '名称',
    `CODE`       varchar(50) DEFAULT NULL COMMENT '代码',
    `CREATETIME` datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime    DEFAULT NULL COMMENT '更新时间',
    `COMPANYID`  varchar(32) DEFAULT NULL COMMENT '企业ID',
    `USERNAME`   varchar(50) DEFAULT NULL COMMENT '用户名',
    `PARENT`     varchar(32) DEFAULT NULL COMMENT '父级ID',
    `SKILL`      tinyint(4)  DEFAULT '0' COMMENT '启用技能组',
    `area`       text,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='部门表';

-- ----------------------------
-- Records of uk_organ
-- ----------------------------
INSERT INTO `uk_organ`
VALUES ('2c9e80867d65eb5c017d65f17ceb0019', '售前坐席A组', null, null, null, null, null, null,
        '4028a0866f9403f1016f9405a05d000e', '1', '');
INSERT INTO `uk_organ`
VALUES ('4028a0866f9403f1016f9405a05d000e', '我的企业', null, null, null, null, 'cskefu', null, '0', '0', '');

-- ----------------------------
-- Table structure for uk_organization
-- ----------------------------
DROP TABLE IF EXISTS `uk_organization`;
CREATE TABLE `uk_organization`
(
    `id`          varchar(32) NOT NULL DEFAULT '' COMMENT '机构ID',
    `name`        varchar(255)         DEFAULT NULL COMMENT '名称',
    `orgtype`     varchar(255)         DEFAULT NULL COMMENT '类型',
    `orgscale`    varchar(255)         DEFAULT NULL COMMENT '规模',
    `orgindustry` varchar(255)         DEFAULT NULL COMMENT '行业',
    `code`        varchar(255)         DEFAULT NULL COMMENT '代码',
    `memo`        varchar(200)         DEFAULT NULL COMMENT '备注',
    `logo`        varchar(200)         DEFAULT NULL COMMENT 'LOGO URL',
    `createtime`  timestamp   NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='企业信息表';

-- ----------------------------
-- Records of uk_organization
-- ----------------------------

-- ----------------------------
-- Table structure for uk_organrole
-- ----------------------------
DROP TABLE IF EXISTS `uk_organrole`;
CREATE TABLE `uk_organrole`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `organ_id`   varchar(32) DEFAULT NULL COMMENT '机构ID',
    `role_id`    varchar(32) DEFAULT NULL COMMENT '角色ID',
    `creater`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `createtime` datetime    DEFAULT NULL COMMENT '创建时间',
    `dicid`      varchar(32) DEFAULT NULL COMMENT '目录ID',
    `dicvalue`   varchar(50) DEFAULT NULL COMMENT '目录名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='部门授权表';

-- ----------------------------
-- Records of uk_organrole
-- ----------------------------

-- ----------------------------
-- Table structure for uk_orgi_skill_rel
-- ----------------------------
DROP TABLE IF EXISTS `uk_orgi_skill_rel`;
CREATE TABLE `uk_orgi_skill_rel`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `SKILLID`    varchar(50) DEFAULT NULL COMMENT '技能组',
    `CREATETIME` datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime    DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='租户角色映射表';

-- ----------------------------
-- Records of uk_orgi_skill_rel
-- ----------------------------

-- ----------------------------
-- Table structure for uk_propertiesevent
-- ----------------------------
DROP TABLE IF EXISTS `uk_propertiesevent`;
CREATE TABLE `uk_propertiesevent`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `name`       varchar(50)  DEFAULT NULL COMMENT '名称',
    `tpid`       varchar(32)  DEFAULT NULL COMMENT '字段ID',
    `propertity` varchar(50)  DEFAULT NULL COMMENT '字段',
    `field`      varchar(50)  DEFAULT NULL COMMENT '阻断名称',
    `newvalue`   varchar(255) DEFAULT NULL COMMENT '变更后的值',
    `oldvalue`   varchar(255) DEFAULT NULL COMMENT '变更前的值',
    `modifyid`   varchar(32)  DEFAULT NULL COMMENT '修改ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `dataid`     varchar(32)  DEFAULT NULL COMMENT '数据记录ID',
    `textvalue`  varchar(255) DEFAULT NULL COMMENT '文本值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='字段变更记录';

-- ----------------------------
-- Records of uk_propertiesevent
-- ----------------------------

-- ----------------------------
-- Table structure for uk_recentuser
-- ----------------------------
DROP TABLE IF EXISTS `uk_recentuser`;
CREATE TABLE `uk_recentuser`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人ID',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `name`       varchar(100) DEFAULT NULL COMMENT '名称',
    `user_id`    varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `lastmsg`    text COMMENT '最后一条消息',
    `newmsg`     int(11)      DEFAULT NULL COMMENT '未读消息数量',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='公共已读消息';

-- ----------------------------
-- Records of uk_recentuser
-- ----------------------------

-- ----------------------------
-- Table structure for uk_report
-- ----------------------------
DROP TABLE IF EXISTS `uk_report`;
CREATE TABLE `uk_report`
(
    `ID`            varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`          varchar(255) DEFAULT NULL COMMENT '报表名称',
    `REPORTTYPE`    varchar(32)  DEFAULT NULL COMMENT '报表类型',
    `TITLE`         varchar(255) DEFAULT NULL COMMENT '主题',
    `OBJECTCOUNT`   int(11)      DEFAULT NULL COMMENT '模板内容',
    `DICID`         varchar(32)  DEFAULT NULL COMMENT '目录ID',
    `CREATETIME`    datetime     DEFAULT NULL COMMENT '创建时间',
    `DESCRIPTION`   longtext COMMENT '描述内容',
    `HTML`          longtext COMMENT '代码',
    `REPORTPACKAGE` varchar(255) DEFAULT NULL COMMENT '路径',
    `USEACL`        varchar(32)  DEFAULT NULL COMMENT '访问授权',
    `status`        varchar(32)  DEFAULT NULL COMMENT '状态',
    `rolename`      text COMMENT '角色名称',
    `userid`        text COMMENT '用户ID',
    `blacklist`     text COMMENT '黑名单列表',
    `REPORTCONTENT` longtext COMMENT '报表序列化代码',
    `reportmodel`   varchar(32)  DEFAULT NULL COMMENT '报表模型',
    `updatetime`    datetime     DEFAULT NULL COMMENT '更新时间',
    `creater`       varchar(255) DEFAULT NULL COMMENT '创建人',
    `reportversion` int(11)      DEFAULT NULL COMMENT '版本',
    `publishedtype` varchar(32)  DEFAULT NULL COMMENT '发布状态',
    `tabtype`       varchar(32)  DEFAULT NULL COMMENT '切换方式',
    `USERNAME`      varchar(32)  DEFAULT NULL COMMENT '用户名',
    `USEREMAIL`     varchar(255) DEFAULT NULL COMMENT '用户信息',
    `CACHE`         smallint(6)  DEFAULT NULL COMMENT '是否启用缓存',
    `EXTPARAM`      varchar(255) DEFAULT NULL COMMENT '导出参数',
    `TARGETREPORT`  varchar(32)  DEFAULT NULL COMMENT '目标报表',
    `DATASTATUS`    tinyint(4)   DEFAULT NULL COMMENT '报表状态',
    `CODE`          varchar(100) DEFAULT NULL COMMENT '代码',
    `SOURCE`        varchar(50)  DEFAULT NULL COMMENT '数据源',
    `VIEWTYPE`      varchar(32)  DEFAULT NULL COMMENT '视图类型',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='报表数据表';

-- ----------------------------
-- Records of uk_report
-- ----------------------------

-- ----------------------------
-- Table structure for uk_reportfilter
-- ----------------------------
DROP TABLE IF EXISTS `uk_reportfilter`;
CREATE TABLE `uk_reportfilter`
(
    `id`               varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `dataid`           varchar(32)          DEFAULT NULL COMMENT '数据ID',
    `dataname`         varchar(255)         DEFAULT NULL COMMENT '数据名称',
    `modelid`          varchar(32)          DEFAULT NULL COMMENT '组件ID',
    `reportid`         varchar(32)          DEFAULT NULL COMMENT '报表ID',
    `contype`          varchar(32)          DEFAULT NULL COMMENT '链接类型',
    `filtertype`       varchar(32)          DEFAULT NULL COMMENT '筛选器类型',
    `formatstr`        varchar(255)         DEFAULT NULL COMMENT '格式化字符串',
    `convalue`         varchar(255)         DEFAULT NULL COMMENT '数据值',
    `userdefvalue`     text COMMENT '默认数据',
    `valuefiltertype`  varchar(255)         DEFAULT NULL COMMENT '筛选器值类型',
    `name`             varchar(255)         DEFAULT NULL COMMENT '名称',
    `code`             varchar(32)          DEFAULT NULL COMMENT '代码',
    `content`          text COMMENT '内容',
    `valuestr`         varchar(255)         DEFAULT NULL COMMENT '数据值字符串',
    `filterprefix`     varchar(255)         DEFAULT NULL COMMENT '过滤器前缀',
    `filtersuffix`     varchar(255)         DEFAULT NULL COMMENT '过滤器后缀',
    `modeltype`        varchar(32)          DEFAULT NULL COMMENT '元素类型',
    `createtime`       datetime             DEFAULT NULL COMMENT '创建时间',
    `funtype`          varchar(32)          DEFAULT NULL COMMENT '业务类型',
    `measureid`        varchar(32)          DEFAULT NULL COMMENT '指标ID',
    `valuecompare`     varchar(32)          DEFAULT NULL COMMENT '值',
    `defaultvalue`     text COMMENT '默认值',
    `comparetype`      varchar(32)          DEFAULT NULL COMMENT '筛选比较类型',
    `title`            varchar(255)         DEFAULT NULL COMMENT '标题',
    `cubeid`           varchar(32)          DEFAULT NULL COMMENT '模型ID',
    `mustvalue`        varchar(32)          DEFAULT NULL COMMENT '必选值',
    `groupids`         text COMMENT '分组ID',
    `defaultvaluerule` text COMMENT '默认值',
    `dimid`            varchar(32)          DEFAULT NULL COMMENT '维度ID',
    `endvalue`         text COMMENT '范围值',
    `filtertemplet`    varchar(255)         DEFAULT NULL COMMENT '筛选器模板',
    `noformatvalue`    text COMMENT '未格式化值',
    `startvalue`       varchar(255)         DEFAULT NULL COMMENT '筛选范围值',
    `sortindex`        int(11)              DEFAULT NULL COMMENT '排序位置',
    `cascadeid`        varchar(32)          DEFAULT NULL COMMENT '引用ID',
    `tableproperty`    varchar(32)          DEFAULT NULL COMMENT '数据字段ID',
    `tableid`          varchar(32)          DEFAULT NULL COMMENT '数据表ID',
    `fieldid`          varchar(32)          DEFAULT NULL COMMENT '字段ID',
    `fktableid`        varchar(32)          DEFAULT NULL COMMENT '外键表ID',
    `filterfieldid`    varchar(32)          DEFAULT NULL COMMENT '外键字段ID',
    `isdic`            tinyint(4)           DEFAULT NULL COMMENT '是否目录',
    `diccode`          varchar(255)         DEFAULT NULL COMMENT '显示值',
    `keyfield`         varchar(32)          DEFAULT NULL COMMENT '主键字段',
    `valuefield`       varchar(32)          DEFAULT NULL COMMENT '取值字段',
    `fkfieldid`        varchar(32)          DEFAULT NULL COMMENT '外键字段ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='报表筛选器';

-- ----------------------------
-- Records of uk_reportfilter
-- ----------------------------

-- ----------------------------
-- Table structure for uk_reportmodel
-- ----------------------------
DROP TABLE IF EXISTS `uk_reportmodel`;
CREATE TABLE `uk_reportmodel`
(
    `id`              varchar(50) NOT NULL COMMENT '主键ID',
    `posx`            varchar(50)  DEFAULT NULL COMMENT '位置',
    `posy`            varchar(50)  DEFAULT NULL COMMENT '位置',
    `poswidth`        varchar(50)  DEFAULT NULL COMMENT '宽度',
    `posheight`       varchar(50)  DEFAULT NULL COMMENT '高度',
    `name`            varchar(50)  DEFAULT NULL COMMENT '名称',
    `code`            varchar(50)  DEFAULT NULL COMMENT '代码',
    `reportid`        varchar(50)  DEFAULT NULL COMMENT '报表ID',
    `modeltype`       varchar(50)  DEFAULT NULL COMMENT '元素类型',
    `sortindex`       int(11)      DEFAULT NULL COMMENT '排序位置',
    `stylestr`        varchar(50)  DEFAULT NULL COMMENT '样式',
    `labeltext`       varchar(50)  DEFAULT NULL COMMENT '标签',
    `cssclassname`    varchar(50)  DEFAULT NULL COMMENT '样式名称',
    `mposleft`        varchar(50)  DEFAULT NULL COMMENT '原生位置',
    `mpostop`         varchar(50)  DEFAULT NULL COMMENT '元素位置',
    `title`           varchar(50)  DEFAULT NULL COMMENT '标题',
    `exchangerw`      tinyint(4)   DEFAULT '0' COMMENT '行列交换',
    `publishedcubeid` varchar(50)  DEFAULT NULL COMMENT '模型ID',
    `rowdimension`    text COMMENT '行维度',
    `coldimension`    text COMMENT '列维度',
    `measure`         varchar(50)  DEFAULT NULL COMMENT '指标',
    `dstype`          varchar(50)  DEFAULT NULL COMMENT '数据源类型',
    `dbtype`          varchar(50)  DEFAULT NULL COMMENT '数据类型',
    `objectid`        varchar(50)  DEFAULT NULL COMMENT '对象ID',
    `createtime`      datetime     DEFAULT NULL COMMENT '创建时间',
    `filterstr`       varchar(50)  DEFAULT NULL COMMENT '过滤器字符串',
    `sortstr`         varchar(50)  DEFAULT NULL COMMENT '排序字符串',
    `viewtype`        varchar(50)  DEFAULT NULL COMMENT '视图类型',
    `chartemplet`     varchar(50)  DEFAULT NULL COMMENT '图表模板',
    `chartype`        varchar(50)  DEFAULT NULL COMMENT '图表类型',
    `chartdatatype`   varchar(50)  DEFAULT NULL COMMENT '图表数据类型',
    `chart3d`         varchar(50)  DEFAULT NULL COMMENT '是否3D显示图表',
    `xtitle`          varchar(50)  DEFAULT NULL COMMENT '列标题',
    `ytitle`          varchar(50)  DEFAULT NULL COMMENT '行标题',
    `charttitle`      varchar(50)  DEFAULT NULL COMMENT '图表标题',
    `displayborder`   varchar(50)  DEFAULT NULL COMMENT '显示边框',
    `bordercolor`     varchar(50)  DEFAULT NULL COMMENT '边框颜色',
    `displaydesc`     varchar(50)  DEFAULT NULL COMMENT '倒序显示',
    `formdisplay`     varchar(50)  DEFAULT NULL COMMENT '显示表单',
    `labelstyle`      varchar(50)  DEFAULT NULL COMMENT '标签',
    `formname`        varchar(50)  DEFAULT NULL COMMENT '表单名称',
    `defaultvalue`    varchar(50)  DEFAULT NULL COMMENT '默认值',
    `querytext`       varchar(50)  DEFAULT NULL COMMENT '查询语句',
    `tempquey`        varchar(50)  DEFAULT NULL COMMENT '查询语句',
    `displaytitle`    tinyint(4)   DEFAULT '0' COMMENT '显示标题',
    `clearzero`       tinyint(4)   DEFAULT '0' COMMENT '除零',
    `titlestr`        varchar(50)  DEFAULT NULL COMMENT '标题字符串',
    `width`           varchar(50)  DEFAULT NULL COMMENT '宽度',
    `height`          varchar(50)  DEFAULT NULL COMMENT '高度',
    `widthunit`       varchar(50)  DEFAULT NULL COMMENT '宽度单位',
    `heightunit`      varchar(50)  DEFAULT NULL COMMENT '高度单位',
    `defheight`       varchar(50)  DEFAULT NULL COMMENT '定义高度',
    `defwidth`        varchar(50)  DEFAULT NULL COMMENT '定义宽度',
    `neckwidth`       varchar(50)  DEFAULT NULL COMMENT '吸附宽度',
    `neckheight`      varchar(50)  DEFAULT NULL COMMENT '吸附高度',
    `extparam`        varchar(50)  DEFAULT NULL COMMENT '扩展参数',
    `marginright`     varchar(50)  DEFAULT NULL COMMENT '距离右侧空白',
    `colorstr`        varchar(50)  DEFAULT NULL COMMENT '颜色样式',
    `sstart`          varchar(50)  DEFAULT NULL COMMENT '开始',
    `send`            varchar(50)  DEFAULT NULL COMMENT '结束',
    `rowformatstr`    varchar(50)  DEFAULT NULL COMMENT '行格式化字符串',
    `colformatstr`    varchar(50)  DEFAULT NULL COMMENT '列格式化字符串',
    `publishtype`     varchar(50)  DEFAULT NULL COMMENT '发布状态',
    `editview`        varchar(50)  DEFAULT NULL COMMENT '编辑状态',
    `expandbtm`       tinyint(4)   DEFAULT '0' COMMENT '收缩位置',
    `expandrgt`       tinyint(4)   DEFAULT '0' COMMENT '收缩方式',
    `curtab`          varchar(50)  DEFAULT NULL COMMENT '当前页签',
    `hiddencolstr`    varchar(50)  DEFAULT NULL COMMENT '隐藏样式',
    `eventstr`        varchar(50)  DEFAULT NULL COMMENT '事件触发样式',
    `dsmodel`         varchar(50)  DEFAULT NULL COMMENT '数据源模型',
    `html`            text COMMENT '代码',
    `sqldialect`      varchar(255) DEFAULT NULL COMMENT '方言',
    `pagesize`        int(11)      DEFAULT NULL COMMENT '分页尺寸',
    `isloadfulldata`  varchar(50)  DEFAULT NULL COMMENT '全量数据',
    `isexport`        tinyint(4)   DEFAULT '0' COMMENT '导出',
    `selectdata`      tinyint(4)   DEFAULT '0' COMMENT '选中数据',
    `exporttitle`     varchar(50)  DEFAULT NULL COMMENT '导出标题',
    `colsize`         int(11)      DEFAULT NULL COMMENT '列尺寸',
    `sorttype`        varchar(50)  DEFAULT NULL COMMENT '排序类型',
    `sortname`        varchar(50)  DEFAULT NULL COMMENT '排序名称',
    `mid`             varchar(32)  DEFAULT NULL COMMENT '模型ID',
    `parentid`        varchar(32)  DEFAULT NULL COMMENT '父级ID',
    `templetid`       varchar(32)  DEFAULT NULL COMMENT '模板ID',
    `colspan`         int(11)      DEFAULT NULL COMMENT '合并列',
    `colindex`        int(11)      DEFAULT NULL COMMENT '列位置',
    `chartcontent`    longtext COMMENT '图标代码',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='报表布局项';

-- ----------------------------
-- Records of uk_reportmodel
-- ----------------------------

-- ----------------------------
-- Table structure for uk_role
-- ----------------------------
DROP TABLE IF EXISTS `uk_role`;
CREATE TABLE `uk_role`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`       varchar(50) DEFAULT NULL COMMENT '名称',
    `CODE`       varchar(50) DEFAULT NULL COMMENT '代码',
    `CREATETIME` datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime    DEFAULT NULL COMMENT '更新时间',
    `COMPANYID`  varchar(32) DEFAULT NULL COMMENT '企业ID',
    `USERNAME`   varchar(50) DEFAULT NULL COMMENT '用户名',
    `ORGAN`      varchar(32) DEFAULT NULL COMMENT '部门',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='角色表';

-- ----------------------------
-- Records of uk_role
-- ----------------------------
INSERT INTO `uk_role`
VALUES ('ff8080817d7f1444017d7f216fda000e', '管理员', null, '2021-12-03 15:10:37', '4028cac3614cd2f901614cf8be1f0324',
        '2021-12-03 15:10:37', null, null, '4028a0866f9403f1016f9405a05d000e');
INSERT INTO `uk_role`
VALUES ('ff8080817d7f1444017d7f21cd360012', '高级坐席', null, '2021-12-03 15:11:01', '4028cac3614cd2f901614cf8be1f0324',
        '2021-12-03 15:11:01', null, null, '4028a0866f9403f1016f9405a05d000e');
INSERT INTO `uk_role`
VALUES ('ff8080817d7f1444017d7f2211c60016', '普通坐席', null, '2021-12-03 15:11:18', '4028cac3614cd2f901614cf8be1f0324',
        '2021-12-03 15:11:18', null, null, '4028a0866f9403f1016f9405a05d000e');

-- ----------------------------
-- Table structure for uk_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `uk_role_auth`;
CREATE TABLE `uk_role_auth`
(
    `ID`         varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`       varchar(50) DEFAULT NULL COMMENT '名称',
    `CODE`       varchar(50) DEFAULT NULL COMMENT '代码',
    `CREATETIME` datetime    DEFAULT NULL COMMENT '创建时间',
    `CREATER`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `UPDATETIME` datetime    DEFAULT NULL COMMENT '更新时间',
    `USERNAME`   varchar(50) DEFAULT NULL COMMENT '用户名',
    `ROLEID`     varchar(32) DEFAULT NULL COMMENT '角色ID',
    `DICID`      varchar(32) DEFAULT NULL COMMENT '权限ID',
    `DICVALUE`   varchar(30) DEFAULT NULL COMMENT '权限代码',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='角色授权';

-- ----------------------------
-- Records of uk_role_auth
-- ----------------------------
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1e390006', '坐席对话', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc4a491053e', 'A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1e590007', '全部联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cc4ffb1053f', 'A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1e720008', '联系人', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc78f570548', 'A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1e8b0009', '全部联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cc817fb0549', 'A02_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1ea5000a', '客户分类', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc87273054a', 'A02_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1eba000b', '全部联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '4028cba3613c9d2d01613cb0dbf8062d', 'A02_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1ed3000c', '今日新增', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cb15cce062e', 'A02_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1ee8000d', '本周新增', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cb204df062f', 'A02_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f00000e', '我的联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '4028cba3613c9d2d01613cb2b5f70630', 'A02_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f1d000f', '新建联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '4028cba3613c9d2d01613cb33d5b0631', 'A02_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f360010', '编辑联系人信息', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '4028cba3613c9d2d01613cc2909b0665', 'A02_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f4d0011', '删除联系人', null, '2021-12-04 17:02:23',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '4028cba3613c9d2d01613cc36c5b0666', 'A02_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f630012', '导入', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cc3ffd00667', 'A02_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f7a0013', '导出', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cc443a70668', 'A02_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1f940014', '全部客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc529b20540', 'A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1fbc0015', '全部客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc94072054b', 'A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1fd60016', '全部客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc998f7054c', 'A03_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae1ff20017', '客户分类', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cca221d054d', 'A03_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20070018', '全部客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613ccdc17f067c', 'A03_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20220019', '今日新增', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cce1c4e067d', 'A03_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae203a001a', '本周新增', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cce686b067e', 'A03_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae205b001b', '企业客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613ccec9a6067f', 'A03_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2072001c', '个人客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613ccf1eb00680', 'A03_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2089001d', '新建客户', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613ccf70960681', 'A03_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20a0001e', '编辑', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613ccfca880682', 'A03_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20b6001f', '删除', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cd01d250683', 'A03_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20cd0020', '导入', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cd06df20684', 'A03_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20e40021', '导出', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028cba3613c9d2d01613cd0b9780685', 'A03_A01_A02_B010');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae20fa0022', '工单管理', null, '2021-12-04 17:02:23', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc551ac0541', 'A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21150023', '工单概况', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cca88e2054e', 'A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21310024', '创建新工单', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '8a2a71896150d606016150f9ff0c053e', 'A04_A01_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae214d0025', '我的工单总数', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '8a2a718961697de101616a5b5ad106f2', 'A04_A01_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21640026', '我的待办工单总数', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '8a2a718961697de101616a5bb80906f6', 'A04_A01_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae217a0027', '工单总数', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', 'ff808081613ba48901613bb32ac404e6', 'A04_A01_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21920028', '未关闭工单总数', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        'ff808081613ba48901613bb42bbf04e7', 'A04_A01_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21ad0029', '工单管理', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ccabee3054f', 'A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21c9002a', '我的工单', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ccf1f4f0555', 'A04_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21e0002b', '待处理工单', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ccf7e580556', 'A04_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae21f7002c', '未分配工单', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ccfce4c0557', 'A04_A02_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae220e002d', '关注的工单', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cd018910558', 'A04_A02_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2227002e', '已关闭工单', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cd067780559', 'A04_A02_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae223f002f', '工单分类', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '8a2a71896168dbb40161690ff8520563', 'A04_A02_A06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22550030', '业务流程', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc580cc0542', 'A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae226e0031', '业务流程', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd1a2ce055a', 'A05_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22870032', '流程管理', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd1fac4055b', 'A05_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae229d0033', '已发布流程', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cd22c2c055c', 'A05_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22b20034', '流程实例', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd267fd055d', 'A05_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22c90035', '工单分类', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd2a031055e', 'A05_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22e30036', '客服设置', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc5a2040543', 'A06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae22fc0037', '客服设置', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd4c271055f', 'A06_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae231b0038', '对话设置', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd5a74f0562', 'A06_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae23310039', '黑名单', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd5db850563', 'A06_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2348003a', '广告位管理', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cd4fd8c0560', 'A06_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2362003b', '标签管理', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cd541ff0561', 'A06_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae237a003c', '会话历史', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc5d9710545', 'A08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2392003d', '会话信息', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cdc778c056d', 'A08_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae23aa003e', '历史会话', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cddc0920571', 'A08_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae23c1003f', '当前会话', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cde068c0572', 'A08_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae23d90040', '排队队列', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cde3ca40573', 'A08_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae23f00041', '访客留言', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cdeb60b0574', 'A08_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24070042', '满意度评价', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612cdf24e10575', 'A08_A01_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae241d0043', '统计功能', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cdca922056e', 'A08_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24380044', '满意度统计', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ce748b20577', 'A08_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24630045', '客服坐席', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ce774fe0579', 'A08_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae247f0046', '服务小结', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cdce2a4056f', 'A08_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24960047', '多媒体客服', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ce7ca6a057a', 'A08_A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24ac0048', '已处理多媒体客服', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ce7fb2d057b', 'A08_A03_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24c50049', '呼叫中心', null, '2021-12-04 17:02:24', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ce85460057c', 'A08_A03_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24dd004a', '已处理呼叫中心', null, '2021-12-04 17:02:24',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402881ef612b1f5b01612ce88154057d', 'A08_A03_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae24f4004b', '坐席信息', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cdd1e930570', 'A08_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae250b004c', '在线坐席', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ce8b990057e', 'A08_A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2520004d', '全部坐席', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ce8e6a2057f', 'A08_A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2536004e', '语音渠道', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cc626f90547', 'A10');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae254d004f', '通话信息', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cee4fbb058a', 'A10_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae25660050', '历史通话', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ceeca0c058c', 'A10_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae25840051', '当前通话', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ceef6c4058d', 'A10_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae259a0052', '排队队列', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cef4503058e', 'A10_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae25b20053', '录音管理', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cef8453058f', 'A10_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae25c90054', '语音留言', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cefb4120590', 'A10_A01_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae25e10055', '漏话列表', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612ceffa060591', 'A10_A01_A06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26000056', '坐席信息', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cee80ed058b', 'A10_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae261a0057', '在线坐席', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cf03d740592', 'A10_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26320058', '全部坐席', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cf065f40593', 'A10_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26480059', '系统管理', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402881ef612b1f5b01612cf147810595', 'B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2664005a', '用户账号', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '2c9580866e7993b3016e832ce1e71309', 'B02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae267d005b', '系统角色', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '2c9580866e7993b3016e832d13f6130f', 'B02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2693005c', '组织机构', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '2c9580866e7993b3016e832d8bc61315', 'B02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26ac005d', '网站列表', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '2c9580866e7993b3016e832de05c131c', 'B02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26c7005e', '会话监控 ', null, '2021-12-04 17:02:25',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402882516dce9b82016dcedd5abc009c', 'A13_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26de005f', '浏览会话', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402882516dce9b82016dcede487700a3', 'A13_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae26f50060', '转接会话', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402882516dce9b82016dcedea4b900a7', 'A13_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae270d0061', '发送消息', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402882516dce9b82016dcedf1cbd00ab', 'A13_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27240062', '外呼系统', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '4028888163ffe467016400f640f30646', 'A11');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae273b0063', '资源管理', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f911016401056d340533', 'A11_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27520064', '坐席监控', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '40288273656b534a01656b6de4bb056b', 'A11_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae276a0065', '拨号计划', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f911016401185cbb057d', 'A11_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae278e0066', '已删除任务', null, '2021-12-04 17:02:25',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f216fda000e',
        '402888816400f9110164013ab7170601', 'A11_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27a40067', '任务列表', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f9110164013ab717060e', 'A11_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27c20068', '数据查询', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f91101640118c86d0581', 'A11_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27dd0069', '坐席报表', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f9110164013c5a060615', 'A11_A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae27f7006a', '外呼日报', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f9110164013ca2e8061a', 'A11_A03_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2810006b', '录音记录', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f9110164013e9b4e062a', 'A11_A03_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2828006c', '通话记录', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '402888816400f9110164013efaca062f', 'A11_A03_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae2841006d', '企业聊天', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', 'ff8080816de316aa016de31d0e130016', 'A14');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae285f006e', '创建群组', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', 'ff8080816de316aa016de3201ffb001c', 'A14_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae287f006f', '全部坐席', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '40288881640eba2a01640f8599db07ec', 'A12_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84ae28930070', '坐席状态', null, '2021-12-04 17:02:25', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f216fda000e', '40288881640eba2a01640f85f8af07f0', 'A12_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedb19007b', '坐席对话', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc4a491053e', 'A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedb3b007c', '全部联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cc4ffb1053f', 'A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedb63007d', '联系人', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc78f570548', 'A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedb79007e', '全部联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cc817fb0549', 'A02_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedb92007f', '客户分类', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc87273054a', 'A02_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedbb40080', '全部联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '4028cba3613c9d2d01613cb0dbf8062d', 'A02_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedbcb0081', '今日新增', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cb15cce062e', 'A02_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedbe20082', '本周新增', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cb204df062f', 'A02_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedbf90083', '我的联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '4028cba3613c9d2d01613cb2b5f70630', 'A02_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc0f0084', '新建联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '4028cba3613c9d2d01613cb33d5b0631', 'A02_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc250085', '编辑联系人信息', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '4028cba3613c9d2d01613cc2909b0665', 'A02_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc3c0086', '删除联系人', null, '2021-12-04 17:03:11',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '4028cba3613c9d2d01613cc36c5b0666', 'A02_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc550087', '导入', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cc3ffd00667', 'A02_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc720088', '导出', null, '2021-12-04 17:03:11', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cc443a70668', 'A02_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc870089', '全部客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc529b20540', 'A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedc9f008a', '全部客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc94072054b', 'A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedcb8008b', '全部客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc998f7054c', 'A03_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedcd2008c', '客户分类', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cca221d054d', 'A03_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedcf5008d', '全部客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613ccdc17f067c', 'A03_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd10008e', '今日新增', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cce1c4e067d', 'A03_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd29008f', '本周新增', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cce686b067e', 'A03_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd410090', '企业客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613ccec9a6067f', 'A03_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd580091', '个人客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613ccf1eb00680', 'A03_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd710092', '新建客户', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613ccf70960681', 'A03_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedd890093', '编辑', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613ccfca880682', 'A03_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedda60094', '删除', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cd01d250683', 'A03_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aeddc00095', '导入', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cd06df20684', 'A03_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedddd0096', '导出', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '4028cba3613c9d2d01613cd0b9780685', 'A03_A01_A02_B010');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aeddf70097', '工单管理', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc551ac0541', 'A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede100098', '工单概况', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cca88e2054e', 'A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede290099', '创建新工单', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '8a2a71896150d606016150f9ff0c053e', 'A04_A01_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede42009a', '我的工单总数', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '8a2a718961697de101616a5b5ad106f2', 'A04_A01_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede5a009b', '我的待办工单总数', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '8a2a718961697de101616a5bb80906f6', 'A04_A01_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede71009c', '工单总数', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', 'ff808081613ba48901613bb32ac404e6', 'A04_A01_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aede89009d', '未关闭工单总数', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        'ff808081613ba48901613bb42bbf04e7', 'A04_A01_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedea5009e', '工单管理', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ccabee3054f', 'A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedebe009f', '我的工单', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ccf1f4f0555', 'A04_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aeded500a0', '待处理工单', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ccf7e580556', 'A04_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedeef00a1', '未分配工单', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ccfce4c0557', 'A04_A02_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf0c00a2', '关注的工单', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cd018910558', 'A04_A02_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf2400a3', '已关闭工单', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cd067780559', 'A04_A02_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf3d00a4', '工单分类', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '8a2a71896168dbb40161690ff8520563', 'A04_A02_A06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf5600a5', '业务流程', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc580cc0542', 'A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf7000a6', '业务流程', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd1a2ce055a', 'A05_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedf8c00a7', '流程管理', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd1fac4055b', 'A05_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedfa500a8', '已发布流程', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cd22c2c055c', 'A05_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedfbf00a9', '流程实例', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd267fd055d', 'A05_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedfd500aa', '工单分类', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd2a031055e', 'A05_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aedff100ab', '客服设置', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc5a2040543', 'A06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee00c00ac', '客服设置', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd4c271055f', 'A06_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee02900ad', '对话设置', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd5a74f0562', 'A06_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee04100ae', '黑名单', null, '2021-12-04 17:03:12', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd5db850563', 'A06_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee05d00af', '广告位管理', null, '2021-12-04 17:03:12',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cd4fd8c0560', 'A06_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee07400b0', '标签管理', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cd541ff0561', 'A06_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee08e00b1', '会话历史', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cc5d9710545', 'A08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee0a700b2', '会话信息', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cdc778c056d', 'A08_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee0c000b3', '历史会话', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cddc0920571', 'A08_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee0d700b4', '当前会话', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cde068c0572', 'A08_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee0ef00b5', '排队队列', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cde3ca40573', 'A08_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee10700b6', '访客留言', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cdeb60b0574', 'A08_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee12200b7', '满意度评价', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612cdf24e10575', 'A08_A01_A05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee13d00b8', '统计功能', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cdca922056e', 'A08_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee15900b9', '满意度统计', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ce748b20577', 'A08_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee16f00ba', '客服坐席', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ce774fe0579', 'A08_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee18700bb', '服务小结', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cdce2a4056f', 'A08_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee19e00bc', '多媒体客服', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ce7ca6a057a', 'A08_A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee1b600bd', '已处理多媒体客服', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ce7fb2d057b', 'A08_A03_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee1cc00be', '呼叫中心', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ce85460057c', 'A08_A03_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee1e500bf', '已处理呼叫中心', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402881ef612b1f5b01612ce88154057d', 'A08_A03_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee20300c0', '坐席信息', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612cdd1e930570', 'A08_A04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee21b00c1', '在线坐席', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ce8b990057e', 'A08_A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee23200c2', '全部坐席', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402881ef612b1f5b01612ce8e6a2057f', 'A08_A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee24a00c3', '会话监控 ', null, '2021-12-04 17:03:13',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f21cd360012',
        '402882516dce9b82016dcedd5abc009c', 'A13_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee26100c4', '浏览会话', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402882516dce9b82016dcede487700a3', 'A13_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee27900c5', '转接会话', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402882516dce9b82016dcedea4b900a7', 'A13_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee29000c6', '发送消息', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '402882516dce9b82016dcedf1cbd00ab', 'A13_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee2a700c7', '企业聊天', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', 'ff8080816de316aa016de31d0e130016', 'A14');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee2c000c8', '创建群组', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', 'ff8080816de316aa016de3201ffb001c', 'A14_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee2d700c9', '全部坐席', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '40288881640eba2a01640f8599db07ec', 'A12_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84aee2f100ca', '坐席状态', null, '2021-12-04 17:03:13', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f21cd360012', '40288881640eba2a01640f85f8af07f0', 'A12_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af44d900cf', '坐席对话', null, '2021-12-04 17:03:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc4a491053e', 'A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af44f200d0', '全部联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '402881ef612b1f5b01612cc4ffb1053f', 'A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af450a00d1', '联系人', null, '2021-12-04 17:03:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc78f570548', 'A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af452600d2', '全部联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '402881ef612b1f5b01612cc817fb0549', 'A02_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af453f00d3', '客户分类', null, '2021-12-04 17:03:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc87273054a', 'A02_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af455600d4', '全部联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '4028cba3613c9d2d01613cb0dbf8062d', 'A02_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af457200d5', '今日新增', null, '2021-12-04 17:03:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cb15cce062e', 'A02_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af458a00d6', '本周新增', null, '2021-12-04 17:03:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cb204df062f', 'A02_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af45a200d7', '我的联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '4028cba3613c9d2d01613cb2b5f70630', 'A02_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af45b800d8', '新建联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '4028cba3613c9d2d01613cb33d5b0631', 'A02_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af45d200d9', '编辑联系人信息', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '4028cba3613c9d2d01613cc2909b0665', 'A02_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af45eb00da', '删除联系人', null, '2021-12-04 17:03:38',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817d7f1444017d7f2211c60016',
        '4028cba3613c9d2d01613cc36c5b0666', 'A02_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af460500db', '导入', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cc3ffd00667', 'A02_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af461e00dc', '导出', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cc443a70668', 'A02_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af463500dd', '全部客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc529b20540', 'A03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af464c00de', '全部客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc94072054b', 'A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af466600df', '全部客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cc998f7054c', 'A03_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af467d00e0', '客户分类', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '402881ef612b1f5b01612cca221d054d', 'A03_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af469600e1', '全部客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613ccdc17f067c', 'A03_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af46b800e2', '今日新增', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cce1c4e067d', 'A03_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af46cf00e3', '本周新增', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cce686b067e', 'A03_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af46e500e4', '企业客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613ccec9a6067f', 'A03_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af46fe00e5', '个人客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613ccf1eb00680', 'A03_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af471b00e6', '新建客户', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613ccf70960681', 'A03_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af473200e7', '编辑', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613ccfca880682', 'A03_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af474a00e8', '删除', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cd01d250683', 'A03_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af476500e9', '导入', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cd06df20684', 'A03_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af477d00ea', '导出', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '4028cba3613c9d2d01613cd0b9780685', 'A03_A01_A02_B010');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af479500eb', '企业聊天', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', 'ff8080816de316aa016de31d0e130016', 'A14');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af47b000ec', '创建群组', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', 'ff8080816de316aa016de3201ffb001c', 'A14_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af47cc00ed', '全部坐席', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '40288881640eba2a01640f8599db07ec', 'A12_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('402882977d84ad49017d84af47e400ee', '坐席状态', null, '2021-12-04 17:03:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817d7f1444017d7f2211c60016', '40288881640eba2a01640f85f8af07f0', 'A12_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfab9470008', '坐席对话', null, '2021-12-03 00:29:28', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc4a491053e', 'A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfab9f70009', '全部联系人', null, '2021-12-03 00:29:28',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cc4ffb1053f', 'A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabaac000a', '联系人', null, '2021-12-03 00:29:29', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc78f570548', 'A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabb59000b', '全部联系人', null, '2021-12-03 00:29:29',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cc817fb0549', 'A02_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabc00000c', '客户分类', null, '2021-12-03 00:29:29', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc87273054a', 'A02_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabca6000d', '全部联系人', null, '2021-12-03 00:29:29',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '4028cba3613c9d2d01613cb0dbf8062d', 'A02_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabd4b000e', '今日新增', null, '2021-12-03 00:29:29', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cb15cce062e', 'A02_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabdf1000f', '本周新增', null, '2021-12-03 00:29:29', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cb204df062f', 'A02_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabe980010', '我的联系人', null, '2021-12-03 00:29:30',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '4028cba3613c9d2d01613cb2b5f70630', 'A02_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabf3f0011', '新建联系人', null, '2021-12-03 00:29:30',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '4028cba3613c9d2d01613cb33d5b0631', 'A02_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfabfe90012', '编辑联系人信息', null, '2021-12-03 00:29:30',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '4028cba3613c9d2d01613cc2909b0665', 'A02_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac08f0013', '删除联系人', null, '2021-12-03 00:29:30',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '4028cba3613c9d2d01613cc36c5b0666', 'A02_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac1360014', '导入', null, '2021-12-03 00:29:30', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cc3ffd00667', 'A02_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac1db0015', '导出', null, '2021-12-03 00:29:30', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cc443a70668', 'A02_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac2820016', '全部客户', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc529b20540', 'A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac32a0017', '全部客户', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc94072054b', 'A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac3d00018', '全部客户', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc998f7054c', 'A03_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac47d0019', '客户分类', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cca221d054d', 'A03_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac526001a', '全部客户', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613ccdc17f067c', 'A03_A01_A02_B01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac5ce001b', '今日新增', null, '2021-12-03 00:29:31', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cce1c4e067d', 'A03_A01_A02_B02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac673001c', '本周新增', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cce686b067e', 'A03_A01_A02_B03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac718001d', '企业客户', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613ccec9a6067f', 'A03_A01_A02_B04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac7be001e', '个人客户', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613ccf1eb00680', 'A03_A01_A02_B05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac864001f', '新建客户', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613ccf70960681', 'A03_A01_A02_B06');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac9080020', '编辑', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613ccfca880682', 'A03_A01_A02_B07');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfac9ae0021', '删除', null, '2021-12-03 00:29:32', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cd01d250683', 'A03_A01_A02_B08');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaca630022', '导入', null, '2021-12-03 00:29:33', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cd06df20684', 'A03_A01_A02_B09');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacb290023', '导出', null, '2021-12-03 00:29:33', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028cba3613c9d2d01613cd0b9780685', 'A03_A01_A02_B010');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacbce0024', '工单管理', null, '2021-12-03 00:29:33', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc551ac0541', 'A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacc780025', '工单概况', null, '2021-12-03 00:29:33', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cca88e2054e', 'A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacd250026', '创建新工单', null, '2021-12-03 00:29:33',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '8a2a71896150d606016150f9ff0c053e', 'A04_A01_B01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacdc90027', '我的工单总数', null, '2021-12-03 00:29:33',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '8a2a718961697de101616a5b5ad106f2', 'A04_A01_B04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bface710028', '我的待办工单总数', null, '2021-12-03 00:29:34',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '8a2a718961697de101616a5bb80906f6', 'A04_A01_B05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacf150029', '工单总数', null, '2021-12-03 00:29:34', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', 'ff808081613ba48901613bb32ac404e6', 'A04_A01_B02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfacfba002a', '未关闭工单总数', null, '2021-12-03 00:29:34',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        'ff808081613ba48901613bb42bbf04e7', 'A04_A01_B03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad05e002b', '工单管理', null, '2021-12-03 00:29:34', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ccabee3054f', 'A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad106002c', '我的工单', null, '2021-12-03 00:29:34', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ccf1f4f0555', 'A04_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad1bb002d', '待处理工单', null, '2021-12-03 00:29:34',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ccf7e580556', 'A04_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad26a002e', '未分配工单', null, '2021-12-03 00:29:35',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ccfce4c0557', 'A04_A02_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad32a002f', '关注的工单', null, '2021-12-03 00:29:35',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cd018910558', 'A04_A02_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad3d50030', '已关闭工单', null, '2021-12-03 00:29:35',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cd067780559', 'A04_A02_A05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad47f0031', '工单分类', null, '2021-12-03 00:29:35', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '8a2a71896168dbb40161690ff8520563', 'A04_A02_A06');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad5250032', '业务流程', null, '2021-12-03 00:29:35', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc580cc0542', 'A05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad5cd0033', '业务流程', null, '2021-12-03 00:29:36', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd1a2ce055a', 'A05_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad6710035', '流程管理', null, '2021-12-03 00:29:36', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd1fac4055b', 'A05_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad71a0036', '已发布流程', null, '2021-12-03 00:29:36',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cd22c2c055c', 'A05_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad7c10037', '流程实例', null, '2021-12-03 00:29:36', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd267fd055d', 'A05_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad86b0038', '工单分类', null, '2021-12-03 00:29:36', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd2a031055e', 'A05_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad9110039', '客服设置', null, '2021-12-03 00:29:36', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc5a2040543', 'A06');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfad9b7003a', '客服设置', null, '2021-12-03 00:29:37', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd4c271055f', 'A06_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfada5f003b', '对话设置', null, '2021-12-03 00:29:37', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd5a74f0562', 'A06_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadb02003c', '黑名单', null, '2021-12-03 00:29:37', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd5db850563', 'A06_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadba7003d', '广告位管理', null, '2021-12-03 00:29:37',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cd4fd8c0560', 'A06_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadc4b003e', '标签管理', null, '2021-12-03 00:29:37', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cd541ff0561', 'A06_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadcf0003f', '快捷回复', null, '2021-12-03 00:29:37', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc5bd810544', 'A07');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadd950040', '会话历史', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc5d9710545', 'A08');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfade3c0041', '会话信息', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cdc778c056d', 'A08_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadee10042', '历史会话', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cddc0920571', 'A08_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfadf880043', '当前会话', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cde068c0572', 'A08_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae02e0044', '排队队列', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cde3ca40573', 'A08_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae0d60045', '访客留言', null, '2021-12-03 00:29:38', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cdeb60b0574', 'A08_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae17d0046', '满意度评价', null, '2021-12-03 00:29:39',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cdf24e10575', 'A08_A01_A05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae2230047', '统计功能', null, '2021-12-03 00:29:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cdca922056e', 'A08_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae2ca0048', '满意度统计', null, '2021-12-03 00:29:39',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ce748b20577', 'A08_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae3700049', '客服坐席', null, '2021-12-03 00:29:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ce774fe0579', 'A08_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae417004a', '服务小结', null, '2021-12-03 00:29:39', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cdce2a4056f', 'A08_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae4c2004b', '多媒体客服', null, '2021-12-03 00:29:39',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ce7ca6a057a', 'A08_A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae568004c', '已处理多媒体客服', null, '2021-12-03 00:29:40',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ce7fb2d057b', 'A08_A03_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae60c004d', '呼叫中心', null, '2021-12-03 00:29:40', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ce85460057c', 'A08_A03_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae6b1004e', '已处理呼叫中心', null, '2021-12-03 00:29:40',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612ce88154057d', 'A08_A03_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae758004f', '坐席信息', null, '2021-12-03 00:29:40', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cdd1e930570', 'A08_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae7fe0050', '在线坐席', null, '2021-12-03 00:29:40', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ce8b990057e', 'A08_A04_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae8a50051', '全部坐席', null, '2021-12-03 00:29:40', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ce8e6a2057f', 'A08_A04_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae94b0052', '智能机器人', null, '2021-12-03 00:29:41',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402881ef612b1f5b01612cc602450546', 'A09');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfae9f30053', '语音渠道', null, '2021-12-03 00:29:41', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cc626f90547', 'A10');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaea9a0054', '通话信息', null, '2021-12-03 00:29:41', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cee4fbb058a', 'A10_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaeb400055', '历史通话', null, '2021-12-03 00:29:41', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ceeca0c058c', 'A10_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaebe80056', '当前通话', null, '2021-12-03 00:29:41', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ceef6c4058d', 'A10_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaec8e0057', '排队队列', null, '2021-12-03 00:29:41', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cef4503058e', 'A10_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaed350058', '录音管理', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cef8453058f', 'A10_A01_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaeddb0059', '语音留言', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cefb4120590', 'A10_A01_A05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaee82005a', '漏话列表', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612ceffa060591', 'A10_A01_A06');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaef2a005b', '坐席信息', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cee80ed058b', 'A10_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaefd4005c', '在线坐席', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cf03d740592', 'A10_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf07e005d', '全部坐席', null, '2021-12-03 00:29:42', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cf065f40593', 'A10_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf125005e', '系统管理', null, '2021-12-03 00:29:43', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402881ef612b1f5b01612cf147810595', 'B02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf1cc005f', '用户账号', null, '2021-12-03 00:29:43', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '2c9580866e7993b3016e832ce1e71309', 'B02_B01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf2730060', '系统角色', null, '2021-12-03 00:29:43', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '2c9580866e7993b3016e832d13f6130f', 'B02_B02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf3190061', '组织机构', null, '2021-12-03 00:29:43', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '2c9580866e7993b3016e832d8bc61315', 'B02_B03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf3c00062', '网站列表', null, '2021-12-03 00:29:43', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '2c9580866e7993b3016e832de05c131c', 'B02_B04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf4650063', '会话监控 ', null, '2021-12-03 00:29:43',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402882516dce9b82016dcedd5abc009c', 'A13_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf50a0064', '浏览会话', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402882516dce9b82016dcede487700a3', 'A13_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf5b20065', '转接会话', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402882516dce9b82016dcedea4b900a7', 'A13_A01_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf65a0066', '发送消息', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402882516dce9b82016dcedf1cbd00ab', 'A13_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf7000067', '外呼系统', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '4028888163ffe467016400f640f30646', 'A11');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf7a50068', '资源管理', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f911016401056d340533', 'A11_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf84d0069', '坐席监控', null, '2021-12-03 00:29:44', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '40288273656b534a01656b6de4bb056b', 'A11_A01_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf8f2006a', '拨号计划', null, '2021-12-03 00:29:45', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f911016401185cbb057d', 'A11_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaf99a006b', '已删除任务', null, '2021-12-03 00:29:45',
        '4028cac3614cd2f901614cf8be1f0324', null, null, 'ff8080817627b71201762836017c0035',
        '402888816400f9110164013ab7170601', 'A11_A02_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafa3e006c', '任务列表', null, '2021-12-03 00:29:45', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f9110164013ab717060e', 'A11_A02_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafae4006d', '数据查询', null, '2021-12-03 00:29:45', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f91101640118c86d0581', 'A11_A03');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafb8c006e', '坐席报表', null, '2021-12-03 00:29:45', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f9110164013c5a060615', 'A11_A03_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafc33006f', '外呼日报', null, '2021-12-03 00:29:45', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f9110164013ca2e8061a', 'A11_A03_A02');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafcd90070', '录音记录', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f9110164013e9b4e062a', 'A11_A03_A04');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafd810071', '通话记录', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '402888816400f9110164013efaca062f', 'A11_A03_A05');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafe2b0072', '企业聊天', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', 'ff8080816de316aa016de31d0e130016', 'A14');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfafed10073', '创建群组', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', 'ff8080816de316aa016de3201ffb001c', 'A14_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfaff770074', '全部坐席', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '40288881640eba2a01640f8599db07ec', 'A12_A01_A01');
INSERT INTO `uk_role_auth`
VALUES ('ff8080817d7bf76e017d7bfb001e0075', '坐席状态', null, '2021-12-03 00:29:46', '4028cac3614cd2f901614cf8be1f0324',
        null, null, 'ff8080817627b71201762836017c0035', '40288881640eba2a01640f85f8af07f0', 'A12_A02');

-- ----------------------------
-- Table structure for uk_sales_product
-- ----------------------------
DROP TABLE IF EXISTS `uk_sales_product`;
CREATE TABLE `uk_sales_product`
(
    `id`         varchar(32) NOT NULL COMMENT '数据ID',
    `title`      varchar(255) DEFAULT NULL COMMENT '标题',
    `content`    text COMMENT '内容',
    `keyword`    varchar(100) DEFAULT NULL COMMENT '关键词',
    `summary`    varchar(255) DEFAULT NULL COMMENT '摘要',
    `status`     varchar(32)  DEFAULT NULL COMMENT '状态',
    `tptype`     varchar(32)  DEFAULT NULL COMMENT '类型',
    `cate`       varchar(32)  DEFAULT NULL COMMENT '产品分类',
    `username`   varchar(32)  DEFAULT NULL COMMENT '创建人姓名',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `memo`       varchar(32)  DEFAULT NULL COMMENT '备注',
    `price`      int(11)      DEFAULT NULL COMMENT '价格',
    `organ`      varchar(32)  DEFAULT NULL COMMENT '部门',
    `termtype`   varchar(32)  DEFAULT '0' COMMENT '有效期类型（1永久有效，0有效期）',
    `begintime`  datetime     DEFAULT NULL COMMENT '有效期开始时间',
    `endtime`    datetime     DEFAULT NULL COMMENT '有效期结束时间',
    `parentid`   varchar(32)  DEFAULT NULL COMMENT '上级ID',
    `quota`      int(11)      DEFAULT '0' COMMENT '配额',
    `provoice`   varchar(255) DEFAULT NULL COMMENT '语音介绍',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电销产品';

-- ----------------------------
-- Records of uk_sales_product
-- ----------------------------

-- ----------------------------
-- Table structure for uk_sales_status
-- ----------------------------
DROP TABLE IF EXISTS `uk_sales_status`;
CREATE TABLE `uk_sales_status`
(
    `id`         varchar(32) NOT NULL COMMENT '数据ID',
    `name`       varchar(255) DEFAULT NULL COMMENT '状态名',
    `code`       varchar(255) DEFAULT NULL COMMENT '状态代码',
    `cate`       varchar(32)  DEFAULT NULL COMMENT '状态分类ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `updatetime` datetime     DEFAULT NULL COMMENT '更新时间',
    `memo`       varchar(32)  DEFAULT NULL COMMENT '备注',
    `activityid` varchar(32)  DEFAULT NULL COMMENT '活动ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='电销状态';

-- ----------------------------
-- Records of uk_sales_status
-- ----------------------------

-- ----------------------------
-- Table structure for uk_secret
-- ----------------------------
DROP TABLE IF EXISTS `uk_secret`;
CREATE TABLE `uk_secret`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime` varchar(32)  DEFAULT NULL COMMENT '创建时间',
    `password`   varchar(100) DEFAULT NULL COMMENT '二次密码',
    `model`      varchar(32)  DEFAULT NULL COMMENT '所属组件',
    `enable`     tinyint(4)   DEFAULT NULL COMMENT '是否启用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='二次验证信息表';

-- ----------------------------
-- Records of uk_secret
-- ----------------------------

-- ----------------------------
-- Table structure for uk_servicesummary
-- ----------------------------
DROP TABLE IF EXISTS `uk_servicesummary`;
CREATE TABLE `uk_servicesummary`
(
    `id`             varchar(32) NOT NULL COMMENT '主键ID',
    `agentusername`  varchar(100) DEFAULT NULL COMMENT '坐席用户名',
    `agentno`        varchar(32)  DEFAULT NULL COMMENT '坐席ID',
    `status`         varchar(32)  DEFAULT NULL COMMENT '状态',
    `times`          int(11)      DEFAULT NULL COMMENT '服务次数',
    `servicetime`    datetime     DEFAULT NULL COMMENT '服务时间',
    `username`       varchar(100) DEFAULT NULL COMMENT '用户名',
    `userid`         varchar(32)  DEFAULT NULL COMMENT '用户ID',
    `channel`        varchar(32)  DEFAULT NULL COMMENT '渠道',
    `logindate`      datetime     DEFAULT NULL COMMENT '登录时间',
    `servicetype`    text COMMENT '服务类型',
    `reservation`    tinyint(4)   DEFAULT NULL COMMENT '是否预约',
    `reservtype`     varchar(32)  DEFAULT NULL COMMENT '预约方式',
    `reservtime`     datetime     DEFAULT NULL,
    `email`          varchar(100) DEFAULT NULL COMMENT '电子邮件',
    `phonenumber`    varchar(32)  DEFAULT NULL COMMENT '电话号码',
    `summary`        text COMMENT '服务记录',
    `agentserviceid` varchar(32)  DEFAULT NULL COMMENT '服务ID',
    `creater`        varchar(32)  DEFAULT NULL COMMENT '创建人',
    `createtime`     datetime     DEFAULT NULL COMMENT '创建时间',
    `statuseventid`  varchar(50)  DEFAULT NULL COMMENT '电话记录ID',
    `contactsid`     varchar(50)  DEFAULT NULL COMMENT '联系人ID',
    `ani`            varchar(50)  DEFAULT NULL COMMENT '主叫',
    `caller`         varchar(50)  DEFAULT NULL COMMENT '呼叫发起号码',
    `called`         varchar(50)  DEFAULT NULL COMMENT '被叫',
    `agent`          varchar(50)  DEFAULT NULL COMMENT '分机号',
    `process`        tinyint(4)   DEFAULT NULL,
    `updateuser`     varchar(32)  DEFAULT NULL,
    `updatetime`     datetime     DEFAULT NULL,
    `processmemo`    text,
    `skill`          varchar(32)  DEFAULT NULL COMMENT '技能组',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='服务小结';

-- ----------------------------
-- Records of uk_servicesummary
-- ----------------------------

-- ----------------------------
-- Table structure for uk_sessionconfig
-- ----------------------------
DROP TABLE IF EXISTS `uk_sessionconfig`;
CREATE TABLE `uk_sessionconfig`
(
    `id`                  varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `creater`             varchar(32)          DEFAULT NULL COMMENT '创建人',
    `username`            varchar(32)          DEFAULT NULL COMMENT '用户名',
    `name`                varchar(32)          DEFAULT NULL COMMENT '名称',
    `sessionmsg`          varchar(255)         DEFAULT NULL COMMENT '会话消息',
    `distribution`        varchar(32)          DEFAULT NULL COMMENT '坐席分配策略',
    `timeoutmsg`          varchar(255)         DEFAULT NULL COMMENT '超时提醒消息',
    `retimeoutmsg`        varchar(255)         DEFAULT NULL COMMENT '再次超时提醒消息',
    `satisfaction`        tinyint(4)           DEFAULT NULL COMMENT '启用满意度调查',
    `createtime`          datetime             DEFAULT NULL COMMENT '创建时间',
    `lastagent`           tinyint(4)           DEFAULT NULL COMMENT '最后服务坐席优先分配',
    `sessiontimeout`      tinyint(4)           DEFAULT NULL COMMENT '会话超时时间',
    `resessiontimeout`    tinyint(4)           DEFAULT NULL COMMENT '再次超时时间',
    `timeout`             int(11)              DEFAULT NULL COMMENT '超时时长',
    `retimeout`           int(11)              DEFAULT NULL COMMENT '再次超时时长',
    `agenttimeout`        int(11)              DEFAULT NULL COMMENT '坐席回复超时时长',
    `agentreplaytimeout`  tinyint(4)           DEFAULT NULL COMMENT '坐席回复超时时长',
    `agenttimeoutmsg`     varchar(255)         DEFAULT NULL COMMENT '超时回复消息',
    `maxuser`             int(11)              DEFAULT NULL COMMENT '最大用户数',
    `initmaxuser`         int(11)              DEFAULT NULL COMMENT '首次就绪分配用户数',
    `workinghours`        text COMMENT '工作时间段',
    `notinwhmsg`          text COMMENT '非工作时间提醒消息',
    `hourcheck`           tinyint(4)           DEFAULT NULL COMMENT '启用工作时间',
    `noagentmsg`          varchar(255)         DEFAULT NULL COMMENT '无坐席消息提醒',
    `agentbusymsg`        varchar(255)         DEFAULT NULL COMMENT '坐席忙提醒',
    `successmsg`          varchar(255)         DEFAULT NULL COMMENT '分配成功提醒',
    `finessmsg`           varchar(255)         DEFAULT NULL COMMENT '结束会话提示消息',
    `quality`             tinyint(4)           DEFAULT '0' COMMENT '质检',
    `qualityscore`        varchar(20)          DEFAULT NULL COMMENT '质检评分',
    `servicetimeoutlimit` tinyint(4)           DEFAULT '0' COMMENT '服务超时提醒',
    `servicetimeout`      int(11)              DEFAULT '0' COMMENT '服务超时提醒消息',
    `servicetimeoutmsg`   varchar(50)          DEFAULT '0' COMMENT '服务超时时间',
    `quenetimeout`        int(11)              DEFAULT '600' COMMENT '允许访客排队的最大时长',
    `quenetimeoutmsg`     varchar(255)         DEFAULT NULL COMMENT '访客排队超市提示消息',
    `quene`               tinyint(4)           DEFAULT '0' COMMENT '坐席姓名',
    `servicename`         varchar(50)          DEFAULT NULL COMMENT '无坐席的时候回复昵称',
    `agentautoleave`      tinyint(4)           DEFAULT '0' COMMENT '关闭浏览器自动离线',
    `otherquickplay`      tinyint(4)           DEFAULT '0' COMMENT '启用外部快捷回复功能',
    `oqrsearchurl`        varchar(255)         DEFAULT NULL COMMENT '外部快捷回复搜索地址',
    `oqrsearchinput`      varchar(32)          DEFAULT NULL COMMENT '外部快捷回复搜索输入参数',
    `oqrsearchoutput`     varchar(32)          DEFAULT NULL COMMENT '外部快捷回复搜索输出参数',
    `oqrdetailurl`        varchar(255)         DEFAULT NULL COMMENT '外部快捷回复内容URL',
    `oqrdetailinput`      varchar(32)          DEFAULT NULL COMMENT '外部快捷回复详情输入参数',
    `oqrdetailoutput`     varchar(32)          DEFAULT NULL COMMENT '外部快捷回复详情输出参数',
    `agentctrlenter`      tinyint(4)           DEFAULT '0' COMMENT '启用坐席端CTRL+Enter发送消息',
    `ctrlenter`           tinyint(4)           DEFAULT '0' COMMENT '启用访客端CTRL+Enter发送消息',
    `enablequick`         tinyint(32)          DEFAULT '0' COMMENT '启用快捷回复功能',
    `otherssl`            tinyint(4)           DEFAULT '0' COMMENT '外部知识库启用SSL',
    `skill`               varchar(32)          DEFAULT NULL COMMENT '组织机构ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='会话设置';

-- ----------------------------
-- Records of uk_sessionconfig
-- ----------------------------

-- ----------------------------
-- Table structure for cs_channel
-- ----------------------------
DROP TABLE IF EXISTS `cs_channel`;
CREATE TABLE `cs_channel`
(
    `authorizeURL`     varchar(255) DEFAULT NULL COMMENT '认证URL',
    `accessTokenURL`   varchar(255) DEFAULT NULL COMMENT '微博TokenURL',
    `baseURL`          varchar(255) DEFAULT NULL COMMENT '基础URL',
    `redirectURI`      varchar(255) DEFAULT NULL COMMENT '重定向URL',
    `clientSERCRET`    varchar(192) DEFAULT NULL COMMENT '安全码',
    `clientID`         varchar(96)  DEFAULT NULL COMMENT '客户端ID',
    `ID`               varchar(96) NOT NULL COMMENT '主键ID',
    `states`           varchar(32)  DEFAULT NULL COMMENT '状态',
    `region`           varchar(32)  DEFAULT NULL COMMENT '区域',
    `NAME`             varchar(255) DEFAULT NULL COMMENT '账号名称',
    `CODE`             varchar(255) DEFAULT NULL COMMENT '编码',
    `USERNAME`         varchar(255) DEFAULT NULL COMMENT '用户名',
    `APIPOINT`         varchar(255) DEFAULT NULL COMMENT 'API接入点',
    `PASSWORD`         varchar(255) DEFAULT NULL COMMENT '密码',
    `TYPE`             varchar(255) DEFAULT NULL COMMENT '账号类型（微博/微信）',
    `CREATETIME`       datetime     DEFAULT NULL COMMENT '创建时间',
    `ACCOUNT`          varchar(255) DEFAULT NULL COMMENT '账号',
    `ALLOWREMOTE`      varchar(255) DEFAULT NULL COMMENT '允许远程访问',
    `EMAIL`            varchar(255) DEFAULT NULL COMMENT '邮件',
    `USERNO`           varchar(255) DEFAULT NULL COMMENT '用户名',
    `TOKEN`            varchar(255) DEFAULT NULL COMMENT '微信Token',
    `APPKEY`           varchar(255) DEFAULT NULL COMMENT '微信AppKey',
    `SECRET`           varchar(255) DEFAULT NULL COMMENT '微信Secret',
    `AESKEY`           varchar(255) DEFAULT NULL COMMENT '微信AesKey',
    `APPTOKEN`         varchar(255) DEFAULT NULL COMMENT '微信AppToken',
    `SESSIONKEY`       varchar(255) DEFAULT NULL COMMENT '会话Key',
    `MOREPARAM`        varchar(255) DEFAULT NULL COMMENT '更多参数',
    `ORGAN`            varchar(32)  DEFAULT NULL COMMENT '组织机构ID',
    `DEFAULTACCOUNT`   smallint(6)  DEFAULT NULL COMMENT '默认账号',
    `lastatupdate`     varchar(96)  DEFAULT NULL COMMENT '最后更新时间',
    `lastprimsgupdate` varchar(96)  DEFAULT NULL,
    `ACCTYPE`          varchar(32)  DEFAULT NULL COMMENT '账号类型',
    `UPDATETIME`       datetime     DEFAULT NULL COMMENT '更新时间',
    `creater`          varchar(32)  DEFAULT NULL COMMENT '创建人',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_username`  varchar(255) DEFAULT NULL COMMENT '更新用户',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `update_user`      varchar(255) DEFAULT NULL COMMENT '修改人',
    `shares`           varchar(255) DEFAULT NULL COMMENT '分享给',
    `owner`            varchar(255) DEFAULT NULL COMMENT '所属人',
    `assignedto`       varchar(255) DEFAULT NULL COMMENT '分配目标用户',
    `wfstatus`         varchar(255) DEFAULT NULL COMMENT '流程状态',
    `datadept`         varchar(255) DEFAULT NULL COMMENT '创建人部门',
    `batid`            varchar(32)  DEFAULT NULL COMMENT '批次ID',
    `alias`            varchar(50)  DEFAULT NULL COMMENT '别称',
    `authaccesstoken`  varchar(255) DEFAULT NULL COMMENT '认证token（微信第三方平台）',
    `expirestime`      int(11)      DEFAULT NULL COMMENT '过期时间（微信第三方平台）',
    `headimg`          varchar(255) DEFAULT NULL COMMENT '账号头像（微信第三方平台）',
    `oepnscan`         varchar(100) DEFAULT NULL COMMENT '极光推送信息',
    `opencard`         varchar(100) DEFAULT NULL COMMENT '极光推送信息',
    `openstore`        varchar(100) DEFAULT NULL COMMENT '极光推送信息',
    `openpay`          varchar(100) DEFAULT NULL COMMENT '极光推送信息',
    `openshake`        varchar(100) DEFAULT NULL COMMENT '极光推送信息',
    `qrcode`           varchar(100) DEFAULT NULL COMMENT '二维码',
    `refreshtoken`     varchar(255) DEFAULT NULL COMMENT '刷新token',
    `verify`           varchar(255) DEFAULT NULL COMMENT '验证代码',
    `snsid`            varchar(32) NOT NULL COMMENT 'SNSID',
    `agent`            tinyint(4)   DEFAULT NULL COMMENT '坐席',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE KEY `SQL121227155530370` (`ID`) USING BTREE,
    UNIQUE KEY `snsid` (`snsid`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='渠道配置表';

-- ----------------------------
-- Records of cs_channel
-- ----------------------------
INSERT INTO `cs_channel`
VALUES (null, null, 'localhost', null, null, null, '2c9e80867d65eb5c017d65f6e2620070', null, null, 'localhost', null,
        null, null, null, 'webim', '2021-11-28 17:53:38', null, null, null, null, null, null, null, null, null, null,
        null, '2c9e80867d65eb5c017d65f17ceb0019', '0', null, null, null, null, '4028cac3614cd2f901614cf8be1f0324', null,
        null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null,
        null, null, '104eac', '0');

-- ----------------------------
-- Table structure for uk_sysdic
-- ----------------------------
DROP TABLE IF EXISTS `uk_sysdic`;
CREATE TABLE `uk_sysdic`
(
    `ID`           varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`         varchar(100) DEFAULT NULL COMMENT '字典名称',
    `TITLE`        varchar(100) DEFAULT NULL COMMENT '标题',
    `CODE`         varchar(100) DEFAULT NULL COMMENT '代码',
    `CTYPE`        varchar(32)  DEFAULT NULL COMMENT '类型',
    `PARENTID`     varchar(32)  DEFAULT NULL COMMENT '父级ID',
    `DESCRIPTION`  varchar(255) DEFAULT NULL COMMENT '描述',
    `MEMO`         varchar(32)  DEFAULT NULL COMMENT '备注',
    `ICONSTR`      varchar(255) DEFAULT NULL COMMENT '图标',
    `ICONSKIN`     varchar(255) DEFAULT NULL COMMENT '自定义样式',
    `CATETYPE`     varchar(32)  DEFAULT NULL COMMENT '类型',
    `CREATER`      varchar(32)  DEFAULT NULL COMMENT '创建人',
    `CREATETIME`   datetime     DEFAULT NULL COMMENT '创建时间',
    `UPDATETIME`   datetime     DEFAULT NULL COMMENT '更新时间',
    `HASCHILD`     tinyint(4)   DEFAULT NULL COMMENT '是否有下级',
    `SORTINDEX`    int(11)      DEFAULT NULL COMMENT '排序',
    `DICID`        varchar(32)  DEFAULT NULL COMMENT '目录ID',
    `DEFAULTVALUE` tinyint(4)   DEFAULT NULL COMMENT '默认值',
    `DISCODE`      tinyint(4)   DEFAULT NULL COMMENT '编码',
    `URL`          text COMMENT '系统权限资源的URL',
    `MODULE`       varchar(32)  DEFAULT NULL COMMENT '权限资源所属模块',
    `MLEVEL`       varchar(32)  DEFAULT NULL COMMENT '菜单级别（一级/二级）',
    `RULES`        varchar(100) DEFAULT NULL,
    `MENUTYPE`     varchar(32)  DEFAULT NULL COMMENT '菜单类型（顶部菜单/左侧菜单）',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE KEY `SQL121227155532210` (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='字典表';
