/*
Navicat MySQL Data Transfer

Source Server         : 210.211.121.139
Source Server Version : 50626
Source Host           : 210.211.121.139:3306
Source Database       : pnj_mobi_api

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-11-13 17:15:28
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cms_Category';

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', 'Tin PNJ', '0');

-- ----------------------------
-- Table structure for `m_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `m_attribute`;
CREATE TABLE `m_attribute` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `attr_value` int(11) DEFAULT NULL,
  `attr_value_display` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`attr_id`),
  KEY `keyattr` (`attr_key`),
  CONSTRAINT `keyattr` FOREIGN KEY (`attr_key`) REFERENCES `m_key_const` (`key_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_attribute
-- ----------------------------
INSERT INTO `m_attribute` VALUES ('1', 'attr_species', '1', 'Bông tai', null, '2015-11-10 14:56:56');
INSERT INTO `m_attribute` VALUES ('2', 'attr_species', '2', 'Nhẫn', null, '2015-11-10 14:57:12');
INSERT INTO `m_attribute` VALUES ('3', 'attr_gender', '1', 'Nam', null, null);
INSERT INTO `m_attribute` VALUES ('4', 'attr_gender', '2', 'Nữ', null, null);
INSERT INTO `m_attribute` VALUES ('5', 'attr_material_color', '1', 'Trắng', null, null);
INSERT INTO `m_attribute` VALUES ('6', 'attr_material_color', '2', 'Bạc', null, null);
INSERT INTO `m_attribute` VALUES ('7', 'attr_material_type', '1', 'Vàng', null, null);
INSERT INTO `m_attribute` VALUES ('8', 'attr_material_type', '2', 'Bạc', null, null);
INSERT INTO `m_attribute` VALUES ('9', 'attr_main_stone_type', '1', 'Kim cương', null, '2015-11-10 15:00:16');
INSERT INTO `m_attribute` VALUES ('10', 'attr_main_stone_type', '2', 'Đá chính 2', null, null);
INSERT INTO `m_attribute` VALUES ('11', 'attr_main_stone_color', '1', 'Trắng', null, null);
INSERT INTO `m_attribute` VALUES ('12', 'attr_main_stone_color', '2', 'Vàng', null, null);
INSERT INTO `m_attribute` VALUES ('13', 'attr_stone_size', '1', '3.1-4 li', null, null);
INSERT INTO `m_attribute` VALUES ('14', 'attr_stone_size', '2', '2.1-3 li', null, null);
INSERT INTO `m_attribute` VALUES ('15', 'attr_extra_stone_color', '1', 'Đỏ', null, null);
INSERT INTO `m_attribute` VALUES ('16', 'attr_extra_stone_color', '2', 'Xanh', null, null);
INSERT INTO `m_attribute` VALUES ('17', 'attr_extra_stone_type', '1', 'Kim cương', null, '2015-11-12 11:31:35');
INSERT INTO `m_attribute` VALUES ('18', 'attr_extra_stone_type', '2', 'Đá phụ 2', null, null);
INSERT INTO `m_attribute` VALUES ('20', 'attr_extra_stone_image', '1', 'Tròn', null, null);
INSERT INTO `m_attribute` VALUES ('21', 'attr_extra_stone_image', '2', 'Vuông', null, null);
INSERT INTO `m_attribute` VALUES ('22', 'attr_main_stone_image', '1', 'Tròn', null, null);
INSERT INTO `m_attribute` VALUES ('23', 'attr_main_stone_image', '2', 'Lục giác', null, null);
INSERT INTO `m_attribute` VALUES ('24', 'attr_city', '1', 'Hồ Chí Minh', '2015-10-24 11:22:25', '2015-10-24 11:22:35');
INSERT INTO `m_attribute` VALUES ('25', 'attr_city', '2', 'Hà Nội', '2015-10-24 11:22:41', null);
INSERT INTO `m_attribute` VALUES ('26', 'attr_city', '3', 'Huế', '2015-10-28 23:35:10', '2015-11-13 10:59:15');
INSERT INTO `m_attribute` VALUES ('27', 'attr_city', '4', 'Đà Nẵng', '2015-10-29 10:01:54', null);
INSERT INTO `m_attribute` VALUES ('28', 'attr_species', '3', 'Dây chuyền', '2015-11-10 14:57:22', null);
INSERT INTO `m_attribute` VALUES ('29', 'attr_species', '4', 'Vòng, lắc', '2015-11-10 14:58:22', null);
INSERT INTO `m_attribute` VALUES ('30', 'attr_species', '5', 'Sản phẩm bộ', '2015-11-10 14:58:41', null);
INSERT INTO `m_attribute` VALUES ('31', 'attr_extra_stone_color', '3', 'Trắng', '2015-11-10 15:10:14', null);
INSERT INTO `m_attribute` VALUES ('32', 'attr_stone_size', '3', '4.1-5 li', '2015-11-10 15:36:41', null);
INSERT INTO `m_attribute` VALUES ('33', 'attr_main_stone_image', '3', 'Vuông', '2015-11-12 15:30:37', null);
INSERT INTO `m_attribute` VALUES ('34', 'attr_stone_size', '4', '1.4 - 1.7 li', '2015-11-12 15:32:31', null);
INSERT INTO `m_attribute` VALUES ('35', 'attr_stone_size', '5', '1.6 - 1.8 li', '2015-11-12 15:53:02', null);
INSERT INTO `m_attribute` VALUES ('36', 'attr_city', '5', 'Cần Thơ', '2015-11-13 10:52:41', null);
INSERT INTO `m_attribute` VALUES ('37', 'attr_city', '6', 'An Giang', '2015-11-13 10:53:18', null);
INSERT INTO `m_attribute` VALUES ('38', 'attr_city', '7', 'Kiên Giang', '2015-11-13 10:53:43', null);
INSERT INTO `m_attribute` VALUES ('39', 'attr_city', '8', 'Vĩnh Long', '2015-11-13 10:56:45', null);
INSERT INTO `m_attribute` VALUES ('40', 'attr_city', '9', 'Cà Mau', '2015-11-13 10:56:59', null);
INSERT INTO `m_attribute` VALUES ('41', 'attr_city', '10', 'Đồng Tháp', '2015-11-13 10:57:11', null);
INSERT INTO `m_attribute` VALUES ('42', 'attr_city', '11', 'Sóc Trăng', '2015-11-13 10:58:00', null);
INSERT INTO `m_attribute` VALUES ('43', 'attr_city', '12', 'Quảng Nam', '2015-11-13 10:59:18', null);
INSERT INTO `m_attribute` VALUES ('44', 'attr_city', '13', 'Quảng Ngãi', '2015-11-13 10:59:53', null);
INSERT INTO `m_attribute` VALUES ('45', 'attr_city', '14', 'Bình Định', '2015-11-13 11:00:09', null);
INSERT INTO `m_attribute` VALUES ('46', 'attr_city', '15', 'Hải Phòng', '2015-11-13 11:00:24', null);
INSERT INTO `m_attribute` VALUES ('47', 'attr_city', '16', 'Quảng Ninh', '2015-11-13 11:01:38', null);
INSERT INTO `m_attribute` VALUES ('48', 'attr_city', '17', 'Nghệ An', '2015-11-13 11:01:53', null);
INSERT INTO `m_attribute` VALUES ('49', 'attr_city', '18', 'Đồng Nai', '2015-11-13 11:02:03', null);
INSERT INTO `m_attribute` VALUES ('50', 'attr_city', '19', 'Bình Dương', '2015-11-13 11:02:26', null);
INSERT INTO `m_attribute` VALUES ('51', 'attr_city', '20', 'Bình Phước', '2015-11-13 11:02:36', null);
INSERT INTO `m_attribute` VALUES ('52', 'attr_city', '21', 'Bà Rịa Vũng Tàu', '2015-11-13 11:02:52', null);
INSERT INTO `m_attribute` VALUES ('53', 'attr_city', '22', 'Long An', '2015-11-13 11:03:11', null);
INSERT INTO `m_attribute` VALUES ('54', 'attr_city', '23', 'Bình Thuận', '2015-11-13 11:03:43', null);
INSERT INTO `m_attribute` VALUES ('55', 'attr_city', '24', 'Tây Ninh', '2015-11-13 11:04:25', null);
INSERT INTO `m_attribute` VALUES ('56', 'attr_city', '25', 'Lâm Đồng', '2015-11-13 11:04:39', null);
INSERT INTO `m_attribute` VALUES ('57', 'attr_city', '26', 'Đắk Lắk', '2015-11-13 11:05:02', null);
INSERT INTO `m_attribute` VALUES ('58', 'attr_city', '27', 'Gia Lai', '2015-11-13 11:05:52', null);
INSERT INTO `m_attribute` VALUES ('59', 'attr_city', '28', 'Đắk Nông', '2015-11-13 11:06:07', null);
INSERT INTO `m_attribute` VALUES ('60', 'attr_city', '29', 'Khánh Hòa', '2015-11-13 11:06:19', null);
INSERT INTO `m_attribute` VALUES ('61', 'attr_city', '30', 'Bến Tre', '2015-11-13 11:06:35', null);
INSERT INTO `m_attribute` VALUES ('62', 'attr_city', '31', 'Tiền Giang', '2015-11-13 11:09:14', null);

-- ----------------------------
-- Table structure for `m_carat`
-- ----------------------------
DROP TABLE IF EXISTS `m_carat`;
CREATE TABLE `m_carat` (
  `carat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'carat_id',
  `carat_value` int(2) DEFAULT NULL COMMENT 'carat_value',
  `carat_ct` decimal(3,2) DEFAULT NULL COMMENT 'carat_ct',
  `carat_li` decimal(2,1) DEFAULT NULL COMMENT 'carat_li',
  `carat_point` int(3) DEFAULT NULL COMMENT 'carat_point',
  PRIMARY KEY (`carat_id`),
  UNIQUE KEY `carat_value` (`carat_value`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Carat';

-- ----------------------------
-- Records of m_carat
-- ----------------------------
INSERT INTO `m_carat` VALUES ('1', '1', '0.05', '2.5', '5');
INSERT INTO `m_carat` VALUES ('2', '2', '0.10', '3.0', '10');
INSERT INTO `m_carat` VALUES ('3', '3', '0.20', '3.8', '20');
INSERT INTO `m_carat` VALUES ('4', '4', '0.25', '4.1', '25');
INSERT INTO `m_carat` VALUES ('5', '5', '0.30', '4.5', '30');
INSERT INTO `m_carat` VALUES ('6', '6', '0.40', '4.8', '40');
INSERT INTO `m_carat` VALUES ('7', '7', '0.50', '5.2', '50');
INSERT INTO `m_carat` VALUES ('8', '8', '0.70', '5.8', '70');
INSERT INTO `m_carat` VALUES ('9', '9', '0.90', '6.3', '90');
INSERT INTO `m_carat` VALUES ('10', '10', '1.00', '6.5', '100');
INSERT INTO `m_carat` VALUES ('11', '11', '1.25', '6.9', '125');
INSERT INTO `m_carat` VALUES ('12', '12', '1.50', '7.4', '150');
INSERT INTO `m_carat` VALUES ('13', '13', '1.75', '7.8', '175');
INSERT INTO `m_carat` VALUES ('14', '14', '2.00', '8.2', '200');

-- ----------------------------
-- Table structure for `m_clarity`
-- ----------------------------
DROP TABLE IF EXISTS `m_clarity`;
CREATE TABLE `m_clarity` (
  `clarity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'clarity_id',
  `clarity_value` int(2) DEFAULT NULL COMMENT 'clarity_value',
  `clarity_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_code',
  `clarity_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_name',
  `clarity_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_description',
  `clarity_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`clarity_id`),
  UNIQUE KEY `clarity_value` (`clarity_value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Clarity';

-- ----------------------------
-- Records of m_clarity
-- ----------------------------
INSERT INTO `m_clarity` VALUES ('1', '1', 'FL', 'FLAWLESS SẠCH HOÀN HẢO', 'FLAWLESS SẠCH HOÀN HẢO', 'z1.png');
INSERT INTO `m_clarity` VALUES ('2', '2', 'IF', 'INTERNALLY FLAWLESS  RẤT SẠCH', 'INTERNALLY FLAWLESS RẤT SẠCH', 'z1.png');
INSERT INTO `m_clarity` VALUES ('3', '3', 'VVS1-VVS2', 'VERY VERY SLIGHTLY INCLUDED KHUYẾT TẬT RẤT RẤT KHÓ THẤY', 'VERY VERY SLIGHTLY INCLUDED KHUYẾT TẬT RẤT RẤT KHÓ THẤY', 'z2.png');
INSERT INTO `m_clarity` VALUES ('4', '4', 'I1 - I2 - I3', 'VERY SLIGHTLY INCLUDED KHUYẾT TẬT RẤT KHÓ THẤY', 'VERY SLIGHTLY INCLUDED KHUYẾT TẬT RẤT KHÓ THẤY', 'z3.png');
INSERT INTO `m_clarity` VALUES ('5', '5', 'SI1 - SI2', 'SLIGHTLY INCLUDED KHUYẾT TẬT NHẸ DỄ THẤY', 'SLIGHTLY INCLUDED KHUYẾT TẬT NHẸ DỄ THẤY', 'z4.png');
INSERT INTO `m_clarity` VALUES ('6', '6', 'I1 - I2 - I3', 'INCLUDED KHUYẾT TẬT DỄ THẤY', 'INCLUDED KHUYẾT TẬT DỄ THẤY', 'z5.png');

-- ----------------------------
-- Table structure for `m_color`
-- ----------------------------
DROP TABLE IF EXISTS `m_color`;
CREATE TABLE `m_color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'color_id',
  `color_value` int(1) DEFAULT NULL COMMENT 'carat_value',
  `color_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'color_code',
  `color_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'color_name',
  `color_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `carat_value` (`color_value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Color';

-- ----------------------------
-- Records of m_color
-- ----------------------------
INSERT INTO `m_color` VALUES ('1', '1', 'D E F', 'KHÔNG MÀU', 'y1.png');
INSERT INTO `m_color` VALUES ('2', '2', 'GHIJ', 'GẦN KHÔNG MÀU', 'y2.png');
INSERT INTO `m_color` VALUES ('3', '3', 'KLM', 'TRẮNG PHỚT', 'y3.png');
INSERT INTO `m_color` VALUES ('4', '4', 'NOPQR', 'VÀNG RẤT NHẠT', 'y4.png');
INSERT INTO `m_color` VALUES ('5', '5', 'STUVWXYZ', 'VÀNG NHẠT', 'y5.png');
INSERT INTO `m_color` VALUES ('6', '6', '', 'CÓ MÀU', 'y6.png');

-- ----------------------------
-- Table structure for `m_cut`
-- ----------------------------
DROP TABLE IF EXISTS `m_cut`;
CREATE TABLE `m_cut` (
  `cut_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'clarity_id',
  `cut_value` int(2) DEFAULT NULL COMMENT 'clarity_value',
  `cut_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_code',
  `cut_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_name',
  `cut_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_description',
  `cut_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cut_id`),
  UNIQUE KEY `clarity_value` (`cut_value`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Cut';

-- ----------------------------
-- Records of m_cut
-- ----------------------------
INSERT INTO `m_cut` VALUES ('5', '1', 'ASSCHER', 'ASSCHER', 'ASSCHER', 'asscher2.png');
INSERT INTO `m_cut` VALUES ('6', '2', 'CURSHION', 'CURSHION', 'CURSHION', 'curshion2.png');
INSERT INTO `m_cut` VALUES ('7', '3', 'EMERALD', 'EMERALD', 'EMERALD', 'emerald2.png');
INSERT INTO `m_cut` VALUES ('8', '4', 'HEART', 'HEART', 'HEART', 'heart2.png');
INSERT INTO `m_cut` VALUES ('9', '5', 'MARQUISE', 'MARQUISE', 'MARQUISE', 'marquise2.png');
INSERT INTO `m_cut` VALUES ('10', '6', 'OVAL', 'OVAL', 'OVAL', 'oval2.png');
INSERT INTO `m_cut` VALUES ('11', '7', 'PEAR', 'PEAR', 'PEAR', 'pear2.png');
INSERT INTO `m_cut` VALUES ('12', '8', 'PRINCESS', 'PRINCESS', 'PRINCESS', 'princess2.png');
INSERT INTO `m_cut` VALUES ('13', '9', 'GRADIANT', 'GRADIANT', 'GRADIANT', 'radiant2.png');
INSERT INTO `m_cut` VALUES ('14', '10', 'ROUND', 'ROUND', 'ROUND', 'round2.png');

-- ----------------------------
-- Table structure for `m_key_const`
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_key_const
-- ----------------------------
INSERT INTO `m_key_const` VALUES ('1', 'attr_species', 'Chủng loại sản phẩm', 'Key chủng loại sản phẩm', null, null);
INSERT INTO `m_key_const` VALUES ('2', 'attr_gender', 'Giới tính', 'Key quy định giới tính', null, null);
INSERT INTO `m_key_const` VALUES ('3', 'attr_material_color', 'Màu chất liệu', 'Key quy định màu chất liệu sản phẩm', null, null);
INSERT INTO `m_key_const` VALUES ('4', 'attr_material_type', 'Loại chất liệu', 'Key quy định loại chất liệu', null, null);
INSERT INTO `m_key_const` VALUES ('5', 'attr_main_stone_type', 'Loại đá chính', 'Key quy định loại đá chính', null, null);
INSERT INTO `m_key_const` VALUES ('6', 'attr_main_stone_color', 'Màu đá chính', 'Key quy định màu đá chính', null, null);
INSERT INTO `m_key_const` VALUES ('7', 'attr_stone_size', 'Kích thước đá', 'Key quy định kích thước đá', null, null);
INSERT INTO `m_key_const` VALUES ('8', 'attr_extra_stone_color', 'Màu đá phụ', 'Key quy định màu đá phụ', null, null);
INSERT INTO `m_key_const` VALUES ('9', 'attr_extra_stone_type', 'Loại đá phụ', 'Key quy định loại đá phụ', null, null);
INSERT INTO `m_key_const` VALUES ('10', 'attr_extra_stone_image', 'Hình đá phụ', 'Key quy định hình đá phụ', null, null);
INSERT INTO `m_key_const` VALUES ('11', 'attr_main_stone_image', 'Hình đá chính', 'Key quy định hình đá chính', null, null);
INSERT INTO `m_key_const` VALUES ('12', 'attr_city', 'Tỉnh / Thành', 'Tỉnh Thành Cửa Hàng', null, null);

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
  `prod_price` int(11) DEFAULT NULL COMMENT 'prod_price_id	 Luu gia table rieng theo thoi gian',
  `prod_diamond_info_carat` int(11) DEFAULT NULL COMMENT 'prod_diamond_carat',
  `prod_diamond_clarity` int(11) DEFAULT NULL COMMENT 'prod_diamond_clarity',
  `prod_diamond_color` int(11) DEFAULT NULL COMMENT 'prod_diamond_color',
  `prod_diamond_cut` int(11) DEFAULT NULL COMMENT 'prod_diamond_cut	 Asscher, Pear',
  `prod_material_type` int(11) DEFAULT NULL COMMENT 'prod_material_type	 Loai chat lieu (vang, bac...)',
  `prod_thumb_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_thumb_image	 Hinh san pham',
  `prod_big_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_big_image	 Hinh san pham',
  `prod_diamond_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_diamond_image	 Hinh kim cuong',
  `delete_flag` int(11) DEFAULT NULL COMMENT 'delete_flag',
  `prod_more_info` text COLLATE utf8_unicode_ci,
  `prod_try_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_species` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_gender` tinyint(1) DEFAULT NULL,
  `prod_material_color` tinyint(2) DEFAULT NULL,
  `prod_main_stone_type` tinyint(2) DEFAULT NULL,
  `prod_main_stone_color` tinyint(2) DEFAULT NULL,
  `prod_size_stone` tinyint(2) DEFAULT NULL,
  `prod_extra_stone_color` tinyint(2) DEFAULT NULL,
  `prod_extra_stone_type` tinyint(2) DEFAULT NULL,
  `prod_extra_stone_image` tinyint(2) DEFAULT NULL,
  `prod_main_stone_image` tinyint(2) DEFAULT NULL,
  `prod_diamond_color_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_diamond_clarity_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_diamond_carat_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_diamond_li_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `cat_id` (`prod_cat_id`),
  KEY `color` (`prod_color_id`),
  KEY `clarity` (`prod_diamond_clarity`),
  KEY `cut` (`prod_diamond_cut`),
  KEY `diamond_color` (`prod_diamond_color`),
  KEY `carat_id` (`prod_diamond_info_carat`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod	 Products management table';

-- ----------------------------
-- Records of m_prod
-- ----------------------------
INSERT INTO `m_prod` VALUES ('121', 'GND1WA50653.509', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '59277000', null, '5', '1', '10', '1', 'gnd1wa50653509-280.png', 'gnd1wa50653509-1500.png', 'round.png', '0', 'Nhẫn, chất liệu v&agrave;ng trắng 14K, gắn 1 vi&ecirc;n Kim cương 4.7 ly - độ tinh khiết SI1 - m&agrave;u nước E + 12 vi&ecirc;n Kim cương 2.5 ly - độ tinh khiết S - m&agrave;u nước A + 4 vi&ecirc;n Kim cương 2.0 ly - độ tinh khiết S - m&agrave;u nước A.<br />\r\nGi&aacute; b&aacute;n của sản phẩm mang t&iacute;nh chất tham khảo được tương ứng với trọng lượng v&agrave;ng v&agrave; Kim Cương: 0.9 chỉ<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa50653509x1024.png', '2', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'E', 'SI1', '', '4.7');
INSERT INTO `m_prod` VALUES ('122', 'GND1WA70135.501', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '31802000', null, '5', '1', '10', '1', 'gnd1wa70135501x280.png', 'gnd1wa70135501x1500.png', 'round.png', '0', 'Nhẫn, chất liệu v&agrave;ng trắng 14K, gắn1 vi&ecirc;n Kim cương 4.3 ly, độ tinh khiết SI1, m&agrave;u nước D + 8 vi&ecirc;n Kim cương 2.1 ly - A + 6 vi&ecirc;n Kim cương 1.4 ly - A.<br />\r\nGi&aacute; b&aacute;n của sản phẩm mang t&iacute;nh chất tham khảo được tương ứng với trọng lượng v&agrave;ng v&agrave; Kim Cương: 0.6976 chỉ<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa70135501x1024.png', '2', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'D', 'SI1', '', '4.3');
INSERT INTO `m_prod` VALUES ('123', 'GND1WA31842.506', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '20157000', null, '5', '1', '10', '1', 'gnd1wa31842506x280.png', 'gnd1wa31842.png', 'round.png', '0', 'Nhẫn Nữ, Chất liệu v&agrave;ng trắng 14K, Gắn 1 vi&ecirc;n Kim cương 4.1 ly, Độ tinh khiết SI, Nước E.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa31842506x1024.png', '2', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'E', 'SI1', '', '4.2');
INSERT INTO `m_prod` VALUES ('124', 'GND1WA33228.504', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '9741000', null, '3', '1', '10', '1', 'gnd1wa74674500x280.png', 'gnd1wa74674500x1500.png', 'round.png', '0', 'Nhẫn, chất liệu v&agrave;ng trắng 14K. Gắn 1 vi&ecirc;n Kim cương 3.8 ly, độ tinh khiết VS1, m&agrave;u nước F.<br />\r\nGi&aacute; b&aacute;n của sản phẩm mang t&iacute;nh chất tham khảo được tương ứng với trọng lượng v&agrave;ng v&agrave; Kim Cương: 0.6616 chỉ.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa33228504x1024.png', '2', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VS1', '', '3.5');
INSERT INTO `m_prod` VALUES ('125', 'GND1WA60912.505', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '33983000', null, '5', '1', '10', '1', 'gnd1wa60912505x280.png', 'gnd1wa60912505x1500.png', 'round.png', '0', 'Nhẫn nữ, chất liệu v&agrave;ng trắng 14K, gắn 1 vi&ecirc;n kim cương 4.3 ly , độ tinh khiết VS, nước F + 34 vi&ecirc;n kim cương 1.5 ly -A<br />\r\nGi&aacute; b&aacute;n của sản phẩm mang t&iacute;nh chất tham khảo được tương ứng với trọng lượng v&agrave;ng v&agrave; Kim Cương<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa60912505x1024.png', '2', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.2');
INSERT INTO `m_prod` VALUES ('126', 'GND1WA17008.548', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '28472000', null, '5', '1', '10', '1', 'gnd1wa17008548280.png', 'gnd1wa170085481024.png', 'round.png', '0', 'Nhẫn Nam, chất liệu v&agrave;ng trắng 14K, gắn 1 vi&ecirc;n Kim Cương 4.1-SI-E.<br />\r\nTrọng lượng v&agrave;ng tương ứng gi&aacute; b&aacute;n: 2.972 chỉ.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa17008548---copy.png', '2', null, '1', '1', '1', '3', '3', '1', '1', '1', 'E', 'SI1', '', '4.1');
INSERT INTO `m_prod` VALUES ('127', 'GND1WA75806.501', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '26980000', null, '5', '2', '10', '1', 'gnd1wa75806501-280.png', 'gnd1wa75806501-1500.png', 'round.png', '0', '', 'gnd1wa75806501x1024.png', '2', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'G', 'SI1', '', '4');
INSERT INTO `m_prod` VALUES ('128', 'GND1WA53015.501', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '23230000', null, '3', '1', '10', '1', 'gnd1wa53015501x280.png', 'gnd1wa53015501x1024.png', 'round.png', '0', 'Nhẫn nữ, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 1 vi&ecirc;n KC 3.9 ly, độ tinh khiết VS1, m&agrave;u nước-F + 12 vi&ecirc;n KC 1.9 ly-A + 4 vi&ecirc;n KC 1.7 ly-A<br />\r\nTrọng lượng v&agrave;ng tương ứng gi&aacute; b&aacute;n: 0.605 chỉ.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gnd1wa53015501x1024.png', '2', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VS1', '', '3.9');
INSERT INTO `m_prod` VALUES ('129', 'GNDRWA77480.500', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '20479000', null, '5', '1', '8', '1', 'gndrwa77480500280.png', 'gndrwa774805001024.png', 'princess.png', '0', 'Nhẫn nữ, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 10 vi&ecirc;n vu&ocirc;ng 1.7 ly A + 26 vi&ecirc;n 1.4 ly A.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gndrwa77480500x1024.png', '2', null, '1', '1', '1', '4', '3', '1', '1', '3', 'A', 'SI1', '', '1.7');
INSERT INTO `m_prod` VALUES ('130', 'GNDRWA77487.500', 'Nhẫn Kim Cương vàng trắng 14K', '4', null, '14', null, null, '20306000', null, null, null, '10', '1', 'gndrwa77487500280.png', 'gndrwa774875001024.png', 'round.png', '0', 'Nhẫn Nữ, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 10 vi&ecirc;n 1.8 ly A + 26 vi&ecirc;n 1.6 ly A.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size nhẫn tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nTrường hợp kh&ocirc;ng c&oacute; size ph&ugrave; hợp sản phẩm sẽ được đặt h&agrave;ng lại trong khoảng thời gian tối đa khoảng 2 tuần.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gndrwa77487500x1024.png', '2', null, '1', '1', '1', '5', '3', '1', '1', '1', '', '', '', '1.6 - 1.8');
INSERT INTO `m_prod` VALUES ('131', 'GMD1WA70133.501', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '26203000', null, '5', '1', '10', '1', 'gmd1wa70133501x280.png', 'gmd1wa70133501x1500.png', 'round.png', '0', 'Mặt d&acirc;y chuyền, Chất liệu V&agrave;ng trắng 14K, Gắn 1 vi&ecirc;n kim Cương 4.3 ly - Độ Tinh Khiết SI1 - M&agrave;u Nước F + 1 vi&ecirc;n Kim Cương 1.0 ly -A + 1 vi&ecirc;n Kim Cương 1.5 ly -A + 8 vi&ecirc;n Kim Cương 2.0 ly -A + 1 vi&ecirc;n Kim Cương 1.3-A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng với trọng lượng v&agrave;ng: 0.26 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nGi&aacute; b&aacute;n kh&ocirc;ng bao gồm sợi d&acirc;y chuyền.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gmd1wa70133501x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.3');
INSERT INTO `m_prod` VALUES ('132', 'GMD1WA72057.500', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '7773000', null, '3', '1', '10', '1', 'gmd1wa72057500x280.png', 'gmd1wa72057500x1500.png', 'round.png', '0', 'Mặt d&acirc;y chuyền, chất liệu v&agrave;ng trắng 14K, gắn1 vi&ecirc;n Kim Cương 3.2 ly - Độ Tinh Khiết VVS1 , nước F<br />\r\nTrọng lượng v&agrave;ng tương ứng gi&aacute; b&aacute;n: 0.1587 chỉ<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nGi&aacute; b&aacute;n kh&ocirc;ng bao gồm sợi d&acirc;y chuyền.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gmd1wa72057500x1024.png', '3', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VVS1', '', '3.2');
INSERT INTO `m_prod` VALUES ('133', 'GMD1WA72548.500', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '9047000', null, '3', '1', '10', '1', 'gmd1wa72548500x280.png', 'gmd1wa72548500x1500.png', 'round.png', '0', '', 'gmd1wa72548500x1024.png', '3', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VS1', '', '3.6');
INSERT INTO `m_prod` VALUES ('134', 'GMD1WA72556.500', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '20602000', null, '5', '1', '10', '1', 'gmd1wa72556500x280.png', 'gmd1wa72556500x1500.png', 'round.png', '0', 'Mặt d&acirc;y chuyền, chất liệu v&agrave;ng trắng 14K. Gắn1 vi&ecirc;n Kim Cương 4.2 Ly- Độ Tinh Khiết SI1- m&agrave;u nước F + 4 vi&ecirc;n Kim Cương 1.8 ly - A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng trọng lượng v&agrave;ng: 0.328 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nGi&aacute; b&aacute;n kh&ocirc;ng bao gồm sợi d&acirc;y chuyền.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gmd1wa72556500x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.2');
INSERT INTO `m_prod` VALUES ('135', 'GMD1WA73645.502', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '13076000', null, '3', '1', '10', '1', 'gmd1wa73645500x280.png', 'gmd1wa73645500x1500.png', 'round.png', '0', 'Mặt d&acirc;y chuyền, chất liệu v&agrave;ng trắng 14K. Gắn 1 vi&ecirc;n kim cương 3.9 ly , độ tinh khiết VS1, m&agrave;u nước F + 6 vi&ecirc;n kim cương 1.3 ly<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng với trọng lượng v&agrave;ng: 0.298 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nGi&aacute; b&aacute;n kh&ocirc;ng bao gồm sợi d&acirc;y chuyền.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gmd1wa73645500x1024.png', '3', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VS1', '', '3.9');
INSERT INTO `m_prod` VALUES ('136', 'GMD1WA75182.503', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '33676000', null, '5', '2', '10', '1', 'gmd1wa75182503x280.png', 'gmd1wa75182503x1500.png', 'round.png', '0', '', 'gmd1wa75182503x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'G', 'SI1', '', '4.1');
INSERT INTO `m_prod` VALUES ('137', 'GMD1WA75807.501', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '24807000', null, '5', '2', '10', '1', 'gmd1wa75807501x280.png', 'gmd1wa75807501x1500.png', 'round.png', '0', 'Mặt d&acirc;y chuyền, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 1 vi&ecirc;n KC 4.0 ly, độ tinh khiết SI, m&agrave;u nước G + 48 vi&ecirc;n 1.0 ly A + 10 vi&ecirc;n 1.5 ly A.<br />\r\nTrọng lượng v&agrave;ng tương ứng gi&aacute; b&aacute;n: 0.3974 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nGi&aacute; b&aacute;n kh&ocirc;ng bao gồm sợi d&acirc;y chuyền.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gmd1wa75807501x1024.png', '3', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'G', 'SI1', '', '4');
INSERT INTO `m_prod` VALUES ('138', 'GMDRWA76774.507', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '59973000', null, '5', '1', '10', '1', 'gmdrwa76774507x280.png', 'gmdrwa76774507x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gmdrwa76774507x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '5');
INSERT INTO `m_prod` VALUES ('139', 'GMDRWA76787.502', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '62661000', null, '5', '1', '10', '1', 'gmdrwa76787502x280.png', 'gmdrwa76787502x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gmdrwa76787502x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.7');
INSERT INTO `m_prod` VALUES ('140', 'GMDRWA76788.502', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '67461000', null, '5', '1', '10', '1', 'gmdrwa76788502x280.png', 'gmdrwa76788502x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gmdrwa76788502x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.8');
INSERT INTO `m_prod` VALUES ('141', 'GMD1WA70172.502', 'Mặt dây chuyền Kim Cương vàng trắng 14K', '5', null, '14', null, null, '31476000', null, '5', '1', '10', '1', 'gmd1wa53016502x280.png', 'gmd1wa53016502x1500.png', 'round.png', '0', '<p style=\"text-align:justify\">Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.</p>\r\n', 'gmd1wa53016502x1024.png', '3', '2', '1', '1', '1', '3', '3', '1', '1', '1', 'F', 'SI1', '', '4.3');
INSERT INTO `m_prod` VALUES ('142', 'GBD1WA72080.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '8747000', null, '3', '1', '10', '1', 'gbd1wa72080500x280.png', 'gbd1wa72080500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn 2 vi&ecirc;n Kim cương 2.7ly -độ tinh khiết VVS1 - m&agrave;u nước F.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa72080500x1024.png', '1', '2', '1', '1', '1', '2', null, null, null, '1', 'F', 'VVS1', '', '2.7');
INSERT INTO `m_prod` VALUES ('143', 'GBD1WA72095.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '11493000', null, '3', '1', '10', '1', 'gbd1wa72095500x280.png', 'gbd1wa72095500x1500.png', 'round.png', '0', 'B&ocirc;ng tai Kim Cương, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 2.5 ly, độ tinh khiết VVS1, m&agrave;u nước F + 24 vi&ecirc;n Kim Cương 0.9 Ly -A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng với trọng lượng v&agrave;ng: 0.424 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa72095500x1024.png', '1', '2', '1', '1', '1', '2', '3', '1', '1', '1', 'F', 'VVS1', '', '2.5');
INSERT INTO `m_prod` VALUES ('144', 'GBD1WA70707.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '26486000', null, '5', '1', '10', '1', 'gbd1wa70134500x280.png', 'gbd1wa70134500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 3.8 ly, độ tinh khiết SI1, m&agrave;u nước F + 4 vi&ecirc;n Kim Cương 2.0 ly -A + 8 vi&ecirc;n Kim Cương 1.7 ly -A + 8 vi&ecirc;n Kim Cương 1.3 ly - A .<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng với trọng lượng v&agrave;ng: 0.4463 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa70134500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '3.8');
INSERT INTO `m_prod` VALUES ('145', 'GBD1WA71044.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '28267000', null, '5', '1', '10', '1', 'gbd1wa71044500x280.png', 'gbd1wa71044500x1500.png', 'round.png', '0', 'B&ocirc;ng tai Kim Cương, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 3.8 Ly , độ tinh khiết SI, m&agrave;u nước F + 8 vi&ecirc;n Kim Cương 2.0 Ly + 8 vi&ecirc;n kim Cương 1.5 ly -A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.5299 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa71044500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '3.8');
INSERT INTO `m_prod` VALUES ('146', 'GBD1WA72510.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '25078000', null, '3', '1', '10', '1', 'gbd1wa72510500x280.png', 'gbd1wa72510500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 3.6 ly , độ tinh khiết VS1, m&agrave;u nước F + 8 vi&ecirc;n Kim Cương 1.6 ly - A + 16 vi&ecirc;n Kim Cương 1.3 ly - A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.594 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa72510500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'VS1', '', '3.6');
INSERT INTO `m_prod` VALUES ('147', 'GBD1WA72550.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '9842000', null, '5', null, '10', '1', 'gbd1wa72550500x280.png', 'gbd1wa72550500x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gbd1wa72550500x1024.png', '1', '2', '1', '1', '1', '2', '3', '1', '1', '1', '', 'SI1', '', '3');
INSERT INTO `m_prod` VALUES ('148', 'GBD1WA73643.502', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '17652000', null, '5', '1', '10', '1', 'gbd1wa73643502x280.png', 'gbd1wa73643502x1500.png', 'round.png', '0', 'B&ocirc;ng tai Kim Cương, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n kim cương 3.5 ly , độ tinh khiết SI1, m&agrave;u nước F + 12 vi&ecirc;n kim cương 1.2 ly - A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang tinh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.554 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa73643502x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '3.5');
INSERT INTO `m_prod` VALUES ('149', 'GBD1WA74672.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '14394000', null, null, null, '10', '1', 'gbd1wa74672500x280.png', 'gbd1wa74672500x1500.png', 'round.png', '0', 'B&ocirc;ng Tai, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim cương 3.1 ly - độ tinh khiết S - m&agrave;u nước A + 8 vi&ecirc;n Kim cương 1.3 ly -A + 2 vi&ecirc;n Kim cương 1.1 ly - A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.6084 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa74672500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'SA', '', '', '3.1');
INSERT INTO `m_prod` VALUES ('150', 'GBD1WA74675.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '11681000', null, null, null, '10', '1', 'gbd1wa74675500x280.png', 'gbd1wa74675500x1500.png', 'round.png', '0', 'B&ocirc;ng Tai, chất liệu v&agrave;ng trắng 14K.Gắn 2 vi&ecirc;n Kim cương 3.1 ly -độ tinh khiết S - m&agrave;u nước A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.528 chỉ<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa74675500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'A', 'SA', '', '3.1');
INSERT INTO `m_prod` VALUES ('151', 'GBD1WA75808.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '36088000', null, '5', '1', '10', '1', 'gbd1wa75808500x280.png', 'gbd1wa75808500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 2 vi&ecirc;n KC 3.6 ly, độ tinh khiết SI, m&agrave;u nước F + 20 vi&ecirc;n 1.3 ly A + 84 vi&ecirc;n 1.0 ly A.<br />\r\nTrọng lượng v&agrave;ng tương ứng gi&aacute; b&aacute;n: 0.7271 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa75808500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '3.6');
INSERT INTO `m_prod` VALUES ('152', 'GBDRWA77481.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '17637000', null, null, null, '8', '1', 'gbdrwa77481500x280.png', 'gbdrwa77481500x1500.png', 'princess.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương Trắng: 48 vi&ecirc;n 0.9 ly - A + 16 vi&ecirc;n vu&ocirc;ng 1.4 ly A.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbdrwa77481500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '0.9 - 1.4');
INSERT INTO `m_prod` VALUES ('153', 'GBDRWA77483.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '11439000', null, null, null, '10', '1', 'gbdrwa77483500x280.png', 'gbdrwa77483500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 8 vi&ecirc;n 2.2 ly - A.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbdrwa77483500x1024.png', '1', '2', '1', '1', '1', null, '3', null, '1', '1', 'A', '', '', '2.2');
INSERT INTO `m_prod` VALUES ('154', 'GBD1WA72557.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '29880000', null, '5', '1', '10', '1', 'gbd1wa72557500x280.png', 'gbd1wa72557500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 4.0 ly , độ tinh khiết SI1, m&agrave;u nước F + 8 vi&ecirc;n Kim Cương 1.7 ly -A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 0.568 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa72557500x1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '4');
INSERT INTO `m_prod` VALUES ('155', 'GBDRWA77486.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '18130000', null, '5', null, '10', '1', 'gbdrwa77486500x280.png', 'gbdrwa77486500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 14 vi&ecirc;n 1.4 ly A + 44 vi&ecirc;n 1.1 ly A.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbdrwa77486500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '1.1 - 1.4');
INSERT INTO `m_prod` VALUES ('156', 'GBDRWA77489.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '15997000', null, null, null, '10', '1', 'gbdrwa77489500x280.png', 'gbdrwa77489500x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gbdrwa77489500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '');
INSERT INTO `m_prod` VALUES ('157', 'GBDRWA77636.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '16070000', null, null, null, '10', '1', 'gbdrwa77636500x280.png', 'gbdrwa77636500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 14 vi&ecirc;n 1.7 ly A + 48 vi&ecirc;n 0.9 ly A.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbdrwa77636500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', 'A', '', '', '0.9 - 1.7');
INSERT INTO `m_prod` VALUES ('158', '10773000', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '10773000', null, null, null, '10', '1', 'gbdrwa77666500x280.png', 'gbdrwa77666500x1500.png', 'round.png', '0', 'B&ocirc;ng tai, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 12 vi&ecirc;n 1.8 ly A.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbdrwa77666500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', 'A', '', '', '1.8');
INSERT INTO `m_prod` VALUES ('159', 'GBDRWA77698.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '14691000', null, null, null, '10', '1', 'gbdrwa77698500x280.png', 'gbdrwa77698500x1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', 'gbdrwa77698500x1024.png', '1', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '');
INSERT INTO `m_prod` VALUES ('160', 'GBD1WA70134.500', 'Bông tai Kim Cương vàng trắng 14K', '7', null, '14', null, null, '33073000', null, '5', '1', '10', '1', 'gbd1wa70134500-280x280.png', 'gbd1wa70134500-1500x1600.png', 'round.png', '0', 'B&ocirc;ng tai Kim Cương, chất liệu v&agrave;ng trắng 14K. Gắn 2 vi&ecirc;n Kim Cương 4.0 ly , độ tinh khiết SI, nước F + 16 vi&ecirc;n Kim Cương 1.7 ly - A<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo tương ứng với trọng lượng v&agrave;ng: 0.4606 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gbd1wa70134500-1024.png', '1', '2', '1', '1', '1', '1', '3', '1', '1', '1', 'F', 'SI1', '', '4');
INSERT INTO `m_prod` VALUES ('161', 'GLD1WA46079.507', 'Lắc tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '12237000', null, null, null, '10', '1', 'gld1wa46079500-280.png', 'gld1wa46079500-1500.png', 'round.png', '0', 'Lắc tay, Chất liệu v&agrave;ng trắng 14K, gắn 1 vi&ecirc;n Kim cương 2.5 ly - độ tinh khiết S - m&agrave;u nước A + 2 vi&ecirc;n Kim cương 2.0 ly - A + 2 vi&ecirc;n Kim cương 1.6 ly - A)<br />\r\nGi&aacute; b&aacute;n sản phẩm mang t&iacute;nh chất tham khảo, tương ứng với trọng lượng v&agrave;ng: 1.7153 chỉ.<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gld1wa46079500-1024.png', '4', '2', '1', '1', '1', '2', '3', null, '1', '1', 'A', 'SA', '', '2.5');
INSERT INTO `m_prod` VALUES ('162', 'GLD1WA51889.507', 'Lắc tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '31643000', null, '3', '1', '10', '1', 'gld1wa51889500-280.png', 'gld1wa51889500-1500.png', 'round.png', '0', 'Lắc tay, chất liệu v&agrave;ng trắng 14K, gắn 8 vi&ecirc;n Kim cương 2.6 ly - độ tinh khiết VVS1 - m&agrave;u nước F.<br />\r\nGi&aacute; b&aacute;n sản phẩm mang tinh chất tham khảo, tương ứng trọng lượng v&agrave;ng: 1.9365 chỉ<br />\r\nGi&aacute; b&aacute;n sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; Kim Cương thay đổi.<br />\r\nKhi Đơn H&agrave;ng th&agrave;nh c&ocirc;ng, PNJ sẽ x&aacute;c nhận v&agrave; b&aacute;o gi&aacute; ch&iacute;nh x&aacute;c tương ứng trọng lượng v&agrave;ng thực tế của sản phẩm hiện c&oacute;.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', 'gld1wa51889500-1024.png', '4', '2', '1', '1', '1', '2', '3', null, '1', '1', 'F', 'VVS1', '', '2.6');
INSERT INTO `m_prod` VALUES ('163', 'GVDRWA77482.501', 'Vòng tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '95742000', null, null, null, '10', '1', 'gvdrwa77482501-280.png', 'gvdrwa77482501-1500.png', 'round.png', '0', 'V&ograve;ng tay, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 27 vi&ecirc;n vu&ocirc;ng 2.3 ly A + 66 vi&ecirc;n 1.7 ly A.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size sản phẩm tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', '', '4', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '1.7 - 2.3');
INSERT INTO `m_prod` VALUES ('164', 'GVDRWA77484.500', 'Vòng tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '60164000', null, null, null, '10', '1', 'gvdrwa77484500-280.png', 'gvdrwa77484500-1500.png', 'round.png', '0', 'V&ograve;ng tay, chất liệu v&agrave;ng trắng 14K, gắn Kim Cương: 9 vi&ecirc;n 3.5 ly độ tinh khiết SA.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size sản phẩm tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', '', '4', '2', '1', '1', '1', null, null, '1', '1', '1', 'SA', '', '', '3.5');
INSERT INTO `m_prod` VALUES ('165', 'GVDRWA77491.500', 'Vòng tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '64262000', null, null, null, '10', '1', 'gvdrwa77491500-280.png', 'gvdrwa77491500-1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', '', '4', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '2.2');
INSERT INTO `m_prod` VALUES ('166', 'GVDRWA77668.500', 'Vòng tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '66183000', null, null, null, '10', '1', 'gvdrwa77668500-280.png', 'gvdrwa77668500-1500.png', 'round.png', '0', 'Vượt l&ecirc;n tr&ecirc;n t&acirc;́t cả những giá trị v&acirc;̣t ch&acirc;́t của kim loại quý giá, ánh sáng vĩnh cửu của kim cương lu&ocirc;n có sức l&ocirc;i cu&ocirc;́n kh&ocirc;ng giới hạn và mãi trường t&ocirc;̀n cùng thời gian. Các tuy&ecirc;̣t tác trang sức Kim Cương PNJ kh&ocirc;ng chỉ t&ocirc;n vinh vẻ đẹp mà còn khẳng định phong cách, đẳng c&acirc;́p, ni&ecirc;̀m đam m&ecirc; và mang lại thành c&ocirc;ng cho chủ nh&acirc;n.<br />\r\n<br />\r\nTrang sức Kim Cương PNJ lu&ocirc;n lựa chọn những vi&ecirc;n kim cương Round Brilliant Cut với 57 giác cắt, đó cũng là ti&ecirc;u chí hoàn hảo, và chu&acirc;̉n mực nh&acirc;́t cho trang sức kim cương.', '', '4', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '3');
INSERT INTO `m_prod` VALUES ('167', 'GVDRWA77699.500', 'Vòng tay Kim Cương vàng trắng 14K', '6', null, '14', null, null, '25078000', null, null, null, '10', '1', 'gvdrwa77699500-280.png', 'gvdrwa77699500-1500.png', 'round.png', '0', 'V&ograve;ng tay, chất liệu v&agrave;ng trắng 14K, gắn 38 vi&ecirc;n 2.4 ly A.<br />\r\nGi&aacute; b&aacute;n mang t&iacute;nh chất tham khảo, gi&aacute; sản phẩm sẽ thay đổi tương ứng khi trọng lượng v&agrave;ng v&agrave; kim cương thay đổi.<br />\r\nSản phẩm khi Kh&aacute;ch H&agrave;ng đặt mua sẽ được b&aacute;o gi&aacute; lại với size sản phẩm tương ứng m&agrave; Kh&aacute;ch H&agrave;ng chọn.<br />\r\nPNJ Shopping Online sẽ lấy sản phẩm với gi&aacute; b&aacute;n thực tế tại cửa h&agrave;ng tương ứng trọng lượng v&agrave;ng cụ thể b&aacute;o lại cho kh&aacute;ch h&agrave;ng v&agrave; hưởng ch&iacute;nh s&aacute;ch ưu đ&atilde;i tr&ecirc;n online.&nbsp;', '', '4', '2', '1', '1', '1', null, '3', '1', '1', '1', '', '', '', '2.4');

-- ----------------------------
-- Table structure for `m_prod_`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_`;
CREATE TABLE `m_prod_` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_id',
  `prod_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'prod_code',
  `prod_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'prod_name',
  `prod_cat_id` int(11) DEFAULT NULL COMMENT 'prod_cat_id	 Category',
  `prod_type_id` int(11) DEFAULT NULL COMMENT 'prod_type_id',
  `prod_gold_age` int(11) DEFAULT NULL COMMENT 'prod_gold_age	 10k,14k,18k,24k',
  `prod_color_id` int(11) DEFAULT NULL COMMENT 'prod_color_id',
  `prod_price_range` int(11) DEFAULT NULL COMMENT 'prod_price_range	 Muc gia',
  `prod_price` int(11) DEFAULT NULL COMMENT 'prod_price_id	 Luu gia table rieng theo thoi gian',
  `prod_diamond_info_carat` int(11) DEFAULT NULL COMMENT 'prod_diamond_carat',
  `prod_diamond_clarity` int(11) DEFAULT NULL COMMENT 'prod_diamond_clarity',
  `prod_diamond_color` int(11) DEFAULT NULL COMMENT 'prod_diamond_color',
  `prod_diamond_cut` int(11) DEFAULT NULL COMMENT 'prod_diamond_cut	 Asscher, Pear',
  `prod_material_type` int(11) DEFAULT NULL COMMENT 'prod_material_type	 Loai chat lieu (vang, bac...)',
  `prod_thumb_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_thumb_image	 Hinh san pham',
  `prod_big_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_big_image	 Hinh san pham',
  `prod_diamond_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_diamond_image	 Hinh kim cuong',
  `delete_flag` int(11) DEFAULT NULL COMMENT 'delete_flag',
  `prod_more_info` text COLLATE utf8_unicode_ci,
  `prod_try_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_species` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_gender` tinyint(1) DEFAULT NULL,
  `prod_material_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_main_stone_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_main_stone_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_size_stone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_extra_stone_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_extra_stone_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prod_extra_stone_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `cat_id` (`prod_cat_id`),
  KEY `color` (`prod_color_id`),
  KEY `clarity` (`prod_diamond_clarity`),
  KEY `cut` (`prod_diamond_cut`),
  KEY `diamond_color` (`prod_diamond_color`),
  KEY `carat_id` (`prod_diamond_info_carat`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod	 Products management table';

-- ----------------------------
-- Records of m_prod_
-- ----------------------------
INSERT INTO `m_prod_` VALUES ('20', 'MSP T1', 'Test1', '4', '1', '1', null, '123', '123', '1', '1', '1', '1', null, 'slide-nhan.png', 'slide-nhan.png', '', '0', '<p>những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac những th&ocirc;ng tin khac</p>\r\n', 'ring.png', 'chủng loại', '1', 'RED', 'ĐÁ CHÍNH', 'BLUE', '30', 'YELLOW', 'ĐÁ PHỤ', '');
INSERT INTO `m_prod_` VALUES ('21', 'MSP T2', 'Test2', '4', '1', '1', null, '1', '1', '1', '1', '1', '1', null, 'slide-nhan.png', 'slide-daychuyen.png', 'slide-hoatai.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', '');
INSERT INTO `m_prod_` VALUES ('22', 'DC1', 'Day chuyền 1', '4', '1', '1', null, '123', '123', '1', '1', '1', '1', null, 'slide-daychuyen.png', 'slide-daychuyen.png', 'slide-daychuyen.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-daychuyen.png');
INSERT INTO `m_prod_` VALUES ('23', 'DC2', 'Day chuyền 2', '4', null, '1', null, '123', null, '2', '1', '1', '1', null, 'slide-hoatai.png', 'slide-hoatai.png', 'slide-hoatai.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-hoatai.png');
INSERT INTO `m_prod_` VALUES ('24', 'VT1', 'Vong tay', '4', '1', '1', null, '123', '1', '1', '1', '1', '1', null, 'slide-daychuyen.png', 'slide-daychuyen.png', 'slide-daychuyen.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-daychuyen.png');
INSERT INTO `m_prod_` VALUES ('25', 'VT2', 'Vong tay 2', '4', '1', '1', null, '123', '123', '1', '1', '1', '1', null, 'slide-daychuyen.png', 'slide-daychuyen.png', 'slide-daychuyen.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-daychuyen.png');
INSERT INTO `m_prod_` VALUES ('26', 'HT1', 'Hoa tai', '4', '1', '1', null, '123', '1', '1', '1', '1', '1', null, 'slide-hoatai.png', 'slide-hoatai.png', 'slide-hoatai.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-hoatai.png');
INSERT INTO `m_prod_` VALUES ('27', 'HT2', 'Hoa tai2', '4', '1', '1', null, null, null, '2', '1', '1', '1', null, 'slide-nhan.png', 'slide-nhan.png', 'slide-nhan.png', '0', '', 'diamondband.png', '', null, '', '', '', '', '', '', 'slide-nhan.png');
INSERT INTO `m_prod_` VALUES ('28', 'TSB1', 'Trang suc bo 1', '8', '1', '1', null, '123', '123', '1', '1', '1', '1', null, 'slide-daychuyen.png', 'slide-daychuyen.png', 'slide-daychuyen.png', '0', '', 'slide-daychuyen.png', '', null, '', '', '', '', '', '', 'slide-daychuyen.png');
INSERT INTO `m_prod_` VALUES ('29', 'TSB2', 'Trang suc bo 2', '8', '1', '1', null, '123', '123', '1', '1', '1', '1', null, 'slide-nhan.png', 'slide-nhan.png', 'slide-nhan.png', '0', '', '', '', null, '', '', '', '', '', '', 'slide-nhan.png');
INSERT INTO `m_prod_` VALUES ('30', 'DC3', 'Day Chuyen', '5', '1', '1', null, '1', '1', '1', '1', '1', '1', null, 'slide-daychuyen.png', 'slide-daychuyen.png', 'slide-daychuyen.png', '0', '', 'slide-daychuyen.png', '', null, '', '', '', '', '', '', 'slide-daychuyen.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Attribute	 Bang dinh nghia thuoc tinh san pham';

-- ----------------------------
-- Records of m_prod_attribute
-- ----------------------------
INSERT INTO `m_prod_attribute` VALUES ('1', '1', '1', 'ASSCHER', 'ASSCHER', '#', '0');
INSERT INTO `m_prod_attribute` VALUES ('2', '1', '1', 'MARSQUISE', 'MARSQUISE', '#', '0');
INSERT INTO `m_prod_attribute` VALUES ('3', '1', '2', 'FLAWLESS SẠCH HOÀN HẢO', 'FL', '#', '0');
INSERT INTO `m_prod_attribute` VALUES ('4', '1', '2', 'INTERNALLY FLAWLESS RẤT SẠCH', 'IF', '#', '0');
INSERT INTO `m_prod_attribute` VALUES ('5', '1', '3', 'KHÔNG MÀU', 'D E F', '#', '0');
INSERT INTO `m_prod_attribute` VALUES ('6', '1', '3', 'TRẮNG PHỚT', 'K L M', '#', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Cat	 Product category master table';

-- ----------------------------
-- Records of m_prod_cat
-- ----------------------------
INSERT INTO `m_prod_cat` VALUES ('4', null, 'Nhẫn', '', 'bannernhan.png', '', 'bannernhan.png', '', '', '2', '2015-10-10 18:04:02', '2', '2015-10-10 18:04:02', '0');
INSERT INTO `m_prod_cat` VALUES ('5', null, 'Dây chuyền', '', 'bannerdaychuyen.png', 'bannerhoatai.png', '', '', '', '2', '2015-10-12 10:31:18', '2', '2015-10-12 10:31:18', '0');
INSERT INTO `m_prod_cat` VALUES ('6', '0', 'Vòng tay', '', 'slide.png', 'slide2.png', '', '', '', '2', '2015-10-12 10:31:57', null, '2015-10-12 10:31:57', '0');
INSERT INTO `m_prod_cat` VALUES ('7', '0', 'Hoa tai', '', 'slide.png', 'slide2.png', '', '', '', '2', '2015-10-12 10:32:55', null, '2015-10-12 10:32:55', '0');
INSERT INTO `m_prod_cat` VALUES ('8', '0', 'Trang sức bộ', '', 'slide.png', 'slide2.png', '', '', '', '2', '2015-10-12 10:33:21', null, '2015-10-12 10:33:21', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Price';

-- ----------------------------
-- Records of m_prod_price
-- ----------------------------
INSERT INTO `m_prod_price` VALUES ('1', '1', '1', '', null, null);

-- ----------------------------
-- Table structure for `m_prod_tax`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_tax`;
CREATE TABLE `m_prod_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL DEFAULT '0',
  `type_id` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`prod_id`,`type_id`),
  KEY `prodtax` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_prod_tax
-- ----------------------------
INSERT INTO `m_prod_tax` VALUES ('110', '20', '1');
INSERT INTO `m_prod_tax` VALUES ('111', '20', '2');
INSERT INTO `m_prod_tax` VALUES ('112', '20', '3');
INSERT INTO `m_prod_tax` VALUES ('475', '21', '1');
INSERT INTO `m_prod_tax` VALUES ('476', '21', '2');
INSERT INTO `m_prod_tax` VALUES ('477', '21', '3');
INSERT INTO `m_prod_tax` VALUES ('478', '22', '3');
INSERT INTO `m_prod_tax` VALUES ('479', '23', '1');
INSERT INTO `m_prod_tax` VALUES ('480', '23', '2');
INSERT INTO `m_prod_tax` VALUES ('481', '24', '2');
INSERT INTO `m_prod_tax` VALUES ('482', '25', '3');
INSERT INTO `m_prod_tax` VALUES ('487', '26', '1');
INSERT INTO `m_prod_tax` VALUES ('486', '27', '2');
INSERT INTO `m_prod_tax` VALUES ('485', '28', '3');
INSERT INTO `m_prod_tax` VALUES ('484', '29', '1');
INSERT INTO `m_prod_tax` VALUES ('483', '30', '1');
INSERT INTO `m_prod_tax` VALUES ('140', '65', '2');
INSERT INTO `m_prod_tax` VALUES ('141', '65', '3');
INSERT INTO `m_prod_tax` VALUES ('150', '67', '2');
INSERT INTO `m_prod_tax` VALUES ('151', '67', '3');
INSERT INTO `m_prod_tax` VALUES ('152', '68', '2');
INSERT INTO `m_prod_tax` VALUES ('153', '68', '3');
INSERT INTO `m_prod_tax` VALUES ('154', '69', '3');
INSERT INTO `m_prod_tax` VALUES ('159', '72', '1');
INSERT INTO `m_prod_tax` VALUES ('160', '73', '1');
INSERT INTO `m_prod_tax` VALUES ('157', '80', '2');
INSERT INTO `m_prod_tax` VALUES ('158', '86', '3');
INSERT INTO `m_prod_tax` VALUES ('161', '88', '1');
INSERT INTO `m_prod_tax` VALUES ('162', '88', '2');
INSERT INTO `m_prod_tax` VALUES ('163', '88', '3');
INSERT INTO `m_prod_tax` VALUES ('488', '89', '1');
INSERT INTO `m_prod_tax` VALUES ('489', '89', '2');
INSERT INTO `m_prod_tax` VALUES ('490', '90', '1');
INSERT INTO `m_prod_tax` VALUES ('491', '90', '2');
INSERT INTO `m_prod_tax` VALUES ('492', '91', '1');
INSERT INTO `m_prod_tax` VALUES ('493', '91', '2');
INSERT INTO `m_prod_tax` VALUES ('494', '92', '1');
INSERT INTO `m_prod_tax` VALUES ('495', '92', '2');
INSERT INTO `m_prod_tax` VALUES ('496', '92', '3');
INSERT INTO `m_prod_tax` VALUES ('497', '93', '1');
INSERT INTO `m_prod_tax` VALUES ('498', '93', '2');
INSERT INTO `m_prod_tax` VALUES ('499', '93', '3');
INSERT INTO `m_prod_tax` VALUES ('503', '94', '1');
INSERT INTO `m_prod_tax` VALUES ('504', '94', '2');
INSERT INTO `m_prod_tax` VALUES ('505', '94', '3');
INSERT INTO `m_prod_tax` VALUES ('506', '95', '1');
INSERT INTO `m_prod_tax` VALUES ('507', '95', '2');
INSERT INTO `m_prod_tax` VALUES ('508', '95', '3');
INSERT INTO `m_prod_tax` VALUES ('509', '96', '1');
INSERT INTO `m_prod_tax` VALUES ('510', '96', '2');
INSERT INTO `m_prod_tax` VALUES ('511', '96', '3');
INSERT INTO `m_prod_tax` VALUES ('512', '97', '1');
INSERT INTO `m_prod_tax` VALUES ('513', '97', '2');
INSERT INTO `m_prod_tax` VALUES ('514', '97', '3');
INSERT INTO `m_prod_tax` VALUES ('515', '98', '1');
INSERT INTO `m_prod_tax` VALUES ('516', '98', '2');
INSERT INTO `m_prod_tax` VALUES ('517', '98', '3');
INSERT INTO `m_prod_tax` VALUES ('518', '99', '1');
INSERT INTO `m_prod_tax` VALUES ('519', '99', '2');
INSERT INTO `m_prod_tax` VALUES ('520', '99', '3');
INSERT INTO `m_prod_tax` VALUES ('521', '100', '1');
INSERT INTO `m_prod_tax` VALUES ('522', '100', '2');
INSERT INTO `m_prod_tax` VALUES ('523', '100', '3');
INSERT INTO `m_prod_tax` VALUES ('524', '101', '1');
INSERT INTO `m_prod_tax` VALUES ('525', '101', '2');
INSERT INTO `m_prod_tax` VALUES ('526', '101', '3');
INSERT INTO `m_prod_tax` VALUES ('527', '102', '1');
INSERT INTO `m_prod_tax` VALUES ('528', '102', '2');
INSERT INTO `m_prod_tax` VALUES ('529', '102', '3');
INSERT INTO `m_prod_tax` VALUES ('530', '103', '1');
INSERT INTO `m_prod_tax` VALUES ('531', '103', '2');
INSERT INTO `m_prod_tax` VALUES ('532', '103', '3');
INSERT INTO `m_prod_tax` VALUES ('533', '104', '1');
INSERT INTO `m_prod_tax` VALUES ('534', '104', '2');
INSERT INTO `m_prod_tax` VALUES ('535', '104', '3');
INSERT INTO `m_prod_tax` VALUES ('536', '105', '1');
INSERT INTO `m_prod_tax` VALUES ('537', '105', '2');
INSERT INTO `m_prod_tax` VALUES ('538', '105', '3');
INSERT INTO `m_prod_tax` VALUES ('539', '106', '1');
INSERT INTO `m_prod_tax` VALUES ('540', '106', '2');
INSERT INTO `m_prod_tax` VALUES ('541', '106', '3');
INSERT INTO `m_prod_tax` VALUES ('542', '107', '1');
INSERT INTO `m_prod_tax` VALUES ('543', '107', '2');
INSERT INTO `m_prod_tax` VALUES ('544', '107', '3');
INSERT INTO `m_prod_tax` VALUES ('545', '108', '1');
INSERT INTO `m_prod_tax` VALUES ('546', '108', '2');
INSERT INTO `m_prod_tax` VALUES ('547', '108', '3');
INSERT INTO `m_prod_tax` VALUES ('548', '109', '1');
INSERT INTO `m_prod_tax` VALUES ('549', '109', '2');
INSERT INTO `m_prod_tax` VALUES ('550', '109', '3');
INSERT INTO `m_prod_tax` VALUES ('551', '110', '1');
INSERT INTO `m_prod_tax` VALUES ('552', '110', '2');
INSERT INTO `m_prod_tax` VALUES ('553', '110', '3');
INSERT INTO `m_prod_tax` VALUES ('554', '111', '1');
INSERT INTO `m_prod_tax` VALUES ('555', '111', '2');
INSERT INTO `m_prod_tax` VALUES ('556', '111', '3');
INSERT INTO `m_prod_tax` VALUES ('557', '112', '1');
INSERT INTO `m_prod_tax` VALUES ('558', '112', '2');
INSERT INTO `m_prod_tax` VALUES ('559', '112', '3');
INSERT INTO `m_prod_tax` VALUES ('560', '113', '1');
INSERT INTO `m_prod_tax` VALUES ('561', '113', '2');
INSERT INTO `m_prod_tax` VALUES ('562', '113', '3');
INSERT INTO `m_prod_tax` VALUES ('563', '114', '1');
INSERT INTO `m_prod_tax` VALUES ('564', '114', '2');
INSERT INTO `m_prod_tax` VALUES ('565', '114', '3');
INSERT INTO `m_prod_tax` VALUES ('472', '115', '1');
INSERT INTO `m_prod_tax` VALUES ('473', '115', '2');
INSERT INTO `m_prod_tax` VALUES ('474', '115', '3');
INSERT INTO `m_prod_tax` VALUES ('566', '116', '1');
INSERT INTO `m_prod_tax` VALUES ('567', '116', '2');
INSERT INTO `m_prod_tax` VALUES ('568', '116', '3');
INSERT INTO `m_prod_tax` VALUES ('569', '117', '1');
INSERT INTO `m_prod_tax` VALUES ('570', '117', '2');
INSERT INTO `m_prod_tax` VALUES ('571', '117', '3');
INSERT INTO `m_prod_tax` VALUES ('572', '118', '1');
INSERT INTO `m_prod_tax` VALUES ('573', '118', '2');
INSERT INTO `m_prod_tax` VALUES ('574', '118', '3');
INSERT INTO `m_prod_tax` VALUES ('466', '119', '1');
INSERT INTO `m_prod_tax` VALUES ('467', '119', '2');
INSERT INTO `m_prod_tax` VALUES ('468', '119', '3');
INSERT INTO `m_prod_tax` VALUES ('575', '120', '1');
INSERT INTO `m_prod_tax` VALUES ('576', '120', '2');
INSERT INTO `m_prod_tax` VALUES ('577', '120', '3');
INSERT INTO `m_prod_tax` VALUES ('776', '121', '1');
INSERT INTO `m_prod_tax` VALUES ('777', '121', '2');
INSERT INTO `m_prod_tax` VALUES ('778', '121', '3');
INSERT INTO `m_prod_tax` VALUES ('779', '122', '1');
INSERT INTO `m_prod_tax` VALUES ('780', '122', '2');
INSERT INTO `m_prod_tax` VALUES ('781', '122', '3');
INSERT INTO `m_prod_tax` VALUES ('782', '123', '1');
INSERT INTO `m_prod_tax` VALUES ('783', '123', '2');
INSERT INTO `m_prod_tax` VALUES ('784', '123', '3');
INSERT INTO `m_prod_tax` VALUES ('785', '124', '1');
INSERT INTO `m_prod_tax` VALUES ('786', '124', '2');
INSERT INTO `m_prod_tax` VALUES ('787', '124', '3');
INSERT INTO `m_prod_tax` VALUES ('791', '125', '1');
INSERT INTO `m_prod_tax` VALUES ('792', '125', '2');
INSERT INTO `m_prod_tax` VALUES ('793', '125', '3');
INSERT INTO `m_prod_tax` VALUES ('794', '126', '1');
INSERT INTO `m_prod_tax` VALUES ('795', '126', '2');
INSERT INTO `m_prod_tax` VALUES ('796', '126', '3');
INSERT INTO `m_prod_tax` VALUES ('797', '127', '1');
INSERT INTO `m_prod_tax` VALUES ('798', '127', '2');
INSERT INTO `m_prod_tax` VALUES ('799', '127', '3');
INSERT INTO `m_prod_tax` VALUES ('800', '128', '1');
INSERT INTO `m_prod_tax` VALUES ('801', '128', '2');
INSERT INTO `m_prod_tax` VALUES ('802', '128', '3');
INSERT INTO `m_prod_tax` VALUES ('803', '129', '1');
INSERT INTO `m_prod_tax` VALUES ('804', '129', '2');
INSERT INTO `m_prod_tax` VALUES ('805', '129', '3');
INSERT INTO `m_prod_tax` VALUES ('806', '130', '1');
INSERT INTO `m_prod_tax` VALUES ('807', '130', '2');
INSERT INTO `m_prod_tax` VALUES ('808', '130', '3');
INSERT INTO `m_prod_tax` VALUES ('683', '131', '1');
INSERT INTO `m_prod_tax` VALUES ('684', '131', '2');
INSERT INTO `m_prod_tax` VALUES ('685', '131', '3');
INSERT INTO `m_prod_tax` VALUES ('686', '132', '1');
INSERT INTO `m_prod_tax` VALUES ('687', '132', '2');
INSERT INTO `m_prod_tax` VALUES ('688', '132', '3');
INSERT INTO `m_prod_tax` VALUES ('692', '133', '1');
INSERT INTO `m_prod_tax` VALUES ('693', '133', '2');
INSERT INTO `m_prod_tax` VALUES ('694', '133', '3');
INSERT INTO `m_prod_tax` VALUES ('698', '134', '1');
INSERT INTO `m_prod_tax` VALUES ('699', '134', '2');
INSERT INTO `m_prod_tax` VALUES ('700', '134', '3');
INSERT INTO `m_prod_tax` VALUES ('701', '135', '1');
INSERT INTO `m_prod_tax` VALUES ('702', '135', '2');
INSERT INTO `m_prod_tax` VALUES ('703', '135', '3');
INSERT INTO `m_prod_tax` VALUES ('704', '136', '1');
INSERT INTO `m_prod_tax` VALUES ('705', '136', '2');
INSERT INTO `m_prod_tax` VALUES ('706', '136', '3');
INSERT INTO `m_prod_tax` VALUES ('707', '137', '1');
INSERT INTO `m_prod_tax` VALUES ('708', '137', '2');
INSERT INTO `m_prod_tax` VALUES ('709', '137', '3');
INSERT INTO `m_prod_tax` VALUES ('710', '138', '1');
INSERT INTO `m_prod_tax` VALUES ('711', '138', '2');
INSERT INTO `m_prod_tax` VALUES ('712', '138', '3');
INSERT INTO `m_prod_tax` VALUES ('713', '139', '1');
INSERT INTO `m_prod_tax` VALUES ('714', '139', '2');
INSERT INTO `m_prod_tax` VALUES ('715', '139', '3');
INSERT INTO `m_prod_tax` VALUES ('716', '140', '1');
INSERT INTO `m_prod_tax` VALUES ('717', '140', '2');
INSERT INTO `m_prod_tax` VALUES ('718', '140', '3');
INSERT INTO `m_prod_tax` VALUES ('722', '141', '1');
INSERT INTO `m_prod_tax` VALUES ('723', '141', '2');
INSERT INTO `m_prod_tax` VALUES ('724', '141', '3');
INSERT INTO `m_prod_tax` VALUES ('725', '142', '1');
INSERT INTO `m_prod_tax` VALUES ('726', '142', '2');
INSERT INTO `m_prod_tax` VALUES ('727', '142', '3');
INSERT INTO `m_prod_tax` VALUES ('731', '143', '1');
INSERT INTO `m_prod_tax` VALUES ('732', '143', '2');
INSERT INTO `m_prod_tax` VALUES ('733', '143', '3');
INSERT INTO `m_prod_tax` VALUES ('734', '144', '1');
INSERT INTO `m_prod_tax` VALUES ('735', '144', '2');
INSERT INTO `m_prod_tax` VALUES ('736', '144', '3');
INSERT INTO `m_prod_tax` VALUES ('740', '145', '1');
INSERT INTO `m_prod_tax` VALUES ('741', '145', '2');
INSERT INTO `m_prod_tax` VALUES ('742', '145', '3');
INSERT INTO `m_prod_tax` VALUES ('743', '146', '1');
INSERT INTO `m_prod_tax` VALUES ('744', '146', '2');
INSERT INTO `m_prod_tax` VALUES ('745', '146', '3');
INSERT INTO `m_prod_tax` VALUES ('746', '147', '1');
INSERT INTO `m_prod_tax` VALUES ('747', '147', '2');
INSERT INTO `m_prod_tax` VALUES ('748', '147', '3');
INSERT INTO `m_prod_tax` VALUES ('749', '148', '1');
INSERT INTO `m_prod_tax` VALUES ('750', '148', '2');
INSERT INTO `m_prod_tax` VALUES ('751', '148', '3');
INSERT INTO `m_prod_tax` VALUES ('752', '149', '1');
INSERT INTO `m_prod_tax` VALUES ('753', '149', '2');
INSERT INTO `m_prod_tax` VALUES ('754', '149', '3');
INSERT INTO `m_prod_tax` VALUES ('755', '150', '1');
INSERT INTO `m_prod_tax` VALUES ('756', '150', '2');
INSERT INTO `m_prod_tax` VALUES ('757', '150', '3');
INSERT INTO `m_prod_tax` VALUES ('758', '151', '1');
INSERT INTO `m_prod_tax` VALUES ('759', '151', '2');
INSERT INTO `m_prod_tax` VALUES ('760', '151', '3');
INSERT INTO `m_prod_tax` VALUES ('761', '152', '1');
INSERT INTO `m_prod_tax` VALUES ('762', '152', '2');
INSERT INTO `m_prod_tax` VALUES ('763', '152', '3');
INSERT INTO `m_prod_tax` VALUES ('767', '153', '1');
INSERT INTO `m_prod_tax` VALUES ('768', '153', '2');
INSERT INTO `m_prod_tax` VALUES ('769', '153', '3');
INSERT INTO `m_prod_tax` VALUES ('770', '154', '1');
INSERT INTO `m_prod_tax` VALUES ('771', '154', '2');
INSERT INTO `m_prod_tax` VALUES ('772', '154', '3');
INSERT INTO `m_prod_tax` VALUES ('773', '155', '1');
INSERT INTO `m_prod_tax` VALUES ('774', '155', '2');
INSERT INTO `m_prod_tax` VALUES ('775', '155', '3');
INSERT INTO `m_prod_tax` VALUES ('809', '156', '1');
INSERT INTO `m_prod_tax` VALUES ('810', '156', '2');
INSERT INTO `m_prod_tax` VALUES ('811', '156', '3');
INSERT INTO `m_prod_tax` VALUES ('812', '157', '1');
INSERT INTO `m_prod_tax` VALUES ('813', '157', '2');
INSERT INTO `m_prod_tax` VALUES ('814', '157', '3');
INSERT INTO `m_prod_tax` VALUES ('815', '158', '1');
INSERT INTO `m_prod_tax` VALUES ('816', '158', '2');
INSERT INTO `m_prod_tax` VALUES ('817', '158', '3');
INSERT INTO `m_prod_tax` VALUES ('818', '159', '1');
INSERT INTO `m_prod_tax` VALUES ('819', '159', '2');
INSERT INTO `m_prod_tax` VALUES ('820', '159', '3');
INSERT INTO `m_prod_tax` VALUES ('821', '160', '1');
INSERT INTO `m_prod_tax` VALUES ('822', '160', '2');
INSERT INTO `m_prod_tax` VALUES ('823', '160', '3');
INSERT INTO `m_prod_tax` VALUES ('827', '161', '1');
INSERT INTO `m_prod_tax` VALUES ('828', '161', '2');
INSERT INTO `m_prod_tax` VALUES ('829', '161', '3');
INSERT INTO `m_prod_tax` VALUES ('830', '162', '1');
INSERT INTO `m_prod_tax` VALUES ('831', '162', '2');
INSERT INTO `m_prod_tax` VALUES ('832', '162', '3');
INSERT INTO `m_prod_tax` VALUES ('836', '163', '1');
INSERT INTO `m_prod_tax` VALUES ('837', '163', '2');
INSERT INTO `m_prod_tax` VALUES ('838', '163', '3');
INSERT INTO `m_prod_tax` VALUES ('839', '164', '1');
INSERT INTO `m_prod_tax` VALUES ('840', '164', '2');
INSERT INTO `m_prod_tax` VALUES ('841', '164', '3');
INSERT INTO `m_prod_tax` VALUES ('842', '165', '1');
INSERT INTO `m_prod_tax` VALUES ('843', '165', '2');
INSERT INTO `m_prod_tax` VALUES ('844', '165', '3');
INSERT INTO `m_prod_tax` VALUES ('845', '166', '1');
INSERT INTO `m_prod_tax` VALUES ('846', '166', '2');
INSERT INTO `m_prod_tax` VALUES ('847', '166', '3');
INSERT INTO `m_prod_tax` VALUES ('848', '167', '1');
INSERT INTO `m_prod_tax` VALUES ('849', '167', '2');
INSERT INTO `m_prod_tax` VALUES ('850', '167', '3');

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
  `mst_content_value` text COLLATE utf8_unicode_ci,
  `create_by` int(11) DEFAULT NULL COMMENT 'create_by',
  `create_date` datetime DEFAULT NULL COMMENT 'create_date',
  `update_by` int(11) DEFAULT NULL COMMENT 'update_by',
  `update_date` datetime DEFAULT NULL COMMENT 'update_date',
  `desc` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`mst_id`),
  UNIQUE KEY `mst_value` (`mst_value`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Setting	 System setting table';

-- ----------------------------
-- Records of m_setting
-- ----------------------------
INSERT INTO `m_setting` VALUES ('1', '0', 'KEY-MENU', null, '1', 'Chăm sóc khách hàng', null, null, null, null, null, 'Menu ngoài cùng');
INSERT INTO `m_setting` VALUES ('2', '0', 'KEY-MENU', null, '2', 'Kiến thức kim cương', null, null, null, null, null, 'Menu ngoài cùng');
INSERT INTO `m_setting` VALUES ('3', '0', 'KEY-CSKH', '1', '3', 'CHÍNH SÁCH THU ĐỔI', null, null, null, null, null, 'Menu chính sách thu đổi nằm trong menu chăm sóc khách hàng');
INSERT INTO `m_setting` VALUES ('4', '0', 'KEY-CSKH-CSTD', '3', '4', 'THU ĐỔI KIM CƯƠNG THIÊN NHIÊN', '<span style=\"color:#0000CD\"><strong>1. KIM CƯƠNG THI&Ecirc;N NHI&Ecirc;N</strong></span><br />\r\n<span style=\"color:#0000FF\">&nbsp; &nbsp; Kim cương tr&ograve;n trắng mua từ ng&agrave;y 01/01/2010</span><br />\r\n<img alt=\"photo\" src=\"http://210.211.121.139/pnj-service/upload/files/cstda1.png\" /><br />\r\n<span style=\"color:#0000FF\">Kim cương tr&ograve;n trắng mua từ ng&agrave;y 01/01/2010</span><br />\r\n<img alt=\"photo\" class=\"full-image\" src=\"http://210.211.121.139/pnj-service/upload/files/cstda1%281%29.png\" /><br />\r\n<br />\r\n<span style=\"color:#0000CD\"><strong>2. KIM CƯƠNG TR&Ograve;N TRẮNG SI1</strong></span><br />\r\n<img alt=\"photo\" class=\"full-image\" src=\"http://210.211.121.139/pnj-service/upload/files/cstda1%281%29.png\" style=\"line-height:20.8px\" /><br />\r\n<br />\r\n<strong><span style=\"color:#0000CD\">3. KIM CƯƠNG RỜI FANCY SHAP, KIM CƯƠNG M&Agrave;U</span></strong><br />\r\n<img alt=\"photo\" class=\"full-image\" src=\"http://210.211.121.139/pnj-service/upload/files/cstda1%281%29.png\" style=\"line-height:20.8px\" /><br />\r\n<br />\r\n<strong><span style=\"color:#0000CD\">4. KIM CƯƠNG TR&Ograve;N TRẮNG (MIX CLARITY) DƯỚI 2.5LI</span></strong><br />\r\n&nbsp; &nbsp; <span style=\"color:#0000FF\">Thu lại đến 70% trị gi&aacute; sản phẩm tr&ecirc;n h&oacute;a đơn.</span><br />\r\n<span style=\"color:#0000FF\">(*) Chế độ đổi trả h&agrave;ng trong v&ograve;ng 03 ng&agrave;y kh&ocirc;ng &aacute;p dụng cho cửa h&agrave;ng tại Parkson, Lotte Mart, Nowzone, S&acirc;n bay T&acirc;n Sơn Nhất.</span>', null, null, '2', '2015-10-22 14:56:43', 'B&agrave;i viết thu đổi kim cương thi&ecirc;n nhi&ecirc;n nằm trong ch&iacute;nh s&aacute;ch thu đổi');
INSERT INTO `m_setting` VALUES ('5', '0', 'KEY-CSKH', '1', '5', 'CHÍNH SÁCH BẢO HÀNH', null, null, null, null, null, 'Menu Chính sách bảo hành nằm trong menu Chăm sóc khách hàng');
INSERT INTO `m_setting` VALUES ('6', '0', 'KEY-CSKH-CSBH', '5', '6', 'CHÍNH SÁCH BẢO HÀNH', '<br />\r\n<span style=\"color:#0000FF\">- Bảo h&agrave;nh 6 th&aacute;ng lỗi kỹ thuật, nước xi.<br />\r\n- Bảo h&agrave;nh đ&aacute;nh b&oacute;ng, si&ecirc;u &acirc;m l&agrave;m sạch miễn ph&iacute;.<br />\r\n- Khắc chữ miễn ph&iacute;.</span><br />\r\n<br />\r\n<span style=\"color:#808080\">* Chế độ thu đổi, bảng gi&aacute; bảo h&agrave;nh c&oacute; thề thấy đổi t&ugrave;y từng thời điểm, kh&aacute;ch h&agrave;ng c&oacute; thể truy cập websiste&nbsp;</span><a href=\"http://www.pnj.com.vn\"><span style=\"color:#808080\">http://www.pnj.com.vn</span></a><span style=\"color:#808080\">&nbsp;để biết th&ecirc;m th&ocirc;ng tin\\hoặc cập nhật chế độ thu đổi v&agrave; bảng gi&aacute; bảo h&agrave;nh hiện h&agrave;nh.<br />\r\n<br />\r\n*Tất cả c&aacute;c sản phẩm trang sức v&agrave;ng của PNJ được bảo h&agrave;nh v&agrave; thu đổi thống nhất tại hệ thống cửa h&agrave;ng trang sức v&agrave;ng PNJ tr&ecirc;n to&agrave;n quốc (kh&ocirc;ng thu đổi Trung T&acirc;m Thương Mại).</span>', null, null, '2', '2015-10-22 15:23:50', 'B&agrave;i viết ch&iacute;nh s&aacute;ch bảo h&agrave;nh nằm trong ch&iacute;nh s&aacute;ch bảo h&agrave;nh');
INSERT INTO `m_setting` VALUES ('7', '0', 'KEY-CSKH-CSTD', '3', '7', 'THU ĐỔI TRANG SỨC KIM CƯƠNG', '<span style=\"color:#0000CD\"><strong>1. NỮ TRANG KIM CƯƠNG FANCY SHAPE</strong><br />\r\n&nbsp; &nbsp; &nbsp;- Kh&aacute;ch h&agrave;ng b&aacute;n lại sản phẩm thu 75% trị gi&aacute; h&oacute;a đơn.<br />\r\n&nbsp;&nbsp; &nbsp; - Kh&aacute;ch h&agrave;ng đổi sản phẩm c&oacute; gi&aacute; trị lớn hơn thu 85% trị gi&aacute; h&oacute;a đơn.<br />\r\n<br />\r\n<strong>2. VỎ NỮ TRANG KIM CƯƠNG</strong><br />\r\n&nbsp; &nbsp; - Kh&aacute;ch h&agrave;ng b&aacute;n lại sản phẩm thu 80% trị gi&aacute; h&oacute;a đơn.<br />\r\n&nbsp; &nbsp; - Kh&aacute;ch h&agrave;ng đổi sản phẩm c&oacute; gi&aacute; trị lớn hơn thu 85% trị gi&aacute; h&oacute;a đơn.<br />\r\n<br />\r\n<strong>3. NỮ TRANG KIM CƯƠNG VS1, VVS1 DƯỚI 4.0 LY, SI V&Agrave; LOOK LIKE BIG</strong><br />\r\n&nbsp; &nbsp;- Kh&aacute;ch h&agrave;ng b&aacute;n lại sản phẩm thu 80% trị gi&aacute; h&oacute;a đơn.<br />\r\n&nbsp; &nbsp;- Kh&aacute;ch h&agrave;ng đổi sản phẩm c&oacute; gi&aacute; trị lớn hơn thu 90% trị gi&aacute; h&oacute;a đơn.<br />\r\n<br />\r\n<strong>4. NỮ TRANG KIM CƯƠNG VS1, VVS1 TR&Ecirc;N 4.0 LY</strong><br />\r\n&nbsp;&nbsp;- Đối với vi&ecirc;n kim cương đ&iacute;nh tr&ecirc;n vỏ được thu đổi theo ch&iacute;nh s&aacute;ch thu đổi kim cương thi&ecirc;n nhi&ecirc;n.<br />\r\n&nbsp;&nbsp;- Đối với vỏ được thu đổi theo mục 2.</span><br />\r\n&nbsp;', null, null, '2', '2015-10-26 15:28:01', 'B&agrave;i viết thu đổi trang sức kim cương nằm trong ch&iacute;nh s&aacute;ch thu đổi');
INSERT INTO `m_setting` VALUES ('8', '0', 'KEY-KTKC', '2', '8', '4CS', null, null, null, null, null, 'Menu 4cs trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('9', '0', 'KEY-KTKC-4CS', '8', '9', 'CUT', 'Cut l&agrave; ti&ecirc;u chuẩn quan trọng nhất của một vi&ecirc;n kim cương. Kim cương Round Brilliant Cut sẽ c&oacute; 57 gi&aacute;c cắt đối xứng ho&agrave;n hảo. Tất cả &aacute;nh s&aacute;ng đi v&agrave;o vi&ecirc;n kim cương đều phản chiếu đầy đủ l&ecirc;n bề mặt của n&oacute;, tạo n&ecirc;n vẻ đẹp rực rỡ của 7 sắc cầu vồng hay c&ograve;n gọi l&agrave; &quot;lửa&quot; của kim cương.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/Cut-1.png\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/cut-2.PNG\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/cut-3.PNG\" /><br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/cut-4.PNG\" /><br />\r\n&nbsp;', null, null, '2', '2015-10-22 10:36:20', 'B&agrave;i viết cut trong 4cs');
INSERT INTO `m_setting` VALUES ('10', '0', 'KEY-KTKC-4CS', '8', '10', 'CARAT', 'Từ carat bắt nguồn từ thời cổ đại, l&agrave; đơn vị đo lường xuất xứ từ hạt của một loại c&acirc;y đậu (carob). Tr&aacute;i đậu c&oacute; c&aacute;c hạt gần như bằng nhau, những hạt n&agrave;y ng&agrave;y xưa được c&aacute;c nh&agrave; bu&ocirc;n b&aacute;n đ&aacute; qu&yacute; d&ugrave;ng để c&acirc;n kim cương. V&agrave;o năm 1913, trọng lượng carat được quốc tế chuẩn h&oacute;a v&agrave; được cho v&agrave;o hệ thống đo lường. Một carat bằng 0.2 gram. Trọng lượng của những vi&ecirc;n kim cương nhỏ thường được chia th&agrave;nh điểm (Point), với 1carat được chia th&agrave;nh 100 điểm (Point) . V&iacute; dụ 50 điểm (Point) l&agrave; c&aacute;ch n&oacute;i ngắn của nữa carat hay được viết l&agrave; 0.50.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/carat.PNG\" />', null, null, '2', '2015-10-22 10:20:07', 'B&agrave;i viết carat trong 4cs');
INSERT INTO `m_setting` VALUES ('11', '0', 'KEY-KTKC-4CS', '8', '11', 'CLARITY', 'Khi bạn cố gắng t&igrave;m những đặc điểm b&ecirc;n trong v&agrave; những dấu vết b&ecirc;n ngo&agrave;i của vi&ecirc;n kim cương tức l&agrave; bạn đang ph&acirc;n cấp độ tinh khiết cho vi&ecirc;n kim cương đ&oacute;. Độ tinh khiết l&agrave; số lượng những vết t&iacute;ch b&ecirc;n ngo&agrave;i gọi l&agrave; blemishes (tỳ vết b&ecirc;n ngo&agrave;i) v&agrave; những đặc điểm b&ecirc;n trong gọi l&agrave; inclusions (bao thể b&ecirc;n trong).<br />\r\n<br />\r\nC&oacute; nhiều hệ thống ph&acirc;n cấp độ tinh khiết kh&aacute;c nhau tr&ecirc;n thế giới. PNJLab ph&acirc;n cấp độ tinh khiết dựa tr&ecirc;n quan điểm của GIA (viện ngọc học Hoa Kỳ).<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/clarity%281%29.PNG\" style=\"height:100%; width:100%\" />', null, null, '2', '2015-10-31 14:29:31', 'B&agrave;i viết clarity trong 4cs');
INSERT INTO `m_setting` VALUES ('12', '0', 'KEY-KTKC-4CS', '8', '12', 'COLOR', 'Đối với kim cương trắng, m&agrave;u sắc cố thể ph&acirc;n ra nhiều cấp độ từ kh&ocirc;ng m&agrave;u đến m&agrave;u v&agrave;ng nhạt v&agrave; vi&ecirc;n kim cương c&agrave;ng trắng th&igrave; c&agrave;ng hiếm v&agrave; gi&aacute; trị c&agrave;ng cao.<br />\r\n<br />\r\nTrong bảng xếp loại m&agrave;u kim cương trắng của GIA ( Viện Ngọc Học Hoa Kỳ ) v&agrave; PNJLab , m&agrave;u trắng của kim cương bắt đầu từ k&yacute; tự D, E, F ... cho loại trắng kh&ocirc;ng m&agrave;u v&agrave; xếp dần xuống Z.<br />\r\n<br />\r\nC&aacute;ch tốt nhất để thấy được m&agrave;u sắc thật sự của một vi&ecirc;n kim cương l&agrave; nh&igrave;n n&oacute; đối diện với một mặt phẳng m&agrave;u trắng.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/Color.png\" />', null, null, '2', '2015-11-06 11:13:25', 'B&agrave;i viết color trong 4cs');
INSERT INTO `m_setting` VALUES ('13', '0', 'KEY-KTKC', '2', '13', 'CERTIFICATE', null, null, null, null, null, 'Menu certificate trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('14', '0', 'KEY-KTKC-CERTIFICATE', '13', '14', 'CERTIFICATE', 'Nếu 4C(Cut-Carat-Clarity-Color) l&agrave; thước đo gi&aacute; trị của 1 vi&ecirc;n kim cương th&igrave; Certificate - Giấy chứng nhận l&agrave; bằng chứng để x&aacute;c thực c&aacute;c gi&aacute; trị n&agrave;y. Giấy chứng nhận bao gồm những th&ocirc;ng số ch&iacute;nh về trọng lượng, k&iacute;ch thước, độ tinh khiết, gi&aacute;c cắt v&agrave; m&agrave;u sắc, b&ecirc;n cạnh đ&oacute; l&agrave; những th&ocirc;ng tin về h&igrave;nh d&aacute;ng, sự c&acirc;n xứng, tỉ lệ cắt m&agrave;i của một vi&ecirc;n kim cương do một tổ chức c&oacute; chuy&ecirc;n m&ocirc;n, chứng nhận quốc tế về chất lượng gi&aacute;m định cấp. Kiếm định kim cương PNJ được thực hiện bởi PNJLab - C&ocirc;ng ty gi&aacute;m định chuy&ecirc;n nghiệp v&agrave; độc lập (kh&ocirc;ng kinh doanh kim cương), tu&acirc;n thủ theo những quy định v&agrave; chuẩn mực gắt gao nhất về kiểm định kim cương của GIA từ ban đầu.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/2%281%29.png\" style=\"height:100%; width:100%\" /><br />\r\n<br />\r\nPNJ chỉ chọn những vi&ecirc;n kim cương c&oacute; chất lượng ho&agrave;n hảo, được kiểm định bởi c&ocirc;ng ty PNJLab, theo ti&ecirc;u chuẩn nghi&ecirc;m ngặt nhất của GIA - Viện Ngọc Học Hoa Kỳ<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/3%281%29.png\" style=\"height:100%; width:100%\" /><br />\r\nL&agrave; một c&ocirc;ng ty ti&ecirc;n phong v&agrave; uy t&iacute;n h&agrave;ng đầu trong lĩnh vực kinh doanh trang sức v&agrave; kim cương tại Việt Nam, để đ&aacute;p ứng nhu cầu của kh&aacute;ch h&agrave;ng cần một sự gi&aacute;m định ch&iacute;nh x&aacute;c v&agrave; tin cậy về chất lượng của kim cương, PNJ đ&atilde; th&agrave;nh lập C&ocirc;ng ty TNHH MTV Gi&aacute;m Đinh PNJ (PNJLab) từ rất sớm, được đầu tư hệ thống trang thiết bị v&agrave; c&ocirc;ng nghệ hiện đại theo ti&ecirc;u chuẩn GIA c&ugrave;ng với đội ngũ những chuy&ecirc;n gia kiểm định h&agrave;ng đầu, được đ&agrave;o tạo chuy&ecirc;n nghiệp bởi GIA v&agrave; c&oacute; bằng đại học/cao học chuy&ecirc;n ng&agrave;nh đ&aacute; qu&yacute;, ngọc học.<br />\r\nPNJLab c&ograve;n l&agrave; c&ocirc;ng ty đầu ti&ecirc;n v&agrave; duy nhất tạ Việt Nam đạt. ti&ecirc;u chuản ISO/IEC 17025:2005 - VILAS 565 trong kiểm định kiem cương v&agrave; đ&aacute; qu&yacute; - ngang bằng với chất lượng kiểm định của c&aacute;c c&ocirc;ng ty quốc tế.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/4%281%29.png\" style=\"height:378px; width:354px\" /><br />\r\n&nbsp;<br />\r\nĐến thời điểm hiện tại PNJLab đ&atilde; trở th&agrave;nh một c&ocirc;ng ty kiểm định hoặt động độc lập, chuy&ecirc;n nghiệp v&agrave; uy t&iacute;n h&agrave;ng đầu Việt Nam. Theo ti&ecirc;u chuẩn gắt gao nhất về chất lượng kiểm định của GIA, dịch vụ v&agrave; giấy kiểm định do PNJLab cấp lu&ocirc;n được kh&aacute;ch h&agrave;ng v&agrave; đối t&aacute;c tin tưởng trong kinh doanh v&agrave; trao đổi kim cương, được sử dụng phổ biến tr&ecirc;n to&agrave;n l&atilde;nh thổ Việt Nam<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/5%281%29.png\" style=\"height:481px; width:355px\" />', null, null, '2', '2015-11-13 17:11:58', 'B&agrave;i viết certificate trong menu certificate');
INSERT INTO `m_setting` VALUES ('15', '0', 'KEY-KTKC', '2', '15', 'CÂU CHUYỆN KIM CƯƠNG', null, null, null, null, null, 'Menu Câu chuyện kim cương trong Kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('17', '0', 'KEY-KTKC-CCKC', '15', '16', 'CÂU CHUYỆN 1', 'fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj fasdfj asldfj<br />\r\n<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/gnd1wa590616021%282%29.jpg\" style=\"height:100%; width:100%\" />', null, null, '2', '2015-10-31 12:58:14', 'B&agrave;i viết c&acirc;u chuyện 1 trong c&acirc;u chuy&ecirc;n kim cương');
INSERT INTO `m_setting` VALUES ('18', '0', 'KEY-KTKC-CCKC', '15', '17', 'CÂU CHUYỆN 2', 'Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/Test_Demo_Screen_Opt2_1.png\" style=\"height:100%; width:100%\" /><br />\r\nTest nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong Test nhap noi dung cau chuyen kim cuong', null, null, '2', '2015-11-06 10:13:30', 'B&agrave;i viết c&acirc;u chuyện 2 trong c&acirc;u chuyện kim cương');
INSERT INTO `m_setting` VALUES ('19', '0', 'KEY-KTKC', '2', '18', 'QA', null, null, null, null, null, 'Menu QA trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('20', '0', 'KEY-KTKC-QA', '18', '19', 'Mua kim cương như thế nào để có lợi nhất?', 'Bạn nên mua kim cương phù hợp với nhu cầu, túi tiền, giá cả hợp lý, mua kim cương\r\nở các công ty có sự đảm bảo về chất lượng thông qua các giấy kiểm định uy tín, có\r\nchính sách kinh doanh minh bạch, chế độ thu đổi cạnh tranh để dễ bán lại khi cần\r\nmà không bị mất giá nhiều.Bạn có thể tham khảo thêm những câu hỏi và trả lời bên\r\ndưới để có thể giải đáp những thắc mắc của riêng mình.', null, null, '2', '2015-11-13 11:15:07', '');
INSERT INTO `m_setting` VALUES ('21', '0', 'KEY-KTKC-QA', '18', '20', 'Cần cân nhắc những gì khi mua kim cương?', '- Thấu hiểu nhu cầu của bản th&acirc;n trước khi mua kim cương.<br />\r\n- Khi đ&atilde; quyết định mua th&igrave; h&atilde;y chọn đ&uacute;ng thương hiệu c&oacute; uy t&iacute;n, đặt niềm tin v&agrave;o<br />\r\nthương hiệu v&agrave; hiểu r&otilde; về sản phẩm muốn mua.<br />\r\n- Khi c&acirc;n nhắc việc mua sản phẩm, bạn n&ecirc;n lựa chọn sản phẩm ph&ugrave; hợp với ng&acirc;n<br />\r\ns&aacute;ch v&agrave; t&igrave;nh h&igrave;nh t&agrave;i ch&iacute;nh hiện tại.<br />\r\n- Nắm r&otilde; những nguy&ecirc;n tắc v&agrave;ng &ldquo;4Cs v&agrave; hơn thế&rdquo; trong việc chọn lựa những sản<br />\r\nphẩm kim cương như &yacute;.<br />\r\n- Giấy gi&aacute;m định uy t&iacute;n.<br />\r\n- Sự thuận tiện, ch&iacute;nh s&aacute;ch minh bạch v&agrave; chế độ thu đổi cạnh tranh, linh hoạt.<br />\r\nKim cương rất phổ biến, được ti&ecirc;u chuẩn h&oacute;a v&agrave; c&oacute; khả năng trao đổi cao. V&igrave; vậy,<br />\r\nbạn cũng n&ecirc;n đề ph&ograve;ng những chi&ecirc;u thổi phồng một đặc t&iacute;nh n&agrave;o đ&oacute; của kim cương<br />\r\n(để che đậy c&aacute;c khuyết điểm kh&aacute;c), hoặc c&aacute;c chi&ecirc;u khuyến m&atilde;i gi&aacute; trị lớn (nhờ việc<br />\r\nđẩy gi&aacute; l&ecirc;n qu&aacute; cao). Khi mua những sản phẩm kim cương như vậy, th&ocirc;ng thường<br />\r\nbạn sẽ bị phụ thuộc nhiều v&agrave;o nơi b&aacute;n v&agrave; hy sinh c&aacute;c yếu tố kh&aacute;c. V&igrave; vậy đừng qu&ecirc;n<br />\r\nd&agrave;nh th&ecirc;m thời gian để so s&aacute;nh quy c&aacute;ch v&agrave; gi&aacute; cả tại c&aacute;c trung t&acirc;m kim ho&agrave;n c&oacute; uy<br />\r\nt&iacute;n trước khi quyết định mua.', null, null, '2', '2015-11-13 11:16:34', '');
INSERT INTO `m_setting` VALUES ('22', '0', 'KEY-GOOGLEAPI', null, '21', 'AIzaSyDqb_46hoSyPV4rZ4unYRbZseCxZNG6T18', null, null, null, null, null, 'Key sử dụng google api map');
INSERT INTO `m_setting` VALUES ('23', '0', 'KEY-PRODCAT', null, '22', 'm_prod_cat', null, null, null, null, null, 'Key setting prod cat');
INSERT INTO `m_setting` VALUES ('25', '0', 'KEY-PRODCAT-NHAN', '22', '23', '4', 'Nhẫn', null, null, null, null, 'Key của category Nhẫn');
INSERT INTO `m_setting` VALUES ('26', '0', 'KEY-PRODCAT-DAYCHUYEN', '22', '24', '5', 'Dây chuyền', null, null, null, null, 'Key sử dụng cho category Dây chuyền');
INSERT INTO `m_setting` VALUES ('27', '0', 'KEY-PRODCAT-VONGTAY', '22', '25', '6', 'Vòng tay', null, null, null, null, 'Key của category Vòng tay');
INSERT INTO `m_setting` VALUES ('28', '0', 'KEY-PRODCAT-HOATAI', '22', '26', '7', 'Hoa tai', null, null, null, null, 'Key của category Hoa tai');
INSERT INTO `m_setting` VALUES ('29', '0', 'KEY-PRODCAT-TRANGSUCBO', '22', '27', '8', 'Trang sức bộ', null, null, null, null, 'Key của category Trang sức bộ');
INSERT INTO `m_setting` VALUES ('30', '0', 'KEY-PROD-TAX', null, '28', 'Taxonomi product', '', '2', '2015-10-12 11:15:34', null, null, '');
INSERT INTO `m_setting` VALUES ('31', '0', 'KEY-PROD-TAX-CUOI', '28', '29', '1', 'Cưới\r\n', '2', '2015-10-12 11:16:43', '2', '2015-10-12 14:20:13', '');
INSERT INTO `m_setting` VALUES ('32', '0', 'KEY-PROD-TAX-DINHHON', '28', '30', '2', 'Đính hôn\r\n', '2', '2015-10-12 11:17:24', '2', '2015-10-12 14:20:48', '');
INSERT INTO `m_setting` VALUES ('33', '0', 'KEY-PROD-TAX-KHAC', '28', '31', '3', 'Khác\r\n', '2', '2015-10-12 11:20:28', '2', '2015-10-12 14:21:16', '');
INSERT INTO `m_setting` VALUES ('35', '0', 'KEY-GENDER', null, '32', 'Giới tính', '', '2', '2015-10-13 15:16:17', null, null, 'Key setting cha quy định giới tính');
INSERT INTO `m_setting` VALUES ('36', '0', 'KEY-GENDER-MALE', '32', '33', '1', 'NAM', '2', '2015-10-13 15:17:06', null, null, 'Key giới tính quy định nam giới');
INSERT INTO `m_setting` VALUES ('37', '0', 'KEY-GENDER-FEMALE', '32', '34', '2', 'NỮ', '2', '2015-10-13 15:18:07', null, null, 'Key giới tính quy định nữ giới');
INSERT INTO `m_setting` VALUES ('38', '0', 'KEY-KTKC-QA', '18', '35', 'Vì sao kim cương cùng kích thước và màu sắc lại có giá thành khác nhau?', 'Có lẽ bạn chưa cân nhắc đến các yếu tố quan trọng khác là: giác cắt, độ tinh khiết và\r\ngiấy chứng nhận. Hãy nhớ cân nhắc đầy đủ các yếu tố khi so sánh giá trị kim cương.\r\nCũng không loại trừ khả năng bạn phải trả giá cao hơn vì viên kim cương được bán\r\nkèm theo một món hàng “khuyến mãi” khác.', '2', '2015-10-21 10:18:38', '2', '2015-11-13 11:20:26', '');
INSERT INTO `m_setting` VALUES ('39', '0', '', null, '36', '', '<strong>Đối với kim cương trắng</strong>, m&agrave;u sắc cố thể ph&acirc;n ra nhiều cấp độ từ kh&ocirc;ng m&agrave;u đến m&agrave;u v&agrave;ng nhạt v&agrave; vi&ecirc;n kim cương c&agrave;ng trắng th&igrave; c&agrave;ng hiếm v&agrave; gi&aacute; trị c&agrave;ng cao. Trong bảng xếp loại m&agrave;u kim cương trắng của GIA ( Viện Ngọc Học Hoa Kỳ ) v&agrave; PNJLab , m&agrave;u trắng của kim cương bắt đầu từ k&yacute; tự D, E, F ... cho loại trắng kh&ocirc;ng m&agrave;u v&agrave; xếp dần xuống Z. C&aacute;ch tốt nhất để thấy được m&agrave;u sắc thật sự của một vi&ecirc;n kim cương l&agrave; nh&igrave;n n&oacute; đối diện với một mặt phẳng m&agrave;u trắng.<br />\r\n<img alt=\"\" src=\"http://210.211.121.139/pnj-service/ckupload/files/cut.PNG\" style=\"height:441px; width:450px\" /><br />\r\n<br />\r\n&nbsp;', '2', '2015-10-21 15:13:49', '2', '2015-10-22 10:08:18', '');
INSERT INTO `m_setting` VALUES ('40', '0', 'KEY-PRICE', null, '37', 'Key Price', '', '2', '2015-11-07 16:03:28', '2', '2015-11-07 16:08:40', 'Thuộc t&iacute;nh thiết lập gi&aacute; trị price tr&ecirc;n slider');
INSERT INTO `m_setting` VALUES ('41', '0', 'KEY-PRICE-MIN', '37', '38', '5000000', 'Gi&aacute; Min tr&ecirc;n slider', '2', '2015-11-07 16:08:44', '2', '2015-11-13 15:45:03', '');
INSERT INTO `m_setting` VALUES ('42', '0', 'KEY-PRICE-MAX', '37', '39', '150000000', 'Gi&aacute; max tr&ecirc;n slider', '2', '2015-11-07 16:11:08', '2', '2015-11-13 15:45:18', '');
INSERT INTO `m_setting` VALUES ('43', '0', 'KEY-PRICE-STEP', '37', '40', '3000000', 'Mỗi step gi&aacute; trị thay đổi', '2', '2015-11-07 16:19:12', '2', '2015-11-13 15:45:47', '');
INSERT INTO `m_setting` VALUES ('44', '0', 'KEY-KTKC-QA', '18', '41', 'Mua kim cương nơi nào bảo đảm nhất?', 'N&ecirc;n mua từ những nơi uy t&iacute;n l&acirc;u năm, đơn giản v&igrave; họ sẽ kh&ocirc;ng bao giờ hy sinh uy t&iacute;n<br />\r\nchỉ v&igrave; lợi nhuận của một vi&ecirc;n kim cương. Những c&ocirc;ng ty c&oacute; đội ngũ tư vấn chuy&ecirc;n<br />\r\nnghiệp, thiết bị kiểm tra đầy đủ, hệ thống cửa h&agrave;ng, thu mua rộng khắp v&agrave; tỉ lệ thu<br />\r\nmua trao đổi minh bạch cũng l&agrave; yếu tố để bạn quyết định mua.', '2', '2015-11-13 11:17:01', '2', '2015-11-13 11:19:46', '');
INSERT INTO `m_setting` VALUES ('45', '0', 'KEY-KTKC-QA', '18', '42', 'Làm sao để biết một viên kim cương là thật hay giả?', 'Rất khó để nhận biết bằng mắt thường ngay cả khi bạn có kinh nghiệm lâu năm trong\r\nnghề. Thông thường, nếu là kim cương có giá trị cao sẽ được giám định trước. Để an\r\ntâm khi mua kim cương bạn nên đến các cửa hiệu uy tín, đã hoạt động lâu năm, có\r\nnhững thiết bị kiểm tra cho khách hàng xem như bút thử kim cương, máy soi mã số\r\ncạnh… Bạn cũng có thể tìm đến các trung tâm kiểm định đá quý có uy tín để được tư\r\nvấn và hướng dẫn chọn được các sản phẩm có chất lượng tốt nhất. Hiện tại PNJLab\r\nđã có chương trình tư vấn miễn phí cho người tiêu dùng với đội ngũ chuyên viên kiểm\r\nđịnh chuyên nghiệp.', '2', '2015-11-13 11:20:43', null, null, '');
INSERT INTO `m_setting` VALUES ('46', '0', 'KEY-KTKC-QA', '18', '43', 'Có phải mọi giấy chứng nhận kim cương đều có giá trị như nhau?', 'Chỉ có giấy chứng nhận kim cương được cấp bởi các công ty/tổ chức có chuyên môn\r\ngiám định uy tín mới có giá trị. Công ty/tổ chức giám định uy tín phải có đội ngũ\r\nchuyên viên kiểm định được đào tạo chuyên nghiệp cùng với các thiết bị chuyên\r\ndụng, hiện đại hỗ trợ, được cấp phép hoạt động trong lĩnh vực giám định đá quý và\r\nhoạt động theo các tiêu chuẩn được các tổ chức kiểm soát, đo lường chất lượng công\r\nnhận (tiêu chuẩn ISO/IEC - UILAS…). Khi đảm bảo được những yêu cầu trên thì mới\r\nđảm bảo chất lượng của giấy kiểm định là chính xác. PNJLab còn là công ty đầu tiên\r\nvà duy nhất tại Việt Nam đạt tiêu chuẩn ISO/IEC 17025:2005 – VILAS 565 trong kiểm\r\nđịnh kim cương và đá quý – ngang bằng với chất lượng kiểm định của các công ty\r\nquốc tế.', '2', '2015-11-13 11:21:15', null, null, '');
INSERT INTO `m_setting` VALUES ('47', '0', 'KEY-KTKC-QA', '18', '44', 'Kim cương có giấy chứng nhận có đắt hơn không?', 'Giấy chứng nhận khẳng định chất lượng của vi&ecirc;n kim cương bạn đang sở hữu. Chi<br />\r\nph&iacute; gi&aacute;m định kh&ocirc;ng cao v&agrave; c&oacute; thể được cộng v&agrave;o gi&aacute; b&aacute;n nhưng n&oacute; chỉ chiếm tỉ lệ<br />\r\nrất nhỏ so với gi&aacute; trị vi&ecirc;n kim cương v&agrave; được xem l&agrave; tờ &ldquo;giấy th&ocirc;ng h&agrave;nh&rdquo; ch&iacute;nh thức<br />\r\nđể một vi&ecirc;n kim cương đến tay người ti&ecirc;u d&ugrave;ng.', '2', '2015-11-13 11:22:43', null, null, '');
INSERT INTO `m_setting` VALUES ('48', '0', 'KEY-KTKC-QA', '18', '45', 'Mua nữ trang kim cương PNJ có giấy chứng nhận không?', 'Hầu hết nữ trang gắn kim cương từ 4.0 mm trở l&ecirc;n tại PNJ đều c&oacute; giấy kiểm định kim<br />\r\ncương. T&ugrave;y từng sản phẩm, sẽ c&oacute; sản phẩm c&oacute; cả 2 giấy kiểm định kim cương PNJ v&agrave;<br />\r\nGIA hoặc l&agrave; chỉ c&oacute; 1 trong 2 loại giấy kiểm định PNJ hoặc GIA. C&aacute;c sản phẩm trang<br />\r\nsức kim cương kh&ocirc;ng c&oacute; giấy kiểm định sẽ c&oacute; khắc chất lượng kim cương tr&ecirc;n đai<br />\r\nsản phẩm.', '2', '2015-11-13 11:24:30', null, null, '');

-- ----------------------------
-- Table structure for `m_shop`
-- ----------------------------
DROP TABLE IF EXISTS `m_shop`;
CREATE TABLE `m_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'shop_id',
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop	 Thong tin cua hang';

-- ----------------------------
-- Records of m_shop
-- ----------------------------
INSERT INTO `m_shop` VALUES ('5', 'CaoParkSonSaiGon', 'CAO Parkson Saigon', '1', '35 Bis ', 'Lê Thánh Tôn, Q.1', '38277595', '10.780768460527117', '106.70452793558195', '0');
INSERT INTO `m_shop` VALUES ('6', 'CAOVincom', 'CAO Vincom', 'HỒ CHÍ MINH', 'Vincom (L1- 30), 70 Lê Thánh Tôn,Q. 1', '', '39939394', '10.777251', '106.701846', '0');
INSERT INTO `m_shop` VALUES ('7', 'CAOThủKhoaHuân', 'CAO Thủ Khoa Huân', 'HỒ CHÍ MINH', '16-20 Thủ Khoa Huân, Q.1', '', '38243402 / 382', '10.774812', '106.698443', '0');
INSERT INTO `m_shop` VALUES ('8', 'JEMMABẾNTHÀNH', 'JEMMA BẾN THÀNH', 'HỒ CHÍ MINH', '174 Lê Thánh Tôn, Q.1, TPHCM', '', '08.3603 1009', '10.771402', '106.696644', '0');
INSERT INTO `m_shop` VALUES ('9', 'JPSGT', 'JEMMA PARKSON SÀI GÒN TOURIST', 'HỒ CHÍ MINH', '42 Lê Thánh Tôn, Q.1, TPHCM', '', '08.3521 0299', '10.776474', '106.700883', '0');
INSERT INTO `m_shop` VALUES ('10', 'PNJNowzonesilver', 'PNJ Nowzone silver', 'HỒ CHÍ MINH', '235 Nguyễn Văn cừ, Q.1 ( tầng trệt)', '', '08 3938 1057', '10.761276', '106.683395', '0');
INSERT INTO `m_shop` VALUES ('11', 'PNJ Vincom', 'PNJ Vincom', 'HỒ CHÍ MINH', '45A Lý Tự Trọng, P. Bến Nghé, Q.1', '', '39939123', '10.77742', '106.701965', '0');
INSERT INTO `m_shop` VALUES ('12', 'Parkson Sài Gòn Tour', 'Parkson Sài Gòn Tourist', 'HỒ CHÍ MINH', '35- 45 Bis, Lê Thánh Tôn, Q.1', '', '08.3521 0299', '10.777905', '106.702438', '0');
INSERT INTO `m_shop` VALUES ('13', 'PNJ Nowzone Gold', 'PNJ Nowzone Gold', 'HỒ CHÍ MINH', '235 Nguyễn Văn Cừ Street, District 1, HCMC', '', '39381486', '10.761276', '106.683394', '0');
INSERT INTO `m_shop` VALUES ('14', 'PNJ Trần Quang Khải', 'PNJ Trần Quang Khải', 'HỒ CHÍ MINH', '21 Trần Quang Khải, P.Đa Kao, Q.1', '', '38481112', '10.792806', '106.695278', '0');
INSERT INTO `m_shop` VALUES ('15', 'PNJ Cống Quỳnh', 'PNJ Cống Quỳnh', 'HỒ CHÍ MINH', '189C Cống Quỳnh , P.Cư Trinh, Q.1', '', '39255020', '10.767544', '106.686175', '0');
INSERT INTO `m_shop` VALUES ('16', 'PNJ Tân Định', 'PNJ Tân Định', 'HỒ CHÍ MINH', '292 Hai Bà Trưng, P.Tân Định, Q1', '', '38208790', '10.789261', '106.69051', '0');
INSERT INTO `m_shop` VALUES ('17', 'PNJ Bến Thành', 'PNJ Bến Thành', 'HỒ CHÍ MINH', '172 - 174 Lê Thánh Tôn, P.Bến Thành, Q.1', '', '38248276', '10.773086', '106.697505', '0');
INSERT INTO `m_shop` VALUES ('18', 'Test01', 'Cửa hàng PNJ Võ Văn Ngân', 'Hồ Chí Minh', '30 Võ Văn Ngân', 'Quận Thủ Đức', '08043545454', '10.849906', '106.76070000000004', '0');
INSERT INTO `m_shop` VALUES ('19', 'Test02', 'Cửa hàng PNJ Coopmart Q9', null, '01 Võ Văn Ngân, Quận Thủ Đức', '', '', '10.848205657329105', '106.77448423652345', '0');
INSERT INTO `m_shop` VALUES ('20', 'PNJ Đà Nẵng 01', 'PNJ Đà Nẵng 01', '4', '80 Duy Tân, Đà Nẵng', '', '9090909090', '16.0558502516551', '108.20391550027773', '0');
INSERT INTO `m_shop` VALUES ('21', 'ABC', 'ABC Test', '1', '150 Trần Phú', '', '', '12.238775372503312', '109.19664151163943', '0');

-- ----------------------------
-- Table structure for `m_shop_prod`
-- ----------------------------
DROP TABLE IF EXISTS `m_shop_prod`;
CREATE TABLE `m_shop_prod` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_id` int(11) NOT NULL COMMENT 'shop_id',
  `prod_id` int(11) NOT NULL COMMENT 'prod_id',
  `shop_prod_sell_status` int(1) DEFAULT NULL COMMENT 'shop_prod_sell_status	 Trang thai kinh doanh san pham (0: Khong kinh doanh, 1: Dang kinh doanh, 3: Ngung kinh doanh)',
  PRIMARY KEY (`id`,`shop_id`,`prod_id`),
  KEY `prod_id` (`prod_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop_Prod	 Quan ly san pham kinh doanh theo cua hang';

-- ----------------------------
-- Records of m_shop_prod
-- ----------------------------
INSERT INTO `m_shop_prod` VALUES ('21', '5', '123', null);
INSERT INTO `m_shop_prod` VALUES ('23', '21', '123', null);
INSERT INTO `m_shop_prod` VALUES ('24', '21', '124', null);

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
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer_id',
  `customer_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_name',
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_email',
  `customer_mobi` varchar(14) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_mobi	 use for login id',
  `customer_login_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_login_password',
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
  `customer_typecard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_mobi` (`customer_mobi`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer	 Customer info table';

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('18', '000178408', 'TRẦN NGỌC TOÀN', '12345@test.com', '0947276839', 'e10adc3949ba59abbe56e057f20f883e', null, null, '135000', '2015-10-07 14:59:42', null, '0.15', '23471000', '2015-10-07 18:15:14', null, 'hue', '1', 'The Ket noi');
INSERT INTO `t_customer` VALUES ('36', '000247302', 'NGUYỄN THỊ MỸ HẠNH', 'test@gmail.com', '0123456789', '202cb962ac59075b964b07152d234b70', null, null, '67000', '1987-09-23 00:00:00', null, '0.05', '869000', '2015-10-07 20:16:45', null, null, '1', null);
INSERT INTO `t_customer` VALUES ('39', null, 'ten kh', 'werw@fas.com', '1234512345', '321123321', null, null, null, '1989-10-16 00:00:00', null, null, null, '2015-10-16 12:56:32', null, null, null, null);
INSERT INTO `t_customer` VALUES ('40', '00278738', 'Nhien', 'tdt.smile1@gmail.com', '1234567890', 'e3ceb5881a0a1fdaad01296d7554868d', 'image1446861827.jpg', null, null, '1986-03-14 00:00:00', null, '0.00', null, '2015-10-16 13:15:47', null, 'quen cha roi', '1', '');
INSERT INTO `t_customer` VALUES ('41', null, 'hhfu ughjg ughg', 'ghchvj@hjg.com', '3243234323', 'e10adc3949ba59abbe56e057f20f883e', 'image1444978201.jpg', null, null, '1998-10-16 00:00:00', null, null, null, '2015-10-16 14:47:13', null, null, null, null);
INSERT INTO `t_customer` VALUES ('42', null, 'dfs', 'test@gmial.com', '1234564131', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1992-08-16 00:00:00', null, null, null, '2015-10-16 16:56:40', null, null, null, null);
INSERT INTO `t_customer` VALUES ('43', null, 'hayquaanhoi', 'tintest@gmail.com', '1231231231', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1992-08-15 00:00:00', null, null, null, '2015-10-16 17:01:37', null, null, null, null);
INSERT INTO `t_customer` VALUES ('44', null, 'tintest', 'tintest2@gmail.com', '1233211233', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1998-02-15 00:00:00', null, null, null, '2015-10-16 17:02:48', null, null, null, null);
INSERT INTO `t_customer` VALUES ('45', null, 'tintesr12', 'tintesr12@gmsil.com', '1234566543', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2012-12-12 00:00:00', null, null, null, '2015-10-16 17:08:46', null, null, null, null);
INSERT INTO `t_customer` VALUES ('46', null, 'hang', 'ffgg@ghh.com', '1233213213', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2000-12-12 00:00:00', null, null, null, '2015-10-16 17:13:51', null, null, null, null);
INSERT INTO `t_customer` VALUES ('47', null, 'tintest3', 'tintest13@gmail.com', '12532356266', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1992-10-15 00:00:00', null, null, null, '2015-10-16 17:21:22', null, null, null, null);
INSERT INTO `t_customer` VALUES ('48', null, 'tintet4', 'tintest4@gmail.com', '123654415263', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2012-12-12 00:00:00', null, null, null, '2015-10-16 17:44:03', null, null, null, null);
INSERT INTO `t_customer` VALUES ('49', null, 'tintest5', 'tintest5@gmail.com', '12345678999', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1980-08-12 00:00:00', null, null, null, '2015-10-16 17:53:37', null, null, null, null);
INSERT INTO `t_customer` VALUES ('50', null, '64645656', 'gdggf@yahoo.com', '5545454545454', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1989-12-13 00:00:00', null, null, null, '2015-10-17 11:07:12', null, null, null, null);
INSERT INTO `t_customer` VALUES ('51', null, 'xuan huy', 'hdnhien@gmail.com', '0948780013', 'e10adc3949ba59abbe56e057f20f883e', 'no-filename1446704154.', null, null, '1983-10-12 00:00:00', null, null, null, '2015-10-17 18:18:36', null, null, null, null);
INSERT INTO `t_customer` VALUES ('52', null, 'truong', 'tintest111@gmail.com', '0907343462', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1992-02-22 00:00:00', null, null, null, '2015-10-20 11:51:46', null, null, null, null);
INSERT INTO `t_customer` VALUES ('53', null, 'Trần Đình Tin', 'tdt.smile2@gmail.com', '01202760618', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1992-08-16 00:00:00', null, null, null, '2015-10-21 11:38:44', null, null, null, null);
INSERT INTO `t_customer` VALUES ('54', '000022945', '123456789 123456789 123456789 123456789', 'doanduc87@gmail.com', '0904509495', '25f9e794323b453885f5181f1b624d0b', 'no-filename1446449122.', null, '8', '1987-04-07 00:00:00', null, '0.00', '8205000', '2015-10-22 12:26:06', null, '130 dang van bi p binh tho quan thu duc', '1', 'The Ket noi');
INSERT INTO `t_customer` VALUES ('55', null, 'DINH DUC', 'duc.dinh@mekongcorp.com', '0901234567', '25f9e794323b453885f5181f1b624d0b', 'image1446608536.jpg', null, null, '1987-12-12 00:00:00', null, null, null, '2015-10-22 18:26:31', null, null, null, null);
INSERT INTO `t_customer` VALUES ('56', null, 'Linh', 'Linh.tran@mekongmedia.com.vn', '01228020155', '58ac99d9d595e2218c7ce2af10ba57f1', null, null, null, '1980-12-22 00:00:00', null, null, null, '2015-10-30 12:07:09', null, null, null, null);
INSERT INTO `t_customer` VALUES ('57', null, 'Linh', 'Linh@yahoo.com', '01228080156', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1980-12-22 00:00:00', null, null, null, '2015-10-30 12:09:58', null, null, null, null);
INSERT INTO `t_customer` VALUES ('58', null, 'Trần Ngọc Toàn', 'toantn@vielink.vn', '0905898801', 'df10ef8509dc176d733d59549e7dbfaf', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 12:47:15', null, null, null, null);
INSERT INTO `t_customer` VALUES ('59', null, 'Toàn Trần', 'toantest@gmail.com', '0905888990', 'df10ef8509dc176d733d59549e7dbfaf', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 12:51:11', null, null, null, null);
INSERT INTO `t_customer` VALUES ('60', null, 'Tên Khách', 'tenkhach@gmail.com', '12345654321', 'c98703aed69284552ffffea25a1706d9', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 12:52:45', null, null, null, null);
INSERT INTO `t_customer` VALUES ('61', null, 'Toàn', 'toan@gmail.com', '1234543210', 'df10ef8509dc176d733d59549e7dbfaf', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 13:01:25', null, null, null, null);
INSERT INTO `t_customer` VALUES ('62', null, 'Trần Toàn', 'toantran@gmail.com', '10987654321', '3f469e9eed880b7436cff29a3c11325b', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 13:03:22', null, null, null, null);
INSERT INTO `t_customer` VALUES ('63', null, 'Tên Tào Lao', 'toantran123@gmail.com', '012345678910', 'df10ef8509dc176d733d59549e7dbfaf', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 13:08:26', null, null, null, null);
INSERT INTO `t_customer` VALUES ('64', null, 'Tên Thành Viên', 'abccba@gmail.com', '32123212321', 'e4806522ca4cf032adbad947abcfd4cb', null, null, null, '1989-11-10 00:00:00', null, null, null, '2015-10-30 13:10:24', null, null, null, null);
INSERT INTO `t_customer` VALUES ('65', null, 'ádfasdf', '1111@gmail.com', '0987654321', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1111-11-11 00:00:00', null, null, null, '2015-11-01 12:17:10', null, null, null, null);
INSERT INTO `t_customer` VALUES ('66', null, 'TOAN TRAN', 'tttt@gmail.com', '5555555555', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1111-11-11 00:00:00', null, null, null, '2015-11-01 13:14:59', null, null, null, null);
INSERT INTO `t_customer` VALUES ('67', null, 'linh', 'a@yahoo.com', '01228020122', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1980-12-22 00:00:00', null, null, null, '2015-11-02 11:55:02', null, null, null, null);
INSERT INTO `t_customer` VALUES ('68', null, 'Akira', 'ttqj@gmail.com', '0989306960', '96e79218965eb72c92a549dd5a330112', null, null, null, '1989-06-22 00:00:00', null, null, null, '2015-11-02 19:29:35', null, null, null, null);
INSERT INTO `t_customer` VALUES ('69', null, 'Luam', 'luan.daominh@gmail.com', '0935456699', 'e10adc3949ba59abbe56e057f20f883e', 'image1446779281.jpg', null, null, '1991-11-01 00:00:00', null, null, null, '2015-11-03 13:31:31', null, null, null, null);
INSERT INTO `t_customer` VALUES ('71', null, 'Duc', 'doanduc123456789@gmail.com', '0901234512345', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1028-03-23 00:00:00', null, null, null, '2015-11-04 15:31:16', null, null, null, null);
INSERT INTO `t_customer` VALUES ('72', null, 'Linh', 'L@yahoo.com', '01228020100', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1980-12-22 00:00:00', null, null, null, '2015-11-05 12:15:48', null, null, null, null);

-- ----------------------------
-- Table structure for `t_customer_`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_`;
CREATE TABLE `t_customer_` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer_id',
  `customer_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_name',
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_email',
  `customer_mobi` varchar(14) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_mobi	 use for login id',
  `customer_gender` tinyint(4) DEFAULT NULL,
  `customer_birthday` date DEFAULT NULL,
  `customer_login_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'customer_login_password',
  `customer_avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_avatar',
  `customer_member_level` int(1) DEFAULT NULL COMMENT 'customer_member_level',
  `customer_card` tinyint(20) DEFAULT NULL,
  `customer_register_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'customer_register_date',
  `customer_last_active` datetime DEFAULT NULL COMMENT 'customer_last_active',
  `customer_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'customer_location',
  `customer_cash` int(11) DEFAULT NULL,
  `customer_point` int(11) DEFAULT NULL,
  `customer_discount_percent` int(11) DEFAULT NULL,
  `customer_revenue_accumulate` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`customer_register_date`),
  UNIQUE KEY `customer_mobi` (`customer_mobi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer	 Customer info table';

-- ----------------------------
-- Records of t_customer_
-- ----------------------------

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
  PRIMARY KEY (`customer_id`,`prod_id`),
  KEY `fk_prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer_Like_Prod	 San pham quan tam';

-- ----------------------------
-- Records of t_customer_like_prod
-- ----------------------------
INSERT INTO `t_customer_like_prod` VALUES ('37', '20', '2015-10-15 11:50:10', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('37', '27', '2015-10-13 10:55:32', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '21', '2015-11-04 14:46:49', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '23', '2015-10-24 15:18:17', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '24', '2015-10-24 15:18:22', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '89', '2015-11-02 10:05:36', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '113', '2015-11-02 10:07:56', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '114', '2015-11-02 10:05:57', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('40', '122', '2015-11-13 00:01:24', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('51', '21', '2015-11-05 14:14:48', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('51', '100', '2015-11-05 14:14:59', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('52', '20', '2015-10-21 15:50:12', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('52', '23', '2015-10-29 21:49:31', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('53', '20', '2015-10-23 18:32:40', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('53', '21', '2015-10-23 18:21:36', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('53', '22', '2015-10-23 18:47:31', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '20', '2015-10-22 12:27:42', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '21', '2015-11-09 15:53:30', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '23', '2015-10-28 11:39:38', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '89', '2015-11-02 15:19:45', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '90', '2015-10-28 18:32:39', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '92', '2015-11-09 15:55:15', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '93', '2015-11-09 15:53:50', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('54', '121', '2015-11-13 15:36:42', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('71', '22', '2015-11-04 17:51:39', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '21', '2015-11-09 17:49:39', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '23', '2015-11-06 12:23:57', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '24', '2015-11-05 12:15:54', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '93', '2015-11-06 12:25:34', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '120', '2015-11-06 16:01:51', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('72', '121', '2015-11-12 15:20:39', null, null);

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
