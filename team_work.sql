/*
 Navicat MySQL Data Transfer

 Source Server         : 公用_mysql_8.0_user
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 47.99.136.105:3306
 Source Schema         : team_work

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 02/01/2022 23:37:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `message_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '信息类型（0代表需要处理的信息 1代表只读的信息）',
  `type` int DEFAULT NULL,
  `send_name` varchar(30) DEFAULT NULL COMMENT '发送人',
  `receive_name` varchar(30) DEFAULT NULL COMMENT '接收者',
  `tag` char(1) DEFAULT NULL COMMENT '标志（0代表未处理 1代表已处理）',
  `content` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `create_time` datetime DEFAULT NULL COMMENT '信息创建时间',
  `team_id` int DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3 COMMENT='信息表';

-- ----------------------------
-- Table structure for sys_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_project`;
CREATE TABLE `sys_project` (
  `project_id` int NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `team_id` int DEFAULT NULL COMMENT '团队ID',
  `create_by` varchar(30) DEFAULT NULL COMMENT '项目创始者账号',
  `project_name` varchar(30) DEFAULT NULL COMMENT '项目名',
  `status` char(1) DEFAULT '0' COMMENT '项目状态（0未完成 1完成）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_time` datetime DEFAULT NULL COMMENT '项目发布时间',
  `finish_time` datetime DEFAULT NULL COMMENT '项目完成时间',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `intro` varchar(500) DEFAULT NULL COMMENT '项目介绍',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COMMENT='项目信息表';

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `task_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `project_id` int DEFAULT NULL COMMENT '项目ID',
  `create_by` varchar(30) DEFAULT NULL COMMENT '任务创始者账号',
  `task_name` varchar(30) DEFAULT NULL COMMENT '任务名',
  `distribution_by` varchar(30) DEFAULT NULL COMMENT '任务领取者账号',
  `status` char(1) DEFAULT '0' COMMENT '任务状态（0未完成 1完成）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_time` datetime DEFAULT NULL COMMENT '任务发布时间',
  `receive_time` datetime DEFAULT NULL COMMENT '任务领取时间',
  `finish_time` datetime DEFAULT NULL COMMENT '任务完成时间',
  `intro` varchar(500) DEFAULT NULL COMMENT '任务介绍',
  `info` varchar(500) DEFAULT NULL COMMENT '任务提交完成信息',
  `file_name` varchar(500) DEFAULT NULL COMMENT '任务提交附件名',
  `file_path` varchar(500) DEFAULT NULL COMMENT '任务提交附件路径',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 COMMENT='任务信息表';

-- ----------------------------
-- Table structure for sys_team
-- ----------------------------
DROP TABLE IF EXISTS `sys_team`;
CREATE TABLE `sys_team` (
  `team_id` int NOT NULL COMMENT '团队ID',
  `create_by` varchar(30) DEFAULT NULL COMMENT '团队创始人账号',
  `team_name` varchar(30) DEFAULT NULL COMMENT '团队名',
  `team_num` int DEFAULT NULL COMMENT '团队上限人数',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `status` char(1) DEFAULT '0' COMMENT '团队状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `intro` varchar(500) DEFAULT NULL COMMENT '团队介绍',
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='团队信息表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `team_id` int DEFAULT NULL COMMENT '团队ID',
  `team_permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户权限',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` char(1) DEFAULT '0' COMMENT '用户类型（0普通用户 1管理员）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '男' COMMENT '用户性别（0男 1女）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `intro` varchar(500) DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';

SET FOREIGN_KEY_CHECKS = 1;
