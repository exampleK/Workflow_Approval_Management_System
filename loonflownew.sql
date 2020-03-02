/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : loonflownew

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 25/02/2020 14:54:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_apptoken
-- ----------------------------
DROP TABLE IF EXISTS `account_apptoken`;
CREATE TABLE `account_apptoken`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `workflow_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_sn_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_apptoken
-- ----------------------------
INSERT INTO `account_apptoken` VALUES (1, 'ops', '8cd585da-3cc6-11e8-9946-784f437daad6', 'admin', '2018-04-10 21:53:29.879742', '2020-02-18 22:11:58.122313', 0, '1,2,3,8', '科技发展中心');

-- ----------------------------
-- Table structure for account_loondept
-- ----------------------------
DROP TABLE IF EXISTS `account_loondept`;
CREATE TABLE `account_loondept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_dept_id` int(11) NOT NULL,
  `leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `approver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loondept
-- ----------------------------
INSERT INTO `account_loondept` VALUES (1, '总部', 0, 'admin', '', '', 'admin', '2018-04-10 16:41:27.370288', '2018-05-09 07:03:50.473161', 0);
INSERT INTO `account_loondept` VALUES (2, '技术部', 1, 'lilei', '', '', 'admin', '2018-04-14 23:37:06.988349', '2018-05-09 06:45:27.315309', 0);
INSERT INTO `account_loondept` VALUES (3, '运维部', 2, 'guiji', '', '', 'admin', '2018-04-14 23:37:23.932202', '2018-05-09 07:03:32.427484', 0);
INSERT INTO `account_loondept` VALUES (4, '支付部', 2, 'zhangsan', 'zhangsan,lisi', '', 'admin', '2018-04-14 23:37:36.703706', '2018-05-09 07:04:53.360398', 0);
INSERT INTO `account_loondept` VALUES (5, '人事部', 1, 'jack', '', '', 'admin', '2018-05-09 07:22:09.520164', '2018-05-09 07:22:09.520195', 0);

-- ----------------------------
-- Table structure for account_loonrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonrole`;
CREATE TABLE `account_loonrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonrole
-- ----------------------------
INSERT INTO `account_loonrole` VALUES (1, 'VPN管理员', '处理VPN申请工单的人员', '', 'admin', '2018-05-09 07:06:02.739092', '2018-05-09 07:06:02.739132', 0);

-- ----------------------------
-- Table structure for account_loonuser
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuser`;
CREATE TABLE `account_loonuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonuser
-- ----------------------------
INSERT INTO `account_loonuser` VALUES (1, 'pbkdf2_sha256$100000$BoQZquZL9sE7$OVm0zb1beQeWkas/IJBgxCkx8fqXlu9S0NamjmibSw0=', '2020-02-15 19:55:34.114507', 'admin', '超级管理员', 'blackholll@163.com', '13888888888', 1, 1, 1, 'admin', '2018-04-10 16:24:50.146642', '2018-05-09 07:02:42.221182', 0);
INSERT INTO `account_loonuser` VALUES (2, '12222222', NULL, 'guiji', '轨迹', 'guiji@163.com', '13888888888', 3, 1, 0, 'admin', '2018-04-14 23:38:18.390197', '2018-05-09 07:00:34.120672', 0);
INSERT INTO `account_loonuser` VALUES (3, '12222222', NULL, 'lilei', '李磊', 'lilei@163.com', '13888888888', 2, 1, 0, 'admin', '2018-04-14 23:42:25.708830', '2018-05-09 07:00:27.999012', 0);
INSERT INTO `account_loonuser` VALUES (4, '12222222', NULL, 'zhangsan', '张三', 'zhangsan@163.com', '13888888888', 4, 1, 0, 'admin', '2018-05-05 22:54:48.910667', '2018-05-09 07:02:27.252209', 0);
INSERT INTO `account_loonuser` VALUES (5, 'pbkdf2_sha256$100000$zGXANjruyXdu$SqwI+v31Cfh8/dtc9Ah4vlCwPYqv2OHEUGxSkrC9HME=', NULL, 'lisi', '李四', 'lisi@163.com', '13888888888', 2, 1, 0, 'admin', '2018-05-09 06:58:59.733893', '2018-05-09 07:02:52.073569', 0);
INSERT INTO `account_loonuser` VALUES (6, 'pbkdf2_sha256$100000$h2IARMdK6uA8$sn4S1ZVqqbVl4ON5M2ZWngX8uZXsw2N/JYNZstMPL54=', NULL, 'wangwu', '王五', 'wangwu@163.com', '13888888888', 3, 1, 0, 'admin', '2018-05-09 07:01:50.403604', '2018-05-09 07:03:03.185105', 0);
INSERT INTO `account_loonuser` VALUES (7, 'pbkdf2_sha256$100000$qbrmZkc8i9x2$/T3sLArvEccA7gGVytuh7qnu0AnhiDWiXI+XXz66auo=', NULL, 'jack', '杰克', 'jack@163.com', '13888888888', 5, 1, 0, 'admin', '2018-05-09 07:22:53.491321', '2018-05-09 07:22:53.491356', 0);

-- ----------------------------
-- Table structure for account_loonuserrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuserrole`;
CREATE TABLE `account_loonuserrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonuserrole
-- ----------------------------
INSERT INTO `account_loonuserrole` VALUES (1, 2, 1, 'admin', '2018-05-09 07:05:32.301883', '2018-05-09 07:05:32.301929', 0);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户角色', 6, 'add_loonuserrole');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户角色', 6, 'change_loonuserrole');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户角色', 6, 'delete_loonuserrole');
INSERT INTO `auth_permission` VALUES (19, 'Can add 角色', 7, 'add_loonrole');
INSERT INTO `auth_permission` VALUES (20, 'Can change 角色', 7, 'change_loonrole');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 角色', 7, 'delete_loonrole');
INSERT INTO `auth_permission` VALUES (22, 'Can add 部门', 8, 'add_loondept');
INSERT INTO `auth_permission` VALUES (23, 'Can change 部门', 8, 'change_loondept');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 部门', 8, 'delete_loondept');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 9, 'add_loonuser');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 9, 'change_loonuser');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 9, 'delete_loonuser');
INSERT INTO `auth_permission` VALUES (28, 'Can add ticket record', 10, 'add_ticketrecord');
INSERT INTO `auth_permission` VALUES (29, 'Can change ticket record', 10, 'change_ticketrecord');
INSERT INTO `auth_permission` VALUES (30, 'Can delete ticket record', 10, 'delete_ticketrecord');
INSERT INTO `auth_permission` VALUES (31, 'Can add ticket state last man', 11, 'add_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (32, 'Can change ticket state last man', 11, 'change_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (33, 'Can delete ticket state last man', 11, 'delete_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (34, 'Can add ticket custom field', 12, 'add_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (35, 'Can change ticket custom field', 12, 'change_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (36, 'Can delete ticket custom field', 12, 'delete_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (37, 'Can add ticket flow log', 13, 'add_ticketflowlog');
INSERT INTO `auth_permission` VALUES (38, 'Can change ticket flow log', 13, 'change_ticketflowlog');
INSERT INTO `auth_permission` VALUES (39, 'Can delete ticket flow log', 13, 'delete_ticketflowlog');
INSERT INTO `auth_permission` VALUES (40, 'Can add custom notice', 14, 'add_customnotice');
INSERT INTO `auth_permission` VALUES (41, 'Can change custom notice', 14, 'change_customnotice');
INSERT INTO `auth_permission` VALUES (42, 'Can delete custom notice', 14, 'delete_customnotice');
INSERT INTO `auth_permission` VALUES (43, 'Can add workflow script', 15, 'add_workflowscript');
INSERT INTO `auth_permission` VALUES (44, 'Can change workflow script', 15, 'change_workflowscript');
INSERT INTO `auth_permission` VALUES (45, 'Can delete workflow script', 15, 'delete_workflowscript');
INSERT INTO `auth_permission` VALUES (46, 'Can add custom field', 16, 'add_customfield');
INSERT INTO `auth_permission` VALUES (47, 'Can change custom field', 16, 'change_customfield');
INSERT INTO `auth_permission` VALUES (48, 'Can delete custom field', 16, 'delete_customfield');
INSERT INTO `auth_permission` VALUES (49, 'Can add state', 17, 'add_state');
INSERT INTO `auth_permission` VALUES (50, 'Can change state', 17, 'change_state');
INSERT INTO `auth_permission` VALUES (51, 'Can delete state', 17, 'delete_state');
INSERT INTO `auth_permission` VALUES (52, 'Can add workflow', 18, 'add_workflow');
INSERT INTO `auth_permission` VALUES (53, 'Can change workflow', 18, 'change_workflow');
INSERT INTO `auth_permission` VALUES (54, 'Can delete workflow', 18, 'delete_workflow');
INSERT INTO `auth_permission` VALUES (55, 'Can add transition', 19, 'add_transition');
INSERT INTO `auth_permission` VALUES (56, 'Can change transition', 19, 'change_transition');
INSERT INTO `auth_permission` VALUES (57, 'Can delete transition', 19, 'delete_transition');
INSERT INTO `auth_permission` VALUES (58, 'Can add 调用token', 20, 'add_apptoken');
INSERT INTO `auth_permission` VALUES (59, 'Can change 调用token', 20, 'change_apptoken');
INSERT INTO `auth_permission` VALUES (60, 'Can delete 调用token', 20, 'delete_apptoken');
INSERT INTO `auth_permission` VALUES (61, 'Can add 业绩总记录表', 21, 'add_year_index');
INSERT INTO `auth_permission` VALUES (62, 'Can change 业绩总记录表', 21, 'change_year_index');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 业绩总记录表', 21, 'delete_year_index');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_loonuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_loonuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_loonuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-04-10 16:41:27.371448', '1', 'LoonDept object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-04-10 16:43:20.412821', '1', 'TicketRecord object (1)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-04-10 16:48:43.820666', '2', 'TicketRecord object (2)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-04-10 17:22:45.041511', '1', 'TicketCustomField object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-04-10 17:39:33.646162', '1', 'TicketFlowLog object (1)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-04-10 21:53:29.880887', '1', 'AppToken object (1)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-04-14 23:37:06.997088', '2', 'LoonDept object (2)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-04-14 23:37:23.932965', '3', 'LoonDept object (3)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-04-14 23:37:36.704502', '4', 'LoonDept object (4)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-04-14 23:38:18.392472', '2', 'guiji', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-04-14 23:42:25.710130', '3', 'hah', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-04-23 20:49:32.232372', '1', 'Workflow object (1)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-04-23 20:53:33.056648', '1', 'State object (1)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-04-23 20:56:25.945319', '1', 'CustomField object (1)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-04-23 20:56:49.875057', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-04-24 06:57:24.740151', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-04-24 06:58:45.040694', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-04-24 07:09:25.924775', '1', 'Transition object (1)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-04-24 07:15:38.015269', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (20, '2018-04-24 07:15:54.951782', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (21, '2018-04-30 15:30:25.653254', '2', 'Transition object (2)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (22, '2018-04-30 15:45:48.978997', '2', 'State object (2)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (23, '2018-04-30 15:46:42.186978', '3', 'State object (3)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (24, '2018-04-30 15:47:58.792301', '4', 'State object (4)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (25, '2018-04-30 15:48:52.379536', '2', 'Transition object (2)', 2, '[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (26, '2018-04-30 15:48:57.049551', '1', 'Transition object (1)', 2, '[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (27, '2018-04-30 15:49:23.452938', '3', 'Transition object (3)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (28, '2018-04-30 15:50:00.971444', '5', 'State object (5)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (29, '2018-04-30 15:51:41.264461', '6', 'State object (6)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (30, '2018-04-30 15:52:16.535041', '1', 'TicketFlowLog object (1)', 2, '[{\"changed\": {\"fields\": [\"participant\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (31, '2018-04-30 15:52:35.306847', '1', 'TicketFlowLog object (1)', 2, '[{\"changed\": {\"fields\": [\"suggestion\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (32, '2018-04-30 15:53:19.306551', '2', 'TicketFlowLog object (2)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (33, '2018-04-30 15:54:32.070531', '4', 'Transition object (4)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (34, '2018-04-30 15:55:00.074263', '5', 'Transition object (5)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (35, '2018-04-30 15:55:32.417133', '3', 'TicketFlowLog object (3)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (36, '2018-04-30 15:56:02.571406', '4', 'TicketFlowLog object (4)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (37, '2018-04-30 15:57:00.143445', '2', 'TicketFlowLog object (2)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (38, '2018-04-30 15:57:14.407122', '3', 'TicketFlowLog object (3)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (39, '2018-04-30 15:57:26.345616', '4', 'TicketFlowLog object (4)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (40, '2018-04-30 16:20:38.479478', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (41, '2018-04-30 16:20:55.076990', '3', 'State object (3)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (42, '2018-04-30 16:21:02.336811', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (43, '2018-04-30 16:21:07.513626', '5', 'State object (5)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (44, '2018-04-30 16:21:13.163688', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (45, '2018-04-30 20:33:11.317176', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (46, '2018-05-02 07:14:18.036032', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (47, '2018-05-02 07:16:34.696279', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (48, '2018-05-02 07:32:09.915224', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (49, '2018-05-02 09:57:24.555618', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (50, '2018-05-05 16:00:25.314396', '1', 'WorkflowScript object (1)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (51, '2018-05-05 16:05:50.756135', '2', 'WorkflowScript object (2)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (52, '2018-05-05 16:29:29.901517', '3', 'WorkflowScript object (3)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (53, '2018-05-05 16:30:43.883607', '4', 'WorkflowScript object (4)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (54, '2018-05-05 16:31:06.336502', '4', 'WorkflowScript object (4)', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (55, '2018-05-05 22:54:48.913998', '4', 'zhangsan', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (56, '2018-05-06 12:32:36.701617', '2', 'Workflow object (2)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (57, '2018-05-08 06:50:35.276119', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (58, '2018-05-08 06:50:47.308245', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"name\", \"description\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (59, '2018-05-08 06:50:56.521305', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"description\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (60, '2018-05-08 21:15:16.433888', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (61, '2018-05-08 21:16:18.128035', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (62, '2018-05-08 21:16:33.106507', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (63, '2018-05-09 06:44:38.400539', '3', '李磊', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (64, '2018-05-09 06:45:12.998421', '2', 'LoonDept object (2)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (65, '2018-05-09 06:45:27.317759', '2', 'LoonDept object (2)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (66, '2018-05-09 06:45:44.025800', '4', 'LoonDept object (4)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (67, '2018-05-09 06:45:57.695441', '1', 'LoonDept object (1)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (68, '2018-05-09 06:46:21.353123', '3', 'lilei', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (69, '2018-05-09 06:46:40.026932', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"alias\", \"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (70, '2018-05-09 06:57:21.399430', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (71, '2018-05-09 06:57:31.480613', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (72, '2018-05-09 06:57:57.104306', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (73, '2018-05-09 06:58:59.737392', '5', 'aaa', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (74, '2018-05-09 06:59:57.018591', '5', 'aaa', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (75, '2018-05-09 07:00:08.256294', '5', 'aaa', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (76, '2018-05-09 07:00:19.792755', '4', 'zhangsan', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (77, '2018-05-09 07:00:28.000474', '3', 'lilei', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (78, '2018-05-09 07:00:34.122113', '2', 'guiji', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (79, '2018-05-09 07:00:39.717494', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (80, '2018-05-09 07:01:10.342386', '5', 'lisi', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (81, '2018-05-09 07:01:50.406258', '6', 'wangwu', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (82, '2018-05-09 07:01:58.901060', '6', 'wangwu', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (83, '2018-05-09 07:02:27.253982', '4', 'zhangsan', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (84, '2018-05-09 07:02:42.222474', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (85, '2018-05-09 07:02:52.076901', '5', 'lisi', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (86, '2018-05-09 07:03:03.188035', '6', 'wangwu', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (87, '2018-05-09 07:03:32.428843', '3', 'LoonDept object (3)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (88, '2018-05-09 07:03:50.474873', '1', 'LoonDept object (1)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (89, '2018-05-09 07:04:53.362885', '4', 'LoonDept object (4)', 2, '[{\"changed\": {\"fields\": [\"approver\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (90, '2018-05-09 07:05:32.302984', '1', 'LoonUserRole object (1)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (91, '2018-05-09 07:06:02.739935', '1', 'LoonRole object (1)', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (92, '2018-05-09 07:10:47.328804', '3', 'Workflow object (3)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (93, '2018-05-09 07:17:18.966435', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"flowchart\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (94, '2018-05-09 07:17:41.651573', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (95, '2018-05-09 07:17:49.336722', '3', 'Workflow object (3)', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (96, '2018-05-09 07:21:40.230215', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (97, '2018-05-09 07:22:09.520970', '5', 'LoonDept object (5)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (98, '2018-05-09 07:22:53.494815', '7', 'jack', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (99, '2018-05-10 07:34:45.309242', '7', 'State object (7)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (100, '2018-05-10 07:37:57.667512', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (101, '2018-05-10 07:41:03.720632', '2', 'CustomField object (2)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (102, '2018-05-10 07:41:13.238769', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (103, '2018-05-10 07:41:56.892036', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (104, '2018-05-11 06:47:36.390140', '8', 'State object (8)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (105, '2018-05-11 06:48:26.948684', '9', 'State object (9)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (106, '2018-05-11 06:50:09.417112', '10', 'State object (10)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (107, '2018-05-11 06:51:02.915599', '11', 'State object (11)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (108, '2018-05-11 06:52:39.803234', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (109, '2018-05-11 06:58:43.399074', '6', 'Transition object (6)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (110, '2018-05-11 07:00:24.371739', '4', 'Transition object (4)', 2, '[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\", \"field_require_check\", \"alert_enable\", \"alert_text\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (111, '2018-05-11 07:00:52.921792', '5', 'Transition object (5)', 2, '[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (112, '2018-05-11 07:01:52.181201', '5', 'State object (5)', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (113, '2018-05-11 07:03:29.352745', '5', 'Transition object (5)', 2, '[{\"changed\": {\"fields\": [\"source_state_id\", \"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (114, '2018-05-11 07:04:14.898117', '6', 'Transition object (6)', 2, '[{\"changed\": {\"fields\": [\"name\", \"workflow_id\", \"source_state_id\", \"destination_state_id\", \"field_require_check\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (115, '2018-05-11 07:06:22.747270', '7', 'Transition object (7)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (116, '2018-05-11 07:07:33.214528', '8', 'Transition object (8)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (117, '2018-05-11 07:08:33.440502', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (118, '2018-05-11 07:10:25.201782', '9', 'State object (9)', 2, '[{\"changed\": {\"fields\": [\"name\", \"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (119, '2018-05-11 07:11:28.673604', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"name\", \"order_id\", \"type_id\", \"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (120, '2018-05-11 07:11:53.077507', '12', 'State object (12)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (121, '2018-05-11 07:12:53.037065', '9', 'Transition object (9)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (122, '2018-05-11 07:13:12.070939', '10', 'Transition object (10)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (123, '2018-05-11 07:13:52.428524', '11', 'Transition object (11)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (124, '2018-05-11 07:16:26.827492', '12', 'Transition object (12)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (125, '2018-05-11 07:16:36.074415', '12', 'Transition object (12)', 2, '[{\"changed\": {\"fields\": [\"field_require_check\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (126, '2018-05-11 07:27:11.605280', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (127, '2018-05-11 07:27:32.716438', '2', 'CustomField object (2)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (128, '2018-05-11 07:28:31.651385', '3', 'CustomField object (3)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (129, '2018-05-11 07:30:01.579803', '3', 'CustomField object (3)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\", \"description\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (130, '2018-05-11 07:31:01.069847', '4', 'CustomField object (4)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (131, '2018-05-11 07:31:11.135481', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (132, '2018-05-11 07:31:19.926090', '2', 'CustomField object (2)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (133, '2018-05-11 07:31:28.837817', '3', 'CustomField object (3)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (134, '2018-05-11 07:31:35.324557', '4', 'CustomField object (4)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (135, '2018-05-11 07:34:29.610951', '5', 'CustomField object (5)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (136, '2018-05-11 07:34:36.494826', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (137, '2018-05-11 07:36:41.886558', '6', 'CustomField object (6)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (138, '2018-05-12 09:30:21.816878', '4', 'WorkflowScript object (4)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (139, '2018-05-12 09:30:21.825379', '3', 'WorkflowScript object (3)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (140, '2018-05-12 09:30:21.828199', '2', 'WorkflowScript object (2)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (141, '2018-05-12 09:30:21.831010', '1', 'WorkflowScript object (1)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (142, '2018-05-12 09:32:41.503701', '5', 'WorkflowScript object (5)', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (143, '2018-05-12 09:39:01.044508', '6', 'TicketFlowLog object (6)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (144, '2018-05-12 09:39:01.048177', '5', 'TicketFlowLog object (5)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (145, '2018-05-12 09:39:01.051358', '4', 'TicketFlowLog object (4)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (146, '2018-05-12 09:39:01.054278', '3', 'TicketFlowLog object (3)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (147, '2018-05-12 09:39:01.057906', '2', 'TicketFlowLog object (2)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (148, '2018-05-12 09:39:01.059693', '1', 'TicketFlowLog object (1)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (149, '2018-05-12 09:39:15.345379', '1', 'TicketCustomField object (1)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (150, '2018-05-12 09:39:40.905715', '2', 'TicketRecord object (2)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (151, '2018-05-12 09:39:40.909196', '1', 'TicketRecord object (1)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (152, '2018-05-12 09:40:48.913446', '4', 'Workflow object (4)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (153, '2018-05-12 09:41:56.334411', '5', 'Workflow object (5)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (154, '2018-05-12 09:43:27.851903', '13', 'State object (13)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (155, '2018-05-12 10:02:31.504686', '7', 'CustomField object (7)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (156, '2018-05-12 10:05:06.484413', '8', 'CustomField object (8)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (157, '2018-05-12 10:52:47.141754', '9', 'CustomField object (9)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (158, '2018-05-12 10:53:14.718498', '10', 'CustomField object (10)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (159, '2018-05-13 11:00:50.505075', '11', 'CustomField object (11)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (160, '2018-05-13 11:01:20.651616', '12', 'CustomField object (12)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (161, '2018-05-13 11:05:48.193472', '14', 'State object (14)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (162, '2018-05-13 11:06:03.751286', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (163, '2018-05-13 11:07:18.514558', '15', 'State object (15)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (164, '2018-05-13 11:07:48.483499', '16', 'State object (16)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (165, '2018-05-13 11:10:36.044615', '17', 'State object (17)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (166, '2018-05-13 11:13:00.583531', '18', 'State object (18)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (167, '2018-05-13 11:13:25.616042', '19', 'State object (19)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (168, '2018-05-13 11:18:07.523093', '20', 'State object (20)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (169, '2018-05-13 11:23:27.199379', '21', 'State object (21)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (170, '2018-05-13 11:24:03.443085', '22', 'State object (22)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (171, '2018-05-13 11:24:26.021075', '23', 'State object (23)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (172, '2018-05-13 11:29:26.863526', '24', 'State object (24)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (173, '2018-05-13 11:29:54.167372', '25', 'State object (25)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (174, '2018-05-13 11:39:31.326527', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (175, '2018-05-13 11:41:39.486386', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (176, '2018-05-13 11:42:11.276418', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (177, '2018-05-13 11:42:18.797194', '2', 'State object (2)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (178, '2018-05-13 11:42:46.037250', '3', 'State object (3)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (179, '2018-05-13 11:42:59.836340', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (180, '2018-05-13 11:45:22.525271', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (181, '2018-05-13 21:52:30.445390', '12', 'TicketRecord object (12)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (182, '2018-05-13 21:52:30.450894', '11', 'TicketRecord object (11)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (183, '2018-05-13 21:52:30.453813', '10', 'TicketRecord object (10)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (184, '2018-05-13 21:52:30.457430', '9', 'TicketRecord object (9)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (185, '2018-05-13 21:52:30.460235', '8', 'TicketRecord object (8)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (186, '2018-05-13 21:52:30.463067', '7', 'TicketRecord object (7)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (187, '2018-05-13 21:52:30.465696', '6', 'TicketRecord object (6)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (188, '2018-05-13 21:52:30.468862', '5', 'TicketRecord object (5)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (189, '2018-05-13 21:52:30.471665', '4', 'TicketRecord object (4)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (190, '2018-05-13 21:52:30.475075', '3', 'TicketRecord object (3)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (191, '2018-05-13 21:52:40.353331', '8', 'TicketFlowLog object (8)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (192, '2018-05-13 21:52:40.357544', '7', 'TicketFlowLog object (7)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (193, '2018-05-13 21:52:51.921703', '13', 'TicketCustomField object (13)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (194, '2018-05-13 21:52:51.925544', '12', 'TicketCustomField object (12)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (195, '2018-05-13 21:52:51.929737', '11', 'TicketCustomField object (11)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (196, '2018-05-13 21:52:51.932684', '10', 'TicketCustomField object (10)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (197, '2018-05-13 21:52:51.937093', '9', 'TicketCustomField object (9)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (198, '2018-05-13 21:52:51.940781', '8', 'TicketCustomField object (8)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (199, '2018-05-13 21:52:51.943562', '7', 'TicketCustomField object (7)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (200, '2018-05-13 21:52:51.946282', '6', 'TicketCustomField object (6)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (201, '2018-05-13 21:52:51.949748', '5', 'TicketCustomField object (5)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (202, '2018-05-13 21:52:51.952655', '4', 'TicketCustomField object (4)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (203, '2018-05-13 21:52:51.955529', '3', 'TicketCustomField object (3)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (204, '2018-05-13 21:52:51.958281', '2', 'TicketCustomField object (2)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (205, '2018-05-13 22:15:33.205999', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"field_choice\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (206, '2018-05-13 22:20:52.916723', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (207, '2018-05-13 22:28:39.393075', '13', 'TicketRecord object (13)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (208, '2018-05-13 22:34:55.809709', '13', 'Transition object (13)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (209, '2018-05-13 22:35:05.023248', '14', 'Transition object (14)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (210, '2018-05-14 06:33:27.477305', '15', 'TicketRecord object (15)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (211, '2018-05-14 06:36:35.583915', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (212, '2018-05-14 06:44:10.386635', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (213, '2018-05-14 06:44:10.686119', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (214, '2018-05-14 06:46:38.351021', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (215, '2018-05-14 06:46:54.963491', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (216, '2018-05-15 07:13:06.602752', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (217, '2018-05-15 07:19:16.050832', '7', 'State object (7)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (218, '2018-05-15 07:37:12.926590', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (219, '2018-05-16 06:57:11.209321', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (220, '2018-05-16 06:58:36.853125', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (221, '2018-05-16 07:01:48.836327', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (222, '2018-05-16 07:03:21.974005', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (223, '2018-05-16 07:04:29.225097', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (224, '2018-05-16 07:31:24.913771', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (225, '2018-05-16 23:20:55.440488', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (226, '2018-05-16 23:23:54.673079', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (227, '2018-05-16 23:24:40.088742', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (228, '2018-05-16 23:33:22.201139', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (229, '2018-05-20 23:22:11.031943', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (230, '2018-05-20 23:22:30.905458', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (231, '2018-05-20 23:23:00.808836', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (232, '2018-05-21 10:57:04.791725', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (233, '2018-05-21 10:57:50.019431', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (234, '2018-05-21 19:27:37.561663', '18', 'TicketRecord object (18)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (235, '2018-05-22 07:25:13.573757', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (236, '2018-05-22 07:26:27.931548', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (237, '2018-05-22 07:26:54.688326', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (238, '2018-05-22 07:40:16.575221', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (239, '2018-05-22 22:06:27.493740', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (240, '2018-05-22 22:06:52.641516', '10', 'State object (10)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (241, '2018-05-22 22:21:51.875014', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (242, '2018-05-23 22:38:57.333718', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (243, '2018-05-23 22:43:46.101026', '6', 'WorkflowScript object (6)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (244, '2018-05-23 22:43:59.732931', '6', 'WorkflowScript object (6)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (245, '2018-05-23 22:54:44.592052', '7', 'WorkflowScript object (7)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (246, '2018-07-14 11:18:48.988543', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (247, '2018-07-14 11:20:59.664393', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (248, '2018-07-14 11:21:15.910947', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (249, '2018-07-14 11:21:35.665414', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (250, '2018-07-14 11:22:19.869553', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (251, '2018-07-14 11:22:58.953273', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (252, '2018-07-14 11:23:11.554199', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (253, '2018-07-14 11:23:28.868062', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (254, '2018-08-26 10:31:43.376813', '1', 'CustomNotice object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (255, '2018-08-26 10:35:47.887114', '2', 'CustomNotice object (2)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (256, '2018-10-21 11:06:57.632666', '13', 'State object (13)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (257, '2018-10-21 11:07:27.696611', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (258, '2018-10-21 11:07:37.599847', '15', 'State object (15)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (259, '2018-10-21 11:07:44.207824', '16', 'State object (16)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (260, '2018-10-21 11:07:51.154185', '17', 'State object (17)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (261, '2018-10-21 11:07:57.144224', '18', 'State object (18)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (262, '2018-10-21 11:08:04.858972', '19', 'State object (19)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (263, '2018-10-21 11:09:00.404020', '3', 'Workflow object (3)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (264, '2018-10-21 11:11:31.706470', '15', 'Transition object (15)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (265, '2018-10-21 11:12:03.734323', '16', 'Transition object (16)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (266, '2018-10-21 11:12:24.520272', '17', 'Transition object (17)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (267, '2018-10-21 11:13:05.940466', '18', 'Transition object (18)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (268, '2018-10-21 11:13:45.169121', '19', 'Transition object (19)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (269, '2018-10-21 11:14:03.426173', '20', 'Transition object (20)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (270, '2018-10-21 20:34:14.264284', '21', 'Transition object (21)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (271, '2018-10-21 20:34:44.151821', '22', 'Transition object (22)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (272, '2018-10-21 20:35:06.483278', '23', 'Transition object (23)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (273, '2018-10-21 20:35:36.766623', '24', 'Transition object (24)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (274, '2018-10-21 20:37:46.197309', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"name\", \"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (275, '2018-10-21 20:38:26.337351', '26', 'State object (26)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (276, '2018-10-21 20:38:52.323989', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (277, '2018-10-21 20:39:30.617278', '25', 'Transition object (25)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (278, '2018-10-21 20:39:54.168411', '26', 'Transition object (26)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (279, '2018-10-21 20:45:04.771748', '13', 'CustomField object (13)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (280, '2018-10-21 20:45:59.294356', '4', 'Workflow object (4)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (281, '2018-10-21 20:47:32.722318', '20', 'State object (20)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (282, '2018-10-21 20:47:44.534654', '21', 'State object (21)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (283, '2018-10-21 20:47:50.981963', '22', 'State object (22)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (284, '2018-10-21 20:47:56.590018', '23', 'State object (23)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (285, '2018-10-21 20:48:02.129252', '24', 'State object (24)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (286, '2018-10-21 20:48:07.833032', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (287, '2018-10-21 20:48:13.986949', '26', 'State object (26)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (288, '2018-10-22 07:10:45.188484', '1', 'AppToken object (1)', 2, '[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (289, '2018-10-22 07:12:32.403714', '1', 'AppToken object (1)', 2, '[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (290, '2018-10-22 07:38:39.230703', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (291, '2018-10-22 08:05:15.577141', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"notices\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (292, '2018-10-22 15:24:45.126953', '4', 'Workflow object (4)', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (293, '2018-10-22 15:24:45.131527', '3', 'Workflow object (3)', 3, '', 18, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (20, 'account', 'apptoken');
INSERT INTO `django_content_type` VALUES (8, 'account', 'loondept');
INSERT INTO `django_content_type` VALUES (7, 'account', 'loonrole');
INSERT INTO `django_content_type` VALUES (9, 'account', 'loonuser');
INSERT INTO `django_content_type` VALUES (6, 'account', 'loonuserrole');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'ticket', 'ticketcustomfield');
INSERT INTO `django_content_type` VALUES (13, 'ticket', 'ticketflowlog');
INSERT INTO `django_content_type` VALUES (10, 'ticket', 'ticketrecord');
INSERT INTO `django_content_type` VALUES (11, 'ticket', 'ticketstatelastman');
INSERT INTO `django_content_type` VALUES (21, 'ticket', 'year_index');
INSERT INTO `django_content_type` VALUES (16, 'workflow', 'customfield');
INSERT INTO `django_content_type` VALUES (14, 'workflow', 'customnotice');
INSERT INTO `django_content_type` VALUES (17, 'workflow', 'state');
INSERT INTO `django_content_type` VALUES (19, 'workflow', 'transition');
INSERT INTO `django_content_type` VALUES (18, 'workflow', 'workflow');
INSERT INTO `django_content_type` VALUES (15, 'workflow', 'workflowscript');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'account', '0001_initial', '2018-04-10 16:23:41.026839');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2018-04-10 16:23:41.088822');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-04-10 16:23:41.202720');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-04-10 16:23:41.215504');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-04-10 16:23:41.316210');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0001_initial', '2018-04-10 16:23:41.492653');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-04-10 16:23:41.536426');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-04-10 16:23:41.555765');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-04-10 16:23:41.579352');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-04-10 16:23:41.616306');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-04-10 16:23:41.620447');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-04-10 16:23:41.643171');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-04-10 16:23:41.663023');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-04-10 16:23:41.679754');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-04-10 16:23:41.711283');
INSERT INTO `django_migrations` VALUES (16, 'ticket', '0001_initial', '2018-04-10 16:23:41.848590');
INSERT INTO `django_migrations` VALUES (17, 'workflow', '0001_initial', '2018-04-10 16:23:41.994564');
INSERT INTO `django_migrations` VALUES (18, 'ticket', '0002_auto_20180410_1749', '2018-04-10 17:49:06.562710');
INSERT INTO `django_migrations` VALUES (19, 'workflow', '0002_auto_20180410_1749', '2018-04-10 17:49:06.690036');
INSERT INTO `django_migrations` VALUES (20, 'account', '0002_apptoken', '2018-04-10 21:53:25.098976');
INSERT INTO `django_migrations` VALUES (21, 'ticket', '0003_ticketrecord_relation', '2018-04-15 17:21:55.494957');
INSERT INTO `django_migrations` VALUES (22, 'ticket', '0004_auto_20180417_2348', '2018-04-17 23:48:22.378917');
INSERT INTO `django_migrations` VALUES (23, 'workflow', '0003_auto_20180417_2348', '2018-04-17 23:48:22.391679');
INSERT INTO `django_migrations` VALUES (24, 'ticket', '0005_auto_20180418_0001', '2018-04-18 00:01:52.296081');
INSERT INTO `django_migrations` VALUES (25, 'workflow', '0004_workflow_view_permission_check', '2018-04-22 15:58:37.766199');
INSERT INTO `django_migrations` VALUES (26, 'workflow', '0005_auto_20180423_2114', '2018-04-23 21:14:51.345960');
INSERT INTO `django_migrations` VALUES (27, 'workflow', '0006_auto_20180423_2116', '2018-04-23 21:17:03.970113');
INSERT INTO `django_migrations` VALUES (28, 'workflow', '0007_auto_20180424_0656', '2018-04-24 06:56:48.399867');
INSERT INTO `django_migrations` VALUES (29, 'workflow', '0008_auto_20180424_0708', '2018-04-24 07:08:53.913939');
INSERT INTO `django_migrations` VALUES (30, 'workflow', '0009_auto_20180430_2129', '2018-04-30 21:29:29.307194');
INSERT INTO `django_migrations` VALUES (31, 'ticket', '0006_auto_20180505_1549', '2018-05-05 15:49:16.131657');
INSERT INTO `django_migrations` VALUES (32, 'workflow', '0010_auto_20180505_1549', '2018-05-05 15:49:16.168741');
INSERT INTO `django_migrations` VALUES (33, 'workflow', '0011_auto_20180509_0709', '2018-05-09 07:09:37.847547');
INSERT INTO `django_migrations` VALUES (34, 'workflow', '0012_auto_20180511_0654', '2018-05-11 06:54:50.920765');
INSERT INTO `django_migrations` VALUES (35, 'ticket', '0007_auto_20180516_0741', '2018-05-16 07:46:02.412425');
INSERT INTO `django_migrations` VALUES (36, 'ticket', '0008_auto_20180516_0743', '2018-05-16 07:46:02.417966');
INSERT INTO `django_migrations` VALUES (37, 'workflow', '0013_auto_20180511_1826', '2018-05-16 07:46:02.420751');
INSERT INTO `django_migrations` VALUES (38, 'workflow', '0014_auto_20180516_0741', '2018-05-16 07:46:02.423199');
INSERT INTO `django_migrations` VALUES (39, 'ticket', '0009_ticketflowlog_intervene_type_id', '2018-05-17 06:36:01.493028');
INSERT INTO `django_migrations` VALUES (40, 'ticket', '0010_ticketcustomfield_multi_username_value', '2018-05-22 06:46:49.124237');
INSERT INTO `django_migrations` VALUES (41, 'workflow', '0015_auto_20180522_0646', '2018-05-22 06:46:49.132266');
INSERT INTO `django_migrations` VALUES (42, 'workflow', '0016_auto_20180620_1709', '2018-07-30 07:21:05.079135');
INSERT INTO `django_migrations` VALUES (43, 'workflow', '0017_auto_20180730_0720', '2018-07-30 07:21:05.193141');
INSERT INTO `django_migrations` VALUES (44, 'ticket', '0011_ticketrecord_script_run_last_result', '2018-08-09 07:32:10.254032');
INSERT INTO `django_migrations` VALUES (45, 'workflow', '0018_auto_20180809_0732', '2018-08-09 07:32:10.374771');
INSERT INTO `django_migrations` VALUES (46, 'ticket', '0012_delete_ticketstatelastman', '2018-08-12 16:58:07.510558');
INSERT INTO `django_migrations` VALUES (47, 'workflow', '0019_state_remember_last_man_enable', '2018-08-12 16:58:07.598511');
INSERT INTO `django_migrations` VALUES (48, 'account', '0003_apptoken_workflow_type_ids', '2018-08-12 17:46:44.688698');
INSERT INTO `django_migrations` VALUES (49, 'account', '0004_auto_20180812_1802', '2018-08-12 18:02:21.165206');
INSERT INTO `django_migrations` VALUES (50, 'workflow', '0020_workflow_limit_expression', '2018-08-24 07:39:19.095010');
INSERT INTO `django_migrations` VALUES (51, 'workflow', '0021_customnotice', '2018-08-26 10:30:18.818854');
INSERT INTO `django_migrations` VALUES (52, 'ticket', '0013_ticketrecord_is_end', '2018-09-26 06:53:40.535144');
INSERT INTO `django_migrations` VALUES (53, 'workflow', '0022_auto_20180926_0653', '2018-09-26 06:53:40.625847');
INSERT INTO `django_migrations` VALUES (54, 'workflow', '0023_auto_20181001_1012', '2018-10-01 10:12:52.255104');
INSERT INTO `django_migrations` VALUES (55, 'account', '0005_apptoken_ticket_sn_prefix', '2018-10-03 17:08:44.632310');
INSERT INTO `django_migrations` VALUES (56, 'ticket', '0014_auto_20181003_1708', '2018-10-03 17:08:44.788212');
INSERT INTO `django_migrations` VALUES (57, 'workflow', '0024_auto_20181003_1708', '2018-10-03 17:08:44.885439');
INSERT INTO `django_migrations` VALUES (58, 'workflow', '0025_transition_condition_expression', '2018-10-06 17:03:26.434330');
INSERT INTO `django_migrations` VALUES (59, 'ticket', '0002_year_index', '2020-02-19 16:45:48.483027');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2p4bd3iu2iz6cakbxn9hamdvqp3fvx7y', 'MWUzZjFjNThjNmM1MmRlMWIzYjY0NDFiODNlODE3MDIzMjQ2NGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-06 15:24:30.402451');
INSERT INTO `django_session` VALUES ('3bvgp1uqozyloos8gugskjbhhebbmz0g', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-11-01 10:12:43.428760');
INSERT INTO `django_session` VALUES ('5pbdmk65gftaedlo8l9h6hd9neccbtjc', 'ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2020-02-28 21:24:05.648804');
INSERT INTO `django_session` VALUES ('fp4zkhd8cgfj6tacff6giqm75wwd4p93', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-20 07:12:12.680740');
INSERT INTO `django_session` VALUES ('fxdc90snam1vje7bpv3wiafwu9pooeyk', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-07-17 07:04:43.733996');
INSERT INTO `django_session` VALUES ('gi4p54ka4u6vww4kpqogolmdquj52wup', 'YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-04-24 21:38:48.844698');
INSERT INTO `django_session` VALUES ('gwwul2nmxqyrdzx1wbej4uj0ahzsdwow', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-10-28 16:07:27.753614');
INSERT INTO `django_session` VALUES ('ikpnzy0jsc0jiede5r6cxhoyagq2payb', 'YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-04-24 21:36:50.610586');
INSERT INTO `django_session` VALUES ('immo7viwmlantgx7ubbwawz7kknhmjgd', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-11-26 17:58:31.816749');
INSERT INTO `django_session` VALUES ('jw2psatj7z4zrur42urk3wluopurpqr1', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-10-21 19:52:52.775319');
INSERT INTO `django_session` VALUES ('l187tcfmtjwn2yvr407elnm51dqmaa0u', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-08-13 07:21:42.060139');
INSERT INTO `django_session` VALUES ('lo8legnunej20ohxp0zegm4r6u22b6zw', 'ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2019-12-01 22:47:58.597505');
INSERT INTO `django_session` VALUES ('newkj3ix9d1dmj3gbbmlpi9wmnrrdrk4', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2020-02-29 19:55:34.117499');
INSERT INTO `django_session` VALUES ('qrugroidqpdoepvimz4mtqrsw8elq3px', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-06-06 09:50:27.154850');
INSERT INTO `django_session` VALUES ('rhy3t0ut1v8ev1bqja8sql9htybr95k7', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-05 07:18:38.000344');
INSERT INTO `django_session` VALUES ('uc120vlnss4jhy3i8kxow00uqbozf6m4', 'ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-05-23 06:56:36.173728');
INSERT INTO `django_session` VALUES ('xg0q3efrgh60a8svbz3qbomctp6eexmq', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-11-28 14:11:13.565280');
INSERT INTO `django_session` VALUES ('yqo3dtnk8pasr19u3qwkgz4bvpv0yg08', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 10:04:09.557125');

-- ----------------------------
-- Table structure for ticket_ticketcustomfield
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketcustomfield`;
CREATE TABLE `ticket_ticketcustomfield`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `field_type_id` int(11) NOT NULL,
  `char_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `int_value` int(11) NOT NULL,
  `float_value` double NOT NULL,
  `bool_value` tinyint(1) NOT NULL,
  `date_value` date NOT NULL,
  `datetime_value` datetime(6) NOT NULL,
  `time_value` time(6) NOT NULL,
  `radio_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checkbox_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `multi_select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `multi_username_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketcustomfield
-- ----------------------------
INSERT INTO `ticket_ticketcustomfield` VALUES (14, '请假类型', 13, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '2', '', '', '', '', 'admin', '2018-05-13 21:53:15.776693', '2018-05-13 21:53:15.776753', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (15, '代理人', 13, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan', 'admin', '2018-05-13 21:53:15.784787', '2018-05-13 21:53:15.784839', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (16, '请假原因及相关附件', 13, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '去喝喜酒', '', 'admin', '2018-05-13 21:53:15.792655', '2018-05-13 21:53:15.792711', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (17, '开始时间', 13, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-04-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.800632', '2018-05-13 21:53:15.800683', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (18, '请假天数(0.5的倍数)', 13, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.809216', '2018-05-13 21:53:15.809266', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (19, '结束时间', 13, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-04-12 18:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.817437', '2018-05-13 21:53:15.817484', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (20, '代理人', 14, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan1', 'admin', '2018-05-13 22:24:41.969926', '2018-05-13 22:24:41.969982', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (21, '请假天数(0.5的倍数)', 14, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:41.978508', '2018-05-13 22:24:41.978600', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (22, '开始时间', 14, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-05-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:41.988270', '2018-05-13 22:24:41.988346', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (23, '请假类型', 14, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '1', '', '', '', '', 'admin', '2018-05-13 22:24:41.997839', '2018-05-13 22:24:41.997891', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (24, '结束时间', 14, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-05-13 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:42.008241', '2018-05-13 22:24:42.008292', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (25, '请假原因及相关附件', 14, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '喝喜酒', '', 'admin', '2018-05-13 22:24:42.016808', '2018-05-13 22:24:42.016898', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (26, '结束时间', 15, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-05-13 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.643297', '2018-05-13 22:28:21.643346', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (27, '请假原因及相关附件', 15, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '喝喜酒', '', 'admin', '2018-05-13 22:28:21.650778', '2018-05-13 22:28:21.650828', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (28, '代理人', 15, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan1', 'admin', '2018-05-13 22:28:21.659327', '2018-05-13 22:28:21.659375', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (29, '请假天数(0.5的倍数)', 15, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.667908', '2018-05-13 22:28:21.667955', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (30, '开始时间', 15, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-05-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.675754', '2018-05-13 22:28:21.675803', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (31, '请假类型', 15, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '1', '', '', '', '', 'admin', '2018-05-13 22:28:21.683366', '2018-05-13 22:28:21.683414', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (32, '结束时间', 16, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-04-12 18:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.690959', '2018-05-13 22:34:12.691033', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (33, '请假原因及相关附件', 16, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '去喝喜酒', '', 'admin', '2018-05-13 22:34:12.701832', '2018-05-13 22:34:12.701889', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (34, '代理人', 16, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan', 'admin', '2018-05-13 22:34:12.711844', '2018-05-13 22:34:12.711905', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (35, '请假天数(0.5的倍数)', 16, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.721909', '2018-05-13 22:34:12.721966', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (36, '开始时间', 16, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-04-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.730191', '2018-05-13 22:34:12.730245', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (37, '请假类型', 16, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '2', '', '', '', '', 'admin', '2018-05-13 22:34:12.741366', '2018-05-13 22:34:12.741426', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (38, '申请原因', 17, 'vpn_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '在家办公', '', 'admin', '2018-05-15 07:16:38.326174', '2018-05-15 07:16:38.326274', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (39, '申请原因', 18, 'vpn_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '在家办公', '', 'admin', '2018-05-15 07:37:28.008199', '2018-05-15 07:37:28.008245', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (40, '请假天数(0.5的倍数)', 19, 'leave_days', 5, '2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.397150', '2018-10-19 00:08:40.397166', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (41, '请假类型', 19, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.402913', '2018-10-19 00:08:40.402928', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (42, '开始时间', 19, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-10-20 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.408762', '2018-10-19 00:08:40.408775', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (43, '请假原因及相关附件', 19, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>teste</p>', '', 'admin', '2018-10-19 00:08:40.413509', '2018-10-19 00:08:40.413529', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (44, '结束时间', 19, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-10-21 18:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.419809', '2018-10-19 00:08:40.419833', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (45, '代理人', 19, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-19 00:08:40.425879', '2018-10-19 00:08:40.425895', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (46, '结束时间', 20, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-10-20 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.367687', '2018-10-19 00:38:41.367703', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (47, '开始时间', 20, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-10-19 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.372330', '2018-10-19 00:38:41.372352', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (48, '代理人', 20, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-19 00:38:41.376402', '2018-10-19 00:38:41.376417', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (49, '请假天数(0.5的倍数)', 20, 'leave_days', 5, '2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.379313', '2018-10-19 00:38:41.379327', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (50, '请假类型', 20, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.383436', '2018-10-19 00:38:41.383450', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (51, '请假原因及相关附件', 20, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>dfsf</p>', '', 'admin', '2018-10-19 00:38:41.387250', '2018-10-19 00:38:41.387266', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (52, '项目标识', 21, 'project_code', 5, 'prj001', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-21 11:14:37.680365', '2018-10-21 11:14:37.680400', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (53, '项目开发人员', 21, 'project_devs', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-21 11:14:37.686541', '2018-10-21 11:14:37.686575', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (54, '项目测试人员', 21, 'project_qas', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-21 11:14:37.692349', '2018-10-21 11:14:37.692382', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (55, '请假原因及相关附件', 22, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>ddd</p>', '', 'admin', '2018-10-22 07:12:16.466886', '2018-10-22 07:12:16.466914', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (56, '请假天数(0.5的倍数)', 22, 'leave_days', 5, '1', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.472163', '2018-10-22 07:12:16.472181', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (57, '请假类型', 22, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.477751', '2018-10-22 07:12:16.477769', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (58, '开始时间', 22, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-10-22 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.481785', '2018-10-22 07:12:16.481810', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (59, '代理人', 22, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-22 07:12:16.485136', '2018-10-22 07:12:16.485153', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (60, '结束时间', 22, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-10-23 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.489084', '2018-10-22 07:12:16.489109', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (61, '请假原因及相关附件', 23, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>te</p>', '', 'admin', '2018-10-22 08:05:37.200981', '2018-10-22 08:05:37.201000', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (62, '请假天数(0.5的倍数)', 23, 'leave_days', 5, '2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.204565', '2018-10-22 08:05:37.204582', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (63, '请假类型', 23, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.207974', '2018-10-22 08:05:37.207991', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (64, '开始时间', 23, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-10-22 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.212592', '2018-10-22 08:05:37.212654', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (65, '代理人', 23, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-22 08:05:37.217232', '2018-10-22 08:05:37.217251', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (66, '结束时间', 23, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-10-24 12:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.221150', '2018-10-22 08:05:37.221170', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (67, '开始时间', 21, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2020-02-21 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-14 21:43:45.903489', '2020-02-14 21:43:45.903489', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (68, '结束时间', 21, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2020-02-22 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-14 21:43:45.908478', '2020-02-14 21:43:45.908478', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (69, '请假天数(0.5的倍数)', 21, 'leave_days', 5, '2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-14 21:43:45.913464', '2020-02-14 21:43:45.913464', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (70, '代理人', 21, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'david', '', '2020-02-14 21:43:45.917452', '2020-02-14 21:43:45.917452', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (71, '请假类型', 21, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '1', '', '', '', '', '', '', '2020-02-14 21:43:45.921442', '2020-02-14 21:43:45.921442', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (72, '请假原因及相关附件', 21, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>123</p>', '', '', '2020-02-14 21:43:45.926429', '2020-02-14 21:43:45.926429', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (73, '申请类型', 85, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '1', '', '', '', '', '', '', '2020-02-15 19:36:51.593655', '2020-02-15 19:36:51.593655', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (74, '申请材料', 85, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>1212</p>', '', '', '2020-02-15 19:36:51.601951', '2020-02-15 19:36:51.601951', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (75, '申请类型', 86, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', '', '2020-02-15 19:37:49.896718', '2020-02-15 19:37:49.897716', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (76, '申请材料', 86, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p><img class=\"loadingclass\" id=\"loading_k6nj188w\" src=\"/static/ueditor/themes/default/images/spacer.gif\" title=\"正在上传...\"/></p>', '', '', '2020-02-15 19:37:49.906692', '2020-02-15 19:37:49.906692', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (77, '申请类型', 87, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', '', '2020-02-15 19:40:56.527835', '2020-02-15 19:40:56.527835', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (78, '申请材料', 87, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>33<img src=\"/media/upload\\202002\\捕获1581766841176.png\" title=\"source_file_tile\" alt=\"捕获.png\" width=\"263\" height=\"160\"/></p>', '', '', '2020-02-15 19:40:56.532822', '2020-02-15 19:40:56.532822', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (79, '申请类型', 88, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', '', '2020-02-15 19:43:21.730510', '2020-02-15 19:43:21.730510', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (80, '申请材料', 88, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p><img src=\"/media/upload\\202002\\test1581766973751.PNG\" title=\"source_file_tile\" alt=\"test.PNG\" width=\"242\" height=\"258\"/></p><p>这是我的合同书，请领导审批</p>', '', '', '2020-02-15 19:43:21.736515', '2020-02-15 19:43:21.736515', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (81, '申请类型', 89, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', '', '2020-02-15 19:45:26.635690', '2020-02-15 19:45:26.635690', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (82, '申请材料', 89, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>相关资料在附件，请领导查阅！！！</p><p style=\"line-height: 16px;\"><img src=\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/media/upload\\202002\\121581767123326.rar\" title=\"12.rar\">12.rar</a></p><p><br/></p>', '', '', '2020-02-15 19:45:26.641674', '2020-02-15 19:45:26.641674', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (83, 'ceshi', 90, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '1', '', '', '', '', '', '', '2020-02-15 19:59:44.191364', '2020-02-15 19:59:44.191364', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (84, 'ceshi', 91, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-15 20:02:11.588302', '2020-02-15 20:02:11.588302', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (85, '申请类型', 92, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '创新项目', '', '', '', '', '', '', '2020-02-15 20:07:44.178168', '2020-02-15 20:07:44.178168', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (86, '申请材料', 92, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p><img src=\"/media/upload\\202002\\test1581768410195.PNG\" title=\"source_file_tile\" alt=\"test.PNG\" width=\"200\" height=\"174\"/></p><p>相关资料附件可查看</p><p style=\"line-height: 16px;\"><img src=\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/media/upload\\202002\\121581768461562.rar\" title=\"12.rar\">12.rar</a></p><p><br/></p>', '', '', '2020-02-15 20:07:44.186145', '2020-02-15 20:07:44.186145', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (87, 'ceshi', 93, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 20:40:34.231363', '2020-02-18 20:40:34.232359', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (88, 'ceshi', 94, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 20:46:01.893324', '2020-02-18 20:46:01.893324', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (89, 'ceshi', 95, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 20:47:47.390732', '2020-02-18 20:47:47.390732', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (90, 'ceshi', 96, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:36:12.500497', '2020-02-18 21:36:12.500497', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (91, 'ceshi', 97, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:40:09.921928', '2020-02-18 21:40:09.921928', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (92, 'ceshi', 98, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:46:40.734483', '2020-02-18 21:46:40.734483', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (93, 'ceshi', 99, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:46:40.735480', '2020-02-18 21:46:40.735480', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (94, 'ceshi', 102, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:46:40.743460', '2020-02-18 21:46:40.743460', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (95, 'ceshi', 100, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '美国', '', '', '', '', '', '', '2020-02-18 21:46:40.753432', '2020-02-18 21:46:40.753432', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (96, 'ceshi', 101, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:46:40.758420', '2020-02-18 21:46:40.758420', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (97, 'ceshi', 103, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '美国', '', '', '', '', '', '', '2020-02-18 21:47:06.358727', '2020-02-18 21:47:06.358727', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (98, 'ceshi', 104, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:50:09.066526', '2020-02-18 21:50:09.066526', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (99, 'ceshi', 105, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:54:04.349413', '2020-02-18 21:54:04.349413', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (100, 'ceshi', 106, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:54:38.814754', '2020-02-18 21:54:38.814754', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (101, 'ceshi', 107, 'test_text', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '中国', '', '', '', '', '', '', '2020-02-18 21:57:14.516608', '2020-02-18 21:57:14.516608', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (102, '申请类型', 130, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '创新项目', '', '', '', '', '', '', '2020-02-22 15:53:12.944109', '2020-02-22 15:53:12.944109', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (103, '申请积分', 130, 'jf_', 15, '', 0, 1.2, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-22 15:53:12.949094', '2020-02-22 15:53:12.949094', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (104, '申请材料', 130, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p style=\"line-height: 16px;\"><img src=\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/media/upload\\202002\\总结1582357981696.rar\" title=\"总结.rar\">总结.rar</a></p><p>请领导审阅<br/></p>', '', '', '2020-02-22 15:53:12.955078', '2020-02-22 15:53:12.955078', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (105, '申请类型', 131, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '创新项目', '', '', '', '', '', '', '2020-02-22 15:54:13.656238', '2020-02-22 15:54:13.656238', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (106, '申请积分', 131, 'jf_', 15, '', 0, 0.2, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-22 15:54:13.662222', '2020-02-22 15:54:13.662222', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (107, '申请材料', 131, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>ceshi</p><p><img src=\"/media/upload\\202002\\test1582358043592.PNG\" title=\"source_file_tile\" alt=\"test.PNG\" width=\"281\" height=\"340\"/></p>', '', '', '2020-02-22 15:54:13.669203', '2020-02-22 15:54:13.669203', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (108, '申请类型', 132, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '创新项目', '', '', '', '', '', '', '2020-02-22 16:32:49.669939', '2020-02-22 16:32:49.669939', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (109, '申请积分', 132, 'jf_', 15, '', 0, 1.2, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-22 16:32:49.674927', '2020-02-22 16:32:49.674927', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (110, '申请材料', 132, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>22</p>', '', '', '2020-02-22 16:32:49.679914', '2020-02-22 16:32:49.679914', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (111, '申请类型', 133, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '创新项目', '', '', '', '', '', '', '2020-02-22 17:58:04.531321', '2020-02-22 17:58:04.531321', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (112, '申请积分', 133, 'jf_', 15, '', 0, 1.2, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-22 17:58:04.537305', '2020-02-22 17:58:04.537305', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (113, '申请材料', 133, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>test</p>', '', '', '2020-02-22 17:58:04.542291', '2020-02-22 17:58:04.542291', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (114, '申请类型', 134, 'leixing_', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '出差', '', '', '', '', '', '', '2020-02-25 14:48:27.827598', '2020-02-25 14:48:27.827598', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (115, '申请材料', 134, 'wenben_', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>12</p>', '', '', '2020-02-25 14:48:27.846205', '2020-02-25 14:48:27.846205', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (116, '申请积分', 134, 'jf_', 15, '', 0, 1.99, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2020-02-25 14:48:27.859626', '2020-02-25 14:48:27.859626', 0, '');

-- ----------------------------
-- Table structure for ticket_ticketflowlog
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketflowlog`;
CREATE TABLE `ticket_ticketflowlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `transition_id` int(11) NOT NULL,
  `suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `ticket_data` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `intervene_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketflowlog
-- ----------------------------
INSERT INTO `ticket_ticketflowlog` VALUES (9, 13, 1, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 21:53:15.820550', '2018-05-13 21:53:15.820610', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (10, 14, 2, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:24:42.021711', '2018-05-13 22:24:42.021792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (11, 15, 2, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:28:21.686709', '2018-05-13 22:28:21.686769', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (12, 16, 1, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:34:12.744844', '2018-05-13 22:34:12.744912', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (13, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 22:59:06.743524', '2018-05-13 22:59:06.743634', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (14, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:00:44.421329', '2018-05-13 23:00:44.421396', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (15, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:04:40.758014', '2018-05-13 23:04:40.758125', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (16, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:07:21.279315', '2018-05-13 23:07:21.280068', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (17, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:10:19.742789', '2018-05-13 23:10:19.742861', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (18, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:52:21.760281', '2018-05-13 23:52:21.760339', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (19, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:01:54.824910', '2018-05-14 00:01:54.824974', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (20, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:02:45.942264', '2018-05-14 00:02:45.942325', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (21, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:12:18.293208', '2018-05-14 00:12:18.293269', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (22, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:15:43.074352', '2018-05-14 00:15:43.074635', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (23, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:21:56.019252', '2018-05-14 00:21:56.019666', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (24, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:24:11.381536', '2018-05-14 00:24:11.381609', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (25, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:55:24.437483', '2018-05-14 06:55:24.437546', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (26, 15, 0, '转交工单', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:56:26.664730', '2018-05-14 06:56:26.664802', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (27, 15, 0, '转交工单', 1, 'zhangsan', 2, '', 'zhangsan', '2018-05-14 06:56:52.101637', '2018-05-14 06:56:52.101705', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (28, 15, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:59:33.505946', '2018-05-14 06:59:33.506019', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (29, 15, 13, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 07:00:03.655105', '2018-05-14 07:00:03.655196', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (30, 15, 0, '强制修改工单状态', 1, 'lilei', 3, '', 'admin', '2018-05-14 07:07:39.586383', '2018-05-14 07:07:39.586456', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (31, 14, 0, '加签工单', 1, 'lilei', 2, '', 'lilei', '2018-05-15 06:46:11.225083', '2018-05-15 06:46:11.225146', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (32, 17, 7, '', 1, 'lilei', 6, '', 'admin', '2018-05-15 07:16:38.332521', '2018-05-15 07:16:38.332680', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (33, 17, 8, '同意申请', 1, 'lilei', 7, '', 'lilei', '2018-05-15 07:20:40.816765', '2018-05-15 07:20:40.816925', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (34, 18, 7, '', 1, 'lilei', 6, '', 'admin', '2018-05-15 07:37:28.012487', '2018-05-15 07:37:28.012548', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (35, 18, 8, '同意申请', 1, 'lilei', 7, '', 'lilei', '2018-05-15 07:37:37.111956', '2018-05-15 07:37:37.112027', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (36, 17, 0, '接单处理', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:42:00.998562', '2018-05-16 06:42:00.998625', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (37, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:49:55.948811', '2018-05-16 06:49:55.948905', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (38, 17, 0, '接单处理', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:57:31.802266', '2018-05-16 06:57:31.802360', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (39, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:57:36.347563', '2018-05-16 06:57:36.347634', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (40, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:58:41.660593', '2018-05-16 06:58:41.660701', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (41, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:01:53.888622', '2018-05-16 07:01:53.888689', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (42, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:01:54.040851', '2018-05-16 07:01:54.041150', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (43, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:03:34.673960', '2018-05-16 07:03:34.674037', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (44, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:03:34.846610', '2018-05-16 07:03:34.847216', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (45, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:04:45.745455', '2018-05-16 07:04:45.745521', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (46, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:04:45.955902', '2018-05-16 07:04:45.956166', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (47, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:31:29.378033', '2018-05-16 07:31:29.378090', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (48, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:31:29.552179', '2018-05-16 07:31:29.552446', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (49, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:21:00.251306', '2018-05-16 23:21:00.251363', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (50, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:21:00.578354', '2018-05-16 23:21:00.578555', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (51, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:24:03.606092', '2018-05-16 23:24:03.606156', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (52, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:24:03.779136', '2018-05-16 23:24:03.779504', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (53, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:24:44.286319', '2018-05-16 23:24:44.286429', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (54, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:24:44.338829', '2018-05-16 23:24:44.339101', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (55, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:33:26.619543', '2018-05-16 23:33:26.619613', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (56, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:33:26.803850', '2018-05-16 23:33:26.804073', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (57, 17, 0, '请处理', 1, 'lilei', 10, '', 'lilei', '2018-05-17 06:45:58.830078', '2018-05-17 06:45:58.830167', 0, 1);
INSERT INTO `ticket_ticketflowlog` VALUES (58, 17, 0, '请协助处理', 1, 'zhangsan', 10, '', 'zhangsan', '2018-05-17 06:47:46.380983', '2018-05-17 06:47:46.381055', 0, 2);
INSERT INTO `ticket_ticketflowlog` VALUES (59, 19, 1, '', 1, 'admin', 1, '{\"leave_days\": \"2\", \"leave_proxy\": \"admin\", \"title\": \"testt\", \"in_add_node\": false, \"is_deleted\": false, \"gmt_modified\": \"2018-10-19 00:08:40.380672\", \"add_node_man\": \"\", \"sn\": \"loonflow_201810190001\", \"leave_type\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\", \"parent_ticket_id\": 0, \"leave_reason\": \"<p>teste</p>\", \"leave_start\": \"2018-10-20 09:00:00\", \"participant_type_id\": 1, \"state_id\": 3, \"workflow_id\": 1, \"parent_ticket_state_id\": 0, \"relation\": \"admin\", \"participant\": \"admin\", \"leave_end\": \"2018-10-21 18:00:00\", \"creator\": \"admin\"}', 'admin', '2018-10-19 00:08:40.466104', '2018-10-19 00:08:40.466128', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (60, 20, 1, '', 1, 'admin', 1, '{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"admin\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:41.359283\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 3, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}', 'admin', '2018-10-19 00:38:41.428448', '2018-10-19 00:38:41.428473', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (61, 20, 3, 'fdsfsf', 1, 'admin', 3, '{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"jack\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:53.872124\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"jack,admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 4, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}', 'admin', '2018-10-19 00:38:53.942394', '2018-10-19 00:38:53.942431', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (62, 21, 15, '', 1, 'admin', 13, '{\"gmt_modified\": \"2018-10-21 11:14:37.663604\", \"gmt_created\": \"2018-10-21 11:14:37.656067\", \"creator\": \"admin\", \"parent_ticket_state_id\": 0, \"participant\": \"loonrobot\", \"workflow_id\": 3, \"parent_ticket_id\": 0, \"in_add_node\": false, \"project_qas\": \"admin\", \"participant_type_id\": 1, \"relation\": \"loonrobot,admin\", \"project_devs\": \"admin\", \"state_id\": 14, \"is_deleted\": false, \"sn\": \"loonflow_201810210001\", \"add_node_man\": \"\", \"title\": \"\", \"project_code\": \"prj001\"}', 'admin', '2018-10-21 11:14:37.775029', '2018-10-21 11:14:37.775227', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (63, 19, 5, '111', 1, 'jack', 4, '{\"leave_end\": \"2018-10-21 18:00:00\", \"parent_ticket_state_id\": 0, \"participant_type_id\": 0, \"title\": \"testt\", \"sn\": \"loonflow_201810190001\", \"leave_reason\": \"<p>teste</p>\", \"gmt_modified\": \"2018-10-21 20:06:57.527067\", \"participant\": \"\", \"parent_ticket_id\": 0, \"workflow_id\": 1, \"relation\": \"jack,admin\", \"is_deleted\": false, \"creator\": \"admin\", \"leave_type\": \"2\", \"add_node_man\": \"\", \"leave_start\": \"2018-10-20 09:00:00\", \"in_add_node\": false, \"state_id\": 5, \"leave_proxy\": \"admin\", \"leave_days\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\"}', 'jack', '2018-10-21 20:06:57.579230', '2018-10-21 20:06:57.579267', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (64, 22, 1, '', 1, 'jack', 1, '{\"is_deleted\": false, \"parent_ticket_state_id\": 0, \"leave_proxy\": \"admin\", \"leave_end\": \"2018-10-23 12:00:00\", \"leave_start\": \"2018-10-22 12:00:00\", \"creator\": \"jack\", \"participant_type_id\": 1, \"in_add_node\": false, \"parent_ticket_id\": 0, \"relation\": \"jack\", \"title\": \"tttttt\", \"leave_days\": \"1\", \"sn\": \"loonflowhhh_201810220001\", \"participant\": \"jack\", \"leave_type\": \"3\", \"add_node_man\": \"\", \"gmt_modified\": \"2018-10-22 07:12:16.455740\", \"leave_reason\": \"<p>ddd</p>\", \"state_id\": 3, \"workflow_id\": 1, \"gmt_created\": \"2018-10-22 07:12:16.451086\"}', 'admin', '2018-10-22 07:12:16.542137', '2018-10-22 07:12:16.542163', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (65, 23, 1, '', 1, 'jack', 1, '{\"is_deleted\": false, \"parent_ticket_state_id\": 0, \"leave_proxy\": \"admin\", \"leave_end\": \"2018-10-24 12:00:00\", \"leave_start\": \"2018-10-22 12:00:00\", \"creator\": \"jack\", \"participant_type_id\": 1, \"in_add_node\": false, \"parent_ticket_id\": 0, \"relation\": \"jack\", \"title\": \"ttttest\", \"leave_days\": \"2\", \"sn\": \"loonflow_201810220002\", \"participant\": \"jack\", \"leave_type\": \"3\", \"add_node_man\": \"\", \"gmt_modified\": \"2018-10-22 08:05:37.192994\", \"leave_reason\": \"<p>te</p>\", \"state_id\": 3, \"workflow_id\": 1, \"gmt_created\": \"2018-10-22 08:05:37.187794\"}', 'admin', '2018-10-22 08:05:37.270333', '2018-10-22 08:05:37.270359', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (66, 19, 15, '', 1, 'webb', 15, '{\"id\": 19, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:38:26\", \"gmt_modified\": \"2020-02-14 21:38:26\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140017\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:38:26.062413', '2020-02-14 21:38:26.062413', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (67, 20, 15, '', 1, 'webb', 15, '{\"id\": 20, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:39:18\", \"gmt_modified\": \"2020-02-14 21:39:18\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140018\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:39:19.004815', '2020-02-14 21:39:19.004815', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (68, 21, 2, '', 1, 'webb', 1, '{\"id\": 21, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:43:45\", \"gmt_modified\": \"2020-02-14 21:43:45\", \"is_deleted\": false, \"title\": \"test\", \"workflow_id\": 1, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140019\", \"state_id\": 2, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"leave_start\": \"2020-02-21 00:00:00\", \"leave_end\": \"2020-02-22 00:00:00\", \"leave_days\": \"2\", \"leave_proxy\": \"david\", \"leave_type\": \"1\", \"leave_reason\": \"<p>123</p>\"}', 'webb', '2020-02-14 21:43:45.971309', '2020-02-14 21:43:45.971309', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (69, 22, 15, '', 1, 'webb', 15, '{\"id\": 22, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:45:21\", \"gmt_modified\": \"2020-02-14 21:45:21\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140020\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:45:21.202628', '2020-02-14 21:45:21.202628', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (70, 23, 15, '', 1, 'webb', 15, '{\"id\": 23, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:47:59\", \"gmt_modified\": \"2020-02-14 21:47:59\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140021\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:47:59.809609', '2020-02-14 21:47:59.809609', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (71, 24, 15, '', 1, 'webb', 15, '{\"id\": 24, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:49:46\", \"gmt_modified\": \"2020-02-14 21:49:46\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140022\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:49:47.012471', '2020-02-14 21:49:47.012471', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (72, 25, 15, '', 1, 'webb', 15, '{\"id\": 25, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:52:47\", \"gmt_modified\": \"2020-02-14 21:52:47\", \"is_deleted\": false, \"title\": \"tess\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140023\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:52:47.203580', '2020-02-14 21:52:47.203580', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (73, 26, 15, '', 1, 'webb', 15, '{\"id\": 26, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:56:20\", \"gmt_modified\": \"2020-02-14 21:56:20\", \"is_deleted\": false, \"title\": \"tes2\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140024\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:56:20.449743', '2020-02-14 21:56:20.449743', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (74, 22, 16, '同意', 1, 'lilian', 12, '{\"id\": 22, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:45:21\", \"gmt_modified\": \"2020-02-14 21:57:12\", \"is_deleted\": false, \"title\": \"\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140020\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"lilian,webb,hr\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'lilian', '2020-02-14 21:57:12.063740', '2020-02-14 21:57:12.063740', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (75, 27, 15, '', 1, 'webb', 15, '{\"id\": 27, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:59:25\", \"gmt_modified\": \"2020-02-14 21:59:25\", \"is_deleted\": false, \"title\": \"yte\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140025\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 21:59:25.805581', '2020-02-14 21:59:25.805581', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (76, 27, 16, '12', 1, 'lilian', 12, '{\"id\": 27, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 21:59:25\", \"gmt_modified\": \"2020-02-14 21:59:54\", \"is_deleted\": false, \"title\": \"yte\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140025\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"lilian,webb,hr\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'lilian', '2020-02-14 21:59:54.704524', '2020-02-14 21:59:54.704524', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (77, 28, 15, '', 1, 'webb', 15, '{\"id\": 28, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:19:26\", \"gmt_modified\": \"2020-02-14 22:19:26\", \"is_deleted\": false, \"title\": \"1\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140026\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:19:26.413125', '2020-02-14 22:19:26.413125', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (78, 29, 18, '', 1, 'webb', 16, '{\"id\": 29, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:22:06\", \"gmt_modified\": \"2020-02-14 22:22:06\", \"is_deleted\": false, \"title\": \"333\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140027\", \"state_id\": 16, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"None\"}', 'webb', '2020-02-14 22:22:06.948888', '2020-02-14 22:22:06.949886', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (79, 30, 15, '', 1, 'webb', 15, '{\"id\": 30, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:23:07\", \"gmt_modified\": \"2020-02-14 22:23:07\", \"is_deleted\": false, \"title\": \"123\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140028\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:23:07.458066', '2020-02-14 22:23:07.458066', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (80, 31, 15, '', 1, 'lilian', 15, '{\"id\": 31, \"creator\": \"lilian\", \"gmt_created\": \"2020-02-14 22:32:59\", \"gmt_modified\": \"2020-02-14 22:32:59\", \"is_deleted\": false, \"title\": \"9999999999999999\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140029\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'lilian', '2020-02-14 22:32:59.251644', '2020-02-14 22:32:59.251644', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (81, 32, 15, '', 1, 'lilian', 15, '{\"id\": 32, \"creator\": \"lilian\", \"gmt_created\": \"2020-02-14 22:33:32\", \"gmt_modified\": \"2020-02-14 22:33:32\", \"is_deleted\": false, \"title\": \"555555555555555555555555555555\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140030\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'lilian', '2020-02-14 22:33:32.706690', '2020-02-14 22:33:32.706690', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (82, 32, 16, '9999', 1, 'lilian', 12, '{\"id\": 32, \"creator\": \"lilian\", \"gmt_created\": \"2020-02-14 22:33:32\", \"gmt_modified\": \"2020-02-14 22:33:38\", \"is_deleted\": false, \"title\": \"555555555555555555555555555555\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140030\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"lilian,hr\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'lilian', '2020-02-14 22:33:38.136185', '2020-02-14 22:33:38.136185', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (83, 33, 15, '', 1, 'webb', 15, '{\"id\": 33, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:37:54\", \"gmt_modified\": \"2020-02-14 22:37:54\", \"is_deleted\": false, \"title\": \"333333\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140031\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:37:54.449005', '2020-02-14 22:37:54.449005', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (84, 34, 15, '', 1, 'webb', 15, '{\"id\": 34, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:47:15\", \"gmt_modified\": \"2020-02-14 22:47:15\", \"is_deleted\": false, \"title\": \"11\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140032\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:47:15.563990', '2020-02-14 22:47:15.563990', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (85, 35, 15, '', 1, 'webb', 15, '{\"id\": 35, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:48:03\", \"gmt_modified\": \"2020-02-14 22:48:03\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140033\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:48:03.926068', '2020-02-14 22:48:03.926068', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (86, 36, 15, '', 1, 'webb', 15, '{\"id\": 36, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:49:12\", \"gmt_modified\": \"2020-02-14 22:49:12\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140034\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:49:12.282740', '2020-02-14 22:49:12.282740', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (87, 37, 15, '', 1, 'webb', 15, '{\"id\": 37, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:49:51\", \"gmt_modified\": \"2020-02-14 22:49:51\", \"is_deleted\": false, \"title\": \"112\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140035\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:49:51.644335', '2020-02-14 22:49:51.644335', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (88, 38, 15, '', 1, 'webb', 15, '{\"id\": 38, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 22:54:12\", \"gmt_modified\": \"2020-02-14 22:54:12\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140036\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 22:54:12.840648', '2020-02-14 22:54:12.840648', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (89, 39, 15, '', 1, 'webb', 15, '{\"id\": 39, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 23:01:41\", \"gmt_modified\": \"2020-02-14 23:01:41\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140037\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 23:01:41.360906', '2020-02-14 23:01:41.360906', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (90, 40, 15, '', 1, 'webb', 15, '{\"id\": 40, \"creator\": \"webb\", \"gmt_created\": \"2020-02-14 23:01:42\", \"gmt_modified\": \"2020-02-14 23:01:42\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002140038\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"None\", \"leixing_\": \"None\"}', 'webb', '2020-02-14 23:01:42.760165', '2020-02-14 23:01:42.760165', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (91, 41, 15, '', 1, 'webb', 15, '{\"script_run_last_result\": true, \"wenben_\": \"None\", \"is_deleted\": false, \"is_rejected\": false, \"gmt_created\": \"2020-02-15 17:48:08\", \"gmt_modified\": \"2020-02-15 17:48:08\", \"participant_type_id\": 1, \"parent_ticket_id\": 0, \"relation\": \"lilian,webb\", \"creator\": \"webb\", \"title\": \"12\", \"add_node_man\": \"\", \"state_id\": 12, \"parent_ticket_state_id\": 0, \"id\": 41, \"multi_all_person\": \"{}\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150001\", \"workflow_id\": 3, \"in_add_node\": false, \"leixing_\": \"None\", \"participant\": \"lilian\", \"is_end\": false}', 'webb', '2020-02-15 17:48:08.210563', '2020-02-15 17:48:08.210563', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (92, 42, 15, '', 1, 'webb', 15, '{\"script_run_last_result\": true, \"wenben_\": \"None\", \"is_deleted\": false, \"is_rejected\": false, \"gmt_created\": \"2020-02-15 17:54:10\", \"gmt_modified\": \"2020-02-15 17:54:10\", \"participant_type_id\": 1, \"parent_ticket_id\": 0, \"relation\": \"lilian,webb\", \"creator\": \"webb\", \"title\": \"12\", \"add_node_man\": \"\", \"state_id\": 12, \"parent_ticket_state_id\": 0, \"id\": 42, \"multi_all_person\": \"{}\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150004\", \"workflow_id\": 3, \"in_add_node\": false, \"leixing_\": \"None\", \"participant\": \"lilian\", \"is_end\": false}', 'webb', '2020-02-15 17:54:10.542365', '2020-02-15 17:54:10.542365', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (93, 43, 15, '', 1, 'webb', 15, '{\"script_run_last_result\": true, \"wenben_\": \"None\", \"is_deleted\": false, \"is_rejected\": false, \"gmt_created\": \"2020-02-15 17:58:58\", \"gmt_modified\": \"2020-02-15 17:58:58\", \"participant_type_id\": 1, \"parent_ticket_id\": 0, \"relation\": \"lilian,webb\", \"creator\": \"webb\", \"title\": \"12\", \"add_node_man\": \"\", \"state_id\": 12, \"parent_ticket_state_id\": 0, \"id\": 43, \"multi_all_person\": \"{}\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150005\", \"workflow_id\": 3, \"in_add_node\": false, \"leixing_\": \"None\", \"participant\": \"lilian\", \"is_end\": false}', 'webb', '2020-02-15 17:58:58.677003', '2020-02-15 17:58:58.677003', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (94, 47, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 47, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150006\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.379650', '2020-02-15 18:09:56.379650', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (95, 46, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 46, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150006\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.379650', '2020-02-15 18:09:56.379650', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (96, 48, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 48, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150007\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.379650', '2020-02-15 18:09:56.379650', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (97, 49, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 49, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150006\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.379650', '2020-02-15 18:09:56.379650', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (98, 45, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 45, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150007\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.395271', '2020-02-15 18:09:56.395271', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (99, 44, 15, '', 1, 'webb', 15, '{\"state_id\": 12, \"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"is_deleted\": false, \"id\": 44, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:09:56\", \"workflow_id\": 3, \"title\": \"1\", \"script_run_last_result\": true, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"add_node_man\": \"\", \"relation\": \"webb,lilian\", \"is_end\": false, \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 18:09:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150006\", \"participant\": \"lilian\", \"leixing_\": \"None\"}', 'webb', '2020-02-15 18:09:56.395271', '2020-02-15 18:09:56.395271', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (100, 50, 15, '', 1, 'webb', 15, '{\"title\": \"12\", \"is_deleted\": false, \"id\": 50, \"parent_ticket_id\": 0, \"is_rejected\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150008\", \"leixing_\": \"None\", \"gmt_modified\": \"2020-02-15 18:10:29\", \"in_add_node\": false, \"participant_type_id\": 1, \"state_id\": 12, \"parent_ticket_state_id\": 0, \"creator\": \"webb\", \"add_node_man\": \"\", \"gmt_created\": \"2020-02-15 18:10:29\", \"script_run_last_result\": true, \"is_end\": false, \"multi_all_person\": \"{}\", \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"workflow_id\": 3, \"wenben_\": \"None\"}', 'webb', '2020-02-15 18:10:29.977056', '2020-02-15 18:10:29.977056', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (101, 51, 15, '', 1, 'webb', 15, '{\"title\": \"44\", \"is_deleted\": false, \"id\": 51, \"parent_ticket_id\": 0, \"is_rejected\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150009\", \"leixing_\": \"None\", \"gmt_modified\": \"2020-02-15 18:11:12\", \"in_add_node\": false, \"participant_type_id\": 1, \"state_id\": 12, \"parent_ticket_state_id\": 0, \"creator\": \"webb\", \"add_node_man\": \"\", \"gmt_created\": \"2020-02-15 18:11:12\", \"script_run_last_result\": true, \"is_end\": false, \"multi_all_person\": \"{}\", \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"workflow_id\": 3, \"wenben_\": \"None\"}', 'webb', '2020-02-15 18:11:12.507456', '2020-02-15 18:11:12.507456', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (102, 52, 15, '', 1, 'webb', 15, '{\"title\": \"12\", \"is_deleted\": false, \"id\": 52, \"parent_ticket_id\": 0, \"is_rejected\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150010\", \"leixing_\": \"None\", \"gmt_modified\": \"2020-02-15 18:14:28\", \"in_add_node\": false, \"participant_type_id\": 1, \"state_id\": 12, \"parent_ticket_state_id\": 0, \"creator\": \"webb\", \"add_node_man\": \"\", \"gmt_created\": \"2020-02-15 18:14:28\", \"script_run_last_result\": true, \"is_end\": false, \"multi_all_person\": \"{}\", \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"workflow_id\": 3, \"wenben_\": \"None\"}', 'webb', '2020-02-15 18:14:28.557955', '2020-02-15 18:14:28.557955', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (103, 66, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 66, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.332930', '2020-02-15 18:23:43.332930', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (104, 61, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 61, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150015\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.332930', '2020-02-15 18:23:43.332930', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (105, 57, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 57, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"we\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150012\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.332930', '2020-02-15 18:23:43.332930', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (106, 59, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 59, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150014\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.348551', '2020-02-15 18:23:43.348551', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (107, 55, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 55, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"12\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150011\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.348551', '2020-02-15 18:23:43.348551', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (108, 64, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 64, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.348551', '2020-02-15 18:23:43.348551', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (109, 54, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 54, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"12\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150011\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.348551', '2020-02-15 18:23:43.348551', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (110, 60, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 60, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150015\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.364172', '2020-02-15 18:23:43.364172', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (111, 56, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 56, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150011\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.364172', '2020-02-15 18:23:43.364172', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (112, 58, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 58, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150013\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.364172', '2020-02-15 18:23:43.364172', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (113, 53, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 53, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"12\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150011\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.364172', '2020-02-15 18:23:43.364172', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (114, 68, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 68, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.364172', '2020-02-15 18:23:43.364172', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (115, 63, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 63, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.379792', '2020-02-15 18:23:43.379792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (116, 67, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 67, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"12\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.379792', '2020-02-15 18:23:43.379792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (117, 62, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 62, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.379792', '2020-02-15 18:23:43.379792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (118, 65, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 65, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.379792', '2020-02-15 18:23:43.379792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (119, 69, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 69, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:23:42\", \"title\": \"1\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:23:42\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150016\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:23:43.379792', '2020-02-15 18:23:43.379792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (120, 70, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"parent_ticket_id\": 0, \"wenben_\": \"None\", \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"in_add_node\": false, \"relation\": \"webb,lilian\", \"is_rejected\": false, \"id\": 70, \"script_run_last_result\": true, \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:24:18\", \"title\": \"21\", \"leixing_\": \"None\", \"is_end\": false, \"creator\": \"webb\", \"gmt_modified\": \"2020-02-15 18:24:18\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150017\", \"workflow_id\": 3, \"add_node_man\": \"\"}', 'webb', '2020-02-15 18:24:18.772021', '2020-02-15 18:24:18.773022', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (121, 73, 15, '', 1, 'webb', 15, '{\"parent_ticket_id\": 0, \"participant\": \"lilian\", \"multi_all_person\": \"{}\", \"in_add_node\": false, \"wenben_\": \"666\", \"leixing_\": \"666\", \"creator\": \"webb\", \"state_id\": 12, \"add_node_man\": \"\", \"participant_type_id\": 1, \"is_deleted\": false, \"gmt_created\": \"2020-02-15 18:47:11\", \"workflow_id\": 3, \"relation\": \"lilian,webb\", \"gmt_modified\": \"2020-02-15 18:47:11\", \"script_run_last_result\": true, \"id\": 73, \"title\": \"12\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150020\", \"parent_ticket_state_id\": 0, \"is_end\": false, \"is_rejected\": false}', 'webb', '2020-02-15 18:47:12.019213', '2020-02-15 18:47:12.019213', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (122, 74, 15, '', 1, 'webb', 15, '{\"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150021\", \"gmt_modified\": \"2020-02-15 18:49:16\", \"script_run_last_result\": true, \"in_add_node\": false, \"workflow_id\": 3, \"add_node_man\": \"\", \"is_rejected\": false, \"creator\": \"webb\", \"state_id\": 12, \"is_end\": false, \"relation\": \"webb,lilian\", \"wenben_\": \"None\", \"participant_type_id\": 1, \"title\": \"12\", \"parent_ticket_id\": 0, \"id\": 74, \"leixing_\": \"None\", \"gmt_created\": \"2020-02-15 18:49:16\", \"participant\": \"lilian\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"multi_all_person\": \"{}\"}', 'webb', '2020-02-15 18:49:16.978656', '2020-02-15 18:49:16.978656', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (123, 75, 15, '', 1, 'webb', 15, '{\"relation\": \"lilian,webb\", \"parent_ticket_state_id\": 0, \"leixing_\": \"None\", \"is_end\": false, \"is_rejected\": false, \"is_deleted\": false, \"add_node_man\": \"\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150022\", \"state_id\": 12, \"gmt_created\": \"2020-02-15 18:56:51\", \"id\": 75, \"multi_all_person\": \"{}\", \"creator\": \"webb\", \"script_run_last_result\": true, \"participant\": \"lilian\", \"parent_ticket_id\": 0, \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 18:56:51\", \"workflow_id\": 3, \"participant_type_id\": 1, \"title\": \"12\", \"wenben_\": \"None\"}', 'webb', '2020-02-15 18:56:51.120161', '2020-02-15 18:56:51.120161', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (124, 76, 15, '', 1, 'webb', 15, '{\"add_node_man\": \"\", \"title\": \"12\", \"relation\": \"lilian,webb\", \"creator\": \"webb\", \"gmt_created\": \"2020-02-15 19:00:53\", \"state_id\": 12, \"is_end\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150023\", \"leixing_\": \"None\", \"participant\": \"lilian\", \"is_deleted\": false, \"script_run_last_result\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"gmt_modified\": \"2020-02-15 19:00:53\", \"parent_ticket_id\": 0, \"id\": 76, \"participant_type_id\": 1, \"parent_ticket_state_id\": 0, \"workflow_id\": 3, \"in_add_node\": false, \"wenben_\": \"None\"}', 'webb', '2020-02-15 19:00:54.017773', '2020-02-15 19:00:54.017773', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (125, 77, 15, '', 1, 'webb', 15, '{\"multi_all_person\": \"{}\", \"gmt_modified\": \"2020-02-15 19:14:23\", \"participant_type_id\": 1, \"add_node_man\": \"\", \"id\": 77, \"title\": \"22\", \"creator\": \"webb\", \"relation\": \"webb,lilian\", \"wenben_\": \"None\", \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"gmt_created\": \"2020-02-15 19:14:23\", \"participant\": \"lilian\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150024\", \"script_run_last_result\": true, \"workflow_id\": 3, \"is_deleted\": false, \"state_id\": 12, \"is_rejected\": false, \"in_add_node\": false, \"is_end\": false, \"leixing_\": \"None\"}', 'webb', '2020-02-15 19:14:23.740970', '2020-02-15 19:14:23.740970', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (126, 78, 15, '', 1, 'webb', 15, '{\"multi_all_person\": \"{}\", \"gmt_created\": \"2020-02-15 19:19:00\", \"parent_ticket_id\": 0, \"is_deleted\": false, \"wenben_\": \"None\", \"is_rejected\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150025\", \"gmt_modified\": \"2020-02-15 19:19:00\", \"state_id\": 12, \"script_run_last_result\": true, \"is_end\": false, \"leixing_\": \"None\", \"parent_ticket_state_id\": 0, \"in_add_node\": false, \"participant\": \"lilian\", \"id\": 78, \"participant_type_id\": 1, \"title\": \"55\", \"relation\": \"lilian,webb\", \"add_node_man\": \"\", \"workflow_id\": 3, \"creator\": \"webb\"}', 'webb', '2020-02-15 19:19:00.826013', '2020-02-15 19:19:00.826013', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (127, 79, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"creator\": \"webb\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150026\", \"parent_ticket_state_id\": 0, \"multi_all_person\": \"{}\", \"title\": \"111111\", \"id\": 79, \"relation\": \"webb,lilian\", \"workflow_id\": 3, \"add_node_man\": \"\", \"gmt_created\": \"2020-02-15 19:25:42\", \"is_deleted\": false, \"wenben_\": \"None\", \"participant_type_id\": 1, \"is_end\": false, \"in_add_node\": false, \"is_rejected\": false, \"script_run_last_result\": true, \"leixing_\": \"None\", \"state_id\": 12, \"parent_ticket_id\": 0, \"gmt_modified\": \"2020-02-15 19:25:42\"}', 'webb', '2020-02-15 19:25:42.853353', '2020-02-15 19:25:42.853353', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (128, 80, 15, '', 1, 'webb', 15, '{\"parent_ticket_id\": 0, \"is_rejected\": false, \"participant\": \"lilian\", \"is_deleted\": false, \"is_end\": false, \"add_node_man\": \"\", \"participant_type_id\": 1, \"in_add_node\": false, \"title\": \"111\", \"state_id\": 12, \"script_run_last_result\": true, \"parent_ticket_state_id\": 0, \"leixing_\": \"None\", \"wenben_\": \"None\", \"creator\": \"webb\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150027\", \"multi_all_person\": \"{}\", \"gmt_modified\": \"2020-02-15 19:28:12\", \"relation\": \"lilian,webb\", \"workflow_id\": 3, \"gmt_created\": \"2020-02-15 19:28:12\", \"id\": 80}', 'webb', '2020-02-15 19:28:12.923065', '2020-02-15 19:28:12.923065', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (129, 81, 15, '', 1, 'webb', 15, '{\"id\": 81, \"is_rejected\": false, \"gmt_created\": \"2020-02-15 19:32:26\", \"participant_type_id\": 1, \"creator\": \"webb\", \"participant\": \"lilian\", \"script_run_last_result\": true, \"parent_ticket_state_id\": 0, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150028\", \"leixing_\": \"None\", \"title\": \"22\", \"wenben_\": \"None\", \"state_id\": 12, \"is_end\": false, \"parent_ticket_id\": 0, \"is_deleted\": false, \"gmt_modified\": \"2020-02-15 19:32:26\", \"multi_all_person\": \"{}\", \"relation\": \"webb,lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"workflow_id\": 3}', 'webb', '2020-02-15 19:32:26.726605', '2020-02-15 19:32:26.726605', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (130, 82, 15, '', 1, 'webb', 15, '{\"gmt_created\": \"2020-02-15 19:33:39\", \"multi_all_person\": \"{}\", \"creator\": \"webb\", \"participant_type_id\": 1, \"leixing_\": \"None\", \"state_id\": 12, \"id\": 82, \"in_add_node\": false, \"gmt_modified\": \"2020-02-15 19:33:39\", \"wenben_\": \"None\", \"is_deleted\": false, \"parent_ticket_state_id\": 0, \"title\": \"22\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150029\", \"add_node_man\": \"\", \"workflow_id\": 3, \"participant\": \"lilian\", \"is_end\": false, \"script_run_last_result\": true, \"relation\": \"lilian,webb\"}', 'webb', '2020-02-15 19:33:39.412940', '2020-02-15 19:33:39.412940', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (131, 83, 15, '', 1, 'webb', 15, '{\"participant\": \"lilian\", \"in_add_node\": false, \"creator\": \"webb\", \"add_node_man\": \"\", \"leixing_\": \"None\", \"parent_ticket_state_id\": 0, \"parent_ticket_id\": 0, \"multi_all_person\": \"{}\", \"title\": \"12\", \"workflow_id\": 3, \"script_run_last_result\": true, \"is_rejected\": false, \"relation\": \"lilian,webb\", \"wenben_\": \"None\", \"gmt_created\": \"2020-02-15 19:35:05\", \"is_end\": false, \"state_id\": 12, \"gmt_modified\": \"2020-02-15 19:35:05\", \"is_deleted\": false, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150030\", \"participant_type_id\": 1, \"id\": 83}', 'webb', '2020-02-15 19:35:05.232402', '2020-02-15 19:35:05.232402', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (132, 84, 15, '', 1, 'webb', 15, '{\"wenben_\": \"None\", \"is_rejected\": false, \"participant_type_id\": 1, \"multi_all_person\": \"{}\", \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:35:54\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150031\", \"leixing_\": \"None\", \"is_end\": false, \"gmt_modified\": \"2020-02-15 19:35:54\", \"creator\": \"webb\", \"parent_ticket_state_id\": 0, \"is_deleted\": false, \"script_run_last_result\": true, \"title\": \"1212\", \"state_id\": 12, \"add_node_man\": \"\", \"in_add_node\": false, \"id\": 84, \"relation\": \"webb,lilian\", \"workflow_id\": 3, \"parent_ticket_id\": 0}', 'webb', '2020-02-15 19:35:54.963367', '2020-02-15 19:35:54.963367', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (133, 85, 15, '', 1, 'webb', 15, '{\"id\": 85, \"multi_all_person\": \"{}\", \"title\": \"121\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:36:51\", \"gmt_modified\": \"2020-02-15 19:36:51\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150032\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p>1212</p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"1\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:36:51.630875', '2020-02-15 19:36:51.630875', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (134, 86, 15, '', 1, 'webb', 15, '{\"id\": 86, \"multi_all_person\": \"{}\", \"title\": \"222\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:37:49\", \"gmt_modified\": \"2020-02-15 19:37:49\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150033\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p><img class=\\\"loadingclass\\\" id=\\\"loading_k6nj188w\\\" src=\\\"/static/ueditor/themes/default/images/spacer.gif\\\" title=\\\"\\u6b63\\u5728\\u4e0a\\u4f20...\\\"/></p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"2\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:37:49.933237', '2020-02-15 19:37:49.933237', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (135, 87, 15, '', 1, 'webb', 15, '{\"id\": 87, \"multi_all_person\": \"{}\", \"title\": \"22\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:40:56\", \"gmt_modified\": \"2020-02-15 19:40:56\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150034\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p>33<img src=\\\"/media/upload\\\\202002\\\\\\u6355\\u83b71581766841176.png\\\" title=\\\"source_file_tile\\\" alt=\\\"\\u6355\\u83b7.png\\\" width=\\\"263\\\" height=\\\"160\\\"/></p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"2\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:40:56.564737', '2020-02-15 19:40:56.564737', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (136, 88, 15, '', 1, 'webb', 15, '{\"id\": 88, \"multi_all_person\": \"{}\", \"title\": \"\\u9879\\u76ee\\u521b\\u65b0\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:43:21\", \"gmt_modified\": \"2020-02-15 19:43:21\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150035\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p><img src=\\\"/media/upload\\\\202002\\\\test1581766973751.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"242\\\" height=\\\"258\\\"/></p><p>\\u8fd9\\u662f\\u6211\\u7684\\u5408\\u540c\\u4e66\\uff0c\\u8bf7\\u9886\\u5bfc\\u5ba1\\u6279</p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"2\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:43:21.765413', '2020-02-15 19:43:21.765413', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (137, 89, 15, '', 1, 'webb', 15, '{\"id\": 89, \"multi_all_person\": \"{}\", \"title\": \"\\u9879\\u76ee\\u521b\\u65b0\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 19:45:26\", \"gmt_modified\": \"2020-02-15 19:45:26\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150036\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p>\\u76f8\\u5173\\u8d44\\u6599\\u5728\\u9644\\u4ef6\\uff0c\\u8bf7\\u9886\\u5bfc\\u67e5\\u9605\\uff01\\uff01\\uff01</p><p style=\\\"line-height: 16px;\\\"><img src=\\\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\\\"/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"/media/upload\\\\202002\\\\121581767123326.rar\\\" title=\\\"12.rar\\\">12.rar</a></p><p><br/></p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"3\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:45:26.670596', '2020-02-15 19:45:26.670596', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (138, 90, 18, '', 1, 'webb', 16, '{\"id\": 90, \"multi_all_person\": \"{}\", \"test_text\": \"1\", \"title\": \"test\", \"is_deleted\": false, \"script_run_last_result\": true, \"relation\": \"webb\", \"workflow_id\": 4, \"participant_type_id\": 1, \"add_node_man\": \"\", \"state_id\": 16, \"is_end\": false, \"creator\": \"webb\", \"in_add_node\": false, \"participant\": \"\", \"gmt_modified\": \"2020-02-15 19:59:44\", \"gmt_created\": \"2020-02-15 19:59:44\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150037\", \"parent_ticket_id\": 0, \"is_rejected\": false, \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 19:59:44.209316', '2020-02-15 19:59:44.209316', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (139, 91, 18, '', 1, 'webb', 16, '{\"id\": 91, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\", \"title\": \"12\", \"is_deleted\": false, \"script_run_last_result\": true, \"relation\": \"webb\", \"workflow_id\": 4, \"participant_type_id\": 1, \"add_node_man\": \"\", \"state_id\": 16, \"is_end\": false, \"creator\": \"webb\", \"in_add_node\": false, \"participant\": \"\", \"gmt_modified\": \"2020-02-15 20:02:11\", \"gmt_created\": \"2020-02-15 20:02:11\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150038\", \"parent_ticket_id\": 0, \"is_rejected\": false, \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 20:02:11.616228', '2020-02-15 20:02:11.616228', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (140, 92, 15, '', 1, 'webb', 15, '{\"id\": 92, \"multi_all_person\": \"{}\", \"title\": \"\\u7206\\u7834\\u8bbe\\u8ba1\\u7533\\u8bf7\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"lilian\", \"gmt_created\": \"2020-02-15 20:07:44\", \"gmt_modified\": \"2020-02-15 20:07:44\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150039\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p><img src=\\\"/media/upload\\\\202002\\\\test1581768410195.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"200\\\" height=\\\"174\\\"/></p><p>\\u76f8\\u5173\\u8d44\\u6599\\u9644\\u4ef6\\u53ef\\u67e5\\u770b</p><p style=\\\"line-height: 16px;\\\"><img src=\\\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\\\"/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"/media/upload\\\\202002\\\\121581768461562.rar\\\" title=\\\"12.rar\\\">12.rar</a></p><p><br/></p>\", \"state_id\": 12, \"relation\": \"webb,lilian\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"parent_ticket_state_id\": 0}', 'webb', '2020-02-15 20:07:44.242993', '2020-02-15 20:07:44.242993', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (141, 92, 16, '属实', 1, 'lilian', 12, '{\"id\": 92, \"multi_all_person\": \"{}\", \"title\": \"\\u7206\\u7834\\u8bbe\\u8ba1\\u7533\\u8bf7\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": false, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"hr\", \"gmt_created\": \"2020-02-15 20:07:44\", \"gmt_modified\": \"2020-02-15 20:08:29\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150039\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p><img src=\\\"/media/upload\\\\202002\\\\test1581768410195.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"200\\\" height=\\\"174\\\"/></p><p>\\u76f8\\u5173\\u8d44\\u6599\\u9644\\u4ef6\\u53ef\\u67e5\\u770b</p><p style=\\\"line-height: 16px;\\\"><img src=\\\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\\\"/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"/media/upload\\\\202002\\\\121581768461562.rar\\\" title=\\\"12.rar\\\">12.rar</a></p><p><br/></p>\", \"state_id\": 13, \"relation\": \"hr,webb,lilian\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"parent_ticket_state_id\": 0}', 'lilian', '2020-02-15 20:08:29.186527', '2020-02-15 20:08:29.186527', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (142, 92, 17, '属实', 1, 'hr', 13, '{\"id\": 92, \"multi_all_person\": \"{}\", \"title\": \"\\u7206\\u7834\\u8bbe\\u8ba1\\u7533\\u8bf7\", \"is_deleted\": false, \"add_node_man\": \"\", \"workflow_id\": 3, \"is_end\": true, \"script_run_last_result\": true, \"in_add_node\": false, \"participant\": \"\", \"gmt_created\": \"2020-02-15 20:07:44\", \"gmt_modified\": \"2020-02-15 20:09:03\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002150039\", \"is_rejected\": false, \"parent_ticket_id\": 0, \"creator\": \"webb\", \"participant_type_id\": 1, \"wenben_\": \"<p><img src=\\\"/media/upload\\\\202002\\\\test1581768410195.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"200\\\" height=\\\"174\\\"/></p><p>\\u76f8\\u5173\\u8d44\\u6599\\u9644\\u4ef6\\u53ef\\u67e5\\u770b</p><p style=\\\"line-height: 16px;\\\"><img src=\\\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\\\"/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"/media/upload\\\\202002\\\\121581768461562.rar\\\" title=\\\"12.rar\\\">12.rar</a></p><p><br/></p>\", \"state_id\": 14, \"relation\": \"hr,webb,lilian\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"parent_ticket_state_id\": 0}', 'hr', '2020-02-15 20:09:03.273777', '2020-02-15 20:09:03.273777', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (143, 93, 18, '', 1, 'webb', 16, '{\"id\": 93, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 20:40:34\", \"gmt_modified\": \"2020-02-18 20:40:34\", \"is_deleted\": false, \"title\": \"22\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180001\", \"state_id\": 16, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 20:40:34.249314', '2020-02-18 20:40:34.249314', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (144, 94, 18, '', 1, 'webb', 16, '{\"id\": 94, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 20:46:01\", \"gmt_modified\": \"2020-02-18 20:46:01\", \"is_deleted\": false, \"title\": \"jieshushu\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180002\", \"state_id\": 16, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 20:46:01.907288', '2020-02-18 20:46:01.907288', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (145, 95, 20, '', 1, 'webb', 16, '{\"id\": 95, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 20:47:47\", \"gmt_modified\": \"2020-02-18 20:47:47\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180003\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 20:47:47.406694', '2020-02-18 20:47:47.406694', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (146, 95, 18, '12', 1, 'webb', 17, '{\"id\": 95, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 20:47:47\", \"gmt_modified\": \"2020-02-18 20:47:51\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180003\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 20:47:51.236392', '2020-02-18 20:47:51.236392', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (147, 96, 20, '', 1, 'webb', 16, '{\"id\": 96, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:36:12\", \"gmt_modified\": \"2020-02-18 21:36:12\", \"is_deleted\": false, \"title\": \"ts123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180004\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:36:12.520444', '2020-02-18 21:36:12.520444', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (148, 96, 18, '123', 1, 'webb', 17, '{\"id\": 96, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:36:12\", \"gmt_modified\": \"2020-02-18 21:36:43\", \"is_deleted\": false, \"title\": \"ts123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180004\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:36:43.156177', '2020-02-18 21:36:43.156177', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (149, 97, 20, '', 1, 'webb', 16, '{\"id\": 97, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:40:09\", \"gmt_modified\": \"2020-02-18 21:40:09\", \"is_deleted\": false, \"title\": \"t3\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180005\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:40:09.947859', '2020-02-18 21:40:09.947859', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (150, 97, 18, '33', 1, 'webb', 17, '{\"id\": 97, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:40:09\", \"gmt_modified\": \"2020-02-18 21:40:57\", \"is_deleted\": false, \"title\": \"t3\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180005\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:40:57.126572', '2020-02-18 21:40:57.126572', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (151, 99, 20, '', 1, 'webb', 16, '{\"id\": 99, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:46:40\", \"gmt_modified\": \"2020-02-18 21:46:40\", \"is_deleted\": false, \"title\": \"tes\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180006\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:46:40.789338', '2020-02-18 21:46:40.789338', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (152, 102, 20, '', 1, 'webb', 16, '{\"id\": 102, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:46:40\", \"gmt_modified\": \"2020-02-18 21:46:40\", \"is_deleted\": false, \"title\": \"tes\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180006\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:46:40.793326', '2020-02-18 21:46:40.793326', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (153, 98, 20, '', 1, 'webb', 16, '{\"id\": 98, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:46:40\", \"gmt_modified\": \"2020-02-18 21:46:40\", \"is_deleted\": false, \"title\": \"tes\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180006\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:46:40.794322', '2020-02-18 21:46:40.794322', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (154, 101, 20, '', 1, 'webb', 16, '{\"id\": 101, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:46:40\", \"gmt_modified\": \"2020-02-18 21:46:40\", \"is_deleted\": false, \"title\": \"tes123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180007\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:46:40.810281', '2020-02-18 21:46:40.811278', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (155, 100, 20, '', 1, 'webb', 16, '{\"id\": 100, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:46:40\", \"gmt_modified\": \"2020-02-18 21:46:40\", \"is_deleted\": false, \"title\": \"123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180007\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u7f8e\\u56fd\"}', 'webb', '2020-02-18 21:46:40.811278', '2020-02-18 21:46:40.811278', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (156, 103, 20, '', 1, 'webb', 16, '{\"id\": 103, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:47:06\", \"gmt_modified\": \"2020-02-18 21:47:06\", \"is_deleted\": false, \"title\": \"123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180007\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u7f8e\\u56fd\"}', 'webb', '2020-02-18 21:47:06.378674', '2020-02-18 21:47:06.378674', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (157, 103, 18, '213', 1, 'webb', 17, '{\"id\": 103, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:47:06\", \"gmt_modified\": \"2020-02-18 21:47:29\", \"is_deleted\": false, \"title\": \"123\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180007\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u7f8e\\u56fd\"}', 'webb', '2020-02-18 21:47:29.293310', '2020-02-18 21:47:29.293310', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (158, 104, 20, '', 1, 'webb', 16, '{\"id\": 104, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:50:09\", \"gmt_modified\": \"2020-02-18 21:50:09\", \"is_deleted\": false, \"title\": \"12333\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180008\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:50:09.079492', '2020-02-18 21:50:09.079492', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (159, 104, 18, '2311', 1, 'webb', 17, '{\"id\": 104, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:50:09\", \"gmt_modified\": \"2020-02-18 21:50:13\", \"is_deleted\": false, \"title\": \"12333\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180008\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:50:13.788190', '2020-02-18 21:50:13.788190', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (160, 105, 20, '', 1, 'webb', 16, '{\"id\": 105, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:54:04\", \"gmt_modified\": \"2020-02-18 21:54:04\", \"is_deleted\": false, \"title\": \"123444\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180009\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:54:04.367364', '2020-02-18 21:54:04.367364', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (161, 105, 18, '33444', 1, 'webb', 17, '{\"id\": 105, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:54:04\", \"gmt_modified\": \"2020-02-18 21:54:10\", \"is_deleted\": false, \"title\": \"123444\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180009\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:54:10.893647', '2020-02-18 21:54:10.894645', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (162, 106, 20, '', 1, 'webb', 16, '{\"id\": 106, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:54:38\", \"gmt_modified\": \"2020-02-18 21:54:38\", \"is_deleted\": false, \"title\": \"2323\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180010\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:54:38.835211', '2020-02-18 21:54:38.835211', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (163, 107, 20, '', 1, 'webb', 16, '{\"id\": 107, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 21:57:14\", \"gmt_modified\": \"2020-02-18 21:57:14\", \"is_deleted\": false, \"title\": \"0909\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180011\", \"state_id\": 17, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"\\u4e2d\\u56fd\"}', 'webb', '2020-02-18 21:57:14.531565', '2020-02-18 21:57:14.531565', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (164, 108, 21, '', 1, 'webb', 18, '{\"id\": 108, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:02:37\", \"gmt_modified\": \"2020-02-18 22:02:37\", \"is_deleted\": false, \"title\": \"233\", \"workflow_id\": 4, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180012\", \"state_id\": 19, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"test_text\": \"None\"}', 'webb', '2020-02-18 22:02:37.609225', '2020-02-18 22:02:37.609225', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (165, 109, 23, '', 1, 'webb', 21, '{\"id\": 109, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:12:14\", \"gmt_modified\": \"2020-02-18 22:12:14\", \"is_deleted\": false, \"title\": \"233\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180013\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-18 22:12:14.130002', '2020-02-18 22:12:14.130002', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (166, 109, 24, '2333', 1, 'webb', 22, '{\"id\": 109, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:12:14\", \"gmt_modified\": \"2020-02-18 22:12:23\", \"is_deleted\": false, \"title\": \"233\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180013\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-18 22:12:23.984096', '2020-02-18 22:12:23.985095', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (167, 110, 23, '', 1, 'webb', 21, '{\"id\": 110, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:14:49\", \"gmt_modified\": \"2020-02-18 22:14:49\", \"is_deleted\": false, \"title\": \"23334\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180014\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-18 22:14:49.583281', '2020-02-18 22:14:49.583281', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (168, 110, 24, '2443', 1, 'webb', 22, '{\"id\": 110, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:14:49\", \"gmt_modified\": \"2020-02-18 22:15:08\", \"is_deleted\": false, \"title\": \"23334\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180014\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-18 22:15:08.255779', '2020-02-18 22:15:08.255779', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (169, 111, 23, '', 1, 'webb', 21, '{\"id\": 111, \"creator\": \"webb\", \"gmt_created\": \"2020-02-18 22:26:37\", \"gmt_modified\": \"2020-02-18 22:26:37\", \"is_deleted\": false, \"title\": \"443\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002180015\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-18 22:26:37.420579', '2020-02-18 22:26:37.420579', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (170, 112, 23, '', 1, 'webb', 21, '{\"is_rejected\": false, \"script_run_last_result\": true, \"participant\": \"webb\", \"is_end\": false, \"in_add_node\": false, \"gmt_created\": \"2020-02-19 16:40:33\", \"multi_all_person\": \"{}\", \"text1\": \"None\", \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"state_id\": 22, \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002190001\", \"participant_type_id\": 1, \"id\": 112, \"is_deleted\": false, \"gmt_modified\": \"2020-02-19 16:40:33\", \"title\": \"12\", \"relation\": \"webb\", \"add_node_man\": \"\", \"creator\": \"webb\"}', 'webb', '2020-02-19 16:40:33.755845', '2020-02-19 16:40:33.755845', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (171, 112, 24, '22222', 1, 'webb', 22, '{\"id\": 112, \"creator\": \"webb\", \"gmt_created\": \"2020-02-19 16:40:33\", \"gmt_modified\": \"2020-02-22 11:05:22\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002190001\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 11:05:22.980412', '2020-02-22 11:05:22.980412', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (172, 113, 23, '', 1, 'webb', 21, '{\"id\": 113, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 11:07:57\", \"gmt_modified\": \"2020-02-22 11:07:57\", \"is_deleted\": false, \"title\": \"2222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220001\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 11:07:57.837774', '2020-02-22 11:07:57.837774', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (173, 113, 24, '3333', 1, 'webb', 22, '{\"id\": 113, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 11:07:57\", \"gmt_modified\": \"2020-02-22 11:08:02\", \"is_deleted\": false, \"title\": \"2222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220001\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 11:08:02.395135', '2020-02-22 11:08:02.395135', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (174, 114, 23, '', 1, 'webb', 21, '{\"id\": 114, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 11:15:10\", \"gmt_modified\": \"2020-02-22 11:15:10\", \"is_deleted\": false, \"title\": \"439\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220002\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 11:15:10.329418', '2020-02-22 11:15:10.329418', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (175, 115, 23, '', 1, 'webb', 21, '{\"id\": 115, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 11:25:18\", \"gmt_modified\": \"2020-02-22 11:25:18\", \"is_deleted\": false, \"title\": \"223\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220003\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 11:25:18.283897', '2020-02-22 11:25:18.283897', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (176, 133, 22, '22', 1, '1', 2, '1', '1', '2020-02-22 11:25:18.000000', '2020-02-22 12:11:41.718309', 1, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (177, 115, 24, '34444', 1, 'webb', 22, '{\"id\": 115, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 11:25:18\", \"gmt_modified\": \"2020-02-22 12:11:41\", \"is_deleted\": false, \"title\": \"223\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220003\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:11:41.781653', '2020-02-22 12:11:41.781653', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (178, 116, 23, '', 1, 'webb', 21, '{\"id\": 116, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:24:59\", \"gmt_modified\": \"2020-02-22 12:24:59\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220004\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:24:59.652431', '2020-02-22 12:24:59.652431', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (179, 233, 0, '强制关闭工单:', 1, '1', 1, '1', '', '2020-02-22 12:25:04.479455', '2020-02-22 12:25:04.479455', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (180, 116, 24, '2222', 1, 'webb', 22, '{\"id\": 116, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:24:59\", \"gmt_modified\": \"2020-02-22 12:25:04\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220004\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:25:04.542288', '2020-02-22 12:25:04.542288', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (181, 117, 23, '', 1, 'webb', 21, '{\"id\": 117, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:30:09\", \"gmt_modified\": \"2020-02-22 12:30:09\", \"is_deleted\": false, \"title\": \"2323\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220005\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:30:09.400535', '2020-02-22 12:30:09.400535', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (182, 117, 24, '33333', 1, 'webb', 22, '{\"id\": 117, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:30:09\", \"gmt_modified\": \"2020-02-22 12:30:14\", \"is_deleted\": false, \"title\": \"2323\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220005\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:30:14.278307', '2020-02-22 12:30:14.278307', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (183, 118, 23, '', 1, 'webb', 21, '{\"id\": 118, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:31:14\", \"gmt_modified\": \"2020-02-22 12:31:14\", \"is_deleted\": false, \"title\": \"232\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220006\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:31:14.464992', '2020-02-22 12:31:14.464992', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (184, 118, 24, '222', 1, 'webb', 22, '{\"id\": 118, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:31:14\", \"gmt_modified\": \"2020-02-22 12:31:18\", \"is_deleted\": false, \"title\": \"232\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220006\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:31:18.549104', '2020-02-22 12:31:18.549104', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (185, 119, 23, '', 1, 'webb', 21, '{\"id\": 119, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:32:47\", \"gmt_modified\": \"2020-02-22 12:32:47\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220007\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:32:47.054722', '2020-02-22 12:32:47.054722', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (186, 119, 24, '2213', 1, 'webb', 22, '{\"id\": 119, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:32:47\", \"gmt_modified\": \"2020-02-22 12:32:51\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220007\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:32:51.046055', '2020-02-22 12:32:51.046055', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (187, 120, 23, '', 1, 'webb', 21, '{\"id\": 120, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:34:41\", \"gmt_modified\": \"2020-02-22 12:34:41\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220008\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:34:41.619303', '2020-02-22 12:34:41.619303', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (188, 120, 24, '12121', 1, 'webb', 22, '{\"id\": 120, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:34:41\", \"gmt_modified\": \"2020-02-22 12:34:48\", \"is_deleted\": false, \"title\": \"121212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220008\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:34:48.757747', '2020-02-22 12:34:48.757747', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (189, 121, 23, '', 1, 'webb', 21, '{\"id\": 121, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:35:50\", \"gmt_modified\": \"2020-02-22 12:35:50\", \"is_deleted\": false, \"title\": \"1212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220009\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:35:50.569152', '2020-02-22 12:35:50.569152', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (190, 121, 24, '2222', 1, 'webb', 22, '{\"id\": 121, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:35:50\", \"gmt_modified\": \"2020-02-22 12:35:54\", \"is_deleted\": false, \"title\": \"1212\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220009\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:35:54.392143', '2020-02-22 12:35:54.392143', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (191, 122, 23, '', 1, 'webb', 21, '{\"id\": 122, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:36:41\", \"gmt_modified\": \"2020-02-22 12:36:41\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220010\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:36:41.999085', '2020-02-22 12:36:41.999085', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (192, 122, 24, '111', 1, 'webb', 22, '{\"id\": 122, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:36:41\", \"gmt_modified\": \"2020-02-22 12:36:45\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220010\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:36:45.388798', '2020-02-22 12:36:45.388798', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (193, 123, 23, '', 1, 'webb', 21, '{\"id\": 123, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:38:22\", \"gmt_modified\": \"2020-02-22 12:38:22\", \"is_deleted\": false, \"title\": \"121\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220011\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:38:22.502418', '2020-02-22 12:38:22.502418', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (194, 123, 24, '1212', 1, 'webb', 22, '{\"id\": 123, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 12:38:22\", \"gmt_modified\": \"2020-02-22 12:38:26\", \"is_deleted\": false, \"title\": \"121\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220011\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 12:38:26.764649', '2020-02-22 12:38:26.764649', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (195, 124, 23, '', 1, 'webb', 21, '{\"id\": 124, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:16:35\", \"gmt_modified\": \"2020-02-22 13:16:35\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220012\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:16:35.139220', '2020-02-22 13:16:35.139220', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (196, 124, 24, '1222', 1, 'webb', 22, '{\"id\": 124, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:16:35\", \"gmt_modified\": \"2020-02-22 13:16:39\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220012\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:16:39.117580', '2020-02-22 13:16:39.117580', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (197, 125, 23, '', 1, 'webb', 21, '{\"id\": 125, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:18:28\", \"gmt_modified\": \"2020-02-22 13:18:28\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220013\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:18:28.688382', '2020-02-22 13:18:28.688382', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (198, 125, 24, '233', 1, 'webb', 22, '{\"id\": 125, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:18:28\", \"gmt_modified\": \"2020-02-22 13:18:32\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220013\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:18:32.438352', '2020-02-22 13:18:32.438352', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (199, 126, 23, '', 1, 'webb', 21, '{\"id\": 126, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:22:32\", \"gmt_modified\": \"2020-02-22 13:22:32\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220014\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:22:32.597665', '2020-02-22 13:22:32.597665', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (200, 126, 24, '33', 1, 'webb', 22, '{\"id\": 126, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 13:22:32\", \"gmt_modified\": \"2020-02-22 13:22:35\", \"is_deleted\": false, \"title\": \"222\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220014\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 13:22:35.827029', '2020-02-22 13:22:35.827029', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (201, 127, 23, '', 1, 'webb', 21, '{\"id\": 127, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 14:33:31\", \"gmt_modified\": \"2020-02-22 14:33:31\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220015\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 14:33:31.859082', '2020-02-22 14:33:31.859082', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (202, 127, 24, '222', 1, 'webb', 22, '{\"id\": 127, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 14:33:31\", \"gmt_modified\": \"2020-02-22 14:35:45\", \"is_deleted\": false, \"title\": \"12\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220015\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 14:35:45.471190', '2020-02-22 14:35:45.471190', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (203, 128, 23, '', 1, 'webb', 21, '{\"id\": 128, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 14:38:27\", \"gmt_modified\": \"2020-02-22 14:38:27\", \"is_deleted\": false, \"title\": \"66\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220016\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 14:38:27.500018', '2020-02-22 14:38:27.500018', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (204, 128, 24, '222222', 1, 'webb', 22, '{\"id\": 128, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 14:38:27\", \"gmt_modified\": \"2020-02-22 14:40:20\", \"is_deleted\": false, \"title\": \"66\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220016\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 14:40:20.208928', '2020-02-22 14:40:20.208928', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (205, 129, 23, '', 1, 'webb', 21, '{\"id\": 129, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:11:54\", \"gmt_modified\": \"2020-02-22 15:11:54\", \"is_deleted\": false, \"title\": \"121\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220017\", \"state_id\": 22, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 15:11:54.375044', '2020-02-22 15:11:54.375044', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (206, 129, 24, '2333', 1, 'webb', 22, '{\"id\": 129, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:11:54\", \"gmt_modified\": \"2020-02-22 15:44:25\", \"is_deleted\": false, \"title\": \"121\", \"workflow_id\": 8, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220017\", \"state_id\": 23, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"webb\", \"relation\": \"webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": true, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"text1\": \"None\"}', 'webb', '2020-02-22 15:44:25.785866', '2020-02-22 15:44:25.785866', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (207, 130, 15, '', 1, 'webb', 15, '{\"id\": 130, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:53:12\", \"gmt_modified\": \"2020-02-22 15:53:12\", \"is_deleted\": false, \"title\": \"\\u7206\\u7834\\u9879\\u76ee\\u7533\\u8bf7\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220018\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p style=\\\"line-height: 16px;\\\"><img src=\\\"/static/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\\\"/><a style=\\\"font-size:12px; color:#0066cc;\\\" href=\\\"/media/upload\\\\202002\\\\\\u603b\\u7ed31582357981696.rar\\\" title=\\\"\\u603b\\u7ed3.rar\\\">\\u603b\\u7ed3.rar</a></p><p>\\u8bf7\\u9886\\u5bfc\\u5ba1\\u9605<br/></p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'webb', '2020-02-22 15:53:12.983091', '2020-02-22 15:53:12.983091', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (208, 131, 15, '', 1, 'webb', 15, '{\"id\": 131, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:54:13\", \"gmt_modified\": \"2020-02-22 15:54:13\", \"is_deleted\": false, \"title\": \"test\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220019\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>ceshi</p><p><img src=\\\"/media/upload\\\\202002\\\\test1582358043592.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"281\\\" height=\\\"340\\\"/></p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 0.2}', 'webb', '2020-02-22 15:54:13.699123', '2020-02-22 15:54:13.699123', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (209, 131, 16, '222', 1, 'lilian', 12, '{\"id\": 131, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:54:13\", \"gmt_modified\": \"2020-02-22 15:54:13\", \"is_deleted\": false, \"title\": \"test\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220019\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"webb,lilian\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>ceshi</p><p><img src=\\\"/media/upload\\\\202002\\\\test1582358043592.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"281\\\" height=\\\"340\\\"/></p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 0.2}', 'lilian', '2020-02-22 16:31:14.448512', '2020-02-22 16:31:14.448512', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (210, 131, 17, '222', 1, 'hr', 13, '{\"id\": 131, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 15:54:13\", \"gmt_modified\": \"2020-02-22 16:31:14\", \"is_deleted\": false, \"title\": \"test\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220019\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"webb,lilian,hr\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>ceshi</p><p><img src=\\\"/media/upload\\\\202002\\\\test1582358043592.PNG\\\" title=\\\"source_file_tile\\\" alt=\\\"test.PNG\\\" width=\\\"281\\\" height=\\\"340\\\"/></p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 0.2}', 'hr', '2020-02-22 16:31:37.454448', '2020-02-22 16:31:37.454448', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (211, 132, 15, '', 1, 'webb', 15, '{\"id\": 132, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 16:32:49\", \"gmt_modified\": \"2020-02-22 16:32:49\", \"is_deleted\": false, \"title\": \"11\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220020\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>22</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'webb', '2020-02-22 16:32:49.707839', '2020-02-22 16:32:49.707839', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (212, 132, 16, '2', 1, 'lilian', 12, '{\"id\": 132, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 16:32:49\", \"gmt_modified\": \"2020-02-22 16:32:49\", \"is_deleted\": false, \"title\": \"11\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220020\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>22</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'lilian', '2020-02-22 16:33:09.387205', '2020-02-22 16:33:09.387205', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (213, 132, 17, '22', 1, 'hr', 13, '{\"id\": 132, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 16:32:49\", \"gmt_modified\": \"2020-02-22 16:33:09\", \"is_deleted\": false, \"title\": \"11\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220020\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"lilian,webb,hr\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>22</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'hr', '2020-02-22 17:56:42.728831', '2020-02-22 17:56:42.728831', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (214, 133, 15, '', 1, 'webb', 15, '{\"id\": 133, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 17:58:04\", \"gmt_modified\": \"2020-02-22 17:58:04\", \"is_deleted\": false, \"title\": \"ww\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220021\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>test</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'webb', '2020-02-22 17:58:04.569218', '2020-02-22 17:58:04.569218', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (215, 133, 16, '同意', 1, 'lilian', 12, '{\"id\": 133, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 17:58:04\", \"gmt_modified\": \"2020-02-22 17:58:04\", \"is_deleted\": false, \"title\": \"ww\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220021\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"lilian\", \"relation\": \"lilian,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>test</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'lilian', '2020-02-22 17:58:30.203151', '2020-02-22 17:58:30.203151', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (216, 133, 17, '22', 1, 'hr', 13, '{\"id\": 133, \"creator\": \"webb\", \"gmt_created\": \"2020-02-22 17:58:04\", \"gmt_modified\": \"2020-02-22 17:58:30\", \"is_deleted\": false, \"title\": \"ww\", \"workflow_id\": 3, \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002220021\", \"state_id\": 13, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"hr\", \"relation\": \"lilian,hr,webb\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"is_end\": false, \"is_rejected\": false, \"multi_all_person\": \"{}\", \"wenben_\": \"<p>test</p>\", \"leixing_\": \"\\u521b\\u65b0\\u9879\\u76ee\", \"jf_\": 1.2}', 'hr', '2020-02-22 17:58:53.466516', '2020-02-22 17:58:53.466516', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (217, 134, 15, '', 1, 'lilian', 15, '{\"participant_type_id\": 1, \"script_run_last_result\": true, \"id\": 134, \"add_node_man\": \"\", \"state_id\": 12, \"is_end\": false, \"leixing_\": \"\\u51fa\\u5dee\", \"participant\": \"lilian\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002250001\", \"is_rejected\": false, \"workflow_id\": 3, \"gmt_created\": \"2020-02-25 14:48:27\", \"gmt_modified\": \"2020-02-25 14:48:27\", \"is_deleted\": false, \"parent_ticket_state_id\": 0, \"jf_\": 1.99, \"relation\": \"lilian\", \"title\": \"12\", \"parent_ticket_id\": 0, \"creator\": \"lilian\", \"wenben_\": \"<p>12</p>\", \"in_add_node\": false, \"multi_all_person\": \"{}\"}', 'lilian', '2020-02-25 14:48:27.934850', '2020-02-25 14:48:27.934850', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (218, 134, 16, '11', 1, 'lilian', 12, '{\"participant_type_id\": 1, \"script_run_last_result\": true, \"id\": 134, \"add_node_man\": \"\", \"state_id\": 12, \"is_end\": false, \"leixing_\": \"\\u51fa\\u5dee\", \"participant\": \"lilian\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002250001\", \"is_rejected\": false, \"workflow_id\": 3, \"gmt_created\": \"2020-02-25 14:48:27\", \"gmt_modified\": \"2020-02-25 14:48:27\", \"is_deleted\": false, \"parent_ticket_state_id\": 0, \"jf_\": 1.99, \"relation\": \"lilian\", \"title\": \"12\", \"parent_ticket_id\": 0, \"creator\": \"lilian\", \"wenben_\": \"<p>12</p>\", \"in_add_node\": false, \"multi_all_person\": \"{}\"}', 'lilian', '2020-02-25 14:48:39.394709', '2020-02-25 14:48:39.394709', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (219, 134, 17, '65', 1, 'hr', 13, '{\"participant_type_id\": 1, \"script_run_last_result\": true, \"id\": 134, \"add_node_man\": \"\", \"state_id\": 13, \"is_end\": false, \"leixing_\": \"\\u51fa\\u5dee\", \"participant\": \"hr\", \"sn\": \"\\u79d1\\u6280\\u53d1\\u5c55\\u4e2d\\u5fc3_202002250001\", \"is_rejected\": false, \"workflow_id\": 3, \"gmt_created\": \"2020-02-25 14:48:27\", \"gmt_modified\": \"2020-02-25 14:48:39\", \"is_deleted\": false, \"parent_ticket_state_id\": 0, \"jf_\": 1.99, \"relation\": \"lilian,hr\", \"title\": \"12\", \"parent_ticket_id\": 0, \"creator\": \"lilian\", \"wenben_\": \"<p>12</p>\", \"in_add_node\": false, \"multi_all_person\": \"{}\"}', 'hr', '2020-02-25 14:49:30.129127', '2020-02-25 14:49:30.129127', 0, 0);

-- ----------------------------
-- Table structure for ticket_ticketrecord
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketrecord`;
CREATE TABLE `ticket_ticketrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `parent_ticket_id` int(11) NOT NULL,
  `parent_ticket_state_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `relation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_node_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_add_node` tinyint(1) NOT NULL,
  `script_run_last_result` tinyint(1) NOT NULL,
  `is_end` tinyint(1) NOT NULL,
  `is_rejected` tinyint(1) NOT NULL,
  `multi_all_person` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketrecord
-- ----------------------------
INSERT INTO `ticket_ticketrecord` VALUES (14, '12', 1, 'loonflow_201805130012', 2, 0, 0, 1, 'zhangsan', 'lilei', '2018-05-13 22:24:41.952132', '2018-08-09 07:33:44.762337', 0, 'lileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileililei', 'lilei', 1, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (15, '请假哈哈22哈', 1, 'loonflow_201805130013', 2, 0, 0, 5, 'creator', 'lilei', '2018-05-13 22:28:21.623510', '2018-05-14 07:07:39.579607', 0, 'lileilileililei', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (16, '请假申请3', 1, 'loonflow_201805130014', 3, 0, 0, 1, 'lilei', 'lilei', '2018-05-13 22:34:12.668018', '2018-05-13 22:34:12.668141', 0, 'lilei', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (17, 'vpn申请2', 2, 'loonflow_201805150001', 10, 0, 0, 3, '1', 'lilei', '2018-05-15 07:16:38.281209', '2018-05-22 07:26:54.685116', 0, 'guiji,wangwu,lilei', 'zhangsan', 1, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (18, 'vpn申请11', 2, 'loonflow_201805150002', 8, 0, 0, 2, 'guiji,wangwu', 'lilei', '2018-05-15 07:37:27.984815', '2018-05-21 19:27:37.550734', 0, 'lilei,guiji,wangwu', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (19, '', 3, '科技发展中心_202002140017', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:38:26.034474', '2020-02-14 21:38:26.034474', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (20, '', 3, '科技发展中心_202002140018', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:39:18.975892', '2020-02-14 21:39:18.975892', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (21, 'test', 1, '科技发展中心_202002140019', 2, 0, 0, 1, 'webb', 'webb', '2020-02-14 21:43:45.886535', '2020-02-14 21:43:45.894515', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (22, '', 3, '科技发展中心_202002140020', 13, 0, 0, 1, 'hr', 'webb', '2020-02-14 21:45:21.170714', '2020-02-14 21:57:12.028833', 0, 'lilian,webb,hr', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (23, '', 3, '科技发展中心_202002140021', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:47:59.781650', '2020-02-14 21:47:59.781650', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (24, '', 3, '科技发展中心_202002140022', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:49:46.982552', '2020-02-14 21:49:46.982552', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (25, 'tess', 3, '科技发展中心_202002140023', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:52:47.178647', '2020-02-14 21:52:47.178647', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (26, 'tes2', 3, '科技发展中心_202002140024', 12, 0, 0, 1, '', 'webb', '2020-02-14 21:56:20.428799', '2020-02-14 21:56:20.428799', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (27, 'yte', 3, '科技发展中心_202002140025', 13, 0, 0, 1, 'hr', 'webb', '2020-02-14 21:59:25.769679', '2020-02-14 21:59:54.680592', 0, 'lilian,webb,hr', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (28, '1', 3, '科技发展中心_202002140026', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:19:26.376225', '2020-02-14 22:19:26.388189', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (29, '333', 4, '科技发展中心_202002140027', 16, 0, 0, 1, '', 'webb', '2020-02-14 22:22:06.927952', '2020-02-14 22:22:06.927952', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (30, '123', 3, '科技发展中心_202002140028', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:23:07.430143', '2020-02-14 22:23:07.437124', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (31, '9999999999999999', 3, '科技发展中心_202002140029', 12, 0, 0, 1, 'lilian', 'lilian', '2020-02-14 22:32:59.209756', '2020-02-14 22:32:59.221724', 0, 'lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (32, '555555555555555555555555555555', 3, '科技发展中心_202002140030', 13, 0, 0, 1, 'hr', 'lilian', '2020-02-14 22:33:32.674775', '2020-02-14 22:33:38.100283', 0, 'lilian,hr', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (33, '333333', 3, '科技发展中心_202002140031', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:37:54.419085', '2020-02-14 22:37:54.426065', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (34, '11', 3, '科技发展中心_202002140032', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:47:15.526089', '2020-02-14 22:47:15.533071', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (35, '12', 3, '科技发展中心_202002140033', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:48:03.894155', '2020-02-14 22:48:03.901136', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (36, '12', 3, '科技发展中心_202002140034', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:49:12.248831', '2020-02-14 22:49:12.256810', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (37, '112', 3, '科技发展中心_202002140035', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:49:51.613418', '2020-02-14 22:49:51.620400', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (38, '12', 3, '科技发展中心_202002140036', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 22:54:12.802749', '2020-02-14 22:54:12.810727', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (39, '12', 3, '科技发展中心_202002140037', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 23:01:41.332990', '2020-02-14 23:01:41.340960', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (40, '12', 3, '科技发展中心_202002140038', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-14 23:01:42.703317', '2020-02-14 23:01:42.711301', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (41, '12', 3, '科技发展中心_202002150001', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 17:48:08.171455', '2020-02-15 17:48:08.181452', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (42, '12', 3, '科技发展中心_202002150004', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 17:54:10.506465', '2020-02-15 17:54:10.515439', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (43, '12', 3, '科技发展中心_202002150005', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 17:58:58.645089', '2020-02-15 17:58:58.652071', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (44, '1', 3, '科技发展中心_202002150006', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.285922', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (45, '1', 3, '科技发展中心_202002150007', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.285922', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (46, '1', 3, '科技发展中心_202002150006', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.285922', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (47, '1', 3, '科技发展中心_202002150006', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.285922', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (48, '1', 3, '科技发展中心_202002150007', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.301557', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (49, '1', 3, '科技发展中心_202002150006', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:09:56.270327', '2020-02-15 18:09:56.301557', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (50, '12', 3, '科技发展中心_202002150008', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:10:29.940153', '2020-02-15 18:10:29.955114', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (51, '44', 3, '科技发展中心_202002150009', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:11:12.475409', '2020-02-15 18:11:12.483494', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (52, '12', 3, '科技发展中心_202002150010', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:14:28.521068', '2020-02-15 18:14:28.529031', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (53, '12', 3, '科技发展中心_202002150011', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.722651', '2020-02-15 18:23:42.816379', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (54, '12', 3, '科技发展中心_202002150011', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.722651', '2020-02-15 18:23:42.832000', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (55, '12', 3, '科技发展中心_202002150011', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.722651', '2020-02-15 18:23:42.816379', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (56, '1', 3, '科技发展中心_202002150011', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.738271', '2020-02-15 18:23:42.832000', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (57, 'we', 3, '科技发展中心_202002150012', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.738271', '2020-02-15 18:23:42.832000', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (58, '1', 3, '科技发展中心_202002150013', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.753893', '2020-02-15 18:23:42.832000', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (59, '1', 3, '科技发展中心_202002150014', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.785136', '2020-02-15 18:23:42.832000', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (60, '1', 3, '科技发展中心_202002150015', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.800758', '2020-02-15 18:23:42.847622', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (61, '1', 3, '科技发展中心_202002150015', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.931892', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (62, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.936880', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (63, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.941866', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (64, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.937877', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (65, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.926909', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (66, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.932889', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (67, '12', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.863243', '2020-02-15 18:23:42.943860', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (68, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.878864', '2020-02-15 18:23:42.961812', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (69, '1', 3, '科技发展中心_202002150016', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:23:42.878864', '2020-02-15 18:23:42.959818', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (70, '21', 3, '科技发展中心_202002150017', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:24:18.736121', '2020-02-15 18:24:18.744124', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (71, '12', 3, '科技发展中心_202002150018', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:46:25.542549', '2020-02-15 18:46:25.551525', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (72, '12', 3, '科技发展中心_202002150019', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:46:33.204965', '2020-02-15 18:46:33.204965', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (73, '12', 3, '科技发展中心_202002150020', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:47:11.982312', '2020-02-15 18:47:11.990292', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (74, '12', 3, '科技发展中心_202002150021', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:49:16.932779', '2020-02-15 18:49:16.941756', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (75, '12', 3, '科技发展中心_202002150022', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 18:56:51.100502', '2020-02-15 18:56:51.104539', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (76, '12', 3, '科技发展中心_202002150023', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:00:53.963916', '2020-02-15 19:00:53.969901', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (77, '22', 3, '科技发展中心_202002150024', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:14:23.600378', '2020-02-15 19:14:23.600378', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (78, '55', 3, '科技发展中心_202002150025', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:19:00.776148', '2020-02-15 19:19:00.785122', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (79, '111111', 3, '科技发展中心_202002150026', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:25:42.815453', '2020-02-15 19:25:42.821437', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (80, '111', 3, '科技发展中心_202002150027', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:28:12.872201', '2020-02-15 19:28:12.882190', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (81, '22', 3, '科技发展中心_202002150028', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:32:26.678732', '2020-02-15 19:32:26.685713', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (82, '22', 3, '科技发展中心_202002150029', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:33:39.371075', '2020-02-15 19:33:39.378031', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (83, '12', 3, '科技发展中心_202002150030', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:35:05.193507', '2020-02-15 19:35:05.198494', 0, 'lilian,webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (84, '1212', 3, '科技发展中心_202002150031', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:35:54.923475', '2020-02-15 19:35:54.931453', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (85, '121', 3, '科技发展中心_202002150032', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:36:51.570715', '2020-02-15 19:36:51.580689', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (86, '222', 3, '科技发展中心_202002150033', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:37:49.879763', '2020-02-15 19:37:49.885746', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (87, '22', 3, '科技发展中心_202002150034', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:40:56.512875', '2020-02-15 19:40:56.517862', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (88, '项目创新', 3, '科技发展中心_202002150035', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:43:21.711556', '2020-02-15 19:43:21.717541', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (89, '项目创新', 3, '科技发展中心_202002150036', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-15 19:45:26.616742', '2020-02-15 19:45:26.622725', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (90, 'test', 4, '科技发展中心_202002150037', 16, 0, 0, 1, '', 'webb', '2020-02-15 19:59:44.176404', '2020-02-15 19:59:44.176404', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (91, '12', 4, '科技发展中心_202002150038', 16, 0, 0, 1, '', 'webb', '2020-02-15 20:02:11.574339', '2020-02-15 20:02:11.575341', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (92, '爆破设计申请', 3, '科技发展中心_202002150039', 14, 0, 0, 1, '', 'webb', '2020-02-15 20:07:44.154231', '2020-02-15 20:09:03.227915', 0, 'hr,webb,lilian', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (93, '22', 4, '科技发展中心_202002180001', 16, 0, 0, 1, '', 'webb', '2020-02-18 20:40:34.207427', '2020-02-18 20:40:34.207427', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (94, 'jieshushu', 4, '科技发展中心_202002180002', 16, 0, 0, 1, '', 'webb', '2020-02-18 20:46:01.882353', '2020-02-18 20:46:01.882353', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (95, '121212', 4, '科技发展中心_202002180003', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 20:47:47.371781', '2020-02-18 20:47:51.220436', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (96, 'ts123', 4, '科技发展中心_202002180004', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:36:12.480552', '2020-02-18 21:36:43.136230', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (97, 't3', 4, '科技发展中心_202002180005', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:40:09.897993', '2020-02-18 21:40:57.099641', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (98, 'tes', 4, '科技发展中心_202002180006', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:46:40.685614', '2020-02-18 21:46:40.698579', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (99, 'tes', 4, '科技发展中心_202002180006', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:46:40.689603', '2020-02-18 21:46:40.700574', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (100, '123', 4, '科技发展中心_202002180007', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:46:40.691598', '2020-02-18 21:46:40.716530', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (101, 'tes123', 4, '科技发展中心_202002180007', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:46:40.694590', '2020-02-18 21:46:40.717528', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (102, 'tes', 4, '科技发展中心_202002180006', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:46:40.697582', '2020-02-18 21:46:40.715534', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (103, '123', 4, '科技发展中心_202002180007', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:47:06.330802', '2020-02-18 21:47:29.269372', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (104, '12333', 4, '科技发展中心_202002180008', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:50:09.048575', '2020-02-18 21:50:13.760265', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (105, '123444', 4, '科技发展中心_202002180009', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:54:04.320491', '2020-02-18 21:54:10.865722', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (106, '2323', 4, '科技发展中心_202002180010', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:54:38.783835', '2020-02-18 21:54:38.794806', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (107, '0909', 4, '科技发展中心_202002180011', 17, 0, 0, 1, 'webb', 'webb', '2020-02-18 21:57:14.500651', '2020-02-18 21:57:14.507629', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (109, '233', 8, '科技发展中心_202002180013', 23, 0, 0, 1, 'webb', 'webb', '2020-02-18 22:12:14.099085', '2020-02-18 22:12:23.959165', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (110, '23334', 8, '科技发展中心_202002180014', 23, 0, 0, 1, 'webb', 'webb', '2020-02-18 22:14:49.541306', '2020-02-18 22:15:08.219875', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (111, '443', 8, '科技发展中心_202002180015', 22, 0, 0, 1, 'webb', 'webb', '2020-02-18 22:26:37.382681', '2020-02-18 22:26:37.390660', 0, 'webb', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (112, '12', 8, '科技发展中心_202002190001', 23, 0, 0, 1, 'webb', 'webb', '2020-02-19 16:40:33.709968', '2020-02-22 11:05:22.952485', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (113, '2222', 8, '科技发展中心_202002220001', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 11:07:57.805858', '2020-02-22 11:08:02.365216', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (114, '439', 8, '科技发展中心_202002220002', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 11:15:10.300496', '2020-02-22 11:22:36.962838', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (115, '223', 8, '科技发展中心_202002220003', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 11:25:18.254003', '2020-02-22 12:11:41.748741', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (116, '121212', 8, '科技发展中心_202002220004', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:24:59.613021', '2020-02-22 12:25:04.503391', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (117, '2323', 8, '科技发展中心_202002220005', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:30:09.369617', '2020-02-22 12:30:14.246395', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (118, '232', 8, '科技发展中心_202002220006', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:31:14.434074', '2020-02-22 12:31:18.515197', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (119, '222', 8, '科技发展中心_202002220007', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:32:47.027794', '2020-02-22 12:32:51.018130', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (120, '121212', 8, '科技发展中心_202002220008', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:34:41.583399', '2020-02-22 12:34:48.733813', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (121, '1212', 8, '科技发展中心_202002220009', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:35:50.538234', '2020-02-22 12:35:54.361223', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (122, '222', 8, '科技发展中心_202002220010', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:36:41.966173', '2020-02-22 12:36:45.356888', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (123, '121', 8, '科技发展中心_202002220011', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 12:38:22.467511', '2020-02-22 12:38:26.740714', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (124, '12', 8, '科技发展中心_202002220012', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 13:16:35.101322', '2020-02-22 13:16:39.093644', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (125, '222', 8, '科技发展中心_202002220013', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 13:18:28.663448', '2020-02-22 13:18:32.414416', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (126, '222', 8, '科技发展中心_202002220014', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 13:22:32.571736', '2020-02-22 13:22:35.802096', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (127, '12', 8, '科技发展中心_202002220015', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 14:33:31.824176', '2020-02-22 14:35:45.451242', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (128, '66', 8, '科技发展中心_202002220016', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 14:38:27.475161', '2020-02-22 14:40:20.189007', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (129, '121', 8, '科技发展中心_202002220017', 23, 0, 0, 1, 'webb', 'webb', '2020-02-22 15:11:54.338630', '2020-02-22 15:44:25.763731', 0, 'webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (130, '爆破项目申请', 3, '科技发展中心_202002220018', 12, 0, 0, 1, 'lilian', 'webb', '2020-02-22 15:53:12.927154', '2020-02-22 15:53:12.933136', 0, 'webb,lilian', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (131, 'test', 3, '科技发展中心_202002220019', 14, 0, 0, 1, '', 'webb', '2020-02-22 15:54:13.638008', '2020-02-22 16:31:37.439493', 0, 'webb,lilian,hr', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (132, '11', 3, '科技发展中心_202002220020', 14, 0, 0, 1, '', 'webb', '2020-02-22 16:32:49.650990', '2020-02-22 17:56:42.693921', 0, 'lilian,webb,hr', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (133, 'ww', 3, '科技发展中心_202002220021', 14, 0, 0, 1, '', 'webb', '2020-02-22 17:58:04.510376', '2020-02-22 17:58:53.449563', 0, 'lilian,hr,webb', '', 0, 1, 1, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (134, '12', 3, '科技发展中心_202002250001', 14, 0, 0, 1, '', 'lilian', '2020-02-25 14:48:27.766783', '2020-02-25 14:49:30.116160', 0, 'lilian,hr', '', 0, 1, 1, 0, '{}');

-- ----------------------------
-- Table structure for ticket_year_index
-- ----------------------------
DROP TABLE IF EXISTS `ticket_year_index`;
CREATE TABLE `ticket_year_index`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `float_value` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_year_index
-- ----------------------------
INSERT INTO `ticket_year_index` VALUES (1, 0, 'test', 123, 'we-1231', '2020-02-22 11:25:18.000000', '2019-02-22 11:25:18.000000', 12.1);
INSERT INTO `ticket_year_index` VALUES (2, 0, 'test', 123, 'we-1231', '2019-02-22 11:25:18.000000', '2009-02-22 11:25:18.000000', 12.1);
INSERT INTO `ticket_year_index` VALUES (3, 0, 'test', 123, 'we-1231', '2020-02-22 11:25:18.000000', '2020-02-22 11:25:18.000000', 12.1);
INSERT INTO `ticket_year_index` VALUES (4, 0, 'test', 1, '1', '2020-02-22 11:25:18.000000', '2020-02-22 11:25:18.000000', 2.1);
INSERT INTO `ticket_year_index` VALUES (5, 0, 'test', 1, '1', '2020-02-22 11:25:18.000000', '2020-02-22 11:25:18.000000', 2.1);
INSERT INTO `ticket_year_index` VALUES (6, 0, 'test', 1, '1', '2019-02-22 11:25:18.000000', '2020-02-22 11:25:18.000000', 2.1);
INSERT INTO `ticket_year_index` VALUES (7, 0, 'test', 1, '1', '2020-02-22 11:25:18.000000', '2020-02-22 11:25:18.000000', 2.1);
INSERT INTO `ticket_year_index` VALUES (8, 0, 'webb', 8, '科技发展中心_202002220015', '2020-02-22 14:33:31.824176', '2020-02-22 14:33:31.831157', 8.8);
INSERT INTO `ticket_year_index` VALUES (9, 0, 'webb', 8, '科技发展中心_202002220015', '2020-02-22 14:33:31.824176', '2020-02-22 14:33:31.831157', 8.8);
INSERT INTO `ticket_year_index` VALUES (10, 0, 'webb', 8, '科技发展中心_202002220015', '2020-02-22 14:33:31.824176', '2020-02-22 14:33:31.831157', 8.8);
INSERT INTO `ticket_year_index` VALUES (11, 0, 'webb', 8, '科技发展中心_202002220016', '2020-02-22 14:38:27.475161', '2020-02-22 14:38:27.481042', 8.8);
INSERT INTO `ticket_year_index` VALUES (12, 0, 'webb', 8, '科技发展中心_202002220017', '2019-02-22 15:11:54.338630', '2020-02-22 15:44:25.000000', 8.8);
INSERT INTO `ticket_year_index` VALUES (13, 0, 'webb', 3, '科技发展中心_202002220019', '2020-02-22 15:54:13.638008', '2020-02-22 16:31:37.000000', 8.8);
INSERT INTO `ticket_year_index` VALUES (14, 0, 'webb', 3, '科技发展中心_202002220020', '2020-02-22 16:32:49.650990', '2020-02-22 17:56:42.000000', 8.8);
INSERT INTO `ticket_year_index` VALUES (15, 0, 'webb', 3, '科技发展中心_202002220021', '2020-02-22 17:58:04.510376', '2020-02-22 17:58:53.000000', 1.2);
INSERT INTO `ticket_year_index` VALUES (16, 0, 'wang', 3, '科技发展中心_202002220021', '2019-02-22 17:58:04.510376', '2020-02-22 17:58:53.000000', 1.2);
INSERT INTO `ticket_year_index` VALUES (17, 0, 'chen', 3, '科技发展中心_202002220021', '2020-02-22 17:58:04.510376', '2009-02-22 17:58:53.000000', 1.2);
INSERT INTO `ticket_year_index` VALUES (18, 0, 'lilian', 3, '科技发展中心_202002250001', '2020-02-25 14:48:27.766783', '2020-02-25 14:49:30.000000', 1.99);

-- ----------------------------
-- Table structure for workflow_customfield
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customfield`;
CREATE TABLE `workflow_customfield`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_template` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `boolean_field_display` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_choice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_customfield
-- ----------------------------
INSERT INTO `workflow_customfield` VALUES (1, 1, 30, 'leave_start', '开始时间', 20, NULL, '', '', '{}', 'admin', '2018-04-23 20:56:25.940486', '2018-05-11 07:31:11.133782', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (2, 1, 30, 'leave_end', '结束时间', 25, NULL, '', '', '{}', 'admin', '2018-05-10 07:41:03.717540', '2018-05-11 07:31:19.923554', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (3, 1, 5, 'leave_days', '请假天数(0.5的倍数)', 30, NULL, '前端根据起止时间自动计算', '', '{}', 'admin', '2018-05-11 07:28:31.649506', '2018-05-11 07:31:28.835612', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (4, 1, 60, 'leave_proxy', '代理人', 35, NULL, '请假期间的代理人', '', '{}', 'admin', '2018-05-11 07:31:01.068850', '2018-05-11 07:31:35.323117', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (5, 1, 35, 'leave_type', '请假类型', 40, NULL, '', '', '{}', 'admin', '2018-05-11 07:34:29.608579', '2018-05-23 22:38:57.324916', 0, '{\"1\": \"年假\", \"2\": \"调休\", \"3\": \"病假\", \"4\": \"婚假\"}', '');
INSERT INTO `workflow_customfield` VALUES (6, 1, 55, 'leave_reason', '请假原因及相关附件', 45, NULL, '', '病假请提供证明拍照附件， 婚假请提供结婚证拍照附件', '{}', 'admin', '2018-05-11 07:36:41.882377', '2018-05-11 07:36:41.882413', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (7, 2, 55, 'vpn_reason', '申请原因', 110, '请填写申请vpn的理由', 'vpn申请原因', '', '{}', 'admin', '2018-05-12 10:02:31.501142', '2018-05-12 10:02:31.501189', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (8, 3, 55, 'wenben_', '申请材料', 110, 'test', '', '', '{}', 'admin', '2020-02-14 21:25:45.073503', '2020-02-14 21:25:45.073503', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (9, 3, 35, 'leixing_', '申请类型', 21, 'test4', '申请类型', '', '{}', 'admin', '2020-02-14 21:31:10.149823', '2020-02-14 21:31:10.149823', 0, '{\"出差\":\"出差\",\"创新项目\":\"创新项目\",\"其他业绩\":\"其他业绩\"}', '{}');
INSERT INTO `workflow_customfield` VALUES (10, 4, 35, 'test_text', 'ceshi', 1, '', 'ceshi', '', '{}', 'admin', '2020-02-14 22:20:11.811712', '2020-02-14 22:20:11.811712', 0, '{\"中国\":\"中国\",\"美国\":\"美国\"}', '{}');
INSERT INTO `workflow_customfield` VALUES (11, 8, 5, 'text1', '随便', 0, '', '', '', '{}', 'admin', '2020-02-18 22:09:32.561863', '2020-02-18 22:09:32.561881', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (12, 3, 15, 'jf_', '申请积分', 66, '', '数字', '', '{}', 'admin', '2020-02-22 15:49:45.704141', '2020-02-22 15:49:45.704141', 0, '{}', '{}');

-- ----------------------------
-- Table structure for workflow_customnotice
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customnotice`;
CREATE TABLE `workflow_customnotice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `script` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_template` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_customnotice
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_state
-- ----------------------------
DROP TABLE IF EXISTS `workflow_state`;
CREATE TABLE `workflow_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sub_workflow_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `distribute_type_id` int(11) NOT NULL,
  `state_field_str` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `remember_last_man_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_state
-- ----------------------------
INSERT INTO `workflow_state` VALUES (1, '新建中', 1, 0, 0, 0, 1, 1, 'wangfei', 1, '{\"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"leave_reason\":2}', '{}', 'admin', '2018-04-23 20:53:33.052134', '2018-05-13 11:42:11.273695', 0, 0);
INSERT INTO `workflow_state` VALUES (2, '发起人-编辑中', 1, 0, 1, 2, 0, 5, 'creator', 1, '{\"sn\":1,  \"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":2, \"state.state_name\":1}', '{}', 'admin', '2018-04-30 15:45:48.976712', '2018-05-14 06:44:10.661777', 0, 0);
INSERT INTO `workflow_state` VALUES (3, 'TL审批中', 1, 0, 0, 3, 0, 5, 'creator_tl', 1, '{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}', '{}', 'admin', '2018-04-30 15:46:42.184252', '2018-05-13 11:42:46.035705', 0, 0);
INSERT INTO `workflow_state` VALUES (4, '人事部门-处理中', 1, 0, 0, 4, 0, 1, 'jack', 1, '{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}', '{}', 'admin', '2018-04-30 15:47:58.790510', '2018-05-13 11:42:59.834440', 0, 0);
INSERT INTO `workflow_state` VALUES (5, '结束', 1, 0, 0, 6, 2, 0, '', 1, '{}', '{}', 'admin', '2018-04-30 15:51:41.260309', '2018-05-11 06:52:39.799922', 0, 0);
INSERT INTO `workflow_state` VALUES (6, '发起人-新建中', 2, 0, 0, 1, 1, 5, 'creator', 1, '{\"vpn_reason\":2, \"title\":2}', '{}', 'admin', '2018-05-10 07:34:45.302697', '2018-05-15 07:13:06.599270', 0, 0);
INSERT INTO `workflow_state` VALUES (7, '发起人tl-审批中', 2, 0, 0, 2, 0, 5, 'creator_tl', 2, '{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1}', '{}', 'admin', '2018-05-11 06:47:36.381658', '2018-05-15 07:19:16.038155', 0, 0);
INSERT INTO `workflow_state` VALUES (8, '运维人员-审批中', 2, 0, 0, 3, 0, 3, '3', 1, '{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1,\"participant_info.participant_alias\":1,\"participant_info.participant_name\":1}', '{}', 'admin', '2018-05-11 06:48:26.945117', '2018-07-14 11:23:28.865836', 0, 0);
INSERT INTO `workflow_state` VALUES (9, '授权脚本-自动执行中', 2, 0, 0, 4, 0, 6, '1', 1, '{}', '{}', 'admin', '2018-05-11 06:50:09.416344', '2018-05-11 07:10:25.197748', 0, 0);
INSERT INTO `workflow_state` VALUES (10, '发起人-确认中', 2, 0, 0, 6, 0, 5, 'creator', 1, '{\"workflow.workflow_name\":1,\"sn\":1,\"state.state_name\":1,\"participant_info.participant_name\":1}', '{}', 'admin', '2018-05-11 06:51:02.913212', '2018-05-22 22:21:51.867707', 0, 0);
INSERT INTO `workflow_state` VALUES (11, '结束', 2, 0, 0, 7, 2, 0, '', 1, '{}', '{}', 'admin', '2018-05-11 07:11:53.076731', '2018-05-11 07:11:53.076766', 0, 0);
INSERT INTO `workflow_state` VALUES (12, '项目负责人审批', 3, 0, 0, 1, 0, 1, 'lilian', 1, '{\"leixing_\":1,\"wenben_\":1}', '{}', 'admin', '2020-02-14 21:34:23.376833', '2020-02-14 21:34:23.376833', 0, 0);
INSERT INTO `workflow_state` VALUES (13, '部门负责人审批', 3, 0, 0, 2, 0, 1, 'hr', 1, '{\"leixing_\":1,\"wenben_\":1}', '{}', 'admin', '2020-02-14 21:34:45.525886', '2020-02-14 21:34:45.525886', 0, 0);
INSERT INTO `workflow_state` VALUES (14, '结束', 3, 0, 0, 3, 2, 1, '', 1, '{\"leixing_\":1,\"wenben_\":1}', '{}', 'admin', '2020-02-14 21:35:03.286336', '2020-02-14 21:35:03.286336', 0, 0);
INSERT INTO `workflow_state` VALUES (15, '申请人提交', 3, 0, 0, 0, 1, 1, '', 1, '{\"creator\":1,\"title\":2,\"jf_\":2,\"wenben_\":2,\"leixing_\":2,\"gmt_created\":1}', '{}', 'admin', '2020-02-14 21:35:33.771338', '2020-02-14 21:35:33.771338', 0, 0);
INSERT INTO `workflow_state` VALUES (16, 'tijiao', 4, 0, 0, 0, 1, 1, 'webb', 1, '{\"test_text\":1,\"title\":1}', '{}', 'admin', '2020-02-14 22:20:47.647875', '2020-02-14 22:20:47.647875', 1, 0);
INSERT INTO `workflow_state` VALUES (17, 'jieshu', 4, 0, 0, 1, 2, 1, 'webb', 1, '{\"title\":2}', '{}', 'admin', '2020-02-18 20:45:28.397956', '2020-02-18 20:45:28.397956', 1, 0);
INSERT INTO `workflow_state` VALUES (18, 'self', 4, 0, 0, 0, 1, 1, 'webb', 1, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:00:27.154422', '2020-02-18 22:00:27.154422', 0, 0);
INSERT INTO `workflow_state` VALUES (19, 'to', 4, 0, 0, 1, 0, 1, 'webb', 1, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:00:45.775777', '2020-02-18 22:00:45.775777', 0, 0);
INSERT INTO `workflow_state` VALUES (20, 'end', 4, 0, 0, 2, 2, 1, 'webb', 1, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:01:04.401538', '2020-02-18 22:01:04.401538', 0, 0);
INSERT INTO `workflow_state` VALUES (21, '编辑中', 8, 0, 0, 0, 1, 1, 'webb', 1, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:09:55.545815', '2020-02-18 22:09:55.545815', 0, 0);
INSERT INTO `workflow_state` VALUES (22, '审批中', 8, 0, 0, 1, 0, 1, 'webb', 2, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:10:40.569515', '2020-02-18 22:10:40.569515', 0, 0);
INSERT INTO `workflow_state` VALUES (23, '结束', 8, 0, 0, 2, 2, 1, 'webb', 2, '{\"title\":2}', '{}', 'admin', '2020-02-18 22:10:55.266343', '2020-02-18 22:10:55.266343', 0, 0);

-- ----------------------------
-- Table structure for workflow_transition
-- ----------------------------
DROP TABLE IF EXISTS `workflow_transition`;
CREATE TABLE `workflow_transition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `transition_type_id` int(11) NOT NULL,
  `source_state_id` int(11) NOT NULL,
  `destination_state_id` int(11) NOT NULL,
  `alert_enable` tinyint(1) NOT NULL,
  `alert_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_require_check` tinyint(1) NOT NULL,
  `timer` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `condition_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_transition
-- ----------------------------
INSERT INTO `workflow_transition` VALUES (1, '提交', 1, 1, 1, 3, 0, '', 'admin', '2018-04-24 07:09:25.922814', '2018-04-30 15:48:57.047369', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (2, '保存', 1, 1, 1, 2, 0, '', 'admin', '2018-04-30 15:30:25.650813', '2018-04-30 15:48:52.372363', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (3, '同意', 1, 1, 3, 4, 0, '', 'admin', '2018-04-30 15:49:23.451582', '2018-04-30 15:49:23.451627', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (4, '拒绝', 1, 1, 3, 2, 1, '请确认是否真的拒绝', 'admin', '2018-04-30 15:54:32.069649', '2018-05-11 07:00:24.370322', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (5, '同意', 1, 1, 4, 5, 0, '', 'admin', '2018-04-30 15:55:00.072437', '2018-05-11 07:03:29.349770', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (6, '退回', 1, 1, 4, 2, 0, '', 'admin', '2018-05-11 06:58:43.395655', '2018-05-11 07:04:14.896678', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (7, '提交', 2, 1, 6, 7, 0, '', 'admin', '2018-05-11 07:06:22.745312', '2018-05-11 07:06:22.745342', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (8, '同意', 2, 1, 7, 8, 0, '', 'admin', '2018-05-11 07:07:33.213731', '2018-05-11 07:07:33.213760', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (9, '同意', 2, 1, 8, 9, 0, '', 'admin', '2018-05-11 07:12:53.036037', '2018-05-11 07:12:53.036077', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (10, '脚本执行完成', 2, 1, 9, 10, 0, '', 'admin', '2018-05-11 07:13:12.070223', '2018-05-11 07:13:12.070254', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (11, '确认完成', 2, 1, 10, 11, 0, '', 'admin', '2018-05-11 07:13:52.427815', '2018-05-11 07:13:52.427844', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (12, '未生效', 2, 1, 10, 8, 1, '是否真的退回？  请查看vpn使用文档保证使用姿势正确，再退回', 'admin', '2018-05-11 07:16:26.826525', '2018-05-11 07:16:36.072876', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (13, '提交', 1, 1, 2, 3, 0, '', 'admin', '2018-05-13 22:34:55.808381', '2018-05-13 22:34:55.808461', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (14, '保存', 1, 1, 2, 2, 0, '', 'admin', '2018-05-13 22:35:05.020546', '2018-05-13 22:35:05.020615', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (15, '提交', 3, 1, 15, 12, 0, '', 'admin', '2020-02-14 21:36:02.930108', '2020-02-14 21:36:02.930108', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (16, '同意', 3, 1, 12, 13, 0, '', 'admin', '2020-02-14 21:36:16.747303', '2020-02-14 21:36:16.747303', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (17, '同意', 3, 1, 13, 14, 0, '', 'admin', '2020-02-14 21:36:34.107874', '2020-02-14 21:36:34.107874', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (18, '同意', 4, 1, 16, 16, 0, '', 'admin', '2020-02-14 22:21:57.074221', '2020-02-14 22:21:57.074221', 1, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (19, '', 4, 1, 16, 16, 0, '', 'admin', '2020-02-18 20:46:56.522175', '2020-02-18 20:46:56.522175', 1, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (20, '同意', 4, 1, 16, 17, 0, '', 'admin', '2020-02-18 20:47:27.995601', '2020-02-18 20:47:27.995601', 1, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (21, '提交', 4, 1, 18, 19, 0, '', 'admin', '2020-02-18 22:01:59.817716', '2020-02-18 22:01:59.817716', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (22, '转发', 4, 1, 19, 20, 0, '', 'admin', '2020-02-18 22:02:08.910253', '2020-02-18 22:02:08.910253', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (23, '提交', 8, 1, 21, 22, 0, '', 'admin', '2020-02-18 22:11:11.400198', '2020-02-18 22:11:11.400198', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (24, '同意', 8, 1, 22, 23, 0, '', 'admin', '2020-02-18 22:11:22.319434', '2020-02-18 22:11:22.319434', 0, 0, 0, 1, '[]');

-- ----------------------------
-- Table structure for workflow_workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflow`;
CREATE TABLE `workflow_workflow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flowchart` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_form_str` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `view_permission_check` tinyint(1) NOT NULL,
  `limit_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notices` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_workflow
-- ----------------------------
INSERT INTO `workflow_workflow` VALUES (1, '请假申请', '请假申请', '', '[\"sn\", \"title\", \"leave_start\", \"leave_end\", \"leave_days\", \"leave_proxy\",  \"leave_type\", \"creator\", \"gmt_created\", \"leave_reason\"]', 'admin', '2018-04-23 20:49:32.229386', '2018-10-22 08:05:15.574860', 0, 0, '{}', '2');
INSERT INTO `workflow_workflow` VALUES (2, 'vpn申请', 'vpn权限申请', 'flowchart/WechatIMG242_YpFQb5K.jpeg', '[\"sn\", \"title\", \"model\", \"gmt_created\",\"participant.participant_alias\"]', 'admin', '2018-05-06 12:32:36.690665', '2018-07-14 11:18:48.975018', 0, 1, '{}', '');
INSERT INTO `workflow_workflow` VALUES (3, '业绩积分申请', '业绩积分申请', '', '[\"sn\", \"title\", \"sn\", \"creator\", \"gmt_created\", \"jf_\",\"leixing_\",\"wenben_\"]', 'admin', '2020-02-14 21:25:00.972138', '2020-02-14 21:25:00.973135', 0, 0, '{}', '');
INSERT INTO `workflow_workflow` VALUES (4, '测试', '', '', '[\"test_text\"]', 'admin', '2020-02-14 22:18:50.092257', '2020-02-14 22:18:50.092257', 1, 0, '{}', '');
INSERT INTO `workflow_workflow` VALUES (5, '', '', '', '', 'admin', '2020-02-15 17:51:21.853213', '2020-02-15 17:51:21.853213', 1, 1, '', '');
INSERT INTO `workflow_workflow` VALUES (6, '', '', '', '', 'admin', '2020-02-15 17:51:25.643413', '2020-02-15 17:51:25.643413', 1, 1, '', '');
INSERT INTO `workflow_workflow` VALUES (7, '', '', '', '', 'admin', '2020-02-15 17:51:58.125347', '2020-02-15 17:51:58.125347', 1, 1, '', '');
INSERT INTO `workflow_workflow` VALUES (8, '出差审批', '', '', '[]', 'admin', '2020-02-18 22:08:36.864635', '2020-02-18 22:08:36.864635', 0, 0, '{}', '');

-- ----------------------------
-- Table structure for workflow_workflowscript
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflowscript`;
CREATE TABLE `workflow_workflowscript`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saved_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_workflowscript
-- ----------------------------
INSERT INTO `workflow_workflowscript` VALUES (1, 'demo脚本', 'demo_script.py', '示例脚本', 1, 'admin', '2019-11-05 00:00:00.000000', '2019-11-05 00:00:00.000000', 0);

-- ----------------------------
-- Table structure for year_index
-- ----------------------------
DROP TABLE IF EXISTS `year_index`;
CREATE TABLE `year_index`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `float_value` float(255, 1) NOT NULL,
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of year_index
-- ----------------------------
INSERT INTO `year_index` VALUES (1, '1', '2020-02-06 12:32:21.000000', '2020-02-14 12:32:24.000000', 12.1, '1', 1);

SET FOREIGN_KEY_CHECKS = 1;
