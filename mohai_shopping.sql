/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80018
Source Host           : 127.0.0.1:3306
Source Database       : mohai_shopping

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-09-16 00:19:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `menu_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `menu_perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `menu_type` char(1) DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `menu_sort` int(11) DEFAULT NULL,
  `create_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of admin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission` (
  `perm_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `perm_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `perm_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES ('1', 'ROLE_ADMIN', '查看用户');
INSERT INTO `admin_permission` VALUES ('2', 'ROLE_PRO_SAVE', '保存商品信息');
INSERT INTO `admin_permission` VALUES ('3', 'ROLE_PRO_DEL', '删除商品信息');
INSERT INTO `admin_permission` VALUES ('4', 'ROLE_PRO_EDIT', '修改商品信息');
INSERT INTO `admin_permission` VALUES ('5', 'ROLE_CATE_SAVE', '保存分类信息');
INSERT INTO `admin_permission` VALUES ('6', 'ROLE_CATE_EDIT', '编辑分类信息');
INSERT INTO `admin_permission` VALUES ('7', 'ROLE_CATE_DEL', '删除分类信息');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '系统管员', '1', '2020-12-18 01:50:33', '2020-12-19 01:27:13');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `perm_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES ('1', '1', '1');
INSERT INTO `admin_role_permission` VALUES ('2', '1', '2');
INSERT INTO `admin_role_permission` VALUES ('3', '1', '5');

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`username`),
  UNIQUE KEY `user_mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '$2a$10$Yf1yVf0ETt9Vz477Ud7wCOHCJ/JnA.WQ.A6QlJ2zfKXgO3imt.cLi', null, '111111111', '1111@qq.com', '1', '0', '2020-11-22 22:49:01.0', '2020-12-15 01:17:29');

-- ----------------------------
-- Table structure for `admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `app_category`
-- ----------------------------
DROP TABLE IF EXISTS `app_category`;
CREATE TABLE `app_category` (
  `cat_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `cat_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cat_status` char(2) DEFAULT NULL,
  `cat_sort` int(4) DEFAULT NULL,
  `cat_icon` varchar(100) DEFAULT NULL,
  `cat_pic` varchar(300) DEFAULT NULL,
  `cat_level` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `update_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_category
-- ----------------------------
INSERT INTO `app_category` VALUES ('1', '0', '手机数码', '1', '1', null, null, '0', '2020-12-20 00:03:45', '2020-12-20 00:04:58', null, null);
INSERT INTO `app_category` VALUES ('2', '1', '智能设备', '1', '1', null, null, '1', '2020-12-20 00:03:43', '2020-12-20 00:05:00', null, null);
INSERT INTO `app_category` VALUES ('3', '0', '运动服饰', '2', '1', null, null, '0', '2020-12-20 00:04:20', '2020-12-21 00:00:00', null, 'admin');
INSERT INTO `app_category` VALUES ('4', '0', '酒水饮料', '2', '1', null, null, '0', '2020-12-20 02:02:36', '2020-12-21 00:00:00', null, 'admin');
INSERT INTO `app_category` VALUES ('5', '0', '上门维修', '1', '20', null, null, '0', '2020-12-21 23:10:35', '2020-12-21 23:12:58', 'admin', 'admin');
INSERT INTO `app_category` VALUES ('6', '0', '搬家拉货', '1', '10', null, null, '1', '2020-12-31 23:52:38', null, 'admin', null);

-- ----------------------------
-- Table structure for `app_member`
-- ----------------------------
DROP TABLE IF EXISTS `app_member`;
CREATE TABLE `app_member` (
  `cust_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cust_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cust_password` varchar(100) DEFAULT NULL,
  `cust_phone` varchar(11) DEFAULT NULL,
  `cust_status` tinyint(4) DEFAULT NULL,
  `cust_gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cust_nickname` varchar(50) DEFAULT NULL,
  `cust_realname` varchar(50) DEFAULT NULL,
  `cust_cardid` varchar(50) DEFAULT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `cust_city` varchar(50) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `register_ip` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_phone` (`cust_phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_member
-- ----------------------------

-- ----------------------------
-- Table structure for `app_prod`
-- ----------------------------
DROP TABLE IF EXISTS `app_prod`;
CREATE TABLE `app_prod` (
  `pro_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pro_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pro_oriprice` decimal(15,2) DEFAULT NULL,
  `pro_price` decimal(15,2) DEFAULT NULL,
  `pro_brief` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pro_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `pro_pic` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pro_sold_num` int(11) DEFAULT NULL,
  `pro_total_stocks` int(11) DEFAULT NULL,
  `pro_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pro_putaway_time` datetime DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_name` (`pro_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_prod
-- ----------------------------
INSERT INTO `app_prod` VALUES ('1', '旺仔牛奶', '1', '5.00', '10.00', '旺仔牛奶，再看就把你喝掉', '旺仔牛奶，再看就把你喝掉', null, '10', '100', '1', null, '4', '2020-12-20 02:01:50', null, null, null);
INSERT INTO `app_prod` VALUES ('2', '测试商品22222', '1', '0.00', '234.00', '测试商品2222', '测试商品22222', null, '1212', '0', '2', '2020-12-20 02:01:50', '2', '2020-12-20 02:01:50', '', '2020-12-20 00:00:00', 'admin');
INSERT INTO `app_prod` VALUES ('3', '旺仔牛奶', '2', '1.00', '11.00', '1111，牛奶牛奶牛奶牛奶', '111', null, '111', '11111', '1', null, '3', null, null, null, null);
INSERT INTO `app_prod` VALUES ('4', '古古怪怪', '1', '13.00', '141.00', '呵呵呵呵呵呵', null, null, '100', '100', '2', null, '3', '2020-12-21 23:30:43', 'admin', '2020-12-23 00:00:00', 'admin');
INSERT INTO `app_prod` VALUES ('5', '华丽和速度', '2', '13.00', '141.00', '豆腐干豆腐干', null, null, '100', '1000', '1', null, '3', '2020-12-31 23:49:47', 'admin', null, null);
