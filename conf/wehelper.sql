-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-08-12 12:36:26
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wehelper`
--

-- --------------------------------------------------------

--
-- 表的结构 `wh_address`
--

CREATE TABLE IF NOT EXISTS `wh_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT 'user_id',
  `address` varchar(128) DEFAULT NULL COMMENT 'address',
  `city` varchar(64) DEFAULT NULL COMMENT 'city',
  `province` varchar(64) DEFAULT NULL COMMENT 'province',
  `status` int(1) DEFAULT NULL COMMENT 'status',
  `phone` varchar(16) DEFAULT NULL COMMENT 'phone',
  `name` varchar(32) DEFAULT NULL COMMENT 'name',
  `gender` int(1) DEFAULT NULL COMMENT 'gender',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_chainshop`
--

CREATE TABLE IF NOT EXISTS `wh_chainshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(128) DEFAULT NULL COMMENT 'name',
  `pic` varchar(64) DEFAULT NULL COMMENT 'pic',
  `status` int(11) DEFAULT NULL COMMENT 'status',
  `category` varchar(128) DEFAULT NULL COMMENT 'category',
  `address` varchar(128) DEFAULT NULL COMMENT 'address',
  `province` int(1) DEFAULT NULL COMMENT 'province',
  `city` varchar(24) DEFAULT NULL COMMENT 'city',
  `country` varchar(64) DEFAULT NULL COMMENT 'country',
  `lat` varchar(64) DEFAULT NULL COMMENT 'lat',
  `lng` varchar(64) DEFAULT NULL COMMENT 'lng',
  `tag` varchar(128) DEFAULT NULL COMMENT 'tag',
  `range` varchar(128) DEFAULT NULL COMMENT 'range',
  `deliver_desc` varchar(64) DEFAULT NULL COMMENT 'deliver_desc',
  `timezone` varchar(64) DEFAULT NULL COMMENT 'timezone',
  `unit` varchar(128) DEFAULT NULL COMMENT 'unit',
  `bg_color` varchar(128) DEFAULT NULL COMMENT 'bg_color',
  `member_url` varchar(256) DEFAULT NULL COMMENT 'member_url',
  `need_pay` int(1) DEFAULT NULL COMMENT 'need_pay',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_combo_product`
--

CREATE TABLE IF NOT EXISTS `wh_combo_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `combo_id` int(11) DEFAULT NULL COMMENT 'combo_id',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id',
  `index` int(2) DEFAULT NULL COMMENT 'index',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_date_setting`
--

CREATE TABLE IF NOT EXISTS `wh_date_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `type` int(1) DEFAULT NULL COMMENT 'type',
  `add_time` int(11) DEFAULT NULL COMMENT 'add_time',
  `update_time` int(11) DEFAULT NULL COMMENT 'update_time',
  `week_day` int(1) DEFAULT NULL COMMENT 'week_day',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `start_date` varchar(18) DEFAULT NULL COMMENT 'start_date',
  `end_date` varchar(18) DEFAULT NULL COMMENT 'end_date',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_device`
--

CREATE TABLE IF NOT EXISTS `wh_device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'device_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `user` varchar(64) DEFAULT NULL COMMENT 'user',
  `status` int(1) DEFAULT NULL COMMENT 'status',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_dict`
--

CREATE TABLE IF NOT EXISTS `wh_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` varchar(128) DEFAULT NULL COMMENT 'name_en',
  `type` int(2) DEFAULT NULL COMMENT 'type',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_favorite`
--

CREATE TABLE IF NOT EXISTS `wh_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT 'user_id',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id',
  `add_time` int(11) DEFAULT NULL COMMENT 'add_time',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_home_setting`
--

CREATE TABLE IF NOT EXISTS `wh_home_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `pic` varchar(128) DEFAULT NULL COMMENT 'pic',
  `title` varchar(128) DEFAULT NULL COMMENT 'title',
  `content` varchar(128) DEFAULT NULL COMMENT 'content',
  `index` int(2) DEFAULT NULL COMMENT 'index',
  `type` int(1) DEFAULT NULL COMMENT 'type',
  `url` varchar(128) DEFAULT NULL COMMENT 'url',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_keyword`
--

CREATE TABLE IF NOT EXISTS `wh_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `keyword` varchar(128) DEFAULT NULL COMMENT 'keyword',
  `content` text COMMENT 'content',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_member`
--

CREATE TABLE IF NOT EXISTS `wh_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` int(11) DEFAULT NULL COMMENT 'phone',
  `name` int(11) DEFAULT NULL COMMENT 'name',
  `first_name` int(11) DEFAULT NULL COMMENT 'first_name',
  `add_time` int(10) DEFAULT NULL COMMENT 'add_time',
  `update_time` int(10) DEFAULT NULL COMMENT 'update_time',
  `last_active_time` int(10) DEFAULT NULL COMMENT 'last_active_time',
  `timezone` int(2) DEFAULT NULL COMMENT 'timezone',
  `discount` float DEFAULT NULL COMMENT 'discount',
  `credit` int(11) DEFAULT NULL COMMENT 'credit',
  `balance` float DEFAULT NULL COMMENT 'balance',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_menu`
--

CREATE TABLE IF NOT EXISTS `wh_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '系统url',
  `parentId` int(10) DEFAULT NULL COMMENT ' 父id 关联wh_menu.id',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除，1=已删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `actions` varchar(500) DEFAULT '0' COMMENT '注册Action 按钮|分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_menu_btn`
--

CREATE TABLE IF NOT EXISTS `wh_menu_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` int(11) NOT NULL COMMENT ' 菜单id关联 wh_menu.id',
  `btnName` varchar(30) DEFAULT NULL COMMENT '按钮名称',
  `btnType` varchar(30) DEFAULT NULL COMMENT '按钮类型，用于列表页显示的按钮',
  `actionUrls` varchar(250) DEFAULT NULL COMMENT 'url注册，用"," 分隔 。用于权限控制UR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_merchant`
--

CREATE TABLE IF NOT EXISTS `wh_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(128) DEFAULT NULL COMMENT 'name',
  `password` varchar(64) DEFAULT NULL COMMENT 'password',
  `add_time` int(11) DEFAULT NULL COMMENT 'add_time',
  `appId` varchar(128) DEFAULT NULL COMMENT 'appId',
  `appSecret` varchar(128) DEFAULT NULL COMMENT 'appSecret',
  `description` int(1) DEFAULT NULL COMMENT 'description',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_order`
--

CREATE TABLE IF NOT EXISTS `wh_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'order_id',
  `name` varchar(128) DEFAULT NULL COMMENT 'name',
  `phone` varchar(12) DEFAULT NULL COMMENT 'phone',
  `add_time` int(10) DEFAULT NULL COMMENT 'add_time',
  `address` varchar(128) DEFAULT NULL COMMENT 'address',
  `gender` int(1) DEFAULT NULL COMMENT 'gender',
  `order_status` int(1) DEFAULT NULL COMMENT 'order_status',
  `pay_status` int(1) DEFAULT NULL COMMENT 'pay_status',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `remark` varchar(128) DEFAULT NULL COMMENT 'remark',
  `update_time` int(64) DEFAULT NULL COMMENT 'update_time',
  `price` float DEFAULT NULL COMMENT 'price',
  `device_id` int(11) DEFAULT NULL COMMENT 'device_id',
  `location` varchar(64) DEFAULT NULL COMMENT 'location',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_order_detail`
--

CREATE TABLE IF NOT EXISTS `wh_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(11) DEFAULT NULL COMMENT 'order_id',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id',
  `price` float DEFAULT NULL COMMENT 'price',
  `num` int(3) DEFAULT NULL COMMENT 'num',
  `final_price` float DEFAULT NULL COMMENT 'final_price',
  `requirement` varchar(128) DEFAULT NULL COMMENT 'requirement',
  `remark` varchar(128) DEFAULT NULL COMMENT 'remark',
  `items` text COMMENT 'items',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_post`
--

CREATE TABLE IF NOT EXISTS `wh_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `autho` varchar(128) DEFAULT NULL COMMENT 'autho',
  `status` int(1) DEFAULT NULL COMMENT 'status',
  `add_time` int(10) DEFAULT NULL COMMENT 'add_time',
  `title` text COMMENT 'title',
  `type` varchar(20) DEFAULT NULL COMMENT 'type',
  `view_count` int(10) DEFAULT NULL COMMENT 'view_count',
  `content` text COMMENT 'content',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product`
--

CREATE TABLE IF NOT EXISTS `wh_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` varchar(128) DEFAULT NULL COMMENT 'name_en',
  `level` int(1) DEFAULT NULL COMMENT 'level',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `index` int(2) DEFAULT NULL COMMENT 'index',
  `type` int(2) DEFAULT NULL COMMENT 'type',
  `category_id` int(11) DEFAULT NULL COMMENT 'category_id',
  `pic` varchar(128) DEFAULT NULL COMMENT 'pic',
  `price` float DEFAULT NULL COMMENT 'price',
  `member_price` float DEFAULT NULL COMMENT 'member_price',
  `preferential_price` float DEFAULT NULL COMMENT 'preferential_price',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product_category`
--

CREATE TABLE IF NOT EXISTS `wh_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` varchar(128) DEFAULT NULL COMMENT 'name_en',
  `type` int(1) DEFAULT NULL COMMENT 'type',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product_child`
--

CREATE TABLE IF NOT EXISTS `wh_product_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` varchar(128) DEFAULT NULL COMMENT 'name_en',
  `level` int(1) DEFAULT NULL COMMENT 'level',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `index` int(2) DEFAULT NULL COMMENT 'index',
  `type` int(2) DEFAULT NULL COMMENT 'type',
  `pic` varchar(128) DEFAULT NULL COMMENT 'pic',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product_combo`
--

CREATE TABLE IF NOT EXISTS `wh_product_combo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` varchar(128) DEFAULT NULL COMMENT 'name_en',
  `enable` int(1) DEFAULT NULL COMMENT 'enable',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `type` int(2) DEFAULT NULL COMMENT 'type',
  `price` float DEFAULT NULL COMMENT 'price',
  `left` smallint(5) DEFAULT NULL COMMENT 'left',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product_relation`
--

CREATE TABLE IF NOT EXISTS `wh_product_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) DEFAULT NULL COMMENT 'pid',
  `cid` int(11) DEFAULT NULL COMMENT 'cid',
  `type` int(1) DEFAULT NULL COMMENT 'type',
  `min` int(2) DEFAULT NULL COMMENT 'min',
  `max` int(2) DEFAULT NULL COMMENT 'max',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_product_special`
--

CREATE TABLE IF NOT EXISTS `wh_product_special` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(2) DEFAULT NULL COMMENT 'type',
  `name_cn` varchar(128) DEFAULT NULL COMMENT 'name_cn',
  `name_en` int(1) DEFAULT NULL COMMENT 'name_en',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `chainshop_id` int(11) DEFAULT NULL COMMENT 'chainshop_id',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_qa`
--

CREATE TABLE IF NOT EXISTS `wh_qa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(128) DEFAULT NULL COMMENT 'title',
  `chainshop_id` varchar(64) DEFAULT NULL COMMENT 'chainshop_id',
  `merchant_id` int(11) DEFAULT NULL COMMENT 'merchant_id',
  `add_time` int(10) DEFAULT NULL COMMENT 'add_time',
  `update_time` int(10) DEFAULT NULL COMMENT 'update_time',
  `start_time` int(10) DEFAULT NULL COMMENT 'start_time',
  `end_time` int(10) DEFAULT NULL COMMENT 'end_time',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_qa_answer`
--

CREATE TABLE IF NOT EXISTS `wh_qa_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `question_id` int(11) DEFAULT NULL COMMENT 'question_id',
  `content` text COMMENT 'content',
  `index` int(11) DEFAULT NULL COMMENT 'index',
  `pic` varchar(128) DEFAULT NULL COMMENT 'pic',
  `value` varchar(128) DEFAULT NULL COMMENT 'value',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_qa_question`
--

CREATE TABLE IF NOT EXISTS `wh_qa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(128) DEFAULT NULL COMMENT 'title',
  `type` varchar(64) DEFAULT NULL COMMENT 'type',
  `pic` varchar(128) DEFAULT NULL COMMENT 'pic',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_qa_tpl`
--

CREATE TABLE IF NOT EXISTS `wh_qa_tpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(128) DEFAULT NULL COMMENT 'name',
  `content` text COMMENT 'content',
  `avaiable` int(1) DEFAULT NULL COMMENT 'avaiable',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_role`
--

CREATE TABLE IF NOT EXISTS `wh_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `roleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateBy` int(11) DEFAULT NULL COMMENT '修改人',
  `state` int(1) DEFAULT NULL COMMENT '状态0=可用 1=禁用',
  `descr` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_role_rel`
--

CREATE TABLE IF NOT EXISTS `wh_role_rel` (
  `roleId` int(11) NOT NULL COMMENT '角色主键 wh_role.id',
  `objId` int(11) NOT NULL COMMENT '关联主键 type=0管理wh_menu.id, type=1关联wh_user.id',
  `relType` int(1) DEFAULT NULL COMMENT '关联类型 0=菜单,1=用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wh_system_setting`
--

CREATE TABLE IF NOT EXISTS `wh_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` varchar(128) DEFAULT NULL COMMENT 'varname',
  `value` text COMMENT 'value',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_time_setting`
--

CREATE TABLE IF NOT EXISTS `wh_time_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_setting_id` int(11) DEFAULT NULL COMMENT 'date_setting_id',
  `add_time` int(11) DEFAULT NULL COMMENT 'add_time',
  `update_time` int(11) DEFAULT NULL COMMENT 'update_time',
  `start_time` varchar(18) DEFAULT NULL COMMENT 'start_time',
  `end_time` varchar(18) DEFAULT NULL COMMENT 'end_time',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wh_user`
--

CREATE TABLE IF NOT EXISTS `wh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(128) DEFAULT NULL COMMENT '登录名',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `wh_unino_id` varchar(128) DEFAULT NULL COMMENT 'union ID',
  `gender` int(1) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(24) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省份',
  `city` varchar(64) DEFAULT NULL COMMENT '城市',
  `country` varchar(64) DEFAULT NULL COMMENT '国家',
  `headimgurl` varchar(128) DEFAULT NULL COMMENT '头像',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0=可用,1=禁用',
  `loginCount` int(11) DEFAULT NULL COMMENT '登录总次数',
  `loginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `superAdmin` int(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0= 不是，1=是',
  `createTime` datetime DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wh_user`
--

INSERT INTO `wh_user` (`id`, `username`, `email`, `password`, `wh_unino_id`, `gender`, `birthday`, `province`, `city`, `country`, `headimgurl`, `state`, `loginCount`, `loginTime`, `superAdmin`, `createTime`, `createBy`, `updateTime`, `updateBy`, `deleted`) VALUES
(1, 'wehelper', 'wehelper@officialwehelper.com', 'ED8DD4408DFD0A625B64E060BEF78DF0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8, '2014-08-12 18:14:31', 1, NULL, NULL, '2014-08-12 18:14:31', NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
