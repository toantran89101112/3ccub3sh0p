/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : pnjmobile

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-10-09 14:23:08
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
-- Table structure for `m_carat`
-- ----------------------------
DROP TABLE IF EXISTS `m_carat`;
CREATE TABLE `m_carat` (
  `carat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'carat_id',
  `carat_value` int(2) DEFAULT NULL COMMENT 'carat_value',
  `carat_ct` decimal(2,1) DEFAULT NULL COMMENT 'carat_ct',
  `carat_li` decimal(1,1) DEFAULT NULL COMMENT 'carat_li',
  `carat_point` int(3) DEFAULT NULL COMMENT 'carat_point',
  PRIMARY KEY (`carat_id`),
  UNIQUE KEY `carat_value` (`carat_value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Carat';

-- ----------------------------
-- Records of m_carat
-- ----------------------------
INSERT INTO `m_carat` VALUES ('1', '1', '0.3', '0.9', '1');

-- ----------------------------
-- Table structure for `m_clarity`
-- ----------------------------
DROP TABLE IF EXISTS `m_clarity`;
CREATE TABLE `m_clarity` (
  `clarity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'clarity_id',
  `clarity_value` int(2) DEFAULT NULL COMMENT 'clarity_value',
  `clarity_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_code',
  `clarity_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_name',
  `clarity_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'clarity_description',
  `clarity_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`clarity_id`),
  UNIQUE KEY `clarity_value` (`clarity_value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Clarity';

-- ----------------------------
-- Records of m_clarity
-- ----------------------------
INSERT INTO `m_clarity` VALUES ('1', '1', 'D T K', 'Do Tinh Khiet 1', 'Do Tinh Khiet 1', null);
INSERT INTO `m_clarity` VALUES ('2', '2', 'D T K 2', 'Do Tinh Khiet 1', 'Do Tinh Khiet 1', null);

-- ----------------------------
-- Table structure for `m_color`
-- ----------------------------
DROP TABLE IF EXISTS `m_color`;
CREATE TABLE `m_color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'color_id',
  `color_value` int(1) DEFAULT NULL COMMENT 'carat_value',
  `color_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'color_code',
  `color_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'color_name',
  `color_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `carat_value` (`color_value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Color';

-- ----------------------------
-- Records of m_color
-- ----------------------------
INSERT INTO `m_color` VALUES ('1', '1', 'YELLOW', 'YELLOW', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Cut';

-- ----------------------------
-- Records of m_cut
-- ----------------------------
INSERT INTO `m_cut` VALUES ('1', '1', 'ASSCHER', 'ASSCHER', 'ASSCHER', null);

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
  KEY `carat_id` (`prod_diamond_info_carat`),
  CONSTRAINT `carat_id` FOREIGN KEY (`prod_diamond_info_carat`) REFERENCES `m_carat` (`carat_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cat_id` FOREIGN KEY (`prod_cat_id`) REFERENCES `m_prod_cat` (`prod_cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clarity` FOREIGN KEY (`prod_diamond_clarity`) REFERENCES `m_clarity` (`clarity_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cut` FOREIGN KEY (`prod_diamond_cut`) REFERENCES `m_cut` (`cut_value`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `diamond_color` FOREIGN KEY (`prod_diamond_color`) REFERENCES `m_color` (`color_value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod	 Products management table';

-- ----------------------------
-- Records of m_prod
-- ----------------------------
INSERT INTO `m_prod` VALUES ('2', 'code1', 'name 1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/6813na32j/image.png', 'http://s7.postimg.org/fp4oz4r2j/slide.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('3', 'code2', 'name 2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/h8w8savbf/image.png', 'http://s7.postimg.org/kl8bqtr7v/slide2.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('12', 'code3', 'name3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/qhyf2f47f/image.png', '#', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('13', 'code4', 'name4', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/5mc4r680b/image.png', '#', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('14', 'code5', 'name5', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/5mc4r680b/image.png', '#', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('15', 'code6', 'name6', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', '#', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('16', 'code7', 'name7', '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('17', 'code8', 'name8', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('18', 'code9', 'name9', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `m_prod` VALUES ('19', 'code10', 'name10', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', 'http://s7.postimg.org/aswgtp1jf/sprite_skin_flat.png', '#', '0', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `m_prod_attribute_`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_attribute_`;
CREATE TABLE `m_prod_attribute_` (
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
-- Records of m_prod_attribute_
-- ----------------------------
INSERT INTO `m_prod_attribute_` VALUES ('1', '1', '1', 'ASSCHER', 'ASSCHER', '#', '0');
INSERT INTO `m_prod_attribute_` VALUES ('2', '1', '1', 'MARSQUISE', 'MARSQUISE', '#', '0');
INSERT INTO `m_prod_attribute_` VALUES ('3', '1', '2', 'FLAWLESS SẠCH HOÀN HẢO', 'FL', '#', '0');
INSERT INTO `m_prod_attribute_` VALUES ('4', '1', '2', 'INTERNALLY FLAWLESS RẤT SẠCH', 'IF', '#', '0');
INSERT INTO `m_prod_attribute_` VALUES ('5', '1', '3', 'KHÔNG MÀU', 'D E F', '#', '0');
INSERT INTO `m_prod_attribute_` VALUES ('6', '1', '3', 'TRẮNG PHỚT', 'K L M', '#', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Cat	 Product category master table';

-- ----------------------------
-- Records of m_prod_cat
-- ----------------------------
INSERT INTO `m_prod_cat` VALUES ('1', '1', 'Nhẫn', '#', 'http://s29.postimg.org/s8ztza3on/slide.png', 'http://s29.postimg.org/o2ae67ep3/slide2.png', 'http://s29.postimg.org/o2ae67ep3/slide2.png', 'http://s29.postimg.org/o2ae67ep3/slide2.png', 'http://s29.postimg.org/o2ae67ep3/slide2.png', null, '2015-10-01 14:38:38', null, '2015-10-01 14:38:38', '0');
INSERT INTO `m_prod_cat` VALUES ('2', '1', 'Dây chuyền', '#', '', 'http://s12.postimg.org/z072wrphp/Untitled.png', 'http://s12.postimg.org/z072wrphp/Untitled.png', '', '', null, '2015-10-02 16:07:35', null, '2015-10-02 16:07:35', '0');
INSERT INTO `m_prod_cat` VALUES ('3', '1', 'Vòng tay', '#', 'http://s12.postimg.org/z072wrphp/Untitled.png', null, null, null, 'http://s12.postimg.org/z072wrphp/Untitled.png', null, '2015-10-03 12:32:15', null, '2015-10-03 12:32:15', '0');

-- ----------------------------
-- Table structure for `m_prod_price_`
-- ----------------------------
DROP TABLE IF EXISTS `m_prod_price_`;
CREATE TABLE `m_prod_price_` (
  `prod_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'prod_price_id',
  `prod_id` int(11) NOT NULL COMMENT 'prod_id',
  `prod_price_from` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'prod_price_from',
  `prod_price_to` varchar(8) COLLATE utf8_unicode_ci DEFAULT '99991231' COMMENT 'prod_price_to',
  `prod_base_price` int(11) DEFAULT NULL COMMENT 'prod_base_price',
  `prod_discount_price` int(11) DEFAULT NULL COMMENT 'prod_discount_price',
  PRIMARY KEY (`prod_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Prod_Price';

-- ----------------------------
-- Records of m_prod_price_
-- ----------------------------
INSERT INTO `m_prod_price_` VALUES ('1', '1', '1', '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Setting	 System setting table';

-- ----------------------------
-- Records of m_setting
-- ----------------------------
INSERT INTO `m_setting` VALUES ('1', '0', 'KEY-MENU', null, '1', 'Chăm sóc khách hàng', null, null, null, null, null, 'Menu ngoài cùng');
INSERT INTO `m_setting` VALUES ('2', '0', 'KEY-MENU', null, '2', 'Kiến thức kim cương', null, null, null, null, null, 'Menu ngoài cùng');
INSERT INTO `m_setting` VALUES ('3', '0', 'KEY-CSKH', '1', '3', 'CHÍNH SÁCH THU ĐỔI', null, null, null, null, null, 'Menu chính sách thu đổi nằm trong menu chăm sóc khách hàng');
INSERT INTO `m_setting` VALUES ('4', '0', 'KEY-CSKH-CSTD', '3', '4', 'THU ĐỔI KIM CƯƠNG THIÊN NHIÊN', 'Nội dung bài viết thu đổi kim cương thiên nhiên hiển thị trên app nằm ở đây', null, null, null, null, 'Bài viết thu đổi kim cương thiên nhiên nằm trong chính sách thu đổi');
INSERT INTO `m_setting` VALUES ('5', '0', 'KEY-CSKH', '1', '5', 'CHÍNH SÁCH BẢO HÀNH', null, null, null, null, null, 'Menu Chính sách bảo hành nằm trong menu Chăm sóc khách hàng');
INSERT INTO `m_setting` VALUES ('6', '0', 'KEY-CSKH-CSBH', '5', '6', 'CHÍNH SÁCH BẢO HÀNH', 'Nội dung bài viết chính sách bảo hành nằm ở đây', null, null, null, null, 'Bài viết chính sách bảo hành nằm trong chính sách bảo hành');
INSERT INTO `m_setting` VALUES ('7', '0', 'KEY-CSKH-CSTD', '3', '7', 'THỦ ĐỔI TRANG SỨC KIM CƯƠNG', 'Nội dung bài viết thu đổi trang sức kim cương nằm ở đây', null, null, null, null, 'Bài viết thu đổi trang sức kim cương nằm trong chính sách thu đổi');
INSERT INTO `m_setting` VALUES ('8', '0', 'KEY-KTKC', '2', '8', '4CS', null, null, null, null, null, 'Menu 4cs trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('9', '0', 'KEY-KTKC-4CS', '8', '9', 'CUT', 'Nội dung bài viết CUT trong 4cs', null, null, null, null, 'Bài viết cut trong 4cs');
INSERT INTO `m_setting` VALUES ('10', '0', 'KEY-KTKC-4CS', '8', '10', 'CARAT', 'Nội dung bài viết carat', null, null, null, null, 'Bài viết carat trong 4cs');
INSERT INTO `m_setting` VALUES ('11', '0', 'KEY-KTKC-4CS', '8', '11', 'CLARITY', 'Nội dung bài viết clarity', null, null, null, null, 'Bài viết clarity trong 4cs');
INSERT INTO `m_setting` VALUES ('12', '0', 'KEY-KTKC-4CS', '8', '12', 'COLOR', 'Nội dung bài viết color', null, null, null, null, 'Bài viết color trong 4cs');
INSERT INTO `m_setting` VALUES ('13', '0', 'KEY-KTKC', '2', '13', 'CERTIFICATE', null, null, null, null, null, 'Menu certificate trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('14', '0', 'KEY-KTKC-CERTIFICATE', '13', '14', 'CERTIFICATE', 'Nội dung bài viết certificate', null, null, null, null, 'Bài viết certificate trong menu certificate');
INSERT INTO `m_setting` VALUES ('15', '0', 'KEY-KTKC', '2', '15', 'CÂU CHUYỆN KIM CƯƠNG', null, null, null, null, null, 'Menu Câu chuyện kim cương trong Kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('17', '0', 'KEY-KTKC-CCKC', '15', '16', 'CÂU CHUYỆN 1', 'Nội dung câu chuyện 1', null, null, null, null, 'Bài viết câu chuyện 1 trong câu chuyên kim cương');
INSERT INTO `m_setting` VALUES ('18', '0', 'KEY-KTKC-CCKC', '15', '17', 'CÂU CHUYỆN 2', 'Nội dung câu chuyên 2', null, null, null, null, 'Bài viết câu chuyện 2 trong câu chuyện kim cương');
INSERT INTO `m_setting` VALUES ('19', '0', 'KEY-KTKC', '2', '18', 'QA', null, null, null, null, null, 'Menu QA trong kiến thức kim cương');
INSERT INTO `m_setting` VALUES ('20', '0', 'KEY-KTKC-QA', '18', '19', 'QA 1', 'Nội dung QA 1', null, null, null, null, 'Bài viết QA 1 trong menu QA');
INSERT INTO `m_setting` VALUES ('21', '0', 'KEY-KTKC-QA', '18', '20', 'QA 2', 'Nội dung QA 1', null, null, null, null, 'Bài viết QA 2 trong menu QA');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop	 Thong tin cua hang';

-- ----------------------------
-- Records of m_shop
-- ----------------------------
INSERT INTO `m_shop` VALUES ('1', 'sh1', 'shop 1', '1', 'v', 'adsf', '0900780', '15.891565', '108.247786', '0');
INSERT INTO `m_shop` VALUES ('2', 'sh2', 'shop 2', '1', 'fasd', 'ádf', '0900780', '21.571198', '107.148452', null);
INSERT INTO `m_shop` VALUES ('3', 'sh3', 'shop3', '1', 'fafasd', 'adfasdf', '34563456', '17.941921', '106.513481', null);
INSERT INTO `m_shop` VALUES ('4', 'sh4', 'shop4', '1', 'sggfgsfd', 'sfdgsfg', '35363456', '21.630325', '105.181455', null);

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
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `m_prod` (`prod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `m_shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='M_Shop_Prod	 Quan ly san pham kinh doanh theo cua hang';

-- ----------------------------
-- Records of m_shop_prod
-- ----------------------------
INSERT INTO `m_shop_prod` VALUES ('1', '2', '3', null);
INSERT INTO `m_shop_prod` VALUES ('3', '1', '3', null);
INSERT INTO `m_shop_prod` VALUES ('4', '3', '3', null);
INSERT INTO `m_shop_prod` VALUES ('5', '4', '3', null);

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
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_mobi` (`customer_mobi`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer	 Customer info table';

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('18', null, 'customer name 1', 'email@emial.com', '0947276839', '2b9d8ade798740f575c33b1ed863c8cd', null, '2', '135000', '2015-10-07 00:00:00', null, '9.99', '23471000', '2015-10-07 17:41:49', null, 'Hue', null);
INSERT INTO `t_customer` VALUES ('19', null, null, null, '2345678901', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '2015-10-07 13:57:46', null, null, null, null, null, null, null);
INSERT INTO `t_customer` VALUES ('20', null, 'abcdef', 'emal@df.com', '3453453455656', 'afsdfqet345', null, null, null, '2014-07-07 00:00:00', null, null, null, '2015-10-07 12:35:06', null, null, null);
INSERT INTO `t_customer` VALUES ('21', null, 'abcdef', 'emdal@df.com', '34534534556546', 'afsdfqet345', null, null, null, '2014-07-07 00:00:00', null, null, null, '2015-10-07 14:01:08', null, null, null);
INSERT INTO `t_customer` VALUES ('22', null, 'abcdef', 'edal@df.com', '3453453456546', 'afsdfqet345', null, null, null, '2014-07-27 09:13:39', null, null, null, '2015-10-07 14:13:39', null, null, null);
INSERT INTO `t_customer` VALUES ('23', null, 'abcdef', 'e2dal@df.com', '34534533456546', 'afsdfqet345', null, null, null, '2014-07-27 00:00:00', null, null, null, '2015-10-07 14:15:40', null, null, null);
INSERT INTO `t_customer` VALUES ('24', null, 'abcdef', 'e2dgl@df.com', '34534533446546', 'afsdfqet345', null, null, null, '1986-03-14 00:00:00', null, null, null, '2015-10-07 14:44:12', null, null, null);

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
  KEY `fk_prod_id` (`prod_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `m_prod` (`prod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='T_Customer_Like_Prod	 San pham quan tam';

-- ----------------------------
-- Records of t_customer_like_prod
-- ----------------------------
INSERT INTO `t_customer_like_prod` VALUES ('32', '2', '2015-10-01 16:57:49', null, null);
INSERT INTO `t_customer_like_prod` VALUES ('32', '3', '2015-10-01 15:13:15', '1', '2015-10-01 15:13:20');

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
