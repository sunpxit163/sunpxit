/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-08-14 23:46:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(32) NOT NULL,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  `memberId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `p` (`productId`),
  KEY `m` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A8010831', '111111', '2019-08-13 16:53:38', '2', '没什么', '0', '1', '5555', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2019-08-13 16:53:43', '2', '没什么', '0', '1', '6666', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` varchar(32) NOT NULL DEFAULT '',
  `travellerId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `s4` (`travellerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(32) NOT NULL,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('null021c851e-9652-4ce2-b8c2-a3f3', 'permission save', '/permission/save.do');
INSERT INTO `permission` VALUES ('null7e6bf9a2-9fdb-435b-b8ba-897f', 'permission save', '/permission/save.do');
INSERT INTO `permission` VALUES ('null9a3817aa-fc25-480c-8fb6-02c4', 'vvvv', '/permission/findAll1112.do444');
INSERT INTO `permission` VALUES ('nullc394748b-5f27-4d07-8ab1-1de0', 'AAA', '/permission/findAll1112.do');
INSERT INTO `permission` VALUES ('nullc8decc8a-4d14-42f1-9620-2d80', 'test', '/permission/findAll111.do');
INSERT INTO `permission` VALUES ('nulld50848f1-75f3-4390-8051-d556', 'test', '/permission/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` int(11) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1111', 'sunpxit009', 'xiangx ', 'meiguo', '2019-08-13 20:31:57', '111111', '111111111', '1');
INSERT INTO `product` VALUES ('2222', 'lg123456', '环球旅行', '上海', '2019-08-13 20:31:57', '180000', '美妙的一次旅行', '1');
INSERT INTO `product` VALUES ('3333', 'sunpx-08', '云南丽江五日游', '郑州', '2019-08-13 20:28:54', '1688', '哈哈哈哈哈哈哈哈哈哈', '1');
INSERT INTO `product` VALUES ('4444', '123', 'my', 'mytest', '2019-08-13 16:52:19', '2800', 'test!', '1');
INSERT INTO `product` VALUES ('5555', 'sunpx00555', '郑州一日游', '郑州', '2019-08-13 16:52:21', '1300', 'wwwwwww', '1');
INSERT INTO `product` VALUES ('6666', 'sunpx-06', '郑州一日游', '郑州', '2019-08-13 16:52:29', '1800', '关于郑州的你 ', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('11223344', 'USER', '总经理');
INSERT INTO `role` VALUES ('null7f0f969c-c981-40c5-88e4-a3b1', 'MANAGE', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(32) NOT NULL DEFAULT '',
  `roleId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `rp2` (`roleId`),
  CONSTRAINT `rp1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `rp2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('602', '2019-08-13 20:54:48', 'spx02t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '2', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('603', '2019-08-13 20:54:48', 'spx02t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '3', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('604', '2019-08-13 20:55:31', 'spx02t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '3', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('605', '2019-08-13 20:55:34', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('606', '2019-08-13 20:55:43', 'spx02t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '16', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('607', '2019-08-13 20:55:43', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('608', '2019-08-13 20:55:46', 'spx02t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('609', '2019-08-13 20:55:46', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('610', '2019-08-13 20:55:56', 'spx02t', '0:0:0:0:0:0:0:1', '/userfindUserByIdAndAllRole.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('611', '2019-08-13 20:55:59', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('612', '2019-08-13 20:59:10', 'spx02t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('613', '2019-08-13 20:59:25', 'spx02t', '0:0:0:0:0:0:0:1', '/role/save.do', '4', '[类名] xyz.sunpxit.controller.RoleController[方法名] save');
INSERT INTO `syslog` VALUES ('614', '2019-08-13 20:59:25', 'spx02t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('615', '2019-08-13 21:07:42', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '88', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('616', '2019-08-13 21:07:47', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('617', '2019-08-13 21:24:58', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('618', '2019-08-13 21:25:04', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('619', '2019-08-13 21:25:27', 'spx02t', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '20', '[类名] xyz.sunpxit.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('620', '2019-08-13 21:25:30', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('621', '2019-08-13 21:25:32', 'spx02t', '0:0:0:0:0:0:0:1', '/userfindUserByIdAndAllRole.do', '9', '[类名] xyz.sunpxit.controller.UsersController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('622', '2019-08-13 21:26:07', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('623', '2019-08-13 21:26:13', 'spx02t', '0:0:0:0:0:0:0:1', '/userfindUserByIdAndAllRole.do', '7', '[类名] xyz.sunpxit.controller.UsersController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('624', '2019-08-13 21:26:18', 'spx02t', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', '13', '[类名] xyz.sunpxit.controller.UsersController[方法名] addRoleToUser');
INSERT INTO `syslog` VALUES ('625', '2019-08-13 21:26:18', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('626', '2019-08-13 21:28:39', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('627', '2019-08-13 21:28:45', 'spx03t', '0:0:0:0:0:0:0:1', '/close/userclose.do', '18', '[类名] xyz.sunpxit.controller.CloseController[方法名] uopen');
INSERT INTO `syslog` VALUES ('628', '2019-08-13 21:28:45', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('629', '2019-08-13 21:28:49', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '20', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('630', '2019-08-13 21:28:50', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '11', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('631', '2019-08-13 21:30:10', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('632', '2019-08-13 21:30:11', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('633', '2019-08-13 21:30:14', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('634', '2019-08-13 21:30:14', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('635', '2019-08-13 21:30:19', 'spx03t', '0:0:0:0:0:0:0:1', '/close/userclose.do', '10', '[类名] xyz.sunpxit.controller.CloseController[方法名] uopen');
INSERT INTO `syslog` VALUES ('636', '2019-08-13 21:30:19', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('637', '2019-08-13 21:30:42', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('638', '2019-08-13 21:30:49', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('639', '2019-08-13 21:30:49', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '18', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('640', '2019-08-13 21:31:57', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '0', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('641', '2019-08-13 21:31:57', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '8', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('642', '2019-08-13 21:38:00', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('643', '2019-08-13 21:38:09', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('644', '2019-08-13 21:39:54', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('645', '2019-08-13 21:39:57', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '20', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('646', '2019-08-13 21:40:02', 'spx03t', '0:0:0:0:0:0:0:1', '/close/userclose.do', '10', '[类名] xyz.sunpxit.controller.CloseController[方法名] uopen');
INSERT INTO `syslog` VALUES ('647', '2019-08-13 21:40:02', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('648', '2019-08-13 21:40:04', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('649', '2019-08-13 21:40:05', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('650', '2019-08-13 21:40:05', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('651', '2019-08-13 21:40:31', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('652', '2019-08-13 21:40:36', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('653', '2019-08-13 21:40:36', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('654', '2019-08-13 21:44:02', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('655', '2019-08-13 21:44:06', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('656', '2019-08-13 21:44:18', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '10', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('657', '2019-08-13 21:45:01', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('658', '2019-08-13 21:45:05', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('659', '2019-08-13 21:45:08', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('660', '2019-08-13 21:46:26', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('661', '2019-08-13 21:46:34', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '5', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('662', '2019-08-13 21:46:41', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('663', '2019-08-13 21:47:15', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('664', '2019-08-13 21:47:19', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '9', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('665', '2019-08-13 21:47:19', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '62', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('666', '2019-08-13 21:47:51', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('667', '2019-08-13 21:48:05', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('668', '2019-08-13 21:48:40', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('669', '2019-08-13 21:49:12', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('670', '2019-08-13 21:49:15', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('671', '2019-08-13 21:49:18', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('672', '2019-08-13 21:49:21', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('673', '2019-08-13 21:50:14', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('674', '2019-08-13 22:08:00', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '111', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('675', '2019-08-13 22:08:05', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('676', '2019-08-13 22:08:19', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('677', '2019-08-13 22:08:24', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('678', '2019-08-13 22:11:48', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '8', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('679', '2019-08-13 22:12:01', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('680', '2019-08-13 22:12:08', 'spx02t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '21', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('681', '2019-08-13 22:12:15', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '33', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('682', '2019-08-13 22:12:19', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('683', '2019-08-13 22:12:22', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/del.do', '24', '[类名] xyz.sunpxit.controller.OrdersController[方法名] dele');
INSERT INTO `syslog` VALUES ('684', '2019-08-13 22:12:22', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('685', '2019-08-13 22:12:28', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '19', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('686', '2019-08-13 22:12:32', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/del.do', '23', '[类名] xyz.sunpxit.controller.OrdersController[方法名] dele');
INSERT INTO `syslog` VALUES ('687', '2019-08-13 22:12:32', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('688', '2019-08-13 22:12:57', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findById.do', '10', '[类名] xyz.sunpxit.controller.OrdersController[方法名] minute');
INSERT INTO `syslog` VALUES ('689', '2019-08-13 22:12:59', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('690', '2019-08-13 22:25:30', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('691', '2019-08-13 22:25:31', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('692', '2019-08-13 22:25:31', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '22', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('693', '2019-08-13 22:25:31', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('694', '2019-08-13 22:25:32', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('695', '2019-08-13 22:25:32', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('696', '2019-08-13 22:25:32', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('697', '2019-08-13 22:26:29', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('698', '2019-08-13 22:27:12', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] xyz.sunpxit.controller.OrdersController[方法名] minute');
INSERT INTO `syslog` VALUES ('699', '2019-08-13 22:27:54', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('700', '2019-08-13 22:28:01', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findById.do', '16', '[类名] xyz.sunpxit.controller.OrdersController[方法名] minute');
INSERT INTO `syslog` VALUES ('701', '2019-08-13 22:28:12', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('702', '2019-08-13 22:28:36', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('703', '2019-08-13 22:28:40', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findById.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findById');
INSERT INTO `syslog` VALUES ('704', '2019-08-13 22:28:44', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('705', '2019-08-13 22:28:59', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('706', '2019-08-13 22:29:01', 'spx02t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '16', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('707', '2019-08-13 22:42:10', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('708', '2019-08-13 23:10:08', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('709', '2019-08-13 23:10:13', 'spx02t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '8', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('710', '2019-08-13 23:10:20', 'spx02t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '6', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('711', '2019-08-13 23:11:07', 'spx03t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '6', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('712', '2019-08-13 23:11:13', 'spx03t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '6', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('713', '2019-08-13 23:11:27', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('714', '2019-08-13 23:11:32', 'spx03t', '0:0:0:0:0:0:0:1', '/user/updet.do', '11', '[类名] xyz.sunpxit.controller.UsersController[方法名] dele');
INSERT INTO `syslog` VALUES ('715', '2019-08-13 23:11:32', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('716', '2019-08-13 23:11:55', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('717', '2019-08-13 23:11:59', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/del.do', '4', '[类名] xyz.sunpxit.controller.OrdersController[方法名] dele');
INSERT INTO `syslog` VALUES ('718', '2019-08-13 23:11:59', 'spx02t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('719', '2019-08-13 23:58:13', 'spx02t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '6', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('720', '2019-08-13 23:58:21', 'spx02t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '5', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('721', '2019-08-13 23:59:34', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('722', '2019-08-13 23:59:41', 'spx03t', '0:0:0:0:0:0:0:1', '/user/updet.do', '13', '[类名] xyz.sunpxit.controller.UsersController[方法名] dele');
INSERT INTO `syslog` VALUES ('723', '2019-08-13 23:59:41', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('724', '2019-08-13 23:59:55', 'spx03t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('725', '2019-08-13 23:59:57', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('726', '2019-08-13 23:59:59', 'spx03t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('727', '2019-08-14 00:00:04', 'spx03t', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '20', '[类名] xyz.sunpxit.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('728', '2019-08-14 00:00:13', 'spx03t', '0:0:0:0:0:0:0:1', '/userfindUserByIdAndAllRole.do', '9', '[类名] xyz.sunpxit.controller.UsersController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('729', '2019-08-14 00:00:16', 'spx03t', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[类名] xyz.sunpxit.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('730', '2019-08-14 00:00:19', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('731', '2019-08-14 00:00:44', 'spx03t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '5', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('732', '2019-08-14 00:01:41', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('733', '2019-08-14 00:01:57', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('734', '2019-08-14 00:01:59', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('735', '2019-08-14 00:02:15', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('736', '2019-08-14 00:02:21', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '18', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('737', '2019-08-14 00:02:37', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '5', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('738', '2019-08-14 00:02:49', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '7', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('739', '2019-08-14 00:02:53', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '5', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('740', '2019-08-14 00:03:34', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '5', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('741', '2019-08-14 00:06:46', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '6', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('742', '2019-08-14 00:20:14', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('743', '2019-08-14 00:20:50', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '6', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('744', '2019-08-14 00:20:52', 'spx03t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '3', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');
INSERT INTO `syslog` VALUES ('745', '2019-08-14 00:20:57', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '5', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('746', '2019-08-14 00:21:24', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('747', '2019-08-14 00:21:25', 'spx03t', '0:0:0:0:0:0:0:1', '/open/useropen.do', '6', '[类名] xyz.sunpxit.controller.OpenController[方法名] uopen');
INSERT INTO `syslog` VALUES ('748', '2019-08-14 00:21:25', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('749', '2019-08-14 00:26:56', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '4', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('750', '2019-08-14 00:27:14', 'spx03t', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '4', '[类名] xyz.sunpxit.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('751', '2019-08-14 00:54:15', 'spx03t', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] xyz.sunpxit.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('752', '2019-08-14 00:54:43', 'spx02t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('753', '2019-08-14 18:19:00', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '110', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('754', '2019-08-14 18:19:07', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '7', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('755', '2019-08-14 18:19:14', 'spx03t', '0:0:0:0:0:0:0:1', '/user/findAll.do', '29', '[类名] xyz.sunpxit.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('756', '2019-08-14 18:19:19', 'spx03t', '0:0:0:0:0:0:0:1', '/role/findAll.do', '18', '[类名] xyz.sunpxit.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('757', '2019-08-14 18:19:23', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '14', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('758', '2019-08-14 18:19:24', 'spx03t', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '6', '[类名] xyz.sunpxit.controller.LogAopController[方法名] findAll');
INSERT INTO `syslog` VALUES ('759', '2019-08-14 18:22:11', 'spx03t', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '23', '[类名] xyz.sunpxit.controller.OrdersController[方法名] test');
INSERT INTO `syslog` VALUES ('760', '2019-08-14 18:22:14', 'spx03t', '0:0:0:0:0:0:0:1', '/product/fandAll.do', '18', '[类名] xyz.sunpxit.controller.ProductController[方法名] fandAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', 'sun8888@qq.com', 'spx02t', '$2a$10$XtNpK0GKuoEfZhglyaR2euyCyKfAl3MU0rsszlliGkbDP0XSpc/5O', '15575757755', '1');
INSERT INTO `users` VALUES ('4', 'sunpxit00r@126.com', 'spx03t', '$2a$10$ff3JXpbQvUW2ctAJx1d4V.czxiXxozIL8qun8Xze3aO9SxQd8pGDe', '15575757755', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(32) NOT NULL,
  `roleId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `ur2` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('3', '11223344');
INSERT INTO `users_role` VALUES ('1', '123456');
INSERT INTO `users_role` VALUES ('4', '223311');
INSERT INTO `users_role` VALUES ('5', 'null0e3debf8-3981-43bc-ab22-7f26');
INSERT INTO `users_role` VALUES ('4', 'null7f0f969c-c981-40c5-88e4-a3b1');

-- ----------------------------
-- Function structure for myuserId
-- ----------------------------
DROP FUNCTION IF EXISTS `myuserId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `myuserId`(releDesc VARCHAR(32)) RETURNS varchar(45) CHARSET utf8
RETURN
(SELECT id FROM role 
WHERE roleDesc=releDesc
)
;;
DELIMITER ;
