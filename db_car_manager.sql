/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_car_manager

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-12 11:08:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_car`
-- ----------------------------
DROP TABLE IF EXISTS `c_car`;
CREATE TABLE `c_car` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `brandId` int(5) NOT NULL,
  `carName` varchar(100) NOT NULL,
  `carOldPrice` varchar(32) NOT NULL,
  `carPrice` varchar(32) NOT NULL,
  `carAge` varchar(32) NOT NULL,
  `carGearBox` varchar(32) NOT NULL,
  `carType` varchar(32) NOT NULL,
  `carMileage` varchar(32) NOT NULL,
  `carOutputVolume` varchar(32) NOT NULL,
  `carOutputStand` varchar(32) NOT NULL,
  `carSeatCount` varchar(32) NOT NULL,
  `carOilType` varchar(32) NOT NULL,
  `carColor` varchar(32) NOT NULL,
  `carNumberPlace` varchar(32) NOT NULL,
  `carInfo` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_brand` (`brandId`),
  CONSTRAINT `car_brand` FOREIGN KEY (`brandId`) REFERENCES `c_car_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_car
-- ----------------------------
INSERT INTO `c_car` VALUES ('1', '1242', '途观', '6768762', '7667', '1', '自动', 'SUV', '1', '2.5L-3.0', '5', '5', '汽油', '白色', '河南', '途观很牛逼');
INSERT INTO `c_car` VALUES ('2', '1249', '自由光', '11676876', '127667', '8', '自动', 'SUV', '10', '4.0L+', '4', '5', '柴油', '黑色', '北京', '大哥');
INSERT INTO `c_car` VALUES ('3', '1257', '五菱宏光', '66876', '7667', '10+', '手动', 'MPV', '10+', '1.6L-2.0L', '3', '7+', '汽油', '白色', '长安', '最牛神车');
INSERT INTO `c_car` VALUES ('4', '1250', '马自达cx6', '54545', '5654', '8', '自动', 'SUV', '8', '2.0L-2.5L', '4', '2', '汽油', '白色', '上海', ' 动力方面,马自达CX6或搭载2.4T创驰蓝天汽油发动机');
INSERT INTO `c_car` VALUES ('8', '1243', '汉兰达', '360000', '210000', '5', '自动', 'SUV', '8', '2.5L-3.0', '3', '6', '汽油', '白色', '新疆', '汉兰达，男人的象征');

-- ----------------------------
-- Table structure for `c_car_brand`
-- ----------------------------
DROP TABLE IF EXISTS `c_car_brand`;
CREATE TABLE `c_car_brand` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(32) NOT NULL,
  `brandInfo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_car_brand
-- ----------------------------
INSERT INTO `c_car_brand` VALUES ('1239', '奥迪', '好车');
INSERT INTO `c_car_brand` VALUES ('1240', '本田', '家用车');
INSERT INTO `c_car_brand` VALUES ('1241', '长安', '国产车');
INSERT INTO `c_car_brand` VALUES ('1242', '大众', '真的很大众');
INSERT INTO `c_car_brand` VALUES ('1243', '丰田', '日系车');
INSERT INTO `c_car_brand` VALUES ('1245', '广汽传祺', '国产车');
INSERT INTO `c_car_brand` VALUES ('1246', '哈弗', '国产车');
INSERT INTO `c_car_brand` VALUES ('1247', '吉利', '国产');
INSERT INTO `c_car_brand` VALUES ('1248', '凯迪拉克', '(上汽通用凯迪拉克)');
INSERT INTO `c_car_brand` VALUES ('1249', '路虎', '土豪喜欢');
INSERT INTO `c_car_brand` VALUES ('1250', '马自达', '日产好像也是');
INSERT INTO `c_car_brand` VALUES ('1251', '纳智捷', '费油');
INSERT INTO `c_car_brand` VALUES ('1252', '讴歌', '国外');
INSERT INTO `c_car_brand` VALUES ('1253', '奇瑞', '国产车');
INSERT INTO `c_car_brand` VALUES ('1254', '日产', '(东风日产)');
INSERT INTO `c_car_brand` VALUES ('1255', '斯柯达', '不要以为是胶卷，暴露年龄');
INSERT INTO `c_car_brand` VALUES ('1256', '特斯拉', '自动驾驶');
INSERT INTO `c_car_brand` VALUES ('1257', '五菱', '神车');
INSERT INTO `c_car_brand` VALUES ('1258', '现代', '北京现代');
INSERT INTO `c_car_brand` VALUES ('1259', '英菲尼迪', '(进口)');
INSERT INTO `c_car_brand` VALUES ('1260', '众泰', '皮尺部很出名');

-- ----------------------------
-- Table structure for `c_user`
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('1', 'admin', '1');
