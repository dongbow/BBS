CREATE DATABASE bbs DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_backup
-- ----------------------------
DROP TABLE IF EXISTS `bbs_backup`;
CREATE TABLE `bbs_backup` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `url` varchar(300) NOT NULL COMMENT '文件地址',
  `uid` bigint(20) NOT NULL COMMENT '备份人id',
  `nickname` varchar(30) NOT NULL COMMENT '备份人昵称',
  `back_time` datetime NOT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='备份记录表';

-- ----------------------------
-- Records of bbs_backup
-- ----------------------------
INSERT INTO `bbs_backup` VALUES ('1481901337036', 'F:\\backup\\bbs\\20161216\\1481901336663.sql', '1268', 'Smart_咚咚', '2016-12-16 23:15:37');
INSERT INTO `bbs_backup` VALUES ('1481901422749', 'F:\\backup\\bbs\\20161216\\Javajishushequ.1481901422455.sql', '1268', 'Smart_咚咚', '2016-12-16 23:17:02');
INSERT INTO `bbs_backup` VALUES ('1481902178969', 'F:\\backup\\bbs\\20161216\\lalala.1481902178649.sql', '1268', 'Smart_咚咚', '2016-12-16 23:29:38');
INSERT INTO `bbs_backup` VALUES ('1481950754510', 'F:\\backup\\bbs\\20161217\\1481950754158.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:14');
INSERT INTO `bbs_backup` VALUES ('1481950760381', 'F:\\backup\\bbs\\20161217\\1481950760042.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:20');
INSERT INTO `bbs_backup` VALUES ('1481950766471', 'F:\\backup\\bbs\\20161217\\1481950766092.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:26');
INSERT INTO `bbs_backup` VALUES ('1481950778294', 'F:\\backup\\bbs\\20161217\\ rfdgezy.1481950777953.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:38');
INSERT INTO `bbs_backup` VALUES ('1481950787698', 'F:\\backup\\bbs\\20161217\\1481950787354.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:47');
INSERT INTO `bbs_backup` VALUES ('1481950798837', 'F:\\backup\\bbs\\20161217\\znsssssssssssssssssssssstgd.1481950798498.sql', '1268', 'Smart_咚咚', '2016-12-17 12:59:58');
INSERT INTO `bbs_backup` VALUES ('1481950838727', 'F:\\backup\\bbs\\20161217\\1481950838390.sql', '1268', 'Smart_咚咚', '2016-12-17 13:00:38');
INSERT INTO `bbs_backup` VALUES ('1481950859499', 'F:\\backup\\bbs\\20161217\\laji12306.1481950859118.sql', '1268', 'Smart_咚咚', '2016-12-17 13:00:59');
INSERT INTO `bbs_backup` VALUES ('1482160626080', 'F:\\backup\\bbs\\20161219\\1482160625473.sql', '1268', 'Smart_咚咚', '2016-12-19 23:17:06');
INSERT INTO `bbs_backup` VALUES ('1482326087052', 'F:\\backup\\bbs\\20161221\\1482326086318.sql', '1268', 'Smart_咚咚', '2016-12-21 21:14:47');
INSERT INTO `bbs_backup` VALUES ('1482501008759', 'F:\\backup\\bbs\\20161223\\ztree.1482501008314.sql', '1268', 'Smart_咚咚', '2016-12-23 21:50:08');
INSERT INTO `bbs_backup` VALUES ('1482655578977', 'F:\\backup\\bbs\\20161225\\1482655578505.sql', '1268', 'Smart_咚咚', '2016-12-25 16:46:18');
INSERT INTO `bbs_backup` VALUES ('1482755284105', 'F:\\backup\\bbs\\20161226\\exec.1482755283697.sql', '1268', 'Smart_咚咚', '2016-12-26 20:28:04');
INSERT INTO `bbs_backup` VALUES ('1482932890796', 'F:\\backup\\bbs\\20161228\\1482932881928.sql', '1268', 'Smart_咚咚', '2016-12-28 21:48:10');
INSERT INTO `bbs_backup` VALUES ('1483017979181', 'F:\\backup\\bbs\\20161229\\quartz.1483017977517.sql', '1268', 'Smart_咚咚', '2016-12-29 21:26:19');
INSERT INTO `bbs_backup` VALUES ('1483105681541', 'F:\\backup\\bbs\\20161230\\1483105680936.sql', '1268', 'Smart_咚咚', '2016-12-30 21:48:01');
INSERT INTO `bbs_backup` VALUES ('1483108016877', 'F:\\backup\\bbs\\20161230\\chart.1483108016363.sql', '1268', 'Smart_咚咚', '2016-12-30 22:26:56');
INSERT INTO `bbs_backup` VALUES ('1483268057212', 'F:\\backup\\bbs\\20170101\\1483268056260.sql', '1268', 'Smart_咚咚', '2017-01-01 18:54:17');
INSERT INTO `bbs_backup` VALUES ('1483283361434', 'F:\\backup\\bbs\\20170101\\1483283360828.sql', '99999', 'system', '2017-01-01 23:09:21');
INSERT INTO `bbs_backup` VALUES ('1483286400395', 'F:\\backup\\bbs\\20170102\\1483286400004.sql', '99999', 'system', '2017-01-02 00:00:00');
INSERT INTO `bbs_backup` VALUES ('1483372801706', 'F:\\backup\\bbs\\20170103\\1483372800059.sql', '99999', 'system', '2017-01-03 00:00:01');
INSERT INTO `bbs_backup` VALUES ('1483459205843', 'F:\\backup\\bbs\\20170104\\1483459200064.sql', '99999', 'system', '2017-01-04 00:00:05');
INSERT INTO `bbs_backup` VALUES ('1483536324070', 'F:\\backup\\bbs\\20170104\\1483536322707.sql', '99999', 'system', '2017-01-04 21:25:24');
INSERT INTO `bbs_backup` VALUES ('1483536367704', 'F:\\backup\\bbs\\20170104\\shenmegui.1483536366828.sql', '1268', 'Smart_咚咚', '2017-01-04 21:26:07');
INSERT INTO `bbs_backup` VALUES ('1483545600600', 'F:\\backup\\bbs\\20170105\\1483545600040.sql', '99999', 'system', '2017-01-05 00:00:00');

-- ----------------------------
-- Table structure for bbs_board
-- ----------------------------
DROP TABLE IF EXISTS `bbs_board`;
CREATE TABLE `bbs_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版块id',
  `nav_id` int(11) NOT NULL COMMENT '导航id，对应bbs_navigation表',
  `board_name` varchar(50) NOT NULL COMMENT '版块名字',
  `board_color` varchar(255) NOT NULL COMMENT '版块颜色',
  `board_desc` varchar(255) DEFAULT NULL COMMENT '板块描述',
  `board_status` int(11) NOT NULL DEFAULT '0' COMMENT '版块状态{0:正常，1：已删除}',
  `board_sort` int(11) NOT NULL COMMENT '板块排序',
  `board_manager` varchar(255) DEFAULT NULL COMMENT '版块版主id，多个以‘,’隔开',
  `board_is_open` int(11) NOT NULL DEFAULT '0' COMMENT '版块是否开放{0:开放，1：关闭}',
  `board_create_time` datetime NOT NULL COMMENT '创建时间',
  `is_access` int(11) NOT NULL DEFAULT '0' COMMENT '板块是否需要权限访问',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='论坛版块表';

-- ----------------------------
-- Records of bbs_board
-- ----------------------------
INSERT INTO `bbs_board` VALUES ('191', '47', 'JAVA SE', '#6bce8f', '入门开始，步步加强', '0', '1', '1280', '0', '2016-10-03 12:33:57', '0');
INSERT INTO `bbs_board` VALUES ('192', '47', 'JAVA Web', '#5fb5e8', '前端，后端，web相关技术', '0', '2', null, '0', '2016-10-03 12:34:51', '0');
INSERT INTO `bbs_board` VALUES ('193', '47', '中间件', '#f2bd56', '开发时用到的各类中间件', '0', '3', null, '0', '2016-10-03 12:35:55', '0');
INSERT INTO `bbs_board` VALUES ('194', '47', '企业级技术', '#508aeb', '高并发，分布式，云计算，大数据', '0', '4', '1280', '0', '2016-10-03 12:36:40', '0');
INSERT INTO `bbs_board` VALUES ('195', '47', '开源技术', '#6bce8f', '崇尚开源，共同进步', '0', '5', null, '0', '2016-10-03 12:37:27', '0');
INSERT INTO `bbs_board` VALUES ('196', '49', '系统维护', '#6bce8f', '日常使用，运维', '0', '1', null, '0', '2016-10-03 12:39:37', '0');
INSERT INTO `bbs_board` VALUES ('197', '49', '实用分享', '#5fb5e8', 'Linux相关的技术资料，实用软件', '0', '2', null, '0', '2016-10-03 12:42:40', '0');
INSERT INTO `bbs_board` VALUES ('198', '47', '实用分享', '#e94b3c', 'Java相关的技术资料，软件', '0', '6', null, '0', '2016-10-03 12:43:08', '0');
INSERT INTO `bbs_board` VALUES ('199', '50', '关系型数据库', '#6bce8f', 'Oracle，Mysql，Sql Server...', '0', '1', null, '0', '2016-10-03 12:44:32', '0');
INSERT INTO `bbs_board` VALUES ('200', '50', '非关系型数据库', '#5fb5e8', 'MongoDB，Redis...', '0', '2', null, '0', '2016-10-03 12:51:40', '0');
INSERT INTO `bbs_board` VALUES ('201', '50', '实用分享', '#f2bd56', '数据库相关资料软件分享', '0', '3', null, '0', '2016-10-03 12:52:20', '0');
INSERT INTO `bbs_board` VALUES ('202', '51', '随便聊聊', '#6bce8f', '谈未来，交朋友，共同畅想', '0', '1', null, '0', '2016-10-03 13:44:14', '0');
INSERT INTO `bbs_board` VALUES ('203', '51', '招聘信息', '#5fb5e8', '可能有你需要的招聘信息', '0', '2', null, '0', '2016-10-03 13:47:33', '0');
INSERT INTO `bbs_board` VALUES ('204', '52', '建议反馈', '#6bce8f', '你的建议，更好的论坛', '0', '1', null, '0', '2016-10-03 13:48:00', '0');
INSERT INTO `bbs_board` VALUES ('205', '52', '论坛事务', '#5fb5e8', '投诉举报，加精，申版...', '0', '2', null, '0', '2016-10-03 13:48:28', '0');
INSERT INTO `bbs_board` VALUES ('206', '52', '版主专区', '#f2bd56', '版主交流，共同努力', '0', '3', null, '0', '2016-10-03 13:48:56', '1');

-- ----------------------------
-- Table structure for bbs_board_classify
-- ----------------------------
DROP TABLE IF EXISTS `bbs_board_classify`;
CREATE TABLE `bbs_board_classify` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `board_id` int(11) NOT NULL COMMENT '版块id，对应bbs_board表',
  `nav_id` int(11) NOT NULL COMMENT '导航id，对应bbs_navigation表',
  `class_name` varchar(20) NOT NULL COMMENT '分类名字',
  `class_status` int(11) NOT NULL DEFAULT '0' COMMENT '分类状态{0：正常，1：已删除}',
  `class_color` varchar(20) NOT NULL COMMENT '分类颜色',
  `class_sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `class_topic_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '分类下主题数量',
  `class_create_time` datetime NOT NULL COMMENT '分类创建时间',
  `auth` int(11) NOT NULL DEFAULT '0' COMMENT '是否需要权限',
  PRIMARY KEY (`class_id`),
  KEY `index_classify_nav_id` (`nav_id`),
  KEY `index_classify_board_id` (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12326 DEFAULT CHARSET=utf8 COMMENT='版块中主题分类表';

-- ----------------------------
-- Records of bbs_board_classify
-- ----------------------------
INSERT INTO `bbs_board_classify` VALUES ('12306', '191', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:24:51', '1');
INSERT INTO `bbs_board_classify` VALUES ('12307', '192', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:25:51', '1');
INSERT INTO `bbs_board_classify` VALUES ('12308', '193', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:26:07', '1');
INSERT INTO `bbs_board_classify` VALUES ('12309', '194', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:26:23', '1');
INSERT INTO `bbs_board_classify` VALUES ('12310', '195', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:26:38', '1');
INSERT INTO `bbs_board_classify` VALUES ('12311', '198', '47', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:27:03', '1');
INSERT INTO `bbs_board_classify` VALUES ('12312', '196', '49', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:27:15', '1');
INSERT INTO `bbs_board_classify` VALUES ('12313', '197', '49', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:27:30', '1');
INSERT INTO `bbs_board_classify` VALUES ('12314', '199', '50', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:27:45', '1');
INSERT INTO `bbs_board_classify` VALUES ('12315', '200', '50', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:27:58', '1');
INSERT INTO `bbs_board_classify` VALUES ('12316', '201', '50', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:28:20', '1');
INSERT INTO `bbs_board_classify` VALUES ('12317', '202', '51', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:28:37', '1');
INSERT INTO `bbs_board_classify` VALUES ('12318', '203', '51', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:28:51', '1');
INSERT INTO `bbs_board_classify` VALUES ('12319', '204', '52', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:29:07', '1');
INSERT INTO `bbs_board_classify` VALUES ('12320', '205', '52', '重要公告', '0', '#e03731', '5', '0', '2016-10-03 18:29:24', '1');
INSERT INTO `bbs_board_classify` VALUES ('12321', '206', '52', '重要公告', '0', '#e03731', '0', '0', '2016-10-03 18:29:36', '1');
INSERT INTO `bbs_board_classify` VALUES ('12322', '205', '52', '版务申请', '0', '#508aeb', '1', '0', '2016-10-29 12:23:29', '0');
INSERT INTO `bbs_board_classify` VALUES ('12323', '205', '52', '账号申诉', '0', '#e9a63b', '2', '0', '2016-10-29 12:24:20', '0');
INSERT INTO `bbs_board_classify` VALUES ('12324', '205', '52', '开版申请', '0', '#28bc92', '3', '0', '2016-10-29 12:24:58', '0');
INSERT INTO `bbs_board_classify` VALUES ('12325', '205', '52', '封禁公告', '0', '#e03731', '4', '0', '2016-10-29 12:25:48', '1');

-- ----------------------------
-- Table structure for bbs_board_info
-- ----------------------------
DROP TABLE IF EXISTS `bbs_board_info`;
CREATE TABLE `bbs_board_info` (
  `board_id` int(11) NOT NULL COMMENT '版块id，对应bbs_board表',
  `board_click_count` int(11) NOT NULL DEFAULT '0' COMMENT '版块点击次数',
  `board_topic_count` int(11) NOT NULL DEFAULT '0' COMMENT '版块主题数',
  `board_reply_count` int(11) NOT NULL DEFAULT '0' COMMENT '版块回复数',
  `board_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '版块收藏数',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛版块信息表';

-- ----------------------------
-- Records of bbs_board_info
-- ----------------------------
INSERT INTO `bbs_board_info` VALUES ('191', '162', '0', '3', '0');
INSERT INTO `bbs_board_info` VALUES ('192', '710', '1', '3', '0');
INSERT INTO `bbs_board_info` VALUES ('193', '42', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('194', '43', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('195', '42', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('196', '58', '0', '1', '0');
INSERT INTO `bbs_board_info` VALUES ('197', '43', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('198', '43', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('199', '59', '1', '3', '0');
INSERT INTO `bbs_board_info` VALUES ('200', '125', '1', '6', '0');
INSERT INTO `bbs_board_info` VALUES ('201', '42', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('202', '44', '0', '0', '0');
INSERT INTO `bbs_board_info` VALUES ('203', '75', '1', '1', '0');
INSERT INTO `bbs_board_info` VALUES ('204', '192', '1', '0', '1');
INSERT INTO `bbs_board_info` VALUES ('205', '1340', '4', '20', '0');
INSERT INTO `bbs_board_info` VALUES ('206', '702', '1', '6', '0');

-- ----------------------------
-- Table structure for bbs_board_manage
-- ----------------------------
DROP TABLE IF EXISTS `bbs_board_manage`;
CREATE TABLE `bbs_board_manage` (
  `board_id` int(11) NOT NULL COMMENT '版块id, 关联bbs_board表',
  `user_id` bigint(20) NOT NULL COMMENT '版主id，关联user_access表',
  `nickname` varchar(30) NOT NULL COMMENT '版主昵称',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '版主状态{0：正常，1：已取消}',
  `create_time` datetime NOT NULL COMMENT '任命时间',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版块版主表';

-- ----------------------------
-- Records of bbs_board_manage
-- ----------------------------
INSERT INTO `bbs_board_manage` VALUES ('191', '1280', 'tonboyw', '0', '2016-10-21 22:33:57');
INSERT INTO `bbs_board_manage` VALUES ('194', '1280', 'tonboyw', '0', '2016-10-21 22:34:20');

-- ----------------------------
-- Table structure for bbs_count
-- ----------------------------
DROP TABLE IF EXISTS `bbs_count`;
CREATE TABLE `bbs_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `time` varchar(20) NOT NULL COMMENT '日期',
  `topic_count` bigint(20) NOT NULL COMMENT '今日帖子数量',
  `reply_count` bigint(20) NOT NULL COMMENT '今日回复数量',
  `user_sign_count` bigint(20) NOT NULL COMMENT '今日签到数量',
  `newuser_count` bigint(20) NOT NULL COMMENT '今日新用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='数据统计表';

-- ----------------------------
-- Records of bbs_count
-- ----------------------------
INSERT INTO `bbs_count` VALUES ('2', '2016-12-23', '23', '26', '5', '2');
INSERT INTO `bbs_count` VALUES ('3', '2016-12-24', '27', '34', '3', '1');
INSERT INTO `bbs_count` VALUES ('4', '2016-12-25', '23', '34', '2', '5');
INSERT INTO `bbs_count` VALUES ('5', '2016-12-26', '24', '23', '3', '1');
INSERT INTO `bbs_count` VALUES ('6', '2016-12-27', '34', '34', '2', '7');
INSERT INTO `bbs_count` VALUES ('7', '2016-12-28', '13', '45', '3', '1');
INSERT INTO `bbs_count` VALUES ('17', '2016-12-29', '12', '28', '3', '1');
INSERT INTO `bbs_count` VALUES ('18', '2016-12-30', '2', '9', '4', '0');
INSERT INTO `bbs_count` VALUES ('19', '2016-12-31', '0', '3', '3', '0');
INSERT INTO `bbs_count` VALUES ('20', '2017-01-01', '0', '0', '1', '0');
INSERT INTO `bbs_count` VALUES ('21', '2017-01-02', '2', '3', '5', '0');
INSERT INTO `bbs_count` VALUES ('22', '2017-01-03', '0', '0', '1', '0');
INSERT INTO `bbs_count` VALUES ('23', '2017-01-04', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for bbs_file
-- ----------------------------
DROP TABLE IF EXISTS `bbs_file`;
CREATE TABLE `bbs_file` (
  `uuid` varchar(50) NOT NULL COMMENT 'uuid',
  `file_name` varchar(255) NOT NULL COMMENT '名字',
  `file_link` varchar(1055) NOT NULL COMMENT '链接',
  `file_sign` int(11) NOT NULL DEFAULT '0' COMMENT '{1:图片,0:文件}',
  `file_type` varchar(30) NOT NULL COMMENT '文件类型',
  `file_size` bigint(20) NOT NULL COMMENT '文件大小',
  `down_count` bigint(20) DEFAULT NULL COMMENT '下载次数',
  `uid` bigint(20) NOT NULL COMMENT '上传人id',
  `nickname` varchar(30) NOT NULL COMMENT '上传人昵称',
  `upload_time` datetime NOT NULL COMMENT '创建时间',
  `upload_ip` varchar(50) NOT NULL COMMENT '上传ip',
  PRIMARY KEY (`uuid`),
  KEY `idx_file_sign` (`file_sign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of bbs_file
-- ----------------------------
INSERT INTO `bbs_file` VALUES ('021bd441-8c8b-4f57-a9ba-bd2d50171121', '1 (6).jpg', 'http://ofrjra54d.bkt.clouddn.com/c86cc355ab2848c398a3f5e8f2fb668a1481721843268.jpg', '0', 'jpg', '28166', '0', '1268', 'Smart_咚咚', '2016-12-14 21:24:03', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('03e14a58-c5f2-493b-bd42-7f3e31951c21', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/a331b4d06c63432f9be82cea85618b311481635324830.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2016-12-13 21:22:05', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('0a2f41fd-74dc-406c-89fa-f3602eb197d2', '362640.png', 'http://ofrjra54d.bkt.clouddn.com/21752625bf564123984eaadc92c330e01481635324754.png', '0', 'png', '776367', '0', '1268', 'Smart_咚咚', '2016-12-13 21:22:06', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('0ab42c4f-f71b-4d6f-bf06-57dbc7b846b1', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/27566099cd1f4d25b1e898c8ad9bb51d1483022083343.jpg', '0', 'jpg', '1587446', '0', '1279', 'tonboy', '2016-12-29 22:34:45', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('0d9db0c4-4a63-478f-b6a0-a5a3d3bed57b', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/05a570efba7a466fa0001753cc0504af1483336743762.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2017-01-02 13:59:05', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('0e24e5ed-ec63-42b8-9b19-54ccbba5ca50', '4.jpg', 'http://ofrjra54d.bkt.clouddn.com/d3775d621eee44448936456d24a3fdef1481718940765.jpg', '0', 'jpg', '25691', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('0fdf5c5f-5133-489d-9a1b-0d9da4616309', '362640.png', 'http://ofrjra54d.bkt.clouddn.com/4fca4ea1b7da4122b2d2a67a0662d05c1483367747250.png', '0', 'png', '776367', '0', '1268', 'Smart_咚咚', '2017-01-02 22:35:47', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('1026c5cc-977b-42d1-8140-42e9bec4d284', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/892594e009934210b44a95d89354e19a1481720044052.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:54:04', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('11b99120-ba05-4fb1-ab96-0db5372b72ad', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/357198ebf2a54078afd12bf7ecf4d39f1481720957580.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 21:09:17', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('1340a07d-39c3-4eee-a4a2-e6bcdc4aaa88', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/892bd1c826a34d3f9ede11ef4d7ade8f1481717162501.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:06:02', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('170a15eb-9b85-4020-a571-4452cfcbdb61', 'IMG_20140323_132312.jpg', 'http://ofrjra54d.bkt.clouddn.com/54199bc8b96f4126b923709bb032f0831482233597742.jpg', '0', 'jpg', '1044085', '0', '1268', 'Smart_咚咚', '2016-12-20 19:33:20', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('18d83a0b-d5c2-4af1-9ab6-df1bcd924017', '1 (8).jpg', 'http://ofrjra54d.bkt.clouddn.com/9a944198887249728e9df91f64241c591481718787411.jpg', '0', 'jpg', '34176', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('197f23a7-e4c0-4da2-94ae-a0b493c22faf', '1 (11).jpg', 'http://ofrjra54d.bkt.clouddn.com/f36a30cc638d4c7591a48d97aac57ceb1481721072848.jpg', '0', 'jpg', '29198', '0', '1268', 'Smart_咚咚', '2016-12-14 21:11:12', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('1baac164-e17c-44c5-b3ef-522a6f307796', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/dc13f342d7eb4668b0e261ac1cf536711483367787371.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2017-01-02 22:36:28', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('1c4a907f-6597-4885-86f6-78ca31d95f0f', '1 (9).jpg', 'http://ofrjra54d.bkt.clouddn.com/83f97000b8b54af78ceba907ecaa71331481721871051.jpg', '0', 'jpg', '27491', '0', '1268', 'Smart_咚咚', '2016-12-14 21:24:31', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('21832329-0e2c-43d6-a4a8-10f225a5926d', '1 (17).jpg', 'http://ofrjra54d.bkt.clouddn.com/24c1d532c43e441f84565eac8ed91fed1481720848202.jpg', '0', 'jpg', '32052', '0', '1268', 'Smart_咚咚', '2016-12-14 21:07:28', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('234db760-65d0-4dba-94fe-00d7fc0d7a2e', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/6cc860926af4468a93ce7d319053ebda1481889212450.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-16 19:53:32', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('2481f213-1a60-425d-a8c9-a64855ad9898', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/922bbb949ef249679c85038e88063b7e1481721755269.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 21:22:35', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('24b7cf40-b393-489b-a63e-0213555013f2', '1 (64).jpg', 'http://ofrjra54d.bkt.clouddn.com/a20e1072de0d4cc48d1a43534d0030cb1481719851351.jpg', '0', 'jpg', '30020', '0', '1268', 'Smart_咚咚', '2016-12-14 20:50:51', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('26fed174-102a-492d-81c0-fb38b22b17ab', '1 (16).jpg', 'http://ofrjra54d.bkt.clouddn.com/a49ddf6f543546bfafd5afd98693a8261481889070076.jpg', '0', 'jpg', '33970', '0', '1268', 'Smart_咚咚', '2016-12-16 19:51:29', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('2d791c90-2a27-4dfc-9541-ca257664c15b', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/72454453d5f64a75a9b29bd9ed50d4571481720512124.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2016-12-14 21:01:53', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('2f7fa2ef-b10b-44d5-bbc2-9b6024c41e83', '502058.jpg', 'http://ofrjra54d.bkt.clouddn.com/ef00fe68fb5e4570af0db298471f1c241481635324896.jpg', '0', 'jpg', '180459', '0', '1268', 'Smart_咚咚', '2016-12-13 21:22:05', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('35a033bb-6433-4341-9d65-d86aa2a3c57d', '1 (11).jpg', 'http://ofrjra54d.bkt.clouddn.com/90d0a3b79a764b64892377b78431780d1481718787584.jpg', '0', 'jpg', '29198', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('391d79e5-7a11-4558-a484-e1a9848714a1', 'top_200x200.jpg', 'http://ofrjra54d.bkt.clouddn.com/13c27b8a1e9b4426b0235df2affe67aa1481720686683.jpg', '0', 'jpg', '15931', '0', '1268', 'Smart_咚咚', '2016-12-14 21:04:46', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('3959b1ff-e553-4e79-b67f-b0250252e318', '手机展示效果图.jpg', 'http://ofrjra54d.bkt.clouddn.com/0b682962687f43cb8483527bb3aff9d51483367728652.jpg', '0', 'jpg', '306007', '0', '1268', 'Smart_咚咚', '2017-01-02 22:35:28', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('3b112afc-4b69-4c88-b665-55b2d8f73873', '6.jpg', 'http://ofrjra54d.bkt.clouddn.com/b0ef1a7f9c0c41908ff56ea03bd3e18a1481718940827.jpg', '0', 'jpg', '26637', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('3d69df21-5fbb-48a8-aa48-bd71d5a6e161', '1 (11).jpg', 'http://ofrjra54d.bkt.clouddn.com/e852206d63644e22add903f1cfc558921481717773756.jpg', '0', 'jpg', '29198', '0', '1268', 'Smart_咚咚', '2016-12-14 20:16:13', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('40f876fe-e2f7-4a17-a0a5-e06b5ab16bc9', '1 (4).jpg', 'http://ofrjra54d.bkt.clouddn.com/b66469a3909c44f5936c5fca889042371482070567832.jpg', '0', 'jpg', '32185', '0', '1279', 'tonboy', '2016-12-18 22:16:08', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('4353e27b-5ea8-4f3d-9402-85ecf97d42b2', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/c53cff84dd7e4217ad844a83b1bebe2f1481717232318.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:07:12', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('4df10616-2b09-4cfe-b3b2-46f8d6ac439d', '1 (72).jpg', 'http://ofrjra54d.bkt.clouddn.com/2fbc77ab81124ae2ba008008b0078b9d1481718940548.jpg', '0', 'jpg', '24894', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('4e3b2c44-e4b9-43ae-a87a-2ab739444df1', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2017-01-03 21:45:39', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('4e4a12f1-62f1-4366-9aeb-c823ec702dde', '2.jpg', 'http://ofrjra54d.bkt.clouddn.com/a376527972c34bb59f0e7abcf5e6292a1481718940599.jpg', '0', 'jpg', '27398', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('55c25bdb-5a4d-4936-92fa-bcfa7107db89', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/3e97460ebb2d4a3bb0a64725748530c71483449266614.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2017-01-03 21:14:31', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('5810a6cb-6c25-47e9-bc70-451e0ce6bf78', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/f8d2a6bc805c4d768c0475c0f610461a1481717331595.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:08:51', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('58ccb0b0-13b2-46d6-9259-e0929293f179', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/b820b9f478e94107abac85f26a0767181481719534667.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 20:45:34', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('5aa8b935-27e1-4960-815d-75b209cd75c1', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/56467c51406a442e8bb45f3e9baf98071481718787558.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('5ad222e8-abdc-4bb7-9bb6-fa1fdb342792', '584688.jpg', 'http://ofrjra54d.bkt.clouddn.com/53d727ad2e894aa59978ce9ba04eba9a1483111071754.jpg', '0', 'jpg', '180008', '0', '1268', 'Smart_咚咚', '2016-12-30 23:17:53', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('62ac9182-2c80-4521-b76f-014bfaf215a0', '1 (69).jpg', 'http://ofrjra54d.bkt.clouddn.com/3b40450b888e4bb1b15ef6796e9f2e491481718940535.jpg', '0', 'jpg', '28683', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('66f4169a-39e9-450d-b4f8-918209dc1cc2', '圣诞节.jpg', 'http://ofrjra54d.bkt.clouddn.com/a412765593a14662bef78f8d17070d141483363971460.jpg', '0', 'jpg', '769462', '0', '1268', 'Smart_咚咚', '2017-01-02 21:32:53', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('6aacf643-9d02-4a55-8302-5d39c11fa18e', '1 (68).jpg', 'http://ofrjra54d.bkt.clouddn.com/284c74d5f8224d428fb40ff1d8696f771481719851347.jpg', '0', 'jpg', '29782', '0', '1268', 'Smart_咚咚', '2016-12-14 20:50:51', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('6ffc9ff3-9773-45ba-a6f7-6aa43512826b', 'top_400x400.jpg', 'http://ofrjra54d.bkt.clouddn.com/6c49477a3e3a44e2a1df622322b468a71481720686704.jpg', '0', 'jpg', '60172', '0', '1268', 'Smart_咚咚', '2016-12-14 21:04:46', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('72a91d51-2c65-4dac-a6d0-d25960c61496', '362640.png', 'http://ofrjra54d.bkt.clouddn.com/8cce5376c766425f980a00e2abfa7c131481637551521.png', '0', 'png', '776367', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:15', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('73d56fb1-b25c-4ee5-bc15-5a56263b3af5', '1 (23).jpg', 'http://ofrjra54d.bkt.clouddn.com/e8d616baa19349999a189b6526f66b261481720848213.jpg', '0', 'jpg', '33812', '0', '1268', 'Smart_咚咚', '2016-12-14 21:07:28', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('78861932-fc66-49c2-b79e-778c057a39a7', '1 (11).jpg', 'http://ofrjra54d.bkt.clouddn.com/55f120665b4a47f8b66e445996e31c4c1481721720276.jpg', '0', 'jpg', '29198', '0', '1268', 'Smart_咚咚', '2016-12-14 21:22:00', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('7cb83ffd-7a2b-41db-8036-4ca0408613db', '580783.jpg', 'http://ofrjra54d.bkt.clouddn.com/baf7d079b89942f5b7c505f68ac65bb61481637552736.jpg', '0', 'jpg', '150716', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:13', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('7f95c675-7bcc-4c08-97c0-520f67cc3c22', '1 (6).jpg', 'http://ofrjra54d.bkt.clouddn.com/8d3d275f50724ab79a65a7e927d3f2391481718787382.jpg', '0', 'jpg', '28166', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('8535be4c-72ba-4a4e-a509-e83c3274e389', '1.jpg', 'http://ofrjra54d.bkt.clouddn.com/c52de8de51aa469099e588ce97c4a94d1481718940582.jpg', '0', 'jpg', '32665', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('8de2dc17-38be-4f49-9609-e3ba370d84bf', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/743b25da7229432ba9708a51d67b2ab91481717002472.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:03:22', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('8efe74b9-a74a-47f4-85b0-4c681bd56b37', '1 (76).jpg', 'http://ofrjra54d.bkt.clouddn.com/c7aab8f7377c4042823005a645d662d71481889174789.jpg', '0', 'jpg', '33112', '0', '1268', 'Smart_咚咚', '2016-12-16 19:52:54', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('8f3c3c10-235e-403a-96b8-5b0f378f0e52', '1 (9).jpg', 'http://ofrjra54d.bkt.clouddn.com/0359501a6da3407c88bbc5002500e3c51481718787423.jpg', '0', 'jpg', '27491', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('90c5fccf-f95c-4d2e-a98f-727b629a2e02', '1 (35).jpg', 'http://ofrjra54d.bkt.clouddn.com/1dd0cc8e47df49959668aca6c861c3f91483012693481.jpg', '0', 'jpg', '28607', '0', '1268', 'Smart_咚咚', '2016-12-29 19:58:15', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('92184a4b-ff46-4372-8cc3-33953ad6afd8', '1 (4).jpg', 'http://ofrjra54d.bkt.clouddn.com/fd639e01f1eb4970836b83a9e21601121481718787354.jpg', '0', 'jpg', '32185', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('9225cae8-f3c7-4b8e-870d-4283d6c54337', '1 (5).jpg', 'http://ofrjra54d.bkt.clouddn.com/67e7f9dd91ac4608ab5500236b6ff1e41481718787366.jpg', '0', 'jpg', '31514', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('925edcb5-b203-40c6-9fb1-901df7a26a87', '6 (2).jpg', 'http://ofrjra54d.bkt.clouddn.com/a82b15a637f94ee9a993aecba0d3c85d1481718940814.jpg', '0', 'jpg', '26262', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('95f4f81f-b385-4ed3-991f-08c22709c36c', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/2b0794a0ea4a44de8b7ebebc20f11c171481720033316.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2016-12-14 20:53:53', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('9b9574f3-8b04-438f-8bbe-3a505ee710cf', '1 (76).jpg', 'http://ofrjra54d.bkt.clouddn.com/3c68701829cd4efbbd138414fc9019a51481718940572.jpg', '0', 'jpg', '33112', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('9e12875e-8687-4a1e-8803-850184bb9feb', '1 (17).jpg', 'http://ofrjra54d.bkt.clouddn.com/66a3854a515c47eb8b0dbacdd3e548be1481888786940.jpg', '0', 'jpg', '32052', '0', '1268', 'Smart_咚咚', '2016-12-16 19:46:27', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a025704b-fcd5-4f3a-a5fd-01bb278626bb', '1 (27).jpg', 'http://ofrjra54d.bkt.clouddn.com/dd3283f4274e48408c6fdf76d9cb3c8e1481717850613.jpg', '0', 'jpg', '33374', '0', '1268', 'Smart_咚咚', '2016-12-14 20:17:30', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a19c21e2-868a-4383-8eb3-a49a870f35a6', '锁屏壁纸.png', 'http://ofrjra54d.bkt.clouddn.com/febd4129d82b4a42a4b8e953195ae2951483349399704.png', '0', 'png', '1262748', '0', '1268', 'Smart_咚咚', '2017-01-02 17:30:01', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a4ba2734-2ff5-4f69-bd2a-1d18bd1dac96', '165557.png', 'http://ofrjra54d.bkt.clouddn.com/bb5f3f53d1d2445f8f244072d0b11bfe1481637551086.png', '0', 'png', '804245', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a5960979-c061-4eb1-b630-fcf60fc3a275', '355287.jpg', 'http://ofrjra54d.bkt.clouddn.com/97ffe47c81044818afd82de5caa8ff0b1483022645879.jpg', '0', 'jpg', '135861', '0', '1279', 'tonboy', '2016-12-29 22:44:06', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a69614f2-9b00-4f22-a7fa-44c67080745b', '580783.jpg', 'http://ofrjra54d.bkt.clouddn.com/0abc0a22fddf43d1aa010a022fb3d68f1481720245010.jpg', '0', 'jpg', '150716', '0', '1268', 'Smart_咚咚', '2016-12-14 20:57:25', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a6ae72a3-48bb-4497-ae39-4ed1795c1f7a', '1 (4).jpg', 'http://ofrjra54d.bkt.clouddn.com/10d3d76f0fc6493a9823dda0f2a5839f1481717487100.jpg', '0', 'jpg', '32185', '0', '1268', 'Smart_咚咚', '2016-12-14 20:11:27', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('a92d9623-0c63-491a-a920-37671c341e81', '584688.jpg', 'http://ofrjra54d.bkt.clouddn.com/1e73de3b16c646568204d88182b31d861483347065703.jpg', '0', 'jpg', '180008', '0', '1268', 'Smart_咚咚', '2017-01-02 16:51:05', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('ac019904-a35a-47dd-82be-2dc5d276ee1b', '355287.jpg', 'http://ofrjra54d.bkt.clouddn.com/70c4f9ff6bde4f599f5ac8397de5174e1481637551199.jpg', '0', 'jpg', '135861', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:12', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('ad55415e-ed75-457a-8fda-d4a1d4c7a649', '584688.jpg', 'http://ofrjra54d.bkt.clouddn.com/89294f5b02c44efc8e3d311aa70216a61482327614834.jpg', '0', 'jpg', '180008', '0', '1285', 'test01', '2016-12-21 21:40:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('aea370e8-8d4b-44d7-96d8-8ef881821d52', 'IMG_20140805_163817.jpg', 'http://ofrjra54d.bkt.clouddn.com/1da3d5160a7b47008211cc2db8c374fa1482327198568.jpg', '0', 'jpg', '839075', '0', '1285', 'test01', '2016-12-21 21:33:20', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('af5895e5-605d-49e0-a08e-d33f6690015b', '584688.jpg', 'http://ofrjra54d.bkt.clouddn.com/c6a98f3d10d04af69fb413a95b76e81f1481720357059.jpg', '0', 'jpg', '180008', '0', '1268', 'Smart_咚咚', '2016-12-14 20:59:17', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b3ae93ea-a67a-4058-a444-c0359cf61696', '580783.jpg', 'http://ofrjra54d.bkt.clouddn.com/faa7d181e1134e08ba3b90b0ce99bbb21481716825719.jpg', '0', 'jpg', '150716', '0', '1268', 'Smart_咚咚', '2016-12-14 20:00:25', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b438f24e-19fc-47a0-919a-5367c41dfcdb', '1 (7).jpg', 'http://ofrjra54d.bkt.clouddn.com/b98f3effaa4e4b60b2ea8fd7edaeca441481718787396.jpg', '0', 'jpg', '28798', '0', '1268', 'Smart_咚咚', '2016-12-14 20:33:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b5ec90f2-cfc3-4bd8-b91a-948bb60749a7', '502058.jpg', 'http://ofrjra54d.bkt.clouddn.com/16931278100d43faaed052ddb70d8b0a1481637552681.jpg', '0', 'jpg', '180459', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:13', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b6b6b6b0-80ee-40fc-8a71-a5749398e727', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/0dcbb68429d1475ea3be7653bb531f641481717628284.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 20:13:48', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b8dc35cf-7898-46b5-9d72-11798b629d29', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/a32b42e70ec34b6397225b91fb0e75091481637551600.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:12', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('b938c357-b09d-48ae-b20b-54ff4883ee8a', '锁屏壁纸.png', 'http://ofrjra54d.bkt.clouddn.com/66017e6257d04882856eaf587c20186d1483347346633.png', '0', 'png', '1262748', '0', '1268', 'Smart_咚咚', '2017-01-02 16:55:48', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('bbe2cc30-b37b-48f6-a743-95ebe2ea0061', '锁屏壁纸.png', 'http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png', '0', 'png', '1262748', '0', '1268', 'Smart_咚咚', '2017-01-02 17:33:52', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('bc92e1bd-0b41-44d5-861e-f2f72fb803d7', '3.jpg', 'http://ofrjra54d.bkt.clouddn.com/2b9ac6cbd5ff4b5dbc640465d6e337cb1481718940610.jpg', '0', 'jpg', '28713', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('bd603542-d291-4616-96c8-f5650b970654', '355287.jpg', 'http://ofrjra54d.bkt.clouddn.com/0600d81093384975b199224259fc22551481716874324.jpg', '0', 'jpg', '135861', '0', '1268', 'Smart_咚咚', '2016-12-14 20:01:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('bdfe52f0-882f-43ff-afa5-eebc60198977', '5.jpg', 'http://ofrjra54d.bkt.clouddn.com/0203d7e8183447c1bb91220c852f18fd1481718940802.jpg', '0', 'jpg', '31120', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('c10c2c85-8056-4e32-a741-79a7bd881d58', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/f2126a7e50654277aedc3bc58f46903d1482656946681.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2016-12-25 17:09:07', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('c1cec0f2-1aa7-4df1-b90e-d1a88af00627', '502058.jpg', 'http://ofrjra54d.bkt.clouddn.com/5639408848654ab8a35edcfd559825ae1481716440511.jpg', '0', 'jpg', '180459', '0', '1268', 'Smart_咚咚', '2016-12-14 19:54:01', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('c1fb146a-c34b-44c5-b137-83a6e8e16418', '343211.jpg', 'http://ofrjra54d.bkt.clouddn.com/05cb2853d4cd4eb8849c1df3895fd3d11481717358564.jpg', '0', 'jpg', '182784', '0', '1268', 'Smart_咚咚', '2016-12-14 20:09:18', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('c4304de0-07c0-4112-afc9-b406bd6d8916', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/9b713a4503cd4b8d9df3cb026463814b1481721662775.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 21:21:02', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('d3e1b9e0-c49d-4103-807a-834e2cd708e6', '7.jpg', 'http://ofrjra54d.bkt.clouddn.com/fb1f9a4804b748eaacbe0f0b5f648d461481718940840.jpg', '0', 'jpg', '27252', '0', '1268', 'Smart_咚咚', '2016-12-14 20:35:40', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('dc61eadb-943e-4e7a-a809-03b843ff4911', '476368.jpg', 'http://ofrjra54d.bkt.clouddn.com/4b6cd054c37843479adefb702c86ccf61481717487076.jpg', '0', 'jpg', '204675', '0', '1268', 'Smart_咚咚', '2016-12-14 20:11:27', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('e38a660f-62ad-43bf-a562-bc979795b114', 'IMG_20140805_163702.jpg', 'http://ofrjra54d.bkt.clouddn.com/121d21716c924b7cbca03351ee40365f1483171211737.jpg', '0', 'jpg', '794582', '0', '1268', 'Smart_咚咚', '2016-12-31 16:00:12', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('e53769f2-7fde-4e2f-a56d-e33a7719c86d', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/a6f0470bb390465ab52076932249abeb1481637550750.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2016-12-13 21:59:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('e6097cb8-bcfc-486f-bdf9-d2f9bfa08fbf', '1 (17).jpg', 'http://ofrjra54d.bkt.clouddn.com/694af9402c2049dd92ff9f27a1cb943b1481889070091.jpg', '0', 'jpg', '32052', '0', '1268', 'Smart_咚咚', '2016-12-16 19:51:10', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('f3c49479-44cf-4d4a-9ed4-7e94b2b3ad96', '0.jpg', 'http://ofrjra54d.bkt.clouddn.com/2715c32b121247228e20a6f837c078211483347012701.jpg', '0', 'jpg', '1587446', '0', '1268', 'Smart_咚咚', '2017-01-02 16:50:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('f76ea3e6-9760-4659-b929-0f4793fa5ba5', '1 (16).jpg', 'http://ofrjra54d.bkt.clouddn.com/1e71f67e65064a99982e786d090568b21481720848199.jpg', '0', 'jpg', '33970', '0', '1268', 'Smart_咚咚', '2016-12-14 21:07:28', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('f99f7734-d46f-433f-ba7d-1493622486b7', '1 (10).jpg', 'http://ofrjra54d.bkt.clouddn.com/d36915223239460699fc3043917019c41481721734039.jpg', '0', 'jpg', '37056', '0', '1268', 'Smart_咚咚', '2016-12-14 21:22:14', '127.0.0.1');
INSERT INTO `bbs_file` VALUES ('fbb08f79-f5d2-43fd-affb-3b321c1721b6', '1 (6).jpg', 'http://ofrjra54d.bkt.clouddn.com/dab3ac385282455a97525c124e7c282d1481719828839.jpg', '0', 'jpg', '28166', '0', '1268', 'Smart_咚咚', '2016-12-14 20:50:28', '127.0.0.1');

-- ----------------------------
-- Table structure for bbs_file_down
-- ----------------------------
DROP TABLE IF EXISTS `bbs_file_down`;
CREATE TABLE `bbs_file_down` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uuid` varchar(50) NOT NULL COMMENT 'uuid',
  `uid` bigint(20) NOT NULL COMMENT '下载人id',
  `nickname` varchar(30) NOT NULL COMMENT '下载人昵称',
  `down_time` datetime NOT NULL COMMENT '下载时间',
  `ip` varchar(50) NOT NULL COMMENT '下载ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件下载历史表';

-- ----------------------------
-- Records of bbs_file_down
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_home_image
-- ----------------------------
DROP TABLE IF EXISTS `bbs_home_image`;
CREATE TABLE `bbs_home_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `home_title` varchar(255) NOT NULL COMMENT '图片对应标题',
  `home_link` varchar(255) NOT NULL COMMENT '图片对应链接',
  `home_img_link` varchar(255) NOT NULL COMMENT '图片存储的url',
  `home_sort` int(11) NOT NULL COMMENT '图片排序',
  `home_status` int(11) NOT NULL DEFAULT '0' COMMENT '图片状态{0:正常，1：已删除}',
  `home_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='首页滚动图表';

-- ----------------------------
-- Records of bbs_home_image
-- ----------------------------
INSERT INTO `bbs_home_image` VALUES ('1', '邓小平', '/', 'http://ofrjra54d.bkt.clouddn.com/788d2a8d95e546eb846353e66621c15e1478275398954.jpg', '3', '0', '2016-10-02 19:10:33');
INSERT INTO `bbs_home_image` VALUES ('2', '自由女神', '/', 'http://ofrjra54d.bkt.clouddn.com/4d6b7c1a88744142b51563bc117a63661478275367011.jpg', '2', '0', '2016-10-02 19:11:47');
INSERT INTO `bbs_home_image` VALUES ('3', 'FACEBOOK - 扎克伯格', '/', 'http://ofrjra54d.bkt.clouddn.com/056a17d8bb2a485c96f275bcacd1c9591478275408287.jpg', '1', '0', '2016-10-02 19:12:37');
INSERT INTO `bbs_home_image` VALUES ('4', 'Panda', 'http://oschina.net/', 'http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png', '4', '1', '2017-01-02 17:41:42');
INSERT INTO `bbs_home_image` VALUES ('5', 'tower', '/', 'http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg', '5', '0', '2017-01-03 21:45:45');
INSERT INTO `bbs_home_image` VALUES ('6', 'tower', '/', 'http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg', '5', '1', '2017-01-03 21:46:14');
INSERT INTO `bbs_home_image` VALUES ('7', 'tower', '/', 'http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg', '5', '1', '2017-01-03 21:54:24');

-- ----------------------------
-- Table structure for bbs_navigation
-- ----------------------------
DROP TABLE IF EXISTS `bbs_navigation`;
CREATE TABLE `bbs_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航id',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名字',
  `nav_desc` varchar(255) DEFAULT NULL COMMENT '导航描述',
  `nav_sort` int(11) NOT NULL COMMENT '导航排序',
  `nav_status` int(11) NOT NULL DEFAULT '0' COMMENT '导航状态{0:正常，1：已删除}',
  `nav_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='论坛导航栏表';

-- ----------------------------
-- Records of bbs_navigation
-- ----------------------------
INSERT INTO `bbs_navigation` VALUES ('47', 'JAVA专区', 'java', '1', '0', '2016-09-30 20:44:56');
INSERT INTO `bbs_navigation` VALUES ('49', 'Linux专区', 'linux', '3', '0', '2016-09-30 20:44:56');
INSERT INTO `bbs_navigation` VALUES ('50', '数据库', 'db', '4', '0', '2016-09-30 20:44:56');
INSERT INTO `bbs_navigation` VALUES ('51', '非技术区', '玩耍', '5', '0', '2016-09-30 20:44:56');
INSERT INTO `bbs_navigation` VALUES ('52', '站务专区', '管理', '6', '0', '2016-09-30 20:44:56');
INSERT INTO `bbs_navigation` VALUES ('53', '临时测', '测试十多个回复', '6', '1', '2017-01-05 21:50:36');
INSERT INTO `bbs_navigation` VALUES ('54', '临时2', 'sg', '7', '1', '2017-01-05 21:58:00');

-- ----------------------------
-- Table structure for bbs_quick_navigation
-- ----------------------------
DROP TABLE IF EXISTS `bbs_quick_navigation`;
CREATE TABLE `bbs_quick_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `quick_name` varchar(50) NOT NULL COMMENT '快速导航名字',
  `quick_link` varchar(255) NOT NULL COMMENT '快速导航链接',
  `quick_color` varchar(100) NOT NULL COMMENT '快速导航颜色',
  `quick_sort` int(11) NOT NULL COMMENT '快速导航排序',
  `quick_status` int(11) NOT NULL DEFAULT '0' COMMENT '快速导航状态{0:正常，1：已删除}',
  `quick_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='论坛快速导航表';

-- ----------------------------
-- Records of bbs_quick_navigation
-- ----------------------------
INSERT INTO `bbs_quick_navigation` VALUES ('1', 'Java Web', '/', '#2b2b2b', '1', '0', '2016-10-02 20:03:16');
INSERT INTO `bbs_quick_navigation` VALUES ('2', '设计模式', '/', '#2b2b2b', '2', '0', '2016-10-02 20:04:28');
INSERT INTO `bbs_quick_navigation` VALUES ('3', '建议反馈', '/', '#2b2b2b', '3', '0', '2016-10-02 20:04:53');
INSERT INTO `bbs_quick_navigation` VALUES ('4', '我要申精', '/', '#2b2b2b', '4', '0', '2016-10-02 20:05:13');
INSERT INTO `bbs_quick_navigation` VALUES ('5', '版主申请', '/', '#2b2b2b', '5', '0', '2016-10-02 20:05:30');
INSERT INTO `bbs_quick_navigation` VALUES ('6', '新人须知', '/', '#ef6935', '6', '0', '2016-10-02 20:06:06');
INSERT INTO `bbs_quick_navigation` VALUES ('7', '快速导航', '/', '#2b2b2b', '7', '0', '2017-01-02 18:26:06');
INSERT INTO `bbs_quick_navigation` VALUES ('8', '凑个整数', '/', '#2b2b2b', '8', '0', '2017-01-02 18:26:39');

-- ----------------------------
-- Table structure for bbs_recommend
-- ----------------------------
DROP TABLE IF EXISTS `bbs_recommend`;
CREATE TABLE `bbs_recommend` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `rc_name` varchar(255) NOT NULL COMMENT '名字',
  `rc_href` varchar(1055) NOT NULL COMMENT '链接',
  `rc_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除{1:删除,0:正常}',
  `rc_sort` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `location` int(11) NOT NULL COMMENT '位置',
  PRIMARY KEY (`rc_id`),
  KEY `idx_rc_status` (`rc_status`),
  KEY `idx_location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='社区推荐表';

-- ----------------------------
-- Records of bbs_recommend
-- ----------------------------
INSERT INTO `bbs_recommend` VALUES ('1', ' 随便测试', 'http://localhost:8080/bbs/board/192/topic/detail/1247', '0', '1', '2016-12-11 19:58:53', '1');
INSERT INTO `bbs_recommend` VALUES ('2', 'this is first topic', 'http://localhost:8080/bbs/board/191/topic/detail/1235', '0', '2', '2016-12-11 19:59:33', '1');
INSERT INTO `bbs_recommend` VALUES ('3', ' 测试单纯加精', 'http://localhost:8080/bbs/board/205/topic/detail/1237', '0', '3', '2016-12-11 20:00:08', '1');
INSERT INTO `bbs_recommend` VALUES ('4', ' 品味乌镇', 'http://localhost:8080/bbs/board/205/topic/detail/1246', '0', '1', '2016-12-11 20:00:55', '2');
INSERT INTO `bbs_recommend` VALUES ('5', 'qWAESRTYUPUYTWRYERTIYU', 'http://localhost:8080/bbs/board/204/topic/detail/1248', '0', '2', '2017-01-02 18:56:07', '2');
INSERT INTO `bbs_recommend` VALUES ('6', 'erstdyuiop[ldrtfgyuhijokp', 'http://localhost:8080/bbs/board/199/topic/detail/1257', '0', '4', '2017-01-02 19:06:04', '1');
INSERT INTO `bbs_recommend` VALUES ('7', 'JAVA SE', 'http://localhost:8080/bbs/navigation/47/board/191', '0', '4', '2017-01-02 20:21:56', '2');
INSERT INTO `bbs_recommend` VALUES ('8', '临时', '/', '1', '1', '2017-01-03 20:17:31', '1');
INSERT INTO `bbs_recommend` VALUES ('9', 'linshi2', '/', '1', '2', '2017-01-03 20:17:57', '2');

-- ----------------------------
-- Table structure for bbs_reply
-- ----------------------------
DROP TABLE IF EXISTS `bbs_reply`;
CREATE TABLE `bbs_reply` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id，关联user_access表',
  `topic_id` bigint(20) NOT NULL COMMENT '帖子id，关联bbs_topic表',
  `board_id` int(11) NOT NULL COMMENT '版块id,关联bbs_board表',
  `reply_parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父类回复',
  `reply_content` mediumtext NOT NULL COMMENT '回复内容',
  `reply_is_check` int(11) NOT NULL COMMENT '审核状态{0：待审核，1：审核通过，2：审核未通过}',
  `reply_status` int(11) NOT NULL DEFAULT '0' COMMENT '回复状态{0:正常，1：已删除}',
  `reply_update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人id,对应user_access表',
  `reply_update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `reply_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `reply_create_time` datetime NOT NULL COMMENT '创建时间',
  `reply_ip` varchar(30) NOT NULL COMMENT '创建ip',
  PRIMARY KEY (`reply_id`),
  KEY `idx_reply_user_id` (`user_id`),
  KEY `idx_reply_topic_id` (`topic_id`),
  KEY `idx_reply_board_id` (`board_id`),
  KEY `idx_reply_is_check` (`reply_is_check`),
  KEY `idx_reply_status` (`reply_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3661 DEFAULT CHARSET=utf8 COMMENT='论坛回复表';

-- ----------------------------
-- Records of bbs_reply
-- ----------------------------
INSERT INTO `bbs_reply` VALUES ('3562', '1279', '1236', '206', '0', 'package demo;&lt;br /&gt;\r\n&lt;br /&gt;\r\nimport java.io.BufferedReader;&lt;br /&gt;\r\nimport java.io.InputStreamReader;&lt;br /&gt;\r\nimport java.net.URL;&lt;br /&gt;\r\nimport java.util.concurrent.ExecutorService;&lt;br /&gt;\r\nimport java.util.concurrent.Executors;&lt;br /&gt;\r\n&lt;br /&gt;\r\npublic class HttpPressTest {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;public static void main(String[] args) {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;ExecutorService exec = Executors.newFixedThreadPool(30);&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;for (int index = 0; index &amp;lt; 1000000; index++) {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;final int NO = index;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;Runnable run = new Runnable() {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;public void run() {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;try {&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;long time1 = System.currentTimeMillis();&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;URL url = new URL(&amp;quot;http://localhost:8080/bbs/board/191/topic/detail/1235/1&amp;quot;);&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;InputStreamReader isr = new InputStreamReader(&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;url.openStream());&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;long time2 = System.currentTimeMillis();&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;System.out.print(&amp;quot;Thread &amp;quot; + NO + &amp;quot; time:&amp;quot;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;+ (time2 - time1) + &amp;quot;ms&amp;quot;);&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;BufferedReader br = new BufferedReader(isr);&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;String str;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;while ((str = br.readLine()) != null) {&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;System.out.println(str);&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;}&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;br.close();&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;isr.close();&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;} catch (Exception e) {&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;e.printStackTrace();&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;}&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;}&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;};&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;exec.execute(run);&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;}&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;// &eacute;&aring;&ordm;&ccedil;&ordm;&iquest;&ccedil;&uml;&aelig;&plusmn;&nbsp;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;exec.shutdown();&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;}&lt;br /&gt;\r\n&lt;br /&gt;\r\n}', '1', '1', '0', null, null, '2016-10-22 11:45:33', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3563', '1279', '1236', '206', '3562', '&lt;pre class=&quot;brush:java;toolbar:false;&quot;&gt;\r\npackage demo;\r\n\r\nimport java.io.BufferedReader;\r\nimport java.io.InputStreamReader;\r\nimport java.net.URL;\r\nimport java.util.concurrent.ExecutorService;\r\nimport java.util.concurrent.Executors;\r\n\r\npublic class HttpPressTest {\r\n\r\n    public static void main(String[] args) {\r\n\r\n        ExecutorService exec = Executors.newFixedThreadPool(30);\r\n\r\n        for (int index = 0; index &amp;lt; 1000000; index++) {\r\n\r\n            final int NO = index;\r\n\r\n            Runnable run = new Runnable() {\r\n\r\n                public void run() {\r\n\r\n                    try {\r\n                        long time1 = System.currentTimeMillis();\r\n                        URL url = new URL(&amp;quot;http://localhost:8080/bbs/board/191/topic/detail/1235/1&amp;quot;);\r\n                        InputStreamReader isr = new InputStreamReader(\r\n                                url.openStream());\r\n                        long time2 = System.currentTimeMillis();\r\n                        System.out.print(&amp;quot;Thread &amp;quot; + NO + &amp;quot; time:&amp;quot;\r\n                                + (time2 - time1) + &amp;quot;ms&amp;quot;);\r\n                        BufferedReader br = new BufferedReader(isr);\r\n                        String str;\r\n                        while ((str = br.readLine()) != null) {\r\n                            System.out.println(str);\r\n                        }\r\n                        br.close();\r\n                        isr.close();\r\n\r\n                    } catch (Exception e) {\r\n\r\n                        e.printStackTrace();\r\n\r\n                    }\r\n\r\n                }\r\n\r\n            };\r\n\r\n            exec.execute(run);\r\n\r\n        }\r\n\r\n        exec.shutdown();\r\n\r\n    }\r\n\r\n} &lt;/pre&gt;\r\n', '1', '0', '0', null, null, '2016-10-22 17:06:35', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3564', '1268', '1237', '205', '0', '&aelig;&micro;&egrave;&macr;&egrave;&macr;&egrave;&reg;&ordm;&aelig;&macr;&aring;&brvbar;&auml;&sup1;&auml;&sup1;&plusmn;&ccedil;&nbsp;&lt;img alt=&quot;&quot; src=&quot;/bbs/resources/static/ckeditor4/plugins/smiley/self/image027.png&quot; style=&quot;height:30px; width:30px&quot; title=&quot;&quot; /&gt;', '1', '0', '0', null, null, '2016-10-29 13:34:23', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3565', '1268', '1237', '205', '0', '会好吗', '1', '0', '0', null, null, '2016-10-29 13:40:30', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3566', '1268', '1237', '205', '0', 'what the fuck&lt;br /&gt;\r\n尼玛', '1', '0', '0', null, null, '2016-10-29 13:46:37', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3567', '1268', '1237', '205', '0', 'cao 居然因为BLOB', '1', '0', '0', null, null, '2016-10-29 13:52:40', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3568', '1268', '1237', '205', '0', '尼玛', '1', '0', '0', null, null, '2016-10-29 14:08:23', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3569', '1279', '1237', '205', '0', '6', '1', '0', '0', null, null, '2016-11-06 18:03:41', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3570', '1279', '1237', '205', '0', '7', '1', '0', '0', null, null, '2016-11-06 18:04:04', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3571', '1279', '1237', '205', '0', '8', '1', '0', '0', null, null, '2016-11-06 18:04:10', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3572', '1279', '1237', '205', '0', '9', '1', '0', '0', null, null, '2016-11-06 18:04:18', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3573', '1279', '1237', '205', '0', '10', '1', '0', '0', null, null, '2016-11-06 18:04:26', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3574', '1279', '1237', '205', '0', '11', '1', '0', '0', null, null, '2016-11-06 18:04:32', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3575', '1279', '1237', '205', '0', '12', '1', '0', '0', null, null, '2016-11-06 18:04:38', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3576', '1279', '1237', '205', '0', '13', '1', '0', '0', null, null, '2016-11-06 18:04:45', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3577', '1279', '1237', '205', '0', '14', '1', '0', '0', null, null, '2016-11-06 18:04:51', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3578', '1279', '1237', '205', '0', '15', '1', '0', '0', null, null, '2016-11-06 18:04:57', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3579', '1279', '1237', '205', '0', '16', '1', '0', '0', null, null, '2016-11-06 18:05:04', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3580', '1279', '1237', '205', '0', '17', '1', '0', '0', null, null, '2016-11-06 18:05:16', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3581', '1279', '1244', '200', '0', 'twyretyuik', '1', '0', '0', null, null, '2016-11-11 20:47:26', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3582', '1279', '1244', '200', '0', 'fdrgthyjukio', '1', '0', '0', null, null, '2016-11-11 20:47:55', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3583', '1279', '1240', '205', '0', '啊无色的日常通风与干部和你急', '1', '0', '0', null, null, '2016-11-12 00:02:57', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3584', '1279', '1241', '205', '0', 'afsgdfgh', '1', '0', '0', null, null, '2016-11-12 20:44:09', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3585', '1279', '1244', '200', '3581', 'child?', '1', '0', '0', null, null, '2016-11-12 22:14:48', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3586', '1279', '1244', '200', '3585', 'wrzextrcytvbkhnl', '1', '0', '0', null, null, '2016-11-12 22:45:49', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3587', '1279', '1244', '200', '0', 'WZexrctvyu,jmhngbfvsdc#Q64a7s', '1', '0', '0', null, null, '2016-11-12 22:51:21', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3588', '1280', '1245', '206', '0', 'w4e5rf6gyhu', '1', '0', '0', null, null, '2016-11-13 16:12:05', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3589', '1279', '1242', '205', '0', '&amp;lt;script type=&amp;#39;text/javascript&amp;#39;&amp;gt;&lt;br /&gt;\r\n$(document).alert(dunction(){alert(1)});&lt;br /&gt;\r\n&amp;lt;/script&amp;gt;', '1', '0', '0', null, null, '2016-11-14 12:14:46', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3590', '1279', '1242', '205', '0', '&lt;br /&gt;\r\n$(document).alert(function(){alert(1)});', '1', '0', '0', null, null, '2016-11-14 12:16:05', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3591', '1279', '1242', '205', '3589', '$(document).alert(function(){alert(1)})', '1', '0', '0', null, null, '2016-11-14 12:18:13', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3598', '1285', '1242', '205', '0', 'afesdhgfchbj', '1', '0', '0', null, null, '2016-11-17 20:23:35', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3599', '1285', '1242', '205', '0', 'gdf', '1', '0', '0', null, null, '2016-11-17 20:29:59', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3600', '1279', '1242', '205', '3599', 'dfg', '1', '0', '0', null, null, '2016-11-17 20:36:20', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3601', '1279', '1242', '205', '0', 'sdvb', '1', '0', '0', null, null, '2016-11-17 20:37:45', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3602', '1279', '1242', '205', '3601', 'simple reply', '1', '0', '0', null, null, '2016-11-19 21:23:46', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3603', '1268', '1236', '206', '0', 'dsff', '1', '0', '0', null, null, '2016-11-30 19:00:08', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3604', '1280', '1237', '205', '0', 'dasfghfgkj', '1', '0', '0', null, null, '2016-11-30 21:21:47', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3605', '1279', '1244', '200', '0', '&lt;pre class=&quot;best-text mb-10&quot;&gt;\r\n$(&amp;#39;#id&amp;#39;).siblings()   当前元素所有的兄弟节点\r\n$(&amp;#39;#id&amp;#39;).prev()       当前元素前一个兄弟节点\r\n$(&amp;#39;#id&amp;#39;).prevaAll()   当前元素之前所有的兄弟节点\r\n$(&amp;#39;#id&amp;#39;).next()       当前元素之后第一个兄弟节点\r\n$(&amp;#39;#id&amp;#39;).nextAll()    当前元素之后所有的兄弟节点&lt;/pre&gt;\r\n', '1', '0', '0', null, null, '2016-11-30 23:15:53', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3606', '1279', '1244', '200', '3605', '&lt;pre class=&quot;brush:java;toolbar:false;&quot;&gt;\r\n$(&amp;#39;#id&amp;#39;).siblings()   当前元素所有的兄弟节点\r\n$(&amp;#39;#id&amp;#39;).prev()       当前元素前一个兄弟节点\r\n$(&amp;#39;#id&amp;#39;).prevaAll()   当前元素之前所有的兄弟节点\r\n$(&amp;#39;#id&amp;#39;).next()       当前元素之后第一个兄弟节点\r\n$(&amp;#39;#id&amp;#39;).nextAll()    当前元素之后所有的兄弟节点&lt;/pre&gt;\r\n', '1', '0', '0', null, null, '2016-11-30 23:16:29', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3607', '1279', '1246', '205', '0', '品味乌镇&lt;br /&gt;\r\n很早之前，我就特别向往&lt;a href=&quot;http://jiangnan.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;江南&lt;/a&gt;水乡。这种向往，缘于那些耳熟能详的唐诗宋词，譬如白居易的《忆江南》、韦庄的《菩萨蛮&amp;bull;人人尽说江南好》、王琪的《望江南&amp;bull;忆江南》等等。&lt;br /&gt;\r\n江南何以美，美得令当年的乾隆爷七下游历？美得令无数&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文人&lt;/a&gt;墨客百般赞叹？今年深秋里的一天，在杭州&lt;a href=&quot;http://www.sanwen.net/gongzuozongjie.html&quot; target=&quot;_blank&quot;&gt;工作&lt;/a&gt;的女儿、准女婿及其&lt;a href=&quot;http://xiaojing.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;父母&lt;/a&gt;陪着我和内人一同驱车前往乌镇游逛，让我解开了这个疑惑。&lt;br /&gt;\r\n江南水乡的缩影&lt;br /&gt;\r\n人们都说，乌镇是江南水乡的一张绮丽的名片。水乡的特色，无论是在&lt;a href=&quot;http://www.sanwen.net/suibi/shenghuo/&quot; target=&quot;_blank&quot;&gt;生活&lt;/a&gt;、&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文化&lt;/a&gt;，还是建筑、物产等方面的，在乌镇都能感受得到。&lt;br /&gt;\r\n乌镇位于嘉兴的桐乡市，离杭州不远，本来只需大约两个钟头的车程，因为迷路我们中午时分才抵达，不过这丝毫没有影响我的情绪。( &lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文章&lt;/a&gt;&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;阅读&lt;/a&gt;网：www.sanwen.net )&lt;br /&gt;\r\n乌镇分东南西北四栅，但景区分布在东栅和西栅。东栅有茅盾故居、余榴梁钱币馆、江南百床馆等20多个景点。西栅毗邻古老的京杭大运河，面积比东栅大得多，其12座小岛被小桥串连在一起，风光甚是秀美。&lt;br /&gt;\r\n一下车，首先映入眼帘的是一座上书&amp;ldquo;乌镇&amp;rdquo;两个大字的仿古大门楼。匆匆用过午餐后，我们便迫不及待的向景区进发。&lt;br /&gt;\r\n我们一行漫步在东栅的石板街巷之间，观赏那一草一木、一砖一瓦，追寻沧桑&lt;a href=&quot;http://www.sanwen.net/suibi/suiyue/&quot; target=&quot;_blank&quot;&gt;岁月&lt;/a&gt;嬗递所留下的痕迹。但见桥街相连，曲径通幽，水乡特性十分鲜明。在一间古宅的门口，我见到一位神态从容的耄耋老者悠然自得的坐在旁边的凳子上看书，我向他问安，与他攀谈，他告诉我：这里就都是些老的东西，老河、老街、老屋、老人。&lt;br /&gt;\r\n江南水乡真可谓江河湖泊星罗棋布，水网纵横，水城田野如诗如画，园林幽径魅力无穷。这里非但风景美不胜收，历来也是神州大地最为富足的鱼米之乡、丝绸之府，无可置疑的&amp;ldquo;人间&lt;a href=&quot;http://tiantang.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;天堂&lt;/a&gt;&amp;rdquo;。&lt;br /&gt;\r\n枕河人家的水阁&lt;br /&gt;\r\n水是水乡的活力与灵性之所在，乌镇亦然。一条起码已流淌6000年的小河蜿蜒贯穿全镇，镇上以水为街，以岸为市，两岸阁楼临水而立。&lt;br /&gt;\r\n乌镇沿河民居皆为匠心独具的&amp;ldquo;水阁&amp;rdquo;。房子大多是二层楼房，有一部分延伸至河面，下面用石柱或木桩竖于河底擎托着，上面架横梁搁木板做成木屋。扇窗推开，宛若像框。水阁宅前屋后，皆通河道；岸植垂柳，铺以石栏；门前河面，俱覆石阶。水阁上面居住，下面停船。他们充分利用多变的地形，使流水在房屋之间通畅。&lt;br /&gt;\r\n乌镇几乎&amp;ldquo;家家门外泊舟航&amp;rdquo;，船是人们渡河和捕鱼、驮载必不可少的工具，即便是在今日它甚至比汽车还实用。&lt;br /&gt;\r\n身临这种&amp;ldquo;枕河人家&amp;rdquo;，使我不禁想起茅盾在《大地山河》中对&lt;a href=&quot;http://www.sanwen.net/sanwen/guxiang/&quot; target=&quot;_blank&quot;&gt;故乡&lt;/a&gt;的描述。那一幢幢水阁亭亭玉立，被碧波托起犹如出水白莲。&amp;ldquo;人在屋中居，屋在水中游&amp;rdquo;&amp;ldquo;楼台俯舟楫&amp;rdquo;&amp;ldquo;白墙青瓦水中映&amp;rdquo;的景观，实在是别有情趣。我想，闲暇时与三二好友来此度假，在水阁中喝茶聊天，或观看蓬船，或垂钓赏鱼，该有多惬意。&lt;br /&gt;\r\n无所不在的石桥&lt;br /&gt;\r\n乌镇素有百步一桥之说，古色古香的石桥是其一大特色。据悉，其桥梁最多时达150多座，时下经修复、重建的古桥，仅西栅就有72座。乌镇河流密度和石桥数量均为全国古镇之最，堪称古桥博物馆。&lt;br /&gt;\r\n这些石桥把被水道分隔的巷子都连接在一起，使得水乡的交通十分便利。同时，这些各式各样或拱或平的石桥也成了颇值欣赏的艺术品。&amp;ldquo;桥里桥&amp;rdquo;当是乌镇最为著名的两座石桥了。东西走向的&amp;ldquo;通济桥&amp;rdquo;与南北走向的&amp;ldquo;仁济桥&amp;rdquo;直角相连，互为犄角，交相辉映，迷离而清雅。在&amp;ldquo;通济桥&amp;rdquo;上的两副对联也是特有韵味的，一联曰：&amp;ldquo;寒树烟中，尽乌戍六朝旧地；&lt;a href=&quot;http://www.sanwen8.cn/subject/80878/&quot; target=&quot;_blank&quot;&gt;夕阳&lt;/a&gt;帆外，是吴兴几点远山。&amp;rdquo;另一联是：&amp;ldquo;通霅门开数万家，西环浙水；题桥人至三千里，北望燕京。&amp;rdquo;其联意不仅交代了古桥的历史地理环境，又表达了乌镇人志高心远的胸怀。&lt;br /&gt;\r\n其实，乌镇的石桥除了普遍都有耐人寻味的对联外，其装饰也都具有高雅的格调。很多桥的望柱、栏板上都雕有&lt;a href=&quot;http://www.sanwen8.cn/sanwen/jingmei/&quot; target=&quot;_blank&quot;&gt;精美&lt;/a&gt;的图案，有莲花图案、六道轮回图案、万字图案等，给古桥增添了不少韵致，也蕴涵了古镇人们的宗教习俗以及祈祷吉祥平安的&lt;a href=&quot;http://www.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;美好&lt;/a&gt;愿望。&lt;br /&gt;\r\n我看到，在一些石桥上还建有亭阁，如昭明书院西侧的&lt;a href=&quot;http://www.sanwen.net/sanwen/yu/&quot; target=&quot;_blank&quot;&gt;雨&lt;/a&gt;读桥。桥阁能遮阳避雨，桥侧护栏可供人们凭栏观赏水上风光。&lt;br /&gt;\r\n煦育名流的摇篮&lt;br /&gt;\r\n提起&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文学&lt;/a&gt;巨匠茅盾，我不由地肃然起敬。先生的故居和纪念馆就坐落在观前街上。随着人流，我们轻步入内。故居是江浙一带常见的传统木构架民居建筑，处处散发着世代书香特有的逸雅之气。抚着先生的铜像，看着先生幼年时使用过的文物，感受着先生&lt;a href=&quot;http://cengjing.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;曾经&lt;/a&gt;生活过的气息，我无限欣慨。在一丛先生亲自栽种的&amp;ldquo;南天竹&amp;rdquo;前，女儿给我拍照留念。呵呵！我有时发表拙作就&lt;a href=&quot;http://www.sanwen8.cn/sanwen/love/&quot; target=&quot;_blank&quot;&gt;爱&lt;/a&gt;以&amp;ldquo;南天竹&amp;rdquo;为笔名呢，巧合了。&lt;br /&gt;\r\n这里还是中国最早的镇志编撰者沈平、著名理学家张杨园等名流的出生地。南朝梁代的昭明太子萧统，也曾在此寓居多年并编撰了被史学界誉为堪比《诗经》《楚辞》的《昭明文选》。据说，小小乌镇在古代先后出过数百贡生、数百举人、近百进士，近、&lt;a href=&quot;http://www.sanwen.net/shige/xiandai/&quot; target=&quot;_blank&quot;&gt;现代&lt;/a&gt;更出有众多政治家、银行家、农学家、文化学者等等。这些胸怀博大天资聪慧的水乡&lt;a href=&quot;http://www.sanwen.net/jingdian/mingyan/&quot; target=&quot;_blank&quot;&gt;名人&lt;/a&gt;大家，在中国乃至世界历史上书写了诸多浓彩重墨。&lt;br /&gt;\r\n&amp;ldquo;紫燕剪&lt;a href=&quot;http://chuntian.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;春&lt;/a&gt;雨，丝竹弄管弦&amp;rdquo;的江南，毓秀钟灵的水乡，可真是&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;人文&lt;/a&gt;荟萃啊！&lt;br /&gt;\r\n独特有趣的民俗&lt;br /&gt;\r\n乌镇除了华&lt;a href=&quot;http://xiatian.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;夏&lt;/a&gt;民族共有的那些传统习俗外，还有元宵走桥、立夏称人、分龙彩雨、天贶晒虫、中元河灯等众多独特的民俗。&lt;br /&gt;\r\n我们来的不是时候，这些活动都无缘欣赏，但也幸运地遇上了精彩的&amp;ldquo;爬高杆表演&amp;rdquo;。我们略为等候之后，只见一个白衣小伙不知从什么地方突然冒了出来，又突然&amp;ldquo;咚&amp;rdquo;的一声跳上了小船。随后便像春蚕似地向那根竹杆上方爬去，大约十五、六米长的竹杆立时晃荡起来。他时而横身与竹杆成十字交叉，时而倒立与竹杆成丁字状，做了许多&lt;a href=&quot;http://www.sanwen.net/sanwen/youmei/&quot; target=&quot;_blank&quot;&gt;优美&lt;/a&gt;而高难的动作。好惊险！两边岸上的观众纷纷鼓起掌来。我想，大概体操世界冠军也未必敢如此这般吧？弄不好就会&amp;ldquo;啪&amp;rdquo;地掉到船板上摔个鼻青脸肿，或是&amp;ldquo;咚&amp;rdquo;地掉入水中成落汤鸡呢。传说这个活动本来是蚕农们为了祈求丰收而举办的，时下也经常会向游人演绎一番。&lt;br /&gt;\r\n夕阳西下时，我们来到了古戏台、修真观一带瞎逛。戏台上两个&lt;a href=&quot;http://nvren.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;女子&lt;/a&gt;在悠扬起伏的二胡伴奏下&amp;ldquo;咿咿呀呀&amp;rdquo;地唱着我根本听不懂的桐江花鼓。她们的扮相还算可以，动作也挺温柔，只是人都很老很老了。&lt;br /&gt;\r\n我们漫步至&amp;ldquo;宏源泰染坊&amp;rdquo;。这里是染织作坊，却也是游人如织。听说这个作坊是始创于宋元年间的老老店了。在宽敞的晒场上，但见悬挂在纵横交错的竹竿上晾晒的几十挂蓝色印花布随风飘曳，犹如跳着优&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;美的&lt;/a&gt;舞蹈，那白色的花仿佛呼之欲出。在这里你不但可以看到美丽的花布匹从轧棉籽、纺纱线、织棉布到纱布印染传统工序全过程的演示，了解蓝印花布是怎么织成的，清新可爱的花纹又是怎么印出来的，还可以带一些蓝印花布的成品回家赠送给亲朋好友。应该提及的是，中国的蓝印花布在全世界可都是久负盛名的，而乌镇就是蓝印花布的原产地之一。&lt;br /&gt;\r\n乌镇多名食，街巷里江南风味浓厚的各种菜肴、小吃琳琅满目。在一个可以和游客互动的手工面食作坊，内人买了一盒像是糯米糕的小食来品尝。兴致之余我们还轮起木锤锤打面团，女儿见状急忙用她的&amp;ldquo;单反&amp;rdquo;来一番连拍。哈！还真是好玩。&lt;br /&gt;\r\n璀璨迷人的&lt;a href=&quot;http://ye.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;夜&lt;/a&gt;景&lt;br /&gt;\r\n华灯初上之际，我们来到了西栅。&lt;br /&gt;\r\n西栅以夜景为美。人们都说，如果不去感受乌镇的晨、昏，就不能&lt;a href=&quot;http://baogao.sanwen.net/xindetihui/&quot; target=&quot;_blank&quot;&gt;体会&lt;/a&gt;到江南水乡完整的美。这就难怪入夜了这里依然是人山人海。把车子停放好后，我们一行也尽情地去感受她的美妙。&lt;br /&gt;\r\n体味西栅必须乘船。我们租得一条老式敞篷木船，沿着弯曲的水路，一路泛舟、游观。夜幕下的水乡古镇是何等的绚丽！这是水、桥、灯交集的世界，&lt;a href=&quot;http://meng.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;梦&lt;/a&gt;幻般的世界。置身于此，真是梦里不知身是客了。&lt;br /&gt;\r\n看，西市河水上水下灯光辉映，俨然成了灯河。船在一条条嫕静的灯河中划行，似是划破了一池池碎银；船从一座座古老的石桥中穿越，又如穿梭在一个个时空隧道。船家摇橹的咿呀声、水被划动的哗啦声、游人的戏闹声交织在一起，仿佛一首首交响乐，令人心旷神怡，乐不思蜀。&lt;br /&gt;\r\n回味无穷的幽情&lt;br /&gt;\r\n电视剧《似水年华》中如此形容乌镇：&amp;ldquo;如黄昏的一帘幽梦。&amp;rdquo;驻足回味，乌镇给我最深的印象就是一种无所不在的&amp;ldquo;幽&amp;rdquo;：幽静的乡域，幽嫮的情景，幽深的街巷，幽泌的河水，幽怨的古戏，幽居的老人，幽姿的女子，幽邃的文化......&lt;br /&gt;\r\n乌镇犹如世外桃园。幽静、恬淡，能让人放松&lt;a href=&quot;http://xinling.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;心灵&lt;/a&gt;，忘却烦恼和压抑，只留下一方清净，一分惬意，一份情怀，让人恋恋不舍。&lt;br /&gt;\r\n乌镇犹如伊甸园。幽嫮、温馨，充满罗曼蒂克。难怪古来骚客常来吟咏风月，难怪无数少男&lt;a href=&quot;http://nvren.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;少女&lt;/a&gt;常来谈情说爱，&lt;a href=&quot;http://qianshou.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;牵手&lt;/a&gt;走过&amp;ldquo;逢源双桥&amp;rdquo;。《似水年华》里英的那句&amp;ldquo;在乌镇，令人想谈恋爱&amp;rdquo;的话，以及文和英的&lt;a href=&quot;http://www.sanwen.net/sanwen/love/&quot; target=&quot;_blank&quot;&gt;爱情&lt;/a&gt;&lt;a href=&quot;http://tonghua.sanwen.net/&quot; target=&quot;_blank&quot;&gt;故事&lt;/a&gt;，不知让多少&lt;a href=&quot;http://qingchun.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;年轻&lt;/a&gt;人为之痴迷。&lt;br /&gt;\r\n乌镇犹如幽姿淑态的江南女子。天生丽质，柔情似水，看似纤细窈窕之身却蕴含着大家闺秀的非凡气质。那一排排的垂柳，微风吹来柳条飘散，恰如一个个少女在梳理秀发；夜幕降临后柳叶低垂，又好比一个个闭眼含羞的睡美人，妙不可言。&lt;br /&gt;\r\n夜深了，不得不走了。惜别乌镇之前，我们两家人都留了影，算是留下一个恒久的&lt;a href=&quot;http://huiyi.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;记忆&lt;/a&gt;吧。', '1', '0', '0', null, null, '2016-11-30 23:29:42', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3608', '1268', '1238', '205', '0', 'ds', '1', '0', '0', null, null, '2016-12-01 16:14:50', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3609', '1268', '1238', '205', '3608', 'ads', '1', '0', '0', null, null, '2016-12-01 16:15:27', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3610', '1268', '1245', '206', '3588', 'dsfgh', '1', '0', '0', null, null, '2016-12-02 19:54:26', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3611', '1268', '1245', '206', '0', '3', '1', '0', '0', null, null, '2016-12-02 20:28:53', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3612', '1268', '1237', '205', '0', 's', '1', '0', '0', null, null, '2016-12-02 20:29:52', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3613', '1268', '1237', '205', '3564', 'sdfghjkl', '1', '0', '0', null, null, '2016-12-02 20:32:28', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3614', '1268', '1237', '205', '0', 'sd', '1', '0', '0', null, null, '2016-12-02 20:34:27', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3615', '1268', '1237', '205', '3564', 'q', '1', '0', '0', null, null, '2016-12-02 20:34:52', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3616', '1268', '1237', '205', '3565', '我', '1', '0', '0', null, null, '2016-12-02 20:37:28', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3617', '1268', '1237', '205', '3567', 'blob', '1', '0', '0', null, null, '2016-12-02 20:39:41', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3618', '1268', '1245', '206', '3588', '&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/6cc860926af4468a93ce7d319053ebda1481889212450.jpg&quot; /&gt;', '1', '0', '0', null, null, '2016-12-16 19:53:35', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3619', '1279', '1246', '205', '0', 'wsafsafsa', '1', '0', '0', null, null, '2016-12-18 22:15:38', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3620', '1279', '1246', '205', '0', 'fasfasf', '1', '0', '0', null, null, '2016-12-18 22:15:42', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3621', '1279', '1246', '205', '0', 'dsgsdgds', '1', '0', '0', null, null, '2016-12-18 22:15:47', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3622', '1279', '1246', '205', '0', 'sdgsdfahrdhb', '1', '0', '0', null, null, '2016-12-18 22:15:54', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3623', '1279', '1246', '205', '0', '&lt;img alt=&quot;&quot; height=&quot;277&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/b66469a3909c44f5936c5fca889042371482070567832.jpg&quot; width=&quot;277&quot; /&gt;', '1', '0', '0', null, null, '2016-12-18 22:16:19', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3624', '1279', '1246', '205', '0', 'sdagfdsgdg', '1', '0', '0', null, null, '2016-12-18 22:16:37', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3625', '1279', '1246', '205', '0', 'gdfshdfhfd', '1', '0', '0', null, null, '2016-12-18 22:16:42', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3626', '1279', '1246', '205', '0', 'gdfshsfdhdfshdfshsd', '1', '0', '0', null, null, '2016-12-18 22:16:50', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3627', '1279', '1246', '205', '0', 'dfasghghghgh', '1', '0', '0', null, null, '2016-12-18 22:16:57', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3628', '1279', '1246', '205', '0', 'sadghghghghghghghghghghghghghghh', '1', '0', '0', null, null, '2016-12-18 22:17:03', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3629', '1279', '1246', '205', '0', 'asdhhhhhhhhhhh', '1', '0', '0', null, null, '2016-12-18 22:17:18', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3630', '1279', '1246', '205', '0', 'dasgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsg', '1', '0', '0', null, null, '2016-12-18 22:17:25', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3631', '1279', '1246', '205', '0', 'dsagggggggggggggggggggggggggggggggg', '1', '0', '0', null, null, '2016-12-18 22:17:32', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3632', '1279', '1246', '205', '0', 'seatgerssssssssssssssssss', '1', '0', '0', null, null, '2016-12-18 22:17:39', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3633', '1279', '1246', '205', '0', 'dsagggggggggggggggggggggggggggggggggggg', '1', '0', '0', null, null, '2016-12-18 22:17:47', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3634', '1268', '1235', '191', '0', '&lt;img alt=&quot;&quot; height=&quot;866&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/54199bc8b96f4126b923709bb032f0831482233597742.jpg&quot; width=&quot;652&quot; /&gt;', '1', '0', '0', null, null, '2016-12-20 19:33:58', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3635', '1268', '1236', '206', '0', 'as', '1', '0', '0', null, null, '2016-12-20 19:36:49', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3636', '1268', '1236', '206', '0', 'a', '1', '0', '0', null, null, '2016-12-20 19:36:58', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3637', '1268', '1236', '206', '0', 'student', '1', '0', '0', null, null, '2016-12-20 19:37:06', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3638', '1268', '1251', '206', '0', 'wafsssssssssssssss', '1', '0', '0', null, null, '2016-12-21 20:52:13', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3639', '1268', '1251', '206', '3638', 'fdsaaaaaaf', '1', '0', '0', null, null, '2016-12-21 20:52:21', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3640', '1285', '1252', '205', '0', '&lt;img alt=&quot;&quot; height=&quot;30&quot; src=&quot;/bbs/resources/static/ckeditor4/plugins/smiley/self/image025.png&quot; title=&quot;&quot; width=&quot;30&quot; /&gt;', '1', '0', '0', null, null, '2016-12-21 21:41:32', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3641', '1285', '1241', '205', '0', 'boring', '1', '0', '0', null, null, '2016-12-24 17:03:43', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3642', '1268', '1253', '196', '0', 'reply count + 1', '1', '0', '0', null, null, '2016-12-29 19:59:03', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3643', '1286', '1247', '192', '0', 'new user count + 1', '1', '0', '0', null, null, '2016-12-29 20:01:56', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3644', '1279', '1254', '205', '0', 'imageView/2/w/800/h/600&lt;br /&gt;\r\n似乎很合适', '1', '0', '0', null, null, '2016-12-29 22:41:35', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3645', '1279', '1255', '203', '0', '&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/97ffe47c81044818afd82de5caa8ff0b1483022645879.jpg?imageView/2/w/800/h/600&quot; /&gt;', '1', '0', '0', null, null, '2016-12-29 22:44:09', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3646', '1268', '1256', '200', '0', '23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request', '1', '0', '0', null, null, '2016-12-30 23:16:44', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3647', '1268', '1256', '200', '3646', '23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request', '1', '0', '0', null, null, '2016-12-30 23:16:53', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3648', '1268', '1256', '200', '0', '23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request', '1', '0', '0', null, null, '2016-12-30 23:17:01', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3649', '1268', '1256', '200', '3648', '&lt;pre class=&quot;brush:java;toolbar:false;&quot;&gt;\r\n23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;/pre&gt;\r\n', '1', '0', '0', null, null, '2016-12-30 23:17:14', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3650', '1268', '1256', '200', '3649', '23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling&lt;br /&gt;\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request', '1', '0', '0', null, null, '2016-12-30 23:17:24', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3651', '1268', '1256', '200', '0', '&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/53d727ad2e894aa59978ce9ba04eba9a1483111071754.jpg?imageView/2/w/800/h/600&quot; /&gt;', '1', '0', '0', null, null, '2016-12-30 23:17:57', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3652', '1268', '1257', '199', '0', '16-12-30 23:14:11\r\n&lt;table border=&quot;1&quot; class=&quot;sortable&quot; id=&quot;table5&quot; style=&quot;width:100%&quot; summary=&quot;log&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user3.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/logo.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user-avatar.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user5.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user1.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user4.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user2.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/logo_icon.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/logo.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user1.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/logo_icon.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user4.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user-avatar.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user3.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user2.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:11&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/photos/user5.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16-12-30 23:14:12&lt;/td&gt;\r\n			&lt;td&gt;/system/admin/images/details_open.png&amp;nbsp;GET&lt;/td&gt;\r\n			&lt;td&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '1', '0', '0', null, null, '2016-12-30 23:18:56', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3653', '1268', '1257', '199', '3652', '16-12-30 23:14:11&lt;br /&gt;\r\n&lt;br /&gt;\r\n/system/admin/images/photos/user3.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/logo.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user-avatar.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user5.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user1.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user4.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user2.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/logo_icon.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/logo.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user1.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/logo_icon.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user4.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user-avatar.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user3.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user2.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:11/system/admin/images/photos/user5.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;br /&gt;\r\n16-12-30 23:14:12/system/admin/images/details_open.png&amp;nbsp;GETWARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1', '1', '0', '0', null, null, '2016-12-30 23:19:11', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3654', '1268', '1257', '199', '0', '&lt;img alt=&quot;&quot; height=&quot;30&quot; src=&quot;/bbs/resources/static/ckeditor4/plugins/smiley/self/image045.png&quot; title=&quot;&quot; width=&quot;30&quot; /&gt;', '1', '0', '0', null, null, '2016-12-30 23:20:43', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3655', '1268', '1235', '191', '0', '&lt;img alt=&quot;&quot; height=&quot;30&quot; src=&quot;/bbs/resources/static/ckeditor4/plugins/smiley/self/image026.png&quot; title=&quot;&quot; width=&quot;30&quot; /&gt;', '1', '0', '0', null, null, '2016-12-31 16:34:31', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3656', '1268', '1237', '205', '0', 'kjjjjjjjjjjjjjjjjjjjjjjjjjjjjjghcvvvvvvvvvvvvvvvvvvvvvtresyrxxxxxxxxxxxxxxxyrefgvbkgyhcvcvcvcvcvcvcvcvcv tufl;ki', '1', '0', '0', null, null, '2016-12-31 16:39:33', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3657', '1268', '1235', '191', '0', '@Cacheable注解主要有两个作用 1）如果用户请求的数据已经被缓存，使用@Cacheable可以直接返回缓存数据 2）如果用户请求的数据没有被缓存，将执行Controller的方法，将查询结果保存在缓存中。例如在下面的例子中,以user.account作为查询缓存的key值。', '1', '0', '0', null, null, '2016-12-31 16:51:56', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3658', '1268', '1247', '192', '0', '+1', '1', '0', '0', null, null, '2017-01-02 21:39:44', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3659', '1268', '1258', '192', '0', '+++++++++++++++++1', '1', '0', '0', null, null, '2017-01-02 21:40:14', '127.0.0.1');
INSERT INTO `bbs_reply` VALUES ('3660', '1286', '1259', '205', '0', '+++++++++++++++++++++++++++1', '1', '0', '0', null, null, '2017-01-02 21:42:06', '127.0.0.1');

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `topic_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id,对应user_access表',
  `board_id` int(11) NOT NULL COMMENT '版块id，对应bbs_board表',
  `class_id` int(11) NOT NULL COMMENT '分类id，对应bbs_classify表',
  `nav_id` int(11) NOT NULL COMMENT '导航id，对应bbs_navigation表',
  `topic_title` varchar(255) NOT NULL COMMENT '主题标题',
  `topic_content` mediumtext NOT NULL COMMENT '主题内容',
  `topic_status` int(11) NOT NULL DEFAULT '0' COMMENT '主题状态{0:正常，1：已删除}',
  `topic_create_time` datetime NOT NULL COMMENT '创建时间',
  `topic_create_ip` varchar(30) NOT NULL COMMENT '创建ip',
  `topic_file_ids` varchar(1000) DEFAULT NULL COMMENT '关联bbs_file表，多个用逗号隔开',
  PRIMARY KEY (`topic_id`),
  KEY `idx_board_id` (`board_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_class_id` (`class_id`),
  KEY `idx_nav_id` (`nav_id`),
  KEY `idx_topic_status` (`topic_status`),
  KEY `idx_topic_create_time` (`topic_create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1260 DEFAULT CHARSET=utf8 COMMENT='论坛主题表';

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES ('1235', '1268', '191', '12306', '47', 'this is first topic', '&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;color:#FF8C00&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:&eacute;&para;&auml;&sup1;&brvbar;&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;test&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;div style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-family:&eacute;&para;&auml;&sup1;&brvbar;&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;update...&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n', '0', '2016-10-15 23:04:40', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1236', '1280', '206', '12321', '52', '报道帖', 'play play play', '0', '2016-10-16 01:41:19', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1237', '1268', '205', '12322', '52', '测试单纯加精', '&aelig;&micro;&egrave;&macr;&aring;&ccedil;&ordm;&macr;&aring;&nbsp;&ccedil;&sup2;&frac34;', '0', '2016-10-29 13:27:47', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1238', '1268', '205', '12322', '52', '随便测试', '随便测试', '0', '2016-10-29 14:09:45', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1239', '1268', '205', '12322', '52', '随便测试', '&lt;div style=&quot;text-align: center;&quot;&gt;||随便测试||&lt;br /&gt;\r\n。&lt;br /&gt;\r\n。&lt;br /&gt;\r\n。&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; height=&quot;230&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/f2126a7e50654277aedc3bc58f46903d1482656946681.jpg&quot; width=&quot;410&quot; /&gt;&lt;/div&gt;\r\n', '0', '2016-10-29 14:10:03', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1240', '1268', '205', '12320', '52', '随便测试w', '随便测试wwwwww', '0', '2016-10-29 14:10:27', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1241', '1268', '205', '12324', '52', '随便测试', '随便测试', '0', '2016-10-29 14:10:57', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1242', '1268', '205', '12324', '52', '随便测试', '随便测试', '0', '2016-10-29 14:11:11', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1243', '1268', '206', '12321', '52', '随便测试', 'fEGZrxhfchzggzdfnxbvcbxzh\r\n&lt;div style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-family:隶书&quot;&gt;fdshfmgc,v.m&lt;/span&gt;&lt;/div&gt;\r\n', '0', '2016-11-11 20:29:49', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1244', '1279', '200', '12315', '50', '随便测试', '7YA4UZEJTKXFG&lt;img alt=&quot;&quot; src=&quot;/bbs/resources/static/ckeditor4/plugins/smiley/self/image001.png&quot; style=&quot;height:30px; width:30px&quot; title=&quot;&quot; /&gt;', '0', '2016-11-11 20:47:09', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1245', '1280', '206', '12321', '52', 'erstdyuiopdrtfgyuhijokp', '&lt;div style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/c7aab8f7377c4042823005a645d662d71481889174789.jpg&quot; /&gt;&lt;br /&gt;\r\nstrdyfugihojpk[lrfyguhijokp&amp;#39;ldtyfkulihojpkl&lt;br /&gt;\r\ndshghdsf&lt;br /&gt;\r\nhsdag&lt;br /&gt;\r\nsadg&lt;br /&gt;\r\nf&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/694af9402c2049dd92ff9f27a1cb943b1481889070091.jpg&quot; /&gt;&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/a49ddf6f543546bfafd5afd98693a8261481889070076.jpg&quot; /&gt;&lt;br /&gt;\r\n&amp;nbsp;&lt;/div&gt;\r\n', '0', '2016-11-13 16:09:55', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1246', '1279', '205', '12322', '52', '品味乌镇', '&lt;p&gt;品味乌镇&lt;/p&gt;\r\n\r\n&lt;p&gt;很早之前，我就特别向往&lt;a href=&quot;http://jiangnan.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;江南&lt;/a&gt;水乡。这种向往，缘于那些耳熟能详的唐诗宋词，譬如白居易的《忆江南》、韦庄的《菩萨蛮&amp;bull;人人尽说江南好》、王琪的《望江南&amp;bull;忆江南》等等。&lt;/p&gt;\r\n\r\n&lt;p&gt;江南何以美，美得令当年的乾隆爷七下游历？美得令无数&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文人&lt;/a&gt;墨客百般赞叹？今年深秋里的一天，在杭州&lt;a href=&quot;http://www.sanwen.net/gongzuozongjie.html&quot; target=&quot;_blank&quot;&gt;工作&lt;/a&gt;的女儿、准女婿及其&lt;a href=&quot;http://xiaojing.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;父母&lt;/a&gt;陪着我和内人一同驱车前往乌镇游逛，让我解开了这个疑惑。&lt;/p&gt;\r\n\r\n&lt;p&gt;江南水乡的缩影&lt;/p&gt;\r\n\r\n&lt;p&gt;人们都说，乌镇是江南水乡的一张绮丽的名片。水乡的特色，无论是在&lt;a href=&quot;http://www.sanwen.net/suibi/shenghuo/&quot; target=&quot;_blank&quot;&gt;生活&lt;/a&gt;、&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文化&lt;/a&gt;，还是建筑、物产等方面的，在乌镇都能感受得到。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇位于嘉兴的桐乡市，离杭州不远，本来只需大约两个钟头的车程，因为迷路我们中午时分才抵达，不过这丝毫没有影响我的情绪。( &lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文章&lt;/a&gt;&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;阅读&lt;/a&gt;网：www.sanwen.net )&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇分东南西北四栅，但景区分布在东栅和西栅。东栅有茅盾故居、余榴梁钱币馆、江南百床馆等20多个景点。西栅毗邻古老的京杭大运河，面积比东栅大得多，其12座小岛被小桥串连在一起，风光甚是秀美。&lt;/p&gt;\r\n\r\n&lt;p&gt;一下车，首先映入眼帘的是一座上书&amp;ldquo;乌镇&amp;rdquo;两个大字的仿古大门楼。匆匆用过午餐后，我们便迫不及待的向景区进发。&lt;/p&gt;\r\n\r\n&lt;p&gt;我们一行漫步在东栅的石板街巷之间，观赏那一草一木、一砖一瓦，追寻沧桑&lt;a href=&quot;http://www.sanwen.net/suibi/suiyue/&quot; target=&quot;_blank&quot;&gt;岁月&lt;/a&gt;嬗递所留下的痕迹。但见桥街相连，曲径通幽，水乡特性十分鲜明。在一间古宅的门口，我见到一位神态从容的耄耋老者悠然自得的坐在旁边的凳子上看书，我向他问安，与他攀谈，他告诉我：这里就都是些老的东西，老河、老街、老屋、老人。&lt;/p&gt;\r\n\r\n&lt;p&gt;江南水乡真可谓江河湖泊星罗棋布，水网纵横，水城田野如诗如画，园林幽径魅力无穷。这里非但风景美不胜收，历来也是神州大地最为富足的鱼米之乡、丝绸之府，无可置疑的&amp;ldquo;人间&lt;a href=&quot;http://tiantang.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;天堂&lt;/a&gt;&amp;rdquo;。&lt;/p&gt;\r\n\r\n&lt;p&gt;枕河人家的水阁&lt;/p&gt;\r\n\r\n&lt;p&gt;水是水乡的活力与灵性之所在，乌镇亦然。一条起码已流淌6000年的小河蜿蜒贯穿全镇，镇上以水为街，以岸为市，两岸阁楼临水而立。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇沿河民居皆为匠心独具的&amp;ldquo;水阁&amp;rdquo;。房子大多是二层楼房，有一部分延伸至河面，下面用石柱或木桩竖于河底擎托着，上面架横梁搁木板做成木屋。扇窗推开，宛若像框。水阁宅前屋后，皆通河道；岸植垂柳，铺以石栏；门前河面，俱覆石阶。水阁上面居住，下面停船。他们充分利用多变的地形，使流水在房屋之间通畅。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇几乎&amp;ldquo;家家门外泊舟航&amp;rdquo;，船是人们渡河和捕鱼、驮载必不可少的工具，即便是在今日它甚至比汽车还实用。&lt;/p&gt;\r\n\r\n&lt;p&gt;身临这种&amp;ldquo;枕河人家&amp;rdquo;，使我不禁想起茅盾在《大地山河》中对&lt;a href=&quot;http://www.sanwen.net/sanwen/guxiang/&quot; target=&quot;_blank&quot;&gt;故乡&lt;/a&gt;的描述。那一幢幢水阁亭亭玉立，被碧波托起犹如出水白莲。&amp;ldquo;人在屋中居，屋在水中游&amp;rdquo;&amp;ldquo;楼台俯舟楫&amp;rdquo;&amp;ldquo;白墙青瓦水中映&amp;rdquo;的景观，实在是别有情趣。我想，闲暇时与三二好友来此度假，在水阁中喝茶聊天，或观看蓬船，或垂钓赏鱼，该有多惬意。&lt;/p&gt;\r\n\r\n&lt;p&gt;无所不在的石桥&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇素有百步一桥之说，古色古香的石桥是其一大特色。据悉，其桥梁最多时达150多座，时下经修复、重建的古桥，仅西栅就有72座。乌镇河流密度和石桥数量均为全国古镇之最，堪称古桥博物馆。&lt;/p&gt;\r\n\r\n&lt;p&gt;这些石桥把被水道分隔的巷子都连接在一起，使得水乡的交通十分便利。同时，这些各式各样或拱或平的石桥也成了颇值欣赏的艺术品。&amp;ldquo;桥里桥&amp;rdquo;当是乌镇最为著名的两座石桥了。东西走向的&amp;ldquo;通济桥&amp;rdquo;与南北走向的&amp;ldquo;仁济桥&amp;rdquo;直角相连，互为犄角，交相辉映，迷离而清雅。在&amp;ldquo;通济桥&amp;rdquo;上的两副对联也是特有韵味的，一联曰：&amp;ldquo;寒树烟中，尽乌戍六朝旧地；&lt;a href=&quot;http://www.sanwen8.cn/subject/80878/&quot; target=&quot;_blank&quot;&gt;夕阳&lt;/a&gt;帆外，是吴兴几点远山。&amp;rdquo;另一联是：&amp;ldquo;通霅门开数万家，西环浙水；题桥人至三千里，北望燕京。&amp;rdquo;其联意不仅交代了古桥的历史地理环境，又表达了乌镇人志高心远的胸怀。&lt;/p&gt;\r\n\r\n&lt;p&gt;其实，乌镇的石桥除了普遍都有耐人寻味的对联外，其装饰也都具有高雅的格调。很多桥的望柱、栏板上都雕有&lt;a href=&quot;http://www.sanwen8.cn/sanwen/jingmei/&quot; target=&quot;_blank&quot;&gt;精美&lt;/a&gt;的图案，有莲花图案、六道轮回图案、万字图案等，给古桥增添了不少韵致，也蕴涵了古镇人们的宗教习俗以及祈祷吉祥平安的&lt;a href=&quot;http://www.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;美好&lt;/a&gt;愿望。&lt;/p&gt;\r\n\r\n&lt;p&gt;我看到，在一些石桥上还建有亭阁，如昭明书院西侧的&lt;a href=&quot;http://www.sanwen.net/sanwen/yu/&quot; target=&quot;_blank&quot;&gt;雨&lt;/a&gt;读桥。桥阁能遮阳避雨，桥侧护栏可供人们凭栏观赏水上风光。&lt;/p&gt;\r\n\r\n&lt;p&gt;煦育名流的摇篮&lt;/p&gt;\r\n\r\n&lt;p&gt;提起&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;文学&lt;/a&gt;巨匠茅盾，我不由地肃然起敬。先生的故居和纪念馆就坐落在观前街上。随着人流，我们轻步入内。故居是江浙一带常见的传统木构架民居建筑，处处散发着世代书香特有的逸雅之气。抚着先生的铜像，看着先生幼年时使用过的文物，感受着先生&lt;a href=&quot;http://cengjing.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;曾经&lt;/a&gt;生活过的气息，我无限欣慨。在一丛先生亲自栽种的&amp;ldquo;南天竹&amp;rdquo;前，女儿给我拍照留念。呵呵！我有时发表拙作就&lt;a href=&quot;http://www.sanwen8.cn/sanwen/love/&quot; target=&quot;_blank&quot;&gt;爱&lt;/a&gt;以&amp;ldquo;南天竹&amp;rdquo;为笔名呢，巧合了。&lt;/p&gt;\r\n\r\n&lt;p&gt;这里还是中国最早的镇志编撰者沈平、著名理学家张杨园等名流的出生地。南朝梁代的昭明太子萧统，也曾在此寓居多年并编撰了被史学界誉为堪比《诗经》《楚辞》的《昭明文选》。据说，小小乌镇在古代先后出过数百贡生、数百举人、近百进士，近、&lt;a href=&quot;http://www.sanwen.net/shige/xiandai/&quot; target=&quot;_blank&quot;&gt;现代&lt;/a&gt;更出有众多政治家、银行家、农学家、文化学者等等。这些胸怀博大天资聪慧的水乡&lt;a href=&quot;http://www.sanwen.net/jingdian/mingyan/&quot; target=&quot;_blank&quot;&gt;名人&lt;/a&gt;大家，在中国乃至世界历史上书写了诸多浓彩重墨。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;ldquo;紫燕剪&lt;a href=&quot;http://chuntian.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;春&lt;/a&gt;雨，丝竹弄管弦&amp;rdquo;的江南，毓秀钟灵的水乡，可真是&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;人文&lt;/a&gt;荟萃啊！&lt;/p&gt;\r\n\r\n&lt;p&gt;独特有趣的民俗&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇除了华&lt;a href=&quot;http://xiatian.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;夏&lt;/a&gt;民族共有的那些传统习俗外，还有元宵走桥、立夏称人、分龙彩雨、天贶晒虫、中元河灯等众多独特的民俗。&lt;/p&gt;\r\n\r\n&lt;p&gt;我们来的不是时候，这些活动都无缘欣赏，但也幸运地遇上了精彩的&amp;ldquo;爬高杆表演&amp;rdquo;。我们略为等候之后，只见一个白衣小伙不知从什么地方突然冒了出来，又突然&amp;ldquo;咚&amp;rdquo;的一声跳上了小船。随后便像春蚕似地向那根竹杆上方爬去，大约十五、六米长的竹杆立时晃荡起来。他时而横身与竹杆成十字交叉，时而倒立与竹杆成丁字状，做了许多&lt;a href=&quot;http://www.sanwen.net/sanwen/youmei/&quot; target=&quot;_blank&quot;&gt;优美&lt;/a&gt;而高难的动作。好惊险！两边岸上的观众纷纷鼓起掌来。我想，大概体操世界冠军也未必敢如此这般吧？弄不好就会&amp;ldquo;啪&amp;rdquo;地掉到船板上摔个鼻青脸肿，或是&amp;ldquo;咚&amp;rdquo;地掉入水中成落汤鸡呢。传说这个活动本来是蚕农们为了祈求丰收而举办的，时下也经常会向游人演绎一番。&lt;/p&gt;\r\n\r\n&lt;p&gt;夕阳西下时，我们来到了古戏台、修真观一带瞎逛。戏台上两个&lt;a href=&quot;http://nvren.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;女子&lt;/a&gt;在悠扬起伏的二胡伴奏下&amp;ldquo;咿咿呀呀&amp;rdquo;地唱着我根本听不懂的桐江花鼓。她们的扮相还算可以，动作也挺温柔，只是人都很老很老了。&lt;/p&gt;\r\n\r\n&lt;p&gt;我们漫步至&amp;ldquo;宏源泰染坊&amp;rdquo;。这里是染织作坊，却也是游人如织。听说这个作坊是始创于宋元年间的老老店了。在宽敞的晒场上，但见悬挂在纵横交错的竹竿上晾晒的几十挂蓝色印花布随风飘曳，犹如跳着优&lt;a href=&quot;http://www.sanwen.net/&quot; target=&quot;_blank&quot;&gt;美的&lt;/a&gt;舞蹈，那白色的花仿佛呼之欲出。在这里你不但可以看到美丽的花布匹从轧棉籽、纺纱线、织棉布到纱布印染传统工序全过程的演示，了解蓝印花布是怎么织成的，清新可爱的花纹又是怎么印出来的，还可以带一些蓝印花布的成品回家赠送给亲朋好友。应该提及的是，中国的蓝印花布在全世界可都是久负盛名的，而乌镇就是蓝印花布的原产地之一。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇多名食，街巷里江南风味浓厚的各种菜肴、小吃琳琅满目。在一个可以和游客互动的手工面食作坊，内人买了一盒像是糯米糕的小食来品尝。兴致之余我们还轮起木锤锤打面团，女儿见状急忙用她的&amp;ldquo;单反&amp;rdquo;来一番连拍。哈！还真是好玩。&lt;/p&gt;\r\n\r\n&lt;p&gt;璀璨迷人的&lt;a href=&quot;http://ye.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;夜&lt;/a&gt;景&lt;/p&gt;\r\n\r\n&lt;p&gt;华灯初上之际，我们来到了西栅。&lt;/p&gt;\r\n\r\n&lt;p&gt;西栅以夜景为美。人们都说，如果不去感受乌镇的晨、昏，就不能&lt;a href=&quot;http://baogao.sanwen.net/xindetihui/&quot; target=&quot;_blank&quot;&gt;体会&lt;/a&gt;到江南水乡完整的美。这就难怪入夜了这里依然是人山人海。把车子停放好后，我们一行也尽情地去感受她的美妙。&lt;/p&gt;\r\n\r\n&lt;p&gt;体味西栅必须乘船。我们租得一条老式敞篷木船，沿着弯曲的水路，一路泛舟、游观。夜幕下的水乡古镇是何等的绚丽！这是水、桥、灯交集的世界，&lt;a href=&quot;http://meng.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;梦&lt;/a&gt;幻般的世界。置身于此，真是梦里不知身是客了。&lt;/p&gt;\r\n\r\n&lt;p&gt;看，西市河水上水下灯光辉映，俨然成了灯河。船在一条条嫕静的灯河中划行，似是划破了一池池碎银；船从一座座古老的石桥中穿越，又如穿梭在一个个时空隧道。船家摇橹的咿呀声、水被划动的哗啦声、游人的戏闹声交织在一起，仿佛一首首交响乐，令人心旷神怡，乐不思蜀。&lt;/p&gt;\r\n\r\n&lt;p&gt;回味无穷的幽情&lt;/p&gt;\r\n\r\n&lt;p&gt;电视剧《似水年华》中如此形容乌镇：&amp;ldquo;如黄昏的一帘幽梦。&amp;rdquo;驻足回味，乌镇给我最深的印象就是一种无所不在的&amp;ldquo;幽&amp;rdquo;：幽静的乡域，幽嫮的情景，幽深的街巷，幽泌的河水，幽怨的古戏，幽居的老人，幽姿的女子，幽邃的文化......&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇犹如世外桃园。幽静、恬淡，能让人放松&lt;a href=&quot;http://xinling.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;心灵&lt;/a&gt;，忘却烦恼和压抑，只留下一方清净，一分惬意，一份情怀，让人恋恋不舍。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇犹如伊甸园。幽嫮、温馨，充满罗曼蒂克。难怪古来骚客常来吟咏风月，难怪无数少男&lt;a href=&quot;http://nvren.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;少女&lt;/a&gt;常来谈情说爱，&lt;a href=&quot;http://qianshou.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;牵手&lt;/a&gt;走过&amp;ldquo;逢源双桥&amp;rdquo;。《似水年华》里英的那句&amp;ldquo;在乌镇，令人想谈恋爱&amp;rdquo;的话，以及文和英的&lt;a href=&quot;http://www.sanwen.net/sanwen/love/&quot; target=&quot;_blank&quot;&gt;爱情&lt;/a&gt;&lt;a href=&quot;http://tonghua.sanwen.net/&quot; target=&quot;_blank&quot;&gt;故事&lt;/a&gt;，不知让多少&lt;a href=&quot;http://qingchun.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;年轻&lt;/a&gt;人为之痴迷。&lt;/p&gt;\r\n\r\n&lt;p&gt;乌镇犹如幽姿淑态的江南女子。天生丽质，柔情似水，看似纤细窈窕之身却蕴含着大家闺秀的非凡气质。那一排排的垂柳，微风吹来柳条飘散，恰如一个个少女在梳理秀发；夜幕降临后柳叶低垂，又好比一个个闭眼含羞的睡美人，妙不可言。&lt;/p&gt;\r\n\r\n&lt;p&gt;夜深了，不得不走了。惜别乌镇之前，我们两家人都留了影，算是留下一个恒久的&lt;a href=&quot;http://huiyi.sanwen8.cn/&quot; target=&quot;_blank&quot;&gt;记忆&lt;/a&gt;吧。&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n', '0', '2016-11-30 23:29:32', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1247', '1268', '192', '12307', '47', '随便测试', 'qewterutiyyugoiou', '0', '2016-12-01 19:27:32', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1248', '1268', '204', '12319', '52', 'qWAESRTYUPUYTWRYERTIYU', '&lt;img alt=&quot;&quot; height=&quot;363&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/8d63c096305347c19131407f05480a911481632725012.png&quot; width=&quot;653&quot; /&gt;&lt;br /&gt;\r\npicture....', '0', '2016-12-13 20:39:43', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1249', '1268', '204', '12319', '52', '撒个谎东方股份合格', '玩儿几天和改革弱覆盖辅导费你干嘛的&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/70c4f9ff6bde4f599f5ac8397de5174e1481637551199.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/a32b42e70ec34b6397225b91fb0e75091481637551600.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/baf7d079b89942f5b7c505f68ac65bb61481637552736.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/16931278100d43faaed052ddb70d8b0a1481637552681.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/bb5f3f53d1d2445f8f244072d0b11bfe1481637551086.png&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/a6f0470bb390465ab52076932249abeb1481637550750.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/8cce5376c766425f980a00e2abfa7c131481637551521.png&quot; /&gt;', '0', '2016-12-13 22:48:42', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1250', '1268', '205', '12322', '52', '真尼玛尴尬', '&lt;div style=&quot;text-align:center&quot;&gt;奥迪双钻的辛苦费&lt;br /&gt;\r\nasfsdhfjghg&lt;/div&gt;\r\n\r\n&lt;div style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;251&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/1e71f67e65064a99982e786d090568b21481720848199.jpg&quot; width=&quot;251&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n什么鬼。。&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/24c1d532c43e441f84565eac8ed91fed1481720848202.jpg&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div&gt;rilegou&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; height=&quot;338&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/e8d616baa19349999a189b6526f66b261481720848213.jpg&quot; width=&quot;338&quot; /&gt;&lt;/div&gt;\r\n', '0', '2016-12-14 21:08:52', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1251', '1268', '206', '12321', '52', 'fsaddsag', 'gsadadadadadadadadadadadadadadadad&lt;br /&gt;\r\nafsfsfsfsfs', '0', '2016-12-21 20:49:12', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1252', '1285', '205', '12322', '52', 'zzuli', '&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/89294f5b02c44efc8e3d311aa70216a61482327614834.jpg&quot; /&gt;&lt;br /&gt;\r\n赵奕欢。。。。。。。', '0', '2016-12-21 21:40:57', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1253', '1268', '196', '12312', '49', 'savecount', '&lt;div style=&quot;text-align: center;&quot;&gt;topic count&amp;nbsp; + 1&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; height=&quot;330&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/1dd0cc8e47df49959668aca6c861c3f91483012693481.jpg&quot; width=&quot;330&quot; /&gt;&lt;/div&gt;\r\n', '0', '2016-12-29 19:58:42', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1254', '1279', '205', '12322', '52', '七牛参数级别的无损图像压缩', '&lt;img alt=&quot;&quot; src=&quot;http://ofrjra54d.bkt.clouddn.com/27566099cd1f4d25b1e898c8ad9bb51d1483022083343.jpg?imageView/2/w/800/h/600&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n七牛参数级别的无损图像压缩', '0', '2016-12-29 22:35:48', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1255', '1279', '203', '12318', '51', 'imageView/2/w/800/h/600', 'imageView/2/w/800/h/600', '0', '2016-12-29 22:43:39', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1256', '1268', '200', '12315', '50', '撒个谎东方股份合格', '&lt;pre class=&quot;brush:java;toolbar:false;&quot;&gt;\r\n23:15:50.386 [http-bio-8080-exec-5] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Opening RedisConnection\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Null ModelAndView returned to DispatcherServlet with name &amp;#39;bbs-dispatcher&amp;#39;: assuming HandlerAdapter completed request handling\r\n23:15:50.386 [http-bio-8080-exec-11] DEBUG o.s.web.servlet.DispatcherServlet - Successfully completed request&lt;/pre&gt;\r\n', '0', '2016-12-30 23:16:26', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1257', '1268', '199', '12314', '50', 'erstdyuiop[ldrtfgyuhijokp', '&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;\r\n&lt;table border=&quot;1&quot; class=&quot;sortable&quot; id=&quot;table5&quot; style=&quot;width:100%&quot; summary=&quot;log&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user3.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/logo.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user-avatar.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user5.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user1.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user4.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user2.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/logo_icon.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/logo.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user1.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/logo_icon.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user4.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user-avatar.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user3.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user2.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/photos/user5.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;16-12-30 23:14:12&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;/system/admin/images/details_open.png&amp;nbsp;GET&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;color:#40E0D0&quot;&gt;WARN&amp;nbsp;&amp;nbsp;c.i.bbs.interceptor.BbsInterceptor&amp;nbsp;-&amp;nbsp;admin&amp;nbsp;url&amp;nbsp;found,&amp;nbsp;ip&amp;nbsp;is&amp;nbsp;127.0.0.1&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '0', '2016-12-30 23:18:41', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1258', '1268', '192', '12307', '47', '+++++++++++++++++++1', '+++++++++++++++++1', '0', '2017-01-02 21:40:05', '127.0.0.1', null);
INSERT INTO `bbs_topic` VALUES ('1259', '1286', '205', '12322', '52', '+++++++++++++++++++1', '++++++++++++++++++++++++++++++++1', '0', '2017-01-02 21:41:59', '127.0.0.1', null);

-- ----------------------------
-- Table structure for bbs_topic_data
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic_data`;
CREATE TABLE `bbs_topic_data` (
  `topic_id` bigint(20) NOT NULL COMMENT '主题id，对应bbs_topic表',
  `topic_reply_count` int(11) NOT NULL DEFAULT '0' COMMENT '主题回复数量',
  `topic_view_count` int(11) NOT NULL DEFAULT '0' COMMENT '主题浏览数量',
  `topic_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '主题收藏数量',
  `topic_title_style` varchar(255) DEFAULT NULL COMMENT '主题标题样式',
  `lastest_reply_user` varchar(20) DEFAULT NULL COMMENT '最新回复人',
  `lastest_reply_time` datetime DEFAULT NULL COMMENT '最新回复时间',
  `topic_update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人id,对应user_access表',
  `topic_update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `topic_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛主题数据表';

-- ----------------------------
-- Records of bbs_topic_data
-- ----------------------------
INSERT INTO `bbs_topic_data` VALUES ('1235', '0', '5', '0', null, null, null, '1268', 'Smart_咚咚', '2016-12-20 19:32:18');
INSERT INTO `bbs_topic_data` VALUES ('1236', '3', '10', '0', null, 'Smart_咚咚', '2016-12-20 19:37:06', '1268', 'Smart_咚咚', '2016-12-20 19:38:12');
INSERT INTO `bbs_topic_data` VALUES ('1237', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1238', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1239', '0', '3', '0', null, null, null, '1268', 'Smart_咚咚', '2016-12-25 17:10:04');
INSERT INTO `bbs_topic_data` VALUES ('1240', '0', '3', '0', null, null, null, '1279', 'tonboy', '2016-12-02 23:02:00');
INSERT INTO `bbs_topic_data` VALUES ('1241', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1242', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1243', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1244', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1245', '1', '28', '0', null, 'Smart_咚咚', '2016-12-16 19:53:35', '1268', 'Smart_咚咚', '2016-12-31 16:52:52');
INSERT INTO `bbs_topic_data` VALUES ('1246', '0', '3', '0', null, null, null, '1279', 'tonboy', '2016-12-02 22:59:12');
INSERT INTO `bbs_topic_data` VALUES ('1247', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1248', '0', '4', '0', null, null, null, '1268', 'Smart_咚咚', '2016-12-13 20:40:30');
INSERT INTO `bbs_topic_data` VALUES ('1249', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1250', '0', '2', '0', null, null, null, '1268', 'Smart_咚咚', '2016-12-14 21:09:41');
INSERT INTO `bbs_topic_data` VALUES ('1251', '0', '2', '0', null, null, null, '1268', 'Smart_咚咚', '2016-12-21 20:52:02');
INSERT INTO `bbs_topic_data` VALUES ('1252', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1253', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1254', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1255', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1256', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1257', '2', '5', '0', null, 'Smart_咚咚', '2016-12-30 23:19:11', '1268', 'Smart_咚咚', '2016-12-30 23:19:47');
INSERT INTO `bbs_topic_data` VALUES ('1258', '0', '0', '0', null, null, null, '0', null, null);
INSERT INTO `bbs_topic_data` VALUES ('1259', '0', '0', '0', null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for bbs_topic_info
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic_info`;
CREATE TABLE `bbs_topic_info` (
  `topic_id` bigint(20) NOT NULL COMMENT '主题id，对应bbs_topic表',
  `topic_is_check` int(11) NOT NULL COMMENT '是否审核通过{0：待审核，1：审核通过，2：审核未通过}',
  `topic_is_home` int(11) NOT NULL DEFAULT '0' COMMENT '是否推送首页{0：否，1：是}',
  `topic_is_home_end_time` datetime DEFAULT NULL COMMENT '推送首页至什么时候',
  `topic_is_reply` int(11) NOT NULL DEFAULT '0' COMMENT '是否开放回复{0：是，1：否}',
  `topic_is_local_top` int(11) NOT NULL DEFAULT '0' COMMENT '是否本版置顶{0：否，1：是}',
  `topic_is_local_top_end_time` datetime DEFAULT NULL COMMENT '本版置顶至什么时候',
  `topic_is_global_top` int(11) NOT NULL DEFAULT '0' COMMENT '是否全局置顶{0：否，1：是}',
  `topic_is_global_top_end_time` datetime DEFAULT NULL COMMENT '全局置顶至什么时候',
  `topic_is_hot` int(11) NOT NULL DEFAULT '0' COMMENT '是否热门{0：否，1：是}',
  `topic_is_cream` int(11) NOT NULL DEFAULT '0' COMMENT '是否加精{0：否，1：是}',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛主题信息表';

-- ----------------------------
-- Records of bbs_topic_info
-- ----------------------------
INSERT INTO `bbs_topic_info` VALUES ('1235', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1236', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1237', '1', '0', null, '0', '0', null, '0', null, '0', '1');
INSERT INTO `bbs_topic_info` VALUES ('1238', '1', '0', null, '0', '1', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1239', '1', '0', null, '1', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1240', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1241', '1', '1', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1242', '1', '0', null, '0', '0', null, '0', null, '0', '1');
INSERT INTO `bbs_topic_info` VALUES ('1243', '1', '1', null, '1', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1244', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1245', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1246', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1247', '1', '0', null, '0', '0', null, '1', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1248', '0', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1249', '0', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1250', '0', '0', null, '0', '1', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1251', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1252', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1253', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1254', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1255', '1', '0', null, '0', '0', null, '0', null, '0', '1');
INSERT INTO `bbs_topic_info` VALUES ('1256', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1257', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1258', '1', '0', null, '0', '0', null, '0', null, '0', '0');
INSERT INTO `bbs_topic_info` VALUES ('1259', '1', '0', null, '0', '0', null, '0', null, '0', '0');

-- ----------------------------
-- Table structure for bmc_log
-- ----------------------------
DROP TABLE IF EXISTS `bmc_log`;
CREATE TABLE `bmc_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `modules` varchar(255) NOT NULL COMMENT '模块',
  `status` int(1) NOT NULL COMMENT '执行状态',
  `status_desc` varchar(255) NOT NULL COMMENT '描述',
  `args` varchar(255) DEFAULT NULL COMMENT '参数',
  `user_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `user_nickname` varchar(20) NOT NULL COMMENT '操作人昵称',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `sys_log_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BMC操作历史表';

-- ----------------------------
-- Records of bmc_log
-- ----------------------------

-- ----------------------------
-- Table structure for experience_history
-- ----------------------------
DROP TABLE IF EXISTS `experience_history`;
CREATE TABLE `experience_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id，关联user_access',
  `nickname` varchar(30) NOT NULL COMMENT '用户昵称',
  `exp_value` int(11) NOT NULL COMMENT '经验多少,+,-',
  `exp_desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_exp_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='经验历史';

-- ----------------------------
-- Records of experience_history
-- ----------------------------
INSERT INTO `experience_history` VALUES ('1', '1285', 'test01', '1', '注册', '2016-10-05 21:32:50');
INSERT INTO `experience_history` VALUES ('2', '1279', 'tonboy', '1', '登录', '2016-10-05 23:19:18');
INSERT INTO `experience_history` VALUES ('3', '1285', 'test01', '1', '签到', '2016-10-05 23:54:14');
INSERT INTO `experience_history` VALUES ('4', '1285', 'test01', '1', '签到', '2016-10-06 00:02:25');
INSERT INTO `experience_history` VALUES ('5', '1279', 'tonboy', '1', '签到', '2016-10-06 00:04:10');
INSERT INTO `experience_history` VALUES ('6', '1268', 'Smart_咚咚', '1', '签到', '2016-10-06 00:04:45');
INSERT INTO `experience_history` VALUES ('7', '1280', 'tonboyw', '1', '签到', '2016-10-06 00:06:20');
INSERT INTO `experience_history` VALUES ('8', '1268', 'Smart_咚咚', '1', '登录', '2016-10-14 20:48:17');
INSERT INTO `experience_history` VALUES ('9', '1268', 'Smart_咚咚', '1', '签到', '2016-10-15 11:36:15');
INSERT INTO `experience_history` VALUES ('10', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-15 11:36:15');
INSERT INTO `experience_history` VALUES ('11', '1279', 'tonboy', '1', '登录', '2016-10-16 01:36:39');
INSERT INTO `experience_history` VALUES ('12', '1280', 'tonboyw', '1', '登录', '2016-10-16 01:37:59');
INSERT INTO `experience_history` VALUES ('13', '1280', 'tonboyw', '1', '签到', '2016-10-16 01:40:31');
INSERT INTO `experience_history` VALUES ('14', '1280', 'tonboyw', '2', '发帖', '2016-10-16 01:40:31');
INSERT INTO `experience_history` VALUES ('15', '1285', 'test01', '1', '登录', '2016-10-16 17:53:58');
INSERT INTO `experience_history` VALUES ('16', '1285', 'test01', '1', '签到', '2016-10-16 17:57:55');
INSERT INTO `experience_history` VALUES ('17', '1268', 'Smart_咚咚', '1', '登录', '2016-10-20 21:00:06');
INSERT INTO `experience_history` VALUES ('18', '1268', 'Smart_咚咚', '1', '签到', '2016-10-20 21:00:11');
INSERT INTO `experience_history` VALUES ('19', '1279', 'tonboy', '1', '登录', '2016-10-20 22:11:18');
INSERT INTO `experience_history` VALUES ('20', '1279', 'tonboy', '1', '签到', '2016-10-20 22:12:12');
INSERT INTO `experience_history` VALUES ('21', '1279', 'tonboy', '1', '签到', '2016-10-21 22:20:01');
INSERT INTO `experience_history` VALUES ('22', '1285', 'test01', '1', '登录', '2016-10-21 22:21:48');
INSERT INTO `experience_history` VALUES ('23', '1285', 'test01', '1', '签到', '2016-10-21 22:22:02');
INSERT INTO `experience_history` VALUES ('24', '1285', 'test01', '1', '登录', '2016-10-21 23:34:26');
INSERT INTO `experience_history` VALUES ('26', '1279', 'tonboy', '1', '回帖', '2016-10-21 22:20:01');
INSERT INTO `experience_history` VALUES ('27', '1279', 'tonboy', '1', '回帖', '2016-10-21 22:20:01');
INSERT INTO `experience_history` VALUES ('28', '1285', 'test01', '1', '签到', '2016-10-22 19:01:09');
INSERT INTO `experience_history` VALUES ('29', '1268', 'Smart_咚咚', '1', '登录', '2016-10-22 19:03:15');
INSERT INTO `experience_history` VALUES ('30', '1268', 'Smart_咚咚', '1', '签到', '2016-10-22 23:28:07');
INSERT INTO `experience_history` VALUES ('31', '1268', 'Smart_咚咚', '1', '签到', '2016-10-23 00:04:08');
INSERT INTO `experience_history` VALUES ('32', '1280', 'tonboyw', '1', '登录', '2016-10-23 11:07:32');
INSERT INTO `experience_history` VALUES ('33', '1268', 'Smart_咚咚', '1', '登录', '2016-10-23 11:07:51');
INSERT INTO `experience_history` VALUES ('34', '1280', 'tonboyw', '1', '登录', '2016-10-23 11:08:59');
INSERT INTO `experience_history` VALUES ('35', '1279', 'tonboy', '1', '登录', '2016-10-23 11:09:10');
INSERT INTO `experience_history` VALUES ('36', '1279', 'tonboy', '1', '签到', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('37', '1280', 'tonboyw', '1', '签到', '2016-10-23 14:31:43');
INSERT INTO `experience_history` VALUES ('38', '1280', 'tonboyw', '1', '登录', '2016-10-25 20:22:09');
INSERT INTO `experience_history` VALUES ('39', '1268', 'Smart_咚咚', '1', '登录', '2016-10-25 20:26:10');
INSERT INTO `experience_history` VALUES ('40', '1268', 'Smart_咚咚', '1', '签到', '2016-10-25 20:26:20');
INSERT INTO `experience_history` VALUES ('41', '1280', 'tonboyw', '1', '登录', '2016-10-25 20:27:26');
INSERT INTO `experience_history` VALUES ('42', '1268', 'Smart_咚咚', '1', '登录', '2016-10-27 20:11:27');
INSERT INTO `experience_history` VALUES ('43', '1268', 'Smart_咚咚', '1', '签到', '2016-10-27 20:11:38');
INSERT INTO `experience_history` VALUES ('44', '1279', 'tonboy', '1', '登录', '2016-10-27 21:45:51');
INSERT INTO `experience_history` VALUES ('45', '1280', 'tonboyw', '1', '登录', '2016-10-27 21:53:50');
INSERT INTO `experience_history` VALUES ('46', '1285', 'test01', '1', '登录', '2016-10-27 21:54:13');
INSERT INTO `experience_history` VALUES ('47', '1280', 'tonboyw', '1', '签到', '2016-10-28 20:30:57');
INSERT INTO `experience_history` VALUES ('48', '1268', 'Smart_咚咚', '1', '签到', '2016-10-28 20:32:44');
INSERT INTO `experience_history` VALUES ('49', '1285', 'test01', '1', '签到', '2016-10-28 20:40:20');
INSERT INTO `experience_history` VALUES ('50', '1268', 'Smart_咚咚', '1', '签到', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('51', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('52', '1268', 'Smart_咚咚', '1', '回帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('53', '1268', 'Smart_咚咚', '1', '回帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('54', '1268', 'Smart_咚咚', '1', '回帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('55', '1268', 'Smart_咚咚', '1', '回帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('56', '1268', 'Smart_咚咚', '1', '回帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('57', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('58', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('59', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('60', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('61', '1268', 'Smart_咚咚', '2', '发帖', '2016-10-29 12:27:42');
INSERT INTO `experience_history` VALUES ('62', '1268', 'Smart_咚咚', '1', '签到', '2016-10-30 00:11:36');
INSERT INTO `experience_history` VALUES ('63', '1268', 'Smart_咚咚', '1', '登录', '2016-11-04 20:09:47');
INSERT INTO `experience_history` VALUES ('64', '1268', 'Smart_咚咚', '1', '签到', '2016-11-04 20:11:35');
INSERT INTO `experience_history` VALUES ('65', '1268', 'Smart_咚咚', '1', '签到', '2016-11-05 00:07:28');
INSERT INTO `experience_history` VALUES ('66', '1268', 'Smart_咚咚', '1', '签到', '2016-11-06 15:24:57');
INSERT INTO `experience_history` VALUES ('67', '1279', 'tonboy', '1', '登录', '2016-11-06 18:03:31');
INSERT INTO `experience_history` VALUES ('68', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('69', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('70', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('71', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('72', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('73', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('74', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('75', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('76', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('77', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('78', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('79', '1279', 'tonboy', '1', '回帖', '2016-10-23 11:32:22');
INSERT INTO `experience_history` VALUES ('80', '1279', 'tonboy', '1', '签到', '2016-11-06 18:09:25');
INSERT INTO `experience_history` VALUES ('81', '1279', 'tonboy', '1', '登录', '2016-11-06 18:12:20');
INSERT INTO `experience_history` VALUES ('82', '1280', 'tonboyw', '1', '登录', '2016-11-06 18:30:23');
INSERT INTO `experience_history` VALUES ('83', '1268', 'Smart_咚咚', '1', '登录', '2016-11-09 19:22:00');
INSERT INTO `experience_history` VALUES ('84', '1268', 'Smart_咚咚', '1', '签到', '2016-11-09 19:22:04');
INSERT INTO `experience_history` VALUES ('85', '1280', 'tonboyw', '1', '登录', '2016-11-09 20:42:41');
INSERT INTO `experience_history` VALUES ('86', '1280', 'tonboyw', '1', '签到', '2016-11-09 20:45:36');
INSERT INTO `experience_history` VALUES ('87', '1268', 'Smart_咚咚', '1', '签到', '2016-11-10 21:11:24');
INSERT INTO `experience_history` VALUES ('88', '1279', 'tonboy', '1', '登录', '2016-11-10 21:56:48');
INSERT INTO `experience_history` VALUES ('89', '1279', 'tonboy', '1', '签到', '2016-11-10 21:57:07');
INSERT INTO `experience_history` VALUES ('90', '1268', 'Smart_咚咚', '1', '签到', '2016-11-11 20:28:45');
INSERT INTO `experience_history` VALUES ('91', '1268', 'Smart_咚咚', '2', '发帖', '2016-11-11 20:28:45');
INSERT INTO `experience_history` VALUES ('92', '1279', 'tonboy', '1', '签到', '2016-11-11 20:32:50');
INSERT INTO `experience_history` VALUES ('93', '1279', 'tonboy', '2', '发帖', '2016-11-11 20:32:50');
INSERT INTO `experience_history` VALUES ('94', '1279', 'tonboy', '1', '回帖', '2016-11-11 20:32:50');
INSERT INTO `experience_history` VALUES ('95', '1279', 'tonboy', '1', '回帖', '2016-11-11 20:32:50');
INSERT INTO `experience_history` VALUES ('96', '1279', 'tonboy', '1', '签到', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('97', '1279', 'tonboy', '1', '回帖', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('98', '1279', 'tonboy', '1', '回帖', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('99', '1279', 'tonboy', '1', '回帖', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('100', '1279', 'tonboy', '1', '回帖', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('101', '1279', 'tonboy', '1', '回帖', '2016-11-12 00:01:02');
INSERT INTO `experience_history` VALUES ('102', '1280', 'tonboyw', '1', '登录', '2016-11-13 02:26:30');
INSERT INTO `experience_history` VALUES ('103', '1280', 'tonboyw', '1', '签到', '2016-11-13 02:34:04');
INSERT INTO `experience_history` VALUES ('104', '1280', 'tonboyw', '2', '发帖', '2016-11-13 02:34:04');
INSERT INTO `experience_history` VALUES ('105', '1280', 'tonboyw', '1', '回帖', '2016-11-13 02:34:04');
INSERT INTO `experience_history` VALUES ('106', '1279', 'tonboy', '1', '登录', '2016-11-14 10:18:02');
INSERT INTO `experience_history` VALUES ('107', '1279', 'tonboy', '1', '签到', '2016-11-14 10:20:29');
INSERT INTO `experience_history` VALUES ('108', '1279', 'tonboy', '1', '回帖', '2016-11-14 10:20:29');
INSERT INTO `experience_history` VALUES ('109', '1279', 'tonboy', '1', '回帖', '2016-11-14 10:20:29');
INSERT INTO `experience_history` VALUES ('110', '1279', 'tonboy', '1', '回帖', '2016-11-14 10:20:29');
INSERT INTO `experience_history` VALUES ('111', '1279', 'tonboy', '1', '签到', '2016-11-17 19:49:41');
INSERT INTO `experience_history` VALUES ('112', '1285', 'test01', '1', '登录', '2016-11-17 20:08:21');
INSERT INTO `experience_history` VALUES ('119', '1285', 'test01', '1', '回帖', '2016-10-28 20:40:20');
INSERT INTO `experience_history` VALUES ('120', '1285', 'test01', '1', '回帖', '2016-10-28 20:40:20');
INSERT INTO `experience_history` VALUES ('121', '1279', 'tonboy', '1', '登录', '2016-11-17 20:30:40');
INSERT INTO `experience_history` VALUES ('122', '1279', 'tonboy', '1', '回帖', '2016-11-17 19:49:41');
INSERT INTO `experience_history` VALUES ('123', '1279', 'tonboy', '1', '回帖', '2016-11-17 19:49:41');
INSERT INTO `experience_history` VALUES ('124', '1280', 'tonboyw', '1', '登录', '2016-11-17 20:41:50');
INSERT INTO `experience_history` VALUES ('125', '1268', 'Smart_咚咚', '1', '登录', '2016-11-17 21:18:15');
INSERT INTO `experience_history` VALUES ('126', '1268', 'Smart_咚咚', '1', '签到', '2016-11-17 21:24:26');
INSERT INTO `experience_history` VALUES ('127', '1280', 'tonboyw', '1', '登录', '2016-11-17 21:33:35');
INSERT INTO `experience_history` VALUES ('128', '1280', 'tonboyw', '1', '签到', '2016-11-17 21:33:39');
INSERT INTO `experience_history` VALUES ('129', '1280', 'tonboyw', '1', '签到', '2016-11-18 17:09:57');
INSERT INTO `experience_history` VALUES ('130', '1268', 'Smart_咚咚', '1', '签到', '2016-11-18 17:13:15');
INSERT INTO `experience_history` VALUES ('131', '1279', 'tonboy', '1', '签到', '2016-11-18 23:52:01');
INSERT INTO `experience_history` VALUES ('132', '1279', 'tonboy', '1', '回帖', '2016-11-18 23:52:01');
INSERT INTO `experience_history` VALUES ('133', '1279', 'tonboy', '1', '签到', '2016-11-19 23:19:53');
INSERT INTO `experience_history` VALUES ('134', '1268', 'Smart_咚咚', '1', '签到', '2016-11-20 02:39:59');
INSERT INTO `experience_history` VALUES ('135', '1280', 'tonboyw', '1', '登录', '2016-11-20 20:40:26');
INSERT INTO `experience_history` VALUES ('136', '1280', 'tonboyw', '1', '登录', '2016-11-20 20:40:47');
INSERT INTO `experience_history` VALUES ('137', '1279', 'tonboy', '1', '登录', '2016-11-22 13:30:26');
INSERT INTO `experience_history` VALUES ('138', '1279', 'tonboy', '1', '登录', '2016-11-22 13:30:26');
INSERT INTO `experience_history` VALUES ('139', '1280', 'tonboyw', '1', '登录', '2016-11-29 20:42:02');
INSERT INTO `experience_history` VALUES ('140', '1268', 'Smart_咚咚', '1', '登录', '2016-11-29 20:42:23');
INSERT INTO `experience_history` VALUES ('141', '1280', 'tonboyw', '1', '登录', '2016-11-29 20:58:17');
INSERT INTO `experience_history` VALUES ('142', '1279', 'tonboy', '1', '登录', '2016-11-30 17:43:41');
INSERT INTO `experience_history` VALUES ('143', '1280', 'tonboyw', '1', '登录', '2016-11-30 17:48:48');
INSERT INTO `experience_history` VALUES ('144', '1280', 'tonboyw', '1', '签到', '2016-11-30 17:50:07');
INSERT INTO `experience_history` VALUES ('145', '1268', 'Smart_咚咚', '1', '登录', '2016-11-30 18:20:31');
INSERT INTO `experience_history` VALUES ('146', '1280', 'tonboyw', '1', '登录', '2016-11-30 18:38:50');
INSERT INTO `experience_history` VALUES ('147', '1268', 'Smart_咚咚', '1', '登录', '2016-11-30 18:42:46');
INSERT INTO `experience_history` VALUES ('148', '1280', 'tonboyw', '1', '签到', '2016-11-30 17:50:07');
INSERT INTO `experience_history` VALUES ('149', '1279', 'tonboy', '1', '登录', '2016-11-30 19:04:35');
INSERT INTO `experience_history` VALUES ('150', '1268', 'Smart_咚咚', '1', '登录', '2016-11-30 19:11:22');
INSERT INTO `experience_history` VALUES ('151', '1280', 'tonboyw', '1', '回帖', '2016-11-30 17:50:07');
INSERT INTO `experience_history` VALUES ('152', '1285', 'test01', '1', '登录', '2016-12-01 15:53:44');
INSERT INTO `experience_history` VALUES ('153', '1285', 'test01', '1', '签到', '2016-12-01 15:53:49');
INSERT INTO `experience_history` VALUES ('154', '1285', 'test01', '1', '登录', '2016-12-03 23:09:10');
INSERT INTO `experience_history` VALUES ('155', '1285', 'test01', '1', '签到', '2016-12-03 23:09:31');
INSERT INTO `experience_history` VALUES ('156', '1268', 'Smart_咚咚', '1', '登录', '2016-12-03 23:09:46');
INSERT INTO `experience_history` VALUES ('157', '1280', 'tonboyw', '1', '登录', '2016-12-04 20:26:50');
INSERT INTO `experience_history` VALUES ('158', '1280', 'tonboyw', '1', '签到', '2016-12-04 20:27:22');
INSERT INTO `experience_history` VALUES ('159', '1279', 'tonboy', '1', '登录', '2016-12-04 21:05:57');
INSERT INTO `experience_history` VALUES ('160', '1285', 'test01', '1', '登录', '2016-12-20 20:30:22');
INSERT INTO `experience_history` VALUES ('161', '1280', 'tonboyw', '1', '登录', '2016-12-20 20:32:18');
INSERT INTO `experience_history` VALUES ('162', '1280', 'tonboyw', '1', '签到', '2016-12-20 20:39:45');
INSERT INTO `experience_history` VALUES ('163', '1268', 'Smart_咚咚', '1', '登录', '2016-12-20 20:40:03');
INSERT INTO `experience_history` VALUES ('164', '1285', 'test01', '1', '签到', '2016-12-21 21:32:14');
INSERT INTO `experience_history` VALUES ('165', '1285', 'test01', '2', '发帖', '2016-12-21 21:32:14');
INSERT INTO `experience_history` VALUES ('166', '1285', 'test01', '1', '回帖', '2016-12-21 21:32:14');
INSERT INTO `experience_history` VALUES ('167', '1285', 'test01', '1', '签到', '2016-12-21 21:32:14');
INSERT INTO `experience_history` VALUES ('168', '1280', 'tonboyw', '1', '登录', '2016-12-24 16:53:35');
INSERT INTO `experience_history` VALUES ('169', '1280', 'tonboyw', '1', '签到', '2016-12-24 16:55:06');
INSERT INTO `experience_history` VALUES ('170', '1285', 'test01', '1', '登录', '2016-12-24 17:01:40');
INSERT INTO `experience_history` VALUES ('171', '1285', 'test01', '1', '签到', '2016-12-24 17:01:43');
INSERT INTO `experience_history` VALUES ('172', '1285', 'test01', '1', '回帖', '2016-12-24 17:01:43');
INSERT INTO `experience_history` VALUES ('173', '1280', 'tonboyw', '1', '签到', '2016-12-25 17:21:11');
INSERT INTO `experience_history` VALUES ('174', '1280', 'tonboyw', '1', '登录', '2016-12-28 23:44:47');
INSERT INTO `experience_history` VALUES ('175', '1280', 'tonboyw', '1', '签到', '2016-12-28 23:44:50');
INSERT INTO `experience_history` VALUES ('176', '1285', 'test01', '1', '登录', '2016-12-28 23:45:40');
INSERT INTO `experience_history` VALUES ('177', '1285', 'test01', '1', '签到', '2016-12-28 23:45:45');
INSERT INTO `experience_history` VALUES ('178', '1268', 'Smart_咚咚', '1', '登录', '2016-12-28 23:46:02');
INSERT INTO `experience_history` VALUES ('179', '1285', 'test01', '1', '签到', '2016-12-28 23:45:45');
INSERT INTO `experience_history` VALUES ('180', '1286', 'test', '1', '注册', '2016-12-29 20:00:44');
INSERT INTO `experience_history` VALUES ('181', '1286', 'test', '1', '登录', '2016-12-29 20:01:35');
INSERT INTO `experience_history` VALUES ('182', '1286', 'test', '1', '签到', '2016-12-29 20:01:41');
INSERT INTO `experience_history` VALUES ('183', '1286', 'test', '1', '回帖', '2016-12-29 20:01:41');
INSERT INTO `experience_history` VALUES ('184', '1268', 'Smart_咚咚', '1', '登录', '2016-12-29 20:03:18');
INSERT INTO `experience_history` VALUES ('185', '1280', 'tonboyw', '1', '登录', '2016-12-30 19:41:30');
INSERT INTO `experience_history` VALUES ('186', '1280', 'tonboyw', '1', '签到', '2016-12-30 19:41:31');
INSERT INTO `experience_history` VALUES ('187', '1285', 'test01', '1', '登录', '2016-12-30 19:41:39');
INSERT INTO `experience_history` VALUES ('188', '1285', 'test01', '1', '签到', '2016-12-30 19:41:41');
INSERT INTO `experience_history` VALUES ('189', '1268', 'Smart_咚咚', '1', '登录', '2016-12-30 19:41:50');
INSERT INTO `experience_history` VALUES ('190', '1280', 'tonboyw', '1', '签到', '2016-12-31 21:35:26');
INSERT INTO `experience_history` VALUES ('191', '1280', 'tonboyw', '1', '登录', '2017-01-02 21:41:00');
INSERT INTO `experience_history` VALUES ('192', '1280', 'tonboyw', '1', '签到', '2017-01-02 21:41:02');
INSERT INTO `experience_history` VALUES ('193', '1285', 'test01', '1', '登录', '2017-01-02 21:41:16');
INSERT INTO `experience_history` VALUES ('194', '1285', 'test01', '1', '签到', '2017-01-02 21:41:18');
INSERT INTO `experience_history` VALUES ('195', '1286', 'test', '1', '登录', '2017-01-02 21:41:32');
INSERT INTO `experience_history` VALUES ('196', '1286', 'test', '1', '签到', '2017-01-02 21:41:34');
INSERT INTO `experience_history` VALUES ('197', '1286', 'test', '2', '发帖', '2017-01-02 21:41:34');
INSERT INTO `experience_history` VALUES ('198', '1286', 'test', '1', '回帖', '2017-01-02 21:41:34');
INSERT INTO `experience_history` VALUES ('199', '1268', 'Smart_咚咚', '1', '登录', '2017-01-02 21:42:53');

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE `friend_link` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `link_name` varchar(30) NOT NULL COMMENT '友链名字',
  `link` varchar(255) NOT NULL COMMENT '链接',
  `link_sign` int(11) NOT NULL COMMENT '标记{1：站内，2：友链}',
  `link_status` int(11) NOT NULL DEFAULT '0' COMMENT '类型{0：代审核，1：正常，2：已删除}',
  `link_contacts` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `link_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `link_end_time` date DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`link_id`),
  KEY `idx_link_status` (`link_status`),
  KEY `link_end_time` (`link_end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of friend_link
-- ----------------------------
INSERT INTO `friend_link` VALUES ('1', '联系我们', 'mailto:java_bbs@163.com', '1', '1', null, '2016-11-11 19:35:36', '2030-11-11');
INSERT INTO `friend_link` VALUES ('2', '友链申请', '/bbs/friendlink', '1', '1', null, '2016-11-11 19:36:50', '2030-11-11');
INSERT INTO `friend_link` VALUES ('3', 'CSDN博客', 'http://blog.csdn.net', '2', '1', null, '2016-11-11 19:38:20', '2017-11-11');
INSERT INTO `friend_link` VALUES ('4', '我的Github', 'https://www.github.com/dongbow', '2', '1', null, '2016-11-11 19:39:12', '2030-11-11');
INSERT INTO `friend_link` VALUES ('5', '我的微博', 'http://weibo.com/dongbow', '2', '1', null, '2016-11-11 19:40:05', '2030-11-11');
INSERT INTO `friend_link` VALUES ('6', '最代码', 'http://www.zuidaima.com', '2', '1', null, '2016-11-11 19:40:41', '2017-11-11');
INSERT INTO `friend_link` VALUES ('7', '开源中国', 'http://oschina.net/', '2', '0', '123456789', '2016-11-13 18:23:02', null);
INSERT INTO `friend_link` VALUES ('8', '开源中国', 'http://oschina.net/', '2', '0', '123456789', '2016-11-17 21:25:27', null);
INSERT INTO `friend_link` VALUES ('9', '开源中国', 'http://oschina.net/', '2', '0', '123456789', '2016-12-03 17:36:03', null);
INSERT INTO `friend_link` VALUES ('10', 'q', 'q', '2', '0', 'q', '2016-12-21 21:59:35', null);
INSERT INTO `friend_link` VALUES ('11', '开源中国', 'http://oschina.net/', '2', '0', '123456789', '2016-12-21 22:00:08', null);

-- ----------------------------
-- Table structure for gold_history
-- ----------------------------
DROP TABLE IF EXISTS `gold_history`;
CREATE TABLE `gold_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id，关联user_access',
  `nickname` varchar(30) NOT NULL COMMENT '用户昵称',
  `gold_value` int(11) NOT NULL COMMENT '积分多少，+，-',
  `gold_from` int(11) NOT NULL COMMENT '来源',
  `gold_desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_gold_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='金币历史';

-- ----------------------------
-- Records of gold_history
-- ----------------------------
INSERT INTO `gold_history` VALUES ('2', '1285', 'test01', '50', '2', '注册', '2016-10-05 21:32:50');
INSERT INTO `gold_history` VALUES ('3', '1279', 'tonboy', '1', '1', '登录', '2016-10-05 23:19:18');
INSERT INTO `gold_history` VALUES ('4', '1285', 'test01', '1', '0', '签到', '2016-10-05 23:54:14');
INSERT INTO `gold_history` VALUES ('5', '1279', 'tonboy', '1', '0', '签到', '2016-10-06 00:04:10');
INSERT INTO `gold_history` VALUES ('6', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-06 00:04:45');
INSERT INTO `gold_history` VALUES ('7', '1280', 'tonboyw', '1', '0', '签到', '2016-10-06 00:06:20');
INSERT INTO `gold_history` VALUES ('8', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-14 20:48:17');
INSERT INTO `gold_history` VALUES ('9', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-15 11:36:15');
INSERT INTO `gold_history` VALUES ('10', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-15 11:36:15');
INSERT INTO `gold_history` VALUES ('11', '1279', 'tonboy', '1', '1', '登录', '2016-10-16 01:36:39');
INSERT INTO `gold_history` VALUES ('12', '1280', 'tonboyw', '1', '1', '登录', '2016-10-16 01:37:59');
INSERT INTO `gold_history` VALUES ('13', '1280', 'tonboyw', '1', '0', '签到', '2016-10-16 01:40:31');
INSERT INTO `gold_history` VALUES ('14', '1280', 'tonboyw', '2', '3', '发帖', '2016-10-16 01:40:31');
INSERT INTO `gold_history` VALUES ('15', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-20 21:00:06');
INSERT INTO `gold_history` VALUES ('16', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-20 21:00:11');
INSERT INTO `gold_history` VALUES ('17', '1279', 'tonboy', '1', '1', '登录', '2016-10-20 22:11:18');
INSERT INTO `gold_history` VALUES ('18', '1279', 'tonboy', '1', '0', '签到', '2016-10-20 22:12:12');
INSERT INTO `gold_history` VALUES ('19', '1279', 'tonboy', '1', '0', '签到', '2016-10-21 22:20:01');
INSERT INTO `gold_history` VALUES ('20', '1279', 'tonboy', '1', '0', '签到', '2016-10-21 22:20:01');
INSERT INTO `gold_history` VALUES ('21', '1279', 'tonboy', '1', '4', '回帖', '2016-10-21 22:20:01');
INSERT INTO `gold_history` VALUES ('22', '1279', 'tonboy', '1', '4', '回帖', '2016-10-21 22:20:01');
INSERT INTO `gold_history` VALUES ('23', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-22 19:03:15');
INSERT INTO `gold_history` VALUES ('24', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-22 23:28:07');
INSERT INTO `gold_history` VALUES ('25', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-23 00:04:08');
INSERT INTO `gold_history` VALUES ('26', '1280', 'tonboyw', '1', '1', '登录', '2016-10-23 11:07:32');
INSERT INTO `gold_history` VALUES ('27', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-23 11:07:51');
INSERT INTO `gold_history` VALUES ('28', '1280', 'tonboyw', '1', '1', '登录', '2016-10-23 11:08:59');
INSERT INTO `gold_history` VALUES ('29', '1279', 'tonboy', '1', '1', '登录', '2016-10-23 11:09:10');
INSERT INTO `gold_history` VALUES ('30', '1279', 'tonboy', '1', '0', '签到', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('31', '1280', 'tonboyw', '1', '0', '签到', '2016-10-23 14:31:43');
INSERT INTO `gold_history` VALUES ('32', '1280', 'tonboyw', '1', '1', '登录', '2016-10-25 20:22:09');
INSERT INTO `gold_history` VALUES ('33', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-25 20:26:10');
INSERT INTO `gold_history` VALUES ('34', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-25 20:26:20');
INSERT INTO `gold_history` VALUES ('35', '1280', 'tonboyw', '1', '1', '登录', '2016-10-25 20:27:26');
INSERT INTO `gold_history` VALUES ('36', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-10-27 20:11:27');
INSERT INTO `gold_history` VALUES ('37', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-27 20:11:38');
INSERT INTO `gold_history` VALUES ('38', '1279', 'tonboy', '1', '1', '登录', '2016-10-27 21:45:51');
INSERT INTO `gold_history` VALUES ('39', '1280', 'tonboyw', '1', '1', '登录', '2016-10-27 21:53:50');
INSERT INTO `gold_history` VALUES ('40', '1280', 'tonboyw', '1', '1', '登录', '2016-10-27 21:53:50');
INSERT INTO `gold_history` VALUES ('41', '1280', 'tonboyw', '1', '0', '签到', '2016-10-28 20:30:57');
INSERT INTO `gold_history` VALUES ('42', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-28 20:32:44');
INSERT INTO `gold_history` VALUES ('43', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-28 20:32:44');
INSERT INTO `gold_history` VALUES ('44', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('45', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('46', '1268', 'Smart_咚咚', '1', '4', '回帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('47', '1268', 'Smart_咚咚', '1', '4', '回帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('48', '1268', 'Smart_咚咚', '1', '4', '回帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('49', '1268', 'Smart_咚咚', '1', '4', '回帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('50', '1268', 'Smart_咚咚', '1', '4', '回帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('51', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('52', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('53', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('54', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('55', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-10-29 12:27:42');
INSERT INTO `gold_history` VALUES ('56', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-10-30 00:11:36');
INSERT INTO `gold_history` VALUES ('57', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-04 20:09:47');
INSERT INTO `gold_history` VALUES ('58', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-04 20:11:35');
INSERT INTO `gold_history` VALUES ('59', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-05 00:07:28');
INSERT INTO `gold_history` VALUES ('60', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-06 15:24:57');
INSERT INTO `gold_history` VALUES ('61', '1279', 'tonboy', '1', '1', '登录', '2016-11-06 18:03:31');
INSERT INTO `gold_history` VALUES ('62', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('63', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('64', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('65', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('66', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('67', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('68', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('69', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('70', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('71', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('72', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('73', '1279', 'tonboy', '1', '4', '回帖', '2016-10-23 11:32:22');
INSERT INTO `gold_history` VALUES ('74', '1279', 'tonboy', '1', '0', '签到', '2016-11-06 18:09:25');
INSERT INTO `gold_history` VALUES ('75', '1279', 'tonboy', '1', '1', '登录', '2016-11-06 18:12:20');
INSERT INTO `gold_history` VALUES ('76', '1280', 'tonboyw', '1', '1', '登录', '2016-11-06 18:30:23');
INSERT INTO `gold_history` VALUES ('77', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-09 19:22:00');
INSERT INTO `gold_history` VALUES ('78', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-09 19:22:04');
INSERT INTO `gold_history` VALUES ('79', '1280', 'tonboyw', '1', '1', '登录', '2016-11-09 20:42:41');
INSERT INTO `gold_history` VALUES ('80', '1280', 'tonboyw', '1', '0', '签到', '2016-11-09 20:45:36');
INSERT INTO `gold_history` VALUES ('81', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-10 21:11:24');
INSERT INTO `gold_history` VALUES ('82', '1279', 'tonboy', '1', '1', '登录', '2016-11-10 21:56:48');
INSERT INTO `gold_history` VALUES ('83', '1279', 'tonboy', '1', '0', '签到', '2016-11-10 21:57:07');
INSERT INTO `gold_history` VALUES ('84', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-11 20:28:45');
INSERT INTO `gold_history` VALUES ('85', '1268', 'Smart_咚咚', '2', '3', '发帖', '2016-11-11 20:28:45');
INSERT INTO `gold_history` VALUES ('86', '1279', 'tonboy', '1', '0', '签到', '2016-11-11 20:32:50');
INSERT INTO `gold_history` VALUES ('87', '1279', 'tonboy', '2', '3', '发帖', '2016-11-11 20:32:50');
INSERT INTO `gold_history` VALUES ('88', '1279', 'tonboy', '1', '4', '回帖', '2016-11-11 20:32:50');
INSERT INTO `gold_history` VALUES ('89', '1279', 'tonboy', '1', '4', '回帖', '2016-11-11 20:32:50');
INSERT INTO `gold_history` VALUES ('90', '1279', 'tonboy', '1', '0', '签到', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('91', '1279', 'tonboy', '1', '4', '回帖', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('92', '1279', 'tonboy', '1', '4', '回帖', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('93', '1279', 'tonboy', '1', '4', '回帖', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('94', '1279', 'tonboy', '1', '4', '回帖', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('95', '1279', 'tonboy', '1', '4', '回帖', '2016-11-12 00:01:02');
INSERT INTO `gold_history` VALUES ('96', '1280', 'tonboyw', '1', '1', '登录', '2016-11-13 02:26:30');
INSERT INTO `gold_history` VALUES ('97', '1280', 'tonboyw', '1', '0', '签到', '2016-11-13 02:34:04');
INSERT INTO `gold_history` VALUES ('98', '1280', 'tonboyw', '2', '3', '发帖', '2016-11-13 02:34:04');
INSERT INTO `gold_history` VALUES ('99', '1280', 'tonboyw', '1', '4', '回帖', '2016-11-13 02:34:04');
INSERT INTO `gold_history` VALUES ('100', '1279', 'tonboy', '1', '1', '登录', '2016-11-14 10:18:02');
INSERT INTO `gold_history` VALUES ('101', '1279', 'tonboy', '1', '0', '签到', '2016-11-14 10:20:29');
INSERT INTO `gold_history` VALUES ('102', '1279', 'tonboy', '1', '4', '回帖', '2016-11-14 10:20:29');
INSERT INTO `gold_history` VALUES ('103', '1279', 'tonboy', '1', '4', '回帖', '2016-11-14 10:20:29');
INSERT INTO `gold_history` VALUES ('104', '1279', 'tonboy', '1', '4', '回帖', '2016-11-14 10:20:29');
INSERT INTO `gold_history` VALUES ('105', '1279', 'tonboy', '1', '0', '签到', '2016-11-17 19:49:41');
INSERT INTO `gold_history` VALUES ('106', '1285', 'test01', '1', '4', '回帖', '2016-10-28 20:40:20');
INSERT INTO `gold_history` VALUES ('107', '1279', 'tonboy', '1', '1', '登录', '2016-11-17 20:30:40');
INSERT INTO `gold_history` VALUES ('108', '1279', 'tonboy', '1', '4', '回帖', '2016-11-17 19:49:41');
INSERT INTO `gold_history` VALUES ('109', '1279', 'tonboy', '1', '4', '回帖', '2016-11-17 19:49:41');
INSERT INTO `gold_history` VALUES ('110', '1280', 'tonboyw', '1', '1', '登录', '2016-11-17 20:41:50');
INSERT INTO `gold_history` VALUES ('111', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-17 21:18:15');
INSERT INTO `gold_history` VALUES ('112', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-17 21:24:26');
INSERT INTO `gold_history` VALUES ('113', '1280', 'tonboyw', '1', '1', '登录', '2016-11-17 21:33:35');
INSERT INTO `gold_history` VALUES ('114', '1280', 'tonboyw', '1', '0', '签到', '2016-11-17 21:33:39');
INSERT INTO `gold_history` VALUES ('115', '1280', 'tonboyw', '1', '0', '签到', '2016-11-18 17:09:57');
INSERT INTO `gold_history` VALUES ('116', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-18 17:13:15');
INSERT INTO `gold_history` VALUES ('117', '1279', 'tonboy', '1', '0', '签到', '2016-11-18 23:52:01');
INSERT INTO `gold_history` VALUES ('118', '1279', 'tonboy', '1', '4', '回帖', '2016-11-18 23:52:01');
INSERT INTO `gold_history` VALUES ('119', '1279', 'tonboy', '1', '0', '签到', '2016-11-19 23:19:53');
INSERT INTO `gold_history` VALUES ('120', '1268', 'Smart_咚咚', '1', '0', '签到', '2016-11-20 02:39:59');
INSERT INTO `gold_history` VALUES ('121', '1280', 'tonboyw', '1', '1', '登录', '2016-11-20 20:40:26');
INSERT INTO `gold_history` VALUES ('122', '1280', 'tonboyw', '1', '1', '登录', '2016-11-20 20:40:47');
INSERT INTO `gold_history` VALUES ('123', '1279', 'tonboy', '1', '1', '登录', '2016-11-22 13:30:26');
INSERT INTO `gold_history` VALUES ('124', '1279', 'tonboy', '1', '1', '登录', '2016-11-22 13:30:26');
INSERT INTO `gold_history` VALUES ('125', '1280', 'tonboyw', '1', '1', '登录', '2016-11-29 20:42:02');
INSERT INTO `gold_history` VALUES ('126', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-29 20:42:23');
INSERT INTO `gold_history` VALUES ('127', '1280', 'tonboyw', '1', '1', '登录', '2016-11-29 20:58:17');
INSERT INTO `gold_history` VALUES ('128', '1279', 'tonboy', '1', '1', '登录', '2016-11-30 17:43:41');
INSERT INTO `gold_history` VALUES ('129', '1280', 'tonboyw', '1', '1', '登录', '2016-11-30 17:48:48');
INSERT INTO `gold_history` VALUES ('130', '1280', 'tonboyw', '1', '0', '签到', '2016-11-30 17:50:07');
INSERT INTO `gold_history` VALUES ('131', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-30 18:20:31');
INSERT INTO `gold_history` VALUES ('132', '1280', 'tonboyw', '1', '1', '登录', '2016-11-30 18:38:50');
INSERT INTO `gold_history` VALUES ('133', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-30 18:42:46');
INSERT INTO `gold_history` VALUES ('134', '1280', 'tonboyw', '1', '0', '签到', '2016-11-30 17:50:07');
INSERT INTO `gold_history` VALUES ('135', '1279', 'tonboy', '1', '1', '登录', '2016-11-30 19:04:35');
INSERT INTO `gold_history` VALUES ('136', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-11-30 19:11:22');
INSERT INTO `gold_history` VALUES ('137', '1280', 'tonboyw', '1', '4', '回帖', '2016-11-30 17:50:07');
INSERT INTO `gold_history` VALUES ('138', '1285', 'test01', '1', '1', '登录', '2016-12-01 15:53:44');
INSERT INTO `gold_history` VALUES ('139', '1285', 'test01', '1', '0', '签到', '2016-12-01 15:53:49');
INSERT INTO `gold_history` VALUES ('140', '1285', 'test01', '1', '1', '登录', '2016-12-03 23:09:10');
INSERT INTO `gold_history` VALUES ('141', '1285', 'test01', '1', '0', '签到', '2016-12-03 23:09:31');
INSERT INTO `gold_history` VALUES ('142', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-12-03 23:09:46');
INSERT INTO `gold_history` VALUES ('143', '1280', 'tonboyw', '1', '1', '登录', '2016-12-04 20:26:50');
INSERT INTO `gold_history` VALUES ('144', '1280', 'tonboyw', '1', '0', '签到', '2016-12-04 20:27:22');
INSERT INTO `gold_history` VALUES ('145', '1279', 'tonboy', '1', '1', '登录', '2016-12-04 21:05:57');
INSERT INTO `gold_history` VALUES ('146', '1285', 'test01', '1', '1', '登录', '2016-12-20 20:30:22');
INSERT INTO `gold_history` VALUES ('147', '1280', 'tonboyw', '1', '1', '登录', '2016-12-20 20:32:18');
INSERT INTO `gold_history` VALUES ('148', '1280', 'tonboyw', '1', '0', '签到', '2016-12-20 20:39:45');
INSERT INTO `gold_history` VALUES ('149', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-12-20 20:40:03');
INSERT INTO `gold_history` VALUES ('150', '1285', 'test01', '1', '0', '签到', '2016-12-21 21:32:14');
INSERT INTO `gold_history` VALUES ('151', '1285', 'test01', '2', '3', '发帖', '2016-12-21 21:32:14');
INSERT INTO `gold_history` VALUES ('152', '1285', 'test01', '1', '4', '回帖', '2016-12-21 21:32:14');
INSERT INTO `gold_history` VALUES ('153', '1285', 'test01', '1', '0', '签到', '2016-12-21 21:32:14');
INSERT INTO `gold_history` VALUES ('154', '1280', 'tonboyw', '1', '1', '登录', '2016-12-24 16:53:35');
INSERT INTO `gold_history` VALUES ('155', '1280', 'tonboyw', '1', '0', '签到', '2016-12-24 16:55:06');
INSERT INTO `gold_history` VALUES ('156', '1285', 'test01', '1', '1', '登录', '2016-12-24 17:01:40');
INSERT INTO `gold_history` VALUES ('157', '1285', 'test01', '1', '0', '签到', '2016-12-24 17:01:43');
INSERT INTO `gold_history` VALUES ('158', '1285', 'test01', '1', '4', '回帖', '2016-12-24 17:01:43');
INSERT INTO `gold_history` VALUES ('159', '1280', 'tonboyw', '1', '0', '签到', '2016-12-25 17:21:11');
INSERT INTO `gold_history` VALUES ('160', '1280', 'tonboyw', '1', '1', '登录', '2016-12-28 23:44:47');
INSERT INTO `gold_history` VALUES ('161', '1280', 'tonboyw', '1', '0', '签到', '2016-12-28 23:44:50');
INSERT INTO `gold_history` VALUES ('162', '1285', 'test01', '1', '1', '登录', '2016-12-28 23:45:40');
INSERT INTO `gold_history` VALUES ('163', '1285', 'test01', '1', '0', '签到', '2016-12-28 23:45:45');
INSERT INTO `gold_history` VALUES ('164', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-12-28 23:46:02');
INSERT INTO `gold_history` VALUES ('165', '1285', 'test01', '1', '0', '签到', '2016-12-28 23:45:45');
INSERT INTO `gold_history` VALUES ('166', '1286', 'test', '50', '2', '注册', '2016-12-29 20:00:44');
INSERT INTO `gold_history` VALUES ('167', '1286', 'test', '1', '1', '登录', '2016-12-29 20:01:35');
INSERT INTO `gold_history` VALUES ('168', '1286', 'test', '1', '0', '签到', '2016-12-29 20:01:41');
INSERT INTO `gold_history` VALUES ('169', '1286', 'test', '1', '4', '回帖', '2016-12-29 20:01:41');
INSERT INTO `gold_history` VALUES ('170', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-12-29 20:03:18');
INSERT INTO `gold_history` VALUES ('171', '1280', 'tonboyw', '1', '1', '登录', '2016-12-30 19:41:30');
INSERT INTO `gold_history` VALUES ('172', '1280', 'tonboyw', '1', '0', '签到', '2016-12-30 19:41:31');
INSERT INTO `gold_history` VALUES ('173', '1285', 'test01', '1', '1', '登录', '2016-12-30 19:41:39');
INSERT INTO `gold_history` VALUES ('174', '1285', 'test01', '1', '0', '签到', '2016-12-30 19:41:41');
INSERT INTO `gold_history` VALUES ('175', '1268', 'Smart_咚咚', '1', '1', '登录', '2016-12-30 19:41:50');
INSERT INTO `gold_history` VALUES ('176', '1280', 'tonboyw', '1', '0', '签到', '2016-12-31 21:35:26');
INSERT INTO `gold_history` VALUES ('177', '1280', 'tonboyw', '1', '1', '登录', '2017-01-02 21:41:00');
INSERT INTO `gold_history` VALUES ('178', '1280', 'tonboyw', '1', '0', '签到', '2017-01-02 21:41:02');
INSERT INTO `gold_history` VALUES ('179', '1285', 'test01', '1', '1', '登录', '2017-01-02 21:41:16');
INSERT INTO `gold_history` VALUES ('180', '1285', 'test01', '1', '0', '签到', '2017-01-02 21:41:18');
INSERT INTO `gold_history` VALUES ('181', '1286', 'test', '1', '1', '登录', '2017-01-02 21:41:32');
INSERT INTO `gold_history` VALUES ('182', '1286', 'test', '1', '0', '签到', '2017-01-02 21:41:34');
INSERT INTO `gold_history` VALUES ('183', '1286', 'test', '2', '3', '发帖', '2017-01-02 21:41:34');
INSERT INTO `gold_history` VALUES ('184', '1286', 'test', '1', '4', '回帖', '2017-01-02 21:41:34');
INSERT INTO `gold_history` VALUES ('185', '1268', 'Smart_咚咚', '1', '1', '登录', '2017-01-02 21:42:53');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_name` varchar(20) NOT NULL COMMENT '登录名',
  `login_link` varchar(255) NOT NULL COMMENT '登录页面地址',
  `is_success` int(11) NOT NULL COMMENT '登录是否成功',
  `error_type` int(11) DEFAULT NULL COMMENT '登录错误类型',
  `login_create_time` datetime DEFAULT NULL,
  `login_ip` varchar(100) NOT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_id`),
  KEY `idx_error_type` (`error_type`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('1', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 00:37:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('2', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 11:43:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('3', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 11:50:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('4', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 11:56:07', '127.0.0.1');
INSERT INTO `login_log` VALUES ('5', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 13:10:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('6', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 13:11:24', '127.0.0.1');
INSERT INTO `login_log` VALUES ('7', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 13:11:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('8', 'dongbo', '/system/admin/account/login', '0', '0', '2016-09-15 13:18:59', '127.0.0.1');
INSERT INTO `login_log` VALUES ('9', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 13:19:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('10', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 14:34:31', '127.0.0.1');
INSERT INTO `login_log` VALUES ('11', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 15:01:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('12', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 15:15:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('13', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 15:37:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('14', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 17:49:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('15', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 19:12:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('16', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 23:27:53', '127.0.0.1');
INSERT INTO `login_log` VALUES ('17', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-15 23:48:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('18', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-18 20:31:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('19', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-23 22:06:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('20', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-23 22:56:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('21', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-24 09:21:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('22', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-24 15:29:56', '127.0.0.1');
INSERT INTO `login_log` VALUES ('23', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 20:17:46', '127.0.0.1');
INSERT INTO `login_log` VALUES ('24', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 20:25:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('25', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 20:33:08', '127.0.0.1');
INSERT INTO `login_log` VALUES ('26', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 20:48:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('27', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 21:00:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('28', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 21:04:12', '127.0.0.1');
INSERT INTO `login_log` VALUES ('29', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 21:06:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('30', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 21:12:55', '127.0.0.1');
INSERT INTO `login_log` VALUES ('31', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-25 21:57:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('32', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-26 20:32:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('33', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-26 20:57:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('34', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-28 20:34:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('35', 'dongbo', '/system/admin/account/login', '1', null, '2016-09-28 20:35:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('36', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-01 00:37:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('37', 'tonboy', '/account/login', '0', '0', '2016-10-01 23:03:19', '127.0.0.1');
INSERT INTO `login_log` VALUES ('38', 'tonboy', '/account/login', '0', '0', '2016-10-01 23:07:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('39', 'tonboy', '/account/login', '1', null, '2016-10-01 23:13:03', '127.0.0.1');
INSERT INTO `login_log` VALUES ('40', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-01 23:15:14', '127.0.0.1');
INSERT INTO `login_log` VALUES ('41', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-02 10:57:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('42', 'dongbo', '/account/login', '1', null, '2016-10-02 14:25:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('43', 'dongbo', '/account/login', '1', null, '2016-10-02 14:36:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('44', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-02 19:18:03', '127.0.0.1');
INSERT INTO `login_log` VALUES ('45', 'tonboy', '/account/login', '1', null, '2016-10-02 23:47:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('46', 'tonboyw', '/account/login', '1', null, '2016-10-03 00:13:37', '127.0.0.1');
INSERT INTO `login_log` VALUES ('47', 'tonboyw', '/account/login', '1', null, '2016-10-03 19:56:54', '127.0.0.1');
INSERT INTO `login_log` VALUES ('48', 'tonboyw', '/account/login', '1', null, '2016-10-03 20:09:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('49', 'tonboyw', '/account/login', '1', null, '2016-10-04 11:33:58', '127.0.0.1');
INSERT INTO `login_log` VALUES ('50', 'tonboy', '/account/login', '1', null, '2016-10-04 12:16:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('51', 'tonboy', '/account/login', '1', null, '2016-10-04 12:17:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('52', 'dongbo', '/account/login', '1', null, '2016-10-04 12:24:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('53', 'dongbo', '/account/login', '1', null, '2016-10-04 15:54:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('54', 'tonboy', '/account/login', '1', null, '2016-10-04 21:23:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('55', 'dongbo', '/account/login', '1', null, '2016-10-04 23:00:04', '127.0.0.1');
INSERT INTO `login_log` VALUES ('56', 'dongbo', '/account/login', '1', null, '2016-10-05 00:28:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('57', 'tonboyw', '/account/login', '0', '0', '2016-10-05 00:28:54', '127.0.0.1');
INSERT INTO `login_log` VALUES ('58', 'tonboyw', '/account/login', '1', null, '2016-10-05 00:29:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('59', 'dongbo', '/account/login', '1', null, '2016-10-05 02:19:21', '127.0.0.1');
INSERT INTO `login_log` VALUES ('60', 'tonboyw', '/account/login', '1', null, '2016-10-05 02:22:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('61', 'tonboy', '/account/login', '1', null, '2016-10-05 02:23:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('62', 'tonboy', '/account/login', '1', null, '2016-10-05 05:15:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('63', 'tonboy', '/account/login', '1', null, '2016-10-05 05:16:21', '127.0.0.1');
INSERT INTO `login_log` VALUES ('64', 'tonboy', '/account/login', '1', null, '2016-10-05 05:16:46', '127.0.0.1');
INSERT INTO `login_log` VALUES ('65', 'tonboy', '/account/login', '1', null, '2016-10-05 05:20:41', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES ('66', 'tonboy', '/account/login', '1', null, '2016-10-05 17:48:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('67', 'tonboyw', '/account/login', '1', null, '2016-10-05 17:57:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('68', 'tonboy', '/account/login', '1', null, '2016-10-05 17:59:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('69', 'tonboy', '/account/login', '1', null, '2016-10-05 18:06:49', '127.0.0.1');
INSERT INTO `login_log` VALUES ('70', 'tonboy', '/account/login', '1', null, '2016-10-05 19:09:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('71', 'tonboyw', '/account/login', '1', null, '2016-10-05 19:10:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('72', 'tonboyw', '/account/login', '1', null, '2016-10-05 19:12:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('73', 'dongbo', '/account/login', '0', '0', '2016-10-05 19:13:24', '127.0.0.1');
INSERT INTO `login_log` VALUES ('74', 'dongbo', '/account/login', '1', null, '2016-10-05 19:13:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('75', 'tonboy', '/account/login', '1', null, '2016-10-05 19:33:03', '127.0.0.1');
INSERT INTO `login_log` VALUES ('76', 'tonboy', '/account/login', '1', null, '2016-10-05 19:34:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('77', 'tonboy', '/account/login', '1', null, '2016-10-05 19:37:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('78', 'tonboy', '/account/login', '1', null, '2016-10-05 19:46:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('79', 'tonboy', '/account/login', '1', null, '2016-10-05 19:47:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('80', 'tonboy', '/account/login', '1', null, '2016-10-05 19:49:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('81', 'tonboy', '/account/login', '1', null, '2016-10-05 23:19:19', '127.0.0.1');
INSERT INTO `login_log` VALUES ('82', 'tonboy', '/account/login', '1', null, '2016-10-05 23:51:51', '127.0.0.1');
INSERT INTO `login_log` VALUES ('83', 'test01', '/account/login', '1', null, '2016-10-05 23:52:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('84', 'tonboy', '/account/login', '1', null, '2016-10-06 00:04:04', '127.0.0.1');
INSERT INTO `login_log` VALUES ('85', 'dongbo', '/account/login', '1', null, '2016-10-06 00:04:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('86', 'tonboyw', '/account/login', '1', null, '2016-10-06 00:06:12', '127.0.0.1');
INSERT INTO `login_log` VALUES ('87', 'tonboyw', '/account/login', '1', null, '2016-10-06 00:18:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('88', 'tonboy', '/account/login', '1', null, '2016-10-06 00:19:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('89', 'test01', '/account/login', '1', null, '2016-10-06 00:22:24', '127.0.0.1');
INSERT INTO `login_log` VALUES ('90', 'test01', '/account/login', '1', null, '2016-10-06 22:15:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('91', 'tonboyw', '/account/login', '1', null, '2016-10-06 22:16:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('92', 'tonboy', '/account/login', '1', null, '2016-10-06 22:16:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('93', 'dongbo', '/account/login', '0', '0', '2016-10-06 22:16:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('94', 'dongbo', '/account/login', '1', null, '2016-10-06 22:16:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('95', 'dongbo', '/account/login', '1', null, '2016-10-14 20:48:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('96', 'dongbo', '/account/login', '1', null, '2016-10-15 12:26:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('97', 'dongbo', '/account/login', '1', null, '2016-10-15 12:47:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('98', 'tonboy', '/account/login', '1', null, '2016-10-16 01:36:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('99', 'tonboyw', '/account/login', '1', null, '2016-10-16 01:38:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('100', 'test01', '/account/login', '1', null, '2016-10-16 17:53:58', '127.0.0.1');
INSERT INTO `login_log` VALUES ('101', 'dongbo', '/account/login', '1', null, '2016-10-20 21:00:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('102', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-20 21:28:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('103', 'dongbo', '/account/login', '1', null, '2016-10-20 21:37:32', '192.168.1.110');
INSERT INTO `login_log` VALUES ('104', 'tonboy', '/account/login', '0', '0', '2016-10-20 22:11:08', '127.0.0.1');
INSERT INTO `login_log` VALUES ('105', 'tonboy', '/account/login', '1', null, '2016-10-20 22:11:19', '127.0.0.1');
INSERT INTO `login_log` VALUES ('106', 'tonboy', '/account/login', '1', null, '2016-10-21 22:21:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('107', 'tonboy', '/account/login', '1', null, '2016-10-21 22:21:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('108', 'test01', '/account/login', '1', null, '2016-10-21 22:21:49', '127.0.0.1');
INSERT INTO `login_log` VALUES ('109', 'test01', '/account/login', '1', null, '2016-10-21 23:34:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('110', 'tonboy', '/account/login', '1', null, '2016-10-22 11:45:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('111', 'test01', '/account/login', '1', null, '2016-10-22 18:53:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('112', 'dongbo', '/account/login', '1', null, '2016-10-22 19:03:15', '127.0.0.1');
INSERT INTO `login_log` VALUES ('113', 'dongbo', '/account/login', '1', null, '2016-10-22 20:14:31', '127.0.0.1');
INSERT INTO `login_log` VALUES ('114', 'tonboy', '/account/login', '1', null, '2016-10-23 11:07:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('115', 'tonboyw', '/account/login', '1', null, '2016-10-23 11:07:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('116', 'dongbo', '/account/login', '1', null, '2016-10-23 11:07:51', '127.0.0.1');
INSERT INTO `login_log` VALUES ('117', 'tonboyw', '/account/login', '1', null, '2016-10-23 11:08:59', '127.0.0.1');
INSERT INTO `login_log` VALUES ('118', 'tonboy', '/account/login', '1', null, '2016-10-23 11:09:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('119', 'tonboyw', '/account/login', '1', null, '2016-10-23 13:40:05', '127.0.0.1');
INSERT INTO `login_log` VALUES ('120', 'tonboyw', '/account/login', '1', null, '2016-10-25 20:22:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('121', 'dongbo', '/account/login', '1', null, '2016-10-25 20:26:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('122', 'tonboyw', '/account/login', '1', null, '2016-10-25 20:27:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('123', 'dongbo', '/account/login', '1', null, '2016-10-25 20:32:54', '127.0.0.1');
INSERT INTO `login_log` VALUES ('124', 'dongbo', '/account/login', '1', null, '2016-10-27 20:11:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('125', 'dongbo', '/account/login', '1', null, '2016-10-27 21:41:14', '127.0.0.1');
INSERT INTO `login_log` VALUES ('126', 'tonboy', '/account/login', '1', null, '2016-10-27 21:45:51', '127.0.0.1');
INSERT INTO `login_log` VALUES ('127', 'tonboy', '/account/login', '1', null, '2016-10-27 21:53:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('128', 'tonboyw', '/account/login', '1', null, '2016-10-27 21:53:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('129', 'test01', '/account/login', '1', null, '2016-10-27 21:54:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('130', 'dongbo', '/account/login', '1', null, '2016-10-27 22:14:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('131', 'tonboyw', '/account/login', '1', null, '2016-10-27 22:18:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('132', 'dongbo', '/account/login', '1', null, '2016-10-27 22:18:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('133', 'tonboyw', '/account/login', '1', null, '2016-10-28 20:25:20', '127.0.0.1');
INSERT INTO `login_log` VALUES ('134', 'dongbo', '/account/login', '1', null, '2016-10-28 20:32:20', '127.0.0.1');
INSERT INTO `login_log` VALUES ('135', 'test01', '/account/login', '1', null, '2016-10-28 20:39:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('136', 'tonboyw', '/account/login', '1', null, '2016-10-28 20:45:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('137', 'tonboyw', '/account/login', '1', null, '2016-10-28 20:48:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('138', 'dongbo', '/system/admin/account/login', '1', null, '2016-10-28 21:09:34', '127.0.0.1');
INSERT INTO `login_log` VALUES ('139', 'dongbo', '/account/login', '1', null, '2016-11-04 20:09:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('140', 'dongbo', '/account/login', '1', null, '2016-11-04 23:48:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('141', 'dongbo', '/system/admin/account/login', '1', null, '2016-11-05 00:06:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('142', 'dongbo', '/account/login', '0', '0', '2016-11-06 15:24:42', '127.0.0.1');
INSERT INTO `login_log` VALUES ('143', 'dongbo', '/account/login', '1', null, '2016-11-06 15:24:51', '127.0.0.1');
INSERT INTO `login_log` VALUES ('144', 'dongbo', '/account/login', '0', '0', '2016-11-06 15:25:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('145', 'dongbo', '/account/login', '1', null, '2016-11-06 15:25:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('146', 'dongbo', '/system/admin/account/login', '1', null, '2016-11-06 17:45:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('147', 'tonboy', '/account/login', '1', null, '2016-11-06 18:03:31', '127.0.0.1');
INSERT INTO `login_log` VALUES ('148', 'tonboy', '/account/login', '1', null, '2016-11-06 18:12:20', '127.0.0.1');
INSERT INTO `login_log` VALUES ('149', 'tonboyw', '/account/login', '1', null, '2016-11-06 18:30:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('150', 'dongbo', '/account/login', '1', null, '2016-11-09 19:22:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('151', 'dongbo', '/account/login', '1', null, '2016-11-09 19:48:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('152', 'tonboyw', '/account/login', '1', null, '2016-11-09 20:42:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('153', 'dongbo', '/account/login', '1', null, '2016-11-09 21:14:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('154', 'dongbo', '/account/login', '1', null, '2016-11-09 21:33:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('155', 'dongbo', '/account/login', '1', null, '2016-11-10 20:38:56', '127.0.0.1');
INSERT INTO `login_log` VALUES ('156', 'dongbo', '/account/login', '1', null, '2016-11-10 20:52:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('157', 'tonboy', '/account/login', '1', null, '2016-11-10 21:56:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('158', 'dongbo', '/account/login', '1', null, '2016-11-11 20:28:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('159', 'tonboy', '/account/login', '1', null, '2016-11-11 20:32:34', '127.0.0.1');
INSERT INTO `login_log` VALUES ('160', 'tonboy', '/account/login', '1', null, '2016-11-12 20:30:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('161', 'tonboyw', '/account/login', '1', null, '2016-11-13 02:26:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('162', 'tonboy', '/account/login', '1', null, '2016-11-14 10:18:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('163', 'tonboy', '/account/login', '1', null, '2016-11-14 10:57:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('164', 'tonboy', '/account/login', '1', null, '2016-11-14 11:01:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('165', 'tonboy', '/account/login', '1', null, '2016-11-14 11:07:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('166', 'tonboy', '/account/login', '1', null, '2016-11-14 11:08:20', '127.0.0.1');
INSERT INTO `login_log` VALUES ('167', 'tonboyw', '/account/login', '1', null, '2016-11-14 11:19:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('168', 'tonboy', '/account/login', '1', null, '2016-11-14 11:19:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('169', 'tonboy', '/account/login', '1', null, '2016-11-14 11:21:42', '127.0.0.1');
INSERT INTO `login_log` VALUES ('170', 'test01', '/account/login', '1', null, '2016-11-17 20:08:21', '127.0.0.1');
INSERT INTO `login_log` VALUES ('171', 'test01', '/account/login', '1', null, '2016-11-17 20:29:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('172', 'tonboy', '/account/login', '1', null, '2016-11-17 20:30:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('173', 'tonboyw', '/account/login', '1', null, '2016-11-17 20:41:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('174', 'tonboyw', '/system/admin/account/login', '0', '0', '2016-11-17 21:16:55', '127.0.0.1');
INSERT INTO `login_log` VALUES ('175', 'tonboy', '/account/login', '1', null, '2016-11-17 21:17:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('176', 'test01', '/account/login', '1', null, '2016-11-17 21:17:44', '127.0.0.1');
INSERT INTO `login_log` VALUES ('177', 'dongbo', '/account/login', '1', null, '2016-11-17 21:18:15', '127.0.0.1');
INSERT INTO `login_log` VALUES ('178', 'tonboyw', '/account/login', '1', null, '2016-11-17 21:33:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('179', 'tonboy', '/account/login', '1', null, '2016-11-17 23:06:01', '127.0.0.1');
INSERT INTO `login_log` VALUES ('180', 'dongbo', '/account/login', '1', null, '2016-11-17 23:06:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('181', 'tonboyw', '/account/login', '1', null, '2016-11-17 23:38:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('182', 'dongbo', '/account/login', '1', null, '2016-11-18 17:13:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('183', 'tonboyw', '/account/login', '1', null, '2016-11-18 17:57:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('184', 'dongbo', '/account/login', '1', null, '2016-11-18 23:47:01', '127.0.0.1');
INSERT INTO `login_log` VALUES ('185', 'tonboy', '/account/login', '1', null, '2016-11-18 23:51:52', '127.0.0.1');
INSERT INTO `login_log` VALUES ('186', 'dongbo', '/account/login', '1', null, '2016-11-19 21:10:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('187', 'tonboy', '/account/login', '1', null, '2016-11-19 21:11:08', '127.0.0.1');
INSERT INTO `login_log` VALUES ('188', 'tonboy', '/account/login', '1', null, '2016-11-20 00:23:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('189', 'tonboy', '/account/login', '1', null, '2016-11-20 02:17:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('190', 'tonboy', '/account/login', '1', null, '2016-11-20 02:17:59', '127.0.0.1');
INSERT INTO `login_log` VALUES ('191', 'dongbo', '/account/login', '1', null, '2016-11-20 02:21:38', '127.0.0.1');
INSERT INTO `login_log` VALUES ('192', 'tonboy', '/account/login', '0', '0', '2016-11-20 02:21:56', '127.0.0.1');
INSERT INTO `login_log` VALUES ('193', 'tonboy', '/account/login', '0', '0', '2016-11-20 02:23:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('194', 'tonboy', '/account/login', '1', null, '2016-11-20 02:23:14', '127.0.0.1');
INSERT INTO `login_log` VALUES ('195', 'tonboy', '/account/login', '1', null, '2016-11-20 02:24:21', '127.0.0.1');
INSERT INTO `login_log` VALUES ('196', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:24:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('197', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:26:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('198', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:27:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('199', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:29:05', '127.0.0.1');
INSERT INTO `login_log` VALUES ('200', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:38:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('201', 'dongbo', '/account/login', '0', '0', '2016-11-20 02:39:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('202', 'dongbo', '/account/login', '1', null, '2016-11-20 02:39:53', '127.0.0.1');
INSERT INTO `login_log` VALUES ('203', 'dongbo', '/account/login', '1', null, '2016-11-20 13:28:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('204', 'dongbo', '/account/login', '1', null, '2016-11-20 13:32:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('205', 'dongbo', '/account/login', '1', null, '2016-11-20 13:33:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('206', 'dongbo', '/account/login', '1', null, '2016-11-20 13:34:20', '127.0.0.1');
INSERT INTO `login_log` VALUES ('207', 'dongbo', '/account/login', '1', null, '2016-11-20 13:35:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('208', 'dongbo', '/account/login', '1', null, '2016-11-20 13:36:46', '127.0.0.1');
INSERT INTO `login_log` VALUES ('209', 'dongbo', '/account/login', '1', null, '2016-11-20 13:38:12', '127.0.0.1');
INSERT INTO `login_log` VALUES ('210', 'tonboy', '/account/login', '1', null, '2016-11-20 20:39:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('211', 'tonboyw', '/account/login', '1', null, '2016-11-20 20:40:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('212', 'tonboyw', '/account/login', '1', null, '2016-11-20 20:40:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('213', 'tonboy', '/account/login', '1', null, '2016-11-22 13:30:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('214', 'dongbo', '/account/login', '1', null, '2016-11-22 13:30:43', '127.0.0.1');
INSERT INTO `login_log` VALUES ('215', 'dongbo', '/account/login', '1', null, '2016-11-29 19:53:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('216', 'tonboy', '/account/login', '1', null, '2016-11-29 20:39:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('217', 'tonboyw', '/account/login', '1', null, '2016-11-29 20:42:03', '127.0.0.1');
INSERT INTO `login_log` VALUES ('218', 'dongbo', '/account/login', '1', null, '2016-11-29 20:42:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('219', 'tonboyw', '/account/login', '1', null, '2016-11-29 20:58:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('220', 'tonboy', '/account/login', '1', null, '2016-11-30 17:43:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('221', 'tonboyw', '/account/login', '1', null, '2016-11-30 17:48:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('222', 'dongbo', '/account/login', '1', null, '2016-11-30 18:20:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('223', 'tonboyw', '/account/login', '1', null, '2016-11-30 18:38:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('224', 'dongbo', '/account/login', '1', null, '2016-11-30 18:42:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('225', 'tonboy', '/account/login', '1', null, '2016-11-30 19:04:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('226', 'dongbo', '/account/login', '1', null, '2016-11-30 19:11:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('227', 'tonboy', '/account/login', '1', null, '2016-11-30 21:19:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('228', 'tonboyw', '/account/login', '1', null, '2016-11-30 21:21:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('229', 'tonboy', '/account/login', '1', null, '2016-11-30 22:54:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('230', 'test01', '/account/login', '1', null, '2016-12-01 15:53:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('231', 'dongbo', '/account/login', '1', null, '2016-12-01 16:07:37', '127.0.0.1');
INSERT INTO `login_log` VALUES ('232', 'dongbo', '/account/login', '1', null, '2016-12-01 16:19:28', '127.0.0.1');
INSERT INTO `login_log` VALUES ('233', 'tonboy', '/account/login', '1', null, '2016-12-01 16:40:34', '127.0.0.1');
INSERT INTO `login_log` VALUES ('234', 'tonboyw', '/account/login', '1', null, '2016-12-01 16:41:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('235', 'tonboy', '/account/login', '1', null, '2016-12-01 18:51:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('236', 'dongbo', '/account/login', '1', null, '2016-12-01 18:52:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('237', 'tonboyw', '/account/login', '1', null, '2016-12-01 19:00:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('238', 'tonboy', '/account/login', '1', null, '2016-12-01 19:00:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('239', 'dongbo', '/account/login', '1', null, '2016-12-01 19:22:43', '127.0.0.1');
INSERT INTO `login_log` VALUES ('240', 'tonboy', '/account/login', '1', null, '2016-12-02 21:28:53', '127.0.0.1');
INSERT INTO `login_log` VALUES ('241', 'tonboyw', '/account/login', '1', null, '2016-12-02 21:31:41', '127.0.0.1');
INSERT INTO `login_log` VALUES ('242', 'dongbo', '/account/login', '1', null, '2016-12-02 21:32:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('243', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-02 21:38:21', '127.0.0.1');
INSERT INTO `login_log` VALUES ('244', 'dongbo', '/account/login', '1', null, '2016-12-02 21:54:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('245', 'dongbo', '/account/login', '1', null, '2016-12-02 21:56:42', '127.0.0.1');
INSERT INTO `login_log` VALUES ('246', 'dongbo', '/account/login', '1', null, '2016-12-02 22:23:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('247', 'dongbo', '/account/login', '1', null, '2016-12-02 22:28:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('248', 'tonboy', '/account/login', '1', null, '2016-12-02 22:54:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('249', 'tonboy', '/account/login', '1', null, '2016-12-02 22:56:12', '127.0.0.1');
INSERT INTO `login_log` VALUES ('250', 'tonboy', '/account/login', '1', null, '2016-12-03 18:15:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('251', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-03 22:15:33', '127.0.0.1');
INSERT INTO `login_log` VALUES ('252', 'test01', '/account/login', '1', null, '2016-12-03 23:09:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('253', 'dongbo', '/account/login', '1', null, '2016-12-03 23:09:46', '127.0.0.1');
INSERT INTO `login_log` VALUES ('254', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-04 17:50:05', '127.0.0.1');
INSERT INTO `login_log` VALUES ('255', 'tonboy', '/account/login', '1', null, '2016-12-04 18:01:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('256', 'tonboy', '/account/login', '1', null, '2016-12-04 18:02:49', '127.0.0.1');
INSERT INTO `login_log` VALUES ('257', 'tonboy', '/account/login', '1', null, '2016-12-04 18:08:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('258', 'tonboy', '/account/login', '1', null, '2016-12-04 18:12:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('259', 'tonboy', '/account/login', '1', null, '2016-12-04 18:12:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('260', 'dongbo', '/account/login', '1', null, '2016-12-04 19:45:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('261', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-04 20:25:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('262', 'tonboyw', '/account/login', '1', null, '2016-12-04 20:26:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('263', 'tonboy', '/account/login', '1', null, '2016-12-04 21:05:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('264', 'dongbo', '/account/login', '1', null, '2016-12-04 22:05:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('265', 'tonboy', '/account/login', '1', null, '2016-12-05 00:11:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('266', 'dongbo', '/account/login', '1', null, '2016-12-06 00:12:07', '127.0.0.1');
INSERT INTO `login_log` VALUES ('267', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-06 00:15:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('268', 'dongbo', '/account/login', '1', null, '2016-12-06 00:54:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('269', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-06 01:19:49', '127.0.0.1');
INSERT INTO `login_log` VALUES ('270', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-06 17:51:10', '127.0.0.1');
INSERT INTO `login_log` VALUES ('271', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-06 17:55:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('272', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-06 17:56:31', '127.0.0.1');
INSERT INTO `login_log` VALUES ('273', 'tonboy', '/account/login', '1', null, '2016-12-08 13:30:13', '127.0.0.1');
INSERT INTO `login_log` VALUES ('274', 'dongbo', '/account/login', '1', null, '2016-12-09 22:24:12', '127.0.0.1');
INSERT INTO `login_log` VALUES ('275', 'dongbo', '/account/login', '1', null, '2016-12-09 22:30:24', '127.0.0.1');
INSERT INTO `login_log` VALUES ('276', 'tonboy', '/account/login', '1', null, '2016-12-11 01:42:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('277', 'dongbo', '/account/login', '1', null, '2016-12-12 21:54:56', '127.0.0.1');
INSERT INTO `login_log` VALUES ('278', 'dongbo', '/account/login', '1', null, '2016-12-13 21:20:49', '127.0.0.1');
INSERT INTO `login_log` VALUES ('279', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-17 13:06:27', '127.0.0.1');
INSERT INTO `login_log` VALUES ('280', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-19 23:15:08', '127.0.0.1');
INSERT INTO `login_log` VALUES ('281', 'test01', '/account/login', '1', null, '2016-12-20 20:30:22', '127.0.0.1');
INSERT INTO `login_log` VALUES ('282', 'tonboyw', '/account/login', '1', null, '2016-12-20 20:32:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('283', 'dongbo', '/account/login', '1', null, '2016-12-20 20:40:03', '127.0.0.1');
INSERT INTO `login_log` VALUES ('284', 'test01', '/account/login', '1', null, '2016-12-21 21:32:04', '127.0.0.1');
INSERT INTO `login_log` VALUES ('285', 'tonboy', '/account/login', '1', null, '2016-12-21 21:42:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('286', 'dongbo', '/account/login', '1', null, '2016-12-22 20:31:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('287', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-23 21:28:05', '127.0.0.1');
INSERT INTO `login_log` VALUES ('288', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-23 21:49:11', '127.0.0.1');
INSERT INTO `login_log` VALUES ('289', 'tonboy', '/account/login', '1', null, '2016-12-23 22:42:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('290', 'tonboy', '/system/admin/account/login', '1', null, '2016-12-23 23:03:06', '127.0.0.1');
INSERT INTO `login_log` VALUES ('291', 'dongbo', '/account/login', '1', null, '2016-12-23 23:12:07', '127.0.0.1');
INSERT INTO `login_log` VALUES ('292', 'tonboy', '/account/login', '1', null, '2016-12-23 23:14:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('293', 'dongbo', '/account/login', '1', null, '2016-12-23 23:14:51', '127.0.0.1');
INSERT INTO `login_log` VALUES ('294', 'dongbo', '/account/login', '1', null, '2016-12-23 23:15:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('295', 'dongbo', '/account/login', '1', null, '2016-12-24 14:29:44', '127.0.0.1');
INSERT INTO `login_log` VALUES ('296', 'tonboyw', '/account/login', '1', null, '2016-12-24 16:53:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('297', 'test01', '/account/login', '1', null, '2016-12-24 17:01:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('298', 'dongbo', '/account/login', '1', null, '2016-12-24 19:54:57', '127.0.0.1');
INSERT INTO `login_log` VALUES ('299', 'dongbo', '/account/login', '1', null, '2016-12-25 16:16:25', '127.0.0.1');
INSERT INTO `login_log` VALUES ('300', 'tonboyw', '/account/login', '1', null, '2016-12-25 17:21:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('301', 'tonboy', '/account/login', '1', null, '2016-12-25 21:46:24', '127.0.0.1');
INSERT INTO `login_log` VALUES ('302', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-25 22:07:09', '127.0.0.1');
INSERT INTO `login_log` VALUES ('303', 'tonboy', '/account/login', '1', null, '2016-12-28 21:13:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('304', 'dongbo', '/account/login', '1', null, '2016-12-28 21:13:59', '127.0.0.1');
INSERT INTO `login_log` VALUES ('305', 'tonboy', '/account/login', '1', null, '2016-12-28 23:38:29', '127.0.0.1');
INSERT INTO `login_log` VALUES ('306', 'tonboyw', '/account/login', '1', null, '2016-12-28 23:44:48', '127.0.0.1');
INSERT INTO `login_log` VALUES ('307', 'test01', '/account/login', '1', null, '2016-12-28 23:45:40', '127.0.0.1');
INSERT INTO `login_log` VALUES ('308', 'dongbo', '/account/login', '1', null, '2016-12-28 23:46:02', '127.0.0.1');
INSERT INTO `login_log` VALUES ('309', 'test', '/account/login', '1', null, '2016-12-29 20:01:35', '127.0.0.1');
INSERT INTO `login_log` VALUES ('310', 'dongbo', '/account/login', '1', null, '2016-12-29 20:03:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('311', 'tonboy', '/account/login', '1', null, '2016-12-29 21:29:47', '127.0.0.1');
INSERT INTO `login_log` VALUES ('312', 'dongbo', '/account/login', '1', null, '2016-12-30 19:41:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('313', 'tonboyw', '/account/login', '1', null, '2016-12-30 19:41:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('314', 'test01', '/account/login', '1', null, '2016-12-30 19:41:39', '127.0.0.1');
INSERT INTO `login_log` VALUES ('315', 'dongbo', '/account/login', '1', null, '2016-12-30 19:41:50', '127.0.0.1');
INSERT INTO `login_log` VALUES ('316', 'dongbo', '/account/login', '1', null, '2016-12-30 21:37:17', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES ('317', 'dongbo', '/system/admin/account/login', '1', null, '2016-12-30 21:41:14', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES ('318', 'dongbo', '/account/login', '1', null, '2016-12-30 23:27:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('319', 'tonboy', '/account/login', '1', null, '2016-12-31 14:56:48', '0:0:0:0:0:0:0:1');
INSERT INTO `login_log` VALUES ('320', 'dongbo', '/account/login', '1', null, '2016-12-31 14:57:36', '127.0.0.1');
INSERT INTO `login_log` VALUES ('321', 'dongbo', '/account/login', '1', null, '2016-12-31 15:07:18', '127.0.0.1');
INSERT INTO `login_log` VALUES ('322', 'dongbo', '/account/login', '1', null, '2016-12-31 15:43:05', '127.0.0.1');
INSERT INTO `login_log` VALUES ('323', 'dongbo', '/account/login', '1', null, '2016-12-31 19:39:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('324', 'dongbo', '/account/login', '1', null, '2016-12-31 21:18:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('325', 'tonboyw', '/account/login', '1', null, '2016-12-31 21:23:45', '127.0.0.1');
INSERT INTO `login_log` VALUES ('326', 'dongbo', '/account/login', '1', null, '2016-12-31 21:44:26', '127.0.0.1');
INSERT INTO `login_log` VALUES ('327', 'tonboyw', '/account/login', '1', null, '2016-12-31 23:39:17', '127.0.0.1');
INSERT INTO `login_log` VALUES ('328', 'dongbo', '/account/login', '1', null, '2017-01-01 18:52:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('329', 'dongbo', '/account/login', '1', null, '2017-01-02 13:50:23', '127.0.0.1');
INSERT INTO `login_log` VALUES ('330', 'dongbo', '/account/login', '1', null, '2017-01-02 13:51:30', '127.0.0.1');
INSERT INTO `login_log` VALUES ('331', 'tonboy', '/account/login', '1', null, '2017-01-02 21:40:46', '127.0.0.1');
INSERT INTO `login_log` VALUES ('332', 'tonboyw', '/account/login', '1', null, '2017-01-02 21:41:00', '127.0.0.1');
INSERT INTO `login_log` VALUES ('333', 'test01', '/account/login', '1', null, '2017-01-02 21:41:16', '127.0.0.1');
INSERT INTO `login_log` VALUES ('334', 'test', '/account/login', '1', null, '2017-01-02 21:41:32', '127.0.0.1');
INSERT INTO `login_log` VALUES ('335', 'dongbo', '/account/login', '1', null, '2017-01-02 21:42:53', '127.0.0.1');
INSERT INTO `login_log` VALUES ('336', 'dongbo', '/account/login', '1', null, '2017-01-03 20:18:59', '127.0.0.1');

-- ----------------------------
-- Table structure for past_history
-- ----------------------------
DROP TABLE IF EXISTS `past_history`;
CREATE TABLE `past_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(30) NOT NULL COMMENT '用户昵称',
  `ip` varchar(30) NOT NULL COMMENT '来源ip',
  `past_time` datetime NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='签到历史表';

-- ----------------------------
-- Records of past_history
-- ----------------------------
INSERT INTO `past_history` VALUES ('1', '1280', 'tonboyw', '127.0.0.1', '2016-10-04 11:39:08');
INSERT INTO `past_history` VALUES ('2', '1279', 'tonboy', '127.0.0.1', '2016-10-04 12:17:08');
INSERT INTO `past_history` VALUES ('3', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-04 12:26:28');
INSERT INTO `past_history` VALUES ('4', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-05 00:23:58');
INSERT INTO `past_history` VALUES ('5', '1280', 'tonboyw', '127.0.0.1', '2016-10-05 00:30:48');
INSERT INTO `past_history` VALUES ('6', '1285', 'test01', '127.0.0.1', '2016-10-05 23:54:14');
INSERT INTO `past_history` VALUES ('7', '1285', 'test01', '127.0.0.1', '2016-10-06 00:02:25');
INSERT INTO `past_history` VALUES ('8', '1279', 'tonboy', '127.0.0.1', '2016-10-06 00:04:10');
INSERT INTO `past_history` VALUES ('9', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-06 00:04:45');
INSERT INTO `past_history` VALUES ('10', '1280', 'tonboyw', '127.0.0.1', '2016-10-06 00:06:20');
INSERT INTO `past_history` VALUES ('11', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-14 20:48:29');
INSERT INTO `past_history` VALUES ('12', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-15 11:36:15');
INSERT INTO `past_history` VALUES ('13', '1280', 'tonboyw', '127.0.0.1', '2016-10-16 01:40:31');
INSERT INTO `past_history` VALUES ('14', '1285', 'test01', '127.0.0.1', '2016-10-16 17:57:55');
INSERT INTO `past_history` VALUES ('15', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-20 21:00:11');
INSERT INTO `past_history` VALUES ('16', '1279', 'tonboy', '127.0.0.1', '2016-10-20 22:12:12');
INSERT INTO `past_history` VALUES ('17', '1279', 'tonboy', '127.0.0.1', '2016-10-21 22:20:01');
INSERT INTO `past_history` VALUES ('18', '1285', 'test01', '127.0.0.1', '2016-10-21 22:22:02');
INSERT INTO `past_history` VALUES ('19', '1285', 'test01', '127.0.0.1', '2016-10-22 19:01:09');
INSERT INTO `past_history` VALUES ('20', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-22 23:28:07');
INSERT INTO `past_history` VALUES ('21', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-23 00:04:08');
INSERT INTO `past_history` VALUES ('22', '1279', 'tonboy', '127.0.0.1', '2016-10-23 11:32:22');
INSERT INTO `past_history` VALUES ('23', '1280', 'tonboyw', '127.0.0.1', '2016-10-23 14:31:43');
INSERT INTO `past_history` VALUES ('24', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-25 20:26:20');
INSERT INTO `past_history` VALUES ('25', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-27 20:11:38');
INSERT INTO `past_history` VALUES ('26', '1280', 'tonboyw', '127.0.0.1', '2016-10-28 20:30:57');
INSERT INTO `past_history` VALUES ('27', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-28 20:32:44');
INSERT INTO `past_history` VALUES ('28', '1285', 'test01', '127.0.0.1', '2016-10-28 20:40:20');
INSERT INTO `past_history` VALUES ('29', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-29 12:27:42');
INSERT INTO `past_history` VALUES ('30', '1268', 'Smart_咚咚', '127.0.0.1', '2016-10-30 00:11:36');
INSERT INTO `past_history` VALUES ('31', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-04 20:11:35');
INSERT INTO `past_history` VALUES ('32', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-05 00:07:28');
INSERT INTO `past_history` VALUES ('33', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-06 15:24:57');
INSERT INTO `past_history` VALUES ('34', '1279', 'tonboy', '127.0.0.1', '2016-11-06 18:09:25');
INSERT INTO `past_history` VALUES ('35', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-09 19:22:04');
INSERT INTO `past_history` VALUES ('36', '1280', 'tonboyw', '127.0.0.1', '2016-11-09 20:45:36');
INSERT INTO `past_history` VALUES ('37', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-10 21:11:24');
INSERT INTO `past_history` VALUES ('38', '1279', 'tonboy', '127.0.0.1', '2016-11-10 21:57:07');
INSERT INTO `past_history` VALUES ('39', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-11 20:28:45');
INSERT INTO `past_history` VALUES ('40', '1279', 'tonboy', '127.0.0.1', '2016-11-11 20:32:50');
INSERT INTO `past_history` VALUES ('41', '1279', 'tonboy', '127.0.0.1', '2016-11-12 00:01:02');
INSERT INTO `past_history` VALUES ('42', '1280', 'tonboyw', '127.0.0.1', '2016-11-13 02:34:04');
INSERT INTO `past_history` VALUES ('43', '1279', 'tonboy', '127.0.0.1', '2016-11-14 10:20:29');
INSERT INTO `past_history` VALUES ('44', '1279', 'tonboy', '127.0.0.1', '2016-11-17 19:49:41');
INSERT INTO `past_history` VALUES ('45', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-17 21:24:26');
INSERT INTO `past_history` VALUES ('46', '1280', 'tonboyw', '127.0.0.1', '2016-11-17 21:33:39');
INSERT INTO `past_history` VALUES ('47', '1280', 'tonboyw', '127.0.0.1', '2016-11-18 17:09:57');
INSERT INTO `past_history` VALUES ('48', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-18 17:13:15');
INSERT INTO `past_history` VALUES ('49', '1279', 'tonboy', '127.0.0.1', '2016-11-18 23:52:01');
INSERT INTO `past_history` VALUES ('50', '1279', 'tonboy', '127.0.0.1', '2016-11-19 23:19:53');
INSERT INTO `past_history` VALUES ('51', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-20 02:39:59');
INSERT INTO `past_history` VALUES ('52', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-22 13:32:38');
INSERT INTO `past_history` VALUES ('53', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-29 19:53:42');
INSERT INTO `past_history` VALUES ('54', '1279', 'tonboy', '127.0.0.1', '2016-11-30 17:44:29');
INSERT INTO `past_history` VALUES ('55', '1280', 'tonboyw', '127.0.0.1', '2016-11-30 17:50:07');
INSERT INTO `past_history` VALUES ('56', '1268', 'Smart_咚咚', '127.0.0.1', '2016-11-30 18:49:25');
INSERT INTO `past_history` VALUES ('57', '1279', 'tonboy', '127.0.0.1', '2016-12-01 15:53:30');
INSERT INTO `past_history` VALUES ('58', '1285', 'test01', '127.0.0.1', '2016-12-01 15:53:49');
INSERT INTO `past_history` VALUES ('59', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-01 18:57:45');
INSERT INTO `past_history` VALUES ('60', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-02 19:51:46');
INSERT INTO `past_history` VALUES ('61', '1279', 'tonboy', '127.0.0.1', '2016-12-02 22:59:44');
INSERT INTO `past_history` VALUES ('62', '1279', 'tonboy', '127.0.0.1', '2016-12-03 17:28:25');
INSERT INTO `past_history` VALUES ('63', '1285', 'test01', '127.0.0.1', '2016-12-03 23:09:31');
INSERT INTO `past_history` VALUES ('64', '1280', 'tonboyw', '127.0.0.1', '2016-12-04 20:27:22');
INSERT INTO `past_history` VALUES ('65', '1279', 'tonboy', '127.0.0.1', '2016-12-05 00:19:26');
INSERT INTO `past_history` VALUES ('66', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 20:22:24');
INSERT INTO `past_history` VALUES ('67', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 18:09:08');
INSERT INTO `past_history` VALUES ('68', '1279', 'tonboy', '127.0.0.1', '2016-12-08 13:30:18');
INSERT INTO `past_history` VALUES ('69', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-09 22:24:17');
INSERT INTO `past_history` VALUES ('70', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 00:11:18');
INSERT INTO `past_history` VALUES ('71', '1279', 'tonboy', '127.0.0.1', '2016-12-11 19:12:17');
INSERT INTO `past_history` VALUES ('72', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:04:04');
INSERT INTO `past_history` VALUES ('73', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-12 21:54:59');
INSERT INTO `past_history` VALUES ('74', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-13 19:40:42');
INSERT INTO `past_history` VALUES ('75', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-14 19:46:43');
INSERT INTO `past_history` VALUES ('76', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 19:37:31');
INSERT INTO `past_history` VALUES ('77', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:27:19');
INSERT INTO `past_history` VALUES ('78', '1279', 'tonboy', '127.0.0.1', '2016-12-18 20:47:53');
INSERT INTO `past_history` VALUES ('79', '1279', 'tonboy', '127.0.0.1', '2016-12-19 20:37:35');
INSERT INTO `past_history` VALUES ('80', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-20 19:31:52');
INSERT INTO `past_history` VALUES ('81', '1280', 'tonboyw', '127.0.0.1', '2016-12-20 20:39:45');
INSERT INTO `past_history` VALUES ('82', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 20:45:06');
INSERT INTO `past_history` VALUES ('83', '1285', 'test01', '127.0.0.1', '2016-12-21 21:32:14');
INSERT INTO `past_history` VALUES ('84', '1279', 'tonboy', '127.0.0.1', '2016-12-21 21:42:38');
INSERT INTO `past_history` VALUES ('85', '1279', 'tonboy', '127.0.0.1', '2016-12-22 19:53:29');
INSERT INTO `past_history` VALUES ('86', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-22 20:31:12');
INSERT INTO `past_history` VALUES ('87', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-23 22:00:45');
INSERT INTO `past_history` VALUES ('88', '1279', 'tonboy', '127.0.0.1', '2016-12-23 22:42:26');
INSERT INTO `past_history` VALUES ('89', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 14:29:47');
INSERT INTO `past_history` VALUES ('90', '1280', 'tonboyw', '127.0.0.1', '2016-12-24 16:55:06');
INSERT INTO `past_history` VALUES ('91', '1285', 'test01', '127.0.0.1', '2016-12-24 17:01:43');
INSERT INTO `past_history` VALUES ('92', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-25 16:16:29');
INSERT INTO `past_history` VALUES ('93', '1280', 'tonboyw', '127.0.0.1', '2016-12-25 17:21:11');
INSERT INTO `past_history` VALUES ('94', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-26 20:29:04');
INSERT INTO `past_history` VALUES ('95', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-27 21:22:12');
INSERT INTO `past_history` VALUES ('96', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 20:08:54');
INSERT INTO `past_history` VALUES ('97', '1279', 'tonboy', '127.0.0.1', '2016-12-28 23:38:32');
INSERT INTO `past_history` VALUES ('98', '1280', 'tonboyw', '127.0.0.1', '2016-12-28 23:44:50');
INSERT INTO `past_history` VALUES ('99', '1285', 'test01', '127.0.0.1', '2016-12-28 23:45:45');
INSERT INTO `past_history` VALUES ('100', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-29 19:57:21');
INSERT INTO `past_history` VALUES ('101', '1286', 'test', '127.0.0.1', '2016-12-29 20:01:41');
INSERT INTO `past_history` VALUES ('102', '1279', 'tonboy', '127.0.0.1', '2016-12-29 21:29:49');
INSERT INTO `past_history` VALUES ('103', '1279', 'tonboy', '127.0.0.1', '2016-12-30 19:41:00');
INSERT INTO `past_history` VALUES ('104', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 19:41:20');
INSERT INTO `past_history` VALUES ('105', '1280', 'tonboyw', '127.0.0.1', '2016-12-30 19:41:31');
INSERT INTO `past_history` VALUES ('106', '1285', 'test01', '127.0.0.1', '2016-12-30 19:41:41');
INSERT INTO `past_history` VALUES ('107', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-31 14:14:11');
INSERT INTO `past_history` VALUES ('108', '1279', 'tonboy', '0:0:0:0:0:0:0:1', '2016-12-31 14:56:51');
INSERT INTO `past_history` VALUES ('109', '1280', 'tonboyw', '127.0.0.1', '2016-12-31 21:35:26');
INSERT INTO `past_history` VALUES ('110', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 18:52:36');
INSERT INTO `past_history` VALUES ('111', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 13:50:25');
INSERT INTO `past_history` VALUES ('112', '1279', 'tonboy', '127.0.0.1', '2017-01-02 21:40:50');
INSERT INTO `past_history` VALUES ('113', '1280', 'tonboyw', '127.0.0.1', '2017-01-02 21:41:02');
INSERT INTO `past_history` VALUES ('114', '1285', 'test01', '127.0.0.1', '2017-01-02 21:41:18');
INSERT INTO `past_history` VALUES ('115', '1286', 'test', '127.0.0.1', '2017-01-02 21:41:34');
INSERT INTO `past_history` VALUES ('116', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:19:19');
INSERT INTO `past_history` VALUES ('117', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 20:00:54');
INSERT INTO `past_history` VALUES ('118', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 21:19:19');
INSERT INTO `past_history` VALUES ('119', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 19:49:42');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `be_uid` bigint(20) NOT NULL COMMENT '被举报帖子人id',
  `be_tid` bigint(20) NOT NULL COMMENT '被举报帖子版块id',
  `be_rid` bigint(20) NOT NULL COMMENT '被举报帖子回复id',
  `be_floor` int(11) NOT NULL COMMENT '被举报帖子楼层id',
  `reason` varchar(50) NOT NULL COMMENT '举报原因',
  `cus_reason` varchar(100) NOT NULL COMMENT '自定义原因',
  `be_url` varchar(100) NOT NULL COMMENT '地址',
  `uid` bigint(20) NOT NULL COMMENT '举报人id',
  `nickname` varchar(30) NOT NULL COMMENT '举报人昵称',
  `report_ip` varchar(30) NOT NULL COMMENT '举报IP',
  `report_time` datetime DEFAULT NULL COMMENT '举报时间',
  `report_status` int(11) NOT NULL DEFAULT '0' COMMENT '类型{0：代审核，1：已通过，2：已忽略}',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`report_id`),
  KEY `idx_report_status` (`report_status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='举报信息表';

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '1268', '1240', '0', '0', '恶意灌水', '', 'http://localhost:8080/bbs/board/205/topic/detail/1240/1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 20:36:55', '1', null);
INSERT INTO `report` VALUES ('2', '1268', '1240', '0', '0', '其他', 'ssssss', 'http://localhost:8080/bbs/board/205/topic/detail/1240/1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 20:37:21', '1', null);
INSERT INTO `report` VALUES ('3', '1279', '1240', '3583', '1', '恶意灌水', '', 'http://localhost:8080/bbs/board/205/topic/detail/1240/1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 20:37:31', '1', null);
INSERT INTO `report` VALUES ('4', '1279', '1240', '3583', '1', '其他', 'gdxhfg', 'http://localhost:8080/bbs/board/205/topic/detail/1240/1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 20:37:39', '1', null);
INSERT INTO `report` VALUES ('5', '1268', '1237', '3566', '3', '违规内容', '', 'http://localhost:8080/bbs/board/205/topic/detail/1237/1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 20:38:54', '1', null);
INSERT INTO `report` VALUES ('6', '1279', '1244', '3586', '4', '恶意灌水', '', 'http://localhost:8080/bbs/board/200/topic/detail/1244/1?lastest=1', '1279', 'tonboy', '127.0.0.1', '2016-11-12 22:48:31', '1', null);
INSERT INTO `report` VALUES ('7', '1280', '1236', '0', '0', '广告垃圾', '', 'http://localhost:8080/bbs/board/206/topic/detail/1236', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 20:53:08', '1', null);
INSERT INTO `report` VALUES ('8', '1280', '1236', '0', '0', '其他', 'hsdfd', 'http://localhost:8080/bbs/board/206/topic/detail/1236', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 20:53:17', '1', null);

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `res_name` varchar(20) NOT NULL COMMENT '资源名称',
  `res_link` varchar(255) NOT NULL COMMENT '资源链接',
  `res_sign` varchar(100) NOT NULL COMMENT '资源标识',
  `res_type` int(11) NOT NULL COMMENT '资源类型{0:模块,1:菜单,2:按钮}',
  `res_status` int(11) NOT NULL DEFAULT '0' COMMENT '资源状态(删除){0:否,1:是}',
  `res_sort` int(11) NOT NULL COMMENT '资源顺序',
  `res_parent_id` int(11) DEFAULT NULL COMMENT '上级所属id,指向res_id',
  `res_create_time` datetime DEFAULT NULL,
  `res_icon` varchar(50) DEFAULT NULL COMMENT '资源图标',
  `turn_way` int(11) NOT NULL DEFAULT '0' COMMENT '跳转方式{0：当前窗口，1：新窗口}',
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('1', '系统管理', '/system/admin/sysmanage', 'admin:sys', '0', '0', '1', '0', '2016-09-03 13:08:45', 'fa-laptop', '0');
INSERT INTO `resources` VALUES ('2', '会员管理', '/system/admin/sysmanage/user', 'admin:sys:user', '1', '0', '1', '1', '2016-09-03 13:09:45', 'fa-group', '0');
INSERT INTO `resources` VALUES ('3', '角色管理', '/system/admin/sysmanage/role', 'admin:sys:role', '1', '0', '2', '1', '2016-09-03 13:12:45', 'fa-male', '0');
INSERT INTO `resources` VALUES ('4', '资源管理', '/system/admin/sysmanage/resources', 'admin:sys:resources', '1', '0', '3', '1', '2016-09-03 13:13:45', 'fa-folder', '0');
INSERT INTO `resources` VALUES ('5', '首页管理', '/system/admin/home', 'admin:home', '0', '0', '2', '0', '2016-09-03 13:14:45', 'fa-desktop', '0');
INSERT INTO `resources` VALUES ('6', '轮播图链', '/system/admin/home/image', 'admin:home:image', '1', '0', '1', '5', '2016-09-03 13:16:45', 'fa-picture-o', '0');
INSERT INTO `resources` VALUES ('7', '快速导航', '/system/admin/home/quick', 'admin:home:quick', '1', '0', '2', '5', '2016-09-03 13:17:45', 'fa-anchor', '0');
INSERT INTO `resources` VALUES ('8', '首页推荐', '/system/admin/home/recommend', 'admin:home:recommend', '1', '0', '3', '5', '2016-09-03 13:18:45', 'fa-bookmark', '0');
INSERT INTO `resources` VALUES ('9', '首页主题', '/system/admin/home/topic', 'admin:home:topic', '1', '0', '4', '5', '2016-09-03 13:19:45', 'fa-book', '0');
INSERT INTO `resources` VALUES ('10', '查询', '/system/admin/sysmanage/resources/search', 'aadmin:sys:resources:search', '2', '0', '1', '4', '2016-09-24 13:19:45', 'fa-search', '0');
INSERT INTO `resources` VALUES ('11', '添加', '/system/admin/sysmanage/resources/add', 'admin:sys:resources:add', '2', '0', '2', '4', '2016-09-24 13:19:45', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('12', '删除', '/system/admin/sysmanage/resources/delete', 'admin:sys:resources:delete', '2', '0', '3', '4', '2016-09-24 13:19:45', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('13', '编辑', '/system/admin/sysmanage/resources/update', 'admin:sys:resources:update', '2', '0', '4', '4', '2016-09-24 13:19:45', 'fa-edit', '0');
INSERT INTO `resources` VALUES ('14', '日志管理', '/system/admin/log', 'admin:log', '0', '0', '3', '0', '2016-09-24 23:19:45', 'fa-file', '0');
INSERT INTO `resources` VALUES ('15', '登录日志', '/system/admin/log/login', 'admin:log:login', '1', '0', '1', '14', '2016-09-24 23:29:45', 'fa-info', '0');
INSERT INTO `resources` VALUES ('16', '操作日志', '/system/admin/log/operation', 'admin:log:operation', '1', '0', '2', '14', '2016-09-24 23:39:45', 'fa-exclamation', '0');
INSERT INTO `resources` VALUES ('17', '管理员管理', '/system/admin/sysmanage/admin', 'admin:sys:admin', '1', '0', '2', '1', '2016-12-02 21:41:34', 'fa-group', '0');
INSERT INTO `resources` VALUES ('20', '查找', '/system/admin/sysmanage/user/search', 'admin:sys:user:search', '2', '0', '1', '2', '2016-12-06 01:13:10', 'fa-search', '0');
INSERT INTO `resources` VALUES ('21', '授权', '/system/admin/sysmanage/role/authorize', 'admin:sys:role:authorize', '2', '0', '1', '3', '2016-12-06 17:54:50', 'fa-key', '0');
INSERT INTO `resources` VALUES ('22', '添加', '/system/admin/sysmanage/role/add', 'admin:sys:role:add', '2', '0', '2', '3', '2016-12-06 19:17:00', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('23', '签到历史', '/system/admin/log/sign', 'admin:log:sign', '1', '0', '3', '14', '2016-12-07 17:28:14', 'fa-check-square-o', '0');
INSERT INTO `resources` VALUES ('24', '经验历史', '/system/admin/log/experience', 'admin:log:experience', '1', '0', '4', '14', '2016-12-07 17:34:37', 'fa-bitbucket-square', '0');
INSERT INTO `resources` VALUES ('25', '金币历史', '/system/admin/log/gold', 'admin:log:gold', '1', '0', '5', '14', '2016-12-07 17:35:37', 'fa-bitbucket', '0');
INSERT INTO `resources` VALUES ('26', '导航版块', '/system/admin/navboard', 'admin:nb', '0', '0', '1', '0', '2016-12-07 17:41:17', 'fa-bars', '0');
INSERT INTO `resources` VALUES ('27', '导航管理', '/system/admin/navboard/navigation', 'admin:nb:nav', '1', '0', '1', '26', '2016-12-07 17:56:24', 'fa-chain', '0');
INSERT INTO `resources` VALUES ('28', '版块管理', '/system/admin/navboard/board', 'admin:nb:board', '1', '0', '2', '26', '2016-12-08 18:34:04', 'fa-puzzle-piece', '0');
INSERT INTO `resources` VALUES ('29', '查看详情', '/system/admin/log/sign/detail', 'admin:log:sign:detail', '2', '0', '1', '23', '2016-12-08 21:49:24', 'fa-external-link', '0');
INSERT INTO `resources` VALUES ('30', '查找', '/system/admin/log/sign/detail/search', 'admin:log:sign:detail:search', '2', '0', '1', '29', '2016-12-08 21:50:39', 'fa-search', '0');
INSERT INTO `resources` VALUES ('31', '查看详情', '/system/admin/log/gold/detail', 'admin:log:gold:detail', '2', '0', '1', '25', '2016-12-10 20:57:26', 'fa-puzzle-piece', '0');
INSERT INTO `resources` VALUES ('32', '查看详情', '/system/admin/log/experience/detail', 'admin:log:experience:detail', '2', '0', '1', '24', '2016-12-10 21:49:16', 'fa-external-link', '0');
INSERT INTO `resources` VALUES ('33', '分类管理', '/system/admin/navboard/classify', 'admin:nb:classify', '1', '0', '3', '26', '2016-12-10 22:01:42', 'fa-bookmark', '0');
INSERT INTO `resources` VALUES ('34', '帖子管理', '/system/admin/topicmanage', 'admin:topic', '0', '0', '5', '0', '2016-12-11 01:20:03', 'fa-tasks', '0');
INSERT INTO `resources` VALUES ('35', '评论管理', '/system/admin/replymanage', 'admin:reply', '0', '0', '6', '0', '2016-12-11 01:21:20', 'fa-comments-o', '0');
INSERT INTO `resources` VALUES ('36', '上传资源', '/system/admin/upload', 'admin:up', '0', '0', '7', '0', '2016-12-11 01:23:20', 'fa-upload', '0');
INSERT INTO `resources` VALUES ('37', '图片管理', '/system/admin/upload/image', 'admin:up:image', '1', '0', '1', '36', '2016-12-11 01:24:33', 'fa-picture-o', '0');
INSERT INTO `resources` VALUES ('38', '附件管理', '/system/admin/upload/file', 'admin:up:file', '1', '0', '2', '36', '2016-12-11 01:26:22', 'fa-paperclip', '0');
INSERT INTO `resources` VALUES ('39', '任务调度', '/system/admin/quartz', 'admin:quartz', '0', '0', '8', '0', '2016-12-11 01:28:33', 'fa-clock-o', '0');
INSERT INTO `resources` VALUES ('40', '系统备份', '/system/admin/backup', 'admin:back', '0', '0', '9', '0', '2016-12-11 01:32:32', 'fa-suitcase', '0');
INSERT INTO `resources` VALUES ('41', '系统配置', '/system/admin/config', 'admin:config', '0', '0', '10', '0', '2016-12-11 01:34:09', 'fa-cogs', '0');
INSERT INTO `resources` VALUES ('42', '系统监控', '/system/admin/monitor', 'admin:monitor', '0', '0', '11', '0', '2016-12-11 01:35:32', 'fa-bug', '0');
INSERT INTO `resources` VALUES ('43', '统计图表', '/system/admin/chart', 'admin:chart', '0', '0', '12', '0', '2016-12-11 01:36:21', 'fa-bar-chart-o', '0');
INSERT INTO `resources` VALUES ('44', '个人信息', '/system/admin/self', 'admin:self', '0', '0', '13', '0', '2016-12-11 01:38:12', 'fa-user', '0');
INSERT INTO `resources` VALUES ('45', '系统设置', '/system/admin/config/setting', 'admin:config:set', '1', '0', '1', '41', '2016-12-12 21:46:06', 'fa-gear', '0');
INSERT INTO `resources` VALUES ('46', '消息中心', '/system/admin/message', 'admin:msg', '0', '0', '7', '0', '2016-12-12 21:50:00', 'fa-comment-o', '0');
INSERT INTO `resources` VALUES ('47', '查找', '/system/admin/log/login/search', 'admin:log:login:search', '2', '0', '1', '15', '2016-12-15 20:54:51', 'fa-search', '0');
INSERT INTO `resources` VALUES ('48', '查找', '/system/admin/upload/image/search', 'admin:up:image:search', '2', '0', '1', '37', '2016-12-15 21:02:48', 'fa-search', '0');
INSERT INTO `resources` VALUES ('49', '评论列表', '/system/admin/replymanage/reply', 'admin:reply:reply', '1', '0', '1', '35', '2016-12-16 20:31:52', 'fa-pagelines', '0');
INSERT INTO `resources` VALUES ('50', '添加', '/system/admin/backup/add', 'admin:back:add', '2', '0', '1', '40', '2016-12-16 23:07:26', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('51', '任务列表', '/system/admin/quartz/list', 'admin:quartz:list', '1', '0', '1', '39', '2016-12-16 23:33:43', 'fa-list', '0');
INSERT INTO `resources` VALUES ('52', '任务历史', '/system/admin/quartz/history', 'admin:quartz:history', '1', '0', '2', '39', '2016-12-16 23:36:08', 'fa-hdd-o', '0');
INSERT INTO `resources` VALUES ('53', '待审核', '/system/admin/replymanage/audit', 'admin:reply:audit', '1', '0', '2', '35', '2016-12-19 20:41:29', 'fa-ban', '0');
INSERT INTO `resources` VALUES ('54', '回收站', '/system/admin/replymanage/trash', 'admin:reply:trash', '1', '0', '3', '35', '2016-12-19 22:20:35', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('55', 'SQL监控', '/system/auth/druid', 'admin:druid', '1', '0', '1', '42', '2016-12-20 22:10:45', 'fa-code', '1');
INSERT INTO `resources` VALUES ('56', '帖子列表', '/system/admin/topicmanage/topiclist', 'admin:topic:topiclist', '1', '0', '1', '34', '2016-12-21 21:17:39', 'fa-list', '0');
INSERT INTO `resources` VALUES ('57', '置顶帖子', '/system/admin/topicmanage/topsign', 'admin:topic:top', '1', '0', '2', '34', '2016-12-21 21:20:29', 'fa-arrow-up', '0');
INSERT INTO `resources` VALUES ('58', '热门加精', '/system/admin/topicmanage/spec', 'admin:topic:spec', '1', '0', '3', '34', '2016-12-21 21:21:48', 'fa-star', '0');
INSERT INTO `resources` VALUES ('59', '待审核', '/system/admin/topicmanage/audit', 'admin:topic:audit', '1', '0', '4', '34', '2016-12-21 21:22:47', 'fa-eye-slash', '0');
INSERT INTO `resources` VALUES ('60', '回收站', '/system/admin/topicmanage/trash', 'admin:topic:trash', '1', '0', '5', '34', '2016-12-21 21:23:47', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('61', '获取权限树', '/system/admin/sysmanage/role/tree', 'admin:sys:role:tree', '2', '0', '1', '21', '2016-12-23 20:43:41', 'fa-code-fork', '0');
INSERT INTO `resources` VALUES ('62', '禁言用户', '/system/admin/sysmanage/nottalk', 'admin:sys:talk', '1', '0', '5', '1', '2016-12-24 16:15:48', 'fa-meh-o', '0');
INSERT INTO `resources` VALUES ('63', '已关闭评论', '/system/admin/topicmanage/closereply', 'admin:topic:closereply', '1', '0', '6', '34', '2016-12-24 16:19:00', 'fa-microphone-slash', '0');
INSERT INTO `resources` VALUES ('64', '初始化Lucenes索引', '/system/admin/config/lucene/init', 'admin:config:lucene:init', '2', '0', '1', '45', '2016-12-24 19:58:48', 'fa-sitemap', '0');
INSERT INTO `resources` VALUES ('66', '删除', '/system/admin/sysmanage/role/delete', 'admin:sys:role:delete', '2', '0', '3', '3', '2016-12-25 21:52:32', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('67', '系统监控', '/monitoring', 'admin:monitoring', '1', '0', '2', '42', '2016-12-28 21:16:45', 'fa-exclamation-triangle', '1');
INSERT INTO `resources` VALUES ('68', '查找', '/system/admin/sysmanage/admin/search', 'admin:sys:admin:search', '2', '0', '1', '17', '2016-12-28 21:30:11', 'fa-search', '0');
INSERT INTO `resources` VALUES ('69', '图表数据', '/system/admin/chart/data', 'admin:chart:Data', '2', '0', '1', '43', '2016-12-30 21:16:50', 'fa-bar-chart-o', '0');
INSERT INTO `resources` VALUES ('70', '立即执行', '/system/admin/quartz/runnow', 'admin:quartz:runnow', '2', '0', '1', '51', '2016-12-31 15:03:36', 'fa-play', '0');
INSERT INTO `resources` VALUES ('71', '添加', '/system/admin/home/image/add', 'admin:home:image:add', '2', '0', '1', '6', '2017-01-01 21:42:54', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('72', '添加', '/system/admin/home/quick/add', 'admin:home:quick:add', '2', '0', '1', '7', '2017-01-02 18:02:14', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('73', '添加', '/system/admin/home/recommend/add', 'admin:home:recommend:add', '2', '0', '1', '8', '2017-01-02 18:53:39', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('74', '编辑', '/system/admin/home/recommend/update', 'admin:home:recommend:update', '2', '0', '2', '8', '2017-01-02 20:55:56', 'fa-edit', '0');
INSERT INTO `resources` VALUES ('75', '删除', '/system/admin/home/recommend/delete', 'admin:home:recommend:delete', '2', '0', '3', '8', '2017-01-03 20:20:43', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('76', '修改', '/system/admin/home/quick/update', 'admin:home:quick:update', '2', '0', '2', '7', '2017-01-03 20:46:20', 'fa-edit', '0');
INSERT INTO `resources` VALUES ('77', '删除', '/system/admin/home/quick/delete', 'admin:home:quick:delete', '2', '0', '3', '7', '2017-01-03 21:11:44', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('78', '编辑', '/system/admin/home/image/update', 'admin:home:image:update', '2', '0', '2', '6', '2017-01-03 21:42:52', 'fa-edit', '0');
INSERT INTO `resources` VALUES ('79', '删除', '/system/admin/home/image/delete', 'admin:home:image:delete', '2', '0', '3', '6', '2017-01-03 22:03:47', 'fa-trash-o', '0');
INSERT INTO `resources` VALUES ('80', '查找', '/system/admin/home/recommend/search', 'admin:home:recommend:search', '2', '0', '4', '8', '2017-01-04 23:31:24', 'fa-search', '0');
INSERT INTO `resources` VALUES ('81', '查找', '/system/admin/log/operation/search', 'admin:log:operation:search', '2', '0', '1', '16', '2017-01-05 19:45:32', 'fa-search', '0');
INSERT INTO `resources` VALUES ('82', '查找', '/system/admin/log/sign/search', 'admin:log:sign:search', '2', '0', '2', '23', '2017-01-05 20:17:19', 'fa-search', '0');
INSERT INTO `resources` VALUES ('83', '查找', '/system/admin/log/gold/search', 'admin:log:gold:search', '2', '0', '2', '25', '2017-01-05 20:18:02', 'fa-search', '0');
INSERT INTO `resources` VALUES ('84', '查找', '/system/admin/log/experience/search', 'admin:log:experience:search', '2', '0', '2', '24', '2017-01-05 20:19:31', 'fa-search', '0');
INSERT INTO `resources` VALUES ('85', '查找', '/system/admin/log/gold/detail/search', 'admin:log:gold:detail:search', '2', '0', '1', '31', '2017-01-05 20:41:20', 'fa-search', '0');
INSERT INTO `resources` VALUES ('86', '查找', '/system/admin/log/experience/detail/search', 'admin:log:experience:detail:search', '2', '0', '1', '32', '2017-01-05 20:42:10', 'fa-search', '0');
INSERT INTO `resources` VALUES ('87', '查找', '/system/admin/navboard/navigation/search', 'admin:nb:nav:search', '2', '0', '1', '27', '2017-01-05 20:59:28', 'fa-search', '0');
INSERT INTO `resources` VALUES ('88', '添加', '/system/admin/navboard/navigation/add', 'admin:nb:nav:add', '2', '0', '2', '27', '2017-01-05 21:19:51', 'fa-plus', '0');
INSERT INTO `resources` VALUES ('89', '编辑', '/system/admin/navboard/navigation/update', 'admin:nb:nav:update', '2', '0', '3', '27', '2017-01-05 21:20:44', 'fa-edit', '0');
INSERT INTO `resources` VALUES ('90', '删除', '/system/admin/navboard/navigation/delete', 'admin:nb:nav:delete', '2', '0', '4', '27', '2017-01-05 21:50:10', 'fa-trash-o', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(20) NOT NULL COMMENT '角色名',
  `role_color` varchar(20) NOT NULL COMMENT '角色名颜色',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `role_status` int(11) NOT NULL DEFAULT '0' COMMENT '角色状态(删除){0:否,1:是}',
  `role_create_time` datetime DEFAULT NULL,
  `is_access` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '#FF9900', '最高权限', '0', '2016-09-03 13:03:45', '1');
INSERT INTO `role` VALUES ('2', '管理员', '#FF9900', '除管理员管理外的所有权限', '0', '2016-09-03 13:04:45', '1');
INSERT INTO `role` VALUES ('3', '论坛版主', '#FF9900', '版主权限', '0', '2016-09-03 13:05:45', '0');
INSERT INTO `role` VALUES ('4', '普通会员', '#000000', '会员权限', '0', '2016-09-03 13:06:45', '0');
INSERT INTO `role` VALUES ('6', '论坛管理', '#FF9900', '主要负责帖子，评论等等部分权限', '0', '2016-12-06 20:19:30', '1');

-- ----------------------------
-- Table structure for role_resources
-- ----------------------------
DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE `role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_id` int(11) NOT NULL COMMENT '角色ID,关联role表',
  `res_id` int(11) NOT NULL COMMENT '资源ID,关联user_resources表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of role_resources
-- ----------------------------
INSERT INTO `role_resources` VALUES ('1', '1', '1');
INSERT INTO `role_resources` VALUES ('2', '1', '2');
INSERT INTO `role_resources` VALUES ('3', '1', '3');
INSERT INTO `role_resources` VALUES ('4', '1', '4');
INSERT INTO `role_resources` VALUES ('5', '1', '5');
INSERT INTO `role_resources` VALUES ('6', '1', '6');
INSERT INTO `role_resources` VALUES ('7', '1', '7');
INSERT INTO `role_resources` VALUES ('8', '1', '8');
INSERT INTO `role_resources` VALUES ('9', '1', '9');
INSERT INTO `role_resources` VALUES ('10', '1', '10');
INSERT INTO `role_resources` VALUES ('11', '1', '11');
INSERT INTO `role_resources` VALUES ('12', '1', '12');
INSERT INTO `role_resources` VALUES ('13', '1', '13');
INSERT INTO `role_resources` VALUES ('14', '1', '14');
INSERT INTO `role_resources` VALUES ('15', '1', '15');
INSERT INTO `role_resources` VALUES ('16', '1', '16');
INSERT INTO `role_resources` VALUES ('17', '1', '17');
INSERT INTO `role_resources` VALUES ('18', '2', '1');
INSERT INTO `role_resources` VALUES ('19', '2', '2');
INSERT INTO `role_resources` VALUES ('20', '2', '3');
INSERT INTO `role_resources` VALUES ('21', '2', '4');
INSERT INTO `role_resources` VALUES ('22', '2', '5');
INSERT INTO `role_resources` VALUES ('23', '2', '6');
INSERT INTO `role_resources` VALUES ('24', '2', '7');
INSERT INTO `role_resources` VALUES ('25', '2', '8');
INSERT INTO `role_resources` VALUES ('26', '2', '9');
INSERT INTO `role_resources` VALUES ('27', '2', '10');
INSERT INTO `role_resources` VALUES ('28', '2', '11');
INSERT INTO `role_resources` VALUES ('29', '2', '12');
INSERT INTO `role_resources` VALUES ('30', '2', '13');
INSERT INTO `role_resources` VALUES ('31', '2', '14');
INSERT INTO `role_resources` VALUES ('32', '2', '15');
INSERT INTO `role_resources` VALUES ('33', '2', '16');
INSERT INTO `role_resources` VALUES ('36', '1', '20');
INSERT INTO `role_resources` VALUES ('37', '2', '20');
INSERT INTO `role_resources` VALUES ('38', '1', '21');
INSERT INTO `role_resources` VALUES ('39', '2', '21');
INSERT INTO `role_resources` VALUES ('40', '1', '22');
INSERT INTO `role_resources` VALUES ('41', '2', '22');
INSERT INTO `role_resources` VALUES ('42', '1', '23');
INSERT INTO `role_resources` VALUES ('43', '2', '23');
INSERT INTO `role_resources` VALUES ('44', '6', '23');
INSERT INTO `role_resources` VALUES ('45', '1', '24');
INSERT INTO `role_resources` VALUES ('46', '2', '24');
INSERT INTO `role_resources` VALUES ('47', '6', '24');
INSERT INTO `role_resources` VALUES ('48', '1', '25');
INSERT INTO `role_resources` VALUES ('49', '2', '25');
INSERT INTO `role_resources` VALUES ('50', '6', '25');
INSERT INTO `role_resources` VALUES ('51', '1', '26');
INSERT INTO `role_resources` VALUES ('52', '2', '26');
INSERT INTO `role_resources` VALUES ('53', '6', '26');
INSERT INTO `role_resources` VALUES ('54', '1', '27');
INSERT INTO `role_resources` VALUES ('55', '2', '27');
INSERT INTO `role_resources` VALUES ('56', '6', '27');
INSERT INTO `role_resources` VALUES ('57', '1', '28');
INSERT INTO `role_resources` VALUES ('58', '2', '28');
INSERT INTO `role_resources` VALUES ('59', '6', '28');
INSERT INTO `role_resources` VALUES ('60', '1', '29');
INSERT INTO `role_resources` VALUES ('61', '2', '29');
INSERT INTO `role_resources` VALUES ('62', '6', '29');
INSERT INTO `role_resources` VALUES ('63', '1', '30');
INSERT INTO `role_resources` VALUES ('64', '2', '30');
INSERT INTO `role_resources` VALUES ('65', '6', '30');
INSERT INTO `role_resources` VALUES ('66', '1', '31');
INSERT INTO `role_resources` VALUES ('67', '2', '31');
INSERT INTO `role_resources` VALUES ('68', '6', '31');
INSERT INTO `role_resources` VALUES ('69', '1', '32');
INSERT INTO `role_resources` VALUES ('70', '2', '32');
INSERT INTO `role_resources` VALUES ('71', '6', '32');
INSERT INTO `role_resources` VALUES ('72', '1', '33');
INSERT INTO `role_resources` VALUES ('73', '2', '33');
INSERT INTO `role_resources` VALUES ('74', '6', '33');
INSERT INTO `role_resources` VALUES ('75', '1', '34');
INSERT INTO `role_resources` VALUES ('76', '2', '34');
INSERT INTO `role_resources` VALUES ('77', '6', '34');
INSERT INTO `role_resources` VALUES ('78', '1', '35');
INSERT INTO `role_resources` VALUES ('79', '2', '35');
INSERT INTO `role_resources` VALUES ('80', '6', '35');
INSERT INTO `role_resources` VALUES ('81', '1', '36');
INSERT INTO `role_resources` VALUES ('82', '2', '36');
INSERT INTO `role_resources` VALUES ('83', '6', '36');
INSERT INTO `role_resources` VALUES ('84', '1', '37');
INSERT INTO `role_resources` VALUES ('85', '2', '37');
INSERT INTO `role_resources` VALUES ('86', '6', '37');
INSERT INTO `role_resources` VALUES ('87', '1', '38');
INSERT INTO `role_resources` VALUES ('88', '2', '38');
INSERT INTO `role_resources` VALUES ('89', '6', '38');
INSERT INTO `role_resources` VALUES ('90', '1', '39');
INSERT INTO `role_resources` VALUES ('91', '2', '39');
INSERT INTO `role_resources` VALUES ('92', '1', '40');
INSERT INTO `role_resources` VALUES ('93', '1', '41');
INSERT INTO `role_resources` VALUES ('94', '2', '41');
INSERT INTO `role_resources` VALUES ('95', '1', '42');
INSERT INTO `role_resources` VALUES ('96', '1', '43');
INSERT INTO `role_resources` VALUES ('97', '2', '43');
INSERT INTO `role_resources` VALUES ('98', '1', '44');
INSERT INTO `role_resources` VALUES ('99', '2', '44');
INSERT INTO `role_resources` VALUES ('100', '6', '44');
INSERT INTO `role_resources` VALUES ('101', '1', '45');
INSERT INTO `role_resources` VALUES ('102', '2', '45');
INSERT INTO `role_resources` VALUES ('103', '1', '46');
INSERT INTO `role_resources` VALUES ('104', '2', '46');
INSERT INTO `role_resources` VALUES ('105', '1', '47');
INSERT INTO `role_resources` VALUES ('106', '2', '47');
INSERT INTO `role_resources` VALUES ('107', '1', '48');
INSERT INTO `role_resources` VALUES ('108', '2', '48');
INSERT INTO `role_resources` VALUES ('109', '6', '48');
INSERT INTO `role_resources` VALUES ('110', '1', '49');
INSERT INTO `role_resources` VALUES ('111', '2', '49');
INSERT INTO `role_resources` VALUES ('112', '6', '49');
INSERT INTO `role_resources` VALUES ('113', '1', '50');
INSERT INTO `role_resources` VALUES ('114', '1', '51');
INSERT INTO `role_resources` VALUES ('115', '2', '51');
INSERT INTO `role_resources` VALUES ('116', '1', '52');
INSERT INTO `role_resources` VALUES ('117', '2', '52');
INSERT INTO `role_resources` VALUES ('118', '1', '53');
INSERT INTO `role_resources` VALUES ('119', '2', '53');
INSERT INTO `role_resources` VALUES ('120', '6', '53');
INSERT INTO `role_resources` VALUES ('121', '1', '54');
INSERT INTO `role_resources` VALUES ('122', '2', '54');
INSERT INTO `role_resources` VALUES ('123', '6', '54');
INSERT INTO `role_resources` VALUES ('124', '1', '55');
INSERT INTO `role_resources` VALUES ('125', '1', '56');
INSERT INTO `role_resources` VALUES ('126', '2', '56');
INSERT INTO `role_resources` VALUES ('127', '6', '56');
INSERT INTO `role_resources` VALUES ('128', '1', '57');
INSERT INTO `role_resources` VALUES ('129', '2', '57');
INSERT INTO `role_resources` VALUES ('130', '6', '57');
INSERT INTO `role_resources` VALUES ('131', '1', '58');
INSERT INTO `role_resources` VALUES ('132', '2', '58');
INSERT INTO `role_resources` VALUES ('133', '6', '58');
INSERT INTO `role_resources` VALUES ('134', '1', '59');
INSERT INTO `role_resources` VALUES ('135', '2', '59');
INSERT INTO `role_resources` VALUES ('136', '6', '59');
INSERT INTO `role_resources` VALUES ('137', '1', '60');
INSERT INTO `role_resources` VALUES ('138', '2', '60');
INSERT INTO `role_resources` VALUES ('139', '6', '60');
INSERT INTO `role_resources` VALUES ('140', '1', '61');
INSERT INTO `role_resources` VALUES ('141', '2', '61');
INSERT INTO `role_resources` VALUES ('142', '1', '62');
INSERT INTO `role_resources` VALUES ('143', '2', '62');
INSERT INTO `role_resources` VALUES ('144', '6', '62');
INSERT INTO `role_resources` VALUES ('145', '1', '63');
INSERT INTO `role_resources` VALUES ('146', '2', '63');
INSERT INTO `role_resources` VALUES ('147', '6', '63');
INSERT INTO `role_resources` VALUES ('148', '1', '64');
INSERT INTO `role_resources` VALUES ('149', '2', '64');
INSERT INTO `role_resources` VALUES ('150', '1', '65');
INSERT INTO `role_resources` VALUES ('151', '2', '65');
INSERT INTO `role_resources` VALUES ('152', '1', '66');
INSERT INTO `role_resources` VALUES ('153', '2', '66');
INSERT INTO `role_resources` VALUES ('154', '1', '67');
INSERT INTO `role_resources` VALUES ('155', '1', '68');
INSERT INTO `role_resources` VALUES ('156', '1', '69');
INSERT INTO `role_resources` VALUES ('157', '2', '69');
INSERT INTO `role_resources` VALUES ('158', '1', '70');
INSERT INTO `role_resources` VALUES ('159', '2', '70');
INSERT INTO `role_resources` VALUES ('160', '1', '71');
INSERT INTO `role_resources` VALUES ('161', '2', '71');
INSERT INTO `role_resources` VALUES ('162', '6', '71');
INSERT INTO `role_resources` VALUES ('163', '1', '72');
INSERT INTO `role_resources` VALUES ('164', '2', '72');
INSERT INTO `role_resources` VALUES ('165', '6', '72');
INSERT INTO `role_resources` VALUES ('166', '1', '73');
INSERT INTO `role_resources` VALUES ('167', '2', '73');
INSERT INTO `role_resources` VALUES ('168', '6', '73');
INSERT INTO `role_resources` VALUES ('169', '1', '74');
INSERT INTO `role_resources` VALUES ('170', '2', '74');
INSERT INTO `role_resources` VALUES ('171', '6', '74');
INSERT INTO `role_resources` VALUES ('172', '1', '75');
INSERT INTO `role_resources` VALUES ('173', '2', '75');
INSERT INTO `role_resources` VALUES ('174', '6', '75');
INSERT INTO `role_resources` VALUES ('175', '1', '76');
INSERT INTO `role_resources` VALUES ('176', '2', '76');
INSERT INTO `role_resources` VALUES ('177', '6', '76');
INSERT INTO `role_resources` VALUES ('178', '1', '77');
INSERT INTO `role_resources` VALUES ('179', '2', '77');
INSERT INTO `role_resources` VALUES ('180', '6', '77');
INSERT INTO `role_resources` VALUES ('181', '1', '78');
INSERT INTO `role_resources` VALUES ('182', '2', '78');
INSERT INTO `role_resources` VALUES ('183', '6', '78');
INSERT INTO `role_resources` VALUES ('184', '1', '79');
INSERT INTO `role_resources` VALUES ('185', '2', '79');
INSERT INTO `role_resources` VALUES ('186', '6', '79');
INSERT INTO `role_resources` VALUES ('187', '1', '80');
INSERT INTO `role_resources` VALUES ('188', '2', '80');
INSERT INTO `role_resources` VALUES ('189', '6', '80');
INSERT INTO `role_resources` VALUES ('190', '1', '81');
INSERT INTO `role_resources` VALUES ('191', '2', '81');
INSERT INTO `role_resources` VALUES ('192', '1', '82');
INSERT INTO `role_resources` VALUES ('193', '2', '82');
INSERT INTO `role_resources` VALUES ('194', '6', '82');
INSERT INTO `role_resources` VALUES ('195', '1', '83');
INSERT INTO `role_resources` VALUES ('196', '2', '83');
INSERT INTO `role_resources` VALUES ('197', '6', '83');
INSERT INTO `role_resources` VALUES ('198', '1', '84');
INSERT INTO `role_resources` VALUES ('199', '2', '84');
INSERT INTO `role_resources` VALUES ('200', '6', '84');
INSERT INTO `role_resources` VALUES ('201', '1', '85');
INSERT INTO `role_resources` VALUES ('202', '2', '85');
INSERT INTO `role_resources` VALUES ('203', '6', '85');
INSERT INTO `role_resources` VALUES ('204', '1', '86');
INSERT INTO `role_resources` VALUES ('205', '2', '86');
INSERT INTO `role_resources` VALUES ('206', '6', '86');
INSERT INTO `role_resources` VALUES ('207', '1', '87');
INSERT INTO `role_resources` VALUES ('208', '2', '87');
INSERT INTO `role_resources` VALUES ('209', '6', '87');
INSERT INTO `role_resources` VALUES ('210', '1', '88');
INSERT INTO `role_resources` VALUES ('211', '2', '88');
INSERT INTO `role_resources` VALUES ('212', '6', '88');
INSERT INTO `role_resources` VALUES ('213', '1', '89');
INSERT INTO `role_resources` VALUES ('214', '2', '89');
INSERT INTO `role_resources` VALUES ('215', '6', '89');
INSERT INTO `role_resources` VALUES ('216', '1', '90');
INSERT INTO `role_resources` VALUES ('217', '2', '90');
INSERT INTO `role_resources` VALUES ('218', '6', '90');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务组',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `cron_expression` varchar(255) NOT NULL COMMENT '任务执行表达式',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务目标类',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '是否有状态',
  `spring_id` varchar(255) DEFAULT NULL COMMENT '任务spring bean',
  `method_name` varchar(255) NOT NULL COMMENT '任务目标方法',
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `name_group` (`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务调度表';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', '2016-12-28 22:42:02', '2016-12-29 21:03:37', '每日数据统计', '数据', '1', '0 0 0 * * ? *', '每日数据统计', 'cn.ifxcode.bbs.job.task.CountJob', '1', 'countJob', 'saveCount');
INSERT INTO `schedule_job` VALUES ('2', '2016-12-31 12:54:15', '2016-12-31 14:07:42', '版块数据同步', '数据', '1', '0 0 0 * * ? *', '版块数据同步', 'cn.ifxcode.bbs.job.task.SyncData', '1', 'syncData', 'syncBoardInfo');
INSERT INTO `schedule_job` VALUES ('3', '2017-01-01 23:06:39', '2017-01-01 23:06:42', '备份数据库', '数据', '1', '0 0 0 * * ? *', '备份数据库', 'cn.ifxcode.bbs.job.task.BackupData', '1', 'backupData', 'backupDB');

-- ----------------------------
-- Table structure for swf_area
-- ----------------------------
DROP TABLE IF EXISTS `swf_area`;
CREATE TABLE `swf_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swf_area
-- ----------------------------
INSERT INTO `swf_area` VALUES ('100', '0', '安徽', '1');
INSERT INTO `swf_area` VALUES ('101', '100', '合肥', '1');
INSERT INTO `swf_area` VALUES ('102', '100', '安庆', '1');
INSERT INTO `swf_area` VALUES ('103', '100', '毫州', '1');
INSERT INTO `swf_area` VALUES ('104', '100', '蚌埠', '1');
INSERT INTO `swf_area` VALUES ('105', '100', '滁州', '1');
INSERT INTO `swf_area` VALUES ('106', '100', '巢湖', '1');
INSERT INTO `swf_area` VALUES ('107', '100', '池州', '1');
INSERT INTO `swf_area` VALUES ('108', '100', '阜阳', '1');
INSERT INTO `swf_area` VALUES ('109', '100', '淮北', '1');
INSERT INTO `swf_area` VALUES ('110', '100', '淮南', '1');
INSERT INTO `swf_area` VALUES ('111', '100', '黄山站', '1');
INSERT INTO `swf_area` VALUES ('112', '100', '六安', '1');
INSERT INTO `swf_area` VALUES ('113', '100', '马鞍山', '1');
INSERT INTO `swf_area` VALUES ('114', '100', '宿州', '1');
INSERT INTO `swf_area` VALUES ('115', '100', '铜陵', '1');
INSERT INTO `swf_area` VALUES ('116', '100', '芜湖', '1');
INSERT INTO `swf_area` VALUES ('117', '100', '宣城', '1');
INSERT INTO `swf_area` VALUES ('200', '0', '澳门', '2');
INSERT INTO `swf_area` VALUES ('201', '200', '澳门', '2');
INSERT INTO `swf_area` VALUES ('300', '0', '北京', '3');
INSERT INTO `swf_area` VALUES ('301', '300', '北京', '3');
INSERT INTO `swf_area` VALUES ('400', '0', '重庆', '4');
INSERT INTO `swf_area` VALUES ('401', '400', '重庆', '4');
INSERT INTO `swf_area` VALUES ('500', '0', '福建', '5');
INSERT INTO `swf_area` VALUES ('501', '500', '福州', '5');
INSERT INTO `swf_area` VALUES ('502', '500', '龙岩', '5');
INSERT INTO `swf_area` VALUES ('503', '500', '南平', '5');
INSERT INTO `swf_area` VALUES ('504', '500', '宁德', '5');
INSERT INTO `swf_area` VALUES ('505', '500', '莆田', '5');
INSERT INTO `swf_area` VALUES ('506', '500', '泉州', '5');
INSERT INTO `swf_area` VALUES ('507', '500', '三明', '5');
INSERT INTO `swf_area` VALUES ('508', '500', '厦门', '5');
INSERT INTO `swf_area` VALUES ('509', '500', '漳州', '5');
INSERT INTO `swf_area` VALUES ('600', '0', '甘肃', '6');
INSERT INTO `swf_area` VALUES ('601', '600', '兰州', '6');
INSERT INTO `swf_area` VALUES ('602', '600', '白银', '6');
INSERT INTO `swf_area` VALUES ('603', '600', '定西', '6');
INSERT INTO `swf_area` VALUES ('604', '600', '合作', '6');
INSERT INTO `swf_area` VALUES ('605', '600', '金昌', '6');
INSERT INTO `swf_area` VALUES ('606', '600', '酒泉', '6');
INSERT INTO `swf_area` VALUES ('607', '600', '嘉峪关', '6');
INSERT INTO `swf_area` VALUES ('608', '600', '临夏', '6');
INSERT INTO `swf_area` VALUES ('609', '600', '平凉', '6');
INSERT INTO `swf_area` VALUES ('610', '600', '庆阳', '6');
INSERT INTO `swf_area` VALUES ('611', '600', '天水', '6');
INSERT INTO `swf_area` VALUES ('612', '600', '武威', '6');
INSERT INTO `swf_area` VALUES ('613', '600', '武都', '6');
INSERT INTO `swf_area` VALUES ('614', '600', '张掖', '6');
INSERT INTO `swf_area` VALUES ('700', '0', '广东', '7');
INSERT INTO `swf_area` VALUES ('701', '700', '广州', '7');
INSERT INTO `swf_area` VALUES ('702', '700', '潮州', '7');
INSERT INTO `swf_area` VALUES ('703', '700', '东莞', '7');
INSERT INTO `swf_area` VALUES ('704', '700', '佛山', '7');
INSERT INTO `swf_area` VALUES ('705', '700', '河源', '7');
INSERT INTO `swf_area` VALUES ('706', '700', '惠州', '7');
INSERT INTO `swf_area` VALUES ('707', '700', '江门', '7');
INSERT INTO `swf_area` VALUES ('708', '700', '揭阳', '7');
INSERT INTO `swf_area` VALUES ('709', '700', '梅州', '7');
INSERT INTO `swf_area` VALUES ('710', '700', '茂名', '7');
INSERT INTO `swf_area` VALUES ('711', '700', '清远', '7');
INSERT INTO `swf_area` VALUES ('712', '700', '深圳', '7');
INSERT INTO `swf_area` VALUES ('713', '700', '汕头', '7');
INSERT INTO `swf_area` VALUES ('714', '700', '韶关', '7');
INSERT INTO `swf_area` VALUES ('715', '700', '汕尾', '7');
INSERT INTO `swf_area` VALUES ('716', '700', '阳江', '7');
INSERT INTO `swf_area` VALUES ('717', '700', '云浮', '7');
INSERT INTO `swf_area` VALUES ('718', '700', '珠海', '7');
INSERT INTO `swf_area` VALUES ('719', '700', '中山', '7');
INSERT INTO `swf_area` VALUES ('720', '700', '湛江', '7');
INSERT INTO `swf_area` VALUES ('721', '700', '肇庆', '7');
INSERT INTO `swf_area` VALUES ('800', '0', '广西', '8');
INSERT INTO `swf_area` VALUES ('801', '800', '南宁', '8');
INSERT INTO `swf_area` VALUES ('802', '800', '北海', '8');
INSERT INTO `swf_area` VALUES ('803', '800', '白色', '8');
INSERT INTO `swf_area` VALUES ('804', '800', '崇左', '8');
INSERT INTO `swf_area` VALUES ('805', '800', '防城港', '8');
INSERT INTO `swf_area` VALUES ('806', '800', '桂林', '8');
INSERT INTO `swf_area` VALUES ('807', '800', '贵港', '8');
INSERT INTO `swf_area` VALUES ('808', '800', '贺州', '8');
INSERT INTO `swf_area` VALUES ('809', '800', '河池', '8');
INSERT INTO `swf_area` VALUES ('810', '800', '柳州', '8');
INSERT INTO `swf_area` VALUES ('811', '800', '来宾', '8');
INSERT INTO `swf_area` VALUES ('812', '800', '钦州', '8');
INSERT INTO `swf_area` VALUES ('813', '800', '梧州', '8');
INSERT INTO `swf_area` VALUES ('814', '800', '玉林', '8');
INSERT INTO `swf_area` VALUES ('900', '0', '贵州', '9');
INSERT INTO `swf_area` VALUES ('901', '900', '贵阳', '9');
INSERT INTO `swf_area` VALUES ('902', '900', '安顺', '9');
INSERT INTO `swf_area` VALUES ('903', '900', '毕节', '9');
INSERT INTO `swf_area` VALUES ('904', '900', '都匀', '9');
INSERT INTO `swf_area` VALUES ('905', '900', '凯里', '9');
INSERT INTO `swf_area` VALUES ('906', '900', '六盘水', '9');
INSERT INTO `swf_area` VALUES ('907', '900', '晴隆', '9');
INSERT INTO `swf_area` VALUES ('908', '900', '铜仁', '9');
INSERT INTO `swf_area` VALUES ('909', '900', '兴义', '9');
INSERT INTO `swf_area` VALUES ('910', '900', '遵义', '9');
INSERT INTO `swf_area` VALUES ('1000', '0', '海南', '10');
INSERT INTO `swf_area` VALUES ('1001', '1000', '海口', '10');
INSERT INTO `swf_area` VALUES ('1002', '1000', '白沙', '10');
INSERT INTO `swf_area` VALUES ('1003', '1000', '保亭', '10');
INSERT INTO `swf_area` VALUES ('1004', '1000', '澄迈', '10');
INSERT INTO `swf_area` VALUES ('1005', '1000', '昌江', '10');
INSERT INTO `swf_area` VALUES ('1006', '1000', '儋州', '10');
INSERT INTO `swf_area` VALUES ('1007', '1000', '定安', '10');
INSERT INTO `swf_area` VALUES ('1008', '1000', '东方', '10');
INSERT INTO `swf_area` VALUES ('1009', '1000', '临高', '10');
INSERT INTO `swf_area` VALUES ('1010', '1000', '陵水', '10');
INSERT INTO `swf_area` VALUES ('1011', '1000', '乐东', '10');
INSERT INTO `swf_area` VALUES ('1012', '1000', '南沙岛', '10');
INSERT INTO `swf_area` VALUES ('1013', '1000', '琼海', '10');
INSERT INTO `swf_area` VALUES ('1014', '1000', '琼中', '10');
INSERT INTO `swf_area` VALUES ('1015', '1000', '三亚', '10');
INSERT INTO `swf_area` VALUES ('1016', '1000', '屯昌', '10');
INSERT INTO `swf_area` VALUES ('1017', '1000', '五指山', '10');
INSERT INTO `swf_area` VALUES ('1018', '1000', '文昌', '10');
INSERT INTO `swf_area` VALUES ('1019', '1000', '万宁', '10');
INSERT INTO `swf_area` VALUES ('1020', '1000', '西沙', '10');
INSERT INTO `swf_area` VALUES ('1100', '0', '河北', '11');
INSERT INTO `swf_area` VALUES ('1101', '1100', '石家庄', '11');
INSERT INTO `swf_area` VALUES ('1102', '1100', '保定', '11');
INSERT INTO `swf_area` VALUES ('1103', '1100', '承德', '11');
INSERT INTO `swf_area` VALUES ('1104', '1100', '沧州', '11');
INSERT INTO `swf_area` VALUES ('1105', '1100', '衡水', '11');
INSERT INTO `swf_area` VALUES ('1106', '1100', '邯郸', '11');
INSERT INTO `swf_area` VALUES ('1107', '1100', '廊坊', '11');
INSERT INTO `swf_area` VALUES ('1108', '1100', '秦皇岛', '11');
INSERT INTO `swf_area` VALUES ('1109', '1100', '唐山', '11');
INSERT INTO `swf_area` VALUES ('1110', '1100', '邢台', '11');
INSERT INTO `swf_area` VALUES ('1111', '1100', '张家口', '11');
INSERT INTO `swf_area` VALUES ('1200', '0', '河南', '12');
INSERT INTO `swf_area` VALUES ('1201', '1200', '郑州', '12');
INSERT INTO `swf_area` VALUES ('1202', '1200', '安阳', '12');
INSERT INTO `swf_area` VALUES ('1203', '1200', '鹤壁', '12');
INSERT INTO `swf_area` VALUES ('1204', '1200', '焦作', '12');
INSERT INTO `swf_area` VALUES ('1205', '1200', '济源', '12');
INSERT INTO `swf_area` VALUES ('1206', '1200', '开封', '12');
INSERT INTO `swf_area` VALUES ('1207', '1200', '洛阳', '12');
INSERT INTO `swf_area` VALUES ('1208', '1200', '漯河', '12');
INSERT INTO `swf_area` VALUES ('1209', '1200', '南阳', '12');
INSERT INTO `swf_area` VALUES ('1210', '1200', '濮阳', '12');
INSERT INTO `swf_area` VALUES ('1211', '1200', '平顶山', '12');
INSERT INTO `swf_area` VALUES ('1212', '1200', '三门峡', '12');
INSERT INTO `swf_area` VALUES ('1213', '1200', '商丘', '12');
INSERT INTO `swf_area` VALUES ('1214', '1200', '新乡', '12');
INSERT INTO `swf_area` VALUES ('1215', '1200', '许昌', '12');
INSERT INTO `swf_area` VALUES ('1216', '1200', '信阳', '12');
INSERT INTO `swf_area` VALUES ('1217', '1200', '周口', '12');
INSERT INTO `swf_area` VALUES ('1218', '1200', '驻马店', '12');
INSERT INTO `swf_area` VALUES ('1300', '0', '黑龙江', '13');
INSERT INTO `swf_area` VALUES ('1301', '1300', '哈尔滨', '13');
INSERT INTO `swf_area` VALUES ('1302', '1300', '大庆', '13');
INSERT INTO `swf_area` VALUES ('1303', '1300', '大兴安岭', '13');
INSERT INTO `swf_area` VALUES ('1304', '1300', '鹤岗', '13');
INSERT INTO `swf_area` VALUES ('1305', '1300', '黑河', '13');
INSERT INTO `swf_area` VALUES ('1306', '1300', '佳木斯', '13');
INSERT INTO `swf_area` VALUES ('1307', '1300', '鸡西', '13');
INSERT INTO `swf_area` VALUES ('1308', '1300', '牡丹江', '13');
INSERT INTO `swf_area` VALUES ('1309', '1300', '齐齐哈尔', '13');
INSERT INTO `swf_area` VALUES ('1310', '1300', '七台河', '13');
INSERT INTO `swf_area` VALUES ('1311', '1300', '双鸭山', '13');
INSERT INTO `swf_area` VALUES ('1312', '1300', '绥化', '13');
INSERT INTO `swf_area` VALUES ('1313', '1300', '伊春', '13');
INSERT INTO `swf_area` VALUES ('1400', '0', '湖北', '14');
INSERT INTO `swf_area` VALUES ('1401', '1400', '武汉', '14');
INSERT INTO `swf_area` VALUES ('1402', '1400', '鄂州', '14');
INSERT INTO `swf_area` VALUES ('1403', '1400', '恩施', '14');
INSERT INTO `swf_area` VALUES ('1404', '1400', '黄石', '14');
INSERT INTO `swf_area` VALUES ('1405', '1400', '黄冈', '14');
INSERT INTO `swf_area` VALUES ('1406', '1400', '荆州', '14');
INSERT INTO `swf_area` VALUES ('1407', '1400', '荆门', '14');
INSERT INTO `swf_area` VALUES ('1408', '1400', '潜江', '14');
INSERT INTO `swf_area` VALUES ('1409', '1400', '十堰', '14');
INSERT INTO `swf_area` VALUES ('1410', '1400', '随州', '14');
INSERT INTO `swf_area` VALUES ('1411', '1400', '神农架', '14');
INSERT INTO `swf_area` VALUES ('1412', '1400', '天门', '14');
INSERT INTO `swf_area` VALUES ('1413', '1400', '襄阳', '14');
INSERT INTO `swf_area` VALUES ('1414', '1400', '孝感', '14');
INSERT INTO `swf_area` VALUES ('1415', '1400', '咸宁', '14');
INSERT INTO `swf_area` VALUES ('1416', '1400', '仙桃', '14');
INSERT INTO `swf_area` VALUES ('1417', '1400', '宜昌', '14');
INSERT INTO `swf_area` VALUES ('1500', '0', '湖南', '15');
INSERT INTO `swf_area` VALUES ('1501', '1500', '长沙', '15');
INSERT INTO `swf_area` VALUES ('1502', '1500', '常德', '15');
INSERT INTO `swf_area` VALUES ('1503', '1500', '郴州', '15');
INSERT INTO `swf_area` VALUES ('1504', '1500', '衡阳', '15');
INSERT INTO `swf_area` VALUES ('1505', '1500', '怀化', '15');
INSERT INTO `swf_area` VALUES ('1506', '1500', '吉首', '15');
INSERT INTO `swf_area` VALUES ('1507', '1500', '娄底', '15');
INSERT INTO `swf_area` VALUES ('1508', '1500', '黔阳', '15');
INSERT INTO `swf_area` VALUES ('1509', '1500', '邵阳', '15');
INSERT INTO `swf_area` VALUES ('1510', '1500', '湘潭', '15');
INSERT INTO `swf_area` VALUES ('1511', '1500', '岳阳', '15');
INSERT INTO `swf_area` VALUES ('1512', '1500', '益阳', '15');
INSERT INTO `swf_area` VALUES ('1513', '1500', '永州', '15');
INSERT INTO `swf_area` VALUES ('1514', '1500', '株洲', '15');
INSERT INTO `swf_area` VALUES ('1515', '1500', '张家界', '15');
INSERT INTO `swf_area` VALUES ('1600', '0', '吉林', '16');
INSERT INTO `swf_area` VALUES ('1601', '1600', '长春', '16');
INSERT INTO `swf_area` VALUES ('1602', '1600', '白山', '16');
INSERT INTO `swf_area` VALUES ('1603', '1600', '白城', '16');
INSERT INTO `swf_area` VALUES ('1604', '1600', '吉林', '16');
INSERT INTO `swf_area` VALUES ('1605', '1600', '辽源', '16');
INSERT INTO `swf_area` VALUES ('1606', '1600', '四平', '16');
INSERT INTO `swf_area` VALUES ('1607', '1600', '松原', '16');
INSERT INTO `swf_area` VALUES ('1608', '1600', '通化', '16');
INSERT INTO `swf_area` VALUES ('1609', '1600', '延吉', '16');
INSERT INTO `swf_area` VALUES ('1700', '0', '江苏', '17');
INSERT INTO `swf_area` VALUES ('1701', '1700', '南京', '17');
INSERT INTO `swf_area` VALUES ('1702', '1700', '常州', '17');
INSERT INTO `swf_area` VALUES ('1703', '1700', '淮安', '17');
INSERT INTO `swf_area` VALUES ('1704', '1700', '连云港', '17');
INSERT INTO `swf_area` VALUES ('1705', '1700', '南通', '17');
INSERT INTO `swf_area` VALUES ('1706', '1700', '苏州', '17');
INSERT INTO `swf_area` VALUES ('1707', '1700', '宿迁', '17');
INSERT INTO `swf_area` VALUES ('1708', '1700', '秦州', '17');
INSERT INTO `swf_area` VALUES ('1709', '1700', '无锡', '17');
INSERT INTO `swf_area` VALUES ('1710', '1700', '徐州', '17');
INSERT INTO `swf_area` VALUES ('1711', '1700', '盐城', '17');
INSERT INTO `swf_area` VALUES ('1712', '1700', '扬州', '17');
INSERT INTO `swf_area` VALUES ('1713', '1700', '镇江', '17');
INSERT INTO `swf_area` VALUES ('1800', '0', '江西', '18');
INSERT INTO `swf_area` VALUES ('1801', '1800', '南昌', '18');
INSERT INTO `swf_area` VALUES ('1802', '1800', '抚州', '18');
INSERT INTO `swf_area` VALUES ('1803', '1800', '赣州', '18');
INSERT INTO `swf_area` VALUES ('1804', '1800', '九江', '18');
INSERT INTO `swf_area` VALUES ('1805', '1800', '景德镇', '18');
INSERT INTO `swf_area` VALUES ('1806', '1800', '吉安', '18');
INSERT INTO `swf_area` VALUES ('1807', '1800', '萍乡', '18');
INSERT INTO `swf_area` VALUES ('1808', '1800', '上饶', '18');
INSERT INTO `swf_area` VALUES ('1809', '1800', '新余', '18');
INSERT INTO `swf_area` VALUES ('1810', '1800', '鹰潭', '18');
INSERT INTO `swf_area` VALUES ('1811', '1800', '宜春', '18');
INSERT INTO `swf_area` VALUES ('1900', '0', '辽宁', '19');
INSERT INTO `swf_area` VALUES ('1901', '1900', '沈阳', '19');
INSERT INTO `swf_area` VALUES ('1902', '1900', '鞍山', '19');
INSERT INTO `swf_area` VALUES ('1903', '1900', '本溪', '19');
INSERT INTO `swf_area` VALUES ('1904', '1900', '朝阳', '19');
INSERT INTO `swf_area` VALUES ('1905', '1900', '大连', '19');
INSERT INTO `swf_area` VALUES ('1906', '1900', '丹东', '19');
INSERT INTO `swf_area` VALUES ('1907', '1900', '抚顺', '19');
INSERT INTO `swf_area` VALUES ('1908', '1900', '阜新', '19');
INSERT INTO `swf_area` VALUES ('1909', '1900', '葫芦岛', '19');
INSERT INTO `swf_area` VALUES ('1910', '1900', '锦州', '19');
INSERT INTO `swf_area` VALUES ('1911', '1900', '辽阳', '19');
INSERT INTO `swf_area` VALUES ('1912', '1900', '盘锦', '19');
INSERT INTO `swf_area` VALUES ('1913', '1900', '铁岭', '19');
INSERT INTO `swf_area` VALUES ('1914', '1900', '营口', '19');
INSERT INTO `swf_area` VALUES ('2000', '0', '内蒙古', '20');
INSERT INTO `swf_area` VALUES ('2001', '2000', '呼和浩特', '20');
INSERT INTO `swf_area` VALUES ('2002', '2000', '阿拉善左旗', '20');
INSERT INTO `swf_area` VALUES ('2003', '2000', '包头', '20');
INSERT INTO `swf_area` VALUES ('2004', '2000', '赤峰', '20');
INSERT INTO `swf_area` VALUES ('2005', '2000', '鄂尔多斯', '20');
INSERT INTO `swf_area` VALUES ('2006', '2000', '呼伦贝尔', '20');
INSERT INTO `swf_area` VALUES ('2007', '2000', '集宁', '20');
INSERT INTO `swf_area` VALUES ('2008', '2000', '临河', '20');
INSERT INTO `swf_area` VALUES ('2009', '2000', '通辽', '20');
INSERT INTO `swf_area` VALUES ('2010', '2000', '乌兰浩特', '20');
INSERT INTO `swf_area` VALUES ('2011', '2000', '乌海', '20');
INSERT INTO `swf_area` VALUES ('2012', '2000', '锡林浩特', '20');
INSERT INTO `swf_area` VALUES ('2100', '0', '宁夏', '21');
INSERT INTO `swf_area` VALUES ('2101', '2100', '银川', '21');
INSERT INTO `swf_area` VALUES ('2102', '2100', '固原', '21');
INSERT INTO `swf_area` VALUES ('2103', '2100', '石嘴山', '21');
INSERT INTO `swf_area` VALUES ('2104', '2100', '吴忠', '21');
INSERT INTO `swf_area` VALUES ('2105', '2100', '中卫', '21');
INSERT INTO `swf_area` VALUES ('2200', '0', '青海', '22');
INSERT INTO `swf_area` VALUES ('2201', '2200', '西宁', '22');
INSERT INTO `swf_area` VALUES ('2202', '2200', '果洛', '22');
INSERT INTO `swf_area` VALUES ('2203', '2200', '海东', '22');
INSERT INTO `swf_area` VALUES ('2204', '2200', '海南', '22');
INSERT INTO `swf_area` VALUES ('2205', '2200', '海北', '22');
INSERT INTO `swf_area` VALUES ('2206', '2200', '海西', '22');
INSERT INTO `swf_area` VALUES ('2207', '2200', '黄南', '22');
INSERT INTO `swf_area` VALUES ('2208', '2200', '玉树', '22');
INSERT INTO `swf_area` VALUES ('2300', '0', '山东', '23');
INSERT INTO `swf_area` VALUES ('2301', '2300', '济南', '23');
INSERT INTO `swf_area` VALUES ('2302', '2300', '滨州', '23');
INSERT INTO `swf_area` VALUES ('2303', '2300', '东营', '23');
INSERT INTO `swf_area` VALUES ('2304', '2300', '德州', '23');
INSERT INTO `swf_area` VALUES ('2305', '2300', '菏泽', '23');
INSERT INTO `swf_area` VALUES ('2306', '2300', '济宁', '23');
INSERT INTO `swf_area` VALUES ('2307', '2300', '莱芜', '23');
INSERT INTO `swf_area` VALUES ('2308', '2300', '临沂', '23');
INSERT INTO `swf_area` VALUES ('2309', '2300', '聊城', '23');
INSERT INTO `swf_area` VALUES ('2310', '2300', '青岛', '23');
INSERT INTO `swf_area` VALUES ('2311', '2300', '日照', '23');
INSERT INTO `swf_area` VALUES ('2312', '2300', '泰安', '23');
INSERT INTO `swf_area` VALUES ('2313', '2300', '潍坊', '23');
INSERT INTO `swf_area` VALUES ('2314', '2300', '威海', '23');
INSERT INTO `swf_area` VALUES ('2315', '2300', '烟台', '23');
INSERT INTO `swf_area` VALUES ('2316', '2300', '淄博', '23');
INSERT INTO `swf_area` VALUES ('2317', '2300', '枣庄', '23');
INSERT INTO `swf_area` VALUES ('2400', '0', '山西', '24');
INSERT INTO `swf_area` VALUES ('2401', '2400', '太原', '24');
INSERT INTO `swf_area` VALUES ('2402', '2400', '长治', '24');
INSERT INTO `swf_area` VALUES ('2403', '2400', '大同', '24');
INSERT INTO `swf_area` VALUES ('2404', '2400', '晋城', '24');
INSERT INTO `swf_area` VALUES ('2405', '2400', '晋中', '24');
INSERT INTO `swf_area` VALUES ('2406', '2400', '临汾', '24');
INSERT INTO `swf_area` VALUES ('2407', '2400', '吕梁', '24');
INSERT INTO `swf_area` VALUES ('2408', '2400', '朔州', '24');
INSERT INTO `swf_area` VALUES ('2409', '2400', '忻州', '24');
INSERT INTO `swf_area` VALUES ('2410', '2400', '阳泉', '24');
INSERT INTO `swf_area` VALUES ('2411', '2400', '运城', '24');
INSERT INTO `swf_area` VALUES ('2500', '0', '陕西', '25');
INSERT INTO `swf_area` VALUES ('2501', '2500', '西安', '25');
INSERT INTO `swf_area` VALUES ('2502', '2500', '宝康', '25');
INSERT INTO `swf_area` VALUES ('2503', '2500', '宝鸡', '25');
INSERT INTO `swf_area` VALUES ('2504', '2500', '陈仓', '25');
INSERT INTO `swf_area` VALUES ('2505', '2500', '汉中', '25');
INSERT INTO `swf_area` VALUES ('2506', '2500', '商洛', '25');
INSERT INTO `swf_area` VALUES ('2507', '2500', '铜川', '25');
INSERT INTO `swf_area` VALUES ('2508', '2500', '渭南', '25');
INSERT INTO `swf_area` VALUES ('2509', '2500', '咸阳', '25');
INSERT INTO `swf_area` VALUES ('2510', '2500', '延安', '25');
INSERT INTO `swf_area` VALUES ('2511', '2500', '榆林', '25');
INSERT INTO `swf_area` VALUES ('2600', '0', '上海', '26');
INSERT INTO `swf_area` VALUES ('2601', '2600', '上海', '26');
INSERT INTO `swf_area` VALUES ('2700', '0', '四川', '27');
INSERT INTO `swf_area` VALUES ('2701', '2700', '成都', '27');
INSERT INTO `swf_area` VALUES ('2702', '2700', '阿贝', '27');
INSERT INTO `swf_area` VALUES ('2703', '2700', '巴中', '27');
INSERT INTO `swf_area` VALUES ('2704', '2700', '德阳', '27');
INSERT INTO `swf_area` VALUES ('2705', '2700', '达州', '27');
INSERT INTO `swf_area` VALUES ('2706', '2700', '广元', '27');
INSERT INTO `swf_area` VALUES ('2707', '2700', '广安', '27');
INSERT INTO `swf_area` VALUES ('2708', '2700', '甘孜', '27');
INSERT INTO `swf_area` VALUES ('2709', '2700', '泸州', '27');
INSERT INTO `swf_area` VALUES ('2710', '2700', '乐山', '27');
INSERT INTO `swf_area` VALUES ('2711', '2700', '凉山', '27');
INSERT INTO `swf_area` VALUES ('2712', '2700', '绵阳', '27');
INSERT INTO `swf_area` VALUES ('2713', '2700', '眉山', '27');
INSERT INTO `swf_area` VALUES ('2714', '2700', '内江', '27');
INSERT INTO `swf_area` VALUES ('2715', '2700', '南充', '27');
INSERT INTO `swf_area` VALUES ('2716', '2700', '攀枝花', '27');
INSERT INTO `swf_area` VALUES ('2717', '2700', '遂宁', '27');
INSERT INTO `swf_area` VALUES ('2718', '2700', '宜宾', '27');
INSERT INTO `swf_area` VALUES ('2719', '2700', '雅安', '27');
INSERT INTO `swf_area` VALUES ('2720', '2700', '自贡', '27');
INSERT INTO `swf_area` VALUES ('2721', '2700', '资阳', '27');
INSERT INTO `swf_area` VALUES ('2800', '0', '天津', '28');
INSERT INTO `swf_area` VALUES ('2801', '2800', '天津', '28');
INSERT INTO `swf_area` VALUES ('2900', '0', '台湾', '29');
INSERT INTO `swf_area` VALUES ('2901', '2900', '台湾', '29');
INSERT INTO `swf_area` VALUES ('3000', '0', '西藏', '30');
INSERT INTO `swf_area` VALUES ('3001', '3000', '拉萨', '30');
INSERT INTO `swf_area` VALUES ('3002', '3000', '阿里', '30');
INSERT INTO `swf_area` VALUES ('3003', '3000', '昌都', '30');
INSERT INTO `swf_area` VALUES ('3004', '3000', '林芝', '30');
INSERT INTO `swf_area` VALUES ('3005', '3000', '那曲', '30');
INSERT INTO `swf_area` VALUES ('3006', '3000', '日喀则', '30');
INSERT INTO `swf_area` VALUES ('3007', '3000', '山南', '30');
INSERT INTO `swf_area` VALUES ('3100', '0', '香港', '31');
INSERT INTO `swf_area` VALUES ('3101', '3100', '香港', '31');
INSERT INTO `swf_area` VALUES ('3200', '0', '新疆', '32');
INSERT INTO `swf_area` VALUES ('3201', '3200', '乌鲁木齐', '32');
INSERT INTO `swf_area` VALUES ('3202', '3200', '阿克苏', '32');
INSERT INTO `swf_area` VALUES ('3203', '3200', '阿图什', '32');
INSERT INTO `swf_area` VALUES ('3204', '3200', '阿勒泰', '32');
INSERT INTO `swf_area` VALUES ('3205', '3200', '阿拉尔', '32');
INSERT INTO `swf_area` VALUES ('3206', '3200', '博乐', '32');
INSERT INTO `swf_area` VALUES ('3207', '3200', '昌吉', '32');
INSERT INTO `swf_area` VALUES ('3208', '3200', '哈密', '32');
INSERT INTO `swf_area` VALUES ('3209', '3200', '和田', '32');
INSERT INTO `swf_area` VALUES ('3210', '3200', '克拉玛依', '32');
INSERT INTO `swf_area` VALUES ('3211', '3200', '喀什', '32');
INSERT INTO `swf_area` VALUES ('3212', '3200', '库尔勒', '32');
INSERT INTO `swf_area` VALUES ('3213', '3200', '石河子', '32');
INSERT INTO `swf_area` VALUES ('3214', '3200', '吐鲁番', '32');
INSERT INTO `swf_area` VALUES ('3215', '3200', '塔城', '32');
INSERT INTO `swf_area` VALUES ('3216', '3200', '伊宁', '32');
INSERT INTO `swf_area` VALUES ('3300', '0', '云南', '33');
INSERT INTO `swf_area` VALUES ('3301', '3300', '昆明', '33');
INSERT INTO `swf_area` VALUES ('3302', '3300', '保山', '33');
INSERT INTO `swf_area` VALUES ('3303', '3300', '楚雄', '33');
INSERT INTO `swf_area` VALUES ('3304', '3300', '大理', '33');
INSERT INTO `swf_area` VALUES ('3305', '3300', '德宏', '33');
INSERT INTO `swf_area` VALUES ('3306', '3300', '红河', '33');
INSERT INTO `swf_area` VALUES ('3307', '3300', '景洪', '33');
INSERT INTO `swf_area` VALUES ('3308', '3300', '丽江', '33');
INSERT INTO `swf_area` VALUES ('3309', '3300', '临沧', '33');
INSERT INTO `swf_area` VALUES ('3310', '3300', '怒江', '33');
INSERT INTO `swf_area` VALUES ('3311', '3300', '曲靖', '33');
INSERT INTO `swf_area` VALUES ('3312', '3300', '思茅', '33');
INSERT INTO `swf_area` VALUES ('3313', '3300', '文山', '33');
INSERT INTO `swf_area` VALUES ('3314', '3300', '香格里拉', '33');
INSERT INTO `swf_area` VALUES ('3315', '3300', '玉溪', '33');
INSERT INTO `swf_area` VALUES ('3316', '3300', '昭通', '33');
INSERT INTO `swf_area` VALUES ('3400', '0', '浙江', '34');
INSERT INTO `swf_area` VALUES ('3401', '3400', '杭州', '34');
INSERT INTO `swf_area` VALUES ('3402', '3400', '湖州', '34');
INSERT INTO `swf_area` VALUES ('3403', '3400', '嘉兴', '34');
INSERT INTO `swf_area` VALUES ('3404', '3400', '金华', '34');
INSERT INTO `swf_area` VALUES ('3405', '3400', '丽水', '34');
INSERT INTO `swf_area` VALUES ('3406', '3400', '宁波', '34');
INSERT INTO `swf_area` VALUES ('3407', '3400', '衢州', '34');
INSERT INTO `swf_area` VALUES ('3408', '3400', '绍兴', '34');
INSERT INTO `swf_area` VALUES ('3409', '3400', '台州', '34');
INSERT INTO `swf_area` VALUES ('3410', '3400', '温州', '34');
INSERT INTO `swf_area` VALUES ('3411', '3400', '舟山', '34');

-- ----------------------------
-- Table structure for system_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `system_blacklist`;
CREATE TABLE `system_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `black_ip` varchar(50) NOT NULL COMMENT 'IP',
  `black_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='IP黑名单';

-- ----------------------------
-- Records of system_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `attr_name` varchar(50) NOT NULL COMMENT '属性名',
  `attr_value` varchar(20) NOT NULL COMMENT '属性值{0：否，1：是}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'isOpenBbs', '0');
INSERT INTO `system_config` VALUES ('2', 'isAllowRegister', '0');
INSERT INTO `system_config` VALUES ('3', 'isOpenTopicAudit', '0');
INSERT INTO `system_config` VALUES ('4', 'isOpenReplyAudit', '0');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `module` varchar(255) NOT NULL COMMENT '模块',
  `method` varchar(255) NOT NULL COMMENT '方法',
  `status` int(1) NOT NULL COMMENT '执行状态',
  `status_desc` varchar(255) NOT NULL COMMENT '描述',
  `args` varchar(2555) DEFAULT NULL COMMENT '参数',
  `user_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `user_nickname` varchar(20) NOT NULL COMMENT '操作人昵称',
  `ip` varchar(20) NOT NULL COMMENT 'IP',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `sys_log_idx` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COMMENT='操作历史表';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找;link : /system/admin/sysmanage/user/search;sign : admin:sys:user:search;pid : 2;icon : fa-search;type : 2;sort : 1;status : 0;request : org.apache.catalina.connector.RequestFacade@34b5cf3b;}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-05 00:07:47');
INSERT INTO `system_log` VALUES ('2', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; request : org.apache.catalina.connector.RequestFacade@28f5f6f5; }', '1279', 'tonboy', '127.0.0.1', '2016-12-05 00:12:16');
INSERT INTO `system_log` VALUES ('3', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : null; request : org.apache.catalina.connector.RequestFacade@7ef29441; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 00:50:28');
INSERT INTO `system_log` VALUES ('4', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : null; request : org.apache.catalina.connector.RequestFacade@604491ac; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 00:52:29');
INSERT INTO `system_log` VALUES ('5', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : null; request : org.apache.catalina.connector.RequestFacade@6a2404f6; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 00:59:24');
INSERT INTO `system_log` VALUES ('7', '<font color=\"red\">系统管理</font>', '<font color=\"red\">资源管理-添加</font>', '0', '<font color=\"red\">执行方法异常:-->cn.ifxcode.bbs.exception.BbsException: 日志记录异常</font>', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : [I@46ab0405; request : org.apache.catalina.connector.RequestFacade@5950882; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 01:04:28');
INSERT INTO `system_log` VALUES ('9', '<font color=\"red\">系统管理</font>', '<font color=\"red\">资源管理-添加</font>', '0', '<font color=\"red\">执行方法异常:-->cn.ifxcode.bbs.exception.BbsException: 日志记录异常</font>', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : [I@5668c064; request : org.apache.catalina.connector.RequestFacade@772f118d; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 01:05:03');
INSERT INTO `system_log` VALUES ('10', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [20]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 01:13:10');
INSERT INTO `system_log` VALUES ('11', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [20]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 01:13:10');
INSERT INTO `system_log` VALUES ('12', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/sysmanage/user/search; sign : admin:sys:user:search; pid : 2; icon : fa-search; type : 2; sort : 1; status : 0; roles : [I@cfac44a; request : org.apache.catalina.connector.RequestFacade@236cdcee; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 01:13:10');
INSERT INTO `system_log` VALUES ('13', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [21]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 17:54:50');
INSERT INTO `system_log` VALUES ('14', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [21]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 17:54:50');
INSERT INTO `system_log` VALUES ('15', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 授权; link : /system/admin/sysmanage/role/authorize; sign : admin:sys:role:authorize; pid : 3; icon : fa-key; type : 2; sort : 1; status : 0; roles : [I@622b87e8; request : org.apache.catalina.connector.RequestFacade@17e7c2b2; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 17:54:51');
INSERT INTO `system_log` VALUES ('16', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [22]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 19:17:00');
INSERT INTO `system_log` VALUES ('17', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [22]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 19:17:00');
INSERT INTO `system_log` VALUES ('18', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 添加; link : /system/admin/sysmanage/role/add; sign : admin:sys:role:add; pid : 3; icon : fa-plus; type : 2; sort : 2; status : 0; roles : [I@16cfeccc; request : org.apache.catalina.connector.RequestFacade@2cc350c7; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 19:17:00');
INSERT INTO `system_log` VALUES ('19', '系统管理', '角色管理-添加', '1', '执行成功!', '{name : 论坛管理; desc : 主要负责帖子，评论等等部分权限; color : #FF9900; type : 1; status : 0; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 20:15:19');
INSERT INTO `system_log` VALUES ('20', '系统管理', '角色管理-添加', '1', '执行成功!', '{name : 论坛管理; desc : 主要负责帖子，评论等等部分权限; color : #FF9900; type : 1; status : 0; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-06 20:19:30');
INSERT INTO `system_log` VALUES ('21', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [23]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:28:14');
INSERT INTO `system_log` VALUES ('22', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [23]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:28:14');
INSERT INTO `system_log` VALUES ('23', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [23]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:28:14');
INSERT INTO `system_log` VALUES ('24', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 签到历史; link : /system/admin/log/sign; sign : admin:log:sign; pid : 14; icon : fa-check-square-o; type : 1; sort : 3; status : 0; roles : [I@6e5db398; request : org.apache.catalina.connector.RequestFacade@49b9f8c3; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:28:14');
INSERT INTO `system_log` VALUES ('25', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [24]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:34:37');
INSERT INTO `system_log` VALUES ('26', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [24]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:34:37');
INSERT INTO `system_log` VALUES ('27', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [24]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:34:37');
INSERT INTO `system_log` VALUES ('28', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 经验历史; link : /system/admin/log/experience; sign : admin:log:experience; pid : 14; icon : fa-bitbucket-square; type : 1; sort : 4; status : 0; roles : [I@600f1abf; request : org.apache.catalina.connector.RequestFacade@7fa522dd; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:34:37');
INSERT INTO `system_log` VALUES ('29', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [25]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:35:37');
INSERT INTO `system_log` VALUES ('30', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [25]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:35:37');
INSERT INTO `system_log` VALUES ('31', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [25]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:35:37');
INSERT INTO `system_log` VALUES ('32', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 金币历史; link : /system/admin/log/gold; sign : admin:log:gold; pid : 14; icon : fa-bitbucket; type : 1; sort : 5; status : 0; roles : [I@73232d54; request : org.apache.catalina.connector.RequestFacade@a7520da; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:35:38');
INSERT INTO `system_log` VALUES ('33', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [26]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:41:17');
INSERT INTO `system_log` VALUES ('34', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [26]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:41:17');
INSERT INTO `system_log` VALUES ('35', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [26]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:41:17');
INSERT INTO `system_log` VALUES ('36', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 导航版块; link : /system/admin/navboard; sign : admin:nb; pid : 0; icon : fa-bars; type : 0; sort : 1; status : 0; roles : [I@28d96190; request : org.apache.catalina.connector.RequestFacade@579449e3; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:41:17');
INSERT INTO `system_log` VALUES ('37', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [27]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:56:58');
INSERT INTO `system_log` VALUES ('38', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [27]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:57:08');
INSERT INTO `system_log` VALUES ('39', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [27]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:57:22');
INSERT INTO `system_log` VALUES ('40', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 导航管理; link : system/admin/navboard/navigation; sign : admin:nb:nav; pid : 26; icon : fa-chain; type : 1; sort : 1; status : 0; roles : [I@a5c10e7; request : org.apache.catalina.connector.RequestFacade@5d2c1366; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-07 17:58:55');
INSERT INTO `system_log` VALUES ('41', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [28]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 18:34:04');
INSERT INTO `system_log` VALUES ('42', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [28]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 18:34:04');
INSERT INTO `system_log` VALUES ('43', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [28]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 18:34:04');
INSERT INTO `system_log` VALUES ('44', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 版块管理; link : /system/admin/navboard/board; sign : admin:nb:board; pid : 26; icon : fa-puzzle-piece; type : 1; sort : 2; status : 0; roles : [I@279fbb40; request : org.apache.catalina.connector.RequestFacade@67be7b12; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 18:34:04');
INSERT INTO `system_log` VALUES ('45', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [29]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:49:24');
INSERT INTO `system_log` VALUES ('46', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [29]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:49:24');
INSERT INTO `system_log` VALUES ('47', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [29]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:49:24');
INSERT INTO `system_log` VALUES ('48', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查看详情; link : /system/admin/log/sign/detail; sign : admin:log:sign:detail; pid : 23; icon : fa-external-link; type : 2; sort : 1; status : 0; roles : [I@689a01c0; request : org.apache.catalina.connector.RequestFacade@56e919e6; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:49:24');
INSERT INTO `system_log` VALUES ('49', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [30]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:50:39');
INSERT INTO `system_log` VALUES ('50', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [30]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:50:39');
INSERT INTO `system_log` VALUES ('51', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [30]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:50:39');
INSERT INTO `system_log` VALUES ('52', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查找; link : /system/admin/log/sign/detail/search; sign : admin:log:sign:detail:search; pid : 29; icon : fa-search; type : 2; sort : 1; status : 0; roles : [I@1632e918; request : org.apache.catalina.connector.RequestFacade@6865320a; }', '1279', 'tonboy', '127.0.0.1', '2016-12-08 21:50:39');
INSERT INTO `system_log` VALUES ('53', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [31]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 20:57:26');
INSERT INTO `system_log` VALUES ('54', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [31]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 20:57:26');
INSERT INTO `system_log` VALUES ('55', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [31]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 20:57:26');
INSERT INTO `system_log` VALUES ('56', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查看详情; link : /system/admin/log/gold/detail; sign : admin:log:gold:detail; pid : 25; icon : fa-puzzle-piece; type : 2; sort : 1; status : 0; roles : [I@72cdf017; request : org.apache.catalina.connector.RequestFacade@2e4db0e3; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 20:57:26');
INSERT INTO `system_log` VALUES ('57', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [32]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 21:49:16');
INSERT INTO `system_log` VALUES ('58', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [32]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 21:49:16');
INSERT INTO `system_log` VALUES ('59', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [32]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 21:49:16');
INSERT INTO `system_log` VALUES ('60', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 查看详情; link : /system/admin/log/experience/detail; sign : admin:log:experience:detail; pid : 24; icon : fa-external-link; type : 2; sort : 1; status : 0; roles : [I@47408485; request : org.apache.catalina.connector.RequestFacade@5cbc5c4e; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 21:49:16');
INSERT INTO `system_log` VALUES ('61', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [33]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 22:01:42');
INSERT INTO `system_log` VALUES ('62', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [33]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 22:01:42');
INSERT INTO `system_log` VALUES ('63', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [33]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 22:01:42');
INSERT INTO `system_log` VALUES ('64', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 分类管理; link : /system/admin/navboard/classify; sign : admin:nb:classify; pid : 26; icon : fa-bookmark; type : 1; sort : 3; status : 0; roles : [I@3109d75f; request : org.apache.catalina.connector.RequestFacade@7d1ab71f; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-10 22:01:42');
INSERT INTO `system_log` VALUES ('65', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [34]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:20:03');
INSERT INTO `system_log` VALUES ('66', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [34]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:20:03');
INSERT INTO `system_log` VALUES ('67', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [34]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:20:03');
INSERT INTO `system_log` VALUES ('68', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 帖子管理; link : /system/admin/topicmanage; sign : admin:topic; pid : 0; icon : fa-tasks; type : 0; sort : 5; status : 0; roles : [I@363f6349; request : org.apache.catalina.connector.RequestFacade@7b8f6971; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:20:03');
INSERT INTO `system_log` VALUES ('69', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [35]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:21:20');
INSERT INTO `system_log` VALUES ('70', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [35]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:21:20');
INSERT INTO `system_log` VALUES ('71', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [35]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:21:20');
INSERT INTO `system_log` VALUES ('72', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 评论管理; link : /system/admin/replymanage; sign : admin:reply; pid : 0; icon : fa-comments-o; type : 0; sort : 6; status : 0; roles : [I@4d90fced; request : org.apache.catalina.connector.RequestFacade@69cd5363; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:21:20');
INSERT INTO `system_log` VALUES ('73', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [36]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:23:20');
INSERT INTO `system_log` VALUES ('74', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [36]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:23:20');
INSERT INTO `system_log` VALUES ('75', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [36]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:23:20');
INSERT INTO `system_log` VALUES ('76', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 上传资源; link : /system/admin/upload; sign : admin:up; pid : 0; icon : fa-upload; type : 0; sort : 7; status : 0; roles : [I@7324b1b5; request : org.apache.catalina.connector.RequestFacade@6e0f1d21; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:23:20');
INSERT INTO `system_log` VALUES ('77', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [37]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:24:33');
INSERT INTO `system_log` VALUES ('78', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [37]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:24:33');
INSERT INTO `system_log` VALUES ('79', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [37]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:24:33');
INSERT INTO `system_log` VALUES ('80', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 图片管理; link : /system/admin/upload/image; sign : admin:up:image; pid : 36; icon : fa-picture-o; type : 1; sort : 1; status : 0; roles : [I@507c4808; request : org.apache.catalina.connector.RequestFacade@f5d2e80; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:24:33');
INSERT INTO `system_log` VALUES ('81', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [38]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:26:22');
INSERT INTO `system_log` VALUES ('82', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [38]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:26:22');
INSERT INTO `system_log` VALUES ('83', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [38]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:26:22');
INSERT INTO `system_log` VALUES ('84', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 附件管理; link : /system/admin/upload/file; sign : admin:up:file; pid : 36; icon : fa-paperclip; type : 1; sort : 2; status : 0; roles : [I@12b97ab1; request : org.apache.catalina.connector.RequestFacade@69cd5363; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:26:22');
INSERT INTO `system_log` VALUES ('85', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [39]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:28:33');
INSERT INTO `system_log` VALUES ('86', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [39]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:28:33');
INSERT INTO `system_log` VALUES ('87', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 任务调度; link : /system/admin/quartz; sign : admin:quartz; pid : 0; icon : fa-clock-o; type : 0; sort : 8; status : 0; roles : [I@25ef9ab3; request : org.apache.catalina.connector.RequestFacade@f5d2e80; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:28:33');
INSERT INTO `system_log` VALUES ('88', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [40]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:32:32');
INSERT INTO `system_log` VALUES ('89', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 系统备份; link : /system/admin/backup; sign : admin:back; pid : 0; icon : fa-suitcase; type : 0; sort : 9; status : 0; roles : [I@2f16052d; request : org.apache.catalina.connector.RequestFacade@4eade581; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:32:32');
INSERT INTO `system_log` VALUES ('90', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [41]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:34:09');
INSERT INTO `system_log` VALUES ('91', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [41]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:34:09');
INSERT INTO `system_log` VALUES ('92', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 系统配置; link : /system/admin/config; sign : admin:config; pid : 0; icon : fa-cogs; type : 0; sort : 10; status : 0; roles : [I@66eed946; request : org.apache.catalina.connector.RequestFacade@4afab775; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:34:09');
INSERT INTO `system_log` VALUES ('93', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [42]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:35:32');
INSERT INTO `system_log` VALUES ('94', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 系统监控; link : /system/admin/monitor; sign : admin:monitor; pid : 0; icon : fa-bug; type : 0; sort : 11; status : 0; roles : [I@1e30a83e; request : org.apache.catalina.connector.RequestFacade@4eade581; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:35:32');
INSERT INTO `system_log` VALUES ('95', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [43]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:36:21');
INSERT INTO `system_log` VALUES ('96', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [43]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:36:21');
INSERT INTO `system_log` VALUES ('97', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 统计图表; link : /system/admin/chart; sign : admin:chart; pid : 0; icon : fa-bar-chart-o; type : 0; sort : 12; status : 0; roles : [I@1fbc2f77; request : org.apache.catalina.connector.RequestFacade@6e0f1d21; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:36:21');
INSERT INTO `system_log` VALUES ('98', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [44]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:38:12');
INSERT INTO `system_log` VALUES ('99', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [44]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:38:12');
INSERT INTO `system_log` VALUES ('100', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 6; resIds : [44]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:38:12');
INSERT INTO `system_log` VALUES ('101', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 个人信息; link : /system/admin/self; sign : admin:self; pid : 0; icon : fa-user; type : 0; sort : 13; status : 0; roles : [I@6e0b3de2; request : org.apache.catalina.connector.RequestFacade@240bf8df; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-11 01:38:12');
INSERT INTO `system_log` VALUES ('102', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [45]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:46:06');
INSERT INTO `system_log` VALUES ('103', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [45]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:46:06');
INSERT INTO `system_log` VALUES ('104', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 系统设置; link : /system/admin/config/setting; sign : admin:config:set; pid : 41; icon : fa-gear; type : 1; sort : 1; status : 0; roles : [I@7897bda5; request : org.apache.catalina.connector.RequestFacade@3223d97d; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:46:06');
INSERT INTO `system_log` VALUES ('105', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 1; resIds : [46]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:50:00');
INSERT INTO `system_log` VALUES ('106', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId : 2; resIds : [46]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:50:00');
INSERT INTO `system_log` VALUES ('107', '系统管理', '资源管理-添加', '1', '执行成功!', '{name : 消息中心; link : /system/admin/message; sign : admin:msg; pid : 0; icon : fa-comment-o; type : 0; sort : 7; status : 0; roles : [I@779822a7; request : org.apache.catalina.connector.RequestFacade@250b3f48; }', '1279', 'tonboy', '127.0.0.1', '2016-12-12 21:50:00');
INSERT INTO `system_log` VALUES ('108', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[47]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 20:54:51');
INSERT INTO `system_log` VALUES ('109', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[47]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 20:54:51');
INSERT INTO `system_log` VALUES ('110', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:查找; link:/system/admin/log/login/search; sign:admin:log:login:search; pid:15; icon:fa-search; type:2; sort:1; status:0; roles:[1, 2]; request:org.apache.catalina.connector.RequestFacade@513a0fdc}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 20:54:51');
INSERT INTO `system_log` VALUES ('111', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[48]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 21:02:48');
INSERT INTO `system_log` VALUES ('112', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[48]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 21:02:48');
INSERT INTO `system_log` VALUES ('113', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[48]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 21:02:48');
INSERT INTO `system_log` VALUES ('114', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:查找; link:/system/admin/upload/image/search; sign:admin:up:image:search; pid:37; icon:fa-search; type:2; sort:1; status:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-15 21:02:48');
INSERT INTO `system_log` VALUES ('115', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[49]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 20:31:52');
INSERT INTO `system_log` VALUES ('116', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[49]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 20:31:52');
INSERT INTO `system_log` VALUES ('117', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[49]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 20:31:52');
INSERT INTO `system_log` VALUES ('118', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:评论列表; link:/system/admin/replymanage/reply; sign:admin:reply:reply; pid:35; icon:fa-pagelines; type:1; sort:1; status:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 20:31:52');
INSERT INTO `system_log` VALUES ('119', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[50]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:07:26');
INSERT INTO `system_log` VALUES ('120', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:添加; link:/system/admin/backup/add; sign:admin:back:add; pid:40; icon:fa-plus; type:2; sort:1; status:0; roles:[1]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:07:26');
INSERT INTO `system_log` VALUES ('121', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:15:37');
INSERT INTO `system_log` VALUES ('122', '系統备份', '添加', '1', '执行成功!', '{name:Java技术社区; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:17:02');
INSERT INTO `system_log` VALUES ('123', '系統备份', '添加', '1', '执行成功!', '{name:啦啦啦; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:29:39');
INSERT INTO `system_log` VALUES ('124', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[51]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:33:43');
INSERT INTO `system_log` VALUES ('125', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[51]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:33:43');
INSERT INTO `system_log` VALUES ('126', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:任务列表; link:/system/admin/quartz/list; sign:admin:quartz:list; pid:39; icon:fa-list; type:1; sort:1; status:0; roles:[1, 2]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:33:44');
INSERT INTO `system_log` VALUES ('127', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[52]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:36:08');
INSERT INTO `system_log` VALUES ('128', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[52]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:36:08');
INSERT INTO `system_log` VALUES ('129', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:任务历史; link:/system/admin/quartz/history; sign:admin:quartz:history; pid:39; icon:fa-hdd-o; type:1; sort:2; status:0; roles:[1, 2]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-16 23:36:08');
INSERT INTO `system_log` VALUES ('130', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:14');
INSERT INTO `system_log` VALUES ('131', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:20');
INSERT INTO `system_log` VALUES ('132', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:26');
INSERT INTO `system_log` VALUES ('133', '系統备份', '添加', '1', '执行成功!', '{name: rfdgezy; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:38');
INSERT INTO `system_log` VALUES ('134', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:47');
INSERT INTO `system_log` VALUES ('135', '系統备份', '添加', '1', '执行成功!', '{name:znsssssssssssssssssssssstgd; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 12:59:58');
INSERT INTO `system_log` VALUES ('136', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 13:00:38');
INSERT INTO `system_log` VALUES ('137', '系統备份', '添加', '1', '执行成功!', '{name:垃圾12306; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-17 13:00:59');
INSERT INTO `system_log` VALUES ('138', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[53]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 20:41:29');
INSERT INTO `system_log` VALUES ('139', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[53]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 20:41:29');
INSERT INTO `system_log` VALUES ('140', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[53]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 20:41:29');
INSERT INTO `system_log` VALUES ('141', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:待审核; link:/system/admin/replymanage/audit; sign:admin:reply:audit; pid:35; icon:fa-ban; type:1; sort:2; status:0; roles:[2, 6]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-19 20:41:29');
INSERT INTO `system_log` VALUES ('142', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[54]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 22:20:35');
INSERT INTO `system_log` VALUES ('143', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[54]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 22:20:35');
INSERT INTO `system_log` VALUES ('144', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[54]}', '1279', 'tonboy', '127.0.0.1', '2016-12-19 22:20:35');
INSERT INTO `system_log` VALUES ('145', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:回收站; link:/system/admin/replymanage/trash; sign:admin:reply:trash; pid:35; icon:fa-trash-o; type:1; sort:3; status:0; roles:[2, 6]; }', '1279', 'tonboy', '127.0.0.1', '2016-12-19 22:20:35');
INSERT INTO `system_log` VALUES ('146', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-19 23:17:06');
INSERT INTO `system_log` VALUES ('147', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[55]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-20 22:10:45');
INSERT INTO `system_log` VALUES ('148', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:SQL监控; link:/system/auth/druid; sign:admin:druid; pid:42; icon:fa-code; type:1; sort:1; status:0; way:1; roles:[1]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-20 22:10:46');
INSERT INTO `system_log` VALUES ('149', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:14:47');
INSERT INTO `system_log` VALUES ('150', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[56]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:17:39');
INSERT INTO `system_log` VALUES ('151', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[56]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:17:39');
INSERT INTO `system_log` VALUES ('152', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[56]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:17:39');
INSERT INTO `system_log` VALUES ('153', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:帖子列表; link:/system/admin/topicmanage/topic; sign:admin:topic:topiclist; pid:34; icon:fa-list; type:1; sort:1; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:17:40');
INSERT INTO `system_log` VALUES ('154', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[57]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:20:29');
INSERT INTO `system_log` VALUES ('155', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[57]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:20:29');
INSERT INTO `system_log` VALUES ('156', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[57]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:20:29');
INSERT INTO `system_log` VALUES ('157', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:置顶帖子; link:/system/admin/topicmanage/top; sign:admin:topic:top; pid:34; icon:fa-arrow-up; type:1; sort:2; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:20:29');
INSERT INTO `system_log` VALUES ('158', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[58]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:21:48');
INSERT INTO `system_log` VALUES ('159', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[58]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:21:48');
INSERT INTO `system_log` VALUES ('160', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[58]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:21:48');
INSERT INTO `system_log` VALUES ('161', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:热门加精; link:/system/admin/topicmanage/spec; sign:admin:topic:spec; pid:34; icon:fa-star; type:1; sort:3; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:21:48');
INSERT INTO `system_log` VALUES ('162', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[59]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:22:47');
INSERT INTO `system_log` VALUES ('163', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[59]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:22:47');
INSERT INTO `system_log` VALUES ('164', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[59]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:22:47');
INSERT INTO `system_log` VALUES ('165', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:待审核; link:/system/admin/topicmanage/audit; sign:admin:topic:audit; pid:34; icon:fa-eye-slash; type:1; sort:4; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:22:47');
INSERT INTO `system_log` VALUES ('166', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[60]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:23:47');
INSERT INTO `system_log` VALUES ('167', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[60]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:23:47');
INSERT INTO `system_log` VALUES ('168', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[60]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:23:47');
INSERT INTO `system_log` VALUES ('169', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:回收站; link:/system/admin/topicmanage/trash; sign:admin:topic:trash; pid:34; icon:fa-trash-o; type:1; sort:5; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-21 21:23:47');
INSERT INTO `system_log` VALUES ('170', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[61]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-23 20:43:41');
INSERT INTO `system_log` VALUES ('171', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[61]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-23 20:43:41');
INSERT INTO `system_log` VALUES ('172', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:获取权限树; link:/system/admin/sysmanage/role/tree; sign:admin:sys:role:tree; pid:21; icon:fa-code-fork; type:2; sort:1; status:0; way:0; roles:[1, 2]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-23 20:43:41');
INSERT INTO `system_log` VALUES ('173', '系統备份', '添加', '1', '执行成功!', '{name:ztree; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-23 21:50:08');
INSERT INTO `system_log` VALUES ('174', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[62]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:15:48');
INSERT INTO `system_log` VALUES ('175', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[62]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:15:48');
INSERT INTO `system_log` VALUES ('176', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[62]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:15:48');
INSERT INTO `system_log` VALUES ('177', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:禁言用户; link:/system/admin/sysmanage/nottalk; sign:admin:sys:talk; pid:1; icon:fa-meh-o; type:1; sort:5; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:15:48');
INSERT INTO `system_log` VALUES ('178', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[63]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:19:00');
INSERT INTO `system_log` VALUES ('179', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[63]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:19:00');
INSERT INTO `system_log` VALUES ('180', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:6; resIds:[63]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:19:00');
INSERT INTO `system_log` VALUES ('181', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:已关闭评论; link:/system/admin/topicmanage/closereply; sign:admin:topic:closereply; pid:34; icon:fa-microphone-slash; type:1; sort:6; status:0; way:0; roles:[1, 2, 6]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 16:19:00');
INSERT INTO `system_log` VALUES ('182', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:1; resIds:[64]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 19:58:48');
INSERT INTO `system_log` VALUES ('183', '系统管理', '角色管理-授权', '1', '执行成功!', '{roleId:2; resIds:[64]}', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 19:58:48');
INSERT INTO `system_log` VALUES ('184', '系统管理', '资源管理-添加', '1', '执行成功!', '{name:初始化Lucenes索引; link:/system/admin/config/lucene/init; sign:admin:config:lucene:init; pid:45; icon:fa-sitemap; type:2; sort:1; status:0; way:0; roles:[1, 2]; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-24 19:58:48');
INSERT INTO `system_log` VALUES ('185', '系統备份', '添加', '1', '执行成功!', '{name:; exec:point; }', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-25 16:46:19');
INSERT INTO `system_log` VALUES ('188', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[66]</td></tr></tbody></table>', '1279', 'tonboy', '127.0.0.1', '2016-12-25 21:52:32');
INSERT INTO `system_log` VALUES ('189', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[66]</td></tr></tbody></table>', '1279', 'tonboy', '127.0.0.1', '2016-12-25 21:52:32');
INSERT INTO `system_log` VALUES ('190', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>删除</td></tr><tr><td>link</td><td>/system/admin/sysmanage/role/delete</td></tr><tr><td>sign</td><td>admin:sys:role:delete</td></tr><tr><td>pid</td><td>3</td></tr><tr><td>icon</td><td>fa-trash-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[2]</td></tr></tbody></table>', '1279', 'tonboy', '127.0.0.1', '2016-12-25 21:52:32');
INSERT INTO `system_log` VALUES ('191', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>exec</td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-26 20:28:04');
INSERT INTO `system_log` VALUES ('192', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[67]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 21:16:45');
INSERT INTO `system_log` VALUES ('193', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>系统监控</td></tr><tr><td>link</td><td>/monitoring</td></tr><tr><td>sign</td><td>admin:monitoring</td></tr><tr><td>pid</td><td>42</td></tr><tr><td>icon</td><td>fa-exclamation-triangle</td></tr><tr><td>type</td><td>1</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>1</td></tr><tr><td>roles</td><td>[1]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 21:16:45');
INSERT INTO `system_log` VALUES ('194', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[68]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 21:30:11');
INSERT INTO `system_log` VALUES ('195', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/sysmanage/admin/search</td></tr><tr><td>sign</td><td>admin:sys:admin:search</td></tr><tr><td>pid</td><td>17</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 21:30:11');
INSERT INTO `system_log` VALUES ('196', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td></td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-28 21:48:10');
INSERT INTO `system_log` VALUES ('197', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>quartz</td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-29 21:26:19');
INSERT INTO `system_log` VALUES ('198', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[69]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 21:16:50');
INSERT INTO `system_log` VALUES ('199', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[69]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 21:16:50');
INSERT INTO `system_log` VALUES ('200', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>图表数据</td></tr><tr><td>link</td><td>/system/admin/chart/data</td></tr><tr><td>sign</td><td>admin:chart:Data</td></tr><tr><td>pid</td><td>43</td></tr><tr><td>icon</td><td>fa-bar-chart-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 21:16:50');
INSERT INTO `system_log` VALUES ('201', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td></td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 21:48:01');
INSERT INTO `system_log` VALUES ('202', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>chart</td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2016-12-30 22:26:56');
INSERT INTO `system_log` VALUES ('203', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[70]</td></tr></tbody></table>', '1279', 'tonboy', '0:0:0:0:0:0:0:1', '2016-12-31 15:03:36');
INSERT INTO `system_log` VALUES ('204', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[70]</td></tr></tbody></table>', '1279', 'tonboy', '0:0:0:0:0:0:0:1', '2016-12-31 15:03:36');
INSERT INTO `system_log` VALUES ('205', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>立即执行</td></tr><tr><td>link</td><td>/system/admin/quartz/runnow</td></tr><tr><td>sign</td><td>admin:quartz:runnow</td></tr><tr><td>pid</td><td>51</td></tr><tr><td>icon</td><td>fa-play</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[2]</td></tr></tbody></table>', '1279', 'tonboy', '0:0:0:0:0:0:0:1', '2016-12-31 15:03:36');
INSERT INTO `system_log` VALUES ('206', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td></td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 18:54:17');
INSERT INTO `system_log` VALUES ('207', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[71]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 21:42:54');
INSERT INTO `system_log` VALUES ('208', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[71]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 21:42:54');
INSERT INTO `system_log` VALUES ('209', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[71]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 21:42:54');
INSERT INTO `system_log` VALUES ('210', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>添加</td></tr><tr><td>link</td><td>/system/admin/home/image/add</td></tr><tr><td>sign</td><td>admin:home:image:add</td></tr><tr><td>pid</td><td>6</td></tr><tr><td>icon</td><td>fa-plus</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-01 21:42:54');
INSERT INTO `system_log` VALUES ('211', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>Panda</td></tr><tr><td>link</td><td>http://oschina.net/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 17:34:08');
INSERT INTO `system_log` VALUES ('212', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>Panda</td></tr><tr><td>link</td><td>http://oschina.net/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 17:38:58');
INSERT INTO `system_log` VALUES ('213', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>Panda</td></tr><tr><td>link</td><td>http://oschina.net/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 17:41:43');
INSERT INTO `system_log` VALUES ('214', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[72]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:02:14');
INSERT INTO `system_log` VALUES ('215', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[72]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:02:14');
INSERT INTO `system_log` VALUES ('216', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[72]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:02:14');
INSERT INTO `system_log` VALUES ('217', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>添加</td></tr><tr><td>link</td><td>/system/admin/home/quick/add</td></tr><tr><td>sign</td><td>admin:home:quick:add</td></tr><tr><td>pid</td><td>7</td></tr><tr><td>icon</td><td>fa-plus</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:02:14');
INSERT INTO `system_log` VALUES ('218', '首页管理', '快速导航-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>快速导航</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>7</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:26:07');
INSERT INTO `system_log` VALUES ('219', '首页管理', '快速导航-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>凑个整数</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>8</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:26:39');
INSERT INTO `system_log` VALUES ('220', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[73]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:53:39');
INSERT INTO `system_log` VALUES ('221', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[73]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:53:39');
INSERT INTO `system_log` VALUES ('222', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[73]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:53:39');
INSERT INTO `system_log` VALUES ('223', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>添加</td></tr><tr><td>link</td><td>/system/admin/home/recommend/add</td></tr><tr><td>sign</td><td>admin:home:recommend:add</td></tr><tr><td>pid</td><td>8</td></tr><tr><td>icon</td><td>fa-plus</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:53:39');
INSERT INTO `system_log` VALUES ('224', '首页管理', '首页推荐-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>qWAESRTYUPUYTWRYERTIYU</td></tr><tr><td>link</td><td>http://localhost:8080/bbs/board/204/topic/detail/1248</td></tr><tr><td>location</td><td>0</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>-1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 18:56:07');
INSERT INTO `system_log` VALUES ('225', '首页管理', '首页推荐-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>erstdyuiop[ldrtfgyuhijokp</td></tr><tr><td>link</td><td>http://localhost:8080/bbs/board/199/topic/detail/1257</td></tr><tr><td>location</td><td>0</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>-1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 19:06:04');
INSERT INTO `system_log` VALUES ('226', '首页管理', '首页推荐-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>JAVA SE</td></tr><tr><td>link</td><td>http://localhost:8080/bbs/navigation/47/board/191</td></tr><tr><td>location</td><td>0</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>-1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 20:21:56');
INSERT INTO `system_log` VALUES ('227', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[74]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 20:55:56');
INSERT INTO `system_log` VALUES ('228', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[74]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 20:55:56');
INSERT INTO `system_log` VALUES ('229', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[74]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 20:55:56');
INSERT INTO `system_log` VALUES ('230', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>编辑</td></tr><tr><td>link</td><td>/system/admin/home/recommend/update</td></tr><tr><td>sign</td><td>admin:home:recommend:update</td></tr><tr><td>pid</td><td>8</td></tr><tr><td>icon</td><td>fa-edit</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 20:55:56');
INSERT INTO `system_log` VALUES ('231', '首页管理', '首页推荐-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>6</td></tr><tr><td>name</td><td>erstdyuiop[ldrtfgyuhijokp</td></tr><tr><td>link</td><td>http://localhost:8080/bbs/board/199/topic/detail/1257</td></tr><tr><td>location</td><td>1</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-02 21:30:20');
INSERT INTO `system_log` VALUES ('232', '首页管理', '首页推荐-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>临时</td></tr><tr><td>link</td><td>/</td></tr><tr><td>location</td><td>1</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:17:32');
INSERT INTO `system_log` VALUES ('233', '首页管理', '首页推荐-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>linshi2</td></tr><tr><td>link</td><td>/</td></tr><tr><td>location</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:17:57');
INSERT INTO `system_log` VALUES ('234', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[75]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:20:43');
INSERT INTO `system_log` VALUES ('235', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[75]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:20:43');
INSERT INTO `system_log` VALUES ('236', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[75]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:20:43');
INSERT INTO `system_log` VALUES ('237', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>删除</td></tr><tr><td>link</td><td>/system/admin/home/recommend/delete</td></tr><tr><td>sign</td><td>admin:home:recommend:delete</td></tr><tr><td>pid</td><td>8</td></tr><tr><td>icon</td><td>fa-trash-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:20:43');
INSERT INTO `system_log` VALUES ('238', '首页管理', '首页推荐-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>8,9</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:21:03');
INSERT INTO `system_log` VALUES ('239', '首页管理', '首页推荐-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>8,9</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:21:56');
INSERT INTO `system_log` VALUES ('240', '首页管理', '首页推荐-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>8,9</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:24:56');
INSERT INTO `system_log` VALUES ('241', '首页管理', '首页推荐-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>临时</td></tr><tr><td>link</td><td>/</td></tr><tr><td>location</td><td>1</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:29:04');
INSERT INTO `system_log` VALUES ('242', '首页管理', '首页推荐-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>临时</td></tr><tr><td>link</td><td>/</td></tr><tr><td>location</td><td>1</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:29:38');
INSERT INTO `system_log` VALUES ('243', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[76]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:46:20');
INSERT INTO `system_log` VALUES ('244', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[76]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:46:20');
INSERT INTO `system_log` VALUES ('245', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[76]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:46:20');
INSERT INTO `system_log` VALUES ('246', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>修改</td></tr><tr><td>link</td><td>/system/admin/home/quick/update</td></tr><tr><td>sign</td><td>admin:home:quick:update</td></tr><tr><td>pid</td><td>7</td></tr><tr><td>icon</td><td>fa-edit</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 20:46:20');
INSERT INTO `system_log` VALUES ('247', '首页管理', '快速导航-修改', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>凑个整数</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>8</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:01:46');
INSERT INTO `system_log` VALUES ('248', '首页管理', '快速导航-修改', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>凑个整数</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>8</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:01:48');
INSERT INTO `system_log` VALUES ('249', '首页管理', '快速导航-修改', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>凑个整数</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>8</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:02:22');
INSERT INTO `system_log` VALUES ('250', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[77]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:11:44');
INSERT INTO `system_log` VALUES ('251', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[77]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:11:44');
INSERT INTO `system_log` VALUES ('252', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[77]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:11:44');
INSERT INTO `system_log` VALUES ('253', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>删除</td></tr><tr><td>link</td><td>/system/admin/home/quick/delete</td></tr><tr><td>sign</td><td>admin:home:quick:delete</td></tr><tr><td>pid</td><td>7</td></tr><tr><td>icon</td><td>fa-trash-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:11:45');
INSERT INTO `system_log` VALUES ('254', '首页管理', '快速导航-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>8,7</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:12:00');
INSERT INTO `system_log` VALUES ('255', '首页管理', '快速导航-修改', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>8</td></tr><tr><td>name</td><td>凑个整数</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>8</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:12:23');
INSERT INTO `system_log` VALUES ('256', '首页管理', '快速导航-修改', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>7</td></tr><tr><td>name</td><td>快速导航</td></tr><tr><td>link</td><td>/</td></tr><tr><td>color</td><td>#2b2b2b</td></tr><tr><td>sort</td><td>7</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:12:31');
INSERT INTO `system_log` VALUES ('257', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[78]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:42:52');
INSERT INTO `system_log` VALUES ('258', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[78]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:42:52');
INSERT INTO `system_log` VALUES ('259', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[78]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:42:52');
INSERT INTO `system_log` VALUES ('260', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>编辑</td></tr><tr><td>link</td><td>/system/admin/home/image/update</td></tr><tr><td>sign</td><td>admin:home:image:update</td></tr><tr><td>pid</td><td>6</td></tr><tr><td>icon</td><td>fa-edit</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:42:52');
INSERT INTO `system_log` VALUES ('261', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:45:45');
INSERT INTO `system_log` VALUES ('262', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:46:14');
INSERT INTO `system_log` VALUES ('263', '首页管理', '轮播图链-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:54:24');
INSERT INTO `system_log` VALUES ('264', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>5</td></tr><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:55:29');
INSERT INTO `system_log` VALUES ('265', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>4</td></tr><tr><td>title</td><td>Panda</td></tr><tr><td>link</td><td>http://oschina.net/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:55:53');
INSERT INTO `system_log` VALUES ('266', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>5</td></tr><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 21:56:02');
INSERT INTO `system_log` VALUES ('267', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>4</td></tr><tr><td>title</td><td>Panda</td></tr><tr><td>link</td><td>http://oschina.net/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/662e90113e6b4063817084483d9d241c1483349630848.png</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:02:10');
INSERT INTO `system_log` VALUES ('268', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>6</td></tr><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:02:19');
INSERT INTO `system_log` VALUES ('269', '首页管理', '轮播图链-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>7</td></tr><tr><td>title</td><td>tower</td></tr><tr><td>link</td><td>/</td></tr><tr><td>url</td><td>http://ofrjra54d.bkt.clouddn.com/7d7af858b62247cea2711346b6d95f3b1483451138473.jpg</td></tr><tr><td>sort</td><td>5</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:02:29');
INSERT INTO `system_log` VALUES ('270', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[79]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:03:47');
INSERT INTO `system_log` VALUES ('271', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[79]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:03:47');
INSERT INTO `system_log` VALUES ('272', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[79]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:03:47');
INSERT INTO `system_log` VALUES ('273', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>删除</td></tr><tr><td>link</td><td>/system/admin/home/image/delete</td></tr><tr><td>sign</td><td>admin:home:image:delete</td></tr><tr><td>pid</td><td>6</td></tr><tr><td>icon</td><td>fa-trash-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:03:48');
INSERT INTO `system_log` VALUES ('274', '首页管理', '轮播图链-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>4,6,7</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-03 22:04:29');
INSERT INTO `system_log` VALUES ('275', '系統备份', '添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>shenmegui</td></tr><tr><td>exec</td><td>point</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 21:26:07');
INSERT INTO `system_log` VALUES ('276', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[80]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 23:31:24');
INSERT INTO `system_log` VALUES ('277', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[80]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 23:31:24');
INSERT INTO `system_log` VALUES ('278', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[80]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 23:31:24');
INSERT INTO `system_log` VALUES ('279', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/home/recommend/search</td></tr><tr><td>sign</td><td>admin:home:recommend:search</td></tr><tr><td>pid</td><td>8</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-04 23:31:24');
INSERT INTO `system_log` VALUES ('280', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[81]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 19:45:32');
INSERT INTO `system_log` VALUES ('281', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[81]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 19:45:32');
INSERT INTO `system_log` VALUES ('282', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/operation/search</td></tr><tr><td>sign</td><td>admin:log:operation:search</td></tr><tr><td>pid</td><td>16</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 19:45:32');
INSERT INTO `system_log` VALUES ('283', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[82]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:17:19');
INSERT INTO `system_log` VALUES ('284', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[82]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:17:19');
INSERT INTO `system_log` VALUES ('285', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[82]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:17:19');
INSERT INTO `system_log` VALUES ('286', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/sign/search</td></tr><tr><td>sign</td><td>admin:log:sign:search</td></tr><tr><td>pid</td><td>23</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:17:20');
INSERT INTO `system_log` VALUES ('287', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[83]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:18:02');
INSERT INTO `system_log` VALUES ('288', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[83]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:18:02');
INSERT INTO `system_log` VALUES ('289', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[83]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:18:02');
INSERT INTO `system_log` VALUES ('290', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/gold/search</td></tr><tr><td>sign</td><td>admin:log:gold:search</td></tr><tr><td>pid</td><td>25</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:18:02');
INSERT INTO `system_log` VALUES ('291', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[84]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:19:31');
INSERT INTO `system_log` VALUES ('292', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[84]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:19:31');
INSERT INTO `system_log` VALUES ('293', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[84]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:19:31');
INSERT INTO `system_log` VALUES ('294', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/experience/search</td></tr><tr><td>sign</td><td>admin:log:experience:search</td></tr><tr><td>pid</td><td>24</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:19:31');
INSERT INTO `system_log` VALUES ('295', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[85]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:41:20');
INSERT INTO `system_log` VALUES ('296', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[85]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:41:20');
INSERT INTO `system_log` VALUES ('297', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[85]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:41:20');
INSERT INTO `system_log` VALUES ('298', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/gold/detail/search</td></tr><tr><td>sign</td><td>admin:log:gold:detail:search</td></tr><tr><td>pid</td><td>31</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:41:20');
INSERT INTO `system_log` VALUES ('299', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[86]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:42:10');
INSERT INTO `system_log` VALUES ('300', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[86]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:42:10');
INSERT INTO `system_log` VALUES ('301', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[86]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:42:10');
INSERT INTO `system_log` VALUES ('302', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/log/experience/detail/search</td></tr><tr><td>sign</td><td>admin:log:experience:detail:search</td></tr><tr><td>pid</td><td>32</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:42:10');
INSERT INTO `system_log` VALUES ('303', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[87]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:59:28');
INSERT INTO `system_log` VALUES ('304', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[87]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:59:28');
INSERT INTO `system_log` VALUES ('305', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[87]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:59:28');
INSERT INTO `system_log` VALUES ('306', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>查找</td></tr><tr><td>link</td><td>/system/admin/navboard/navigation/search</td></tr><tr><td>sign</td><td>admin:nb:nav:search</td></tr><tr><td>pid</td><td>27</td></tr><tr><td>icon</td><td>fa-search</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>1</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 20:59:28');
INSERT INTO `system_log` VALUES ('307', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[88]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:19:51');
INSERT INTO `system_log` VALUES ('308', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[88]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:19:51');
INSERT INTO `system_log` VALUES ('309', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[88]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:19:51');
INSERT INTO `system_log` VALUES ('310', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>添加</td></tr><tr><td>link</td><td>/system/admin/navboard/navigation/add</td></tr><tr><td>sign</td><td>admin:nb:nav:add</td></tr><tr><td>pid</td><td>27</td></tr><tr><td>icon</td><td>fa-plus</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>2</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:19:52');
INSERT INTO `system_log` VALUES ('311', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[89]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:20:44');
INSERT INTO `system_log` VALUES ('312', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[89]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:20:44');
INSERT INTO `system_log` VALUES ('313', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[89]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:20:44');
INSERT INTO `system_log` VALUES ('314', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>编辑</td></tr><tr><td>link</td><td>/system/admin/navboard/navigation/update</td></tr><tr><td>sign</td><td>admin:nb:nav:update</td></tr><tr><td>pid</td><td>27</td></tr><tr><td>icon</td><td>fa-edit</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>3</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:20:44');
INSERT INTO `system_log` VALUES ('315', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>1</td></tr><tr><td>resIds</td><td>[90]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:50:10');
INSERT INTO `system_log` VALUES ('316', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>2</td></tr><tr><td>resIds</td><td>[90]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:50:10');
INSERT INTO `system_log` VALUES ('317', '系统管理', '角色管理-授权', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>roleId</td><td>6</td></tr><tr><td>resIds</td><td>[90]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:50:10');
INSERT INTO `system_log` VALUES ('318', '系统管理', '资源管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>删除</td></tr><tr><td>link</td><td>/system/admin/navboard/navigation/delete</td></tr><tr><td>sign</td><td>admin:nb:nav:delete</td></tr><tr><td>pid</td><td>27</td></tr><tr><td>icon</td><td>fa-trash-o</td></tr><tr><td>type</td><td>2</td></tr><tr><td>sort</td><td>4</td></tr><tr><td>status</td><td>0</td></tr><tr><td>way</td><td>0</td></tr><tr><td>roles</td><td>[1, 2, 6]</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:50:10');
INSERT INTO `system_log` VALUES ('319', '导航版块', '导航管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>临时测试</td></tr><tr><td>desc</td><td>测试</td></tr><tr><td>sort</td><td>6</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:50:37');
INSERT INTO `system_log` VALUES ('320', '导航版块', '导航管理-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>53</td></tr><tr><td>name</td><td>临时测试</td></tr><tr><td>desc</td><td>测试十多个回复</td></tr><tr><td>sort</td><td>6</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:51:25');
INSERT INTO `system_log` VALUES ('321', '导航版块', '导航管理-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>53</td></tr><tr><td>name</td><td>临时测</td></tr><tr><td>desc</td><td>测试十多个回复</td></tr><tr><td>sort</td><td>6</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:51:35');
INSERT INTO `system_log` VALUES ('322', '导航版块', '导航管理-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>53</td></tr><tr><td>name</td><td>临时测</td></tr><tr><td>desc</td><td>测试十多个回复</td></tr><tr><td>sort</td><td>6</td></tr><tr><td>status</td><td>1</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:51:48');
INSERT INTO `system_log` VALUES ('323', '导航版块', '导航管理-编辑', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>id</td><td>53</td></tr><tr><td>name</td><td>临时测</td></tr><tr><td>desc</td><td>测试十多个回复</td></tr><tr><td>sort</td><td>6</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:57:42');
INSERT INTO `system_log` VALUES ('324', '导航版块', '导航管理-添加', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>name</td><td>临时2</td></tr><tr><td>desc</td><td>sg</td></tr><tr><td>sort</td><td>7</td></tr><tr><td>status</td><td>0</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:58:00');
INSERT INTO `system_log` VALUES ('325', '导航版块', '导航管理-删除', '1', '执行成功!', '<table class=\"table table-bordered\"><tbody><tr><td>ids</td><td>54,53</td></tr></tbody></table>', '1268', 'Smart_咚咚', '127.0.0.1', '2017-01-05 21:58:20');

-- ----------------------------
-- Table structure for user_access
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户登录名',
  `user_nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `user_password` varchar(255) NOT NULL COMMENT '用户密码',
  `user_email` varchar(255) NOT NULL COMMENT '用户邮箱',
  `user_reg_ip` varchar(255) NOT NULL COMMENT '注册IP',
  `user_is_online` int(11) NOT NULL DEFAULT '1' COMMENT '是否在线{0:在线,1:不在线}',
  `user_is_locked` int(11) NOT NULL DEFAULT '0' COMMENT '是否锁定{1:锁定,0:不锁定}',
  `user_is_speak` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁言{1:禁言,0:不禁言}',
  `user_lastest_login_time` datetime DEFAULT NULL,
  `user_lastest_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  `user_create_time` datetime NOT NULL,
  `user_is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '是否是管理员{0:否,1:是}',
  `user_is_board_manager` int(11) NOT NULL DEFAULT '0' COMMENT '是否是版主{0:否,1:是}',
  `user_is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除{0:否,1:是}',
  PRIMARY KEY (`user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_name` (`user_name`),
  KEY `idx_user_nickname` (`user_nickname`),
  KEY `idx_user_email` (`user_email`),
  KEY `idx_user_is_online` (`user_is_online`)
) ENGINE=InnoDB AUTO_INCREMENT=1287 DEFAULT CHARSET=utf8 COMMENT='用户重要信息表';

-- ----------------------------
-- Records of user_access
-- ----------------------------
INSERT INTO `user_access` VALUES ('1268', 'dongbo', 'Smart_咚咚', 'c4ca4238a0b923820dcc509a6f75849b', 'dongbow1@163.com', '127.0.0.1', '0', '0', '0', '2017-01-03 20:18:59', '127.0.0.1', '2016-08-28 21:43:56', '1', '0', '0');
INSERT INTO `user_access` VALUES ('1279', 'tonboy', 'tonboy', 'c4ca4238a0b923820dcc509a6f75849b', 'tonboyw1@163.com', '127.0.0.1', '0', '0', '0', '2017-01-02 21:40:46', '127.0.0.1', '2016-10-01 23:01:06', '1', '0', '0');
INSERT INTO `user_access` VALUES ('1280', 'tonboyw', 'tonboyw', 'c4ca4238a0b923820dcc509a6f75849b', '1172051170@qq.com', '127.0.0.1', '0', '0', '0', '2017-01-02 21:41:00', '127.0.0.1', '2016-10-02 10:56:01', '0', '1', '0');
INSERT INTO `user_access` VALUES ('1285', 'test01', 'test01', 'c4ca4238a0b923820dcc509a6f75849b', 'test01@163.com', '127.0.0.1', '0', '0', '0', '2017-01-02 21:41:16', '127.0.0.1', '2016-10-05 21:32:50', '0', '0', '0');
INSERT INTO `user_access` VALUES ('1286', 'test', 'test', 'c4ca4238a0b923820dcc509a6f75849b', 'test@ifxcode.com', '127.0.0.1', '0', '0', '0', '2017-01-02 21:41:32', '127.0.0.1', '2016-12-29 20:00:44', '0', '0', '0');

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite` (
  `fav_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID，对应user_access表',
  `need_id1` bigint(20) NOT NULL COMMENT '所需id1',
  `need_id2` bigint(20) NOT NULL COMMENT '所需id2',
  `fav_sign` int(11) NOT NULL COMMENT '类型{1：帖子，2：版块}',
  `fav_name` varchar(50) DEFAULT NULL COMMENT '版块名，或者帖子名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `fav_ip` varchar(30) NOT NULL COMMENT '收藏市ip',
  PRIMARY KEY (`fav_id`),
  KEY `idx_fav_userid` (`user_id`),
  KEY `idx_fav_need_id1` (`need_id1`),
  KEY `idx_fav_need_id2` (`need_id2`),
  KEY `idx_fav_sign` (`fav_sign`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of user_favorite
-- ----------------------------
INSERT INTO `user_favorite` VALUES ('4', '1268', '47', '191', '2', 'JAVA SE', '2016-11-09 20:32:09', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('8', '1280', '206', '1236', '1', '报道帖', '2016-11-09 20:42:48', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('9', '1280', '191', '1235', '1', 'this is first topic', '2016-11-09 20:43:32', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('10', '1280', '47', '195', '2', '开源技术', '2016-11-09 20:45:18', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('11', '1268', '191', '1235', '1', 'this is first topic', '2016-11-10 20:39:14', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('13', '1279', '52', '205', '2', '论坛事务', '2016-11-10 21:58:15', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('14', '1279', '51', '202', '2', '随便聊聊', '2016-11-10 21:59:36', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('19', '1279', '205', '1240', '1', '随便测试', '2016-11-12 00:02:04', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('20', '1279', '200', '1244', '1', '随便测试', '2016-11-12 21:07:44', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('21', '1280', '205', '1237', '1', '测试单纯加精', '2016-11-13 02:33:10', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('22', '1280', '52', '205', '2', '论坛事务', '2016-11-13 02:35:55', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('23', '1279', '205', '1242', '1', '随便测试', '2016-11-19 21:11:31', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('33', '1279', '52', '204', '2', '建议反馈', '2016-11-19 22:22:44', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('35', '1268', '52', '206', '2', '版主专区', '2016-11-29 20:27:29', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('36', '1280', '52', '206', '2', '版主专区', '2016-11-30 17:49:21', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('37', '1280', '50', '201', '2', '实用分享', '2016-11-30 18:11:44', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('38', '1285', '52', '204', '2', '建议反馈', '2016-12-01 15:55:35', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('39', '1268', '205', '1238', '1', '随便测试', '2016-12-01 16:09:16', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('40', '1268', '206', '1245', '1', 'erstdyuiop[ldrtfgyuhijokp', '2016-12-01 20:36:17', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('42', '1279', '205', '1252', '1', 'zzuli', '2016-12-21 21:49:14', '127.0.0.1');
INSERT INTO `user_favorite` VALUES ('43', '1280', '52', '204', '2', '建议反馈', '2016-12-24 16:55:28', '127.0.0.1');

-- ----------------------------
-- Table structure for user_forget
-- ----------------------------
DROP TABLE IF EXISTS `user_forget`;
CREATE TABLE `user_forget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `start_time` datetime NOT NULL COMMENT '链接生效时间',
  `end_time` datetime NOT NULL COMMENT '链接失效时间',
  `params` varchar(255) NOT NULL COMMENT '链接',
  PRIMARY KEY (`id`),
  KEY `forget_name` (`username`),
  KEY `gorget_start_time` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户忘记密码表';

-- ----------------------------
-- Records of user_forget
-- ----------------------------
INSERT INTO `user_forget` VALUES ('1', 'dongbo', '2016-11-06 00:05:45', '2016-11-06 00:35:45', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478361945485');
INSERT INTO `user_forget` VALUES ('2', 'dongbo', '2016-11-06 00:21:34', '2016-11-06 00:51:34', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478362894384');
INSERT INTO `user_forget` VALUES ('3', 'dongbo', '2016-11-06 00:25:06', '2016-11-06 00:55:06', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478363106666');
INSERT INTO `user_forget` VALUES ('4', 'dongbo', '2016-11-06 00:29:28', '2016-11-06 00:59:28', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478363368088');
INSERT INTO `user_forget` VALUES ('5', 'dongbo', '2016-11-06 00:41:48', '2016-11-06 01:11:48', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478364108072');
INSERT INTO `user_forget` VALUES ('6', 'dongbo', '2016-11-06 00:46:30', '2016-11-06 01:16:30', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478364390736');
INSERT INTO `user_forget` VALUES ('7', 'dongbo', '2016-11-06 12:34:19', '2016-11-06 13:04:19', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478406859050');
INSERT INTO `user_forget` VALUES ('8', 'dongbo', '2016-11-06 14:34:37', '2016-11-06 15:04:37', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478414077575');
INSERT INTO `user_forget` VALUES ('9', 'dongbo', '2016-11-06 15:20:10', '2016-11-06 15:50:10', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1478416810442');
INSERT INTO `user_forget` VALUES ('10', 'dongbo', '2016-12-09 22:28:54', '2016-12-09 22:58:54', 'http://localhost:8080/bbs/account/password/reset?rd=02de1ac41099ca5ede9d718636488ba6&st=1481293734501');

-- ----------------------------
-- Table structure for user_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_friends`;
CREATE TABLE `user_friends` (
  `friend_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `send_user_id` bigint(20) NOT NULL COMMENT '发送人ID，对应user_access表',
  `send_user_name` varchar(30) NOT NULL COMMENT '发送人名字',
  `rec_user_id` bigint(20) NOT NULL COMMENT '接受人ID，对应user_access表',
  `rec_user_name` varchar(30) NOT NULL COMMENT '接受人名字',
  `friend_status` int(11) NOT NULL COMMENT '类型{1：已发送，2：已通过，3：已拒绝，4：已删除}',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `friend_ip` varchar(30) NOT NULL COMMENT '加好友时ip',
  PRIMARY KEY (`friend_id`),
  KEY `idx_send_user_id` (`send_user_id`),
  KEY `idx_rec_user_id` (`rec_user_id`),
  KEY `idx_friend_status` (`friend_status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户好友表';

-- ----------------------------
-- Records of user_friends
-- ----------------------------
INSERT INTO `user_friends` VALUES ('1', '1280', 'tonboyw', '1268', 'Smart_咚咚', '1', '2016-11-09 21:01:23', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('2', '1280', 'tonboyw', '1268', 'Smart_咚咚', '1', '2016-11-09 21:01:28', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('3', '1280', 'tonboyw', '1279', 'tonboy', '1', '2016-11-09 21:08:41', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('4', '1280', 'tonboyw', '1279', 'tonboy', '1', '2016-11-09 21:08:47', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('5', '1279', 'tonboy', '1268', 'Smart_咚咚', '1', '2016-11-17 20:07:16', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('6', '1279', 'tonboy', '1268', 'Smart_咚咚', '1', '2016-11-17 20:31:08', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('7', '1268', 'Smart_咚咚', '1280', 'tonboyw', '1', '2016-11-22 13:33:06', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('8', '1285', 'test01', '1280', 'tonboyw', '1', '2016-12-01 16:02:07', null, '127.0.0.1');
INSERT INTO `user_friends` VALUES ('9', '1285', 'test01', '1280', 'tonboyw', '1', '2016-12-24 17:13:45', null, '127.0.0.1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,关联user_access表',
  `user_head_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_birth` date DEFAULT NULL COMMENT '用户出生日期',
  `user_sex` int(11) DEFAULT NULL COMMENT '用户性别{0:男,1:女}',
  `user_province` varchar(50) DEFAULT NULL COMMENT '所属省份',
  `user_city` varchar(50) DEFAULT NULL COMMENT '所属城市',
  `user_like` varchar(255) DEFAULT NULL COMMENT '用户爱好',
  `user_sign` varchar(255) DEFAULT NULL COMMENT '用户签名',
  `user_qq` varchar(20) DEFAULT NULL COMMENT '用户qq',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户phone',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1268', 'http://ofrjra54d.bkt.clouddn.com/ca861ab6a1c74be29f8aadf1e459edae1478273901580.jpg', '1994-05-26', '0', '3400', '3401', '', '', null, null);
INSERT INTO `user_info` VALUES ('1279', 'http://ofrjra54d.bkt.clouddn.com/04d3d70e8529492eb63bae21f4a705dc1478274399206.jpg', null, '0', '3400', '3401', null, null, null, null);
INSERT INTO `user_info` VALUES ('1280', 'http://ofrjra54d.bkt.clouddn.com/04d3d70e8529492eb63bae21f4a705dc1478274399206.jpg', null, '2', '3400', '3401', 'Code', '0 or 1', '1024', '');
INSERT INTO `user_info` VALUES ('1285', 'http://ofrjra54d.bkt.clouddn.com/04d3d70e8529492eb63bae21f4a705dc1478274399206.jpg', null, '0', null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('1286', 'http://ofrjra54d.bkt.clouddn.com/04d3d70e8529492eb63bae21f4a705dc1478274399206.jpg', null, '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_privacy
-- ----------------------------
DROP TABLE IF EXISTS `user_privacy`;
CREATE TABLE `user_privacy` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,关联user_access表',
  `base_is_public` int(11) DEFAULT '0' COMMENT '基本信息是否公开{0:公开,1:不公开,2:好友可见}',
  `friend_is_public` int(11) DEFAULT '0' COMMENT '好友是否公开{0:公开,1:不公开,2:好友可见}',
  `is_add_friend` int(11) DEFAULT '0' COMMENT '是否允许被添加好友{0:是,1:否}',
  `topic_is_public` int(11) DEFAULT '0' COMMENT '帖子是否公开{0:公开,1:不公开,2:好友可见}',
  `reply_is_public` int(11) DEFAULT '0' COMMENT '回复是否公开{0:公开,1:不公开,2:好友可见}',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户隐私权限表';

-- ----------------------------
-- Records of user_privacy
-- ----------------------------
INSERT INTO `user_privacy` VALUES ('1268', '0', '0', '0', '0', '0');
INSERT INTO `user_privacy` VALUES ('1279', '1', '0', '0', '2', '0');
INSERT INTO `user_privacy` VALUES ('1280', '0', '0', '0', '0', '0');
INSERT INTO `user_privacy` VALUES ('1285', '0', '0', '1', '0', '0');
INSERT INTO `user_privacy` VALUES ('1286', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,关联user_access表',
  `role_id` int(11) NOT NULL COMMENT '角色ID,关联role表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1268', '1');
INSERT INTO `user_role` VALUES ('2', '1279', '2');
INSERT INTO `user_role` VALUES ('3', '1280', '3');
INSERT INTO `user_role` VALUES ('8', '1285', '4');
INSERT INTO `user_role` VALUES ('9', '1286', '4');

-- ----------------------------
-- Table structure for user_value
-- ----------------------------
DROP TABLE IF EXISTS `user_value`;
CREATE TABLE `user_value` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,关联user_access表',
  `user_experience` bigint(20) NOT NULL DEFAULT '1' COMMENT '经验',
  `today_exp` int(11) DEFAULT NULL COMMENT '今日经验',
  `today_exp_time` datetime DEFAULT NULL COMMENT '今日经验时间',
  `user_gold` bigint(20) NOT NULL DEFAULT '50' COMMENT '金币',
  `today_gold` int(11) DEFAULT NULL COMMENT '今日金币',
  `today_gold_time` datetime DEFAULT NULL COMMENT '今日金币时间',
  `user_topic_count` int(11) DEFAULT '0' COMMENT '主题数量',
  `user_reply_count` int(11) DEFAULT '0' COMMENT '回复数量',
  `user_past_count` int(11) DEFAULT '0' COMMENT '签到总数',
  `user_past_serial_count` int(11) DEFAULT '0' COMMENT '连续签到数量',
  `user_lastest_past_time` datetime DEFAULT NULL COMMENT '最新签到时间',
  `user_friend_count` int(11) DEFAULT '0' COMMENT '用户好友数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户论坛数据表';

-- ----------------------------
-- Records of user_value
-- ----------------------------
INSERT INTO `user_value` VALUES ('1268', '938', '50', '2016-11-20 02:39:59', '6716', '50', '2016-11-20 02:39:59', '17', '38', '52', '17', '2017-01-05 19:49:42', '0');
INSERT INTO `user_value` VALUES ('1279', '70', '50', '2016-11-22 13:30:26', '110', '50', '2016-11-22 13:30:26', '4', '47', '31', '1', '2017-01-02 21:40:50', '0');
INSERT INTO `user_value` VALUES ('1280', '160', '40', '2017-01-02 21:41:02', '706', '40', '2017-01-02 21:41:02', '2', '2', '18', '1', '2017-01-02 21:41:02', '0');
INSERT INTO `user_value` VALUES ('1285', '30', '30', '2017-01-02 21:41:18', '69', '19', '2017-01-02 21:41:18', '1', '4', '13', '1', '2017-01-02 21:41:18', '0');
INSERT INTO `user_value` VALUES ('1286', '9', '9', '2017-01-02 21:42:06', '58', '8', '2017-01-02 21:42:06', '1', '2', '2', '1', '2017-01-02 21:41:34', '0');
