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
-- Table structure for uk_systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `uk_systemconfig`;
CREATE TABLE `uk_systemconfig`
(
    `ID`                 varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`               varchar(100) DEFAULT NULL COMMENT '名称',
    `TITLE`              varchar(100) DEFAULT NULL COMMENT '标题',
    `CODE`               varchar(100) DEFAULT NULL COMMENT '编码',
    `CTYPE`              varchar(32)  DEFAULT NULL COMMENT '类型',
    `PARENTID`           varchar(32)  DEFAULT NULL COMMENT '父级ID',
    `DESCRIPTION`        varchar(255) DEFAULT NULL COMMENT '描述',
    `MEMO`               varchar(32)  DEFAULT NULL COMMENT '备注',
    `ICONSTR`            varchar(255) DEFAULT NULL COMMENT '自定义样式',
    `ICONSKIN`           varchar(255) DEFAULT NULL COMMENT '自定义样式',
    `CATETYPE`           varchar(32)  DEFAULT NULL COMMENT '分类',
    `CREATER`            varchar(32)  DEFAULT NULL COMMENT '创建人',
    `CREATETIME`         datetime     DEFAULT NULL COMMENT '创建时间',
    `UPDATETIME`         datetime     DEFAULT NULL COMMENT '更新时间',
    `HASCHILD`           tinyint(4)   DEFAULT NULL COMMENT '是否有下级',
    `SORTINDEX`          int(11)      DEFAULT NULL COMMENT '排序',
    `DICID`              varchar(32)  DEFAULT NULL COMMENT '目录ID',
    `DEFAULTVALUE`       tinyint(4)   DEFAULT NULL COMMENT '默认值',
    `THEME`              varchar(50)  DEFAULT NULL COMMENT '皮肤',
    `LOGLEVEL`           varchar(32)  DEFAULT NULL COMMENT '日志级别',
    `ENABLESSL`          tinyint(4)   DEFAULT NULL COMMENT '启用SSL',
    `JKSFILE`            varchar(255) DEFAULT NULL COMMENT 'JKS文件路径',
    `JKSPASSWORD`        varchar(255) DEFAULT NULL COMMENT 'JKS密码',
    `MAPKEY`             varchar(255) DEFAULT NULL COMMENT '百度地图授权编码',
    `workorders`         tinyint(4)   DEFAULT NULL COMMENT '启用工单三栏布局',
    `callcenter`         tinyint(4)   DEFAULT NULL COMMENT '启用呼叫中心',
    `cc_extention`       varchar(32)  DEFAULT NULL COMMENT '分机',
    `cc_quene`           varchar(32)  DEFAULT NULL COMMENT '技能组队列',
    `cc_router`          varchar(32)  DEFAULT NULL COMMENT '路由策略',
    `cc_ivr`             varchar(32)  DEFAULT NULL COMMENT 'IVR模板',
    `cc_acl`             varchar(32)  DEFAULT NULL COMMENT '访问列表模板',
    `cc_siptrunk`        varchar(32)  DEFAULT NULL COMMENT 'SIP配置模板',
    `cc_callcenter`      varchar(32)  DEFAULT NULL COMMENT '呼叫中心配置',
    `CALLOUT`            tinyint(4)   DEFAULT NULL COMMENT '是否允许点击号码外呼',
    `AUTH`               tinyint(4)   DEFAULT NULL COMMENT '启用权限控制',
    `enablemail`         tinyint(4)   DEFAULT '0' COMMENT '启用发送邮件',
    `enablesms`          tinyint(4)   DEFAULT '0' COMMENT '启用发送短信',
    `emailid`            varchar(32)  DEFAULT NULL COMMENT '启用AI',
    `emailworkordertp`   varchar(32)  DEFAULT NULL COMMENT '启用工单邮件发送',
    `smsid`              varchar(32)  DEFAULT NULL COMMENT '短信网关ID',
    `smsworkordertp`     varchar(32)  DEFAULT NULL COMMENT '启用工单发送短信',
    `mailcreatetp`       varchar(32)  DEFAULT NULL COMMENT '创建发送邮件模板',
    `mailupdatetp`       varchar(32)  DEFAULT NULL COMMENT '更新发送邮件模板',
    `mailprocesstp`      varchar(32)  DEFAULT NULL COMMENT '处理发送邮件模板',
    `emailtocreater`     tinyint(4)   DEFAULT '0' COMMENT '更新发送创建人邮件模板',
    `emailshowrecipient` tinyint(4)   DEFAULT '0' COMMENT '发送邮件给创建人',
    `smscreatetp`        varchar(32)  DEFAULT NULL COMMENT '创建发送短信',
    `smsupdatetp`        varchar(32)  DEFAULT NULL,
    `smsprocesstp`       varchar(32)  DEFAULT NULL COMMENT '处理发送短信',
    `smstocreater`       tinyint(4)   DEFAULT '0' COMMENT '创建发送短信',
    `emailtocreatertp`   varchar(32)  DEFAULT NULL COMMENT '创建发送短信模板',
    `smstocreatertp`     varchar(32)  DEFAULT NULL COMMENT '更新发送短信模板',
    `enabletneant`       tinyint(4)   DEFAULT '0' COMMENT '启用多租户',
    `tenantshare`        tinyint(4)   DEFAULT '0' COMMENT '租户共享数据',
    `namealias`          varchar(100) DEFAULT NULL COMMENT '别称',
    `enableregorgi`      tinyint(4)   DEFAULT '0' COMMENT '启用注册租户',
    `tenantconsole`      tinyint(4)   DEFAULT '0' COMMENT '登录跳转到租户切换页面',
    `loginlogo`          varchar(255) DEFAULT NULL COMMENT '登陆页面Logo',
    `consolelogo`        varchar(255) DEFAULT NULL COMMENT '后台页面Logo',
    `favlogo`            varchar(255) DEFAULT NULL COMMENT '系统Fav图标Logo',
    UNIQUE KEY `SQL121227155532210` (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='系统设置表';

-- ----------------------------
-- Records of uk_systemconfig
-- ----------------------------
INSERT INTO `uk_systemconfig`
VALUES ('2c93809364e0a6d00164ef6722270582', null, '春松客服-开源客服系统', null, null, null, null, null, null, null,
        null, '4028cac3614cd2f901614cf8be1f0324', '2018-07-31 08:14:30', null, null, null, null, null, '01', 'info',
        '0', null, null, '', '0', '0', '', '', '', '', '', '', null, '0', '0', '0', '0', '', '', null, null, '', '',
        null, '0', '0', null, null, null, '0', '', null, '0', '0', '租户', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for uk_system_message
-- ----------------------------
DROP TABLE IF EXISTS `uk_system_message`;
CREATE TABLE `uk_system_message`
(
    `ID`           varchar(32) NOT NULL COMMENT '主键ID',
    `MSGTYPE`      varchar(20)  DEFAULT NULL COMMENT '消息类型',
    `SMTPSERVER`   varchar(255) DEFAULT NULL COMMENT 'SMTP服务器',
    `SMTPUSER`     varchar(255) DEFAULT NULL COMMENT 'SMTP账号',
    `SMTPPASSWORD` varchar(255) DEFAULT NULL COMMENT 'SMTP密码',
    `MAILFROM`     varchar(255) DEFAULT NULL COMMENT '发件人',
    `SECLEV`       varchar(50)  DEFAULT NULL COMMENT '启用SSL',
    `SSLPORT`      varchar(50)  DEFAULT NULL COMMENT 'SSL端口',
    `ORGAN`        varchar(32)  DEFAULT NULL COMMENT '组织ID',
    `URL`          text COMMENT 'URL',
    `smstype`      varchar(32)  DEFAULT NULL COMMENT '短信类型',
    `APPKEY`       varchar(200) DEFAULT NULL COMMENT 'APPKEY',
    `APPSEC`       varchar(200) DEFAULT NULL COMMENT 'APPSEC',
    `SIGN`         varchar(50)  DEFAULT NULL COMMENT '签名',
    `TPCODE`       varchar(50)  DEFAULT NULL COMMENT 'TP代码',
    `CREATETIME`   datetime     DEFAULT NULL COMMENT '创建时间',
    `NAME`         varchar(50)  DEFAULT NULL COMMENT '邮件或短信网关名称',
    `moreparam`    text COMMENT '更多参数',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='公告信息表';

-- ----------------------------
-- Records of uk_system_message
-- ----------------------------

-- ----------------------------
-- Table structure for uk_tableproperties
-- ----------------------------
DROP TABLE IF EXISTS `uk_tableproperties`;
CREATE TABLE `uk_tableproperties`
(
    `ID`                varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `NAME`              varchar(255)         DEFAULT NULL COMMENT '字段名称',
    `CODE`              varchar(255)         DEFAULT NULL COMMENT '代码',
    `GROUPID`           varchar(255)         DEFAULT NULL COMMENT '组ID',
    `USERID`            varchar(255)         DEFAULT NULL COMMENT '创建人ID',
    `FIELDNAME`         varchar(255)         DEFAULT NULL COMMENT '字段名称',
    `DATATYPECODE`      int(11)     NOT NULL COMMENT '数据类型代码',
    `DATATYPENAME`      varchar(255)         DEFAULT NULL COMMENT '字段类型名称',
    `DBTABLEID`         varchar(191)         DEFAULT NULL COMMENT '数据表ID',
    `INDEXDATATYPE`     varchar(255)         DEFAULT NULL COMMENT '字段类型',
    `PK`                smallint(6)          DEFAULT NULL COMMENT '是否外键',
    `MODITS`            smallint(6)          DEFAULT NULL COMMENT '是否启用多值',
    `INDEXFIELD`        varchar(32)          DEFAULT NULL COMMENT '是否索引',
    `PLUGIN`            varchar(32)          DEFAULT NULL COMMENT '处理插件',
    `FKTABLE`           varchar(32)          DEFAULT NULL COMMENT '外键表',
    `FKPROPERTY`        varchar(32)          DEFAULT NULL COMMENT '外键字段',
    `TABLENAME`         varchar(255)         DEFAULT NULL COMMENT '数据表名称',
    `viewtype`          varchar(255)         DEFAULT NULL COMMENT '视图类型',
    `SORTINDEX`         int(11)              DEFAULT NULL COMMENT '排序位置',
    `SYSTEMFIELD`       tinyint(4)           DEFAULT NULL COMMENT '系统字段',
    `INX`               tinyint(4)           DEFAULT NULL COMMENT '索引',
    `TOKEN`             tinyint(4)           DEFAULT NULL COMMENT '分词',
    `LENGTH`            int(11)              DEFAULT NULL COMMENT '长度',
    `FIELDSTATUS`       tinyint(4)           DEFAULT NULL COMMENT '字段状态',
    `SELDATA`           tinyint(4)           DEFAULT NULL COMMENT '关联字段数据',
    `SELDATACODE`       varchar(32)          DEFAULT NULL COMMENT '关联字段代码',
    `SELDATAKEY`        varchar(32)          DEFAULT NULL COMMENT '关联key',
    `SELDATAVALUE`      varchar(32)          DEFAULT NULL COMMENT '关联字段值',
    `SELDATATYPE`       varchar(32)          DEFAULT NULL COMMENT '关联类型',
    `REFTBID`           varchar(32)          DEFAULT NULL COMMENT '引用表ID',
    `REFTPID`           varchar(32)          DEFAULT NULL COMMENT '引用字段ID',
    `REFTYPE`           varchar(32)          DEFAULT NULL COMMENT '引用类型',
    `REFTBNAME`         varchar(60)          DEFAULT NULL COMMENT '引用表名称',
    `REFTPNAME`         varchar(60)          DEFAULT NULL COMMENT '引用字段名称',
    `REFTPTITLEFIELD`   varchar(60)          DEFAULT NULL COMMENT '引用字段ID',
    `REFFK`             tinyint(4)           DEFAULT NULL COMMENT '外键',
    `DEFAULTSORT`       tinyint(4)           DEFAULT NULL COMMENT '默认排序',
    `DEFAULTVALUE`      varchar(255)         DEFAULT NULL COMMENT '默认值',
    `DEFAULTVALUETITLE` varchar(255)         DEFAULT NULL COMMENT '默认标题',
    `DEFAULTFIELDVALUE` varchar(255)         DEFAULT NULL COMMENT '默认标题内容',
    `MULTPARTFILE`      tinyint(4)           DEFAULT NULL COMMENT '多值',
    `UPLOADTYPE`        varchar(255)         DEFAULT NULL COMMENT '文件上传类型',
    `cascadetype`       varchar(255)         DEFAULT NULL COMMENT '引用',
    `title`             tinyint(4)           DEFAULT NULL COMMENT '标题',
    `DESCORDER`         tinyint(4)           DEFAULT NULL COMMENT '排序方式',
    `impfield`          tinyint(4)           DEFAULT '0' COMMENT '导入字段',
    `tokentype`         varchar(32)          DEFAULT NULL COMMENT '分词',
    `phonenumber`       tinyint(4)           DEFAULT NULL COMMENT '是否电话号码',
    `phonetype`         varchar(50)          DEFAULT NULL COMMENT '电话号码类型',
    `phonememo`         varchar(50)          DEFAULT NULL COMMENT '电话号码备注',
    `secfield`          tinyint(4)           DEFAULT '0' COMMENT '隐藏字段',
    `secdistype`        varchar(50)          DEFAULT NULL COMMENT '字段隐藏方式',
    `styletype`         varchar(32)          DEFAULT NULL COMMENT '样式',
    `sysfield`          tinyint(4)           DEFAULT '0' COMMENT '系统字段',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE KEY `SQL130112140848940` (`ID`) USING BTREE,
    KEY `FKF8D74787854BC62` (`DBTABLEID`) USING BTREE,
    KEY `FKF8D747811BE44FF` (`FKPROPERTY`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='元数据字段表';

-- ----------------------------
-- Records of uk_tableproperties
-- ----------------------------
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ac018f', '性别', null, null, null, 'gender', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '60', '1', '1', 'com.dic.contacts.sex', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ac0190', '出生日期', null, null, null, 'cusbirthday', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '50', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ac0192', '联系人类别', null, null, null, 'ckind', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '60', '1', '1', 'com.dic.contacts.ckind', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528af019e', '电子邮件', null, null, null, 'email', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '128', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b001a0', '手机号码', null, null, null, 'mobileno', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '40', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b101a2', '办公电话', null, null, null, 'phone', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '40', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b301ab', '省', null, null, null, 'province', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '60', '1', '1', 'com.dic.address.area', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b401ac', '市(区)县', null, null, null, 'city', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '60', '1', '1', 'com.dic.address.area', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b401ad', '地址', null, null, null, 'address', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '65535', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b801bb', '最后联系时间', null, null, null, 'touchtime', '0', 'datetime',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b901be', '创建人', null, null, null, 'creater', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '60', '1', '0', '', null, null, '', 'userdata', null, null, null, null, null, '1', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b901c1', '联系人备注', null, null, null, 'memo', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528b901c3', '修改时间', null, null, null, 'updatetime', '0', 'datetime',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ba01c6', '创建时间', null, null, null, 'createtime', '0', 'datetime',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ba01c7', '联系人姓名', null, null, null, 'name', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', '', null, null, '', '', null, null, null, null, null, '0', '0', null, 'required',
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528ba01ca', '分享给', null, null, null, 'shares', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bb01d0', 'skypeid', null, null, null, 'skypeid', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bb01d1', '人员id', null, null, null, 'wluid', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bc01d2', '人员名称', null, null, null, 'wlusername', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bc01d3', '公司id', null, null, null, 'wlcid', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bc01d4', '公司名称', null, null, null, 'wlcompany_name', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bc01d5', '子系统id', null, null, null, 'wlsid', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('2c9480886e91d9e5016e91f528bc01d6', '子系统名称', null, null, null, 'wlsystem_name', '0', 'text',
        '2c9480886e91d9e5016e91f528ab018d', null, '0', '0', null, null, null, null, 'uk_contacts', null, '100', '0',
        '1', '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95575801c2', '企(事)业单位名称', null, null, null, 'name', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95575801c3', '单位性质', null, null, null, 'etype', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.customer.etype', null, null, '', '', null, null, null, null, null, '0', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95575b01c4', '客户类别', null, null, null, 'ekind', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.contacts.entype', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95575c01c5', '客户级别', null, null, null, 'elevel', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.contacts.elevel', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95575c01c8', '来源', null, null, null, 'esource', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '64', '1', '1', 'com.dic.contacts.esource', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576101d1', '电子邮件', null, null, null, 'email', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '128', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576101d3', '办公电话', null, null, null, 'phone', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '40', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576201d8', '省', null, null, null, 'province', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.address.area', null, null, '', '', null, null, null, null, null, '0', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576201d9', '市区县', null, null, null, 'city', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.address.area', null, null, '', '', null, null, null, null, null, '0', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576201db', '地址', null, null, null, 'address', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576301e3', '所属行业', null, null, null, 'industry', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '1', 'com.dic.contacts.industry', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576301e4', '效力状态', null, null, null, 'validstatus', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '50', '1', '1', 'com.dic.contacts.validstatus', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576301ef', '描述', null, null, null, 'description', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '65535', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576401f0', '创建人', null, null, null, 'creater', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '60', '1', '0', '', null, null, '', 'userdata', null, null, null, null, null, '1', '0', null, null, null,
        '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576401f4', '修改时间', null, null, null, 'updatetime', '0', 'datetime',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576401f6', '创建时间', null, null, null, 'createtime', '0', 'datetime',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e95576401f9', '分享给', null, null, null, 'shares', '0', 'text',
        '402870876e5d9773016e5e95575601c0', null, '0', '0', null, null, null, null, 'cs_account', null, '100', '0', '1',
        '0', '255', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null, null, '1',
        null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc6380272', '坐席用户名', null, null, null, 'agentusername', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '100', '1', '0', '', null, null, '', 'userdata', null, null, null, null, null, '1', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc6380275', '服务次数', null, null, null, 'times', '0', 'number',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '10', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc6390278', '用户名', null, null, null, 'username', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63a027a', '渠道', null, null, null, 'channel', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '32', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63a027b', '登录时间', null, null, null, 'logindate', '0', 'datetime',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63a027c', '服务类型', null, null, null, 'servicetype', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '65535', '1', '0', 'com.dic.db.type', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63a027d', '是否预约', null, null, null, 'reservation', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '3', '1', '1', 'com.dic.yesorno', null, null, '', '', null, null, null, null, null, '0', '0',
        null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b027e', '预约方式', null, null, null, 'reservtype', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '32', '1', '1', 'com.dic.summary.reservtype', null, null, '', '', null, null, null, null, null,
        '0', '0', null, null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b027f', 'reservtime', null, null, null, 'reservtime', '0', 'datetime',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b0280', '电子邮件', null, null, null, 'email', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '100', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b0281', '电话号码', null, null, null, 'phonenumber', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '32', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b0282', '服务记录', null, null, null, 'summary', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '65535', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63b0284', '创建人', null, null, null, 'creater', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '32', '1', '0', '', null, null, '', 'userdata', null, null, null, null, null, '1', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63c0285', '创建时间', null, null, null, 'createtime', '0', 'datetime',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63d028c', 'process', null, null, null, 'process', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '3', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63d028d', 'updateuser', null, null, null, 'updateuser', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '32', '1', '0', '', null, null, '', 'userdata', null, null, null, null, null, '1', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63d028e', 'updatetime', null, null, null, 'updatetime', '0', 'datetime',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '19', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null, null,
        null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');
INSERT INTO `uk_tableproperties`
VALUES ('402870876e5d9773016e5e9cc63d028f', 'processmemo', null, null, null, 'processmemo', '0', 'text',
        '402870876e5d9773016e5e9cc6370270', null, '0', '0', null, null, null, null, 'uk_servicesummary', null, '100',
        '0', '1', '0', '65535', '1', '0', null, null, null, '', null, null, null, null, null, null, '0', '0', null,
        null, null, '1', null, null, '0', '0', '0', null, '0', null, null, '0', null, null, '0');

-- ----------------------------
-- Table structure for uk_tabletask
-- ----------------------------
DROP TABLE IF EXISTS `uk_tabletask`;
CREATE TABLE `uk_tabletask`
(
    `ID`               varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `NAME`             varchar(255)         DEFAULT NULL COMMENT '元数据表名称',
    `SECURE`           varchar(255)         DEFAULT NULL COMMENT '安全级别',
    `TASKSTATUS`       varchar(255)         DEFAULT NULL COMMENT '任务状态',
    `TABLEDIRID`       varchar(255)         DEFAULT NULL COMMENT '数据表目录ID',
    `DBID`             varchar(255)         DEFAULT NULL COMMENT '数据源ID',
    `CODE`             varchar(255)         DEFAULT NULL COMMENT '代码',
    `GROUPID`          varchar(255)         DEFAULT NULL COMMENT '分组ID',
    `CREATER`          varchar(32)          DEFAULT NULL COMMENT '创建人',
    `CREATERNAME`      varchar(255)         DEFAULT NULL COMMENT '创建人姓名',
    `TASKTYPE`         varchar(255)         DEFAULT NULL COMMENT '任务类型',
    `TASKNAME`         varchar(255)         DEFAULT NULL COMMENT '任务名称',
    `TASKPLAN`         varchar(255)         DEFAULT NULL COMMENT '任务计划',
    `CONFIGURE`        varchar(255)         DEFAULT NULL COMMENT '配置',
    `SECURECONF`       varchar(255)         DEFAULT NULL COMMENT '安全级别',
    `USERID`           varchar(255)         DEFAULT NULL COMMENT '用户ID',
    `PREVIEWTEMPLET`   text COMMENT '预览模板',
    `LISTBLOCKTEMPLET` text COMMENT '详情模板',
    `TABLENAME`        varchar(255)         DEFAULT NULL COMMENT '数据表名称',
    `TABLETYPE`        varchar(255)         DEFAULT NULL COMMENT '数据表类型',
    `STARTINDEX`       int(11)     NOT NULL COMMENT '开始位置',
    `UPDATETIME`       datetime             DEFAULT NULL COMMENT '更新时间',
    `UPDATETIMENUMBER` int(11)     NOT NULL COMMENT '更新时间时间戳',
    `DATASQL`          longtext COMMENT 'SQL',
    `DATABASETASK`     varchar(32)          DEFAULT NULL COMMENT '数据库任务',
    `DRIVERPLUGIN`     varchar(32)          DEFAULT NULL COMMENT '驱动',
    `WORKFLOW`         tinyint(10)          DEFAULT NULL COMMENT '流程',
    `FROMDB`           tinyint(4)           DEFAULT NULL COMMENT '来源数据库',
    `tabtype`          varchar(32)          DEFAULT NULL COMMENT '切换类型',
    `pid`              varchar(32)          DEFAULT NULL COMMENT '外部ID',
    `secmenuid`        varchar(32)          DEFAULT NULL COMMENT '二级菜单ID',
    `reportid`         varchar(32)          DEFAULT NULL COMMENT '报表ID',
    `eventname`        varchar(32)          DEFAULT NULL COMMENT '事件名称',
    `tltemplet`        varchar(32)          DEFAULT NULL COMMENT '标题模板',
    `timeline`         tinyint(4)           DEFAULT NULL COMMENT '时间',
    `tbversion`        int(11)              DEFAULT NULL COMMENT '版本',
    `LASTUPDATE`       datetime             DEFAULT NULL COMMENT '最近更新时间',
    `CREATETIME`       datetime             DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='元数据信息表';

-- ----------------------------
-- Records of uk_tabletask
-- ----------------------------
INSERT INTO `uk_tabletask`
VALUES ('2c9480886e91d9e5016e91f528ab018d', 'uk_contacts', null, null, '0', null, null, null,
        '2c9480886e91d9e5016e91db8df10017', 'xianli', null, 'uk_contacts', null, null, null, null, null, null,
        'uk_contacts', '1', '0', '2019-11-22 15:13:13', '0', null, null, null, '0', '0', null, null, null, null, null,
        null, '0', '0', null, '2019-11-22 15:13:13');
INSERT INTO `uk_tabletask`
VALUES ('402870876e5d9773016e5e95575601c0', 'cs_account', null, null, '0', null, null, null,
        '402870876e4f5bdd016e4f77eb6f0075', 'xiaoxiao', null, 'cs_account', null, null, null, null, null, null,
        'cs_account', '1', '0', '2019-11-12 15:47:53', '0', null, null, null, '0', '0', null, null, null, null, null,
        null, '0', '0', null, '2019-11-12 15:47:53');
INSERT INTO `uk_tabletask`
VALUES ('402870876e5d9773016e5e9cc6370270', 'uk_servicesummary', null, null, '0', null, null, null,
        '402870876e4f5bdd016e4f77eb6f0075', 'xiaoxiao', null, 'uk_servicesummary', null, null, null, null, null, null,
        'uk_servicesummary', '1', '0', '2019-11-12 15:56:02', '0', null, null, null, '0', '0', null, null, null, null,
        null, null, '0', '0', null, '2019-11-12 15:56:02');

-- ----------------------------
-- Table structure for uk_tag
-- ----------------------------
DROP TABLE IF EXISTS `uk_tag`;
CREATE TABLE `uk_tag`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `tag`        varchar(100) DEFAULT NULL COMMENT '标签',
    `createtime` datetime     DEFAULT NULL COMMENT '创建时间',
    `times`      int(11)      DEFAULT NULL COMMENT '引用次数',
    `creater`    varchar(32)  DEFAULT NULL COMMENT '创建人',
    `tagtype`    varchar(32)  DEFAULT NULL COMMENT '标签类型',
    `icon`       varchar(50)  DEFAULT NULL COMMENT '图标',
    `color`      varchar(10)  DEFAULT NULL COMMENT '颜色',
    `skill`      varchar(32)  DEFAULT NULL COMMENT '组织机构ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='标签表';

-- ----------------------------
-- Records of uk_tag
-- ----------------------------

-- ----------------------------
-- Table structure for uk_tagrelation
-- ----------------------------
DROP TABLE IF EXISTS `uk_tagrelation`;
CREATE TABLE `uk_tagrelation`
(
    `id`     varchar(32) NOT NULL COMMENT '主键ID',
    `tagid`  varchar(32) DEFAULT NULL COMMENT '标签ID',
    `userid` varchar(32) DEFAULT NULL COMMENT '创建人',
    `dataid` varchar(32) DEFAULT NULL COMMENT '数据ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='标签映射关系表';

-- ----------------------------
-- Records of uk_tagrelation
-- ----------------------------

-- ----------------------------
-- Table structure for uk_templet
-- ----------------------------
DROP TABLE IF EXISTS `uk_templet`;
CREATE TABLE `uk_templet`
(
    `ID`           varchar(32) NOT NULL COMMENT '主键ID',
    `NAME`         varchar(255) DEFAULT NULL COMMENT '模板名称',
    `DESCRIPTION`  longtext COMMENT '描述',
    `CODE`         varchar(255) DEFAULT NULL COMMENT '代码',
    `GROUPID`      varchar(255) DEFAULT NULL COMMENT '组ID',
    `CREATETIME`   datetime     DEFAULT NULL COMMENT '创建时间',
    `USERID`       varchar(255) DEFAULT NULL COMMENT '创建人ID',
    `TEMPLETTITLE` varchar(500) DEFAULT NULL COMMENT '模板标题内容',
    `TEMPLETTEXT`  longtext COMMENT '模板内容',
    `TEMPLETTYPE`  varchar(255) DEFAULT NULL COMMENT '模板类型',
    `ICONSTR`      varchar(255) DEFAULT NULL COMMENT '自定义样式',
    `MEMO`         varchar(255) DEFAULT NULL COMMENT '备注',
    `ORDERINDEX`   int(11)      DEFAULT NULL COMMENT '排序位置',
    `TYPEID`       varchar(32)  DEFAULT NULL COMMENT '分类ID',
    `SELDATA`      tinyint(4)   DEFAULT NULL COMMENT '启用外键',
    `layoutcols`   int(11)      DEFAULT '0' COMMENT '布局列数',
    `datatype`     varchar(32)  DEFAULT NULL COMMENT '数据类型',
    `charttype`    varchar(32)  DEFAULT NULL COMMENT '图表类型',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='模板表';

-- ----------------------------
-- Records of uk_templet
-- ----------------------------
INSERT INTO `uk_templet`
VALUES ('4028811b618d0dca01618f99e056035c', '四列布局', null, 'layout', null, '2018-02-13 22:38:01', null, null,
        '<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"3\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 3>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md3 ukefu-col\" data-colspan=\"3\" data-index=\"4\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 4>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>',
        '4028811b618d0dca01618d5a5fd10349', '/images/design/four.png', null, null, null, null, '4', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b618d0dca01618f99f175035d', '三列布局', null, 'layout', null, '2018-02-13 22:38:06', null, null,
        '<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md4 ukefu-col\" data-colspan=\"4\" data-index=\"3\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 3>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>',
        '4028811b618d0dca01618d5a5fd10349', '/images/design/three.png', null, null, null, null, '3', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b618d0dca01618f9a08c5035e', '两列布局', null, 'layout', null, '2018-02-13 22:38:12', null, null,
        '<div class=\"layui-col-md6 ukefu-col\" data-colspan=\"6\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>\r\n<div class=\"layui-col-md6 ukefu-col\" data-colspan=\"6\" data-index=\"2\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 2>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>',
        '4028811b618d0dca01618d5a5fd10349', '/images/design/two.png', null, null, null, null, '2', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b618d0dca01618f9a1aee035f', '一列布局', null, 'layout', null, '2018-02-13 22:38:16', null, null,
        '<div class=\"layui-col-md12 ukefu-col\" data-colspan=\"12\" data-index=\"1\" data-mid=\"${model.id}\">\r\n	<#list reportModels as element>\r\n	<#if element.parentid?? && element.parentid == model.id && element.colindex == 1>\r\n	<#assign eltemplet = element.templet()>\r\n	<#include \"/apps/business/report/design/element.html\">\r\n	</#if>\r\n	</#list>\r\n</div>',
        '4028811b618d0dca01618d5a5fd10349', '/images/design/one.png', null, null, null, null, '1', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191e4721c033d', '数据表', null, 'report', null, '2018-02-14 09:18:43', null, null,
        '<#if reportData??>\r\n<table class=\"layui-table ukefu-report\">\r\n  <thead>\r\n	<#if reportData?? && reportData.col?? && reportData.col.title??>\r\n	  <#list reportData.col.title as tlist>\r\n		<tr class=\"sortableTr\">\r\n		  <#if reportData.col.title?size gt 1 && tlist_index==0 && reportData.row.title?size gt 0>\r\n			<td align=\"center\" colspan=\"${reportData.row.title?size}\" rowspan=\"${reportData.col.title?size-1}\" class=\"s_blue\"></td>\r\n		  </#if>\r\n		  <#if (tlist_index+1)==reportData.col.title?size && reportData.row?? && reportData.row.firstTitle??>\r\n			<#list reportData.row.firstTitle as first>\r\n			  <td align=\"center\" data-title=\"${first.name?url}\" data-flag=\"dim\">${first.rename!first.name!\'\'}				\r\n			</#list>\r\n		  </#if>\r\n		  <#if tlist??>\r\n			<#list tlist as tl>\r\n			  <td align=\"center\" <#if tl.leveltype?? && tl.leveltype==\"newcol\">rowspan=\"${reportData.col.title?size}\"</#if>colspan=\"${tl.colspan}\" > ${tl.rename!tl.name!\"\"}\r\n				</td>\r\n			</#list>\r\n			</#if>\r\n	</tr>\r\n	</#list>\r\n	</#if>\r\n  </thead>\r\n  <tbody>\r\n	<#if reportData?? && reportData.data??>\r\n	  <#list reportData.data as values>\r\n		<tr class=\"rowcell\">\r\n		  <#if reportData.row?? && reportData.row.title?? && reportData.row.title?size gt 0>\r\n			<#list reportData.row.title as tl>\r\n			  <#assign rows=0>\r\n				<#list tl as title>\r\n				  <#if title??>\r\n					<#if rows==values_index && title.name !=\"TOTAL_TEMP\">\r\n					  	<#if title.leveltype !=\"newrow_extend_sum\">\r\n						<td nowrap=\"nowrap\" align=\"center\" class=\"blue_k <#if title.total == true>total</#if>\" rowspan=\"${title.rowspan!\'0\'}\" <#if title.colspan gt 1>colspan=\"${title.colspan}\"</#if>>\r\n						  ${title.formatName!\'\'}</td>\r\n						</#if>\r\n						<#if title.valueData??>\r\n						  <#list title.valueData as value>\r\n							<#if value.merge==false>\r\n							  <td rowspan=\"${value.rowspan}\" colspan=\"${value.colspan}\" align=\"center\" class=\"measure ${value.vtclass!\'\'}\" nowrap=\"nowrap\" <#if value.cellmergeid??>data-cellmerge=\"${value.cellmergeid}\"</#if>>\r\n							${value.valueStyle!value.foramatValue!\'\'}</td>\r\n							</#if>\r\n							</#list>\r\n						  </#if>\r\n					  </#if>\r\n					  <#assign rows=rows + title.rowspan>\r\n				  </#if>\r\n			</#list>\r\n	</#list>\r\n	<#else>\r\n	  <#list values as value>\r\n		<td class=\"row \" style=\"text-align: right;<#if value.valueType?? && value.valueType == \'total\'>background-color:#c5daed;</#if>\">\r\n		  ${value.valueStyle!value.foramatValue!\'\'}</td>\r\n	  </#list>\r\n	  </#if>\r\n	  </tr>\r\n	  </#list>\r\n	  </#if>\r\n  </tbody>\r\n</table>\r\n<#if reportModel?? && reportModel.isloadfulldata == \'true\'>\r\n<#if reportData?? && reportData.total gt reportData.pageSize>\r\n<div class=\"row\" style=\"padding:5px;\">\r\n	<div class=\"col-lg-12\" id=\"page_${reportModel.id!\'\'}\" style=\"text-align:center;\"></div>\r\n</div>\r\n</#if>\r\n<script>\r\n	layui.use([\'laypage\', \'layer\',\'form\'], function(){\r\n		  var laypage = layui.laypage\r\n		  ,layer = layui.layer;\r\n		  laypage.render({\r\n			  elem:\'page_${reportModel.id!\'\'}\'\r\n				,count: <#if reportData??>${reportData.total}<#else>0</#if> \r\n				,curr:<#if reportData??>${reportData.page}<#else>0</#if>\r\n				,groups: 5 \r\n				,limit:<#if reportData?? && reportData.pageSize gt 0>${reportData.pageSize}<#else>20</#if>\r\n				,jump:function(data , first){\r\n					if(!first){\r\n						loadURL(\"/apps/report/design/getelement.html?id=<#if reportModel??>${reportModel.id!\'\'}</#if>&p=\"+data.curr,\"#${reportModel.id!\'\'}\");\r\n					}\r\n				}\r\n		   });\r\n		});\r\n</script>\r\n</#if>\r\n<#else>\r\n<div class=\"layui-form\">\r\n  <table class=\"layui-table\">\r\n    <thead>\r\n      <tr><th>人物</th><th>民族</th><th>格言</th></tr> \r\n    </thead>\r\n    <tbody>\r\n      <tr><td>贤心</td><td>汉族</td><td>人生似修行</td>\r\n      </tr>\r\n      <tr><td>张爱玲</td><td>汉族</td><td>时间</td></tr>\r\n      <tr><td>Helen Keller</td><td>拉丁美裔</td><td>nothing</td></tr>\r\n    </tbody>\r\n  </table>\r\n</div>\r\n</#if>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/table.png', null, null, null, null, '0', 'simple', null);
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191e76714033e', '金字塔图', null, 'report', null, '2018-02-14 09:21:57', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [\r\n					{ key: \'浏览网站\', value: 50000 },\r\n					{ key: \'放入购物车\', value: 35000 },\r\n					{ key: \'生成订单\', value: 25000 },\r\n					{ key: \'支付订单\', value: 15000 },\r\n					{ key: \'完成交易\', value: 8000 }\r\n				  ];		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/jzt.png', null, null, null, null, '0', null, 'pyramid');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191e7c554033f', '地图', null, 'report', null, '2018-02-14 09:22:21', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"key\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"value\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>		\r\n	</#if>	\r\n	let func_${element.mid!\'\'} = function(geoJson){\r\n	<#if !reportData??>\r\n		const data1_${element.mid!\'\'} = [];\r\n		  for (let i = 0; i < geoJson.length; i++) {\r\n	  	      let name = geoJson[i].properties.name;\r\n	  	      data1_${element.mid!\'\'}.push({\r\n	  	        key: name,\r\n	  	        value: Math.round(Math.random() * 1000),\r\n	  	      });\r\n	  	    }\r\n	<#else>\r\n		const data1_${element.mid!\'\'} = [];\r\n		for (let i = 0; i < geoJson.length; i++) {\r\n			let name = geoJson[i].properties.name;\r\n			let value = 0;\r\n			for (let j = 0; j < data_${element.mid!\'\'}.length;j++) {				  	      \r\n			  let name2 = data_${element.mid!\'\'}[j][\"key\"];\r\n			  if(name == name2){\r\n				value = data_${element.mid!\'\'}[j].value;\r\n			  }	      \r\n	  	    }\r\n			data1_${element.mid!\'\'}.push({\r\n	  	        key: name,\r\n	  	        value: value,\r\n	  	      });\r\n	  	    }\r\n	</#if>\r\n	\r\n		let mapData_${element.mid!\'\'} = {\r\n	      type: \'FeatureCollection\',\r\n	      features: geoJson\r\n		};\r\n	    let ds_${element.mid!\'\'} = new DataSet();\r\n	    let geoDataView_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(mapData_${element.mid!\'\'}, {\r\n	      type: \'GeoJSON\',\r\n	    });\r\n\r\n	    // 用户数据\r\n	    let dvData_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data1_${element.mid!\'\'});\r\n	    dvData_${element.mid!\'\'}.transform({\r\n	      type: \'geo.region\',\r\n	      field: \'key\',\r\n	      geoDataView: geoDataView_${element.mid!\'\'},\r\n	      as: [\'longitude\', \'lantitude\'],\r\n	    });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dvData_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	}\r\n	    mapLoad(func_${element.mid!\'\'});\r\n	</script>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/map.png', null, null, null, null, '0', null, 'map');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ea38620340', '漏斗图', null, 'report', null, '2018-02-14 09:25:01', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [\r\n					{ key: \'浏览网站\', value: 50000 },\r\n					{ key: \'放入购物车\', value: 35000 },\r\n					{ key: \'生成订单\', value: 25000 },\r\n					{ key: \'支付订单\', value: 15000 },\r\n					{ key: \'完成交易\', value: 8000 }\r\n				  ];		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/loudou.png', null, null, null, null, '0', null, 'funnel');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191eba2190341', '折线图', null, 'report', null, '2018-02-14 09:26:34', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n		var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/line.gif', null, null, null, null, '0', null, 'line');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ebf9ae0342', '柱形图', null, 'report', null, '2018-02-14 09:26:56', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段	\r\n		value: \'value\', // value字段\r\n	  });\r\n	  var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n\r\n\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/bar.gif', null, null, null, null, '0', null, 'histogram');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ec3c900343', '饼形图', null, 'report', null, '2018-02-14 09:27:13', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var field_${element.mid!\'\'}  = \"\";\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"key\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"${coltl.rename!coltl.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													field_${element.mid!\'\'}  = \'${coltl.rename!coltl.name!\'\'}\';\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ key: \'事例一\', count: 40 },\r\n			{ key: \'事例二\', count: 21 },\r\n			{ key: \'事例三\', count: 17 },\r\n			{ key: \'事例四\', count: 13 },\r\n			{ key: \'事例五\', count: 9 }\r\n		  ];\r\n		  var field_${element.mid!\'\'}  = \"count\";\r\n	</#if>\r\n		console.info(data_${element.mid!\'\'})\r\n		console.info(field_${element.mid!\'\'})\r\n		const { DataView } = DataSet;\r\n	  const dv_${element.mid!\'\'} = new DataView();\r\n	  dv_${element.mid!\'\'}.source(data_${element.mid!\'\'}).transform({\r\n		type: \'percent\',\r\n		field: field_${element.mid!\'\'},\r\n		dimension: \'key\',\r\n		as: \'value\'\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/pie.gif', null, null, null, null, '0', null, 'pie');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ec901f0344', '面积图', null, 'report', null, '2018-02-14 09:27:35', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>		\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>	\r\n	const { DataView } = DataSet;	\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	const dv_${element.mid!\'\'} = new DataView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });  \r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/area.gif', null, null, null, null, '0', null, 'area');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ed0e160345', '条形图', null, 'report', null, '2018-02-14 09:28:07', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	  const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n	  \r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/flat.gif', null, null, null, null, '0', null, 'bar');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ed46550346', '环形图', null, 'report', null, '2018-02-14 09:28:21', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var field_${element.mid!\'\'}  = \"\";\r\n	<#if reportData.row??>\r\n		<#list reportData.row.title as title>\r\n			<#if (title_index+1) == reportData.row.title?size>\r\n				<#list title as rowtl>	\r\n					var obj_${element.mid!\'\'} = new Object();\r\n					obj_${element.mid!\'\'}[\"item\"] = \'${rowtl.rename!rowtl.name!\'\'}\';\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if coltl_index == 0>	\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == 0>\r\n													obj_${element.mid!\'\'}[\"${coltl.rename!coltl.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													field_${element.mid!\'\'}  = \'${coltl.rename!coltl.name!\'\'}\';\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>									\r\n								</#if>																			\r\n							</#list>\r\n						</#list>\r\n					</#if>	\r\n					data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});		\r\n				</#list>										\r\n			</#if>\r\n		</#list>\r\n	</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ key: \'事例一\', count: 40 },\r\n			{ key: \'事例二\', count: 21 },\r\n			{ key: \'事例三\', count: 17 },\r\n			{ key: \'事例四\', count: 13 },\r\n			{ key: \'事例五\', count: 9 }\r\n		  ];\r\n		  var field_${element.mid!\'\'}  = \"count\";\r\n	</#if>\r\n		const { DataView } = DataSet;\r\n	  const dv_${element.mid!\'\'} = new DataView();\r\n	  dv_${element.mid!\'\'}.source(data_${element.mid!\'\'}).transform({\r\n		type: \'percent\',\r\n		field: field_${element.mid!\'\'},\r\n		dimension: \'key\',\r\n		as: \'value\'\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/hole.gif', null, null, null, null, '0', null, 'ring');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ed97a80347', '点状图', null, 'report', null, '2018-02-14 09:28:42', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#list title as rowtl>\r\n						var obj_${element.mid!\'\'} = new Object();\r\n						obj_${element.mid!\'\'}[\"_name\"] = \"${rowtl.rename!rowtl.name!\'\'}\";\r\n						<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n								<#if reportData?? && reportData.data??>\r\n									<#list reportData.data as values>\r\n										<#if rowtl_index == values_index>\r\n											<#list values as val>	\r\n												<#if coltl_index == val_index && val_index == 0>\r\n													obj_${element.mid!\'\'}[\'key\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n												<#if coltl_index == val_index && val_index == 1>\r\n													obj_${element.mid!\'\'}[\'value\'] = ${val.valueStyle!val.foramatValue!\'\'}\r\n												</#if>\r\n											</#list>\r\n										</#if>\r\n									</#list>\r\n								</#if>\r\n							</#list>\r\n						</#list>	\r\n						</#if>\r\n						data_${element.mid!\'\'}.push(obj_${element.mid!\'\'})						\r\n					</#list>			\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n		<#else>\r\n		const data_${element.mid!\'\'} = [{\"_name\":\"female\",\"key\":161.2,\"value\":51.6},{\"_name\":\"female\",\"key\":167.5,\"value\":59},{\"_name\":\"female\",\"key\":159.5,\"value\":49.2},{\"_name\":\"female\",\"key\":157,\"value\":63},{\"_name\":\"female\",\"key\":155.8,\"value\":53.6},{\"_name\":\"female\",\"key\":170,\"value\":59},{\"_name\":\"female\",\"key\":159.1,\"value\":47.6},{\"_name\":\"female\",\"key\":166,\"value\":69.8},{\"_name\":\"female\",\"key\":176.2,\"value\":66.8},{\"_name\":\"female\",\"key\":160.2,\"value\":75.2},{\"_name\":\"female\",\"key\":172.5,\"value\":55.2},{\"_name\":\"female\",\"key\":170.9,\"value\":54.2},{\"_name\":\"female\",\"key\":172.9,\"value\":62.5},{\"_name\":\"female\",\"key\":153.4,\"value\":42},{\"_name\":\"female\",\"key\":160,\"value\":50},{\"_name\":\"female\",\"key\":147.2,\"value\":49.8},{\"_name\":\"female\",\"key\":168.2,\"value\":49.2},{\"_name\":\"female\",\"key\":175,\"value\":73.2},{\"_name\":\"female\",\"key\":157,\"value\":47.8},{\"_name\":\"female\",\"key\":167.6,\"value\":68.8},{\"_name\":\"female\",\"key\":159.5,\"value\":50.6},{\"_name\":\"female\",\"key\":175,\"value\":82.5},{\"_name\":\"female\",\"key\":166.8,\"value\":57.2},{\"_name\":\"female\",\"key\":176.5,\"value\":87.8},{\"_name\":\"female\",\"key\":170.2,\"value\":72.8},{\"_name\":\"female\",\"key\":174,\"value\":54.5},{\"_name\":\"female\",\"key\":173,\"value\":59.8},{\"_name\":\"female\",\"key\":179.9,\"value\":67.3},{\"_name\":\"female\",\"key\":170.5,\"value\":67.8},{\"_name\":\"female\",\"key\":160,\"value\":47},{\"_name\":\"female\",\"key\":154.4,\"value\":46.2},{\"_name\":\"female\",\"key\":162,\"value\":55},{\"_name\":\"female\",\"key\":176.5,\"value\":83},{\"_name\":\"female\",\"key\":160,\"value\":54.4},{\"_name\":\"female\",\"key\":152,\"value\":45.8},{\"_name\":\"female\",\"key\":162.1,\"value\":53.6},{\"_name\":\"female\",\"key\":170,\"value\":73.2},{\"_name\":\"male\",\"key\":160.2,\"value\":52.1},{\"_name\":\"female\",\"key\":161.3,\"value\":67.9}]		\r\n		</#if>	\r\n	  const dv_${element.mid!\'\'} = data_${element.mid!\'\'};\r\n	var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/point.gif', null, null, null, null, '0', null, 'dotplot');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191edc7b50348', '雷达图', null, 'report', null, '2018-02-14 09:28:54', null, null,
        '	<script>\r\n	<#if reportData??>\r\n	var data_${element.mid!\'\'} = [];\r\n	var mea_${element.mid!\'\'} = [];\r\n		<#if reportData.row??>\r\n			<#list reportData.row.title as title>\r\n				<#if (title_index+1) == reportData.row.title?size>\r\n					<#if reportData.col??>\r\n						<#list reportData.col.title as coltlist>\r\n							<#list coltlist as coltl>\r\n									var obj_${element.mid!\'\'} = new Object();\r\n									obj_${element.mid!\'\'}[\"_name\"] = \"${coltl.rename!coltl.name!\'\'}\";\r\n									<#list title as rowtl2>							\r\n									<#if reportData?? && reportData.data??>\r\n										<#list reportData.data as values>\r\n											<#if rowtl2_index == values_index>\r\n												<#list values as val>	\r\n													<#if coltl_index == val_index>\r\n														obj_${element.mid!\'\'}[\"${rowtl2.rename!rowtl2.name!\'\'}\"] = ${val.valueStyle!val.foramatValue!\'\'}\r\n													</#if>\r\n												</#list>\r\n											</#if>\r\n										</#list>\r\n									</#if>\r\n									</#list>\r\n									data_${element.mid!\'\'}.push(obj_${element.mid!\'\'});						\r\n							</#list>\r\n						</#list>\r\n					</#if>\r\n					<#list title as rowtl>						\r\n						mea_${element.mid!\'\'}.push(\'${rowtl.rename!rowtl.name!\'\'}\');						\r\n					</#list>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n	<#else>\r\n		const data_${element.mid!\'\'} = [\r\n			{ _name:\'London\', \'Jan.\': 18.9, \'Feb.\': 28.8, \'Mar.\' :39.3, \'Apr.\': 81.4, \'May\': 47, \'Jun.\': 20.3, \'Jul.\': 24, \'Aug.\': 35.6 },\r\n			{ _name:\'Berlin\', \'Jan.\': 12.4, \'Feb.\': 23.2, \'Mar.\' :34.5, \'Apr.\': 99.7, \'May\': 52.6, \'Jun.\': 35.5, \'Jul.\': 37.4, \'Aug.\': 42.4}\r\n		  ];\r\n		const mea_${element.mid!\'\'} =  [ \'Jan.\',\'Feb.\',\'Mar.\',\'Apr.\',\'May\',\'Jun.\',\'Jul.\',\'Aug.\' ];\r\n	</#if>\r\n	const ds_${element.mid!\'\'} = new DataSet();\r\n	const dv_${element.mid!\'\'} = ds_${element.mid!\'\'}.createView().source(data_${element.mid!\'\'});\r\n	  dv_${element.mid!\'\'}.transform({\r\n		type: \'fold\',\r\n		fields: mea_${element.mid!\'\'}, // 展开字段集\r\n		key: \'key\', // key字段\r\n		value: \'value\', // value字段\r\n	  });\r\n	   var json_${element.mid!\'\'} =  $.parseJSON( $(\"#json_${element.mid!\'\'}\").text() );\r\n	  $(\"#json_${element.mid!\'\'}\").remove();\r\n	  ChartAction.renderChart(\'${element.mid!\'\'}\',dv_${element.mid!\'\'},json_${element.mid!\'\'})\r\n	</script>\r\n',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/radar.gif', null, null, null, null, '0', null, 'radar');
INSERT INTO `uk_templet`
VALUES ('4028811b6191e289016191ee589c0349', 'KPI图', null, 'report', null, '2018-02-14 09:29:32', null, null,
        '<div id=\"element_${reportModel.id!\'\'}\" class=\"r3-data-element\" style=\"min-width:100px;min-height:65px;\">\r\n\r\n    <#if reportModel.reportData?? && reportModel.reportData.data??>\r\n    	<#list reportModel.reportData.data as values>\r\n    		<#if values_index == 0>\r\n    			<#list values as value>\r\n    				<#if value_index ==0>\r\n    				<h1 class=\"no-margins\" <#if value.value lt 0>style=\"color:red;\"</#if>>\r\n                		${value.foramatValue!\'\'}\r\n                	</h1>\r\n                	<div class=\"stat-percent font-bold text-success\">\r\n                		<#if value.row?? && value.row.name?? && value.row.name!= \'root\' >${value.row.name!\'\'}</#if>\r\n                	</div>\r\n                	<small>\r\n                		<#if value.name??>${value.name!\'\'}</#if>\r\n                	</small>\r\n    				</#if>\r\n    			</#list>\r\n    		</#if>\r\n    	</#list>\r\n    </#if> 	\r\n</div>',
        '4028811b618d0dca01618d5a5fe6034a', '/images/design/kpi.png', null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b6418c59701641b65e21c075b', 'sff', null, 'ffff', null, '2018-06-20 12:13:39', null, null, 'asdfasdf',
        '4028811b6109050201610928ed6a030d', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b642af06f01642afa426804cd', '外部机器人输入参数', null, 'otheraiinput', null, '2018-06-23 12:50:01',
        null, null,
        '{\r\n	\"service_type\": \"query\",\r\n	\"data_type\": \"${chat.msgtype!\'text\'}\",\r\n	\"app_key\": \"gamutsoft\",\r\n	\"user_id\": \"${chat.userid!\'\'}\",\r\n	\"label\": \"\",\r\n	\"data\": \"${chat.message!\'\'}\",\r\n	\"timeout\": 10\r\n}',
        '4028811b642af06f01642af9cfa304c6', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b642af06f01642afaae4f04d3', '外部机器人输出参数', null, 'otheraioutputparam', null,
        '2018-06-23 12:50:29', null, null,
        '{\r\n\"msgtype\":\"${data.data_type!\'text\'}\"\r\n<#if data?? && data.candidates?? && data.candidates?size gt 0>\r\n	<#assign suggest = \"[\">\r\n	<#list data.candidates as item>\r\n		<#if suggest?length gt 1>\r\n			<#assign suggest = suggest + \",\">\r\n		</#if>\r\n		<#if item.question??>\r\n			<#assign suggest = suggest + \'{\"id\":\"\'+item.kbid+\'\",\"title\":\"\'+item.question + \'\"}\'>\r\n		</#if>\r\n	</#list>\r\n	<#assign suggest = suggest + \"]\">\r\n	,\"items\":${suggest}\r\n</#if>\r\n<#if data?? && data.data?? && data.data.answer??>\r\n	,\"message\":\"${data.data.answer!\'\'}\"\r\n<#elseif data?? && data.data?? && data.data.kbid??>\r\n	,\"id\":\"${data.data.kbid!\'\'}\"\r\n	,\"detail\":true\r\n<#else>\r\n	,\"message\":\"${data.message!\'\'}\"\r\n</#if>\r\n}',
        '4028811b642af06f01642af9cfaf04c7', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b644983b60164498da54a040f', '搜索输入接口', null, 'opsearh', null, '2018-06-29 11:19:37', null, null,
        '{\r\n	\"keyword\": \"${q!\'\'}\",\r\n	\"label\":\"\"\r\n}\r\n', '4028811b642af06f01642af9cfa304c6', null,
        null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b644983b60164498e06570416', '详情输入接口', null, 'oqrdetail', null, '2018-06-29 11:20:01', null, null,
        '{\r\n	\"kbid\": \"${id!\'\'}\",\r\n}', '4028811b642af06f01642af9cfa304c6', null, null, null, null, null,
        '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b644a2d2e01644a2ea6770400', '搜索输出接口', null, 'searchoutput', null, '2018-06-29 14:15:28', null,
        null,
        '[<#if data?? && data.data??><#list data.data as kb><#if kb_index gt 0>,</#if>\r\n{\r\n	\"id\":\"${kb.kbid!\'\'}\",\r\n	\"title\":\"${(kb.title!\'\')?replace(\'\\n\',\'\')}\"\r\n}</#list></#if>\r\n]',
        '4028811b642af06f01642af9cfaf04c7', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('4028811b644a2d2e01644a334a650422', '详情输出接口', null, 'detailinput', null, '2018-06-29 14:20:32', null,
        null,
        '<#if data?? && data.data??>\r\n{\r\n	\"id\":\"${data.data.kbid!\'\'}\",\r\n	\"title\":\"${(data.data.title!\'\')?replace(\'\\n\',\'\')}\",\r\n	\"content\":\"${((data.data.content!\'\')?replace(\'\\n\',\'\'))?replace(\'\"\' , \'\\\\\"\')}\"\r\n}</#if>',
        '4028811b642af06f01642af9cfaf04c7', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('402881e861da4c960161da74a89e0386', '报表XML模板', null, 'reportquery', null, '2018-02-28 11:28:53', null, null,
        '<?xml version=\'1.0\' ?>\r\n<Schema name=\'ukefu\'>\r\n    <#if !cube.modeltype?? || cube.modeltype!=\"1\">\r\n    <Cube name=\'${cube.name}\'>\r\n		<#if cube.sql?? && cube.sql?length gt 0>\r\n		<View alias=\'${cube.table}\'>\r\n                        <SQL>                              \r\n							${(cube.sql!\'\')?html}\r\n                        </SQL>\r\n                </View>\r\n		<#else>\r\n		<Table name=\'${cube.table}\' />\r\n                </#if>\r\n		\r\n		<#if reportModel.properties?? && reportModel.properties?size gt 0 >\r\n			<Dimension name=\'${reportModel.name}\'>\r\n				<Hierarchy hasAll=\'true\' allMemberName=\'\'>						\r\n					<#list reportModel.properties as property>\r\n						<#list cube.dimension as dimension>\r\n							<#list dimension.cubeLevel as level>\r\n							<#if property.dataid == level.id>\r\n							<Level name=\'${level.name}\'  column=\'${level.nameAlias}\' uniqueMembers=\'${level.uniquemembers?string}\'  <#if level.parameters??>${level.parameters!\"\"}</#if>>\r\n								<#if level.attribue?? && level.attribue?length gt 0>${level.attribue!\"\"}</#if>\r\n								</Level>	\r\n							</#if>						\r\n							</#list>	\r\n						</#list>					\r\n					</#list>			\r\n				</Hierarchy>\r\n			</Dimension>        \r\n		</#if>\r\n		<#if istable?? && istable && reportModel.colproperties?? && reportModel.colproperties?size gt 0>\r\n			<Dimension name=\'${reportModel.name}_col\'>\r\n				<Hierarchy hasAll=\'true\' allMemberName=\'\'>\r\n					<#if reportModel.colproperties??>\r\n					<#list reportModel.colproperties as property>\r\n						<#list cube.dimension as dimension>\r\n							<#list dimension.cubeLevel as level>\r\n							<#if property.dataid == level.id>\r\n							<Level name=\'${level.name}\'  column=\'${level.nameAlias}\' uniqueMembers=\'${level.uniquemembers?string}\'  <#if level.parameters??>${level.parameters!\"\"}</#if>>\r\n								<#if level.attribue?? && level.attribue?length gt 0>${level.attribue!\"\"}</#if>\r\n								</Level>	\r\n							</#if>						\r\n							</#list>	\r\n						</#list>					\r\n					</#list>\r\n					</#if>\r\n				</Hierarchy>\r\n			</Dimension>\r\n		</#if>\r\n\r\n		<#if cube.measure??>\r\n			<#list cube.measure as measure>				\r\n				<#if measure.calculatedmember != true>\r\n				<Measure name=\'${measure.name}\' <#if measure.attribue?? && measure.attribue?length gt 0><#else>column=\'${measure.nameAlias}\'</#if> aggregator=\'${measure.aggregator}\' <#if measure.formatstring != \'\'>formatString=\'${measure.formatstring!\"####\"}\'<#else>formatString=\'####\'</#if>>\r\n						<#if measure.attribue?? && measure.attribue?length gt 0>\r\n						${measure.attribue!\"\"}\r\n						</#if>\r\n				</Measure>\r\n				</#if>\r\n			</#list>\r\n        </#if>\r\n		\r\n\r\n		<#if cube.measure??>\r\n			<#list cube.measure as measure>				\r\n				<#if measure.calculatedmember == true>\r\n					<CalculatedMember name=\'${measure.name}\' dimension=\'Measures\' <#if measure.parameters??>${measure.parameters!\"\"}</#if> <#if measure.formatstring?? && measure.formatstring?length gt 0>formatString=\"${measure.formatstring!\"\"}\"</#if>>\r\n                             <#if measure.attribue?? && measure.attribue?length gt 0>${measure.attribue!\"\"}</#if>\r\n                        </CalculatedMember>\r\n				</#if>\r\n			</#list>\r\n		</#if>\r\n\r\n		</Cube>	\r\n	</#if>\r\n</Schema>\r\n',
        '402881e861da4c960161da7040bc0385', null, null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('402881e861da4c960161da74a89e0387', '过滤器XML模板', '', 'filterquery', '', '2018-02-28 11:28:53', '', null,
        '<?xml version=\'1.0\' ?>\r\n<Schema name=\'ukefu\'>\r\n    <Cube name=\'filterquery\'>\r\n		<#if sql?? && sql?length gt 0>\r\n		<View alias=\'filter\'>\r\n                        <SQL>                              \r\n							${(sql!\'\')?html}\r\n                        </SQL>\r\n                </View>\r\n		</#if>		\r\n		<Dimension name=\'KEYVAL\'>\r\n			<Hierarchy hasAll=\'true\' allMemberName=\'\'>						\r\n				<Level name=\'KEYVAL\'  column=\'KEYVAL\' uniqueMembers=\'\' />	\r\n				<Level name=\'VAL\'  column=\'VAL\' uniqueMembers=\'\' />						\r\n			</Hierarchy>\r\n		</Dimension>		\r\n		</Cube>	\r\n</Schema>\r\n',
        '402881e861da4c960161da7040bc0385', null, '', null, '', null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('402881fb62084b98016208652dea0393', '文本框', null, 'text', null, '2018-03-09 09:34:31', null, null,
        '<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n',
        '4028811b618d0dca01618d5a5ff6034b', '/images/design/table.png', null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('402881fb6208a81f016208b1f59d038e', '日期选择', null, 'date', null, '2018-03-09 10:58:23', null, null,
        '<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n',
        '4028811b618d0dca01618d5a5ff6034b', '/images/design/calendar.png', null, null, null, null, '0', null, null);
INSERT INTO `uk_templet`
VALUES ('402881fb6208a81f016208b2491e038f', '单选下拉', null, 'sigsel', null, '2018-03-09 10:58:44', null, null,
        '<#if filter?? && filter.modeltype == \'text\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_startvalue\" id=\"${filter.code!\'\'}_startvalue\"  class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if> >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 80px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\" id=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n		  </div>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\"  id=\"${filter.code!\'\'}\"  class=\"layui-input\" value=\"${filter.requestvalue!\'\'}\" <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>>\r\n		    </div>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'date\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n		<div class=\"layui-inline\" style=\"margin-right:0px;\">\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" class=\"layui-input\" value=\"${filter.requeststartvalue!\'\'}\" id=\"${filter.code!\'\'}_startvalue\" >\r\n		    </div>\r\n		    <div class=\"layui-form-mid\">-</div>\r\n		    <div class=\"layui-input-inline\" style=\"width: 98px;\">\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}_endvalue\"  class=\"layui-input\"  value=\"${filter.requestendvalue!\'\'}\" id=\"${filter.code!\'\'}_endvalue\" >\r\n		    </div>\r\n		  </div>\r\n		  <script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_startvalue\'),\r\n			   		  	value: \'${filter.startvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}_endvalue\'),\r\n			   		  	value: \'${filter.endvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		      <input type=\"text\" name=\"${filter.code!\'\'}\" id=\"${filter.code!\'\'}\"  class=\"layui-input\" >\r\n		    </div>\r\n		   	<script>\r\n			   	layui.use(\'laydate\', function(){\r\n			  	  	var laydate = layui.laydate;\r\n			  		laydate.render({ \r\n			   	  		elem: document.getElementById(\'${filter.code!\'\'}\'),\r\n			   		  	value: \'${filter.requestvalue!\'\'}\',\r\n			   		  	type:UKHelper.getLayDateType(\'${filter.formatstr!\'\'}\'),\r\n			   		 	format: \'${filter.formatstr!\'\'}\'\r\n			   		});\r\n			  	});\r\n		   	</script>\r\n	</#if>\r\n</#if>\r\n<#if filter?? && filter.modeltype == \'sigsel\'>\r\n	<#if filter.valuefiltertype ==\'range\'>\r\n	<#else>\r\n		<div class=\"layui-input-inline\" >\r\n		 	<select  <#if filter.mustvalue?? && filter.mustvalue==\'mustvalue\'>lay-verify=required</#if>  name=\"${filter.code!\'\'}\" lay-filter=${filter.code!\'\'} id=\"${filter.code!\'\'}\">\r\n				<option value=\"\" <#if !(filter.requestvalue??)>selected=selected</#if> >请选择</option>\r\n				  <#if  filter.reportData.col?? && filter.reportData.col.childeren ??>\r\n					<#list filter.reportData.col.childeren as val>\r\n		  				<option value=\"${val.name!\'\'}\" <#if filter.requestvalue == val.name>selected=selected</#if> ><#list val.childeren as key><#if key_index ==1>${key.name!\'\'}</#if></#list></option>\r\n			  		</#list>\r\n				  </#if>\r\n			</select>\r\n		 </div>\r\n		 <script>\r\n			layui.use(\'form\', function(){\r\n			  var form = layui.form;\r\n			  <#if filter?? && filter.childFilter??>\r\n			  form.on(\'select(${filter.code!\'\'})\', function(data){\r\n				  if($(\'#item_${filter.childFilter.code}\')){\r\n					  loadURL(\'/apps/report/design/filtervalchange.html?id=${filter.modelid}&fid=${filter.childFilter.id!\'\'}&publishedid=<#if publishedReport??>${publishedReport.id!\'\'}<#else></#if>&${filter.code!\'\'}=\'+data.value, \'#item_${filter.childFilter.code}\'); \r\n				  }\r\n			  });\r\n			  </#if>\r\n			  form.render();\r\n			});\r\n			</script>\r\n	</#if>\r\n</#if>\r\n',
        '4028811b618d0dca01618d5a5ff6034b', '/images/design/select.png', null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for uk_userevent
-- ----------------------------
DROP TABLE IF EXISTS `uk_userevent`;
CREATE TABLE `uk_userevent`
(
    `id`         varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
    `username`   varchar(32)          DEFAULT NULL COMMENT '用户名',
    `creater`    varchar(32)          DEFAULT NULL COMMENT '创建人ID',
    `maintype`   varchar(32)          DEFAULT NULL COMMENT 'Spring MVC注释分类',
    `subtype`    varchar(32)          DEFAULT NULL COMMENT '注释二级分类',
    `name`       varchar(32)          DEFAULT NULL COMMENT '名称',
    `admin`      tinyint(32)          DEFAULT NULL COMMENT '是否管理员',
    `accessnum`  tinyint(32)          DEFAULT NULL COMMENT '访问次数',
    `ip`         varchar(50)          DEFAULT NULL COMMENT 'IP',
    `hostname`   varchar(50)          DEFAULT NULL COMMENT '主机名',
    `country`    varchar(50)          DEFAULT NULL COMMENT '国家',
    `region`     varchar(50)          DEFAULT NULL COMMENT '区域',
    `city`       varchar(32)          DEFAULT NULL COMMENT '城市',
    `isp`        varchar(32)          DEFAULT NULL COMMENT '运营商',
    `province`   varchar(32)          DEFAULT NULL COMMENT '省份',
    `url`        text COMMENT '接入URL',
    `sessionid`  varchar(32)          DEFAULT NULL COMMENT '会话ID',
    `param`      text COMMENT '请求参数',
    `times`      int(11)              DEFAULT NULL COMMENT '访问次数',
    `createtime` datetime             DEFAULT NULL COMMENT '访问时间',
    `updatetime` datetime             DEFAULT NULL COMMENT '更新时间',
    `title`      varchar(255)         DEFAULT NULL COMMENT '页面标题',
    `ostype`     varchar(100)         DEFAULT NULL COMMENT '操作系统',
    `browser`    varchar(50)          DEFAULT NULL COMMENT '浏览器',
    `mobile`     varchar(10)          DEFAULT NULL COMMENT '移动端',
    `model`      varchar(10)          DEFAULT NULL COMMENT '组件',
    `appid`      varchar(32)          DEFAULT NULL COMMENT 'SNSID',
    `createdate` varchar(32)          DEFAULT NULL COMMENT '创建时间',
    `referer`    varchar(255)         DEFAULT NULL COMMENT '跳转URL',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='访客浏览记录表';

-- ----------------------------
-- Records of uk_userevent
-- ----------------------------
INSERT INTO `uk_userevent`
VALUES ('1196ebc9a21c4cceace80208ce4e5b78', 'guest_1psaak', 'abaef643981d4c4f9dc5a0243dc46780', 'send', 'point',
        'online', '0', '1', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '0', null, '内网IP', '内网IP', '0',
        'http://localhost:8035/testclient.html', 'abaef643981d4c4f9dc5a0243dc46780', '', '0', '2021-12-04 17:04:53',
        '2021-12-04 17:04:53', null, 'windows', 'Chrome', '0', 'webim', '104eac', '2021-12-04',
        'http://localhost:8035/testclient.html');

-- ----------------------------
-- Table structure for uk_userrole
-- ----------------------------
DROP TABLE IF EXISTS `uk_userrole`;
CREATE TABLE `uk_userrole`
(
    `id`         varchar(32) NOT NULL COMMENT '主键ID',
    `user_id`    varchar(32) DEFAULT NULL COMMENT '用户ID',
    `role_id`    varchar(32) DEFAULT NULL COMMENT '角色ID',
    `creater`    varchar(32) DEFAULT NULL COMMENT '创建人',
    `createtime` datetime    DEFAULT NULL COMMENT '创建时间',
    `organ`      varchar(32) DEFAULT NULL COMMENT '组织ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='用户角色';

-- ----------------------------
-- Records of uk_userrole
-- ----------------------------
INSERT INTO `uk_userrole`
VALUES ('402882977d84ad49017d84afb6bc0106', '2c9e80867d65eb5c017d65f68569006b', 'ff8080817d7f1444017d7f2211c60016',
        '4028cac3614cd2f901614cf8be1f0324', '2021-12-04 17:04:07', '2c9e80867d65eb5c017d65f17ceb0019');

-- ----------------------------
-- Table structure for uk_webim_monitor
-- ----------------------------
DROP TABLE IF EXISTS `uk_webim_monitor`;
CREATE TABLE `uk_webim_monitor`
(
    `ID`          varchar(50) NOT NULL COMMENT 'ID',
    `CREATETIME`  datetime    DEFAULT NULL COMMENT '记录创建时间',
    `AGENTS`      int(11)     DEFAULT NULL COMMENT '在线坐席数量',
    `USERS`       int(11)     DEFAULT NULL COMMENT '咨询中访客数量',
    `INQUENE`     int(11)     DEFAULT NULL COMMENT '排队访客数量',
    `BUSY`        int(11)     DEFAULT NULL COMMENT '示忙坐席数量',
    `TYPE`        varchar(32) DEFAULT NULL COMMENT '坐席类型',
    `DATESTR`     varchar(32) DEFAULT NULL COMMENT '日期字符串',
    `HOURSTR`     varchar(32) DEFAULT NULL COMMENT '小时字符串',
    `DATEHOURSTR` varchar(32) DEFAULT NULL COMMENT '日期小时字符串',
    `worktype`    varchar(50) DEFAULT NULL COMMENT '操作类型',
    `workresult`  varchar(50) DEFAULT NULL COMMENT '操作结果',
    `dataid`      varchar(50) DEFAULT NULL COMMENT '数据ID',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='坐席状态表';

-- ----------------------------
-- Records of uk_webim_monitor
-- ----------------------------

-- ----------------------------
-- Table structure for cs_passport_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `cs_passport_wechat_user`;
CREATE TABLE `cs_passport_wechat_user`
(
    `id`            varchar(32) NOT NULL COMMENT '主键ID',
    `snsid`         varchar(32)  DEFAULT NULL COMMENT 'SNSID',
    `subscribe`     tinyint(4)   DEFAULT NULL COMMENT '是否关注公众号',
    `openid`        varchar(100) DEFAULT NULL COMMENT 'OPENID',
    `nickname`      varchar(50)  DEFAULT NULL COMMENT '昵称',
    `sex`           varchar(50)  DEFAULT NULL COMMENT '性别',
    `language`      varchar(50)  DEFAULT NULL COMMENT '语言',
    `city`          varchar(50)  DEFAULT NULL COMMENT '城市',
    `province`      varchar(50)  DEFAULT NULL COMMENT '省份',
    `country`       varchar(50)  DEFAULT NULL COMMENT '国家',
    `headimgurl`    varchar(255) DEFAULT NULL COMMENT '头像',
    `subscribetime` varchar(32)  DEFAULT NULL COMMENT '关注时间',
    `unionid`       varchar(50)  DEFAULT NULL COMMENT '唯一ID',
    `sexid`         varchar(50)  DEFAULT NULL COMMENT '性别编码',
    `remark`        varchar(100) DEFAULT NULL COMMENT '签名',
    `groupid`       varchar(50)  DEFAULT NULL COMMENT '组ID',
    `contactsid`    varchar(32)  DEFAULT NULL COMMENT '联系人ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='微信用户信息';

-- ----------------------------
-- Records of cs_passport_wechat_user
-- ----------------------------

-- ----------------------------
-- Table structure for uk_work_monitor
-- ----------------------------
DROP TABLE IF EXISTS `uk_work_monitor`;
CREATE TABLE `uk_work_monitor`
(
    `ID`             varchar(50) NOT NULL COMMENT 'ID',
    `USERID`         varchar(50) DEFAULT NULL COMMENT '登录人ID',
    `AGENT`          varchar(50) DEFAULT NULL COMMENT '坐席工号',
    `USERNAME`       varchar(50) DEFAULT NULL COMMENT '坐席用户名（登录名）',
    `AGENTNO`        varchar(50) DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
    `NAME`           varchar(50) DEFAULT NULL COMMENT '坐席姓名',
    `CODE`           varchar(50) DEFAULT NULL COMMENT '坐席状态code（对应字典表里的CODE）',
    `STATUS`         varchar(50) DEFAULT NULL COMMENT '坐席当前状',
    `BUSY`           tinyint(4)  DEFAULT '0' COMMENT '坐席是否忙',
    `WORKSTATUS`     varchar(50) DEFAULT NULL COMMENT '坐席工作状态',
    `ORGI`           varchar(50) DEFAULT NULL COMMENT '租户ID',
    `AGENTSERVICEID` varchar(50) DEFAULT NULL COMMENT '会话ID',
    `SKILL`          varchar(50) DEFAULT NULL COMMENT '接入的技能组ID',
    `SKILLNAME`      varchar(50) DEFAULT NULL COMMENT '接入的技能组名称',
    `CREATETIME`     datetime    DEFAULT NULL COMMENT '记录创建时间',
    `ANI`            varchar(50) DEFAULT NULL COMMENT '主叫号码',
    `CALLED`         varchar(50) DEFAULT NULL COMMENT '被叫号码',
    `SOURCE`         varchar(50) DEFAULT NULL COMMENT '来源',
    `SERVICEID`      varchar(32) DEFAULT NULL COMMENT '服务记录ID',
    `SERVICESTATUS`  varchar(50) DEFAULT NULL COMMENT '当前呼叫状态',
    `DISCALLER`      varchar(50) DEFAULT NULL COMMENT '主叫分机号',
    `DISCALLED`      varchar(50) DEFAULT NULL COMMENT '被叫分机号',
    `ORGAN`          varchar(50) DEFAULT NULL COMMENT '所属组织机构ID',
    `BEGINTIME`      datetime    DEFAULT NULL COMMENT '状态开始时间',
    `ENDTIME`        datetime    DEFAULT NULL COMMENT '状态结束时间',
    `FIRSTSTATUS`    tinyint(4)  DEFAULT '0' COMMENT '当天首次时间',
    `DATESTR`        varchar(20) DEFAULT NULL COMMENT '日期字符串',
    `DURATION`       int(11)     DEFAULT NULL COMMENT '通话时长',
    `EVENTID`        varchar(50) DEFAULT NULL COMMENT '事件ID',
    `WORKTYPE`       varchar(32) DEFAULT NULL COMMENT '业务类型',
    `CALLENDTIME`    datetime    DEFAULT NULL COMMENT '结束呼叫事件',
    `CALLSTARTTIME`  datetime    DEFAULT NULL COMMENT '开始呼叫事件',
    `DIRECTION`      varchar(50) DEFAULT NULL COMMENT '呼叫方向',
    `EXTNO`          varchar(32) DEFAULT NULL COMMENT '分机号码',
    `ADMIN`          tinyint(4)  DEFAULT '0' COMMENT '是否管理员',
    `firsttime`      tinyint(4)  DEFAULT '0' COMMENT '是否首次就绪',
    `firsttimes`     int(11)     DEFAULT '0' COMMENT '首次就绪时长',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='坐席状态表';

-- ----------------------------
-- Records of uk_work_monitor
-- ----------------------------

-- ----------------------------
-- Table structure for uk_work_session
-- ----------------------------
DROP TABLE IF EXISTS `uk_work_session`;
CREATE TABLE `uk_work_session`
(
    `ID`             varchar(50) NOT NULL COMMENT 'ID',
    `USERID`         varchar(50)  DEFAULT NULL COMMENT '登录人ID',
    `AGENT`          varchar(50)  DEFAULT NULL COMMENT '坐席工号',
    `USERNAME`       varchar(50)  DEFAULT NULL COMMENT '坐席用户名（登录名）',
    `AGENTNO`        varchar(50)  DEFAULT NULL COMMENT '分机号（坐席登录的分机号码）',
    `NAME`           varchar(50)  DEFAULT NULL COMMENT '坐席姓名',
    `CODE`           varchar(50)  DEFAULT NULL COMMENT '坐席状态code（对应字典表里的CODE）',
    `STATUS`         varchar(50)  DEFAULT NULL COMMENT '坐席当前状',
    `BUSY`           tinyint(4)   DEFAULT '0' COMMENT '坐席是否忙',
    `WORKSTATUS`     varchar(50)  DEFAULT NULL COMMENT '坐席工作状态',
    `AGENTSERVICEID` varchar(50)  DEFAULT NULL COMMENT '会话ID',
    `SKILL`          varchar(50)  DEFAULT NULL COMMENT '接入的技能组ID',
    `SKILLNAME`      varchar(50)  DEFAULT NULL COMMENT '接入的技能组名称',
    `CREATETIME`     datetime     DEFAULT NULL COMMENT '记录创建时间',
    `ANI`            varchar(50)  DEFAULT NULL COMMENT '主叫号码',
    `CALLED`         varchar(50)  DEFAULT NULL COMMENT '被叫号码',
    `SOURCE`         varchar(50)  DEFAULT NULL COMMENT '来源',
    `SERVICEID`      varchar(32)  DEFAULT NULL COMMENT '服务记录ID',
    `SERVICESTATUS`  varchar(50)  DEFAULT NULL COMMENT '当前呼叫状态',
    `DISCALLER`      varchar(50)  DEFAULT NULL COMMENT '主叫分机号',
    `DISCALLED`      varchar(50)  DEFAULT NULL COMMENT '被叫分机号',
    `ORGAN`          varchar(50)  DEFAULT NULL COMMENT '所属组织机构ID',
    `BEGINTIME`      datetime     DEFAULT NULL COMMENT '状态开始时间',
    `ENDTIME`        datetime     DEFAULT NULL COMMENT '状态结束时间',
    `FIRSTSTATUS`    tinyint(4)   DEFAULT '0' COMMENT '当天首次时间',
    `DATESTR`        varchar(20)  DEFAULT NULL COMMENT '日期字符串',
    `DURATION`       int(11)      DEFAULT NULL COMMENT '通话时长',
    `IPADDR`         varchar(100) DEFAULT NULL COMMENT '通话时长',
    `HOSTNAME`       varchar(100) DEFAULT NULL COMMENT '通话时长',
    `ADMIN`          tinyint(4)   DEFAULT '0',
    `firsttime`      tinyint(4)   DEFAULT '0' COMMENT '是否首次就绪',
    `firsttimes`     int(11)      DEFAULT '0' COMMENT '首次就绪时长',
    `CLIENTID`       varchar(100) DEFAULT NULL COMMENT '客户端ID',
    `SESSIONID`      varchar(50)  DEFAULT NULL COMMENT '会话ID',
    `WORKTYPE`       varchar(32)  DEFAULT NULL COMMENT '业务类型',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='坐席状态表';

-- ----------------------------
-- Records of uk_work_session
-- ----------------------------