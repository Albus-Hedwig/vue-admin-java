/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : vue-admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-20 18:59:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `title` varchar(255) DEFAULT NULL COMMENT '广告标题',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `jump_type` tinyint(4) DEFAULT '0' COMMENT '跳转方式（1：小程序，2：url链接）',
  `link_url` varchar(255) DEFAULT NULL COMMENT '跳转类型为 2 时有效',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片的地址',
  `wxa_appid` varchar(50) DEFAULT NULL COMMENT '微信小程序的APPID（跳转类型为 1 时有效）',
  `wxa_path` varchar(255) DEFAULT NULL COMMENT '跳转小程序的路径（跳转类型为 1 时有效）',
  `extra_data` varchar(255) DEFAULT NULL COMMENT '跳转到小程序时的参数（跳转类型为 1 时有效）',
  `env_version` varchar(10) DEFAULT NULL COMMENT '跳转的小程序版本（跳转类型为 1 时有效）',
  `status` tinyint(4) DEFAULT '0' COMMENT '广告状态（0：禁用，1：正常）',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('1', 'css', '拉德芳斯就考虑到发动机爱上了房间里睡大觉飞拉萨的机房', '1', 'sss', 'resources/image/20180529/6f14f7a1f0b2bfdd49e3f47122a40160.png', '0', 'sss', '0', '0', '1', null, '2018-07-06 17:19:00');

-- ----------------------------
-- Table structure for ad_site
-- ----------------------------
DROP TABLE IF EXISTS `ad_site`;
CREATE TABLE `ad_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `site_name` varchar(255) DEFAULT NULL COMMENT '广告位名称',
  `describe` varchar(255) DEFAULT NULL COMMENT '广告位描述',
  `ad_ids` varchar(255) DEFAULT NULL COMMENT '广告位的广告id（多个用 , 号隔开）',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告位';

-- ----------------------------
-- Records of ad_site
-- ----------------------------
INSERT INTO `ad_site` VALUES ('1', 'fff', 'fffgggggggghhh1111', '0', '2018-08-23 11:06:54', '2018-08-23 11:07:45');

-- ----------------------------
-- Table structure for auth_admin
-- ----------------------------
DROP TABLE IF EXISTS `auth_admin`;
CREATE TABLE `auth_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `sex` smallint(1) NOT NULL DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of auth_admin
-- ----------------------------
INSERT INTO `auth_admin` VALUES ('1', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 'admin', 'lmxdawn@gmail.com', 'sssss', '0', '127.0.0.1', '2018-11-23 10:23:52', '2018-11-23 10:23:52', '1');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `role_id` int(11) unsigned NOT NULL COMMENT '角色',
  `permission_rule_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限id',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', '4', 'admin');
INSERT INTO `auth_permission` VALUES ('1', '3', 'admin');
INSERT INTO `auth_permission` VALUES ('1', '2', 'admin');
INSERT INTO `auth_permission` VALUES ('1', '1', 'admin');

-- ----------------------------
-- Table structure for auth_permission_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission_rule`;
CREATE TABLE `auth_permission_rule` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `is_leaf` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有叶子节点',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of auth_permission_rule
-- ----------------------------
INSERT INTO `auth_permission_rule` VALUES ('1', '0', '0', 'user_manage', '用户管理', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('2', '1', '0', 'user_manage/admin_manage', '管理组1', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('3', '2', '0', 'admin/auth/admin/index', '管理员管理', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('4', '3', '0', 'admin/auth/admin/save', '添加管理员', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('5', '3', '0', 'admin/auth/admin/edit', '编辑管理员', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('6', '3', '0', 'admin/auth/admin/delete', '删除管理员', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('7', '2', '0', 'admin/auth/role/index', '角色管理', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('8', '7', '0', 'admin/auth/role/save', '添加角色', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('9', '7', '0', 'admin/auth/role/edit', '编辑角色', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('10', '7', '0', 'admin/auth/role/delete', '删除角色', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('11', '7', '0', 'admin/auth/role/auth', '角色授权', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('12', '2', '0', 'admin/auth/permission_rule/index', '权限管理', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('13', '12', '0', 'admin/auth/permission_rule/save', '添加权限', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('14', '12', '0', 'admin/auth/permission_rule/edit', '编辑权限', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');
INSERT INTO `auth_permission_rule` VALUES ('15', '12', '0', 'admin/auth/permission_rule/delete', '删除权限', '1', '', '999', '2018-11-23 10:23:52', '2018-11-23 10:23:52');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '0', '2018-11-23 10:23:52', '2018-11-23 10:23:52');

-- ----------------------------
-- Table structure for auth_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_admin`;
CREATE TABLE `auth_role_admin` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of auth_role_admin
-- ----------------------------

-- ----------------------------
-- Table structure for file_resource
-- ----------------------------
DROP TABLE IF EXISTS `file_resource`;
CREATE TABLE `file_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源分组id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '资源的类型（0：图片）',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '资源的原名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '资源的路径（不加 域名的地址）',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '大小',
  `ext` varchar(10) NOT NULL DEFAULT '' COMMENT '资源的文件后缀',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of file_resource
-- ----------------------------
INSERT INTO `file_resource` VALUES ('1', '1', '0', 'Group 5.png', 'resources/image/20180530/854ae62758c585be5128cf344a511242.png', '7539', 'png', '2018-05-30 20:41:54');
INSERT INTO `file_resource` VALUES ('2', '0', '0', '643353_sdfaf123.png', 'resources/image/20180823/c356ca140f631a512f1c3a5e37a15dc1.png', '11507', 'png', '2018-08-23 13:38:42');
INSERT INTO `file_resource` VALUES ('3', '0', '0', '643353_sdfaf123.png', 'resources/image/20180823/4549c39e9c07c35681ee9fa94e0fc07e.png', '11507', 'png', '2018-08-23 14:05:18');
INSERT INTO `file_resource` VALUES ('4', '0', '0', '', '', '0', '', '2018-08-23 15:45:21');
INSERT INTO `file_resource` VALUES ('5', '0', '0', '', '', '2000000', '', '2018-08-23 15:45:21');
INSERT INTO `file_resource` VALUES ('6', '0', '0', '', '', '0', '', '2018-08-23 15:45:21');
INSERT INTO `file_resource` VALUES ('7', '0', '0', '', '', '0', '', '2018-08-23 15:45:21');
INSERT INTO `file_resource` VALUES ('8', '0', '0', '643353_sdfaf123.png', 'resources/image/20180823/0c424412b231eb8cb969377e15dbb812.png', '11507', 'png', '2018-08-23 15:53:32');
INSERT INTO `file_resource` VALUES ('9', '0', '0', '232826334630444283.png', 'FjBRVPOPF9gLeNBCAvK7jbif4yg8', '9668', 'png', '2018-08-23 16:08:13');
INSERT INTO `file_resource` VALUES ('10', '0', '0', '232826334630444283.png', 'FjBRVPOPF9gLeNBCAvK7jbif4yg8', '9668', 'png', '2018-08-23 16:09:07');
INSERT INTO `file_resource` VALUES ('11', '0', '0', '643353_sdfaf123.png', 'resources/image/20180823/52af5f8556a3af84cee696972b61baf4.png', '11507', 'png', '2018-08-23 17:06:05');

-- ----------------------------
-- Table structure for file_resource_tag
-- ----------------------------
DROP TABLE IF EXISTS `file_resource_tag`;
CREATE TABLE `file_resource_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源分组的id',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '资源分组的tag',
  `create_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源的分组表';

-- ----------------------------
-- Records of file_resource_tag
-- ----------------------------
INSERT INTO `file_resource_tag` VALUES ('1', '测试', '2018-05-30 20:41:48');
