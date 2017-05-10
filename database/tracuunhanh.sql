/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tracuunhanh

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-10 16:52:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bill_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hóa đơn',
  `receiver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên người nhận',
  `receiver_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ người nhận',
  `receiver_phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `bill_money` int(11) DEFAULT NULL COMMENT 'Số tiền',
  `unit_transport` int(2) NOT NULL COMMENT 'đơn vị vận chuyển (0:vnpost,1:viettel,...)',
  `method_transport` tinyint(2) DEFAULT NULL COMMENT 'phương thức vận chuyển(0 : bình thường, 1: nhanh)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bills
-- ----------------------------

-- ----------------------------
-- Table structure for m_key_const
-- ----------------------------
DROP TABLE IF EXISTS `m_key_const`;
CREATE TABLE `m_key_const` (
  `key_id` int(11) NOT NULL AUTO_INCREMENT,
  `key_value` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_desc` text COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `key_value` (`key_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_key_const
-- ----------------------------

-- ----------------------------
-- Table structure for m_setting
-- ----------------------------
DROP TABLE IF EXISTS `m_setting`;
CREATE TABLE `m_setting` (
  `mst_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mst_id',
  `mst_kubun` int(11) DEFAULT NULL COMMENT 'mst_kubun	 1: Android, 2: IOS, 3: API, 4: CMS',
  `mst_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mst_key',
  `mst_id_parent` int(11) DEFAULT NULL COMMENT 'mst_id_parent',
  `mst_value` int(11) DEFAULT NULL COMMENT 'mst_value',
  `mst_display_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mst_display_value',
  `mst_content_value` text COLLATE utf8_unicode_ci,
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  `desc` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mst_id`),
  UNIQUE KEY `mst_value` (`mst_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Setting	 System setting table';

-- ----------------------------
-- Records of m_setting
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipadress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settingapi` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '0khfUGhm43jHFGy7RN-CZGdjIXYUngQf', '$2y$13$YYQ0.jy/.Kp1eji.Qyh8lujRuenIcyg1175s81dZ1JE9FxpzxXHq2', '', 'admin@softworld.jp', '10', '1443494476', '1492772084', 'admin', '', '', '', '127.0.0.1', null);
INSERT INTO `user` VALUES ('2', 'eccubejapanPho', 'S1avimrUCnDnMLBqg4U-YuJXaRLSYr24', '$2y$13$ZlsCTXb7rMzVIGbUJyFPS.dBd9draxuAU01mqWnDKhWeimRPCBsHO', null, 'eccubejapanPho@pho.jp', '10', '1492680478', '1493804565', '', '', '', '', '127.0.0.1', '{\"yahooSetting\":{\"domain\":\"http://shopping.c.yimg.jp/lib\",\"server_ftp\":\"yjftp.yahoofs.jp\",\"user_name\":\"store-gift-london\",\"user_pass\":\"pZ2o68k7\"},\"rakutenSetting\":{\"domain\":\"http://image.rakuten.co.jp/nigaoe-komachi/cabinet\",\"server_ftp\":\"upload.rakuten.ne.jp\",\"user_name\":\"nigaoe-komachi\",\"user_pass\":\"pQk4fe2S\"}}');
INSERT INTO `user` VALUES ('3', 'bantraicay', 'XfaoH-LlXJcyBunJpQLSqJqhwQmsuJfn', '$2y$13$mfbJXGWuzef6PjbSD/x5auqXz1sLtANIlr/AmGgLs6rLHh62/xCiu', null, 'bantraicay@gmail.com', '10', '1492816744', '1492816744', '', '', '', '', '127.0.0.1', null);
