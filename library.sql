/*
 Navicat Premium Data Transfer

 Source Server         : library
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 05/12/2023 16:33:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `publishHouse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '西游记', '吴承恩', 66, '清华出版社');
INSERT INTO `book` VALUES (2, '活着', '余华', 45.5, '清华出版社');
INSERT INTO `book` VALUES (3, '三国演义', '罗贯中', 50, '清华出版社');
INSERT INTO `book` VALUES (4, '水浒传', '施耐庵', 55.5, '清华出版社');
INSERT INTO `book` VALUES (5, '平凡的世界', '路遥', 55, '清华出版社');
INSERT INTO `book` VALUES (6, '围城', '钱钟书', 54, '清华出版社');
INSERT INTO `book` VALUES (7, '何氏春秋', '何靖生', 999, '何氏出版社');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123', '男', '123456', '123@qq.com');
INSERT INTO `user` VALUES (2, 'lisi', '123', '女', '123456', '123@qq.com');
INSERT INTO `user` VALUES (3, '何靖生', '123', '男', '13819499483', '1783847296@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
