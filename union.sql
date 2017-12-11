/*
Navicat MySQL Data Transfer

Source Server         : vagrant
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : union

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-11 18:01:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_config`
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_config
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, '2017-12-11 02:13:06');
INSERT INTO `admin_menu` VALUES ('2', '0', '2', '管理员管理', 'fa-tasks', null, null, '2017-12-11 02:11:47');
INSERT INTO `admin_menu` VALUES ('3', '2', '3', '用户', 'fa-users', 'auth/users', null, '2017-12-11 02:12:08');
INSERT INTO `admin_menu` VALUES ('4', '2', '4', '角色', 'fa-user', 'auth/roles', null, '2017-12-11 02:12:27');
INSERT INTO `admin_menu` VALUES ('5', '2', '5', '权限', 'fa-ban', 'auth/permissions', null, '2017-12-11 02:12:38');
INSERT INTO `admin_menu` VALUES ('6', '2', '6', '菜单', 'fa-bars', 'auth/menu', null, '2017-12-11 02:12:46');
INSERT INTO `admin_menu` VALUES ('7', '2', '7', '操作日志', 'fa-history', 'auth/logs', null, '2017-12-11 02:12:57');
INSERT INTO `admin_menu` VALUES ('8', '0', '7', 'Helpers', 'fa-gears', '', '2017-12-11 02:14:25', '2017-12-11 02:14:25');
INSERT INTO `admin_menu` VALUES ('9', '8', '8', 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', '2017-12-11 02:14:26', '2017-12-11 02:14:26');
INSERT INTO `admin_menu` VALUES ('10', '8', '9', 'Database terminal', 'fa-database', 'helpers/terminal/database', '2017-12-11 02:14:26', '2017-12-11 02:14:26');
INSERT INTO `admin_menu` VALUES ('11', '8', '10', 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', '2017-12-11 02:14:26', '2017-12-11 02:14:26');
INSERT INTO `admin_menu` VALUES ('12', '8', '11', 'Routes', 'fa-list-alt', 'helpers/routes', '2017-12-11 02:14:26', '2017-12-11 02:14:26');
INSERT INTO `admin_menu` VALUES ('13', '0', '12', 'Media manager', 'fa-file', 'media', '2017-12-11 02:15:55', '2017-12-11 02:15:55');
INSERT INTO `admin_menu` VALUES ('14', '0', '13', 'Api tester', 'fa-sliders', 'api-tester', '2017-12-11 02:17:55', '2017-12-11 02:17:55');
INSERT INTO `admin_menu` VALUES ('15', '0', '14', 'Config', 'fa-toggle-on', 'config', '2017-12-11 02:20:27', '2017-12-11 02:20:27');
INSERT INTO `admin_menu` VALUES ('16', '0', '15', 'Scheduling', 'fa-clock-o', 'scheduling', '2017-12-11 02:21:12', '2017-12-11 02:21:12');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.33.1', '[]', '2017-12-11 01:36:11', '2017-12-11 01:36:11');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 01:36:17', '2017-12-11 01:36:17');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/roles', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 01:36:19', '2017-12-11 01:36:19');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/permissions', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 01:36:20', '2017-12-11 01:36:20');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 01:36:20', '2017-12-11 01:36:20');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 01:36:24', '2017-12-11 01:36:24');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:09:15', '2017-12-11 02:09:15');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:09:17', '2017-12-11 02:09:17');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:09:19', '2017-12-11 02:09:19');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:09:30', '2017-12-11 02:09:30');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin', 'GET', '192.168.33.1', '[]', '2017-12-11 02:10:55', '2017-12-11 02:10:55');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:10:57', '2017-12-11 02:10:57');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:02', '2017-12-11 02:11:02');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/permissions', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:04', '2017-12-11 02:11:04');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/roles', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:05', '2017-12-11 02:11:05');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:07', '2017-12-11 02:11:07');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:13', '2017-12-11 02:11:13');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:21', '2017-12-11 02:11:21');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:25', '2017-12-11 02:11:25');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu/2', 'PUT', '192.168.33.1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:11:47', '2017-12-11 02:11:47');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:11:47', '2017-12-11 02:11:47');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:11:51', '2017-12-11 02:11:51');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu/3', 'PUT', '192.168.33.1', '{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:12:08', '2017-12-11 02:12:08');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:12:08', '2017-12-11 02:12:08');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:12:12', '2017-12-11 02:12:12');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu/4', 'PUT', '192.168.33.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:12:27', '2017-12-11 02:12:27');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:12:27', '2017-12-11 02:12:27');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu/5/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:12:30', '2017-12-11 02:12:30');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu/5', 'PUT', '192.168.33.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:12:37', '2017-12-11 02:12:37');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:12:38', '2017-12-11 02:12:38');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:12:41', '2017-12-11 02:12:41');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/menu/6', 'PUT', '192.168.33.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:12:46', '2017-12-11 02:12:46');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:12:46', '2017-12-11 02:12:46');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/menu/7/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:12:48', '2017-12-11 02:12:48');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/auth/menu/7', 'PUT', '192.168.33.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:12:57', '2017-12-11 02:12:57');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:12:57', '2017-12-11 02:12:57');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:12:59', '2017-12-11 02:12:59');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/menu/1', 'PUT', '192.168.33.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/union.com\\/admin\\/auth\\/menu\"}', '2017-12-11 02:13:06', '2017-12-11 02:13:06');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:13:06', '2017-12-11 02:13:06');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '[]', '2017-12-11 02:13:09', '2017-12-11 02:13:09');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:13:15', '2017-12-11 02:13:15');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/users', 'GET', '192.168.33.1', '[]', '2017-12-11 02:14:44', '2017-12-11 02:14:44');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/helpers/scaffold', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:14:51', '2017-12-11 02:14:51');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/helpers/routes', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:14:56', '2017-12-11 02:14:56');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/helpers/terminal/artisan', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:14:58', '2017-12-11 02:14:58');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/helpers/terminal/artisan', 'POST', '192.168.33.1', '{\"c\":\"route:list\",\"_token\":\"pfZRCRUamYsOEYaV3Z0OKpZxARSVdK2c3yyqwdeH\"}', '2017-12-11 02:15:06', '2017-12-11 02:15:06');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/helpers/terminal/artisan', 'GET', '192.168.33.1', '[]', '2017-12-11 02:21:16', '2017-12-11 02:21:16');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/config', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:20', '2017-12-11 02:21:20');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/config/create', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:23', '2017-12-11 02:21:23');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/config', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:27', '2017-12-11 02:21:27');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/media', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:29', '2017-12-11 02:21:29');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/api-tester', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:31', '2017-12-11 02:21:31');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/config', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:31', '2017-12-11 02:21:31');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/api-tester', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:33', '2017-12-11 02:21:33');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/scheduling', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 02:21:34', '2017-12-11 02:21:34');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 03:20:13', '2017-12-11 03:20:13');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/auth/users', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 03:20:16', '2017-12-11 03:20:16');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/auth/roles', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 03:20:17', '2017-12-11 03:20:17');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/auth/permissions', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 03:20:17', '2017-12-11 03:20:17');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/auth/menu', 'GET', '192.168.33.1', '{\"_pjax\":\"#pjax-container\"}', '2017-12-11 03:20:18', '2017-12-11 03:20:18');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', 'Admin helpers', 'ext.helpers', null, '/helpers/*', '2017-12-11 02:14:26', '2017-12-11 02:14:26');
INSERT INTO `admin_permissions` VALUES ('7', 'Media manager', 'ext.media-manager', null, '/media*', '2017-12-11 02:15:55', '2017-12-11 02:15:55');
INSERT INTO `admin_permissions` VALUES ('8', 'Api tester', 'ext.api-tester', null, '/api-tester*', '2017-12-11 02:17:55', '2017-12-11 02:17:55');
INSERT INTO `admin_permissions` VALUES ('9', 'Admin Config', 'ext.config', null, '/config*', '2017-12-11 02:20:27', '2017-12-11 02:20:27');
INSERT INTO `admin_permissions` VALUES ('10', 'Scheduling', 'ext.scheduling', null, '/scheduling*', '2017-12-11 02:21:12', '2017-12-11 02:21:12');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2017-12-11 01:34:31', '2017-12-11 01:34:31');

-- ----------------------------
-- Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$Ui8/PHH15veWYtW8RO3WdeWC1AXAoJZDqvKcBf5yrjrvFGFdWmq2C', 'Administrator', null, null, '2017-12-11 01:34:31', '2017-12-11 01:34:31');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2017_07_17_040159_create_config_table', '2');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `union_users`
-- ----------------------------
DROP TABLE IF EXISTS `union_users`;
CREATE TABLE `union_users` (
  `uuid` varchar(32) NOT NULL COMMENT '编号',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of union_users
-- ----------------------------
INSERT INTO `union_users` VALUES ('123123', '123123', '123123213', null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
