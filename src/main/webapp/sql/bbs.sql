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
-- Table structure for bbs_home_image
-- ----------------------------
DROP TABLE IF EXISTS `bbs_home_image`;
CREATE TABLE `bbs_home_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `home_title` varchar(255) NOT NULL COMMENT '图片对应标题',
  `home_link` varchar(255) NOT NULL COMMENT '图片对应链接',
  `home_img_link` varchar(255) NOT NULL COMMENT '图片存储的url',
  `turn_way` int(11) NOT NULL COMMENT '跳转类型{0：当前窗口，1：新窗口}',
  `home_sort` int(11) NOT NULL COMMENT '图片排序',
  `home_status` int(11) NOT NULL DEFAULT '0' COMMENT '图片状态{0:正常，1：已删除}',
  `home_create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='首页滚动图表';

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='论坛导航栏表';

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='论坛快速导航表';

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='社区推荐表';

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
  `del_reason` varchar(1000) DEFAULT NULL COMMENT '删除原因',
  PRIMARY KEY (`reply_id`),
  KEY `idx_reply_user_id` (`user_id`),
  KEY `idx_reply_topic_id` (`topic_id`),
  KEY `idx_reply_board_id` (`board_id`),
  KEY `idx_reply_is_check` (`reply_is_check`),
  KEY `idx_reply_status` (`reply_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3642 DEFAULT CHARSET=utf8 COMMENT='论坛回复表';

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
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8 COMMENT='论坛主题表';

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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='经验历史';

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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='金币历史';

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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='签到历史表';

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='资源表';

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
-- Table structure for role_resources
-- ----------------------------
DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE `role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_id` int(11) NOT NULL COMMENT '角色ID,关联role表',
  `res_id` int(11) NOT NULL COMMENT '资源ID,关联user_resources表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务调度表';

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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='操作历史表';

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
) ENGINE=InnoDB AUTO_INCREMENT=1286 DEFAULT CHARSET=utf8 COMMENT='用户重要信息表';

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
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,关联user_access表',
  `role_id` int(11) NOT NULL COMMENT '角色ID,关联role表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

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
-- Table structure for bbs_count
-- ----------------------------
DROP TABLE IF EXISTS `bbs_count`;
CREATE TABLE `bbs_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `time` VARCHAR(20) NOT NULL COMMENT '日期',
  `topic_count` BIGINT NOT NULL COMMENT '今日帖子数量',
	`reply_count` BIGINT NOT NULL COMMENT '今日回复数量',
	`user_sign_count` BIGINT NOT NULL COMMENT '今日签到数量',
	`newuser_count` BIGINT NOT NULL COMMENT '今日新用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据统计表';

-- ----------------------------
-- Table structure for bad_word
-- ----------------------------
CREATE TABLE `bad_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bad_word` varchar(50) NOT NULL COMMENT '敏感词',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='敏感词';