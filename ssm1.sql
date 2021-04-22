/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : ssm1

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-11-16 16:58:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
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
  `orderNum` varchar(50) DEFAULT NULL,
  `orderTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  `memberId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_info` (`productId`),
  KEY `member_info` (`memberId`),
  CONSTRAINT `member_info` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `product_info` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2018-03-02 12:00:00', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` varchar(32) NOT NULL,
  `travellerId` varchar(32) NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
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
INSERT INTO `permission` VALUES ('1', 'ROLE_USER', '用户权限（限制部分访问）');
INSERT INTO `permission` VALUES ('2', 'ROLE_ADMIN', '管理员权限（限制小部分访问）');
INSERT INTO `permission` VALUES ('3', 'ROLE_SUPER', '超级用户权限（不限制访问）');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `departureTime` timestamp(6) NULL DEFAULT NULL,
  `productPrice` decimal(30,2) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2018-04-25 14:30:00.000000', '1800.00', '魔都我来了', '0');
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2018-10-10 10:10:00.000000', '1200.00', '不错的旅行', '1');
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2018-10-10 10:10:00.000000', '1200.00', '不错的旅行', '1');
INSERT INTO `product` VALUES ('a370896181d211e9806b54ab3a5cfa9f', '1234', '北京', '广州', '2019-04-30 18:05:00.000000', '1000.00', 'test', '1');
INSERT INTO `product` VALUES ('da684519821511e9806b54ab3a5cfa9f', '199823', '日本自由行', '广州', '2019-05-21 22:30:00.000000', '10000.00', '日本', '1');
INSERT INTO `product` VALUES ('ee558bbd821611e9806b54ab3a5cfa9f', '199823', '日本自由行', '广州', '2019-05-21 22:30:00.000000', '10000.00', '日本', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(32) DEFAULT NULL,
  `roleDesc` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'USER', '用户');
INSERT INTO `role` VALUES ('2', 'ADMIN', '管理员');
INSERT INTO `role` VALUES ('3', 'SUPER', '超级管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId1` (`roleId`),
  CONSTRAINT `permissionId` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `roleId1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('2', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('3', '3');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` varchar(100) NOT NULL,
  `visitTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `executionTime` longtext,
  `method` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('7398bc7f836e11e99bac54ab3a5cfa9f', '2019-05-31 06:36:42', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '117', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('76583d03836e11e99bac54ab3a5cfa9f', '2019-05-31 06:36:47', 'zhong', '0:0:0:0:0:0:0:1', 'user/findById.do', '31', '[类名] controller.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('85d7418d836e11e99bac54ab3a5cfa9f', '2019-05-31 06:37:13', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '29', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('979dd452836e11e99bac54ab3a5cfa9f', '2019-05-31 06:37:42', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findById.do', '14', '[类名] controller.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('26460e52836f11e99bac54ab3a5cfa9f', '2019-05-31 06:41:42', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAll.do', '5', '[类名] controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b42967bc837111e99bac54ab3a5cfa9f', '2019-05-31 06:59:59', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '1', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b93d2402837111e99bac54ab3a5cfa9f', '2019-05-31 07:00:07', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '0', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('c877b77b837111e99bac54ab3a5cfa9f', '2019-05-31 07:00:33', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '28', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('c9cfedd2837111e99bac54ab3a5cfa9f', '2019-05-31 07:00:35', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '0', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e14cacf2837211e99bac54ab3a5cfa9f', '2019-05-31 07:08:24', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '520', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e30a5789837211e99bac54ab3a5cfa9f', '2019-05-31 07:08:27', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '28', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e52aa58b837211e99bac54ab3a5cfa9f', '2019-05-31 07:08:31', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '22', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('76ad8479837311e99bac54ab3a5cfa9f', '2019-05-31 07:12:34', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '471', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('78034cff837311e99bac54ab3a5cfa9f', '2019-05-31 07:12:37', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '33', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b5dc76b5837311e99bac54ab3a5cfa9f', '2019-05-31 07:14:20', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '392', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('a27438eb837411e99bac54ab3a5cfa9f', '2019-05-31 07:20:57', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '198', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('a705f805837411e99bac54ab3a5cfa9f', '2019-05-31 07:21:05', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '28', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('c91c4959837411e99bac54ab3a5cfa9f', '2019-05-31 07:22:02', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '26', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('fc802830837411e99bac54ab3a5cfa9f', '2019-05-31 07:23:29', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '24', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0d04e0ef837511e99bac54ab3a5cfa9f', '2019-05-31 07:23:56', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '26', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('594f86c2837511e99bac54ab3a5cfa9f', '2019-05-31 07:26:04', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '24', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('5ad5f490837511e99bac54ab3a5cfa9f', '2019-05-31 07:26:07', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '20', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('5c22d1f0837511e99bac54ab3a5cfa9f', '2019-05-31 07:26:09', 'zhong', '0:0:0:0:0:0:0:1', 'user/findByUserName.do', '37', '[类名] controller.UserController[方法名] findByUserName');
INSERT INTO `syslog` VALUES ('6968d52a837511e99bac54ab3a5cfa9f', '2019-05-31 07:26:31', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '21', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('bce9b3ce837511e99bac54ab3a5cfa9f', '2019-05-31 07:28:52', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '20', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('be66b98d837511e99bac54ab3a5cfa9f', '2019-05-31 07:28:54', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '172', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('c615466b837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:07', 'he', '0:0:0:0:0:0:0:1', 'user/findAll.do', '26', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('c82c5e2d837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:10', 'he', '0:0:0:0:0:0:0:1', 'user/AddRole.do', '24', '[类名] controller.UserController[方法名] showAddRoleForm');
INSERT INTO `syslog` VALUES ('cbe3e774837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:17', 'he', '0:0:0:0:0:0:0:1', 'user/findAll.do', '29', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('cd28edf4837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:19', 'he', '0:0:0:0:0:0:0:1', 'role/findAll.do', '40', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('cf623ec6837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:23', 'he', '0:0:0:0:0:0:0:1', 'role/findById.do', '15', '[类名] controller.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('d082af44837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:24', 'he', '0:0:0:0:0:0:0:1', 'role/findAll.do', '32', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('d147a730837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:26', 'he', '0:0:0:0:0:0:0:1', 'role/findRoleByIdAndAllPermission.do', '67', '[类名] controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('d2632849837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:28', 'he', '0:0:0:0:0:0:0:1', 'role/findAll.do', '36', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('d3e0ab9e837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:30', 'he', '0:0:0:0:0:0:0:1', 'role/findAll.do', '28', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('d482333b837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:31', 'he', '0:0:0:0:0:0:0:1', 'role/findRoleByIdAndAllPermission.do', '17', '[类名] controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('d8b98cbb837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:38', 'he', '0:0:0:0:0:0:0:1', 'role/findAll.do', '20', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('daea7d2d837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:42', 'he', '0:0:0:0:0:0:0:1', 'user/findAll.do', '22', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('dbcfc39b837511e99bac54ab3a5cfa9f', '2019-05-31 07:29:43', 'he', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '29', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('feb7e9a4837511e99bac54ab3a5cfa9f', '2019-05-31 07:30:42', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('00b91252837611e99bac54ab3a5cfa9f', '2019-05-31 07:30:45', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('037c3bcd837611e99bac54ab3a5cfa9f', '2019-05-31 07:30:50', 'zhong', '0:0:0:0:0:0:0:1', 'user/findByUserName.do', '14', '[类名] controller.UserController[方法名] findByUserName');
INSERT INTO `syslog` VALUES ('063e6c66837611e99bac54ab3a5cfa9f', '2019-05-31 07:30:55', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '14', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0979addf837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:00', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '12', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0aa0b897837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:02', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '15', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0b9d6e48837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:04', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '9', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0caee8c3837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:05', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '20', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('10283b55837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:11', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '12', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('114b4584837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:13', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '15', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('133f4337837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:16', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '14', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('15419555837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:20', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '12', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('16a88e24837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:22', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('1806e1f6837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:24', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '19', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('2902dcc9837611e99bac54ab3a5cfa9f', '2019-05-31 07:31:53', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '14', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('75df5532837611e99bac54ab3a5cfa9f', '2019-05-31 07:34:02', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '18', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7a64bd7c837611e99bac54ab3a5cfa9f', '2019-05-31 07:34:09', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '16', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('04cd9bad837711e99bac54ab3a5cfa9f', '2019-05-31 07:38:02', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '21', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0749d5dd837711e99bac54ab3a5cfa9f', '2019-05-31 07:38:06', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '16', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('194dca25837711e99bac54ab3a5cfa9f', '2019-05-31 07:38:36', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '32', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1a6c2976837711e99bac54ab3a5cfa9f', '2019-05-31 07:38:38', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '26', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1b3cfb41837711e99bac54ab3a5cfa9f', '2019-05-31 07:38:39', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '28', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('27711a69837711e99bac54ab3a5cfa9f', '2019-05-31 07:39:00', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '16', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2b72ae26837711e99bac54ab3a5cfa9f', '2019-05-31 07:39:06', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '15', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5975e68a837811e99bac54ab3a5cfa9f', '2019-05-31 07:47:33', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '26', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9db47b5d837811e99bac54ab3a5cfa9f', '2019-05-31 07:49:28', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '96', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9fc34ce3837811e99bac54ab3a5cfa9f', '2019-05-31 07:49:31', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '417', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('add783a3837811e99bac54ab3a5cfa9f', '2019-05-31 07:49:55', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '33', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('a6f991d3837a11e99bac54ab3a5cfa9f', '2019-05-31 08:04:02', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '73', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('a8d3bc58837a11e99bac54ab3a5cfa9f', '2019-05-31 08:04:05', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '167', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('b096dbc6837a11e99bac54ab3a5cfa9f', '2019-05-31 08:04:18', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '31', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b25b2268837a11e99bac54ab3a5cfa9f', '2019-05-31 08:04:21', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '42', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b4972c8c837a11e99bac54ab3a5cfa9f', '2019-05-31 08:04:25', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '17', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('d1cf3491837a11e99bac54ab3a5cfa9f', '2019-05-31 08:05:14', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '15', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('d63fa0c8837a11e99bac54ab3a5cfa9f', '2019-05-31 08:05:22', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '14', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('d7b8c5d3837a11e99bac54ab3a5cfa9f', '2019-05-31 08:05:24', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '28', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('d8ec79da837a11e99bac54ab3a5cfa9f', '2019-05-31 08:05:26', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '39', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8bfbfcea841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:20', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '77', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('902bd5c8841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:26', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '988', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('92c15eb4841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:32', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '26', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9496d482841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:35', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '37', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('96d58ace841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:39', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '24', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('98bf6888841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:42', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '33', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9c31515b841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:48', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '31', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9f90d31d841211e9bb2254ab3a5cfa9f', '2019-06-01 02:11:53', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '25', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('daa29b53841211e9bb2254ab3a5cfa9f', '2019-06-01 02:13:32', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '27', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('dc16872d841211e9bb2254ab3a5cfa9f', '2019-06-01 02:13:35', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '24', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('dd1b5692841211e9bb2254ab3a5cfa9f', '2019-06-01 02:13:37', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '13', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('de53e0f4841211e9bb2254ab3a5cfa9f', '2019-06-01 02:13:39', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '40', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('efd22e86841211e9bb2254ab3a5cfa9f', '2019-06-01 02:14:08', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '26', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('08735d79841311e9bb2254ab3a5cfa9f', '2019-06-01 02:14:49', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '19', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('0ae960bb841311e9bb2254ab3a5cfa9f', '2019-06-01 02:14:53', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('17965394841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:15', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '18', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('192bd1de841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:17', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '20', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('1beebd61841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:22', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '15', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1e78d5cf841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:26', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '14', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1feb447e841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:29', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '12', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('2caf38e0841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:50', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '19', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('2dd7088b841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:52', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '21', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2f40fc2e841311e9bb2254ab3a5cfa9f', '2019-06-01 02:15:54', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '12', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('3e48eee5841311e9bb2254ab3a5cfa9f', '2019-06-01 02:16:20', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '11', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('a979cf09841311e9bb2254ab3a5cfa9f', '2019-06-01 02:19:19', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('b43089b2841311e9bb2254ab3a5cfa9f', '2019-06-01 02:19:37', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '21', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('e0f0945f841311e9bb2254ab3a5cfa9f', '2019-06-01 02:20:52', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '22', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e2b0ca4d841311e9bb2254ab3a5cfa9f', '2019-06-01 02:20:55', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '22', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e4e17760841311e9bb2254ab3a5cfa9f', '2019-06-01 02:20:59', 'zhong', '0:0:0:0:0:0:0:1', 'role/findById.do', '16', '[类名] controller.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('e982724b841311e9bb2254ab3a5cfa9f', '2019-06-01 02:21:07', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '29', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('eb66e209841311e9bb2254ab3a5cfa9f', '2019-06-01 02:21:10', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '13', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('5e10e611841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:14:29', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '43', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('603462bc841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:14:32', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '32', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('61ef7190841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:14:35', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '24', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('787d7628841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:15:13', 'zhong', '0:0:0:0:0:0:0:1', 'product/findAll.do', '21', '[类名] controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('910b671e841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:15:54', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findAll.do', '31', '[类名] controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9d8ed2bc841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:16:15', 'zhong', '0:0:0:0:0:0:0:1', 'orders/findById.do', '239', '[类名] controller.OrderController[方法名] findById');
INSERT INTO `syslog` VALUES ('d475fca9841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:17:47', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '19', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('f2ab9ef2841b11e9bb2254ab3a5cfa9f', '2019-06-01 03:18:38', 'zhong', '0:0:0:0:0:0:0:1', 'user/AddRole.do', '109', '[类名] controller.UserController[方法名] showAddRoleForm');
INSERT INTO `syslog` VALUES ('3dda02a9841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:20:44', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '25', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('540b44ba841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:21:22', 'zhong', '0:0:0:0:0:0:0:1', 'role/findById.do', '14', '[类名] controller.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('554cac77841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:21:24', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '32', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('55e5803a841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:21:25', 'zhong', '0:0:0:0:0:0:0:1', 'role/findRoleByIdAndAllPermission.do', '38', '[类名] controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('6fb0d388841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:22:08', 'zhong', '0:0:0:0:0:0:0:1', 'role/findAll.do', '25', '[类名] controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('70538b9f841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:22:09', 'zhong', '0:0:0:0:0:0:0:1', 'role/findById.do', '14', '[类名] controller.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('8f539c0a841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:23:01', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '18', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9df855f8841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:23:26', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findById.do', '35', '[类名] controller.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('a7217802841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:23:41', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '22', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('a80d01c7841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:23:42', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findById.do', '10', '[类名] controller.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('b4aa2715841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:24:04', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '19', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('b5b3d3f0841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:24:05', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findById.do', '8', '[类名] controller.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('c2a69bba841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:24:27', 'zhong', '0:0:0:0:0:0:0:1', 'permission/findAll.do', '20', '[类名] controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('c68150b4841c11e9bb2254ab3a5cfa9f', '2019-06-01 03:24:34', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '18', '[类名] controller.SysLogController[方法名] findAllInPages');
INSERT INTO `syslog` VALUES ('6bb7623f842311e9bb2254ab3a5cfa9f', '2019-06-01 04:12:08', 'zhong', '0:0:0:0:0:0:0:1', 'user/findAll.do', '42', '[类名] controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6d0d9546842311e9bb2254ab3a5cfa9f', '2019-06-01 04:12:10', 'zhong', '0:0:0:0:0:0:0:1', 'sysLog/findAllInPages.do', '23', '[类名] controller.SysLogController[方法名] findAllInPages');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
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
  `id` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('919fcda682ca11e9ba9954ab3a5cfa9f', '610596547@qq.com', 'zhong', '$2a$10$LIgdPrFQOcxvLPqlT1wx7usJPIQYdIDwjaOrh9eWla7d7yCFc5pVK', '15986651533', '1');
INSERT INTO `users` VALUES ('af1b4f57835a11e99bac54ab3a5cfa9f', '1025349512@qq.com', 'he', '$2a$10$rPmUZpsw/GMQlN6/ONJKfOyGZ5RwKO.orCrCuDIWvyiV7ts/XzJku', '159826354325', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('af1b4f57835a11e99bac54ab3a5cfa9f', '1');
INSERT INTO `users_role` VALUES ('919fcda682ca11e9ba9954ab3a5cfa9f', '3');
