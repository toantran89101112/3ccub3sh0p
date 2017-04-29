/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : pnjapi

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-10-01 09:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `cms_article_id` int(11) NOT NULL COMMENT 'cms_article_id',
  `cms_cat_id` int(11) NOT NULL COMMENT 'cms_cat_id',
  `cms_article_title` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cms_article_title',
  `cms_article_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'cms_article_description',
  `cms_article_content` text COLLATE utf8_unicode_ci COMMENT 'cms_article_content',
  `cms_article_post_date` datetime DEFAULT NULL COMMENT 'cms_article_post_date',
  `display_order` int(11) DEFAULT NULL COMMENT 'display_order',
  `delete_flag` int(11) DEFAULT '0' COMMENT 'delete_flag	 1: Delete',
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  PRIMARY KEY (`cms_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cms_Article';

-- ----------------------------
-- Records of cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `cms_cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cms_cat_id',
  `cms_cat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cms_cat_name',
  `delete_flag` int(1) DEFAULT '0' COMMENT 'delete_flag',
  PRIMARY KEY (`cms_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cms_Category';

-- ----------------------------
-- Records of cms_category
-- ----------------------------

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1442727372');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1442727376');

-- ----------------------------
-- Table structure for `m_prod`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod`;
CREATE TABLE `m_prod` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_id',
  `prod_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'prod_code',
  `prod_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'prod_name',
  `prod_cat_id` int(11) DEFAULT NULL COMMENT 'prod_cat_id	 Category',
  `prod_type_id` int(11) DEFAULT NULL COMMENT 'prod_type_id',
  `prod_gold_age` int(11) DEFAULT NULL COMMENT 'prod_gold_age	 10k,14k,18k,24k',
  `prod_color_id` int(11) DEFAULT NULL COMMENT 'prod_color_id',
  `prod_price_range` int(11) DEFAULT NULL COMMENT 'prod_price_range	 Muc gia',
  `prod_price_id` int(11) DEFAULT NULL COMMENT 'prod_price_id	 Luu gia table rieng theo thoi gian',
  `prod_diamond_info_carat` int(11) DEFAULT NULL COMMENT 'prod_diamond_carat',
  `prod_diamond_clarity` int(11) DEFAULT NULL COMMENT 'prod_diamond_clarity',
  `prod_diamond_color` int(11) DEFAULT NULL COMMENT 'prod_diamond_color',
  `prod_diamond_cut` int(11) DEFAULT NULL COMMENT 'prod_diamond_cut	 Asscher, Pear',
  `prod_material_type` int(11) DEFAULT NULL COMMENT 'prod_material_type	 Loai chat lieu (vang, bac...)',
  `prod_thumb_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_thumb_image	 Hinh san pham',
  `prod_big_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_big_image	 Hinh san pham',
  `prod_diamond_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_diamond_image	 Hinh kim cuong',
  `delete_flag` int(11) DEFAULT NULL COMMENT 'delete_flag',
  PRIMARY KEY (`prod_id`),
  KEY `cat_id` (`prod_cat_id`),
  CONSTRAINT `cat_id` FOREIGN KEY (`prod_cat_id`) REFERENCES `m_prod_cat` (`prod_cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod	 Products management table';

-- ----------------------------
-- Records of m_prod
-- ----------------------------

-- ----------------------------
-- Table structure for `m_prod_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_attribute`;
CREATE TABLE `m_prod_attribute` (
  `prod_attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_attr_id',
  `prod_attr_division` tinyint(4) DEFAULT NULL COMMENT 'prod_attr_division	 0:nhẫn, 1:kim cương',
  `prod_attr_key` int(11) DEFAULT NULL COMMENT 'prod_attr_key	 0:carat, 1:clarity, 2:color, 3:cut, 4: material',
  `prod_attr_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_attr_name',
  `prod_attr_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_attr_value',
  `prod_attr_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_flag` int(1) DEFAULT '0' COMMENT 'delete_flag',
  PRIMARY KEY (`prod_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Attribute	 Bang dinh nghia thuoc tinh san pham';

-- ----------------------------
-- Records of m_prod_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `m_prod_cat`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_cat`;
CREATE TABLE `m_prod_cat` (
  `prod_cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_cat_id',
  `prod_cat_parent_id` int(11) DEFAULT NULL COMMENT 'prod_cat_parent_id',
  `prod_cat_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'prod_cat_name',
  `prod_cat_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_icon',
  `prod_cat_pr_image1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_pr_image1',
  `prod_cat_pr_image2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_pr_image2',
  `prod_cat_pr_image3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_pr_image3',
  `prod_cat_pr_image4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_pr_image4',
  `prod_cat_pr_image5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_cat_pr_image5',
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'update_date',
  `delete_flag` int(1) DEFAULT '0' COMMENT 'delete_flag',
  PRIMARY KEY (`prod_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Cat	 Product category master table';

-- ----------------------------
-- Records of m_prod_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `m_prod_price`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_price`;
CREATE TABLE `m_prod_price` (
  `prod_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_price_id',
  `prod_id` int(11) NOT NULL COMMENT 'prod_id',
  `prod_price_from` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_price_from',
  `prod_price_to` varchar(8) COLLATE utf8_unicode_ci DEFAULT '99991231' COMMENT 'prod_price_to',
  `prod_base_price` int(11) DEFAULT NULL COMMENT 'prod_base_price',
  `prod_discount_price` int(11) DEFAULT NULL COMMENT 'prod_discount_price',
  PRIMARY KEY (`prod_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Price';

-- ----------------------------
-- Records of m_prod_price
-- ----------------------------

-- ----------------------------
-- Table structure for `m_setting`
-- ----------------------------
DROP TABLE IF EXISTS `m_setting`;
CREATE TABLE `m_setting` (
  `mst_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mst_id',
  `mst_kubun` int(11) DEFAULT NULL COMMENT 'mst_kubun	 1: Android, 2: IOS, 3: API, 4: CMS',
  `mst_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mst_key',
  `mst_id_parent` int(11) DEFAULT NULL COMMENT 'mst_id_parent',
  `mst_value` int(11) DEFAULT NULL COMMENT 'mst_value',
  `mst_display_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mst_display_value',
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  PRIMARY KEY (`mst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Setting	 System setting table';

-- ----------------------------
-- Records of m_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `m_shop`
-- ----------------------------
DROP TABLE IF EXISTS `m_shop`;
CREATE TABLE `m_shop` (
  `shop_id` int(11) NOT NULL COMMENT 'shop_id',
  `shop_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'shop_code',
  `shop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'shop_name',
  `shop_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_city',
  `shop_address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_address1',
  `shop_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_address2',
  `shop_phone` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_phone',
  `shop_lattitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_lattitude	 Geo Info',
  `shop_longtitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'shop_longtitude	 Geo Info',
  `delete_flag` int(1) DEFAULT NULL COMMENT 'delete_flag',
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `shop_code` (`shop_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop	 Thong tin cua hang';

-- ----------------------------
-- Records of m_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `m_shop_prod`
-- ----------------------------
DROP TABLE IF EXISTS `m_shop_prod`;
CREATE TABLE `m_shop_prod` (
  `id` int(11) NOT NULL COMMENT 'id',
  `shop_id` int(11) NOT NULL COMMENT 'shop_id',
  `prod_id` int(11) NOT NULL COMMENT 'prod_id',
  `shop_prod_sell_status` int(1) DEFAULT NULL COMMENT 'shop_prod_sell_status	 Trang thai kinh doanh san pham (0: Khong kinh doanh, 1: Dang kinh doanh, 3: Ngung kinh doanh)',
  PRIMARY KEY (`id`,`shop_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop_Prod	 Quan ly san pham kinh doanh theo cua hang';

-- ----------------------------
-- Records of m_shop_prod
-- ----------------------------

-- ----------------------------
-- Table structure for `m_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `m_sys_user`;
CREATE TABLE `m_sys_user` (
  `id` int(11) NOT NULL COMMENT 'id',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'password',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name',
  `register_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'register_date',
  `delete_flag` int(1) DEFAULT '0' COMMENT 'delete_flag	 1: deleted, 0: available',
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Sys_User';

-- ----------------------------
-- Records of m_sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for `tabletemplate`
-- ----------------------------
DROP TABLE IF EXISTS `tabletemplate`;
CREATE TABLE `tabletemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='TableTemplate	 Dung lam mau khi tao table chua cac cot co ban';

-- ----------------------------
-- Records of tabletemplate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer_id',
  `customer_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_name',
  `customer_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_email',
  `customer_mobi` varchar(14) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_mobi	 use for login id',
  `customer_login_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_login_password',
  `customer_avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_avatar',
  `customer_member_level` int(1) DEFAULT NULL COMMENT 'customer_member_level',
  `customer_archive_point` int(11) DEFAULT NULL COMMENT 'customer_archive_point',
  `customer_birthday` datetime DEFAULT NULL COMMENT 'customer_birthday',
  `customer_gender` int(1) DEFAULT NULL COMMENT 'customer_gender	 0: Chua xac dinh, 1: Nu, 2: Nam',
  `customer_discount_percent` decimal(3,2) DEFAULT NULL COMMENT 'customer_discount_percent',
  `customer_total_pay` int(11) DEFAULT NULL COMMENT 'customer_total_pay',
  `customer_register_date` datetime DEFAULT NULL COMMENT 'customer_register_date',
  `customer_last_active` datetime DEFAULT NULL COMMENT 'customer_last_active',
  `customer_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_location',
  `customer_user_source` int(1) DEFAULT NULL COMMENT 'customer_user_source	 User co san cua pnj hay user moi dang ky vao he thong thong qua app',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_mobi` (`customer_mobi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer	 Customer info table';

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('3', '000178408', 'NGUYỄN THỊ THANH TÂM', 'none', '0947276839', null, null, '49', '135000', '1980-07-01 00:00:00', '2', '9.99', '23471000', '2015-04-24 00:00:00', null, 'E10/06 CHUNG CƯ PHÚ THẠNH, 53 NGUYỄN SƠN, PHÚ THẠNH, Q.TÂN PHÚ, HỒ CHÍ MINH', '1');

-- ----------------------------
-- Table structure for `t_customer_like_prod`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_like_prod`;
CREATE TABLE `t_customer_like_prod` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer_id',
  `prod_id` int(11) NOT NULL COMMENT 'prod_id',
  `prod_like_date` datetime DEFAULT NULL COMMENT 'prod_like_date',
  `prod_purchase_status` int(1) DEFAULT NULL COMMENT 'prod_purchase_status	 Trang thai dat hang (du phong)',
  `prod_purchased_date` datetime DEFAULT NULL COMMENT 'prod_purchased_date	 Du phong tuong lai',
  PRIMARY KEY (`customer_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer_Like_Prod	 San pham quan tam';

-- ----------------------------
-- Records of t_customer_like_prod
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'toantran', 'd3Q35hOQHCITgrSZ0sSFiP8EzvH165ZL', '$2y$13$aG5ajH9yMhvNvw4IQ.gI4eWPvJOTJb4VdEp3MyF0S11Va/BKTwOsq', null, 'toantran@gmail.com', '10', '1442911475', '1442911475');
INSERT INTO `user` VALUES ('2', 'admin', '0khfUGhm43jHFGy7RN-CZGdjIXYUngQf', '$2y$13$48nItc2oR4C35bQ1aRbr3.nQD4FIaBXQiLKHT9Ix6oCbaNTza3ixi', null, 'admin@pnj.vn', '10', '1443494476', '1443494476');
