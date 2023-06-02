/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : jtsz_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-17 23:12:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_expend`
-- ----------------------------
DROP TABLE IF EXISTS `t_expend`;
CREATE TABLE `t_expend` (
  `expendId` int(11) NOT NULL auto_increment COMMENT '支出id',
  `exprendTypeObj` int(11) NOT NULL COMMENT '支出类型',
  `expendPurpose` varchar(60) NOT NULL COMMENT '支出用途',
  `payWayObj` int(11) NOT NULL COMMENT '支付方式',
  `payAccount` varchar(20) NOT NULL COMMENT '支付账号',
  `expendMoney` float NOT NULL COMMENT '支付金额',
  `expendDate` varchar(20) default NULL COMMENT '支付日期',
  `userObj` varchar(30) NOT NULL COMMENT '支出用户',
  `expendMemo` varchar(20) default NULL COMMENT '支出备注',
  PRIMARY KEY  (`expendId`),
  KEY `exprendTypeObj` (`exprendTypeObj`),
  KEY `payWayObj` (`payWayObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_expend_ibfk_1` FOREIGN KEY (`exprendTypeObj`) REFERENCES `t_expendtype` (`expendTypeId`),
  CONSTRAINT `t_expend_ibfk_2` FOREIGN KEY (`payWayObj`) REFERENCES `t_payway` (`payWayId`),
  CONSTRAINT `t_expend_ibfk_3` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expend
-- ----------------------------
INSERT INTO `t_expend` VALUES ('1', '2', '买六个核桃', '1', 'dasheef@163.com', '88', '2018-03-22', 'user1', '我的支出');
INSERT INTO `t_expend` VALUES ('2', '1', '买衣服', '1', '614124@qq.com', '180', '2018-03-29', 'user1', '淘宝买了一个外套');
INSERT INTO `t_expend` VALUES ('3', '4', '和朋友们一起ktv', '4', '--', '68', '2018-04-03', 'user1', '人均68元一个');
INSERT INTO `t_expend` VALUES ('4', '1', '和闺蜜一起买衣服', '2', 'mengmeng1994', '480', '2018-04-11', 'user2', '买衣服啦');
INSERT INTO `t_expend` VALUES ('5', '4', '和闺蜜一起纹眉', '4', '--', '580', '2018-04-19', 'user2', '爱美人人有');

-- ----------------------------
-- Table structure for `t_expendtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_expendtype`;
CREATE TABLE `t_expendtype` (
  `expendTypeId` int(11) NOT NULL auto_increment COMMENT '支出类型id',
  `expendTypeName` varchar(20) NOT NULL COMMENT '支出类型名称',
  PRIMARY KEY  (`expendTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expendtype
-- ----------------------------
INSERT INTO `t_expendtype` VALUES ('1', '衣服');
INSERT INTO `t_expendtype` VALUES ('2', '食品');
INSERT INTO `t_expendtype` VALUES ('3', '住宿');
INSERT INTO `t_expendtype` VALUES ('4', '娱乐');

-- ----------------------------
-- Table structure for `t_income`
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `incomeId` int(11) NOT NULL auto_increment COMMENT '收入id',
  `incomeTypeObj` int(11) NOT NULL COMMENT '收入类型',
  `incomeFrom` varchar(50) NOT NULL COMMENT '收入来源',
  `payWayObj` int(11) NOT NULL COMMENT '支付方式',
  `payAccount` varchar(20) NOT NULL COMMENT '支付账号',
  `incomeMoney` float NOT NULL COMMENT '收入金额',
  `incomeDate` varchar(20) default NULL COMMENT '收入日期',
  `userObj` varchar(20) NOT NULL COMMENT '收入用户',
  `incomeMemo` varchar(800) default NULL COMMENT '收入备注',
  PRIMARY KEY  (`incomeId`),
  KEY `incomeTypeObj` (`incomeTypeObj`),
  KEY `payWayObj` (`payWayObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_income_ibfk_1` FOREIGN KEY (`incomeTypeObj`) REFERENCES `t_incometype` (`typeId`),
  CONSTRAINT `t_income_ibfk_2` FOREIGN KEY (`payWayObj`) REFERENCES `t_payway` (`payWayId`),
  CONSTRAINT `t_income_ibfk_3` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('1', '1', '3月工资', '1', '51791275@qq.com', '3500', '2018-03-30', 'user1', 'dd');
INSERT INTO `t_income` VALUES ('2', '2', '3月奖金', '1', 'etouhqorf@163.com', '380', '2018-03-31', 'user1', '全勤奖');
INSERT INTO `t_income` VALUES ('3', '1', '4月份工资', '2', 'mengmeng1994', '2950', '2018-04-28', 'user2', '我的工资');
INSERT INTO `t_income` VALUES ('4', '2', '4月全勤奖', '4', '--', '300', '2018-04-30', 'user2', 'test收入');

-- ----------------------------
-- Table structure for `t_incometype`
-- ----------------------------
DROP TABLE IF EXISTS `t_incometype`;
CREATE TABLE `t_incometype` (
  `typeId` int(11) NOT NULL auto_increment COMMENT '分类id',
  `typeName` varchar(20) NOT NULL COMMENT '分类名称',
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_incometype
-- ----------------------------
INSERT INTO `t_incometype` VALUES ('1', '工资');
INSERT INTO `t_incometype` VALUES ('2', '奖金');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '钱多了怎么理财', '<p>可以投资股票，投资房地产</p>', '2018-03-30 16:11:00');

-- ----------------------------
-- Table structure for `t_payway`
-- ----------------------------
DROP TABLE IF EXISTS `t_payway`;
CREATE TABLE `t_payway` (
  `payWayId` int(11) NOT NULL auto_increment COMMENT '支付方式id',
  `payWayName` varchar(20) NOT NULL COMMENT '支付方式名称',
  PRIMARY KEY  (`payWayId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payway
-- ----------------------------
INSERT INTO `t_payway` VALUES ('1', '支付宝');
INSERT INTO `t_payway` VALUES ('2', '微信');
INSERT INTO `t_payway` VALUES ('3', 'POS机');
INSERT INTO `t_payway` VALUES ('4', '现金');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '爸爸：双鱼林', '男', '2018-03-07', 'upload/c5172da2-dcce-4cba-a628-ceea4d5391d7.jpg', '13573598343', 'xiaoshua@163.com', '四川成都红星路13号', '2018-03-30 16:09:19');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '妈妈：李萌萌', '女', '2018-04-01', 'upload/aee65cdf-33d2-431f-8edd-bc60e634204b.jpg', '13980903541', 'mengmeng@163.com', '四川成都建设路10号', '2018-04-06 11:37:57');
