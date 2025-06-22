/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : localhost:3306
 Source Schema         : gongxiangpinche

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 26/08/2024 17:28:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'tb_customer_car', '汽车管理', NULL, NULL, 'TbCustomerCar', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbCustomerCar', '汽车管理', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":\"2298\"}', 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56', NULL);
INSERT INTO `gen_table` VALUES (4, 'tb_customer_chat', '聊天信息表;', NULL, NULL, 'TbCustomerChat', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbCustomerChat', '聊天信息', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":\"2298\"}', 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00', NULL);
INSERT INTO `gen_table` VALUES (7, 'pro_customer', '会员信息表', NULL, NULL, 'ProCustomer', 'crud', 'element-ui', 'com.huizu.project', 'project', 'proCustomer', '会员信息', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":\"2298\"}', 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33', NULL);
INSERT INTO `gen_table` VALUES (8, 'tb_customer_appraise', '评价表;', NULL, NULL, 'TbCustomerAppraise', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbCustomerAppraise', '评价;', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":\"2298\"}', 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40', NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_customer_route', '行程管理;', NULL, NULL, 'TbCustomerRoute', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbCustomerRoute', '行程管理;', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":\"2298\"}', 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33', NULL);
INSERT INTO `gen_table` VALUES (10, 'tb_route_detail', '行程资金明细;', NULL, NULL, 'TbRouteDetail', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbRouteDetail', '行程资金明细;', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"parentMenuId\":2298}', 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07', NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_division', '行政区划', '', '', 'TbDivision', 'crud', 'element-ui', 'com.huizu.project', 'project', 'tbDivision', '行政区划', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{\"treeCode\":\"city\",\"treeParentCode\":\"city\",\"parentMenuId\":2298}', 'admin', '2024-08-14 14:21:33', '', '2024-08-14 14:23:37', NULL);
INSERT INTO `gen_table` VALUES (13, 'pro_order_info', '订单信息表', NULL, NULL, 'ProOrderInfo', 'crud', 'element-ui', 'com.huizu.project', 'project', 'proOrderInfo', '订单信息', 'huizu', '1', 'E:/huizu/gongxiangpinche/', '{}', 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (75, 3, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (76, 3, 'customer_id', '用户id', 'int(10)', 'Integer', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (77, 3, 'info', '车辆信息', 'varchar(255)', 'String', 'info', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (78, 3, 'gasoline', '汽油型号', 'varchar(255)', 'String', 'gasoline', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'tb_car_gasoline', 4, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (79, 3, 'car_cc', '排气量', 'varchar(255)', 'String', 'carCc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'car_cc', 5, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (80, 3, 'total', '乘坐人数', 'varchar(255)', 'String', 'total', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'tb_car_total', 6, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (81, 3, 'is_etc', 'ETC', 'char(1)', 'String', 'isEtc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 7, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (82, 3, 'manufacturer', '制造商', 'varchar(255)', 'String', 'manufacturer', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (83, 3, 'model', '模型', 'varchar(255)', 'String', 'model', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (84, 3, 'color', '颜色', 'varchar(255)', 'String', 'color', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (85, 3, 'decade', '年代', 'varchar(255)', 'String', 'decade', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (86, 3, 'grade', '内饰等级', 'char(1)', 'String', 'grade', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 12, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (87, 3, 'is_navigation', '是否有导航仪', 'char(1)', 'String', 'isNavigation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 13, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (88, 3, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_open_status', 14, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (89, 3, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (90, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (91, 3, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (92, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (93, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (94, 3, 'del_flag', '删除标记（0正常，1删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 20, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (95, 3, 'standby1', '备用1', 'varchar(255)', 'String', 'standby1', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (96, 3, 'standby2', '备用2', 'varchar(255)', 'String', 'standby2', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (97, 3, 'standby3', '备用3', 'varchar(255)', 'String', 'standby3', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2024-08-12 15:13:31', '', '2024-08-12 16:44:56');
INSERT INTO `gen_table_column` VALUES (98, 4, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (99, 4, 'customer_id', '评论人id', 'int(10)', 'Integer', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (100, 4, 'sub_id', '被评论人id', 'int(10)', 'Integer', 'subId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (101, 4, 'content', '内容', 'varchar(1000)', 'String', 'content', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (102, 4, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_open_status', 5, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (103, 4, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (104, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (105, 4, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (106, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (107, 4, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (108, 4, 'del_flag', '删除标记（0正常，1删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 11, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (109, 4, 'standby1', '备用1', 'varchar(255)', 'String', 'standby1', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (110, 4, 'standby2', '备用2', 'varchar(255)', 'String', 'standby2', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (111, 4, 'standby3', '备用3', 'varchar(255)', 'String', 'standby3', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-08-12 15:13:31', '', '2024-08-14 10:50:00');
INSERT INTO `gen_table_column` VALUES (152, 7, 'id', '序号', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (153, 7, 'type', '用户类型(1用户，2司机)', 'char(1)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'pro_customer_type', 2, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (154, 7, 'avatar', '头像地址', 'varchar(255)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 3, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (155, 7, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (156, 7, 'nick_name', '昵称', 'varchar(255)', 'String', 'nickName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (157, 7, 'jim_name', '极光账号', 'varchar(255)', 'String', 'jimName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (158, 7, 'sex', '性别（0.男 1.女）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 7, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (159, 7, 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (160, 7, 'working_age', '工龄', 'int(10)', 'Integer', 'workingAge', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (161, 7, 'height', '身高', 'decimal(10,2)', 'BigDecimal', 'height', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (162, 7, 'weight', '体重', 'decimal(10,2)', 'BigDecimal', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (163, 7, 'email', '邮箱', 'varchar(255)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (164, 7, 'bank', '银行卡', 'varchar(255)', 'String', 'bank', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (165, 7, 'number', '身份证号', 'varchar(20)', 'String', 'number', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (166, 7, 'phone', '联系方式', 'varchar(255)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (167, 7, 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (168, 7, 'score', '评分', 'varchar(255)', 'String', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (169, 7, 'car_total', '乘车次数', 'varchar(255)', 'String', 'carTotal', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (170, 7, 'rate', '回复率', 'varchar(255)', 'String', 'rate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (171, 7, 'on_line_time', '最终在线时间', 'datetime', 'Date', 'onLineTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 20, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (172, 7, 'login_date', '登录日期', 'datetime', 'Date', 'loginDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 21, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (173, 7, 'province', '省', 'varchar(255)', 'String', 'province', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (174, 7, 'province_code', '省编号', 'varchar(255)', 'String', 'provinceCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (175, 7, 'city', '市', 'varchar(255)', 'String', 'city', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (176, 7, 'city_code', '市编号', 'varchar(255)', 'String', 'cityCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (177, 7, 'area', '区', 'varchar(255)', 'String', 'area', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (178, 7, 'area_code', '区编号', 'varchar(255)', 'String', 'areaCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (179, 7, 'address', '主要出发地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (180, 7, 'lon_lat', '经纬度', 'varchar(255)', 'String', 'lonLat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (181, 7, 'current_address', '当前位置', 'varchar(255)', 'String', 'currentAddress', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (182, 7, 'content', '自我介绍', 'varchar(255)', 'String', 'content', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'editor', '', 31, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (183, 7, 'code', '邀请码', 'varchar(255)', 'String', 'code', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (184, 7, 'open_id', '微信openid', 'varchar(255)', 'String', 'openId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (185, 7, 'qrcode', '分享码', 'varchar(255)', 'String', 'qrcode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (186, 7, 'pro_code', '上级邀请码', 'varchar(255)', 'String', 'proCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (187, 7, 'up_id', '上级编号', 'int(11)', 'Long', 'upId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (188, 7, 'money', '余额', 'decimal(10,2)', 'BigDecimal', 'money', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (189, 7, 'integral', '积分', 'decimal(10,2)', 'BigDecimal', 'integral', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (190, 7, 'start_time', '开始日期', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 39, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (191, 7, 'end_time', '到期日期', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 40, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (192, 7, 'open_flag', '开通状态（0.未开通 1.已开通）', 'bit(1)', 'Integer', 'openFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 41, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (193, 7, 'watch_flag', '观看状态（0.不可观看 1.可观看）', 'bit(1)', 'Integer', 'watchFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (194, 7, 'push_url', '推流地址', 'varchar(255)', 'String', 'pushUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (195, 7, 'bond', '保证金', 'int(11)', 'Long', 'bond', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (196, 7, 'bond_flag', '是否支付保证金', 'char(1)', 'String', 'bondFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 45, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (197, 7, 'contract_flag', '是否签署合同', 'char(1)', 'String', 'contractFlag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 46, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (198, 7, 'bond_file', '协议', 'varchar(255)', 'String', 'bondFile', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'fileUpload', '', 47, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (199, 7, 'is_auth', '是否认证', 'char(1)', 'String', 'isAuth', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 48, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (200, 7, 'is_driver', '是否是司机', 'char(1)', 'String', 'isDriver', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 49, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (201, 7, 'driving_license', '驾照', 'varchar(1000)', 'String', 'drivingLicense', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 50, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (202, 7, 'insurance', '汽车保险', 'varchar(1000)', 'String', 'insurance', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 51, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (203, 7, 'insurance_certificate', '车险证', 'varchar(1000)', 'String', 'insuranceCertificate', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 52, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (204, 7, 'status', '启用状态（0.停用 1.启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_open_status', 53, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (205, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 54, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (206, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 55, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (207, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 56, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (208, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 57, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (209, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 58, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (210, 7, 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 59, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:33');
INSERT INTO `gen_table_column` VALUES (211, 8, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (212, 8, 'customer_id', '评论人id', 'int(10)', 'Integer', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (213, 8, 'sub_id', '被评论人id', 'int(10)', 'Integer', 'subId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (214, 8, 'level', '星级', 'char(1)', 'String', 'level', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (215, 8, 'content', '内容', 'varchar(1000)', 'String', 'content', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (216, 8, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', '', 6, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (217, 8, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (218, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (219, 8, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (220, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (221, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (222, 8, 'del_flag', '删除标记（0正常，1删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 12, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (223, 8, 'standby1', '备用1', 'varchar(255)', 'String', 'standby1', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (224, 8, 'standby2', '备用2', 'varchar(255)', 'String', 'standby2', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (225, 8, 'standby3', '备用3', 'varchar(255)', 'String', 'standby3', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:40');
INSERT INTO `gen_table_column` VALUES (226, 9, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (227, 9, 'customer_id', '用户id', 'int(10)', 'Integer', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (228, 9, 'describe', '描述', 'varchar(255)', 'String', 'describe', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (229, 9, 'start_time', '出发时间', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (230, 9, 'end_time', '到达时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (231, 9, 'start_address', '出发地址', 'varchar(255)', 'String', 'startAddress', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (232, 9, 'end_address', '目的地址', 'varchar(255)', 'String', 'endAddress', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (233, 9, 'start_lon_lat', '出发地经纬度', 'varchar(255)', 'String', 'startLonLat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (234, 9, 'end_lon_lat', '目的地经纬度', 'varchar(255)', 'String', 'endLonLat', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (235, 9, 'model', '车型号', 'varchar(255)', 'String', 'model', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (236, 9, 'number', '车牌号', 'varchar(255)', 'String', 'number', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (237, 9, 'price', '单价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (238, 9, 'total', '可乘坐数量', 'int(10)', 'Integer', 'total', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (239, 9, 'attention', '事前注意事项', 'varchar(1000)', 'String', 'attention', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (240, 9, 'comment', '评论', 'varchar(1000)', 'String', 'comment', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (241, 9, 'view_total', '访问人数', 'int(10)', 'Integer', 'viewTotal', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (242, 9, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_open_status', 20, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (243, 9, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (244, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (245, 9, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (246, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (247, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 25, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (248, 9, 'del_flag', '删除标记（0正常，1删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 26, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (249, 9, 'standby1', '备用1', 'varchar(255)', 'String', 'standby1', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 27, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (250, 9, 'standby2', '备用2', 'varchar(255)', 'String', 'standby2', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (251, 9, 'standby3', '备用3', 'varchar(255)', 'String', 'standby3', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 29, 'admin', '2024-08-12 16:37:45', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (252, 10, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (253, 10, 'route_id', '行程id', 'int(10)', 'Integer', 'routeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (254, 10, 'total', '同乘人数', 'varchar(255)', 'String', 'total', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (255, 10, 'price', '价格', 'varchar(255)', 'String', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (256, 10, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_open_status', 5, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (257, 10, 'create_by', '创建人', 'varchar(32)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (258, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (259, 10, 'update_by', '更新人', 'varchar(32)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (260, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (261, 10, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (262, 10, 'del_flag', '删除标记（0正常，1删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', '', 11, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (263, 10, 'standby1', '备用1', 'varchar(255)', 'String', 'standby1', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (264, 10, 'standby2', '备用2', 'varchar(255)', 'String', 'standby2', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (265, 10, 'standby3', '备用3', 'varchar(255)', 'String', 'standby3', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2024-08-12 16:37:45', '', '2024-08-12 16:44:07');
INSERT INTO `gen_table_column` VALUES (266, 9, 'type', '类型（1司机 2用户）', 'char(1)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'pro_customer_type', 3, '', '2024-08-12 18:46:10', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (267, 9, 'already\n_total', '已乘坐数量', 'int(10)', 'Integer', 'already\nTotal', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, '', '2024-08-12 18:46:10', '', '2024-08-14 09:08:33');
INSERT INTO `gen_table_column` VALUES (268, 9, 'state', '行程状态（）', 'varchar(255)', 'String', 'state', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, '', '2024-08-12 18:46:10', '', '2024-08-14 09:08:34');
INSERT INTO `gen_table_column` VALUES (269, 11, 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-14 14:21:33', '', '2024-08-14 16:07:02');
INSERT INTO `gen_table_column` VALUES (270, 11, 'code', '编码', 'varchar(255)', 'String', 'code', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-14 14:21:33', '', '2024-08-14 16:07:02');
INSERT INTO `gen_table_column` VALUES (271, 11, 'city', '都道府県名(日文)', 'varchar(255)', 'String', 'city', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-08-14 14:21:33', '', '2024-08-14 16:07:02');
INSERT INTO `gen_table_column` VALUES (272, 11, 'area', '市区町村名(日文)', 'varchar(255)', 'String', 'area', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-14 14:21:33', '', '2024-08-14 16:07:02');
INSERT INTO `gen_table_column` VALUES (274, 11, 'city_C', '都道府県名', 'varchar(255)', 'String', 'cityC', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2024-08-14 16:07:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (275, 11, 'area_C', '市区町村名', 'varchar(255)', 'String', 'areaC', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2024-08-14 16:07:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (308, 13, 'id', '序号', 'int(10)', 'Integer', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (309, 13, 'customer_id', '用户id', 'int(10)', 'Integer', 'customerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (310, 13, 'driver_id', '司机id', 'int(10)', 'Integer', 'driverId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (311, 13, 'route_id', '行程id', 'int(10)', 'Integer', 'routeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (312, 13, 'order_type', '订单类型（1.商城订单 2.宅配卡订单 3.积分商城 4.加价购 5.砍价订单 6.拼团订单 7.秒杀订单 8.推荐有礼）', 'char(1)', 'String', 'orderType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'pro_recharge_type', 5, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (313, 13, 'order_code', '订单编号', 'varchar(255)', 'String', 'orderCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (314, 13, 'total_num', '总数量', 'int(11)', 'Long', 'totalNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (315, 13, 'total_price', '总金额', 'decimal(10,2)', 'BigDecimal', 'totalPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (316, 13, 'discount_price', '优惠金额', 'decimal(10,2)', 'BigDecimal', 'discountPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (317, 13, 'actual_price', '实付金额', 'decimal(10,2)', 'BigDecimal', 'actualPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (318, 13, 'bond_price', '保证金', 'decimal(10,2)', 'BigDecimal', 'bondPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (319, 13, 'coupon_id', '优惠券编号', 'int(10)', 'Integer', 'couponId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (320, 13, 'integral', '实付积分', 'decimal(10,2)', 'BigDecimal', 'integral', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (321, 13, 'freight', '运费', 'decimal(10,2)', 'BigDecimal', 'freight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (322, 13, 'package_id', '套餐编号', 'int(10)', 'Integer', 'packageId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (323, 13, 'send_time', '配送时间', 'datetime', 'Date', 'sendTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (324, 13, 'send_cnt', '配送箱数', 'int(10)', 'Integer', 'sendCnt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (325, 13, 'people', '收货人', 'varchar(50)', 'String', 'people', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (326, 13, 'phone', '联系电话', 'varchar(100)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (327, 13, 'address', '收货地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (328, 13, 'pay_type', '支付方式（1.微信支付 2.支付宝支付 3.积分支付 4.微信+积分支付）', 'char(1)', 'String', 'payType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'yes_no', 21, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (329, 13, 'pay_time', '支付时间', 'date', 'Date', 'payTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 22, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (330, 13, 'push_people', '发货人', 'int(100)', 'Long', 'pushPeople', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (331, 13, 'order_status', '订单状态(待支付，已支付，已完成)', 'char(1)', 'String', 'orderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'tb_order_status', 24, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (332, 13, 'take_type', '收货方式', 'char(1)', 'String', 'takeType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 25, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (333, 13, 'storehouse', '仓库名称', 'varchar(255)', 'String', 'storehouse', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (334, 13, 'start_address', '出发地', 'varchar(255)', 'String', 'startAddress', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (335, 13, 'end_address', '目的地', 'varchar(255)', 'String', 'endAddress', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (336, 13, 'start_time', '出发时间', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 29, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (337, 13, 'end_time', '到达时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 30, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (338, 13, 'create_time', '下单时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 31, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');
INSERT INTO `gen_table_column` VALUES (339, 13, 'del_flag', '删除标记', 'tinyint(1)', 'Integer', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 32, 'admin', '2024-08-26 09:29:46', '', '2024-08-26 14:05:18');

-- ----------------------------
-- Table structure for pro_customer
-- ----------------------------
DROP TABLE IF EXISTS `pro_customer`;
CREATE TABLE `pro_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '用户类型(1用户，2司机)',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `jim_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '极光账号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别（0.男 1.女）',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `working_age` int(10) NULL DEFAULT NULL COMMENT '工龄',
  `height` decimal(10, 2) NULL DEFAULT NULL COMMENT '身高',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '体重',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评分',
  `car_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乘车次数',
  `rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复率',
  `on_line_time` datetime NULL DEFAULT NULL COMMENT '最终在线时间',
  `login_date` datetime NULL DEFAULT NULL COMMENT '登录日期',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `province_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省编号',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `city_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市编号',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区编号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要出发地址',
  `lon_lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `current_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前位置',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `qrcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享码',
  `pro_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级邀请码',
  `up_id` int(11) NULL DEFAULT NULL COMMENT '上级编号',
  `money` decimal(10, 2) NOT NULL COMMENT '余额',
  `integral` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime NULL DEFAULT NULL COMMENT '到期日期',
  `open_flag` bit(1) NULL DEFAULT NULL COMMENT '开通状态（0.未开通 1.已开通）',
  `watch_flag` bit(1) NULL DEFAULT NULL COMMENT '观看状态（0.不可观看 1.可观看）',
  `push_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推流地址',
  `bond` int(11) NULL DEFAULT NULL COMMENT '保证金',
  `bond_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否支付保证金',
  `contract_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否签署合同',
  `bond_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议',
  `is_auth` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否认证',
  `is_driver` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否绑定汽车',
  `driving_license` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾照',
  `insurance` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汽车保险',
  `insurance_certificate` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车险证',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用状态（0.停用 1.启用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_customer
-- ----------------------------
INSERT INTO `pro_customer` VALUES (1, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '岸本', NULL, NULL, '2', NULL, NULL, NULL, NULL, '111@qq.com', NULL, NULL, '14444444', 'E10ADC3949BA59ABBE56E057F20F883E', '4.5', NULL, NULL, NULL, NULL, NULL, NULL, '东京', NULL, 'XX区', NULL, NULL, NULL, NULL, '自我介绍', '895343', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1723515870775', NULL, NULL, 0.00, 0.00, NULL, '2025-08-13 10:24:31', b'0', NULL, NULL, 0, '0', '0', NULL, '0', NULL, '驾照', '汽车保险信息', '车险证', '1', 'admin', '2024-08-13 10:24:31', 'admin', '2024-08-13 11:02:47', NULL, '0');
INSERT INTO `pro_customer` VALUES (2, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '尾田荣一郎', NULL, NULL, '1', NULL, NULL, NULL, NULL, '1691@163.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, '东京', NULL, 'XX区', NULL, NULL, NULL, NULL, '自我介绍', '346296', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1723516000638', NULL, NULL, 0.00, 0.00, NULL, '2025-08-13 10:26:41', b'0', NULL, NULL, 0, '0', '0', NULL, '0', NULL, NULL, NULL, NULL, '1', 'admin', '2024-08-13 10:26:41', 'admin', '2024-08-13 10:26:41', NULL, '0');
INSERT INTO `pro_customer` VALUES (3, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '尾田荣一郎', NULL, NULL, '1', NULL, NULL, NULL, NULL, '16291@163.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, '东京', NULL, 'XX区', NULL, NULL, NULL, NULL, '自我介绍', '910156', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1723516601450', NULL, NULL, 0.00, 0.00, NULL, '2025-08-13 10:36:41', b'0', NULL, NULL, 0, '0', '0', NULL, '0', NULL, NULL, NULL, NULL, '1', 'admin', '2024-08-13 10:36:42', 'admin', '2024-08-13 10:36:42', NULL, '0');
INSERT INTO `pro_customer` VALUES (4, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '尾田荣一郎', NULL, NULL, '1', NULL, NULL, NULL, NULL, '162912@163.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, '东京', NULL, 'XX区', NULL, NULL, NULL, NULL, '自我介绍', '822780', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1723516745544', NULL, NULL, 0.00, 0.00, NULL, '2025-08-13 10:39:05', b'0', NULL, NULL, 0, '0', '0', NULL, '0', NULL, NULL, NULL, NULL, '1', 'admin', '2024-08-13 10:39:06', 'admin', '2024-08-13 10:39:06', NULL, '0');
INSERT INTO `pro_customer` VALUES (5, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '尾田荣一郎', NULL, NULL, '1', NULL, NULL, NULL, NULL, '22222@163.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, '东京', NULL, 'XX区', NULL, NULL, NULL, NULL, '自我介绍', '654742', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1723532012713', NULL, NULL, 0.00, 0.00, NULL, '2025-08-13 14:53:33', b'0', NULL, NULL, 0, '0', '0', NULL, '0', NULL, NULL, NULL, NULL, '1', 'admin', '2024-08-13 14:53:33', 'admin', '2024-08-13 14:53:33', NULL, '0');
INSERT INTO `pro_customer` VALUES (6, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '大林', NULL, NULL, '1', NULL, NULL, NULL, NULL, '1027266773@qq.com', NULL, NULL, '18653997866', 'E10ADC3949BA59ABBE56E057F20F883E', '5.0', NULL, NULL, NULL, NULL, NULL, NULL, 'ﾐﾔｷﾞｹﾝ', NULL, 'ｹｾﾝﾇﾏｼ', NULL, NULL, NULL, NULL, NULL, '279572', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724125015954', NULL, NULL, 0.00, 0.00, NULL, '2025-08-20 11:36:56', b'0', NULL, NULL, 0, '0', '0', NULL, '0', '1', 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724298287391.png', 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724298290665.jpg', 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724298293986.jpg', '1', 'admin', '2024-08-20 11:36:56', 'admin', '2024-08-22 11:44:55', NULL, '0');
INSERT INTO `pro_customer` VALUES (7, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '阿林', NULL, NULL, '1', NULL, NULL, NULL, NULL, '1027266772@qq.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'ﾌｸｼﾏｹﾝ', NULL, 'ﾆﾎﾝﾏﾂｼ', NULL, NULL, NULL, NULL, NULL, '864017', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724145772741', NULL, NULL, 0.00, 0.00, NULL, '2025-08-20 17:22:53', b'0', NULL, NULL, 0, '0', '0', NULL, '0', '0', NULL, NULL, NULL, '1', 'admin', '2024-08-20 17:22:53', 'admin', '2024-08-20 17:22:53', NULL, '0');
INSERT INTO `pro_customer` VALUES (8, '1', 'https://huizu-oss-demo.oss-cn-beijing.aliyuncs.com/avatar.png', '岸本', NULL, NULL, '1', NULL, NULL, NULL, NULL, '11@163.com', NULL, NULL, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'ｱｷﾀｹﾝ', NULL, 'ｵｵｶﾞﾀﾑﾗ', NULL, NULL, NULL, NULL, NULL, '152480', NULL, 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1724324431483', NULL, NULL, 0.00, 0.00, NULL, '2025-08-22 19:00:31', b'0', NULL, NULL, 0, '0', '0', NULL, '0', '0', NULL, NULL, NULL, '1', 'admin', '2024-08-22 19:00:32', 'admin', '2024-08-22 19:00:32', NULL, '0');

-- ----------------------------
-- Table structure for pro_order_info
-- ----------------------------
DROP TABLE IF EXISTS `pro_order_info`;
CREATE TABLE `pro_order_info`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `driver_id` int(10) NULL DEFAULT NULL COMMENT '司机id',
  `route_id` int(10) NULL DEFAULT NULL COMMENT '行程id',
  `order_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型（1.商城订单 2.宅配卡订单 3.积分商城 4.加价购 5.砍价订单 6.拼团订单 7.秒杀订单 8.推荐有礼）',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_num` int(11) NULL DEFAULT 0 COMMENT '总数量',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `discount_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `actual_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `bond_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '保证金',
  `coupon_id` int(10) NULL DEFAULT NULL COMMENT '优惠券编号',
  `integral` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付积分',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `package_id` int(10) NULL DEFAULT NULL COMMENT '套餐编号',
  `send_time` datetime NULL DEFAULT NULL COMMENT '配送时间',
  `send_cnt` int(10) NULL DEFAULT NULL COMMENT '配送箱数',
  `people` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `pay_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式（1.微信支付 2.支付宝支付 3.积分支付 4.微信+积分支付）',
  `pay_time` date NULL DEFAULT NULL COMMENT '支付时间',
  `push_people` int(100) NULL DEFAULT NULL COMMENT '发货人',
  `order_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态(待确认价格，待支付，已支付，已完成)',
  `take_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货方式',
  `storehouse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `start_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出发地',
  `end_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `start_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '到达时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 756 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of pro_order_info
-- ----------------------------
INSERT INTO `pro_order_info` VALUES (747, 6, 2, 47, NULL, '1724642915675', 0, NULL, NULL, 3000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:28:36', '0');
INSERT INTO `pro_order_info` VALUES (748, 6, 2, 46, NULL, '1724643005137', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:30:05', '0');
INSERT INTO `pro_order_info` VALUES (749, 8, 2, 46, NULL, '1724643199045', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:33:19', '0');
INSERT INTO `pro_order_info` VALUES (750, 7, 2, 46, NULL, '1724643220844', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:33:41', '0');
INSERT INTO `pro_order_info` VALUES (751, 3, 2, 46, NULL, '1724643225445', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:33:45', '0');
INSERT INTO `pro_order_info` VALUES (752, 4, 2, 46, NULL, '1724643231562', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:33:52', '0');
INSERT INTO `pro_order_info` VALUES (753, 4, 2, 47, NULL, '1724643515647', 0, NULL, NULL, 3000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:38:36', '0');
INSERT INTO `pro_order_info` VALUES (754, 7, 2, 47, NULL, '1724643534272', 0, NULL, NULL, 3000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:38:54', '0');
INSERT INTO `pro_order_info` VALUES (755, 2, 2, 46, NULL, '1724643759299', 0, NULL, NULL, 500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '出发地', '目的地', '2024-10-04 07:23:34', '2024-10-04 08:23:34', '2024-08-26 11:42:39', '0');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_agreement
-- ----------------------------
DROP TABLE IF EXISTS `sys_agreement`;
CREATE TABLE `sys_agreement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议类型',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '协议表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_agreement
-- ----------------------------
INSERT INTO `sys_agreement` VALUES (1, '1', '用户许可使用协议请您本产品之前，请务必仔细阅读并理解《用户许可使用协议》（以下简称“本协议”）中规定的多有权利和限制。我们一向尊重并会严格保护用户在使用本产品时的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。本协议（包括本文最后部分的隐私政策）是用户（包括通过各种合法途径获取到本产品的自然人、法人或其他组织机构，以下简称“用户”或“您”）与我们之间针对本产品相关事项最终的、完整的且排他的协议，并取代、合并之前的当事人之间关于上述事项的讨论和协议。本协议将对用户使用本产品的行为产生法律约束力，您已承诺和保证有权利和能力订立本协议。用户开始使用本产品将视为已经接受本协议，请认真阅读并理解本协议中各种条款，包括免除和限制我们的免责条款和对用户的权利限制（未成年人审阅时应由法定监护人陪同），如果您不能接受本协议中的全部条款，请勿开始使用本产品。使用账户您必须承诺和保证：您使用本产品的行为必须合法本产品将会依据本协议“修改和终止”的规定保留或终止您的账户。您必须承诺对您的登录信息保密、不被其他人获取与使用，并且对您在本账户下的所有行为负责。您必须将任何有可能触犯法律的、未授权使用或怀疑为未授权使用的行为在第一时间通知本产品。本产品不对您因未能遵守上述要求而造成的损失承担法律责任。终端用户协议许可依据本协议规定，本产品将授予您以下不可转让的、非排他的许可：1.使用本产品的权利；2.在您所有的网络通信设备、计算机设备和移动通信设备上下载、安装、使用本产品的权利。限制性条款本协议对您的授权将受到以下限制：您不得对本产品进行任何形式的许可、出售、租赁、转让、发行或其他商业用途；除非法律禁止此类限制，否则您不得对本产品的任何部分或衍生产品进行修改、翻译、改编、合并、利用、分解、改造或反向编译、反向工程等；您不得以创建相同或竞争服务为目的使用本产品；除非法律明文规定，否则您不得对本产品的任何部分以任何形式或方法进行生产、复制、发行、出售、下载或显示等；您不得删除或破坏包含在本产品中的任何版权声明或其他所有权标记。费用您必须自行负担购买本产品的费用，个人上网或第三方（包括但不限于电信或移动通讯提供商）收取的通讯费、信息费等相关费用。如涉及电信增值服务，我们建议您与增值服务提供商确认相关费用问题。版本任何本产品的更新版本或未来版本、更新或者其他变更将受到本协议约束。遵守法律您同意遵守《中华人民共和国合同法》、《中华人民共和国著作权法》及其实施条例、《全国人民代表大会常务委员会关于维护互联网安全的决定》（“人大安全决定”）、《中华人民共和国保守国家秘密法》、《中华人民共和国电信条例》（“电信条例“）、《中华人民共和国计算机信息系统安全保护条例》、《中华人民共和国计算机信息网络国际联网管理暂行规定》及其实施办法、《计算机信息系统国际联网保密管理规定》、《互联网信息服务管理办法》、《计算机信息网络国际联网安全保护管理办法》、《互联网电子公告服务管理规定》（“电子公告规定”）等相关中国法律法规的任何及所有的规定，并对以任何方式使用您的密码和您的账号使用本服务的任何行为及其结果承担全部责任。如违反《人大安全决定》有可能构成犯罪，被追究刑事责任。《电子公告规定》则有明文规定，上网用户使用电子公告服务系统对所发布的信息负责。《电信条例》也强调，使用电信网络传输信息的内容及其后果由电信用户负责。在任何情况下，如果本网站有理由认为您的任何行为，包括但不限于您的任何言论和其它行为违反或可能违反上述法律和法规的任何规定，本网站可在任何时候不经任何事先通知终止向您提供服务。用户内容1.用户内容是指该用户下载、发布或以其他方式使用本产品时产生的所有内容（例如：您的信息、图片、音乐或其他内容）。2.您是您的用户内容唯一的责任人，您将承担因您的用户内容披露而导致的您或任何第三方被识别的风险。3.您已同意您的用户内容受到权利限制（详见“权利限制”）权利限制您已同意通过分享或其他方式使用本产品中的相关服务，在使用过程中，您将承担因下述行为所造成的风险而产生的全部法律责任：1.破坏宪法所确定的基本原则的；2.危害国家安全、泄露国家秘密、颠覆国家政权、破坏国家统一的；3.损害国家荣誉和利益的；4.煽动民族仇恨、民族歧视，破坏民族团结的；5.破坏国家宗教政策，宣扬邪教和封建迷信的；6.散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；7.侮辱或者诽谤他人，侵害他人合法权益的；8.含有法律、行政法规禁止的其他内容的。您已经同意不在本产品从事下列行为：1.发布或分享电脑病毒、蠕虫、恶意代码、故意破坏或改变计算机系统或数据的软件；2.未授权的情况下，收集其他用户的信息或数据，例如电子邮箱地址等；3.用自动化的方式恶意使用本产品，给服务器造成过度的负担或以其他方式干扰或损害网站服务器和网络链接；4.在未授权的情况下，尝试访问本产品的服务器数据或通信数据；5.干扰、破坏本产品其他用户的使用。修改和终止修改本协议容许变更。如果本协议有任何实质性变更，我们将通过电子邮件来通知您。变更通知之后，继续使用本产品则为您已知晓此类变更并同意条款约束；我们保留在任何时候无需通知而修改、保留或关闭本产品任何服务之权利；您已同意我们无需因修改、保留或关闭本产品任何服务之权利；您已同意我们无需因修改、保留或关闭本产品任何服务的行为对您或第三方承担责任。终止本协议自您接受之日起生效，在您使用本产品的过程中持续有效，直至依据本协议终止；尽管有上述规定，如果您使用本产品的时间早于您接受本协议的时间，您在此知晓并同意本协议于您接受本协议的时间，您在此知晓并同意本协议于您第一次使用本产品时生效，除非依据本协议提前终止；我们可能会依据法律的规定，保留您使用本产品或者本账户的权利；无论是否通知，我们将在任何时间以任何原因终止本协议，包括出于善意的相信您违反了我们可接受使用政策或本协议的其他规定；不受前款规定所限，如果用户侵犯第三人的版权且我们接到版权所有人或版权所有人的合法代理人的通知后，我们保留终止本协议的权利；一旦本协议终止，您使用本产品的权利即告终止。您应当知晓您的产品终止意味着您的用户内容将从我们的活动数据库中删除。我们不因终止本协议对您承担任何责任，包括终止您的用户账户和删除您的用户内容。第三方您已知晓或同意我们的部分服务时基于第三方的技术支持获得；您已知晓本协议是您在与我们之前签订，而非您与上述第三方之间签订。我们是基于本产品所产生的内容、维护、支持服务、保证和由此产生的诉讼等事项的唯一责任人。您已同意遵守且授权给本产品限制您有条件地使用本产品的服务。第三方信息和服务1.本产品包含了第三方的部分信息和服务。我们不控制且不对第三方的信息和服务负责；2.我们仅为您使用方便的目的或为承诺和保证第三方的需要而提供此类信息和服务；3.用户需对使用第三方信息和服务产生的风险承担法律责任；4.当用户访问第三方信息和服务时，适用第三方的条款和政策。赔偿您已同意无害地使用本产品，避免因下述行为或相关行为遭受来第三方的任何投诉、诉讼、损失、损害、责任、成本和费用（包括律师费）：1.用户使用本产品的行为；2.用户的用户内容；3.用户违反本协议的行为。我们保留专属抗辩权和请求赔偿的权利您已同意，除非获得我们书面同意，您不得在您与我们共同对第三方提起的诉讼中单方和解。我们将尽合理努力将此类诉讼、诉讼行为或进程通知您。在任何情况下，本产品都不对您或任何第三方因本协议产生的任何间接性、后果性、惩罚性的、偶然的、特殊或惩罚性的损害赔偿承担责任。访问、使用本产品所产生的损坏计算机系统或移动通讯设备数据的风险将由您个人承担。适用法律本协议适用中华人民共和国法律；如果双方发生纠纷，应本着友好的圆柱协商解决；如协商不成，应向所在地的法院提起诉讼。独立性本协议中的某些条款因故无法适用，则本协议的其他条款继续适用且无法适用的条款将会被修改，以便其能够依法适用。完整性本协议（包括隐私政策）是您和本产品之间关于本产品相关事项的最终的、完整的、排他的协议，且取代和合并之前当事人关于此类事项（包括之前的最终用户许可、服务条款和隐私政策）的讨论和协议；每部分的栏目只为阅读之便而无任何法律或合同义务；除非我们书面同意，您不得转让本协议所规定的权利义务。任何违反上述规定企图转让的行为均无效.在法律许可的范围内，本公司对本协议享有最终解释权。', '1', '', NULL, '', '2024-08-01 11:48:45', NULL, '0');
INSERT INTO `sys_agreement` VALUES (2, '2', '1.隐私政策隐私政策本应用尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本应用会按照本隐私权政策的规定使用和披露您的个人信息。但本应用将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本应用不会将这些信息对外披露或向第三方提供。本应用会不时更新本隐私权政策。 您在同意本应用服务使用协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于本应用服务使用协议不可分割的一部分。1. 适用范围(a) 在您使用本应用网络服务，或访问本应用平台网页时，本应用自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；您了解并同意，以下信息不适用本隐私权政策：(a) 本应用收集到的您在本应用发布的有关信息数据，包括但不限于参与活动、成交信息及评价详情；(b) 违反法律规定或违反本应用规则行为及本应用已对您采取的措施。2. 信息使用(a)本应用不会向任何无关第三方提供、出售、出租、分享或交易您的个人信息，除非事先得到您的许可，或该第三方和本应用（含本应用关联公司）单独或共同为您提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有这些资料。(b) 本应用亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播您的个人信息。任何本应用平台用户如从事上述活动，一经发现，本应用有权立即终止与该用户的服务协议。3. 信息披露在如下情况下，本应用将依据您的个人意愿或法律的规定全部或部分的披露您的个人信息：(a) 经您事先同意，向第三方披露；(b)为提供您所要求的产品和服务，而必须和第三方分享您的个人信息；(c) 根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；(d) 如您出现违反中国有关法律、法规或者本应用服务协议或相关规则的情况，需要向第三方披露；(e) 如您是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；(f) 在本应用平台上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的，本应用有权决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。(g) 其它本应用根据法律、法规或者网站政策认为合适的披露。4. 信息存储和交换本应用收集的有关您的信息和资料将保存在本应用及（或）其关联公司的服务器上，这些信息和资料可能传送至您所在国家、地区或本应用收集信息和资料所在地的境外并在境外被访问、存储和展示。5. Cookie的使用(a) 在您未拒绝接受cookies的情况下，本应用会在您的计算机上设定或取用cookies ，以便您能登录或使用依赖于cookies的本应用平台服务或功能。本应用使用cookies可为您提供更加周到的个性化服务，包括推广服务。(b) 您有权选择接受或拒绝接受cookies。您可以通过修改浏览器设置的方式拒绝接受cookies。但如果您选择拒绝接受cookies，则您可能无法登录或使用依赖于cookies的本应用网络服务或功能。(c) 通过本应用所设cookies所取得的有关信息，将适用本政策。6. 信息安全(a) 本应用帐号均有安全保护功能，请妥善保管您的用户名及密码信息。本应用将通过对用户密码进行加密等安全措施确保您的信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请您注意在信息网络上不存在“完善的安全措施”。(b) 在使用本应用网络服务进行网上交易时，您不可避免的要向交易对方或潜在的交易对7.本隐私政策的更改(a)如果决定更改隐私政策，我们会在本政策中、本公司网站中以及我们认为适当的位置发布这些更改，以便您了解我们如何收集、使用您的个人信息，哪些人可以访问这些信息，以及在什么情况下我们会透露这些信息。(b)本公司保留随时修改本政策的权利，因此请经常查看。如对本政策作出重大更改，本公司会通过网站通知的形式告知。请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。如您发现自己的个人信息泄密，尤其是本应用用户名及密码发生泄露，请您立即联络本应用客服，以便本应用采取相应措施。', '1', '', NULL, '', '2024-08-01 11:50:20', NULL, '0');
INSERT INTO `sys_agreement` VALUES (3, '3', '试用协议', '1', '', '2024-07-09 15:40:57', '', NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (4, '4', '支付协议', '1', '', '2024-07-12 10:22:33', '', NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (5, '5', '购买协议', '1', '', '2024-07-12 10:22:41', '', NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (6, '6', '续费协议', '1', '', '2024-07-12 10:22:47', '', NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (7, '7', '实名认证服务协议', '1', '', '2024-07-17 14:57:21', '', '2024-08-02 15:01:32', NULL, '0');
INSERT INTO `sys_agreement` VALUES (8, '8', '个人信息处理', '1', NULL, '2024-07-25 18:02:26', NULL, NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (9, '9', '招标说明', '1', NULL, '2024-08-02 17:25:00', NULL, NULL, NULL, '0');
INSERT INTO `sys_agreement` VALUES (10, '10', '会员协议', '1', NULL, '2024-08-02 18:13:41', NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_banner`;
CREATE TABLE `sys_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_banner
-- ----------------------------
INSERT INTO `sys_banner` VALUES (30, '1', 'https://youxizulinbucket.oss-cn-beijing.aliyuncs.com/1706338441690.jpeg', NULL, '1', 'admin', '2024-01-27 14:54:03', 'admin', '2024-07-09 23:09:34', NULL, '0');
INSERT INTO `sys_banner` VALUES (31, '1', 'https://youxizulinbucket.oss-cn-beijing.aliyuncs.com/1706338558278.jpg', NULL, '1', 'admin', '2024-01-27 14:55:59', 'admin', '2024-01-27 14:55:59', NULL, '0');
INSERT INTO `sys_banner` VALUES (32, '1', 'https://youxizulinbucket.oss-cn-beijing.aliyuncs.com/1706338562932.jpg', NULL, '1', 'admin', '2024-01-27 14:56:04', 'admin', '2024-01-27 14:56:04', NULL, '0');
INSERT INTO `sys_banner` VALUES (33, '2', '/profile/upload/2024/07/11/Snipaste1_20240711091903A001.png', NULL, '1', 'admin', '2024-07-11 09:19:04', '', NULL, NULL, '0');
INSERT INTO `sys_banner` VALUES (34, '3', '/profile/upload/2024/07/25/Snipaste_20240725173311A001.png', NULL, '1', 'admin', '2024-07-25 17:33:12', 'admin', '2024-07-25 17:33:54', NULL, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-09 14:25:42', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sys_coupon`;
CREATE TABLE `sys_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠卷名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '优惠卷类型（1.满减 2.折扣）',
  `amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '优惠值（1.满减对应订单减去的金额 2.折扣对应折扣比例）',
  `limit_price` decimal(15, 2) NULL DEFAULT NULL COMMENT '消费最低金额（指定商品消费达到此金额才可使用）',
  `end_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '过期类型（1.指定天数 2.指定固定日期 3.有效时间段）',
  `limit_day` int(11) NULL DEFAULT 0 COMMENT '有效期天数',
  `end_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `product_range` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '商品范围（1.全品类 2.特定商品）',
  `use_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用须知',
  `care_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储优惠卷相关信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男性', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-09 14:25:42', 'admin', '2024-08-14 12:29:12', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女性', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-09 14:25:42', 'admin', '2024-08-14 12:29:19', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '1', 'admin', '2024-07-09 14:25:42', 'admin', '2024-08-14 12:29:25', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '用户协议', '1', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-09 15:26:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '隐私协议', '2', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-09 15:26:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '试用协议', '3', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-09 15:26:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '停用', '0', 'sys_open_status', NULL, 'danger', 'N', '0', 'admin', '2024-07-09 15:29:57', 'admin', '2024-07-27 14:20:24', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '启用', '1', 'sys_open_status', NULL, 'success', 'N', '0', 'admin', '2024-07-09 15:30:04', 'admin', '2024-07-27 14:20:30', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, 'pc首页', '1', 'sys_banner_type', NULL, 'default', 'N', '0', 'admin', '2024-07-09 22:56:01', 'admin', '2024-07-25 15:21:59', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '否', '0', 'yes_no', NULL, 'warning', 'N', '0', 'admin', '2024-07-10 09:36:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '是', '1', 'yes_no', NULL, 'success', 'N', '0', 'admin', '2024-07-10 09:36:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, 'h5首页', '2', 'sys_banner_type', NULL, 'default', 'N', '0', 'admin', '2024-07-11 09:18:34', 'admin', '2024-07-25 15:21:53', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 4, '支付协议', '4', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-12 10:21:42', 'admin', '2024-07-12 10:21:47', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 5, '购买协议', '5', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-12 10:21:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 6, '续费协议', '6', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-12 10:22:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未审核', '0', 'sys_audit', NULL, 'default', 'N', '0', 'admin', '2024-07-13 11:53:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '成功', '1', 'sys_audit', NULL, 'default', 'N', '0', 'admin', '2024-07-13 11:53:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '失败', '2', 'sys_audit', NULL, 'default', 'N', '0', 'admin', '2024-07-13 11:53:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 7, '实名认证服务协议', '7', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-17 14:56:24', 'admin', '2024-07-17 14:56:32', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '邀请收入', '1', 'pro_recharge_type', NULL, 'default', 'N', '0', 'admin', '2024-07-17 15:39:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '提现支出', '1', 'pro_withdraw_type', NULL, 'default', 'N', '0', 'admin', '2024-07-17 15:40:16', 'admin', '2024-07-17 15:41:33', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 1, '邀请奖励', '1', 'pro_share_type', NULL, 'default', 'N', '0', 'admin', '2024-07-17 19:30:00', 'admin', '2024-07-17 19:30:20', NULL);
INSERT INTO `sys_dict_data` VALUES (120, 2, '邀请用户续租奖励', '2', 'pro_share_type', NULL, 'default', 'N', '0', 'admin', '2024-07-17 19:30:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 1, '使用中', '1', 'sys_order_type', NULL, 'default', 'N', '0', 'admin', '2024-07-18 14:38:21', 'admin', '2024-07-18 14:38:45', NULL);
INSERT INTO `sys_dict_data` VALUES (122, 2, '已到期', '2', 'sys_order_type', NULL, 'default', 'N', '0', 'admin', '2024-07-18 14:38:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 1, 'T恤', '1', 'pro_inquiry_item', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:55:30', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 2, 'Polo衫', '2', 'pro_inquiry_item', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:55:51', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 3, '马克杯', '3', 'pro_inquiry_item', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:56:03', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 4, '包', '4', 'pro_inquiry_item', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:56:13', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, '关于单价和预算', '1', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:56:34', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, '关于交货日期', '2', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:56:47', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 3, '关于印刷方法', '3', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:56:59', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 4, 'OEM咨询', '4', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:57:15', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 5, '要求结束销售代表', '5', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:57:36', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 6, '关于附带工作', '6', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:57:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 7, '其他的', '7', 'pro_inquiry_detail', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:57:57', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 1, '展览/活动', '1', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:58:37', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 2, '采样', '2', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:58:46', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 3, '粘性奖品', '3', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:58:55', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 4, '封闭式抽奖奖品', '4', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:59:04', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 5, '开放抽奖产品', '5', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:59:21', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 6, '礼物', '6', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:59:30', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 7, '出售物品', '7', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:59:39', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 8, '样品样品', '8', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 11:59:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 9, '内部使用', '9', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 12:00:01', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 10, '其他的', '10', 'pro_inquiry_use_purpose', NULL, 'default', 'N', '0', 'admin', '2024-07-24 12:00:21', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 1, '电子邮箱', '1', 'pro_inquiry_way', NULL, 'default', 'N', '0', 'admin', '2024-07-24 12:02:36', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 2, '电话', '2', 'pro_inquiry_way', NULL, 'default', 'N', '0', 'admin', '2024-07-24 12:02:43', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 3, '下单联系二维码', '3', 'sys_banner_type', NULL, 'default', 'N', '0', 'admin', '2024-07-25 17:31:54', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 8, '个人信息处理', '8', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-07-25 18:02:08', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 1, '红色', '红色', 'pro_color', NULL, 'default', 'N', '0', 'admin', '2024-07-26 09:15:31', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 2, '白色', '白色', 'pro_color', NULL, 'default', 'N', '0', 'admin', '2024-07-26 09:15:38', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 0, '正面', '正面', 'pro_area', NULL, 'default', 'N', '0', 'admin', '2024-07-26 09:15:57', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 0, '反面', '反面', 'pro_area', NULL, 'default', 'N', '0', 'admin', '2024-07-26 09:16:05', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 1, '待支付', '1', 'pro_order_status', NULL, 'default', 'N', '0', 'admin', '2024-07-26 17:05:29', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 3, '待收货', '3', 'pro_order_status', NULL, 'default', 'N', '0', 'admin', '2024-07-26 17:05:51', 'admin', '2024-07-26 17:07:26', NULL);
INSERT INTO `sys_dict_data` VALUES (154, 4, '已完成', '4', 'pro_order_status', NULL, 'default', 'N', '0', 'admin', '2024-07-26 17:05:59', 'admin', '2024-07-26 17:07:18', NULL);
INSERT INTO `sys_dict_data` VALUES (155, 5, '待评价', '5', 'pro_order_status', NULL, 'default', 'N', '0', 'admin', '2024-07-26 17:06:08', 'admin', '2024-07-26 17:07:14', NULL);
INSERT INTO `sys_dict_data` VALUES (156, 2, '代发货', '2', 'pro_order_status', NULL, 'default', 'N', '0', 'admin', '2024-07-26 17:07:05', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (157, 1, '小米', '1', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:00', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (158, 2, '应用宝', '2', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:08', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (159, 3, '华为', '3', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:18', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (160, 4, '百度', '4', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:28', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (161, 5, '360', '5', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:37', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (162, 6, '豌豆荚', '6', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:50', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (163, 7, '魅族', '7', 'pro_version_shop', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:52:59', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (164, 1, '安卓', '1', 'pro_version_system', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:53:16', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (165, 2, 'IOS', '2', 'pro_version_system', NULL, 'default', 'N', '0', 'admin', '2024-07-27 13:53:23', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (166, 1, '图片', '1', 'pro_design_type', NULL, 'default', 'N', '0', 'admin', '2024-07-27 14:06:44', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (167, 2, '文字', '2', 'pro_design_type', NULL, 'default', 'N', '0', 'admin', '2024-07-27 14:06:50', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (168, 1, '填写中', '1', 'pro_build_status', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:12:57', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (169, 2, '已完成', '2', 'pro_build_status', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:13:03', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (170, 1, '鞋柜', '1', 'pro_case_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:15:30', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (171, 2, '玄关', '2', 'pro_case_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:15:37', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (172, 3, '衣柜', '3', 'pro_case_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:15:45', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (173, 1, '欧式', '1', 'pro_case_style', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:17:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (174, 2, '美式', '2', 'pro_case_style', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:17:24', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (175, 1, '瓦工', '1', 'pro_tender_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:18:46', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (176, 2, '装修', '2', 'pro_tender_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:18:53', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (177, 1, '木工', '1', 'pro_service_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:24:32', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (178, 2, '瓦工', '2', 'pro_service_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:32:18', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (179, 3, '电工', '3', 'pro_service_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:32:25', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (180, 1, '简约', '1', 'pro_style_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:35:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (181, 2, '欧式', '2', 'pro_style_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:35:54', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (182, 1, '地板', '1', 'pro_service_project', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:36:04', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (183, 2, '乳胶漆', '2', 'pro_service_project', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:36:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (184, 1, '待受理', '1', 'pro_tender_status', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:36:28', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (185, 2, '已受理', '2', 'pro_tender_status', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:36:38', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (186, 1, '司机', '1', 'pro_customer_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:49:59', 'admin', '2024-08-26 14:54:03', NULL);
INSERT INTO `sys_dict_data` VALUES (187, 2, '用户', '2', 'pro_customer_type', NULL, 'default', 'N', '0', 'admin', '2024-08-01 10:50:05', 'admin', '2024-08-26 14:54:08', NULL);
INSERT INTO `sys_dict_data` VALUES (192, 9, '招标说明', '9', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-08-02 17:24:39', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (193, 10, '会员协议', '10', 'sys_agreement_type', NULL, 'default', 'N', '0', 'admin', '2024-08-02 18:12:44', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (197, 1, 'レギュラー', '1', 'tb_car_gasoline', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:26:32', 'admin', '2024-08-14 12:25:58', NULL);
INSERT INTO `sys_dict_data` VALUES (198, 1, '軽自動車', '1', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:26:58', 'admin', '2024-08-14 12:26:47', NULL);
INSERT INTO `sys_dict_data` VALUES (199, 2, '普通自動車~1300cc', '2', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:05', 'admin', '2024-08-14 12:27:05', NULL);
INSERT INTO `sys_dict_data` VALUES (200, 3, '普通自動車~1600cc', '3', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:11', 'admin', '2024-08-14 12:27:18', NULL);
INSERT INTO `sys_dict_data` VALUES (201, 1, '1', '1', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:22', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (202, 2, '2', '2', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:24', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (203, 3, '3', '3', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:26', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (204, 4, '4', '4', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:29', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (205, 5, '5', '5', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:27:31', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (206, 2, 'ハイオク', '2', 'tb_car_gasoline', NULL, 'default', 'N', '0', 'admin', '2024-08-12 16:28:04', 'admin', '2024-08-14 12:26:06', NULL);
INSERT INTO `sys_dict_data` VALUES (209, 1, '繰り返し', '1', 'tb_route_state', NULL, 'default', 'N', '0', 'admin', '2024-08-13 13:51:55', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (210, 4, '普通自動車~1800cc', '4', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:27:26', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (211, 5, '普通自動車~2000cc', '5', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:27:33', 'admin', '2024-08-14 12:27:52', NULL);
INSERT INTO `sys_dict_data` VALUES (212, 6, '普通自動車~2500cc', '6', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:27:39', 'admin', '2024-08-14 12:27:48', NULL);
INSERT INTO `sys_dict_data` VALUES (213, 7, ' 普通自動車~2500cc以上', '7', 'car_cc', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:27:43', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (214, 6, '6', '6', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:28:15', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (215, 7, '7', '7', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:28:18', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (216, 8, '8', '8', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:28:20', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (217, 9, '9', '9', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:28:23', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (218, 10, '10', '10', 'tb_car_total', NULL, 'default', 'N', '0', 'admin', '2024-08-14 12:28:27', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (219, 2, '単日', '2', 'tb_route_state', NULL, 'default', 'N', '0', 'admin', '2024-08-14 17:05:28', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (220, 1, '待确认价格', '1', 'tb_order_status', NULL, 'default', 'N', '0', 'admin', '2024-08-26 14:03:45', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (221, 2, '待支付', '2', 'tb_order_status', NULL, 'default', 'N', '0', 'admin', '2024-08-26 14:03:53', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (222, 3, '已支付', '3', 'tb_order_status', NULL, 'default', 'N', '0', 'admin', '2024-08-26 14:04:03', NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (223, 4, '已完成', '4', 'tb_order_status', NULL, 'default', 'N', '0', 'admin', '2024-08-26 14:04:09', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '协议类型', 'sys_agreement_type', '0', 'admin', '2024-07-09 15:26:04', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '启用状态', 'sys_open_status', '0', 'admin', '2024-07-09 15:28:50', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '轮播图位置', 'sys_banner_type', '0', 'admin', '2024-07-09 22:55:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '是否', 'yes_no', '0', 'admin', '2024-07-10 09:35:28', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '审核状态', 'sys_audit', '0', 'admin', '2024-07-13 11:53:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '收入类型', 'pro_recharge_type', '0', 'admin', '2024-07-17 15:38:29', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '支出类型', 'pro_withdraw_type', '0', 'admin', '2024-07-17 15:38:52', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '分享奖励类型', 'pro_share_type', '0', 'admin', '2024-07-17 19:29:46', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '设备使用状态', 'sys_order_type', '0', 'admin', '2024-07-18 14:38:10', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (109, '预期项目', 'pro_inquiry_item', '0', 'admin', '2024-07-24 11:52:25', 'admin', '2024-07-24 11:54:40', NULL);
INSERT INTO `sys_dict_type` VALUES (110, '咨询详情', 'pro_inquiry_detail', '0', 'admin', '2024-07-24 11:53:36', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '使用目的', 'pro_inquiry_use_purpose', '0', 'admin', '2024-07-24 11:54:11', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (112, '联系方式', 'pro_inquiry_way', '0', 'admin', '2024-07-24 12:02:04', 'admin', '2024-07-24 12:02:14', NULL);
INSERT INTO `sys_dict_type` VALUES (113, '颜色', 'pro_color', '0', 'admin', '2024-07-26 09:15:05', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (114, '区域', 'pro_area', '0', 'admin', '2024-07-26 09:15:17', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (115, '订单状态', 'pro_order_status', '0', 'admin', '2024-07-26 17:05:15', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (116, '商店类型', 'pro_version_shop', '0', 'admin', '2024-07-27 13:50:44', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (117, '版本系统类型', 'pro_version_system', '0', 'admin', '2024-07-27 13:51:29', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (118, '设计盒子类型', 'pro_design_type', '0', 'admin', '2024-07-27 14:06:26', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (119, '施工状态', 'pro_build_status', '0', 'admin', '2024-08-01 10:12:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (120, '随拍类型', 'pro_case_type', '0', 'admin', '2024-08-01 10:15:16', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (121, '随拍风格', 'pro_case_style', '0', 'admin', '2024-08-01 10:16:58', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (122, '招标类型', 'pro_tender_type', '0', 'admin', '2024-08-01 10:18:32', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (123, '服务类型', 'pro_service_type', '0', 'admin', '2024-08-01 10:20:27', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (124, '擅长风格', 'pro_style_type', '0', 'admin', '2024-08-01 10:23:18', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (125, '服务项目', 'pro_service_project', '0', 'admin', '2024-08-01 10:23:44', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (126, '招标状态', 'pro_tender_status', '0', 'admin', '2024-08-01 10:24:07', 'admin', '2024-08-01 10:24:19', NULL);
INSERT INTO `sys_dict_type` VALUES (127, '用户类型', 'pro_customer_type', '0', 'admin', '2024-08-01 10:49:38', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (128, '汽油型号', 'tb_car_gasoline', '0', 'admin', '2024-08-12 15:55:29', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (129, '汽车排量', 'car_cc', '0', 'admin', '2024-08-12 15:55:47', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (130, '乘坐人数', 'tb_car_total', '0', 'admin', '2024-08-12 15:56:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (131, '繰り返し設定', 'tb_route_state', '0', 'admin', '2024-08-13 13:51:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (132, '订单状态', 'tb_order_status', '0', 'admin', '2024-08-26 14:03:23', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_freight
-- ----------------------------
DROP TABLE IF EXISTS `sys_freight`;
CREATE TABLE `sys_freight`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `cnt` int(11) NULL DEFAULT NULL COMMENT '满足数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '满足金额',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运费设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_freight
-- ----------------------------
INSERT INTO `sys_freight` VALUES (1, 1000.00, 1, 1.00, 1, '北京');
INSERT INTO `sys_freight` VALUES (2, 1200.00, NULL, NULL, 1, '天津');
INSERT INTO `sys_freight` VALUES (3, 2000.00, NULL, NULL, 1, '青岛');

-- ----------------------------
-- Table structure for sys_freight_province
-- ----------------------------
DROP TABLE IF EXISTS `sys_freight_province`;
CREATE TABLE `sys_freight_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `province` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `cnt` int(11) NULL DEFAULT NULL COMMENT '满足数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '满足金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区运费设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_freight_province
-- ----------------------------

-- ----------------------------
-- Table structure for sys_idea
-- ----------------------------
DROP TABLE IF EXISTS `sys_idea`;
CREATE TABLE `sys_idea`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '会员编号',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_idea
-- ----------------------------
INSERT INTO `sys_idea` VALUES (16, 146, '', '', '', '', '2', '1', '', '2022-04-01 10:44:34', '', NULL, NULL, '0');
INSERT INTO `sys_idea` VALUES (17, 146, '', '', '', '', '3', '1', '', '2022-04-01 10:44:39', '', NULL, NULL, '0');
INSERT INTO `sys_idea` VALUES (18, NULL, NULL, 'images', NULL, NULL, 'content', '1', '', '2024-07-17 14:43:53', '', NULL, NULL, '0');
INSERT INTO `sys_idea` VALUES (19, NULL, NULL, 'images', NULL, NULL, 'content', '1', '', '2024-07-17 14:45:05', '', NULL, NULL, '0');
INSERT INTO `sys_idea` VALUES (20, 528, NULL, 'images', NULL, NULL, 'content', '1', '', '2024-07-17 14:47:19', '', NULL, NULL, '0');
INSERT INTO `sys_idea` VALUES (21, 533, NULL, '图片图片', '1555555555555', NULL, '问题描述问题描述', '1', NULL, '2024-08-02 15:31:56', NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 14:25:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 14:25:42', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-09 14:25:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-12 18:45:27');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-12 18:45:30');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-12 18:45:44');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 08:54:23');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 10:22:56');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 11:47:45');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-13 13:50:31');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 13:50:35');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 16:08:53');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 08:57:17');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 10:48:49');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 12:24:36');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 14:21:22');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 16:04:16');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 17:04:35');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 17:56:34');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 19:48:55');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-19 15:59:37');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-21 16:02:25');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-22 08:55:19');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-22 15:17:50');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-22 16:14:50');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '182.45.245.154', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-22 16:14:56');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 13:39:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2418 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 101, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-07-09 14:25:42', 'admin', '2024-07-10 09:09:58', '系统管理目录', '', '');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 102, 'monitor', NULL, 1, 0, 'M', '0', '1', '', 'monitor', 'admin', '2024-07-09 14:25:42', 'admin', '2024-08-14 16:19:38', '系统监控目录', '', '');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 103, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-07-09 14:25:42', 'admin', '2024-08-26 09:29:36', '系统工具目录', '', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-07-09 14:25:42', '', NULL, '用户管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-07-09 14:25:42', '', NULL, '角色管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-07-09 14:25:42', '', NULL, '菜单管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-07-09 14:25:42', '', NULL, '部门管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-07-09 14:25:42', '', NULL, '岗位管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-07-09 14:25:42', '', NULL, '字典管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-07-09 14:25:42', '', NULL, '参数设置菜单', '', '');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 2034, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '1', 'system:notice:list', 'message', 'admin', '2024-07-09 14:25:42', 'admin', '2024-07-24 11:30:25', '通知公告菜单', '', '');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-07-09 14:25:42', '', NULL, '日志管理菜单', '', '');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-07-09 14:25:42', '', NULL, '在线用户菜单', '', '');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-07-09 14:25:42', '', NULL, '定时任务菜单', '', '');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-07-09 14:25:42', '', NULL, '数据监控菜单', '', '');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-07-09 14:25:42', '', NULL, '服务监控菜单', '', '');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-07-09 14:25:42', '', NULL, '缓存监控菜单', '', '');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-07-09 14:25:42', '', NULL, '缓存列表菜单', '', '');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-07-09 14:25:42', '', NULL, '表单构建菜单', '', '');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-07-09 14:25:42', '', NULL, '代码生成菜单', '', '');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-07-09 14:25:42', '', NULL, '系统接口菜单', '', '');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-07-09 14:25:42', '', NULL, '操作日志菜单', '', '');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-07-09 14:25:42', '', NULL, '登录日志菜单', '', '');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-07-09 14:25:42', '', NULL, '', '', '');
INSERT INTO `sys_menu` VALUES (2000, '协议管理', 0, 1, 'agreement', 'system/agreement/index', 1, 0, 'C', '0', '1', 'system:agreement:list', '#', 'admin', '2024-07-09 15:34:54', 'admin', '2024-08-22 15:20:48', '协议管理菜单', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '协议管理查询', 2000, 1, '#', '', 1, 0, 'F', '0', '0', 'system:agreement:query', '#', 'admin', '2024-07-09 15:34:54', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '协议管理新增', 2000, 2, '#', '', 1, 0, 'F', '0', '0', 'system:agreement:add', '#', 'admin', '2024-07-09 15:34:54', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '协议管理修改', 2000, 3, '#', '', 1, 0, 'F', '0', '0', 'system:agreement:edit', '#', 'admin', '2024-07-09 15:34:54', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '协议管理删除', 2000, 4, '#', '', 1, 0, 'F', '0', '0', 'system:agreement:remove', '#', 'admin', '2024-07-09 15:34:54', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '协议管理导出', 2000, 5, '#', '', 1, 0, 'F', '0', '0', 'system:agreement:export', '#', 'admin', '2024-07-09 15:34:54', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '轮播图信息', 2034, 1, 'banner', 'system/banner/index', 1, 0, 'C', '0', '1', 'system:banner:list', '#', 'admin', '2024-07-09 23:07:47', 'admin', '2024-07-31 18:15:37', '轮播图信息菜单', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '查询轮播图信息', 2006, 1, '#', '', 1, 0, 'F', '0', '0', 'system:banner:query', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '新增轮播图信息', 2006, 2, '#', '', 1, 0, 'F', '0', '0', 'system:banner:add', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '修改轮播图信息', 2006, 3, '#', '', 1, 0, 'F', '0', '0', 'system:banner:edit', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '删除轮播图信息', 2006, 4, '#', '', 1, 0, 'F', '0', '0', 'system:banner:remove', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '导出轮播图信息', 2006, 5, '#', '', 1, 0, 'F', '0', '0', 'system:banner:export', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '详情轮播图信息', 2006, 6, '#', '', 1, 0, 'F', '0', '0', 'system:banner:details', '#', 'admin', '2024-07-09 23:07:47', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '意见反馈', 2034, 1, 'idea', 'system/idea/index', 1, 0, 'C', '0', '0', 'system:idea:list', '#', 'admin', '2024-07-10 09:04:06', 'admin', '2024-07-31 18:13:26', '意见反馈菜单', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '查询意见反馈', 2013, 1, '#', '', 1, 0, 'F', '0', '0', 'system:idea:query', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '新增意见反馈', 2013, 2, '#', '', 1, 0, 'F', '0', '0', 'system:idea:add', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '修改意见反馈', 2013, 3, '#', '', 1, 0, 'F', '0', '0', 'system:idea:edit', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '删除意见反馈', 2013, 4, '#', '', 1, 0, 'F', '0', '0', 'system:idea:remove', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '导出意见反馈', 2013, 5, '#', '', 1, 0, 'F', '0', '0', 'system:idea:export', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '详情意见反馈', 2013, 6, '#', '', 1, 0, 'F', '0', '0', 'system:idea:details', '#', 'admin', '2024-07-10 09:04:06', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '系统设置', 0, 100, 'xtsz', NULL, 1, 0, 'M', '0', '1', '', '#', 'admin', '2024-07-10 09:08:29', 'admin', '2024-08-14 16:19:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '存储app版本相关信息', 2034, 1, 'version', 'system/version/index', 1, 0, 'C', '0', '0', 'system:version:list', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '存储app版本相关信息菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2143, '查询存储app版本相关信息', 2142, 1, '#', '', 1, 0, 'F', '0', '0', 'system:version:query', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2144, '新增存储app版本相关信息', 2142, 2, '#', '', 1, 0, 'F', '0', '0', 'system:version:add', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2145, '修改存储app版本相关信息', 2142, 3, '#', '', 1, 0, 'F', '0', '0', 'system:version:edit', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2146, '删除存储app版本相关信息', 2142, 4, '#', '', 1, 0, 'F', '0', '0', 'system:version:remove', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2147, '导出存储app版本相关信息', 2142, 5, '#', '', 1, 0, 'F', '0', '0', 'system:version:export', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2148, '详情存储app版本相关信息', 2142, 6, '#', '', 1, 0, 'F', '0', '0', 'system:version:details', '#', 'admin', '2024-07-24 11:35:57', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2254, '收货地址', 2034, 1, 'customerAddress', 'project/customerAddress/index', 1, 0, 'C', '0', '1', 'project:customerAddress:list', '#', 'admin', '2024-07-25 14:08:56', 'admin', '2024-07-27 14:55:45', '收货地址菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2255, '查询收货地址', 2254, 1, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:query', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2256, '新增收货地址', 2254, 2, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:add', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2257, '修改收货地址', 2254, 3, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:edit', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2258, '删除收货地址', 2254, 4, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:remove', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2259, '导出收货地址', 2254, 5, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:export', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2260, '详情收货地址', 2254, 6, '#', '', 1, 0, 'F', '0', '0', 'project:customerAddress:details', '#', 'admin', '2024-07-25 14:08:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2284, '关于我们', 2034, 1, 'sysWe', 'system/sysWe/index', 1, 0, 'C', '0', '1', 'system:sysWe:list', '#', 'admin', '2024-07-27 17:45:42', 'admin', '2024-07-31 18:12:26', '关于我们菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2285, '查询关于我们', 2284, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:query', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2286, '新增关于我们', 2284, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:add', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2287, '修改关于我们', 2284, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:edit', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2288, '删除关于我们', 2284, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:remove', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2289, '导出关于我们', 2284, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:export', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2290, '详情关于我们', 2284, 6, '#', '', 1, 0, 'F', '0', '0', 'system:sysWe:details', '#', 'admin', '2024-07-27 17:45:42', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2291, '客服信息', 2034, 1, 'sysService', 'system/sysService/index', 1, 0, 'C', '0', '0', 'system:sysService:list', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '客服信息菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2292, '查询客服信息', 2291, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:query', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2293, '新增客服信息', 2291, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:add', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2294, '修改客服信息', 2291, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:edit', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2295, '删除客服信息', 2291, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:remove', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2296, '导出客服信息', 2291, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:export', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2297, '详情客服信息', 2291, 6, '#', '', 1, 0, 'F', '0', '0', 'system:sysService:details', '#', 'admin', '2024-07-31 18:54:54', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2362, '用户信息', 0, 1, 'proCustomer', 'project/proCustomer/index', 1, 0, 'C', '0', '0', 'project:proCustomer:list', '#', 'admin', '2024-08-12 16:49:26', 'admin', '2024-08-21 16:03:21', '会员信息菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2363, '查询会员信息', 2362, 1, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:query', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2364, '新增会员信息', 2362, 2, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:add', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2365, '修改会员信息', 2362, 3, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:edit', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2366, '删除会员信息', 2362, 4, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:remove', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2367, '导出会员信息', 2362, 5, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:export', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2368, '详情会员信息', 2362, 6, '#', '', 1, 0, 'F', '0', '0', 'project:proCustomer:details', '#', 'admin', '2024-08-12 16:49:26', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2369, '评价', 0, 1, 'tbCustomerAppraise', 'project/tbCustomerAppraise/index', 1, 0, 'C', '0', '1', 'project:tbCustomerAppraise:list', '#', 'admin', '2024-08-12 16:49:35', 'admin', '2024-08-22 15:18:01', '评价;菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2370, '查询评价;', 2369, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:query', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2371, '新增评价;', 2369, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:add', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2372, '修改评价;', 2369, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:edit', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2373, '删除评价;', 2369, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:remove', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2374, '导出评价;', 2369, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:export', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2375, '详情评价;', 2369, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerAppraise:details', '#', 'admin', '2024-08-12 16:49:35', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2376, '汽车管理', 0, 1, 'tbCustomerCar', 'project/tbCustomerCar/index', 1, 0, 'C', '0', '0', 'project:tbCustomerCar:list', '#', 'admin', '2024-08-12 16:49:40', 'admin', '2024-08-21 16:03:29', '汽车管理菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2377, '查询汽车管理', 2376, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:query', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2378, '新增汽车管理', 2376, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:add', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2379, '修改汽车管理', 2376, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:edit', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2380, '删除汽车管理', 2376, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:remove', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2381, '导出汽车管理', 2376, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:export', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2382, '详情汽车管理', 2376, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerCar:details', '#', 'admin', '2024-08-12 16:49:40', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2383, '聊天信息', 0, 1, 'tbCustomerChat', 'project/tbCustomerChat/index', 1, 0, 'C', '0', '1', 'project:tbCustomerChat:list', '#', 'admin', '2024-08-12 16:49:46', 'admin', '2024-08-22 15:18:31', '聊天信息菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2384, '查询聊天信息', 2383, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:query', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2385, '新增聊天信息', 2383, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:add', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2386, '修改聊天信息', 2383, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:edit', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2387, '删除聊天信息', 2383, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:remove', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2388, '导出聊天信息', 2383, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:export', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2389, '详情聊天信息', 2383, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerChat:details', '#', 'admin', '2024-08-12 16:49:46', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2390, '拼车管理', 0, 1, 'tbCustomerRoute', 'project/tbCustomerRoute/index', 1, 0, 'C', '0', '0', 'project:tbCustomerRoute:list', '#', 'admin', '2024-08-12 16:49:51', 'admin', '2024-08-21 16:03:37', '行程管理;菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2391, '查询行程管理;', 2390, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:query', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2392, '新增行程管理;', 2390, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:add', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2393, '修改行程管理;', 2390, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:edit', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2394, '删除行程管理;', 2390, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:remove', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2395, '导出行程管理;', 2390, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:export', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2396, '详情行程管理;', 2390, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbCustomerRoute:details', '#', 'admin', '2024-08-12 16:49:51', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2397, '拼车资金明细', 0, 1, 'tbRouteDetail', 'project/tbRouteDetail/index', 1, 0, 'C', '0', '1', 'project:tbRouteDetail:list', '#', 'admin', '2024-08-12 16:49:56', 'admin', '2024-08-22 15:18:57', '行程资金明细;菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2398, '查询行程资金明细;', 2397, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:query', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2399, '新增行程资金明细;', 2397, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:add', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2400, '修改行程资金明细;', 2397, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:edit', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2401, '删除行程资金明细;', 2397, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:remove', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2402, '导出行程资金明细;', 2397, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:export', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2403, '详情行程资金明细;', 2397, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbRouteDetail:details', '#', 'admin', '2024-08-12 16:49:56', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2404, '行政区划', 0, 1, 'tbDivision', 'project/tbDivision/index', 1, 0, 'C', '0', '0', 'project:tbDivision:list', '#', 'admin', '2024-08-14 16:10:00', 'admin', '2024-08-21 16:03:46', '行政区划菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2405, '查询行政区划', 2404, 1, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:query', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2406, '新增行政区划', 2404, 2, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:add', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2407, '修改行政区划', 2404, 3, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:edit', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2408, '删除行政区划', 2404, 4, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:remove', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2409, '导出行政区划', 2404, 5, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:export', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2410, '详情行政区划', 2404, 6, '#', '', 1, 0, 'F', '0', '0', 'project:tbDivision:details', '#', 'admin', '2024-08-14 16:10:00', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2411, '订单信息', 0, 1, 'proOrderInfo', 'project/proOrderInfo/index', 1, 0, 'C', '0', '0', 'project:proOrderInfo:list', '#', 'admin', '2024-08-26 09:31:02', 'admin', '2024-08-26 09:31:34', '订单信息菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2412, '查询订单信息', 2411, 1, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:query', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2413, '新增订单信息', 2411, 2, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:add', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2414, '修改订单信息', 2411, 3, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:edit', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2415, '删除订单信息', 2411, 4, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:remove', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2416, '导出订单信息', 2411, 5, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:export', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2417, '详情订单信息', 2411, 6, '#', '', 1, 0, 'F', '0', '0', 'project:proOrderInfo:details', '#', 'admin', '2024-08-26 09:31:02', '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `slideshow` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '轮播图',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '轮播图地址', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '轮播图地址', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.huizu.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_customer_car,tb_customer_appraise,pro_customer,tb_route_detail,tb_customer_route,tb_customer_chat\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:13:31', 611);
INSERT INTO `sys_oper_log` VALUES (2, '字典类型', 3, 'com.huizu.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/126,125,124,123,122,121,120', '127.0.0.1', '内网IP', '{}', NULL, 1, '招标状态已分配,不能删除', '2024-08-12 15:36:08', 6);
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerCar\",\"className\":\"TbCustomerCar\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":75,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":76,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"车辆信息\",\"columnId\":77,\"columnName\":\"info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"info\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gasoline\",\"columnComment\":\"汽油型号\",\"columnId\":78,\"columnName\":\"gasoline\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaF', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:39:25', 80);
INSERT INTO `sys_oper_log` VALUES (4, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerChat\",\"className\":\"TbCustomerChat\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":98,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"评论人id\",\"columnId\":99,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SubId\",\"columnComment\":\"被评论人id\",\"columnId\":100,\"columnName\":\"sub_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":101,\"columnName\":\"content\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"co', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:39:57', 35);
INSERT INTO `sys_oper_log` VALUES (5, '字典类型', 1, 'com.huizu.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"汽油型号\",\"dictType\":\"tb_car_gasoline\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:55:29', 45);
INSERT INTO `sys_oper_log` VALUES (6, '字典类型', 1, 'com.huizu.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"汽车排量\",\"dictType\":\"car_cc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:55:47', 49);
INSERT INTO `sys_oper_log` VALUES (7, '字典类型', 1, 'com.huizu.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"乘坐人数\",\"dictType\":\"tb_car_total\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 15:56:14', 60);
INSERT INTO `sys_oper_log` VALUES (8, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerRoute\",\"className\":\"TbCustomerRoute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":112,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":113,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Describe\",\"columnComment\":\"描述\",\"columnId\":114,\"columnName\":\"describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"describe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"出发时间\",\"columnId\":115,\"columnName\":\"start_time\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:20', 74);
INSERT INTO `sys_oper_log` VALUES (9, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_customer_car', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:25', 81);
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_customer_chat', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:26', 64);
INSERT INTO `sys_oper_log` VALUES (11, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_customer_route', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:29', 80);
INSERT INTO `sys_oper_log` VALUES (12, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_route_detail', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:30', 56);
INSERT INTO `sys_oper_log` VALUES (13, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/pro_customer', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:32', 161);
INSERT INTO `sys_oper_log` VALUES (14, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_customer_appraise', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:10:33', 77);
INSERT INTO `sys_oper_log` VALUES (15, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerCar\",\"className\":\"TbCustomerCar\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":75,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:25\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":76,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:25\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"车辆信息\",\"columnId\":77,\"columnName\":\"info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"info\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:25\",\"usableColumn\":false},{\"capJavaField\":\"Gasoline\",\"columnComment\":\"汽油型号\",\"columnId\":78,\"columnName\":\"gasoline\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"tb_car_gasoline\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:24:33', 88);
INSERT INTO `sys_oper_log` VALUES (16, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~1300CC\",\"dictSort\":1,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:25:05', 62);
INSERT INTO `sys_oper_log` VALUES (17, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~1500CC\",\"dictSort\":2,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:25:12', 52);
INSERT INTO `sys_oper_log` VALUES (18, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~2000CC\",\"dictSort\":3,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:25:21', 56);
INSERT INTO `sys_oper_log` VALUES (19, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"レギュラ-\",\"dictSort\":1,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:26:32', 54);
INSERT INTO `sys_oper_log` VALUES (20, '字典类型', 3, 'com.huizu.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/195,196,194', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:26:43', 149);
INSERT INTO `sys_oper_log` VALUES (21, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~1300CC\",\"dictSort\":1,\"dictType\":\"car_cc\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:26:58', 43);
INSERT INTO `sys_oper_log` VALUES (22, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~1500CC\",\"dictSort\":2,\"dictType\":\"car_cc\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:05', 55);
INSERT INTO `sys_oper_log` VALUES (23, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~2000CC\",\"dictSort\":3,\"dictType\":\"car_cc\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:11', 41);
INSERT INTO `sys_oper_log` VALUES (24, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":1,\"dictType\":\"tb_car_total\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:22', 49);
INSERT INTO `sys_oper_log` VALUES (25, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"2\",\"dictSort\":2,\"dictType\":\"tb_car_total\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:24', 45);
INSERT INTO `sys_oper_log` VALUES (26, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"3\",\"dictSort\":3,\"dictType\":\"tb_car_total\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:27', 44);
INSERT INTO `sys_oper_log` VALUES (27, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"4\",\"dictSort\":4,\"dictType\":\"tb_car_total\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:29', 41);
INSERT INTO `sys_oper_log` VALUES (28, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"5\",\"dictSort\":5,\"dictType\":\"tb_car_total\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:27:31', 46);
INSERT INTO `sys_oper_log` VALUES (29, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"92\",\"dictSort\":2,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:28:04', 51);
INSERT INTO `sys_oper_log` VALUES (30, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"95\",\"dictSort\":3,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:28:09', 53);
INSERT INTO `sys_oper_log` VALUES (31, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"98\",\"dictSort\":4,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:28:13', 56);
INSERT INTO `sys_oper_log` VALUES (32, '代码生成', 3, 'com.huizu.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:29:15', 19);
INSERT INTO `sys_oper_log` VALUES (33, '代码生成', 3, 'com.huizu.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/6,1,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:29:22', 8);
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 6, 'com.huizu.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_customer_route,tb_route_detail,tb_customer_appraise,pro_customer\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:37:45', 383);
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proCustomer\",\"className\":\"ProCustomer\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"序号\",\"columnId\":152,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"用户类型(1用户，2司机)\",\"columnId\":153,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"pro_customer_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Avatar\",\"columnComment\":\"头像地址\",\"columnId\":154,\"columnName\":\"avatar\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"avatar\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":155,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:42:38', 134);
INSERT INTO `sys_oper_log` VALUES (36, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerAppraise\",\"className\":\"TbCustomerAppraise\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":211,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"评论人id\",\"columnId\":212,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SubId\",\"columnComment\":\"被评论人id\",\"columnId\":213,\"columnName\":\"sub_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"星级\",\"columnId\":214,\"columnName\":\"level\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:43:00', 51);
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerRoute\",\"className\":\"TbCustomerRoute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":226,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":227,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Describe\",\"columnComment\":\"描述\",\"columnId\":228,\"columnName\":\"describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"describe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"出发时间\",\"columnId\":229,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:43:54', 58);
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbRouteDetail\",\"className\":\"TbRouteDetail\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":252,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RouteId\",\"columnComment\":\"行程id\",\"columnId\":253,\"columnName\":\"route_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"routeId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Total\",\"columnComment\":\"同乘人数\",\"columnId\":254,\"columnName\":\"total\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"total\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"价格\",\"columnId\":255,\"columnName\":\"price\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:44:07', 36);
INSERT INTO `sys_oper_log` VALUES (39, '代码生成', 8, 'com.huizu.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_customer,tb_customer_appraise,tb_customer_route,tb_route_detail,tb_customer_car,tb_customer_chat\"}', NULL, 0, NULL, '2024-08-12 16:44:15', 889);
INSERT INTO `sys_oper_log` VALUES (40, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proCustomer\",\"className\":\"ProCustomer\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"序号\",\"columnId\":152,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:42:38\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"用户类型(1用户，2司机)\",\"columnId\":153,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"pro_customer_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:42:38\",\"usableColumn\":false},{\"capJavaField\":\"Avatar\",\"columnComment\":\"头像地址\",\"columnId\":154,\"columnName\":\"avatar\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"avatar\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:42:38\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":155,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:44:33', 178);
INSERT INTO `sys_oper_log` VALUES (41, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerAppraise\",\"className\":\"TbCustomerAppraise\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":211,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:00\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"评论人id\",\"columnId\":212,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:00\",\"usableColumn\":false},{\"capJavaField\":\"SubId\",\"columnComment\":\"被评论人id\",\"columnId\":213,\"columnName\":\"sub_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:00\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"星级\",\"columnId\":214,\"columnName\":\"level\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:44:40', 34);
INSERT INTO `sys_oper_log` VALUES (42, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerRoute\",\"className\":\"TbCustomerRoute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":226,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:54\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":227,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:54\",\"usableColumn\":false},{\"capJavaField\":\"Describe\",\"columnComment\":\"描述\",\"columnId\":228,\"columnName\":\"describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"describe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:43:54\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"出发时间\",\"columnId\":229,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:44:47', 94);
INSERT INTO `sys_oper_log` VALUES (43, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerCar\",\"className\":\"TbCustomerCar\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":75,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:24:33\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":76,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:24:33\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"车辆信息\",\"columnId\":77,\"columnName\":\"info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"info\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:24:33\",\"usableColumn\":false},{\"capJavaField\":\"Gasoline\",\"columnComment\":\"汽油型号\",\"columnId\":78,\"columnName\":\"gasoline\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"tb_car_gasoline\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:44:56', 96);
INSERT INTO `sys_oper_log` VALUES (44, '代码生成', 8, 'com.huizu.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"pro_customer,tb_customer_appraise,tb_customer_route,tb_route_detail,tb_customer_car,tb_customer_chat\"}', NULL, 0, NULL, '2024-08-12 16:45:05', 758);
INSERT INTO `sys_oper_log` VALUES (45, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/pro_customer', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:08', 197);
INSERT INTO `sys_oper_log` VALUES (46, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_appraise', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:13', 122);
INSERT INTO `sys_oper_log` VALUES (47, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_route', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:13', 216);
INSERT INTO `sys_oper_log` VALUES (48, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_route_detail', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:17', 91);
INSERT INTO `sys_oper_log` VALUES (49, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_chat', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:22', 94);
INSERT INTO `sys_oper_log` VALUES (50, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_car', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:25', 104);
INSERT INTO `sys_oper_log` VALUES (51, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_route_detail', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:34', 101);
INSERT INTO `sys_oper_log` VALUES (52, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_car', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:37', 122);
INSERT INTO `sys_oper_log` VALUES (53, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_route', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 16:45:40', 130);
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2306', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:08:23', 47);
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2313', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:08:28', 26);
INSERT INTO `sys_oper_log` VALUES (56, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2320', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:08:31', 22);
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2299', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:08:52', 22);
INSERT INTO `sys_oper_log` VALUES (58, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2355', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:08:58', 11);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2327', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:09:01', 22);
INSERT INTO `sys_oper_log` VALUES (60, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2334', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:09:04', 9);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2341', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:09:06', 10);
INSERT INTO `sys_oper_log` VALUES (62, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2348', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 17:09:09', 19);
INSERT INTO `sys_oper_log` VALUES (63, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_customer_route', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 18:46:10', 186);
INSERT INTO `sys_oper_log` VALUES (64, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerRoute\",\"className\":\"TbCustomerRoute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":226,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 18:46:10\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":227,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 18:46:10\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型（1司机 2用户）\",\"columnId\":266,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"\",\"createTime\":\"2024-08-12 18:46:10\",\"dictType\":\"pro_customer_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Describe\",\"columnComment\":\"描述\",\"columnId\":228,\"columnName\":\"describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 18:46:37', 205);
INSERT INTO `sys_oper_log` VALUES (65, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_customer_route', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-12 18:46:42', 511);
INSERT INTO `sys_oper_log` VALUES (66, '字典类型', 1, 'com.huizu.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"繰り返し設定\",\"dictType\":\"tb_route_state\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 13:51:48', 58);
INSERT INTO `sys_oper_log` VALUES (67, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"繰り返し\",\"dictSort\":1,\"dictType\":\"tb_route_state\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 13:51:56', 50);
INSERT INTO `sys_oper_log` VALUES (68, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerRoute\",\"className\":\"TbCustomerRoute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":226,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 18:46:37\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":227,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 18:46:37\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型（1司机 2用户）\",\"columnId\":266,\"columnName\":\"type\",\"columnType\":\"char(1)\",\"createBy\":\"\",\"createTime\":\"2024-08-12 18:46:10\",\"dictType\":\"pro_customer_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 18:46:37\",\"usableColumn\":false},{\"capJavaField\":\"Describe\",\"columnComment\":\"描述\",\"columnId\":228,\"columnName\":\"describe\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:37:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 09:08:34', 137);
INSERT INTO `sys_oper_log` VALUES (69, '聊天信息', 1, 'com.huizu.project.controller.TbCustomerChatController.add()', 'POST', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"<p>1111111111111111111111111111</p>\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:12\",\"customerId\":2,\"delFlag\":\"0\",\"id\":1,\"params\":{},\"status\":\"1\",\"subId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:49:12', 17);
INSERT INTO `sys_oper_log` VALUES (70, '聊天信息', 1, 'com.huizu.project.controller.TbCustomerChatController.add()', 'POST', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"<p>222222222222222</p>\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:19\",\"customerId\":3,\"delFlag\":\"0\",\"id\":2,\"params\":{},\"status\":\"1\",\"subId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:49:19', 15);
INSERT INTO `sys_oper_log` VALUES (71, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbCustomerChat\",\"className\":\"TbCustomerChat\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":98,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:26\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"评论人id\",\"columnId\":99,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:26\",\"usableColumn\":false},{\"capJavaField\":\"SubId\",\"columnComment\":\"被评论人id\",\"columnId\":100,\"columnName\":\"sub_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-08-12 16:10:26\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":101,\"columnName\":\"content\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-12 15:13:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:50:00', 74);
INSERT INTO `sys_oper_log` VALUES (72, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"1111111111111111111111111111\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:12\",\"customerId\":2,\"delFlag\":\"0\",\"id\":1,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:51:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:51:12', 15);
INSERT INTO `sys_oper_log` VALUES (73, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"222222222222222\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:19\",\"customerId\":3,\"delFlag\":\"0\",\"id\":2,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:51:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:51:17', 5);
INSERT INTO `sys_oper_log` VALUES (74, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"222222222222222\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:19\",\"customerId\":5,\"delFlag\":\"0\",\"id\":2,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:52:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:52:21', 15);
INSERT INTO `sys_oper_log` VALUES (75, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"1111111111111111111111111111\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:12\",\"customerId\":6,\"delFlag\":\"0\",\"id\":1,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:53:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:53:04', 5);
INSERT INTO `sys_oper_log` VALUES (76, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"222222222222222\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:19\",\"customerId\":7,\"delFlag\":\"0\",\"id\":2,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:53:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:53:20', 14);
INSERT INTO `sys_oper_log` VALUES (77, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"1111111111111111111111111111\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:12\",\"customerId\":5,\"delFlag\":\"0\",\"id\":1,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:53:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:53:30', 14);
INSERT INTO `sys_oper_log` VALUES (78, '聊天信息', 2, 'com.huizu.project.controller.TbCustomerChatController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerChat', '127.0.0.1', '内网IP', '{\"content\":\"222222222222222\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 10:49:19\",\"customerId\":4,\"delFlag\":\"0\",\"id\":2,\"params\":{},\"status\":\"1\",\"subId\":1,\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 10:53:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 10:53:35', 6);
INSERT INTO `sys_oper_log` VALUES (79, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:26:32\",\"default\":false,\"dictCode\":197,\"dictLabel\":\"レギュラー\",\"dictSort\":1,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:25:58', 63);
INSERT INTO `sys_oper_log` VALUES (80, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:28:04\",\"default\":false,\"dictCode\":206,\"dictLabel\":\"ハイオク\",\"dictSort\":2,\"dictType\":\"tb_car_gasoline\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:06', 51);
INSERT INTO `sys_oper_log` VALUES (81, '字典类型', 3, 'com.huizu.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/207', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:09', 54);
INSERT INTO `sys_oper_log` VALUES (82, '字典类型', 3, 'com.huizu.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/208', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:11', 58);
INSERT INTO `sys_oper_log` VALUES (83, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:26:58\",\"default\":false,\"dictCode\":198,\"dictLabel\":\"軽自動車\",\"dictSort\":1,\"dictType\":\"car_cc\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:41', 43);
INSERT INTO `sys_oper_log` VALUES (84, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:26:58\",\"default\":false,\"dictCode\":198,\"dictLabel\":\"軽自動車\",\"dictSort\":1,\"dictType\":\"car_cc\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:47', 54);
INSERT INTO `sys_oper_log` VALUES (85, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:27:05\",\"default\":false,\"dictCode\":199,\"dictLabel\":\" 普通自動車~1300cc\",\"dictSort\":2,\"dictType\":\"car_cc\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:26:57', 70);
INSERT INTO `sys_oper_log` VALUES (86, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:27:05\",\"default\":false,\"dictCode\":199,\"dictLabel\":\"普通自動車~1300cc\",\"dictSort\":2,\"dictType\":\"car_cc\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:05', 59);
INSERT INTO `sys_oper_log` VALUES (87, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-12 16:27:11\",\"default\":false,\"dictCode\":200,\"dictLabel\":\"普通自動車~1600cc\",\"dictSort\":3,\"dictType\":\"car_cc\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:18', 89);
INSERT INTO `sys_oper_log` VALUES (88, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通自動車~1800cc\",\"dictSort\":4,\"dictType\":\"car_cc\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:26', 56);
INSERT INTO `sys_oper_log` VALUES (89, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 普通自動車~2000cc\",\"dictSort\":5,\"dictType\":\"car_cc\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:33', 50);
INSERT INTO `sys_oper_log` VALUES (90, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 普通自動車~2500cc\",\"dictSort\":6,\"dictType\":\"car_cc\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:39', 47);
INSERT INTO `sys_oper_log` VALUES (91, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\" 普通自動車~2500cc以上\",\"dictSort\":7,\"dictType\":\"car_cc\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:43', 46);
INSERT INTO `sys_oper_log` VALUES (92, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-14 12:27:39\",\"default\":false,\"dictCode\":212,\"dictLabel\":\"普通自動車~2500cc\",\"dictSort\":6,\"dictType\":\"car_cc\",\"dictValue\":\"6\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:48', 57);
INSERT INTO `sys_oper_log` VALUES (93, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-14 12:27:33\",\"default\":false,\"dictCode\":211,\"dictLabel\":\"普通自動車~2000cc\",\"dictSort\":5,\"dictType\":\"car_cc\",\"dictValue\":\"5\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:27:52', 58);
INSERT INTO `sys_oper_log` VALUES (94, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"6\",\"dictSort\":6,\"dictType\":\"tb_car_total\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:15', 46);
INSERT INTO `sys_oper_log` VALUES (95, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"7\",\"dictSort\":7,\"dictType\":\"tb_car_total\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:18', 58);
INSERT INTO `sys_oper_log` VALUES (96, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"8\",\"dictSort\":8,\"dictType\":\"tb_car_total\",\"dictValue\":\"8\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:21', 86);
INSERT INTO `sys_oper_log` VALUES (97, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"9\",\"dictSort\":9,\"dictType\":\"tb_car_total\",\"dictValue\":\"9\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:23', 57);
INSERT INTO `sys_oper_log` VALUES (98, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"10\",\"dictSort\":10,\"dictType\":\"tb_car_total\",\"dictValue\":\"10\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:27', 48);
INSERT INTO `sys_oper_log` VALUES (99, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-09 14:25:42\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"女性\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:28:58', 52);
INSERT INTO `sys_oper_log` VALUES (100, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-09 14:25:42\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男性\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:29:12', 56);
INSERT INTO `sys_oper_log` VALUES (101, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-09 14:25:42\",\"cssClass\":\"\",\"default\":false,\"dictCode\":2,\"dictLabel\":\"女性\",\"dictSort\":2,\"dictType\":\"sys_user_sex\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别女\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:29:19', 57);
INSERT INTO `sys_oper_log` VALUES (102, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-07-09 14:25:42\",\"cssClass\":\"\",\"default\":false,\"dictCode\":3,\"dictLabel\":\"未知\",\"dictSort\":3,\"dictType\":\"sys_user_sex\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别未知\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 12:29:25', 42);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.huizu.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_division\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 14:21:33', 78);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tbDivision\",\"className\":\"TbDivision\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":269,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 14:21:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"省编码\",\"columnId\":270,\"columnName\":\"code\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 14:21:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"省名\",\"columnId\":271,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 14:21:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Area\",\"columnComment\":\"市名\",\"columnId\":272,\"columnName\":\"area\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-14 14:21:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"area\",\"javaType\":\"St', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 14:23:37', 30);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_division', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 14:23:49', 260);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.huizu.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_division', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 16:07:02', 87);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-10 09:08:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"xtsz\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 16:19:19', 27);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-09 14:25:42\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":102,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 16:19:38', 21);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/proCustomer/index\",\"createTime\":\"2024-08-12 16:49:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2362,\"menuName\":\"用户信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2298,\"path\":\"proCustomer\",\"perms\":\"project:proCustomer:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 16:21:12', 9);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"単日\",\"dictSort\":2,\"dictType\":\"tb_route_state\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 17:05:28', 40);
INSERT INTO `sys_oper_log` VALUES (111, '汽车管理', 2, 'com.huizu.project.controller.TbCustomerCarController.edit()', 'PUT', 1, 'admin', '研发部门', '/project/tbCustomerCar', '127.0.0.1', '内网IP', '{\"carCc\":\"1\",\"createTime\":\"2024-08-13 15:53:33\",\"customerId\":1,\"delFlag\":\"0\",\"gasoline\":\"2\",\"id\":1,\"info\":\"车辆信息车辆信息1111\",\"isEtc\":\"1\",\"params\":{},\"status\":\"1\",\"total\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2024-08-14 17:19:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 17:19:15', 23);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/tbCustomerAppraise/index\",\"createTime\":\"2024-08-12 16:49:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2369,\"menuName\":\"评价\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2298,\"path\":\"tbCustomerAppraise\",\"perms\":\"project:tbCustomerAppraise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 17:32:54', 33);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/tbCustomerRoute/index\",\"createTime\":\"2024-08-12 16:49:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2390,\"menuName\":\"拼车管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2298,\"path\":\"tbCustomerRoute\",\"perms\":\"project:tbCustomerRoute:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 17:33:03', 11);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/tbRouteDetail/index\",\"createTime\":\"2024-08-12 16:49:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2397,\"menuName\":\"拼车资金明细\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2298,\"path\":\"tbRouteDetail\",\"perms\":\"project:tbRouteDetail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-14 17:33:21', 19);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"createTime\":\"2024-07-09 14:25:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":103,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-19 16:02:59', 31);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/proCustomer/index\",\"createTime\":\"2024-08-12 16:49:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2362,\"menuName\":\"用户信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"proCustomer\",\"perms\":\"project:proCustomer:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:21', 35);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerAppraise/index\",\"createTime\":\"2024-08-12 16:49:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2369,\"menuName\":\"评价\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerAppraise\",\"perms\":\"project:tbCustomerAppraise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:25', 10);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerCar/index\",\"createTime\":\"2024-08-12 16:49:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2376,\"menuName\":\"汽车管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerCar\",\"perms\":\"project:tbCustomerCar:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:29', 10);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerChat/index\",\"createTime\":\"2024-08-12 16:49:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2383,\"menuName\":\"聊天信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerChat\",\"perms\":\"project:tbCustomerChat:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:33', 11);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerRoute/index\",\"createTime\":\"2024-08-12 16:49:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2390,\"menuName\":\"拼车管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerRoute\",\"perms\":\"project:tbCustomerRoute:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:37', 10);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbRouteDetail/index\",\"createTime\":\"2024-08-12 16:49:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2397,\"menuName\":\"拼车资金明细\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbRouteDetail\",\"perms\":\"project:tbRouteDetail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:41', 9);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbDivision/index\",\"createTime\":\"2024-08-14 16:10:00\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2404,\"menuName\":\"行政区划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbDivision\",\"perms\":\"project:tbDivision:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:03:46', 11);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.huizu.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2298', '182.45.245.154', 'XX XX', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-08-21 16:03:51', 9);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"system/agreement/index\",\"createTime\":\"2024-07-09 15:34:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"协议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"agreement\",\"perms\":\"system:agreement:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-21 16:04:10', 9);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerAppraise/index\",\"createTime\":\"2024-08-12 16:49:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2369,\"menuName\":\"评价\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerAppraise\",\"perms\":\"project:tbCustomerAppraise:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-22 15:18:01', 14);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbCustomerChat/index\",\"createTime\":\"2024-08-12 16:49:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2383,\"menuName\":\"聊天信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbCustomerChat\",\"perms\":\"project:tbCustomerChat:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-22 15:18:31', 7);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"project/tbRouteDetail/index\",\"createTime\":\"2024-08-12 16:49:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2397,\"menuName\":\"拼车资金明细\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tbRouteDetail\",\"perms\":\"project:tbRouteDetail:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-22 15:18:57', 8);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '182.45.245.154', 'XX XX', '{\"children\":[],\"component\":\"system/agreement/index\",\"createTime\":\"2024-07-09 15:34:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"协议管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"agreement\",\"perms\":\"system:agreement:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-22 15:20:49', 8);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-09 14:25:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":103,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:29:36', 30);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.huizu.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"pro_order_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:29:46', 132);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proOrderInfo\",\"className\":\"ProOrderInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"序号\",\"columnId\":308,\"columnName\":\"id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":309,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DriverId\",\"columnComment\":\"司机id\",\"columnId\":310,\"columnName\":\"driver_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"driverId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RouteId\",\"columnComment\":\"行程id\",\"columnId\":311,\"columnName\":\"route_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:30:26', 125);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.huizu.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/pro_order_info', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:30:31', 387);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.huizu.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/proOrderInfo/index\",\"createTime\":\"2024-08-26 09:31:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2411,\"menuName\":\"订单信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"proOrderInfo\",\"perms\":\"project:proOrderInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:31:34', 20);
INSERT INTO `sys_oper_log` VALUES (134, '字典类型', 1, 'com.huizu.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"订单状态\",\"dictType\":\"tb_order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:03:23', 57);
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待确认价格\",\"dictSort\":1,\"dictType\":\"tb_order_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:03:45', 118);
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待支付\",\"dictSort\":2,\"dictType\":\"tb_order_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:03:53', 37);
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":3,\"dictType\":\"tb_order_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:04:04', 40);
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 1, 'com.huizu.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":4,\"dictType\":\"tb_order_status\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:04:09', 43);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.huizu.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"proOrderInfo\",\"className\":\"ProOrderInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"序号\",\"columnId\":308,\"columnName\":\"id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-08-26 09:30:26\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"用户id\",\"columnId\":309,\"columnName\":\"customer_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-08-26 09:30:26\",\"usableColumn\":false},{\"capJavaField\":\"DriverId\",\"columnComment\":\"司机id\",\"columnId\":310,\"columnName\":\"driver_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"driverId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-08-26 09:30:26\",\"usableColumn\":false},{\"capJavaField\":\"RouteId\",\"columnComment\":\"行程id\",\"columnId\":311,\"columnName\":\"route_id\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 09:29:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"inse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:18', 123);
INSERT INTO `sys_oper_log` VALUES (140, '字典类型', 3, 'com.huizu.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/188,190,189,191', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:53:54', 188);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-01 10:49:59\",\"default\":false,\"dictCode\":186,\"dictLabel\":\"司机\",\"dictSort\":1,\"dictType\":\"pro_customer_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:54:03', 44);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 2, 'com.huizu.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-01 10:50:05\",\"default\":false,\"dictCode\":187,\"dictLabel\":\"用户\",\"dictSort\":2,\"dictType\":\"pro_customer_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:54:08', 50);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-09 14:25:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_price
-- ----------------------------
DROP TABLE IF EXISTS `sys_price`;
CREATE TABLE `sys_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `today_price` decimal(10, 2) NOT NULL COMMENT '今日销售',
  `month_price` decimal(10, 2) NOT NULL COMMENT '月销售',
  `price` decimal(10, 2) NOT NULL COMMENT '累积销售',
  `today_amount` decimal(10, 2) NOT NULL COMMENT '今日奖励',
  `month_amount` decimal(10, 2) NOT NULL COMMENT '月奖励',
  `amount` decimal(10, 2) NOT NULL COMMENT '累积奖励',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '奖金池表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_price
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` bit(1) NULL DEFAULT b'1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` bit(1) NULL DEFAULT b'1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', b'1', b'1', '0', '0', 'admin', '2024-07-09 14:25:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', b'1', b'1', '0', '0', 'admin', '2024-07-09 14:25:42', 'admin', '2024-07-09 15:14:51', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_service
-- ----------------------------
DROP TABLE IF EXISTS `sys_service`;
CREATE TABLE `sys_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信二维码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用状态（0.停用 1.启用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客服信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_service
-- ----------------------------
INSERT INTO `sys_service` VALUES (1, '111111111', 'https://kafeizulinbucket.oss-cn-beijing.aliyuncs.com/1722477762513.png', '1', 'admin', '2022-02-21 11:19:52', 'admin', '2024-08-01 10:02:44', NULL, '0');

-- ----------------------------
-- Table structure for sys_share
-- ----------------------------
DROP TABLE IF EXISTS `sys_share`;
CREATE TABLE `sys_share`  (
  `one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级代理分润',
  `two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级代理分润',
  `vip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员分享分润'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分润设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_share
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-08-26 13:39:49', 'admin', '2024-07-09 14:25:42', '', '2024-08-26 13:39:49', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-09 14:25:42', 'admin', '2024-07-09 14:25:42', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_version
-- ----------------------------
DROP TABLE IF EXISTS `sys_version`;
CREATE TABLE `sys_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '本表主键',
  `store_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '商店类型:1小米、2应用宝、3华为、4百度、5 360、6豌豆荚、7魅族',
  `system_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '系统类型：1安卓、2IOS',
  `res_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装url',
  `version_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本编码:递增值，每次加1',
  `version_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称:当前版本名称',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新内容',
  `up_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否强制更新：1强制、2不强制',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '删除标签:1未删除、2删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储app版本相关信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_version
-- ----------------------------
INSERT INTO `sys_version` VALUES (1, '1', '1', 'video(4).mp4', '12.1', '1212', NULL, '0', NULL, '1', '2024-07-27 13:59:26', '2024-07-27 13:59:26', '0');

-- ----------------------------
-- Table structure for sys_we
-- ----------------------------
DROP TABLE IF EXISTS `sys_we`;
CREATE TABLE `sys_we`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公司简介',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关于我们表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_we
-- ----------------------------
INSERT INTO `sys_we` VALUES (1, 'https://shoppingmallbucket.oss-cn-beijing.aliyuncs.com/1712470384225.jpg', '名称名称名称', '山东济南', '	百度（Baidu）是拥有强大互联网基础的领先AI公司。百度愿景是：成为最懂用户，并能帮助人们成长的全球顶级高科技公司。&nbsp;[1]	“百度”二字，来自于八百年前南宋词人辛弃疾的一句词：众里寻他千百度。这句话描述了词人对理想的执着追求。1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司。	百度拥有数万名研发工程师，这是中国乃至全球都顶尖的技术团队。这支队伍掌握着世界上领先的搜索引擎技术，使百度成为掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。&nbsp;[1]', '1', 'admin', '2022-02-21 11:19:52', 'admin', '2024-07-27 17:55:21', NULL, '0');
INSERT INTO `sys_we` VALUES (2, NULL, '1231123', NULL, NULL, '1', 'admin', '2024-07-27 17:51:43', 'admin', '2024-07-27 17:51:47', NULL, '1');
INSERT INTO `sys_we` VALUES (3, NULL, '1', NULL, '	百度<em>（Baidu）</em>是拥有强大互联网基础的领先AI公司。百度愿景是：成为最懂用户，并能帮助人们成长的全球顶级高科技公司。&nbsp;	“百度”二字，来自于八百年前南宋词的一句词：众里寻他千百度。这句话描述了词人对理想的执着追求。1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司。	百度拥有数万名研发工程师，这是中国乃至全球都顶尖的技术团队。这支队伍掌握着世界上领先的搜索引擎技术，使百度成为掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。&nbsp;', '1', 'admin', '2024-07-27 17:54:35', NULL, NULL, NULL, '1');

-- ----------------------------
-- Table structure for tb_customer_appraise
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_appraise`;
CREATE TABLE `tb_customer_appraise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(10) NULL DEFAULT NULL COMMENT '评论人id',
  `sub_id` int(10) NULL DEFAULT NULL COMMENT '被评论人id',
  `level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星级',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记（0正常，1删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评价表;' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_appraise
-- ----------------------------
INSERT INTO `tb_customer_appraise` VALUES (1, 5, 1, '5', '评论评论', '1', NULL, '2024-08-13 17:09:35', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_appraise` VALUES (2, 2, 1, '4', '评论评论', '1', NULL, '2024-08-13 17:10:51', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_appraise` VALUES (3, 2, 1, '5', '评论评论', '1', NULL, '2024-08-13 17:33:43', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_appraise` VALUES (4, 1, 6, '5', '评论评论', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_appraise` VALUES (5, 5, 6, '5', '评论评论', '1', NULL, '2024-08-22 16:23:23', NULL, NULL, NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_customer_car
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_car`;
CREATE TABLE `tb_customer_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆信息',
  `gasoline` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汽油型号',
  `car_cc` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排气量',
  `total` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乘坐人数',
  `is_etc` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ETC',
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `decade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年代',
  `grade` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内饰等级',
  `is_navigation` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否有导航仪',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记（0正常，1删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '汽车管理;' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_car
-- ----------------------------
INSERT INTO `tb_customer_car` VALUES (1, 1, '车辆信息车辆信息1111', '2', '1', '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-08-13 15:53:33', 'admin', '2024-08-14 17:19:16', NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_car` VALUES (2, 3, '车辆信息车辆信息', '2', '1', '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-08-13 16:05:12', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_car` VALUES (3, 2, '车辆信息车辆信息', '2', '1', '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-08-13 16:05:25', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_car` VALUES (4, 6, '黑色桑塔纳', '1', '4', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-08-21 16:49:17', NULL, NULL, NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_customer_chat
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_chat`;
CREATE TABLE `tb_customer_chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(10) NULL DEFAULT NULL COMMENT '评论人id',
  `sub_id` int(10) NULL DEFAULT NULL COMMENT '被评论人id',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记（0正常，1删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天信息表;' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_chat
-- ----------------------------
INSERT INTO `tb_customer_chat` VALUES (1, 5, 1, '1111111111111111111111111111', '1', 'admin', '2024-08-14 10:49:12', 'admin', '2024-08-14 10:53:30', NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_chat` VALUES (2, 4, 1, '222222222222222', '1', 'admin', '2024-08-14 10:49:19', 'admin', '2024-08-14 10:53:36', NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_customer_route
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_route`;
CREATE TABLE `tb_customer_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（1司机 2用户）',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `start_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '到达时间',
  `start_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出发地址',
  `end_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目的地址',
  `start_lon_lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出发地经纬度',
  `end_lon_lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目的地经纬度',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车型号',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total` int(10) NULL DEFAULT NULL COMMENT '可乘坐数量',
  `already_total` int(10) NULL DEFAULT 0 COMMENT '已乘坐数量',
  `attention` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事前注意事项',
  `comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论',
  `view_total` int(10) NULL DEFAULT NULL COMMENT '访问人数',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重复设定',
  `route_state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态，待接客，客已满，行驶中，结束',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记（0正常，1删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行程管理;' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_route
-- ----------------------------
INSERT INTO `tb_customer_route` VALUES (1, 1, '1', NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, NULL, NULL, '1', NULL, '2024-08-13 11:23:25', NULL, NULL, NULL, '1', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (2, 1, '1', NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, NULL, NULL, '1', NULL, '2024-08-13 11:23:37', NULL, NULL, NULL, '1', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (3, 1, '1', NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, NULL, NULL, '1', NULL, '2024-08-13 11:23:40', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (4, 1, '1', NULL, '2024-01-04 07:23:34', NULL, '出发地1', '目的地1', '出发地经纬度1', '目的地经纬度1', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项1', '评论评论1', NULL, '2', NULL, '1', NULL, '2024-08-13 13:59:29', NULL, '2024-08-13 14:18:11', NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (5, 2, NULL, NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-13 14:47:45', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (6, 5, NULL, NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-13 14:53:49', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (7, 1, NULL, NULL, '2024-09-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-13 18:44:14', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (8, 1, NULL, NULL, '2024-09-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 09:18:23', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (9, 1, '2', NULL, '2024-09-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 09:23:07', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (10, 1, '1', NULL, '2024-01-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-14 09:23:27', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (11, 1, '1', NULL, '2024-10-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-14 09:23:43', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (12, 1, '2', NULL, '2024-10-04 07:23:34', NULL, '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 09:38:40', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (13, 1, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 10:03:03', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (14, 1, '1', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-14 10:03:24', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (15, 5, '1', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', NULL, '2024-08-14 10:05:55', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (16, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 10:09:27', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (17, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, 1, 0, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-14 17:32:11', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (18, 6, '2', NULL, '2024-08-23 10:00:00', '2024-08-23 12:30:00', 'ﾌｸｼﾏｹﾝ', 'ﾅﾗｹﾝ', '35.9593,139.6344', '35.9593,140.6344', NULL, NULL, NULL, 4, 0, '带好随身物品', '评价一下吧', NULL, '2', NULL, '1', NULL, '2024-08-22 14:10:08', NULL, NULL, NULL, '1', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (19, 6, '2', NULL, '2024-08-23 05:00:00', '2024-08-23 07:38:00', 'ｲﾜﾃｹﾝ', 'ｼｽﾞｵｶｹﾝ', '35.9593,139.6344', '35.9593,140.6344', NULL, NULL, 1000.00, 4, 0, '啊实打实a', '的啊大宋', NULL, '1', NULL, '1', NULL, '2024-08-22 14:14:15', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (20, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-23 16:41:50', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (21, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, NULL, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-23 16:44:15', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (46, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 3000.00, NULL, 6, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-26 11:24:40', NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_customer_route` VALUES (47, 2, '2', NULL, '2024-10-04 07:23:34', '2024-10-04 08:23:34', '出发地', '目的地', '出发地经纬度', '目的地经纬度', NULL, NULL, 9000.00, 3, 3, '事前确认事项', '评论评论', NULL, '1', NULL, '1', NULL, '2024-08-26 11:28:06', NULL, NULL, NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_division
-- ----------------------------
DROP TABLE IF EXISTS `tb_division`;
CREATE TABLE `tb_division`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `city_C` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '都道府県名',
  `area_C` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市区町村名',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '都道府県名(日文)',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市区町村名(日文)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_division
-- ----------------------------
INSERT INTO `tb_division` VALUES (349, '010006', '北海道', NULL, 'ﾎｯｶｲﾄﾞｳ', NULL);
INSERT INTO `tb_division` VALUES (350, '011002', '北海道', '札幌市', 'ﾎｯｶｲﾄﾞｳ', 'ｻｯﾎﾟﾛｼ');
INSERT INTO `tb_division` VALUES (351, '012025', '北海道', '函館市', 'ﾎｯｶｲﾄﾞｳ', 'ﾊｺﾀﾞﾃｼ');
INSERT INTO `tb_division` VALUES (352, '012033', '北海道', '小樽市', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾀﾙｼ');
INSERT INTO `tb_division` VALUES (353, '012041', '北海道', '旭川市', 'ﾎｯｶｲﾄﾞｳ', 'ｱｻﾋｶﾜｼ');
INSERT INTO `tb_division` VALUES (354, '012050', '北海道', '室蘭市', 'ﾎｯｶｲﾄﾞｳ', 'ﾑﾛﾗﾝｼ');
INSERT INTO `tb_division` VALUES (355, '012068', '北海道', '釧路市', 'ﾎｯｶｲﾄﾞｳ', 'ｸｼﾛｼ');
INSERT INTO `tb_division` VALUES (356, '012076', '北海道', '帯広市', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾋﾞﾋﾛｼ');
INSERT INTO `tb_division` VALUES (357, '012084', '北海道', '北見市', 'ﾎｯｶｲﾄﾞｳ', 'ｷﾀﾐｼ');
INSERT INTO `tb_division` VALUES (358, '012092', '北海道', '夕張市', 'ﾎｯｶｲﾄﾞｳ', 'ﾕｳﾊﾞﾘｼ');
INSERT INTO `tb_division` VALUES (359, '012106', '北海道', '岩見沢市', 'ﾎｯｶｲﾄﾞｳ', 'ｲﾜﾐｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (360, '012114', '北海道', '網走市', 'ﾎｯｶｲﾄﾞｳ', 'ｱﾊﾞｼﾘｼ');
INSERT INTO `tb_division` VALUES (361, '012122', '北海道', '留萌市', 'ﾎｯｶｲﾄﾞｳ', 'ﾙﾓｲｼ');
INSERT INTO `tb_division` VALUES (362, '012131', '北海道', '苫小牧市', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾏｺﾏｲｼ');
INSERT INTO `tb_division` VALUES (363, '012149', '北海道', '稚内市', 'ﾎｯｶｲﾄﾞｳ', 'ﾜｯｶﾅｲｼ');
INSERT INTO `tb_division` VALUES (364, '012157', '北海道', '美唄市', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾞﾊﾞｲｼ');
INSERT INTO `tb_division` VALUES (365, '012165', '北海道', '芦別市', 'ﾎｯｶｲﾄﾞｳ', 'ｱｼﾍﾞﾂｼ');
INSERT INTO `tb_division` VALUES (366, '012173', '北海道', '江別市', 'ﾎｯｶｲﾄﾞｳ', 'ｴﾍﾞﾂｼ');
INSERT INTO `tb_division` VALUES (367, '012181', '北海道', '赤平市', 'ﾎｯｶｲﾄﾞｳ', 'ｱｶﾋﾞﾗｼ');
INSERT INTO `tb_division` VALUES (368, '012190', '北海道', '紋別市', 'ﾎｯｶｲﾄﾞｳ', 'ﾓﾝﾍﾞﾂｼ');
INSERT INTO `tb_division` VALUES (369, '012203', '北海道', '士別市', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾍﾞﾂｼ');
INSERT INTO `tb_division` VALUES (370, '012211', '北海道', '名寄市', 'ﾎｯｶｲﾄﾞｳ', 'ﾅﾖﾛｼ');
INSERT INTO `tb_division` VALUES (371, '012220', '北海道', '三笠市', 'ﾎｯｶｲﾄﾞｳ', 'ﾐｶｻｼ');
INSERT INTO `tb_division` VALUES (372, '012238', '北海道', '根室市', 'ﾎｯｶｲﾄﾞｳ', 'ﾈﾑﾛｼ');
INSERT INTO `tb_division` VALUES (373, '012246', '北海道', '千歳市', 'ﾎｯｶｲﾄﾞｳ', 'ﾁﾄｾｼ');
INSERT INTO `tb_division` VALUES (374, '012254', '北海道', '滝川市', 'ﾎｯｶｲﾄﾞｳ', 'ﾀｷｶﾜｼ');
INSERT INTO `tb_division` VALUES (375, '012262', '北海道', '砂川市', 'ﾎｯｶｲﾄﾞｳ', 'ｽﾅｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (376, '012271', '北海道', '歌志内市', 'ﾎｯｶｲﾄﾞｳ', 'ｳﾀｼﾅｲｼ');
INSERT INTO `tb_division` VALUES (377, '012289', '北海道', '深川市', 'ﾎｯｶｲﾄﾞｳ', 'ﾌｶｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (378, '012297', '北海道', '富良野市', 'ﾎｯｶｲﾄﾞｳ', 'ﾌﾗﾉｼ');
INSERT INTO `tb_division` VALUES (379, '012301', '北海道', '登別市', 'ﾎｯｶｲﾄﾞｳ', 'ﾉﾎﾞﾘﾍﾞﾂｼ');
INSERT INTO `tb_division` VALUES (380, '012319', '北海道', '恵庭市', 'ﾎｯｶｲﾄﾞｳ', 'ｴﾆﾜｼ');
INSERT INTO `tb_division` VALUES (381, '012335', '北海道', '伊達市', 'ﾎｯｶｲﾄﾞｳ', 'ﾀﾞﾃｼ');
INSERT INTO `tb_division` VALUES (382, '012343', '北海道', '北広島市', 'ﾎｯｶｲﾄﾞｳ', 'ｷﾀﾋﾛｼﾏｼ');
INSERT INTO `tb_division` VALUES (383, '012351', '北海道', '石狩市', 'ﾎｯｶｲﾄﾞｳ', 'ｲｼｶﾘｼ');
INSERT INTO `tb_division` VALUES (384, '012360', '北海道', '北斗市', 'ﾎｯｶｲﾄﾞｳ', 'ﾎｸﾄｼ');
INSERT INTO `tb_division` VALUES (385, '013030', '北海道', '当別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄｳﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (386, '013048', '北海道', '新篠津村', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾝｼﾉﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (387, '013315', '北海道', '松前町', 'ﾎｯｶｲﾄﾞｳ', 'ﾏﾂﾏｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (388, '013323', '北海道', '福島町', 'ﾎｯｶｲﾄﾞｳ', 'ﾌｸｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (389, '013331', '北海道', '知内町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾘｳﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (390, '013340', '北海道', '木古内町', 'ﾎｯｶｲﾄﾞｳ', 'ｷｺﾅｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (391, '013374', '北海道', '七飯町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅﾅｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (392, '013439', '北海道', '鹿部町', 'ﾎｯｶｲﾄﾞｳ', 'ｼｶﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (393, '013455', '北海道', '森町', 'ﾎｯｶｲﾄﾞｳ', 'ﾓﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (394, '013463', '北海道', '八雲町', 'ﾎｯｶｲﾄﾞｳ', 'ﾔｸﾓﾁｮｳ');
INSERT INTO `tb_division` VALUES (395, '013471', '北海道', '長万部町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｼｬﾏﾝﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (396, '013617', '北海道', '江差町', 'ﾎｯｶｲﾄﾞｳ', 'ｴｻｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (397, '013625', '北海道', '上ノ国町', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾐﾉｸﾆﾁｮｳ');
INSERT INTO `tb_division` VALUES (398, '013633', '北海道', '厚沢部町', 'ﾎｯｶｲﾄﾞｳ', 'ｱｯｻﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (399, '013641', '北海道', '乙部町', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾄﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (400, '013676', '北海道', '奥尻町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｸｼﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (401, '013706', '北海道', '今金町', 'ﾎｯｶｲﾄﾞｳ', 'ｲﾏｶﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (402, '013714', '北海道', 'せたな町', 'ﾎｯｶｲﾄﾞｳ', 'ｾﾀﾅﾁｮｳ');
INSERT INTO `tb_division` VALUES (403, '013919', '北海道', '島牧村', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾏﾏｷﾑﾗ');
INSERT INTO `tb_division` VALUES (404, '013927', '北海道', '寿都町', 'ﾎｯｶｲﾄﾞｳ', 'ｽｯﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (405, '013935', '北海道', '黒松内町', 'ﾎｯｶｲﾄﾞｳ', 'ｸﾛﾏﾂﾅｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (406, '013943', '北海道', '蘭越町', 'ﾎｯｶｲﾄﾞｳ', 'ﾗﾝｺｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (407, '013951', '北海道', 'ニセコ町', 'ﾎｯｶｲﾄﾞｳ', 'ﾆｾｺﾁｮｳ');
INSERT INTO `tb_division` VALUES (408, '013960', '北海道', '真狩村', 'ﾎｯｶｲﾄﾞｳ', 'ﾏｯｶﾘﾑﾗ');
INSERT INTO `tb_division` VALUES (409, '013978', '北海道', '留寿都村', 'ﾎｯｶｲﾄﾞｳ', 'ﾙｽﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (410, '013986', '北海道', '喜茂別町', 'ﾎｯｶｲﾄﾞｳ', 'ｷﾓﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (411, '013994', '北海道', '京極町', 'ﾎｯｶｲﾄﾞｳ', 'ｷｮｳｺﾞｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (412, '014001', '北海道', '倶知安町', 'ﾎｯｶｲﾄﾞｳ', 'ｸｯﾁｬﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (413, '014010', '北海道', '共和町', 'ﾎｯｶｲﾄﾞｳ', 'ｷｮｳﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (414, '014028', '北海道', '岩内町', 'ﾎｯｶｲﾄﾞｳ', 'ｲﾜﾅｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (415, '014036', '北海道', '泊村', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾏﾘﾑﾗ');
INSERT INTO `tb_division` VALUES (416, '014044', '北海道', '神恵内村', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾓｴﾅｲﾑﾗ');
INSERT INTO `tb_division` VALUES (417, '014052', '北海道', '積丹町', 'ﾎｯｶｲﾄﾞｳ', 'ｼｬｺﾀﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (418, '014061', '北海道', '古平町', 'ﾎｯｶｲﾄﾞｳ', 'ﾌﾙﾋﾞﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (419, '014079', '北海道', '仁木町', 'ﾎｯｶｲﾄﾞｳ', 'ﾆｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (420, '014087', '北海道', '余市町', 'ﾎｯｶｲﾄﾞｳ', 'ﾖｲﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (421, '014095', '北海道', '赤井川村', 'ﾎｯｶｲﾄﾞｳ', 'ｱｶｲｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (422, '014231', '北海道', '南幌町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅﾝﾎﾟﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (423, '014249', '北海道', '奈井江町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｲｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (424, '014257', '北海道', '上砂川町', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾐｽﾅｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (425, '014273', '北海道', '由仁町', 'ﾎｯｶｲﾄﾞｳ', 'ﾕﾆﾁｮｳ');
INSERT INTO `tb_division` VALUES (426, '014281', '北海道', '長沼町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶﾞﾇﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (427, '014290', '北海道', '栗山町', 'ﾎｯｶｲﾄﾞｳ', 'ｸﾘﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (428, '014303', '北海道', '月形町', 'ﾎｯｶｲﾄﾞｳ', 'ﾂｷｶﾞﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (429, '014311', '北海道', '浦臼町', 'ﾎｯｶｲﾄﾞｳ', 'ｳﾗｳｽﾁｮｳ');
INSERT INTO `tb_division` VALUES (430, '014320', '北海道', '新十津川町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾝﾄﾂｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (431, '014338', '北海道', '妹背牛町', 'ﾎｯｶｲﾄﾞｳ', 'ﾓｾｳｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (432, '014346', '北海道', '秩父別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾁｯﾌﾟﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (433, '014362', '北海道', '雨竜町', 'ﾎｯｶｲﾄﾞｳ', 'ｳﾘｭｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (434, '014371', '北海道', '北竜町', 'ﾎｯｶｲﾄﾞｳ', 'ﾎｸﾘｭｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (435, '014389', '北海道', '沼田町', 'ﾎｯｶｲﾄﾞｳ', 'ﾇﾏﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (436, '014524', '北海道', '鷹栖町', 'ﾎｯｶｲﾄﾞｳ', 'ﾀｶｽﾁｮｳ');
INSERT INTO `tb_division` VALUES (437, '014532', '北海道', '東神楽町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋｶﾞｼｶｸﾞﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (438, '014541', '北海道', '当麻町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄｳﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (439, '014559', '北海道', '比布町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾟｯﾌﾟﾁｮｳ');
INSERT INTO `tb_division` VALUES (440, '014567', '北海道', '愛別町', 'ﾎｯｶｲﾄﾞｳ', 'ｱｲﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (441, '014575', '北海道', '上川町', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾐｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (442, '014583', '北海道', '東川町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋｶﾞｼｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (443, '014591', '北海道', '美瑛町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾞｴｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (444, '014605', '北海道', '上富良野町', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾐﾌﾗﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (445, '014613', '北海道', '中富良野町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶﾌﾗﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (446, '014621', '北海道', '南富良野町', 'ﾎｯｶｲﾄﾞｳ', 'ﾐﾅﾐﾌﾗﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (447, '014630', '北海道', '占冠村', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾑｶｯﾌﾟﾑﾗ');
INSERT INTO `tb_division` VALUES (448, '014648', '北海道', '和寒町', 'ﾎｯｶｲﾄﾞｳ', 'ﾜｯｻﾑﾁｮｳ');
INSERT INTO `tb_division` VALUES (449, '014656', '北海道', '剣淵町', 'ﾎｯｶｲﾄﾞｳ', 'ｹﾝﾌﾞﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (450, '014681', '北海道', '下川町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾓｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (451, '014699', '北海道', '美深町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾞﾌｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (452, '014702', '北海道', '音威子府村', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾄｲﾈｯﾌﾟﾑﾗ');
INSERT INTO `tb_division` VALUES (453, '014711', '北海道', '中川町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (454, '014729', '北海道', '幌加内町', 'ﾎｯｶｲﾄﾞｳ', 'ﾎﾛｶﾅｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (455, '014818', '北海道', '増毛町', 'ﾎｯｶｲﾄﾞｳ', 'ﾏｼｹﾁｮｳ');
INSERT INTO `tb_division` VALUES (456, '014826', '北海道', '小平町', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾋﾞﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (457, '014834', '北海道', '苫前町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾏﾏｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (458, '014842', '北海道', '羽幌町', 'ﾎｯｶｲﾄﾞｳ', 'ﾊﾎﾞﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (459, '014851', '北海道', '初山別村', 'ﾎｯｶｲﾄﾞｳ', 'ｼｮｻﾝﾍﾞﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (460, '014869', '北海道', '遠別町', 'ﾎｯｶｲﾄﾞｳ', 'ｴﾝﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (461, '014877', '北海道', '天塩町', 'ﾎｯｶｲﾄﾞｳ', 'ﾃｼｵﾁｮｳ');
INSERT INTO `tb_division` VALUES (462, '015113', '北海道', '猿払村', 'ﾎｯｶｲﾄﾞｳ', 'ｻﾙﾌﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (463, '015121', '北海道', '浜頓別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾊﾏﾄﾝﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (464, '015130', '北海道', '中頓別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶﾄﾝﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (465, '015148', '北海道', '枝幸町', 'ﾎｯｶｲﾄﾞｳ', 'ｴｻｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (466, '015164', '北海道', '豊富町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾖﾄﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (467, '015172', '北海道', '礼文町', 'ﾎｯｶｲﾄﾞｳ', 'ﾚﾌﾞﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (468, '015181', '北海道', '利尻町', 'ﾎｯｶｲﾄﾞｳ', 'ﾘｼﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (469, '015199', '北海道', '利尻富士町', 'ﾎｯｶｲﾄﾞｳ', 'ﾘｼﾘﾌｼﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (470, '015202', '北海道', '幌延町', 'ﾎｯｶｲﾄﾞｳ', 'ﾎﾛﾉﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (471, '015431', '北海道', '美幌町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾞﾎﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (472, '015440', '北海道', '津別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾂﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (473, '015458', '北海道', '斜里町', 'ﾎｯｶｲﾄﾞｳ', 'ｼｬﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (474, '015466', '北海道', '清里町', 'ﾎｯｶｲﾄﾞｳ', 'ｷﾖｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (475, '015474', '北海道', '小清水町', 'ﾎｯｶｲﾄﾞｳ', 'ｺｼﾐｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (476, '015491', '北海道', '訓子府町', 'ﾎｯｶｲﾄﾞｳ', 'ｸﾝﾈｯﾌﾟﾁｮｳ');
INSERT INTO `tb_division` VALUES (477, '015504', '北海道', '置戸町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｹﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (478, '015521', '北海道', '佐呂間町', 'ﾎｯｶｲﾄﾞｳ', 'ｻﾛﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (479, '015555', '北海道', '遠軽町', 'ﾎｯｶｲﾄﾞｳ', 'ｴﾝｶﾞﾙﾁｮｳ');
INSERT INTO `tb_division` VALUES (480, '015598', '北海道', '湧別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾕｳﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (481, '015601', '北海道', '滝上町', 'ﾎｯｶｲﾄﾞｳ', 'ﾀｷﾉｳｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (482, '015610', '北海道', '興部町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｺｯﾍﾟﾁｮｳ');
INSERT INTO `tb_division` VALUES (483, '015628', '北海道', '西興部村', 'ﾎｯｶｲﾄﾞｳ', 'ﾆｼｵｺｯﾍﾟﾑﾗ');
INSERT INTO `tb_division` VALUES (484, '015636', '北海道', '雄武町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｳﾑﾁｮｳ');
INSERT INTO `tb_division` VALUES (485, '015644', '北海道', '大空町', 'ﾎｯｶｲﾄﾞｳ', 'ｵｵｿﾞﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (486, '015717', '北海道', '豊浦町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾖｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (487, '015750', '北海道', '壮瞥町', 'ﾎｯｶｲﾄﾞｳ', 'ｿｳﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (488, '015784', '北海道', '白老町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾗｵｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (489, '015814', '北海道', '厚真町', 'ﾎｯｶｲﾄﾞｳ', 'ｱﾂﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (490, '015849', '北海道', '洞爺湖町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄｳﾔｺﾁｮｳ');
INSERT INTO `tb_division` VALUES (491, '015857', '北海道', '安平町', 'ﾎｯｶｲﾄﾞｳ', 'ｱﾋﾞﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (492, '015865', '北海道', 'むかわ町', 'ﾎｯｶｲﾄﾞｳ', 'ﾑｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (493, '016012', '北海道', '日高町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾀﾞｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (494, '016021', '北海道', '平取町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾞﾗﾄﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (495, '016047', '北海道', '新冠町', 'ﾎｯｶｲﾄﾞｳ', 'ﾆｲｶｯﾌﾟﾁｮｳ');
INSERT INTO `tb_division` VALUES (496, '016071', '北海道', '浦河町', 'ﾎｯｶｲﾄﾞｳ', 'ｳﾗｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (497, '016080', '北海道', '様似町', 'ﾎｯｶｲﾄﾞｳ', 'ｻﾏﾆﾁｮｳ');
INSERT INTO `tb_division` VALUES (498, '016098', '北海道', 'えりも町', 'ﾎｯｶｲﾄﾞｳ', 'ｴﾘﾓﾁｮｳ');
INSERT INTO `tb_division` VALUES (499, '016101', '北海道', '新ひだか町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾝﾋﾀﾞｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (500, '016314', '北海道', '音更町', 'ﾎｯｶｲﾄﾞｳ', 'ｵﾄﾌｹﾁｮｳ');
INSERT INTO `tb_division` VALUES (501, '016322', '北海道', '士幌町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾎﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (502, '016331', '北海道', '上士幌町', 'ﾎｯｶｲﾄﾞｳ', 'ｶﾐｼﾎﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (503, '016349', '北海道', '鹿追町', 'ﾎｯｶｲﾄﾞｳ', 'ｼｶｵｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (504, '016357', '北海道', '新得町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾝﾄｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (505, '016365', '北海道', '清水町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾐｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (506, '016373', '北海道', '芽室町', 'ﾎｯｶｲﾄﾞｳ', 'ﾒﾑﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (507, '016381', '北海道', '中札内村', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶｻﾂﾅｲﾑﾗ');
INSERT INTO `tb_division` VALUES (508, '016390', '北海道', '更別村', 'ﾎｯｶｲﾄﾞｳ', 'ｻﾗﾍﾞﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (509, '016411', '北海道', '大樹町', 'ﾎｯｶｲﾄﾞｳ', 'ﾀｲｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (510, '016420', '北海道', '広尾町', 'ﾎｯｶｲﾄﾞｳ', 'ﾋﾛｵﾁｮｳ');
INSERT INTO `tb_division` VALUES (511, '016438', '北海道', '幕別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾏｸﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (512, '016446', '北海道', '池田町', 'ﾎｯｶｲﾄﾞｳ', 'ｲｹﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (513, '016454', '北海道', '豊頃町', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾖｺﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (514, '016462', '北海道', '本別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾎﾝﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (515, '016471', '北海道', '足寄町', 'ﾎｯｶｲﾄﾞｳ', 'ｱｼｮﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (516, '016489', '北海道', '陸別町', 'ﾎｯｶｲﾄﾞｳ', 'ﾘｸﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (517, '016497', '北海道', '浦幌町', 'ﾎｯｶｲﾄﾞｳ', 'ｳﾗﾎﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (518, '016616', '北海道', '釧路町', 'ﾎｯｶｲﾄﾞｳ', 'ｸｼﾛﾁｮｳ');
INSERT INTO `tb_division` VALUES (519, '016624', '北海道', '厚岸町', 'ﾎｯｶｲﾄﾞｳ', 'ｱｯｹｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (520, '016632', '北海道', '浜中町', 'ﾎｯｶｲﾄﾞｳ', 'ﾊﾏﾅｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (521, '016641', '北海道', '標茶町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾍﾞﾁｬﾁｮｳ');
INSERT INTO `tb_division` VALUES (522, '016659', '北海道', '弟子屈町', 'ﾎｯｶｲﾄﾞｳ', 'ﾃｼｶｶﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (523, '016675', '北海道', '鶴居村', 'ﾎｯｶｲﾄﾞｳ', 'ﾂﾙｲﾑﾗ');
INSERT INTO `tb_division` VALUES (524, '016683', '北海道', '白糠町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾗﾇｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (525, '016918', '北海道', '別海町', 'ﾎｯｶｲﾄﾞｳ', 'ﾍﾞﾂｶｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (526, '016926', '北海道', '中標津町', 'ﾎｯｶｲﾄﾞｳ', 'ﾅｶｼﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (527, '016934', '北海道', '標津町', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾍﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (528, '016942', '北海道', '羅臼町', 'ﾎｯｶｲﾄﾞｳ', 'ﾗｳｽﾁｮｳ');
INSERT INTO `tb_division` VALUES (529, '016951', '北海道', '色丹村', 'ﾎｯｶｲﾄﾞｳ', 'ｼｺﾀﾝﾑﾗ');
INSERT INTO `tb_division` VALUES (530, '016969', '北海道', '泊村', 'ﾎｯｶｲﾄﾞｳ', 'ﾄﾏﾘﾑﾗ');
INSERT INTO `tb_division` VALUES (531, '016977', '北海道', '留夜別村', 'ﾎｯｶｲﾄﾞｳ', 'ﾙﾔﾍﾞﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (532, '016985', '北海道', '留別村', 'ﾎｯｶｲﾄﾞｳ', 'ﾙﾍﾞﾂﾑﾗ');
INSERT INTO `tb_division` VALUES (533, '016993', '北海道', '紗那村', 'ﾎｯｶｲﾄﾞｳ', 'ｼｬﾅﾑﾗ');
INSERT INTO `tb_division` VALUES (534, '017001', '北海道', '蘂取村', 'ﾎｯｶｲﾄﾞｳ', 'ｼﾍﾞﾄﾛﾑﾗ');
INSERT INTO `tb_division` VALUES (535, '020001', '青森県', NULL, 'ｱｵﾓﾘｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (536, '022012', '青森県', '青森市', 'ｱｵﾓﾘｹﾝ', 'ｱｵﾓﾘｼ');
INSERT INTO `tb_division` VALUES (537, '022021', '青森県', '弘前市', 'ｱｵﾓﾘｹﾝ', 'ﾋﾛｻｷｼ');
INSERT INTO `tb_division` VALUES (538, '022039', '青森県', '八戸市', 'ｱｵﾓﾘｹﾝ', 'ﾊﾁﾉﾍｼ');
INSERT INTO `tb_division` VALUES (539, '022047', '青森県', '黒石市', 'ｱｵﾓﾘｹﾝ', 'ｸﾛｲｼｼ');
INSERT INTO `tb_division` VALUES (540, '022055', '青森県', '五所川原市', 'ｱｵﾓﾘｹﾝ', 'ｺﾞｼｮｶﾞﾜﾗｼ');
INSERT INTO `tb_division` VALUES (541, '022063', '青森県', '十和田市', 'ｱｵﾓﾘｹﾝ', 'ﾄﾜﾀﾞｼ');
INSERT INTO `tb_division` VALUES (542, '022071', '青森県', '三沢市', 'ｱｵﾓﾘｹﾝ', 'ﾐｻﾜｼ');
INSERT INTO `tb_division` VALUES (543, '022080', '青森県', 'むつ市', 'ｱｵﾓﾘｹﾝ', 'ﾑﾂｼ');
INSERT INTO `tb_division` VALUES (544, '022098', '青森県', 'つがる市', 'ｱｵﾓﾘｹﾝ', 'ﾂｶﾞﾙｼ');
INSERT INTO `tb_division` VALUES (545, '022101', '青森県', '平川市', 'ｱｵﾓﾘｹﾝ', 'ﾋﾗｶﾜｼ');
INSERT INTO `tb_division` VALUES (546, '023019', '青森県', '平内町', 'ｱｵﾓﾘｹﾝ', 'ﾋﾗﾅｲﾏﾁ');
INSERT INTO `tb_division` VALUES (547, '023035', '青森県', '今別町', 'ｱｵﾓﾘｹﾝ', 'ｲﾏﾍﾞﾂﾏﾁ');
INSERT INTO `tb_division` VALUES (548, '023043', '青森県', '蓬田村', 'ｱｵﾓﾘｹﾝ', 'ﾖﾓｷﾞﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (549, '023078', '青森県', '外ヶ浜町', 'ｱｵﾓﾘｹﾝ', 'ｿﾄｶﾞﾊﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (550, '023213', '青森県', '鰺ヶ沢町', 'ｱｵﾓﾘｹﾝ', 'ｱｼﾞｶﾞｻﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (551, '023230', '青森県', '深浦町', 'ｱｵﾓﾘｹﾝ', 'ﾌｶｳﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (552, '023434', '青森県', '西目屋村', 'ｱｵﾓﾘｹﾝ', 'ﾆｼﾒﾔﾑﾗ');
INSERT INTO `tb_division` VALUES (553, '023612', '青森県', '藤崎町', 'ｱｵﾓﾘｹﾝ', 'ﾌｼﾞｻｷﾏﾁ');
INSERT INTO `tb_division` VALUES (554, '023621', '青森県', '大鰐町', 'ｱｵﾓﾘｹﾝ', 'ｵｵﾜﾆﾏﾁ');
INSERT INTO `tb_division` VALUES (555, '023671', '青森県', '田舎館村', 'ｱｵﾓﾘｹﾝ', 'ｲﾅｶﾀﾞﾃﾑﾗ');
INSERT INTO `tb_division` VALUES (556, '023817', '青森県', '板柳町', 'ｱｵﾓﾘｹﾝ', 'ｲﾀﾔﾅｷﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (557, '023841', '青森県', '鶴田町', 'ｱｵﾓﾘｹﾝ', 'ﾂﾙﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (558, '023876', '青森県', '中泊町', 'ｱｵﾓﾘｹﾝ', 'ﾅｶﾄﾞﾏﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (559, '024015', '青森県', '野辺地町', 'ｱｵﾓﾘｹﾝ', 'ﾉﾍｼﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (560, '024023', '青森県', '七戸町', 'ｱｵﾓﾘｹﾝ', 'ｼﾁﾉﾍﾏﾁ');
INSERT INTO `tb_division` VALUES (561, '024058', '青森県', '六戸町', 'ｱｵﾓﾘｹﾝ', 'ﾛｸﾉﾍﾏﾁ');
INSERT INTO `tb_division` VALUES (562, '024066', '青森県', '横浜町', 'ｱｵﾓﾘｹﾝ', 'ﾖｺﾊﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (563, '024082', '青森県', '東北町', 'ｱｵﾓﾘｹﾝ', 'ﾄｳﾎｸﾏﾁ');
INSERT INTO `tb_division` VALUES (564, '024112', '青森県', '六ヶ所村', 'ｱｵﾓﾘｹﾝ', 'ﾛｯｶｼｮﾑﾗ');
INSERT INTO `tb_division` VALUES (565, '024121', '青森県', 'おいらせ町', 'ｱｵﾓﾘｹﾝ', 'ｵｲﾗｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (566, '024236', '青森県', '大間町', 'ｱｵﾓﾘｹﾝ', 'ｵｵﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (567, '024244', '青森県', '東通村', 'ｱｵﾓﾘｹﾝ', 'ﾋｶﾞｼﾄﾞｵﾘﾑﾗ');
INSERT INTO `tb_division` VALUES (568, '024252', '青森県', '風間浦村', 'ｱｵﾓﾘｹﾝ', 'ｶｻﾞﾏｳﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (569, '024261', '青森県', '佐井村', 'ｱｵﾓﾘｹﾝ', 'ｻｲﾑﾗ');
INSERT INTO `tb_division` VALUES (570, '024414', '青森県', '三戸町', 'ｱｵﾓﾘｹﾝ', 'ｻﾝﾉﾍﾏﾁ');
INSERT INTO `tb_division` VALUES (571, '024422', '青森県', '五戸町', 'ｱｵﾓﾘｹﾝ', 'ｺﾞﾉﾍﾏﾁ');
INSERT INTO `tb_division` VALUES (572, '024431', '青森県', '田子町', 'ｱｵﾓﾘｹﾝ', 'ﾀｯｺﾏﾁ');
INSERT INTO `tb_division` VALUES (573, '024457', '青森県', '南部町', 'ｱｵﾓﾘｹﾝ', 'ﾅﾝﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (574, '024465', '青森県', '階上町', 'ｱｵﾓﾘｹﾝ', 'ﾊｼｶﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (575, '024503', '青森県', '新郷村', 'ｱｵﾓﾘｹﾝ', 'ｼﾝｺﾞｳﾑﾗ');
INSERT INTO `tb_division` VALUES (576, '030007', '岩手県', NULL, 'ｲﾜﾃｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (577, '032018', '岩手県', '盛岡市', 'ｲﾜﾃｹﾝ', 'ﾓﾘｵｶｼ');
INSERT INTO `tb_division` VALUES (578, '032026', '岩手県', '宮古市', 'ｲﾜﾃｹﾝ', 'ﾐﾔｺｼ');
INSERT INTO `tb_division` VALUES (579, '032034', '岩手県', '大船渡市', 'ｲﾜﾃｹﾝ', 'ｵｵﾌﾅﾄｼ');
INSERT INTO `tb_division` VALUES (580, '032051', '岩手県', '花巻市', 'ｲﾜﾃｹﾝ', 'ﾊﾅﾏｷｼ');
INSERT INTO `tb_division` VALUES (581, '032069', '岩手県', '北上市', 'ｲﾜﾃｹﾝ', 'ｷﾀｶﾐｼ');
INSERT INTO `tb_division` VALUES (582, '032077', '岩手県', '久慈市', 'ｲﾜﾃｹﾝ', 'ｸｼﾞｼ');
INSERT INTO `tb_division` VALUES (583, '032085', '岩手県', '遠野市', 'ｲﾜﾃｹﾝ', 'ﾄｵﾉｼ');
INSERT INTO `tb_division` VALUES (584, '032093', '岩手県', '一関市', 'ｲﾜﾃｹﾝ', 'ｲﾁﾉｾｷｼ');
INSERT INTO `tb_division` VALUES (585, '032107', '岩手県', '陸前高田市', 'ｲﾜﾃｹﾝ', 'ﾘｸｾﾞﾝﾀｶﾀｼ');
INSERT INTO `tb_division` VALUES (586, '032115', '岩手県', '釜石市', 'ｲﾜﾃｹﾝ', 'ｶﾏｲｼｼ');
INSERT INTO `tb_division` VALUES (587, '032131', '岩手県', '二戸市', 'ｲﾜﾃｹﾝ', 'ﾆﾉﾍｼ');
INSERT INTO `tb_division` VALUES (588, '032140', '岩手県', '八幡平市', 'ｲﾜﾃｹﾝ', 'ﾊﾁﾏﾝﾀｲｼ');
INSERT INTO `tb_division` VALUES (589, '032158', '岩手県', '奥州市', 'ｲﾜﾃｹﾝ', 'ｵｳｼｭｳｼ');
INSERT INTO `tb_division` VALUES (590, '032166', '岩手県', '滝沢市', 'ｲﾜﾃｹﾝ', 'ﾀｷｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (591, '033014', '岩手県', '雫石町', 'ｲﾜﾃｹﾝ', 'ｼｽﾞｸｲｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (592, '033022', '岩手県', '葛巻町', 'ｲﾜﾃｹﾝ', 'ｸｽﾞﾏｷﾏﾁ');
INSERT INTO `tb_division` VALUES (593, '033031', '岩手県', '岩手町', 'ｲﾜﾃｹﾝ', 'ｲﾜﾃﾏﾁ');
INSERT INTO `tb_division` VALUES (594, '033219', '岩手県', '紫波町', 'ｲﾜﾃｹﾝ', 'ｼﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (595, '033227', '岩手県', '矢巾町', 'ｲﾜﾃｹﾝ', 'ﾔﾊﾊﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (596, '033669', '岩手県', '西和賀町', 'ｲﾜﾃｹﾝ', 'ﾆｼﾜｶﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (597, '033812', '岩手県', '金ケ崎町', 'ｲﾜﾃｹﾝ', 'ｶﾈｶﾞｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (598, '034029', '岩手県', '平泉町', 'ｲﾜﾃｹﾝ', 'ﾋﾗｲｽﾞﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (599, '034410', '岩手県', '住田町', 'ｲﾜﾃｹﾝ', 'ｽﾐﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (600, '034614', '岩手県', '大槌町', 'ｲﾜﾃｹﾝ', 'ｵｵﾂﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (601, '034827', '岩手県', '山田町', 'ｲﾜﾃｹﾝ', 'ﾔﾏﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (602, '034835', '岩手県', '岩泉町', 'ｲﾜﾃｹﾝ', 'ｲﾜｲｽﾞﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (603, '034843', '岩手県', '田野畑村', 'ｲﾜﾃｹﾝ', 'ﾀﾉﾊﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (604, '034851', '岩手県', '普代村', 'ｲﾜﾃｹﾝ', 'ﾌﾀﾞｲﾑﾗ');
INSERT INTO `tb_division` VALUES (605, '035017', '岩手県', '軽米町', 'ｲﾜﾃｹﾝ', 'ｶﾙﾏｲﾏﾁ');
INSERT INTO `tb_division` VALUES (606, '035033', '岩手県', '野田村', 'ｲﾜﾃｹﾝ', 'ﾉﾀﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (607, '035068', '岩手県', '九戸村', 'ｲﾜﾃｹﾝ', 'ｸﾉﾍﾑﾗ');
INSERT INTO `tb_division` VALUES (608, '035076', '岩手県', '洋野町', 'ｲﾜﾃｹﾝ', 'ﾋﾛﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (609, '035246', '岩手県', '一戸町', 'ｲﾜﾃｹﾝ', 'ｲﾁﾉﾍﾏﾁ');
INSERT INTO `tb_division` VALUES (610, '040002', '宮城県', NULL, 'ﾐﾔｷﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (611, '041009', '宮城県', '仙台市', 'ﾐﾔｷﾞｹﾝ', 'ｾﾝﾀﾞｲｼ');
INSERT INTO `tb_division` VALUES (612, '042021', '宮城県', '石巻市', 'ﾐﾔｷﾞｹﾝ', 'ｲｼﾉﾏｷｼ');
INSERT INTO `tb_division` VALUES (613, '042030', '宮城県', '塩竈市', 'ﾐﾔｷﾞｹﾝ', 'ｼｵｶﾞﾏｼ');
INSERT INTO `tb_division` VALUES (614, '042056', '宮城県', '気仙沼市', 'ﾐﾔｷﾞｹﾝ', 'ｹｾﾝﾇﾏｼ');
INSERT INTO `tb_division` VALUES (615, '042064', '宮城県', '白石市', 'ﾐﾔｷﾞｹﾝ', 'ｼﾛｲｼｼ');
INSERT INTO `tb_division` VALUES (616, '042072', '宮城県', '名取市', 'ﾐﾔｷﾞｹﾝ', 'ﾅﾄﾘｼ');
INSERT INTO `tb_division` VALUES (617, '042081', '宮城県', '角田市', 'ﾐﾔｷﾞｹﾝ', 'ｶｸﾀﾞｼ');
INSERT INTO `tb_division` VALUES (618, '042099', '宮城県', '多賀城市', 'ﾐﾔｷﾞｹﾝ', 'ﾀｶﾞｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (619, '042111', '宮城県', '岩沼市', 'ﾐﾔｷﾞｹﾝ', 'ｲﾜﾇﾏｼ');
INSERT INTO `tb_division` VALUES (620, '042129', '宮城県', '登米市', 'ﾐﾔｷﾞｹﾝ', 'ﾄﾒｼ');
INSERT INTO `tb_division` VALUES (621, '042137', '宮城県', '栗原市', 'ﾐﾔｷﾞｹﾝ', 'ｸﾘﾊﾗｼ');
INSERT INTO `tb_division` VALUES (622, '042145', '宮城県', '東松島市', 'ﾐﾔｷﾞｹﾝ', 'ﾋｶﾞｼﾏﾂｼﾏｼ');
INSERT INTO `tb_division` VALUES (623, '042153', '宮城県', '大崎市', 'ﾐﾔｷﾞｹﾝ', 'ｵｵｻｷｼ');
INSERT INTO `tb_division` VALUES (624, '042161', '宮城県', '富谷市', 'ﾐﾔｷﾞｹﾝ', 'ﾄﾐﾔｼ');
INSERT INTO `tb_division` VALUES (625, '043010', '宮城県', '蔵王町', 'ﾐﾔｷﾞｹﾝ', 'ｻﾞｵｳﾏﾁ');
INSERT INTO `tb_division` VALUES (626, '043028', '宮城県', '七ヶ宿町', 'ﾐﾔｷﾞｹﾝ', 'ｼﾁｶｼｭｸﾏﾁ');
INSERT INTO `tb_division` VALUES (627, '043214', '宮城県', '大河原町', 'ﾐﾔｷﾞｹﾝ', 'ｵｵｶﾞﾜﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (628, '043222', '宮城県', '村田町', 'ﾐﾔｷﾞｹﾝ', 'ﾑﾗﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (629, '043231', '宮城県', '柴田町', 'ﾐﾔｷﾞｹﾝ', 'ｼﾊﾞﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (630, '043249', '宮城県', '川崎町', 'ﾐﾔｷﾞｹﾝ', 'ｶﾜｻｷﾏﾁ');
INSERT INTO `tb_division` VALUES (631, '043419', '宮城県', '丸森町', 'ﾐﾔｷﾞｹﾝ', 'ﾏﾙﾓﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (632, '043613', '宮城県', '亘理町', 'ﾐﾔｷﾞｹﾝ', 'ﾜﾀﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (633, '043621', '宮城県', '山元町', 'ﾐﾔｷﾞｹﾝ', 'ﾔﾏﾓﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (634, '044016', '宮城県', '松島町', 'ﾐﾔｷﾞｹﾝ', 'ﾏﾂｼﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (635, '044041', '宮城県', '七ヶ浜町', 'ﾐﾔｷﾞｹﾝ', 'ｼﾁｶﾞﾊﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (636, '044067', '宮城県', '利府町', 'ﾐﾔｷﾞｹﾝ', 'ﾘﾌﾁｮｳ');
INSERT INTO `tb_division` VALUES (637, '044211', '宮城県', '大和町', 'ﾐﾔｷﾞｹﾝ', 'ﾀｲﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (638, '044229', '宮城県', '大郷町', 'ﾐﾔｷﾞｹﾝ', 'ｵｵｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (639, '044245', '宮城県', '大衡村', 'ﾐﾔｷﾞｹﾝ', 'ｵｵﾋﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (640, '044440', '宮城県', '色麻町', 'ﾐﾔｷﾞｹﾝ', 'ｼｶﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (641, '044458', '宮城県', '加美町', 'ﾐﾔｷﾞｹﾝ', 'ｶﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (642, '045012', '宮城県', '涌谷町', 'ﾐﾔｷﾞｹﾝ', 'ﾜｸﾔﾁｮｳ');
INSERT INTO `tb_division` VALUES (643, '045055', '宮城県', '美里町', 'ﾐﾔｷﾞｹﾝ', 'ﾐｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (644, '045811', '宮城県', '女川町', 'ﾐﾔｷﾞｹﾝ', 'ｵﾅｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (645, '046060', '宮城県', '南三陸町', 'ﾐﾔｷﾞｹﾝ', 'ﾐﾅﾐｻﾝﾘｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (646, '050008', '秋田県', NULL, 'ｱｷﾀｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (647, '052019', '秋田県', '秋田市', 'ｱｷﾀｹﾝ', 'ｱｷﾀｼ');
INSERT INTO `tb_division` VALUES (648, '052027', '秋田県', '能代市', 'ｱｷﾀｹﾝ', 'ﾉｼﾛｼ');
INSERT INTO `tb_division` VALUES (649, '052035', '秋田県', '横手市', 'ｱｷﾀｹﾝ', 'ﾖｺﾃｼ');
INSERT INTO `tb_division` VALUES (650, '052043', '秋田県', '大館市', 'ｱｷﾀｹﾝ', 'ｵｵﾀﾞﾃｼ');
INSERT INTO `tb_division` VALUES (651, '052060', '秋田県', '男鹿市', 'ｱｷﾀｹﾝ', 'ｵｶﾞｼ');
INSERT INTO `tb_division` VALUES (652, '052078', '秋田県', '湯沢市', 'ｱｷﾀｹﾝ', 'ﾕｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (653, '052094', '秋田県', '鹿角市', 'ｱｷﾀｹﾝ', 'ｶﾂﾞﾉｼ');
INSERT INTO `tb_division` VALUES (654, '052108', '秋田県', '由利本荘市', 'ｱｷﾀｹﾝ', 'ﾕﾘﾎﾝｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (655, '052116', '秋田県', '潟上市', 'ｱｷﾀｹﾝ', 'ｶﾀｶﾞﾐｼ');
INSERT INTO `tb_division` VALUES (656, '052124', '秋田県', '大仙市', 'ｱｷﾀｹﾝ', 'ﾀﾞｲｾﾝｼ');
INSERT INTO `tb_division` VALUES (657, '052132', '秋田県', '北秋田市', 'ｱｷﾀｹﾝ', 'ｷﾀｱｷﾀｼ');
INSERT INTO `tb_division` VALUES (658, '052141', '秋田県', 'にかほ市', 'ｱｷﾀｹﾝ', 'ﾆｶﾎｼ');
INSERT INTO `tb_division` VALUES (659, '052159', '秋田県', '仙北市', 'ｱｷﾀｹﾝ', 'ｾﾝﾎﾞｸｼ');
INSERT INTO `tb_division` VALUES (660, '053031', '秋田県', '小坂町', 'ｱｷﾀｹﾝ', 'ｺｻｶﾏﾁ');
INSERT INTO `tb_division` VALUES (661, '053279', '秋田県', '上小阿仁村', 'ｱｷﾀｹﾝ', 'ｶﾐｺｱﾆﾑﾗ');
INSERT INTO `tb_division` VALUES (662, '053465', '秋田県', '藤里町', 'ｱｷﾀｹﾝ', 'ﾌｼﾞｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (663, '053481', '秋田県', '三種町', 'ｱｷﾀｹﾝ', 'ﾐﾀﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (664, '053490', '秋田県', '八峰町', 'ｱｷﾀｹﾝ', 'ﾊｯﾎﾟｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (665, '053619', '秋田県', '五城目町', 'ｱｷﾀｹﾝ', 'ｺﾞｼﾞｮｳﾒﾏﾁ');
INSERT INTO `tb_division` VALUES (666, '053635', '秋田県', '八郎潟町', 'ｱｷﾀｹﾝ', 'ﾊﾁﾛｳｶﾞﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (667, '053660', '秋田県', '井川町', 'ｱｷﾀｹﾝ', 'ｲｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (668, '053686', '秋田県', '大潟村', 'ｱｷﾀｹﾝ', 'ｵｵｶﾞﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (669, '054348', '秋田県', '美郷町', 'ｱｷﾀｹﾝ', 'ﾐｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (670, '054631', '秋田県', '羽後町', 'ｱｷﾀｹﾝ', 'ｳｺﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (671, '054640', '秋田県', '東成瀬村', 'ｱｷﾀｹﾝ', 'ﾋｶﾞｼﾅﾙｾﾑﾗ');
INSERT INTO `tb_division` VALUES (672, '060003', '山形県', NULL, 'ﾔﾏｶﾞﾀｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (673, '062014', '山形県', '山形市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾔﾏｶﾞﾀｼ');
INSERT INTO `tb_division` VALUES (674, '062022', '山形県', '米沢市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾖﾈｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (675, '062031', '山形県', '鶴岡市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾂﾙｵｶｼ');
INSERT INTO `tb_division` VALUES (676, '062049', '山形県', '酒田市', 'ﾔﾏｶﾞﾀｹﾝ', 'ｻｶﾀｼ');
INSERT INTO `tb_division` VALUES (677, '062057', '山形県', '新庄市', 'ﾔﾏｶﾞﾀｹﾝ', 'ｼﾝｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (678, '062065', '山形県', '寒河江市', 'ﾔﾏｶﾞﾀｹﾝ', 'ｻｶﾞｴｼ');
INSERT INTO `tb_division` VALUES (679, '062073', '山形県', '上山市', 'ﾔﾏｶﾞﾀｹﾝ', 'ｶﾐﾉﾔﾏｼ');
INSERT INTO `tb_division` VALUES (680, '062081', '山形県', '村山市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾑﾗﾔﾏｼ');
INSERT INTO `tb_division` VALUES (681, '062090', '山形県', '長井市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾅｶﾞｲｼ');
INSERT INTO `tb_division` VALUES (682, '062103', '山形県', '天童市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾃﾝﾄﾞｳｼ');
INSERT INTO `tb_division` VALUES (683, '062111', '山形県', '東根市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾋｶﾞｼﾈｼ');
INSERT INTO `tb_division` VALUES (684, '062120', '山形県', '尾花沢市', 'ﾔﾏｶﾞﾀｹﾝ', 'ｵﾊﾞﾅｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (685, '062138', '山形県', '南陽市', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾅﾝﾖｳｼ');
INSERT INTO `tb_division` VALUES (686, '063011', '山形県', '山辺町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾔﾏﾉﾍﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (687, '063029', '山形県', '中山町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾅｶﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (688, '063215', '山形県', '河北町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｶﾎｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (689, '063223', '山形県', '西川町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾆｼｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (690, '063231', '山形県', '朝日町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｱｻﾋﾏﾁ');
INSERT INTO `tb_division` VALUES (691, '063240', '山形県', '大江町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｵｵｴﾏﾁ');
INSERT INTO `tb_division` VALUES (692, '063410', '山形県', '大石田町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｵｵｲｼﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (693, '063614', '山形県', '金山町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｶﾈﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (694, '063622', '山形県', '最上町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾓｶﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (695, '063631', '山形県', '舟形町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾌﾅｶﾞﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (696, '063649', '山形県', '真室川町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾏﾑﾛｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (697, '063657', '山形県', '大蔵村', 'ﾔﾏｶﾞﾀｹﾝ', 'ｵｵｸﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (698, '063665', '山形県', '鮭川村', 'ﾔﾏｶﾞﾀｹﾝ', 'ｻｹｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (699, '063673', '山形県', '戸沢村', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾄｻﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (700, '063819', '山形県', '高畠町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾀｶﾊﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (701, '063827', '山形県', '川西町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｶﾜﾆｼﾏﾁ');
INSERT INTO `tb_division` VALUES (702, '064017', '山形県', '小国町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｵｸﾞﾆﾏﾁ');
INSERT INTO `tb_division` VALUES (703, '064025', '山形県', '白鷹町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｼﾗﾀｶﾏﾁ');
INSERT INTO `tb_division` VALUES (704, '064033', '山形県', '飯豊町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｲｲﾃﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (705, '064262', '山形県', '三川町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾐｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (706, '064289', '山形県', '庄内町', 'ﾔﾏｶﾞﾀｹﾝ', 'ｼﾖｳﾅｲﾏﾁ');
INSERT INTO `tb_division` VALUES (707, '064611', '山形県', '遊佐町', 'ﾔﾏｶﾞﾀｹﾝ', 'ﾕｻﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (708, '070009', '福島県', NULL, 'ﾌｸｼﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (709, '072010', '福島県', '福島市', 'ﾌｸｼﾏｹﾝ', 'ﾌｸｼﾏｼ');
INSERT INTO `tb_division` VALUES (710, '072028', '福島県', '会津若松市', 'ﾌｸｼﾏｹﾝ', 'ｱｲﾂﾞﾜｶﾏﾂｼ');
INSERT INTO `tb_division` VALUES (711, '072036', '福島県', '郡山市', 'ﾌｸｼﾏｹﾝ', 'ｺｵﾘﾔﾏｼ');
INSERT INTO `tb_division` VALUES (712, '072044', '福島県', 'いわき市', 'ﾌｸｼﾏｹﾝ', 'ｲﾜｷｼ');
INSERT INTO `tb_division` VALUES (713, '072052', '福島県', '白河市', 'ﾌｸｼﾏｹﾝ', 'ｼﾗｶﾜｼ');
INSERT INTO `tb_division` VALUES (714, '072079', '福島県', '須賀川市', 'ﾌｸｼﾏｹﾝ', 'ｽｶｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (715, '072087', '福島県', '喜多方市', 'ﾌｸｼﾏｹﾝ', 'ｷﾀｶﾀｼ');
INSERT INTO `tb_division` VALUES (716, '072095', '福島県', '相馬市', 'ﾌｸｼﾏｹﾝ', 'ｿｳﾏｼ');
INSERT INTO `tb_division` VALUES (717, '072109', '福島県', '二本松市', 'ﾌｸｼﾏｹﾝ', 'ﾆﾎﾝﾏﾂｼ');
INSERT INTO `tb_division` VALUES (718, '072117', '福島県', '田村市', 'ﾌｸｼﾏｹﾝ', 'ﾀﾑﾗｼ');
INSERT INTO `tb_division` VALUES (719, '072125', '福島県', '南相馬市', 'ﾌｸｼﾏｹﾝ', 'ﾐﾅﾐｿｳﾏｼ');
INSERT INTO `tb_division` VALUES (720, '072133', '福島県', '伊達市', 'ﾌｸｼﾏｹﾝ', 'ﾀﾞﾃｼ');
INSERT INTO `tb_division` VALUES (721, '072141', '福島県', '本宮市', 'ﾌｸｼﾏｹﾝ', 'ﾓﾄﾐﾔｼ');
INSERT INTO `tb_division` VALUES (722, '073016', '福島県', '桑折町', 'ﾌｸｼﾏｹﾝ', 'ｺｵﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (723, '073032', '福島県', '国見町', 'ﾌｸｼﾏｹﾝ', 'ｸﾆﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (724, '073083', '福島県', '川俣町', 'ﾌｸｼﾏｹﾝ', 'ｶﾜﾏﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (725, '073229', '福島県', '大玉村', 'ﾌｸｼﾏｹﾝ', 'ｵｵﾀﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (726, '073423', '福島県', '鏡石町', 'ﾌｸｼﾏｹﾝ', 'ｶｶﾞﾐｲｼﾏﾁ');
INSERT INTO `tb_division` VALUES (727, '073440', '福島県', '天栄村', 'ﾌｸｼﾏｹﾝ', 'ﾃﾝｴｲﾑﾗ');
INSERT INTO `tb_division` VALUES (728, '073628', '福島県', '下郷町', 'ﾌｸｼﾏｹﾝ', 'ｼﾓｺﾞｳﾏﾁ');
INSERT INTO `tb_division` VALUES (729, '073644', '福島県', '檜枝岐村', 'ﾌｸｼﾏｹﾝ', 'ﾋﾉｴﾏﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (730, '073679', '福島県', '只見町', 'ﾌｸｼﾏｹﾝ', 'ﾀﾀﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (731, '073687', '福島県', '南会津町', 'ﾌｸｼﾏｹﾝ', 'ﾐﾅﾐｱｲﾂﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (732, '074021', '福島県', '北塩原村', 'ﾌｸｼﾏｹﾝ', 'ｷﾀｼｵﾊﾞﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (733, '074055', '福島県', '西会津町', 'ﾌｸｼﾏｹﾝ', 'ﾆｼｱｲﾂﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (734, '074071', '福島県', '磐梯町', 'ﾌｸｼﾏｹﾝ', 'ﾊﾞﾝﾀﾞｲﾏﾁ');
INSERT INTO `tb_division` VALUES (735, '074080', '福島県', '猪苗代町', 'ﾌｸｼﾏｹﾝ', 'ｲﾅﾜｼﾛﾏﾁ');
INSERT INTO `tb_division` VALUES (736, '074217', '福島県', '会津坂下町', 'ﾌｸｼﾏｹﾝ', 'ｱｲﾂﾞﾊﾞﾝｹﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (737, '074225', '福島県', '湯川村', 'ﾌｸｼﾏｹﾝ', 'ﾕｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (738, '074233', '福島県', '柳津町', 'ﾌｸｼﾏｹﾝ', 'ﾔﾅｲﾂﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (739, '074446', '福島県', '三島町', 'ﾌｸｼﾏｹﾝ', 'ﾐｼﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (740, '074454', '福島県', '金山町', 'ﾌｸｼﾏｹﾝ', 'ｶﾈﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (741, '074462', '福島県', '昭和村', 'ﾌｸｼﾏｹﾝ', 'ｼｮｳﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (742, '074471', '福島県', '会津美里町', 'ﾌｸｼﾏｹﾝ', 'ｱｲﾂﾞﾐｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (743, '074616', '福島県', '西郷村', 'ﾌｸｼﾏｹﾝ', 'ﾆｼｺﾞｳﾑﾗ');
INSERT INTO `tb_division` VALUES (744, '074641', '福島県', '泉崎村', 'ﾌｸｼﾏｹﾝ', 'ｲｽﾞﾐｻﾞｷﾑﾗ');
INSERT INTO `tb_division` VALUES (745, '074659', '福島県', '中島村', 'ﾌｸｼﾏｹﾝ', 'ﾅｶｼﾞﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (746, '074667', '福島県', '矢吹町', 'ﾌｸｼﾏｹﾝ', 'ﾔﾌﾞｷﾏﾁ');
INSERT INTO `tb_division` VALUES (747, '074811', '福島県', '棚倉町', 'ﾌｸｼﾏｹﾝ', 'ﾀﾅｸﾞﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (748, '074829', '福島県', '矢祭町', 'ﾌｸｼﾏｹﾝ', 'ﾔﾏﾂﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (749, '074837', '福島県', '塙町', 'ﾌｸｼﾏｹﾝ', 'ﾊﾅﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (750, '074845', '福島県', '鮫川村', 'ﾌｸｼﾏｹﾝ', 'ｻﾒｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (751, '075019', '福島県', '石川町', 'ﾌｸｼﾏｹﾝ', 'ｲｼｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (752, '075027', '福島県', '玉川村', 'ﾌｸｼﾏｹﾝ', 'ﾀﾏｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (753, '075035', '福島県', '平田村', 'ﾌｸｼﾏｹﾝ', 'ﾋﾗﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (754, '075043', '福島県', '浅川町', 'ﾌｸｼﾏｹﾝ', 'ｱｻｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (755, '075051', '福島県', '古殿町', 'ﾌｸｼﾏｹﾝ', 'ﾌﾙﾄﾞﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (756, '075213', '福島県', '三春町', 'ﾌｸｼﾏｹﾝ', 'ﾐﾊﾙﾏﾁ');
INSERT INTO `tb_division` VALUES (757, '075221', '福島県', '小野町', 'ﾌｸｼﾏｹﾝ', 'ｵﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (758, '075418', '福島県', '広野町', 'ﾌｸｼﾏｹﾝ', 'ﾋﾛﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (759, '075426', '福島県', '楢葉町', 'ﾌｸｼﾏｹﾝ', 'ﾅﾗﾊﾏﾁ');
INSERT INTO `tb_division` VALUES (760, '075434', '福島県', '富岡町', 'ﾌｸｼﾏｹﾝ', 'ﾄﾐｵｶﾏﾁ');
INSERT INTO `tb_division` VALUES (761, '075442', '福島県', '川内村', 'ﾌｸｼﾏｹﾝ', 'ｶﾜｳﾁﾑﾗ');
INSERT INTO `tb_division` VALUES (762, '075451', '福島県', '大熊町', 'ﾌｸｼﾏｹﾝ', 'ｵｵｸﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (763, '075469', '福島県', '双葉町', 'ﾌｸｼﾏｹﾝ', 'ﾌﾀﾊﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (764, '075477', '福島県', '浪江町', 'ﾌｸｼﾏｹﾝ', 'ﾅﾐｴﾏﾁ');
INSERT INTO `tb_division` VALUES (765, '075485', '福島県', '葛尾村', 'ﾌｸｼﾏｹﾝ', 'ｶﾂﾗｵﾑﾗ');
INSERT INTO `tb_division` VALUES (766, '075612', '福島県', '新地町', 'ﾌｸｼﾏｹﾝ', 'ｼﾝﾁﾏﾁ');
INSERT INTO `tb_division` VALUES (767, '075647', '福島県', '飯舘村', 'ﾌｸｼﾏｹﾝ', 'ｲｲﾀﾃﾑﾗ');
INSERT INTO `tb_division` VALUES (768, '080004', '茨城県', NULL, 'ｲﾊﾞﾗｷｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (769, '082015', '茨城県', '水戸市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾐﾄｼ');
INSERT INTO `tb_division` VALUES (770, '082023', '茨城県', '日立市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾋﾀﾁｼ');
INSERT INTO `tb_division` VALUES (771, '082031', '茨城県', '土浦市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾂﾁｳﾗｼ');
INSERT INTO `tb_division` VALUES (772, '082040', '茨城県', '古河市', 'ｲﾊﾞﾗｷｹﾝ', 'ｺｶﾞｼ');
INSERT INTO `tb_division` VALUES (773, '082058', '茨城県', '石岡市', 'ｲﾊﾞﾗｷｹﾝ', 'ｲｼｵｶｼ');
INSERT INTO `tb_division` VALUES (774, '082074', '茨城県', '結城市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾕｳｷｼ');
INSERT INTO `tb_division` VALUES (775, '082082', '茨城県', '龍ケ崎市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾘｭｳｶﾞｻｷｼ');
INSERT INTO `tb_division` VALUES (776, '082104', '茨城県', '下妻市', 'ｲﾊﾞﾗｷｹﾝ', 'ｼﾓﾂﾏｼ');
INSERT INTO `tb_division` VALUES (777, '082112', '茨城県', '常総市', 'ｲﾊﾞﾗｷｹﾝ', 'ｼﾞｮｳｿｳｼ');
INSERT INTO `tb_division` VALUES (778, '082121', '茨城県', '常陸太田市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾋﾀﾁｵｵﾀｼ');
INSERT INTO `tb_division` VALUES (779, '082147', '茨城県', '高萩市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾀｶﾊｷﾞｼ');
INSERT INTO `tb_division` VALUES (780, '082155', '茨城県', '北茨城市', 'ｲﾊﾞﾗｷｹﾝ', 'ｷﾀｲﾊﾞﾗｷｼ');
INSERT INTO `tb_division` VALUES (781, '082163', '茨城県', '笠間市', 'ｲﾊﾞﾗｷｹﾝ', 'ｶｻﾏｼ');
INSERT INTO `tb_division` VALUES (782, '082171', '茨城県', '取手市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾄﾘﾃﾞｼ');
INSERT INTO `tb_division` VALUES (783, '082198', '茨城県', '牛久市', 'ｲﾊﾞﾗｷｹﾝ', 'ｳｼｸｼ');
INSERT INTO `tb_division` VALUES (784, '082201', '茨城県', 'つくば市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾂｸﾊﾞｼ');
INSERT INTO `tb_division` VALUES (785, '082210', '茨城県', 'ひたちなか市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾋﾀﾁﾅｶｼ');
INSERT INTO `tb_division` VALUES (786, '082228', '茨城県', '鹿嶋市', 'ｲﾊﾞﾗｷｹﾝ', 'ｶｼﾏｼ');
INSERT INTO `tb_division` VALUES (787, '082236', '茨城県', '潮来市', 'ｲﾊﾞﾗｷｹﾝ', 'ｲﾀｺｼ');
INSERT INTO `tb_division` VALUES (788, '082244', '茨城県', '守谷市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾓﾘﾔｼ');
INSERT INTO `tb_division` VALUES (789, '082252', '茨城県', '常陸大宮市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾋﾀﾁｵｵﾐﾔｼ');
INSERT INTO `tb_division` VALUES (790, '082261', '茨城県', '那珂市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾅｶｼ');
INSERT INTO `tb_division` VALUES (791, '082279', '茨城県', '筑西市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾁｸｾｲｼ');
INSERT INTO `tb_division` VALUES (792, '082287', '茨城県', '坂東市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾊﾞﾝﾄﾞｳｼ');
INSERT INTO `tb_division` VALUES (793, '082295', '茨城県', '稲敷市', 'ｲﾊﾞﾗｷｹﾝ', 'ｲﾅｼｷｼ');
INSERT INTO `tb_division` VALUES (794, '082309', '茨城県', 'かすみがうら市', 'ｲﾊﾞﾗｷｹﾝ', 'ｶｽﾐｶﾞｳﾗｼ');
INSERT INTO `tb_division` VALUES (795, '082317', '茨城県', '桜川市', 'ｲﾊﾞﾗｷｹﾝ', 'ｻｸﾗｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (796, '082325', '茨城県', '神栖市', 'ｲﾊﾞﾗｷｹﾝ', 'ｶﾐｽｼ');
INSERT INTO `tb_division` VALUES (797, '082333', '茨城県', '行方市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾅﾒｶﾞﾀｼ');
INSERT INTO `tb_division` VALUES (798, '082341', '茨城県', '鉾田市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾎｺﾀｼ');
INSERT INTO `tb_division` VALUES (799, '082350', '茨城県', 'つくばみらい市', 'ｲﾊﾞﾗｷｹﾝ', 'ﾂｸﾊﾞﾐﾗｲｼ');
INSERT INTO `tb_division` VALUES (800, '082368', '茨城県', '小美玉市', 'ｲﾊﾞﾗｷｹﾝ', 'ｵﾐﾀﾏｼ');
INSERT INTO `tb_division` VALUES (801, '083020', '茨城県', '茨城町', 'ｲﾊﾞﾗｷｹﾝ', 'ｲﾊﾞﾗｷﾏﾁ');
INSERT INTO `tb_division` VALUES (802, '083097', '茨城県', '大洗町', 'ｲﾊﾞﾗｷｹﾝ', 'ｵｵｱﾗｲﾏﾁ');
INSERT INTO `tb_division` VALUES (803, '083101', '茨城県', '城里町', 'ｲﾊﾞﾗｷｹﾝ', 'ｼﾛｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (804, '083411', '茨城県', '東海村', 'ｲﾊﾞﾗｷｹﾝ', 'ﾄｳｶｲﾑﾗ');
INSERT INTO `tb_division` VALUES (805, '083640', '茨城県', '大子町', 'ｲﾊﾞﾗｷｹﾝ', 'ﾀﾞｲｺﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (806, '084425', '茨城県', '美浦村', 'ｲﾊﾞﾗｷｹﾝ', 'ﾐﾎﾑﾗ');
INSERT INTO `tb_division` VALUES (807, '084433', '茨城県', '阿見町', 'ｲﾊﾞﾗｷｹﾝ', 'ｱﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (808, '084476', '茨城県', '河内町', 'ｲﾊﾞﾗｷｹﾝ', 'ｶﾜﾁﾏﾁ');
INSERT INTO `tb_division` VALUES (809, '085219', '茨城県', '八千代町', 'ｲﾊﾞﾗｷｹﾝ', 'ﾔﾁﾖﾏﾁ');
INSERT INTO `tb_division` VALUES (810, '085421', '茨城県', '五霞町', 'ｲﾊﾞﾗｷｹﾝ', 'ｺﾞｶﾏﾁ');
INSERT INTO `tb_division` VALUES (811, '085464', '茨城県', '境町', 'ｲﾊﾞﾗｷｹﾝ', 'ｻｶｲﾏﾁ');
INSERT INTO `tb_division` VALUES (812, '085642', '茨城県', '利根町', 'ｲﾊﾞﾗｷｹﾝ', 'ﾄﾈﾏﾁ');
INSERT INTO `tb_division` VALUES (813, '090000', '栃木県', NULL, 'ﾄﾁｷﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (814, '092011', '栃木県', '宇都宮市', 'ﾄﾁｷﾞｹﾝ', 'ｳﾂﾉﾐﾔｼ');
INSERT INTO `tb_division` VALUES (815, '092029', '栃木県', '足利市', 'ﾄﾁｷﾞｹﾝ', 'ｱｼｶｶﾞｼ');
INSERT INTO `tb_division` VALUES (816, '092037', '栃木県', '栃木市', 'ﾄﾁｷﾞｹﾝ', 'ﾄﾁｷﾞｼ');
INSERT INTO `tb_division` VALUES (817, '092045', '栃木県', '佐野市', 'ﾄﾁｷﾞｹﾝ', 'ｻﾉｼ');
INSERT INTO `tb_division` VALUES (818, '092053', '栃木県', '鹿沼市', 'ﾄﾁｷﾞｹﾝ', 'ｶﾇﾏｼ');
INSERT INTO `tb_division` VALUES (819, '092061', '栃木県', '日光市', 'ﾄﾁｷﾞｹﾝ', 'ﾆｯｺｳｼ');
INSERT INTO `tb_division` VALUES (820, '092088', '栃木県', '小山市', 'ﾄﾁｷﾞｹﾝ', 'ｵﾔﾏｼ');
INSERT INTO `tb_division` VALUES (821, '092096', '栃木県', '真岡市', 'ﾄﾁｷﾞｹﾝ', 'ﾓｵｶｼ');
INSERT INTO `tb_division` VALUES (822, '092100', '栃木県', '大田原市', 'ﾄﾁｷﾞｹﾝ', 'ｵｵﾀﾜﾗｼ');
INSERT INTO `tb_division` VALUES (823, '092118', '栃木県', '矢板市', 'ﾄﾁｷﾞｹﾝ', 'ﾔｲﾀｼ');
INSERT INTO `tb_division` VALUES (824, '092134', '栃木県', '那須塩原市', 'ﾄﾁｷﾞｹﾝ', 'ﾅｽｼｵﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (825, '092142', '栃木県', 'さくら市', 'ﾄﾁｷﾞｹﾝ', 'ｻｸﾗｼ');
INSERT INTO `tb_division` VALUES (826, '092151', '栃木県', '那須烏山市', 'ﾄﾁｷﾞｹﾝ', 'ﾅｽｶﾗｽﾔﾏｼ');
INSERT INTO `tb_division` VALUES (827, '092169', '栃木県', '下野市', 'ﾄﾁｷﾞｹﾝ', 'ｼﾓﾂｹｼ');
INSERT INTO `tb_division` VALUES (828, '093017', '栃木県', '上三川町', 'ﾄﾁｷﾞｹﾝ', 'ｶﾐﾉｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (829, '093424', '栃木県', '益子町', 'ﾄﾁｷﾞｹﾝ', 'ﾏｼｺﾏﾁ');
INSERT INTO `tb_division` VALUES (830, '093432', '栃木県', '茂木町', 'ﾄﾁｷﾞｹﾝ', 'ﾓﾃｷﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (831, '093441', '栃木県', '市貝町', 'ﾄﾁｷﾞｹﾝ', 'ｲﾁｶｲﾏﾁ');
INSERT INTO `tb_division` VALUES (832, '093459', '栃木県', '芳賀町', 'ﾄﾁｷﾞｹﾝ', 'ﾊｶﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (833, '093611', '栃木県', '壬生町', 'ﾄﾁｷﾞｹﾝ', 'ﾐﾌﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (834, '093645', '栃木県', '野木町', 'ﾄﾁｷﾞｹﾝ', 'ﾉｷﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (835, '093840', '栃木県', '塩谷町', 'ﾄﾁｷﾞｹﾝ', 'ｼｵﾔﾏﾁ');
INSERT INTO `tb_division` VALUES (836, '093866', '栃木県', '高根沢町', 'ﾄﾁｷﾞｹﾝ', 'ﾀｶﾈｻﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (837, '094072', '栃木県', '那須町', 'ﾄﾁｷﾞｹﾝ', 'ﾅｽﾏﾁ');
INSERT INTO `tb_division` VALUES (838, '094111', '栃木県', '那珂川町', 'ﾄﾁｷﾞｹﾝ', 'ﾅｶｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (839, '100005', '群馬県', NULL, 'ｸﾞﾝﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (840, '102016', '群馬県', '前橋市', 'ｸﾞﾝﾏｹﾝ', 'ﾏｴﾊﾞｼｼ');
INSERT INTO `tb_division` VALUES (841, '102024', '群馬県', '高崎市', 'ｸﾞﾝﾏｹﾝ', 'ﾀｶｻｷｼ');
INSERT INTO `tb_division` VALUES (842, '102032', '群馬県', '桐生市', 'ｸﾞﾝﾏｹﾝ', 'ｷﾘｭｳｼ');
INSERT INTO `tb_division` VALUES (843, '102041', '群馬県', '伊勢崎市', 'ｸﾞﾝﾏｹﾝ', 'ｲｾｻｷｼ');
INSERT INTO `tb_division` VALUES (844, '102059', '群馬県', '太田市', 'ｸﾞﾝﾏｹﾝ', 'ｵｵﾀｼ');
INSERT INTO `tb_division` VALUES (845, '102067', '群馬県', '沼田市', 'ｸﾞﾝﾏｹﾝ', 'ﾇﾏﾀｼ');
INSERT INTO `tb_division` VALUES (846, '102075', '群馬県', '館林市', 'ｸﾞﾝﾏｹﾝ', 'ﾀﾃﾊﾞﾔｼｼ');
INSERT INTO `tb_division` VALUES (847, '102083', '群馬県', '渋川市', 'ｸﾞﾝﾏｹﾝ', 'ｼﾌﾞｶﾜｼ');
INSERT INTO `tb_division` VALUES (848, '102091', '群馬県', '藤岡市', 'ｸﾞﾝﾏｹﾝ', 'ﾌｼﾞｵｶｼ');
INSERT INTO `tb_division` VALUES (849, '102105', '群馬県', '富岡市', 'ｸﾞﾝﾏｹﾝ', 'ﾄﾐｵｶｼ');
INSERT INTO `tb_division` VALUES (850, '102113', '群馬県', '安中市', 'ｸﾞﾝﾏｹﾝ', 'ｱﾝﾅｶｼ');
INSERT INTO `tb_division` VALUES (851, '102121', '群馬県', 'みどり市', 'ｸﾞﾝﾏｹﾝ', 'ﾐﾄﾞﾘｼ');
INSERT INTO `tb_division` VALUES (852, '103446', '群馬県', '榛東村', 'ｸﾞﾝﾏｹﾝ', 'ｼﾝﾄｳﾑﾗ');
INSERT INTO `tb_division` VALUES (853, '103454', '群馬県', '吉岡町', 'ｸﾞﾝﾏｹﾝ', 'ﾖｼｵｶﾏﾁ');
INSERT INTO `tb_division` VALUES (854, '103667', '群馬県', '上野村', 'ｸﾞﾝﾏｹﾝ', 'ｳｴﾉﾑﾗ');
INSERT INTO `tb_division` VALUES (855, '103675', '群馬県', '神流町', 'ｸﾞﾝﾏｹﾝ', 'ｶﾝﾅﾏﾁ');
INSERT INTO `tb_division` VALUES (856, '103829', '群馬県', '下仁田町', 'ｸﾞﾝﾏｹﾝ', 'ｼﾓﾆﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (857, '103837', '群馬県', '南牧村', 'ｸﾞﾝﾏｹﾝ', 'ﾅﾝﾓｸﾑﾗ');
INSERT INTO `tb_division` VALUES (858, '103845', '群馬県', '甘楽町', 'ｸﾞﾝﾏｹﾝ', 'ｶﾝﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (859, '104213', '群馬県', '中之条町', 'ｸﾞﾝﾏｹﾝ', 'ﾅｶﾉｼﾞﾖｳﾏﾁ');
INSERT INTO `tb_division` VALUES (860, '104248', '群馬県', '長野原町', 'ｸﾞﾝﾏｹﾝ', 'ﾅｶﾞﾉﾊﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (861, '104256', '群馬県', '嬬恋村', 'ｸﾞﾝﾏｹﾝ', 'ﾂﾏｺﾞｲﾑﾗ');
INSERT INTO `tb_division` VALUES (862, '104264', '群馬県', '草津町', 'ｸﾞﾝﾏｹﾝ', 'ｸｻﾂﾏﾁ');
INSERT INTO `tb_division` VALUES (863, '104281', '群馬県', '高山村', 'ｸﾞﾝﾏｹﾝ', 'ﾀｶﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (864, '104299', '群馬県', '東吾妻町', 'ｸﾞﾝﾏｹﾝ', 'ﾋｶﾞｼｱｶﾞﾂﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (865, '104434', '群馬県', '片品村', 'ｸﾞﾝﾏｹﾝ', 'ｶﾀｼﾅﾑﾗ');
INSERT INTO `tb_division` VALUES (866, '104442', '群馬県', '川場村', 'ｸﾞﾝﾏｹﾝ', 'ｶﾜﾊﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (867, '104485', '群馬県', '昭和村', 'ｸﾞﾝﾏｹﾝ', 'ｼｮｳﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (868, '104493', '群馬県', 'みなかみ町', 'ｸﾞﾝﾏｹﾝ', 'ﾐﾅｶﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (869, '104647', '群馬県', '玉村町', 'ｸﾞﾝﾏｹﾝ', 'ﾀﾏﾑﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (870, '105210', '群馬県', '板倉町', 'ｸﾞﾝﾏｹﾝ', 'ｲﾀｸﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (871, '105228', '群馬県', '明和町', 'ｸﾞﾝﾏｹﾝ', 'ﾒｲﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (872, '105236', '群馬県', '千代田町', 'ｸﾞﾝﾏｹﾝ', 'ﾁﾖﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (873, '105244', '群馬県', '大泉町', 'ｸﾞﾝﾏｹﾝ', 'ｵｵｲｽﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (874, '105252', '群馬県', '邑楽町', 'ｸﾞﾝﾏｹﾝ', 'ｵｳﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (875, '110001', '埼玉県', NULL, 'ｻｲﾀﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (876, '111007', '埼玉県', 'さいたま市', 'ｻｲﾀﾏｹﾝ', 'ｻｲﾀﾏｼ');
INSERT INTO `tb_division` VALUES (877, '112011', '埼玉県', '川越市', 'ｻｲﾀﾏｹﾝ', 'ｶﾜｺﾞｴｼ');
INSERT INTO `tb_division` VALUES (878, '112020', '埼玉県', '熊谷市', 'ｻｲﾀﾏｹﾝ', 'ｸﾏｶﾞﾔｼ');
INSERT INTO `tb_division` VALUES (879, '112038', '埼玉県', '川口市', 'ｻｲﾀﾏｹﾝ', 'ｶﾜｸﾞﾁｼ');
INSERT INTO `tb_division` VALUES (880, '112062', '埼玉県', '行田市', 'ｻｲﾀﾏｹﾝ', 'ｷﾞﾖｳﾀﾞｼ');
INSERT INTO `tb_division` VALUES (881, '112071', '埼玉県', '秩父市', 'ｻｲﾀﾏｹﾝ', 'ﾁﾁﾌﾞｼ');
INSERT INTO `tb_division` VALUES (882, '112089', '埼玉県', '所沢市', 'ｻｲﾀﾏｹﾝ', 'ﾄｺﾛｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (883, '112097', '埼玉県', '飯能市', 'ｻｲﾀﾏｹﾝ', 'ﾊﾝﾉｳｼ');
INSERT INTO `tb_division` VALUES (884, '112101', '埼玉県', '加須市', 'ｻｲﾀﾏｹﾝ', 'ｶｿﾞｼ');
INSERT INTO `tb_division` VALUES (885, '112119', '埼玉県', '本庄市', 'ｻｲﾀﾏｹﾝ', 'ﾎﾝｼﾞﾖｳｼ');
INSERT INTO `tb_division` VALUES (886, '112127', '埼玉県', '東松山市', 'ｻｲﾀﾏｹﾝ', 'ﾋｶﾞｼﾏﾂﾔﾏｼ');
INSERT INTO `tb_division` VALUES (887, '112143', '埼玉県', '春日部市', 'ｻｲﾀﾏｹﾝ', 'ｶｽｶﾍﾞｼ');
INSERT INTO `tb_division` VALUES (888, '112151', '埼玉県', '狭山市', 'ｻｲﾀﾏｹﾝ', 'ｻﾔﾏｼ');
INSERT INTO `tb_division` VALUES (889, '112160', '埼玉県', '羽生市', 'ｻｲﾀﾏｹﾝ', 'ﾊﾆﾕｳｼ');
INSERT INTO `tb_division` VALUES (890, '112178', '埼玉県', '鴻巣市', 'ｻｲﾀﾏｹﾝ', 'ｺｳﾉｽｼ');
INSERT INTO `tb_division` VALUES (891, '112186', '埼玉県', '深谷市', 'ｻｲﾀﾏｹﾝ', 'ﾌｶﾔｼ');
INSERT INTO `tb_division` VALUES (892, '112194', '埼玉県', '上尾市', 'ｻｲﾀﾏｹﾝ', 'ｱｹﾞｵｼ');
INSERT INTO `tb_division` VALUES (893, '112216', '埼玉県', '草加市', 'ｻｲﾀﾏｹﾝ', 'ｿｳｶｼ');
INSERT INTO `tb_division` VALUES (894, '112224', '埼玉県', '越谷市', 'ｻｲﾀﾏｹﾝ', 'ｺｼｶﾞﾔｼ');
INSERT INTO `tb_division` VALUES (895, '112232', '埼玉県', '蕨市', 'ｻｲﾀﾏｹﾝ', 'ﾜﾗﾋﾞｼ');
INSERT INTO `tb_division` VALUES (896, '112241', '埼玉県', '戸田市', 'ｻｲﾀﾏｹﾝ', 'ﾄﾀﾞｼ');
INSERT INTO `tb_division` VALUES (897, '112259', '埼玉県', '入間市', 'ｻｲﾀﾏｹﾝ', 'ｲﾙﾏｼ');
INSERT INTO `tb_division` VALUES (898, '112275', '埼玉県', '朝霞市', 'ｻｲﾀﾏｹﾝ', 'ｱｻｶｼ');
INSERT INTO `tb_division` VALUES (899, '112283', '埼玉県', '志木市', 'ｻｲﾀﾏｹﾝ', 'ｼｷｼ');
INSERT INTO `tb_division` VALUES (900, '112291', '埼玉県', '和光市', 'ｻｲﾀﾏｹﾝ', 'ﾜｺｳｼ');
INSERT INTO `tb_division` VALUES (901, '112305', '埼玉県', '新座市', 'ｻｲﾀﾏｹﾝ', 'ﾆｲｻﾞｼ');
INSERT INTO `tb_division` VALUES (902, '112313', '埼玉県', '桶川市', 'ｻｲﾀﾏｹﾝ', 'ｵｹｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (903, '112321', '埼玉県', '久喜市', 'ｻｲﾀﾏｹﾝ', 'ｸｷｼ');
INSERT INTO `tb_division` VALUES (904, '112330', '埼玉県', '北本市', 'ｻｲﾀﾏｹﾝ', 'ｷﾀﾓﾄｼ');
INSERT INTO `tb_division` VALUES (905, '112348', '埼玉県', '八潮市', 'ｻｲﾀﾏｹﾝ', 'ﾔｼｵｼ');
INSERT INTO `tb_division` VALUES (906, '112356', '埼玉県', '富士見市', 'ｻｲﾀﾏｹﾝ', 'ﾌｼﾞﾐｼ');
INSERT INTO `tb_division` VALUES (907, '112372', '埼玉県', '三郷市', 'ｻｲﾀﾏｹﾝ', 'ﾐｻﾄｼ');
INSERT INTO `tb_division` VALUES (908, '112381', '埼玉県', '蓮田市', 'ｻｲﾀﾏｹﾝ', 'ﾊｽﾀﾞｼ');
INSERT INTO `tb_division` VALUES (909, '112399', '埼玉県', '坂戸市', 'ｻｲﾀﾏｹﾝ', 'ｻｶﾄﾞｼ');
INSERT INTO `tb_division` VALUES (910, '112402', '埼玉県', '幸手市', 'ｻｲﾀﾏｹﾝ', 'ｻｯﾃｼ');
INSERT INTO `tb_division` VALUES (911, '112411', '埼玉県', '鶴ヶ島市', 'ｻｲﾀﾏｹﾝ', 'ﾂﾙｶﾞｼﾏｼ');
INSERT INTO `tb_division` VALUES (912, '112429', '埼玉県', '日高市', 'ｻｲﾀﾏｹﾝ', 'ﾋﾀﾞｶｼ');
INSERT INTO `tb_division` VALUES (913, '112437', '埼玉県', '吉川市', 'ｻｲﾀﾏｹﾝ', 'ﾖｼｶﾜｼ');
INSERT INTO `tb_division` VALUES (914, '112453', '埼玉県', 'ふじみ野市', 'ｻｲﾀﾏｹﾝ', 'ﾌｼﾞﾐﾉｼ');
INSERT INTO `tb_division` VALUES (915, '112461', '埼玉県', '白岡市', 'ｻｲﾀﾏｹﾝ', 'ｼﾗｵｶｼ');
INSERT INTO `tb_division` VALUES (916, '113018', '埼玉県', '伊奈町', 'ｻｲﾀﾏｹﾝ', 'ｲﾅﾏﾁ');
INSERT INTO `tb_division` VALUES (917, '113247', '埼玉県', '三芳町', 'ｻｲﾀﾏｹﾝ', 'ﾐﾖｼﾏﾁ');
INSERT INTO `tb_division` VALUES (918, '113263', '埼玉県', '毛呂山町', 'ｻｲﾀﾏｹﾝ', 'ﾓﾛﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (919, '113271', '埼玉県', '越生町', 'ｻｲﾀﾏｹﾝ', 'ｵｺﾞｾﾏﾁ');
INSERT INTO `tb_division` VALUES (920, '113417', '埼玉県', '滑川町', 'ｻｲﾀﾏｹﾝ', 'ﾅﾒｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (921, '113425', '埼玉県', '嵐山町', 'ｻｲﾀﾏｹﾝ', 'ﾗﾝｻﾞﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (922, '113433', '埼玉県', '小川町', 'ｻｲﾀﾏｹﾝ', 'ｵｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (923, '113468', '埼玉県', '川島町', 'ｻｲﾀﾏｹﾝ', 'ｶﾜｼﾞﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (924, '113476', '埼玉県', '吉見町', 'ｻｲﾀﾏｹﾝ', 'ﾖｼﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (925, '113484', '埼玉県', '鳩山町', 'ｻｲﾀﾏｹﾝ', 'ﾊﾄﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (926, '113492', '埼玉県', 'ときがわ町', 'ｻｲﾀﾏｹﾝ', 'ﾄｷｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (927, '113611', '埼玉県', '横瀬町', 'ｻｲﾀﾏｹﾝ', 'ﾖｺｾﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (928, '113620', '埼玉県', '皆野町', 'ｻｲﾀﾏｹﾝ', 'ﾐﾅﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (929, '113638', '埼玉県', '長瀞町', 'ｻｲﾀﾏｹﾝ', 'ﾅｶﾞﾄﾛﾏﾁ');
INSERT INTO `tb_division` VALUES (930, '113654', '埼玉県', '小鹿野町', 'ｻｲﾀﾏｹﾝ', 'ｵｶﾞﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (931, '113697', '埼玉県', '東秩父村', 'ｻｲﾀﾏｹﾝ', 'ﾋｶﾞｼﾁﾁﾌﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (932, '113816', '埼玉県', '美里町', 'ｻｲﾀﾏｹﾝ', 'ﾐｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (933, '113832', '埼玉県', '神川町', 'ｻｲﾀﾏｹﾝ', 'ｶﾐｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (934, '113859', '埼玉県', '上里町', 'ｻｲﾀﾏｹﾝ', 'ｶﾐｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (935, '114081', '埼玉県', '寄居町', 'ｻｲﾀﾏｹﾝ', 'ﾖﾘｲﾏﾁ');
INSERT INTO `tb_division` VALUES (936, '114421', '埼玉県', '宮代町', 'ｻｲﾀﾏｹﾝ', 'ﾐﾔｼﾛﾏﾁ');
INSERT INTO `tb_division` VALUES (937, '114642', '埼玉県', '杉戸町', 'ｻｲﾀﾏｹﾝ', 'ｽｷﾞﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (938, '114651', '埼玉県', '松伏町', 'ｻｲﾀﾏｹﾝ', 'ﾏﾂﾌﾞｼﾏﾁ');
INSERT INTO `tb_division` VALUES (939, '120006', '千葉県', NULL, 'ﾁﾊﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (940, '121002', '千葉県', '千葉市', 'ﾁﾊﾞｹﾝ', 'ﾁﾊﾞｼ');
INSERT INTO `tb_division` VALUES (941, '122025', '千葉県', '銚子市', 'ﾁﾊﾞｹﾝ', 'ﾁｮｳｼｼ');
INSERT INTO `tb_division` VALUES (942, '122033', '千葉県', '市川市', 'ﾁﾊﾞｹﾝ', 'ｲﾁｶﾜｼ');
INSERT INTO `tb_division` VALUES (943, '122041', '千葉県', '船橋市', 'ﾁﾊﾞｹﾝ', 'ﾌﾅﾊﾞｼｼ');
INSERT INTO `tb_division` VALUES (944, '122050', '千葉県', '館山市', 'ﾁﾊﾞｹﾝ', 'ﾀﾃﾔﾏｼ');
INSERT INTO `tb_division` VALUES (945, '122068', '千葉県', '木更津市', 'ﾁﾊﾞｹﾝ', 'ｷｻﾗﾂﾞｼ');
INSERT INTO `tb_division` VALUES (946, '122076', '千葉県', '松戸市', 'ﾁﾊﾞｹﾝ', 'ﾏﾂﾄﾞｼ');
INSERT INTO `tb_division` VALUES (947, '122084', '千葉県', '野田市', 'ﾁﾊﾞｹﾝ', 'ﾉﾀﾞｼ');
INSERT INTO `tb_division` VALUES (948, '122106', '千葉県', '茂原市', 'ﾁﾊﾞｹﾝ', 'ﾓﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (949, '122114', '千葉県', '成田市', 'ﾁﾊﾞｹﾝ', 'ﾅﾘﾀｼ');
INSERT INTO `tb_division` VALUES (950, '122122', '千葉県', '佐倉市', 'ﾁﾊﾞｹﾝ', 'ｻｸﾗｼ');
INSERT INTO `tb_division` VALUES (951, '122131', '千葉県', '東金市', 'ﾁﾊﾞｹﾝ', 'ﾄｳｶﾞﾈｼ');
INSERT INTO `tb_division` VALUES (952, '122157', '千葉県', '旭市', 'ﾁﾊﾞｹﾝ', 'ｱｻﾋｼ');
INSERT INTO `tb_division` VALUES (953, '122165', '千葉県', '習志野市', 'ﾁﾊﾞｹﾝ', 'ﾅﾗｼﾉｼ');
INSERT INTO `tb_division` VALUES (954, '122173', '千葉県', '柏市', 'ﾁﾊﾞｹﾝ', 'ｶｼﾜｼ');
INSERT INTO `tb_division` VALUES (955, '122181', '千葉県', '勝浦市', 'ﾁﾊﾞｹﾝ', 'ｶﾂｳﾗｼ');
INSERT INTO `tb_division` VALUES (956, '122190', '千葉県', '市原市', 'ﾁﾊﾞｹﾝ', 'ｲﾁﾊﾗｼ');
INSERT INTO `tb_division` VALUES (957, '122203', '千葉県', '流山市', 'ﾁﾊﾞｹﾝ', 'ﾅｶﾞﾚﾔﾏｼ');
INSERT INTO `tb_division` VALUES (958, '122211', '千葉県', '八千代市', 'ﾁﾊﾞｹﾝ', 'ﾔﾁﾖｼ');
INSERT INTO `tb_division` VALUES (959, '122220', '千葉県', '我孫子市', 'ﾁﾊﾞｹﾝ', 'ｱﾋﾞｺｼ');
INSERT INTO `tb_division` VALUES (960, '122238', '千葉県', '鴨川市', 'ﾁﾊﾞｹﾝ', 'ｶﾓｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (961, '122246', '千葉県', '鎌ケ谷市', 'ﾁﾊﾞｹﾝ', 'ｶﾏｶﾞﾔｼ');
INSERT INTO `tb_division` VALUES (962, '122254', '千葉県', '君津市', 'ﾁﾊﾞｹﾝ', 'ｷﾐﾂｼ');
INSERT INTO `tb_division` VALUES (963, '122262', '千葉県', '富津市', 'ﾁﾊﾞｹﾝ', 'ﾌｯﾂｼ');
INSERT INTO `tb_division` VALUES (964, '122271', '千葉県', '浦安市', 'ﾁﾊﾞｹﾝ', 'ｳﾗﾔｽｼ');
INSERT INTO `tb_division` VALUES (965, '122289', '千葉県', '四街道市', 'ﾁﾊﾞｹﾝ', 'ﾖﾂｶｲﾄﾞｳｼ');
INSERT INTO `tb_division` VALUES (966, '122297', '千葉県', '袖ケ浦市', 'ﾁﾊﾞｹﾝ', 'ｿﾃﾞｶﾞｳﾗｼ');
INSERT INTO `tb_division` VALUES (967, '122301', '千葉県', '八街市', 'ﾁﾊﾞｹﾝ', 'ﾔﾁﾏﾀｼ');
INSERT INTO `tb_division` VALUES (968, '122319', '千葉県', '印西市', 'ﾁﾊﾞｹﾝ', 'ｲﾝｻﾞｲｼ');
INSERT INTO `tb_division` VALUES (969, '122327', '千葉県', '白井市', 'ﾁﾊﾞｹﾝ', 'ｼﾛｲｼ');
INSERT INTO `tb_division` VALUES (970, '122335', '千葉県', '富里市', 'ﾁﾊﾞｹﾝ', 'ﾄﾐｻﾄｼ');
INSERT INTO `tb_division` VALUES (971, '122343', '千葉県', '南房総市', 'ﾁﾊﾞｹﾝ', 'ﾐﾅﾐﾎﾞｳｿｳｼ');
INSERT INTO `tb_division` VALUES (972, '122351', '千葉県', '匝瑳市', 'ﾁﾊﾞｹﾝ', 'ｿｳｻｼ');
INSERT INTO `tb_division` VALUES (973, '122360', '千葉県', '香取市', 'ﾁﾊﾞｹﾝ', 'ｶﾄﾘｼ');
INSERT INTO `tb_division` VALUES (974, '122378', '千葉県', '山武市', 'ﾁﾊﾞｹﾝ', 'ｻﾝﾑｼ');
INSERT INTO `tb_division` VALUES (975, '122386', '千葉県', 'いすみ市', 'ﾁﾊﾞｹﾝ', 'ｲｽﾐｼ');
INSERT INTO `tb_division` VALUES (976, '122394', '千葉県', '大網白里市', 'ﾁﾊﾞｹﾝ', 'ｵｵｱﾐｼﾗｻﾄｼ');
INSERT INTO `tb_division` VALUES (977, '123226', '千葉県', '酒々井町', 'ﾁﾊﾞｹﾝ', 'ｼｽｲﾏﾁ');
INSERT INTO `tb_division` VALUES (978, '123293', '千葉県', '栄町', 'ﾁﾊﾞｹﾝ', 'ｻｶｴﾏﾁ');
INSERT INTO `tb_division` VALUES (979, '123421', '千葉県', '神崎町', 'ﾁﾊﾞｹﾝ', 'ｺｳｻﾞｷﾏﾁ');
INSERT INTO `tb_division` VALUES (980, '123471', '千葉県', '多古町', 'ﾁﾊﾞｹﾝ', 'ﾀｺﾏﾁ');
INSERT INTO `tb_division` VALUES (981, '123498', '千葉県', '東庄町', 'ﾁﾊﾞｹﾝ', 'ﾄｳﾉｼｮｳﾏﾁ');
INSERT INTO `tb_division` VALUES (982, '124036', '千葉県', '九十九里町', 'ﾁﾊﾞｹﾝ', 'ｸｼﾞﾕｳｸﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (983, '124095', '千葉県', '芝山町', 'ﾁﾊﾞｹﾝ', 'ｼﾊﾞﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (984, '124109', '千葉県', '横芝光町', 'ﾁﾊﾞｹﾝ', 'ﾖｺｼﾊﾞﾋｶﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (985, '124214', '千葉県', '一宮町', 'ﾁﾊﾞｹﾝ', 'ｲﾁﾉﾐﾔﾏﾁ');
INSERT INTO `tb_division` VALUES (986, '124222', '千葉県', '睦沢町', 'ﾁﾊﾞｹﾝ', 'ﾑﾂｻﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (987, '124231', '千葉県', '長生村', 'ﾁﾊﾞｹﾝ', 'ﾁｮｳｾｲﾑﾗ');
INSERT INTO `tb_division` VALUES (988, '124249', '千葉県', '白子町', 'ﾁﾊﾞｹﾝ', 'ｼﾗｺﾏﾁ');
INSERT INTO `tb_division` VALUES (989, '124265', '千葉県', '長柄町', 'ﾁﾊﾞｹﾝ', 'ﾅｶﾞﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (990, '124273', '千葉県', '長南町', 'ﾁﾊﾞｹﾝ', 'ﾁｮｳﾅﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (991, '124419', '千葉県', '大多喜町', 'ﾁﾊﾞｹﾝ', 'ｵｵﾀｷﾏﾁ');
INSERT INTO `tb_division` VALUES (992, '124435', '千葉県', '御宿町', 'ﾁﾊﾞｹﾝ', 'ｵﾝｼﾞﾕｸﾏﾁ');
INSERT INTO `tb_division` VALUES (993, '124630', '千葉県', '鋸南町', 'ﾁﾊﾞｹﾝ', 'ｷﾖﾅﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (994, '130001', '東京都', NULL, 'ﾄｳｷｮｳﾄ', NULL);
INSERT INTO `tb_division` VALUES (995, '131016', '東京都', '千代田区', 'ﾄｳｷｮｳﾄ', 'ﾁﾖﾀﾞｸ');
INSERT INTO `tb_division` VALUES (996, '131024', '東京都', '中央区', 'ﾄｳｷｮｳﾄ', 'ﾁｭｳｵｳｸ');
INSERT INTO `tb_division` VALUES (997, '131032', '東京都', '港区', 'ﾄｳｷｮｳﾄ', 'ﾐﾅﾄｸ');
INSERT INTO `tb_division` VALUES (998, '131041', '東京都', '新宿区', 'ﾄｳｷｮｳﾄ', 'ｼﾝｼﾞｭｸｸ');
INSERT INTO `tb_division` VALUES (999, '131059', '東京都', '文京区', 'ﾄｳｷｮｳﾄ', 'ﾌﾞﾝｷｮｳｸ');
INSERT INTO `tb_division` VALUES (1000, '131067', '東京都', '台東区', 'ﾄｳｷｮｳﾄ', 'ﾀｲﾄｳｸ');
INSERT INTO `tb_division` VALUES (1001, '131075', '東京都', '墨田区', 'ﾄｳｷｮｳﾄ', 'ｽﾐﾀﾞｸ');
INSERT INTO `tb_division` VALUES (1002, '131083', '東京都', '江東区', 'ﾄｳｷｮｳﾄ', 'ｺｳﾄｳｸ');
INSERT INTO `tb_division` VALUES (1003, '131091', '東京都', '品川区', 'ﾄｳｷｮｳﾄ', 'ｼﾅｶﾞﾜｸ');
INSERT INTO `tb_division` VALUES (1004, '131105', '東京都', '目黒区', 'ﾄｳｷｮｳﾄ', 'ﾒｸﾞﾛｸ');
INSERT INTO `tb_division` VALUES (1005, '131113', '東京都', '大田区', 'ﾄｳｷｮｳﾄ', 'ｵｵﾀｸ');
INSERT INTO `tb_division` VALUES (1006, '131121', '東京都', '世田谷区', 'ﾄｳｷｮｳﾄ', 'ｾﾀｶﾞﾔｸ');
INSERT INTO `tb_division` VALUES (1007, '131130', '東京都', '渋谷区', 'ﾄｳｷｮｳﾄ', 'ｼﾌﾞﾔｸ');
INSERT INTO `tb_division` VALUES (1008, '131148', '東京都', '中野区', 'ﾄｳｷｮｳﾄ', 'ﾅｶﾉｸ');
INSERT INTO `tb_division` VALUES (1009, '131156', '東京都', '杉並区', 'ﾄｳｷｮｳﾄ', 'ｽｷﾞﾅﾐｸ');
INSERT INTO `tb_division` VALUES (1010, '131164', '東京都', '豊島区', 'ﾄｳｷｮｳﾄ', 'ﾄｼﾏｸ');
INSERT INTO `tb_division` VALUES (1011, '131172', '東京都', '北区', 'ﾄｳｷｮｳﾄ', 'ｷﾀｸ');
INSERT INTO `tb_division` VALUES (1012, '131181', '東京都', '荒川区', 'ﾄｳｷｮｳﾄ', 'ｱﾗｶﾜｸ');
INSERT INTO `tb_division` VALUES (1013, '131199', '東京都', '板橋区', 'ﾄｳｷｮｳﾄ', 'ｲﾀﾊﾞｼｸ');
INSERT INTO `tb_division` VALUES (1014, '131202', '東京都', '練馬区', 'ﾄｳｷｮｳﾄ', 'ﾈﾘﾏｸ');
INSERT INTO `tb_division` VALUES (1015, '131211', '東京都', '足立区', 'ﾄｳｷｮｳﾄ', 'ｱﾀﾞﾁｸ');
INSERT INTO `tb_division` VALUES (1016, '131229', '東京都', '葛飾区', 'ﾄｳｷｮｳﾄ', 'ｶﾂｼｶｸ');
INSERT INTO `tb_division` VALUES (1017, '131237', '東京都', '江戸川区', 'ﾄｳｷｮｳﾄ', 'ｴﾄﾞｶﾞﾜｸ');
INSERT INTO `tb_division` VALUES (1018, '132012', '東京都', '八王子市', 'ﾄｳｷｮｳﾄ', 'ﾊﾁｵｳｼﾞｼ');
INSERT INTO `tb_division` VALUES (1019, '132021', '東京都', '立川市', 'ﾄｳｷｮｳﾄ', 'ﾀﾁｶﾜｼ');
INSERT INTO `tb_division` VALUES (1020, '132039', '東京都', '武蔵野市', 'ﾄｳｷｮｳﾄ', 'ﾑｻｼﾉｼ');
INSERT INTO `tb_division` VALUES (1021, '132047', '東京都', '三鷹市', 'ﾄｳｷｮｳﾄ', 'ﾐﾀｶｼ');
INSERT INTO `tb_division` VALUES (1022, '132055', '東京都', '青梅市', 'ﾄｳｷｮｳﾄ', 'ｵｳﾒｼ');
INSERT INTO `tb_division` VALUES (1023, '132063', '東京都', '府中市', 'ﾄｳｷｮｳﾄ', 'ﾌﾁｭｳｼ');
INSERT INTO `tb_division` VALUES (1024, '132071', '東京都', '昭島市', 'ﾄｳｷｮｳﾄ', 'ｱｷｼﾏｼ');
INSERT INTO `tb_division` VALUES (1025, '132080', '東京都', '調布市', 'ﾄｳｷｮｳﾄ', 'ﾁｮｳﾌｼ');
INSERT INTO `tb_division` VALUES (1026, '132098', '東京都', '町田市', 'ﾄｳｷｮｳﾄ', 'ﾏﾁﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1027, '132101', '東京都', '小金井市', 'ﾄｳｷｮｳﾄ', 'ｺｶﾞﾈｲｼ');
INSERT INTO `tb_division` VALUES (1028, '132110', '東京都', '小平市', 'ﾄｳｷｮｳﾄ', 'ｺﾀﾞｲﾗｼ');
INSERT INTO `tb_division` VALUES (1029, '132128', '東京都', '日野市', 'ﾄｳｷｮｳﾄ', 'ﾋﾉｼ');
INSERT INTO `tb_division` VALUES (1030, '132136', '東京都', '東村山市', 'ﾄｳｷｮｳﾄ', 'ﾋｶﾞｼﾑﾗﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1031, '132144', '東京都', '国分寺市', 'ﾄｳｷｮｳﾄ', 'ｺｸﾌﾞﾝｼﾞｼ');
INSERT INTO `tb_division` VALUES (1032, '132152', '東京都', '国立市', 'ﾄｳｷｮｳﾄ', 'ｸﾆﾀﾁｼ');
INSERT INTO `tb_division` VALUES (1033, '132187', '東京都', '福生市', 'ﾄｳｷｮｳﾄ', 'ﾌｯｻｼ');
INSERT INTO `tb_division` VALUES (1034, '132195', '東京都', '狛江市', 'ﾄｳｷｮｳﾄ', 'ｺﾏｴｼ');
INSERT INTO `tb_division` VALUES (1035, '132209', '東京都', '東大和市', 'ﾄｳｷｮｳﾄ', 'ﾋｶﾞｼﾔﾏﾄｼ');
INSERT INTO `tb_division` VALUES (1036, '132217', '東京都', '清瀬市', 'ﾄｳｷｮｳﾄ', 'ｷﾖｾｼ');
INSERT INTO `tb_division` VALUES (1037, '132225', '東京都', '東久留米市', 'ﾄｳｷｮｳﾄ', 'ﾋｶﾞｼｸﾙﾒｼ');
INSERT INTO `tb_division` VALUES (1038, '132233', '東京都', '武蔵村山市', 'ﾄｳｷｮｳﾄ', 'ﾑｻｼﾑﾗﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1039, '132241', '東京都', '多摩市', 'ﾄｳｷｮｳﾄ', 'ﾀﾏｼ');
INSERT INTO `tb_division` VALUES (1040, '132250', '東京都', '稲城市', 'ﾄｳｷｮｳﾄ', 'ｲﾅｷﾞｼ');
INSERT INTO `tb_division` VALUES (1041, '132276', '東京都', '羽村市', 'ﾄｳｷｮｳﾄ', 'ﾊﾑﾗｼ');
INSERT INTO `tb_division` VALUES (1042, '132284', '東京都', 'あきる野市', 'ﾄｳｷｮｳﾄ', 'ｱｷﾙﾉｼ');
INSERT INTO `tb_division` VALUES (1043, '132292', '東京都', '西東京市', 'ﾄｳｷｮｳﾄ', 'ﾆｼﾄｳｷｮｳｼ');
INSERT INTO `tb_division` VALUES (1044, '133035', '東京都', '瑞穂町', 'ﾄｳｷｮｳﾄ', 'ﾐｽﾞﾎﾏﾁ');
INSERT INTO `tb_division` VALUES (1045, '133051', '東京都', '日の出町', 'ﾄｳｷｮｳﾄ', 'ﾋﾉﾃﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1046, '133078', '東京都', '檜原村', 'ﾄｳｷｮｳﾄ', 'ﾋﾉﾊﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1047, '133086', '東京都', '奥多摩町', 'ﾄｳｷｮｳﾄ', 'ｵｸﾀﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1048, '133612', '東京都', '大島町', 'ﾄｳｷｮｳﾄ', 'ｵｵｼﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1049, '133621', '東京都', '利島村', 'ﾄｳｷｮｳﾄ', 'ﾄｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1050, '133639', '東京都', '新島村', 'ﾄｳｷｮｳﾄ', 'ﾆｲｼﾞﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1051, '133647', '東京都', '神津島村', 'ﾄｳｷｮｳﾄ', 'ｺｳﾂﾞｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1052, '133817', '東京都', '三宅村', 'ﾄｳｷｮｳﾄ', 'ﾐﾔｹﾑﾗ');
INSERT INTO `tb_division` VALUES (1053, '133825', '東京都', '御蔵島村', 'ﾄｳｷｮｳﾄ', 'ﾐｸﾗｼﾞﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1054, '134015', '東京都', '八丈町', 'ﾄｳｷｮｳﾄ', 'ﾊﾁｼﾞｮｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1055, '134023', '東京都', '青ヶ島村', 'ﾄｳｷｮｳﾄ', 'ｱｵｶﾞｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1056, '134210', '東京都', '小笠原村', 'ﾄｳｷｮｳﾄ', 'ｵｶﾞｻﾜﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1057, '140007', '神奈川県', NULL, 'ｶﾅｶﾞﾜｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1058, '141003', '神奈川県', '横浜市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾖｺﾊﾏｼ');
INSERT INTO `tb_division` VALUES (1059, '141305', '神奈川県', '川崎市', 'ｶﾅｶﾞﾜｹﾝ', 'ｶﾜｻｷｼ');
INSERT INTO `tb_division` VALUES (1060, '141500', '神奈川県', '相模原市', 'ｶﾅｶﾞﾜｹﾝ', 'ｻｶﾞﾐﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1061, '142018', '神奈川県', '横須賀市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾖｺｽｶｼ');
INSERT INTO `tb_division` VALUES (1062, '142034', '神奈川県', '平塚市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾋﾗﾂｶｼ');
INSERT INTO `tb_division` VALUES (1063, '142042', '神奈川県', '鎌倉市', 'ｶﾅｶﾞﾜｹﾝ', 'ｶﾏｸﾗｼ');
INSERT INTO `tb_division` VALUES (1064, '142051', '神奈川県', '藤沢市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾌｼﾞｻﾜｼ');
INSERT INTO `tb_division` VALUES (1065, '142069', '神奈川県', '小田原市', 'ｶﾅｶﾞﾜｹﾝ', 'ｵﾀﾞﾜﾗｼ');
INSERT INTO `tb_division` VALUES (1066, '142077', '神奈川県', '茅ヶ崎市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾁｶﾞｻｷｼ');
INSERT INTO `tb_division` VALUES (1067, '142085', '神奈川県', '逗子市', 'ｶﾅｶﾞﾜｹﾝ', 'ｽﾞｼｼ');
INSERT INTO `tb_division` VALUES (1068, '142107', '神奈川県', '三浦市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾐｳﾗｼ');
INSERT INTO `tb_division` VALUES (1069, '142115', '神奈川県', '秦野市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾊﾀﾞﾉｼ');
INSERT INTO `tb_division` VALUES (1070, '142123', '神奈川県', '厚木市', 'ｶﾅｶﾞﾜｹﾝ', 'ｱﾂｷﾞｼ');
INSERT INTO `tb_division` VALUES (1071, '142131', '神奈川県', '大和市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾔﾏﾄｼ');
INSERT INTO `tb_division` VALUES (1072, '142140', '神奈川県', '伊勢原市', 'ｶﾅｶﾞﾜｹﾝ', 'ｲｾﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1073, '142158', '神奈川県', '海老名市', 'ｶﾅｶﾞﾜｹﾝ', 'ｴﾋﾞﾅｼ');
INSERT INTO `tb_division` VALUES (1074, '142166', '神奈川県', '座間市', 'ｶﾅｶﾞﾜｹﾝ', 'ｻﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1075, '142174', '神奈川県', '南足柄市', 'ｶﾅｶﾞﾜｹﾝ', 'ﾐﾅﾐｱｼｶﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1076, '142182', '神奈川県', '綾瀬市', 'ｶﾅｶﾞﾜｹﾝ', 'ｱﾔｾｼ');
INSERT INTO `tb_division` VALUES (1077, '143014', '神奈川県', '葉山町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾊﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1078, '143219', '神奈川県', '寒川町', 'ｶﾅｶﾞﾜｹﾝ', 'ｻﾑｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1079, '143413', '神奈川県', '大磯町', 'ｶﾅｶﾞﾜｹﾝ', 'ｵｵｲｿﾏﾁ');
INSERT INTO `tb_division` VALUES (1080, '143421', '神奈川県', '二宮町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾆﾉﾐﾔﾏﾁ');
INSERT INTO `tb_division` VALUES (1081, '143618', '神奈川県', '中井町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾅｶｲﾏﾁ');
INSERT INTO `tb_division` VALUES (1082, '143626', '神奈川県', '大井町', 'ｶﾅｶﾞﾜｹﾝ', 'ｵｵｲﾏﾁ');
INSERT INTO `tb_division` VALUES (1083, '143634', '神奈川県', '松田町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾏﾂﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1084, '143642', '神奈川県', '山北町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾔﾏｷﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (1085, '143669', '神奈川県', '開成町', 'ｶﾅｶﾞﾜｹﾝ', 'ｶｲｾｲﾏﾁ');
INSERT INTO `tb_division` VALUES (1086, '143821', '神奈川県', '箱根町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾊｺﾈﾏﾁ');
INSERT INTO `tb_division` VALUES (1087, '143839', '神奈川県', '真鶴町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾏﾅﾂﾙﾏﾁ');
INSERT INTO `tb_division` VALUES (1088, '143847', '神奈川県', '湯河原町', 'ｶﾅｶﾞﾜｹﾝ', 'ﾕｶﾞﾜﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (1089, '144011', '神奈川県', '愛川町', 'ｶﾅｶﾞﾜｹﾝ', 'ｱｲｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1090, '144029', '神奈川県', '清川村', 'ｶﾅｶﾞﾜｹﾝ', 'ｷﾖｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1091, '150002', '新潟県', NULL, 'ﾆｲｶﾞﾀｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1092, '151009', '新潟県', '新潟市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾆｲｶﾞﾀｼ');
INSERT INTO `tb_division` VALUES (1093, '152021', '新潟県', '長岡市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾅｶﾞｵｶｼ');
INSERT INTO `tb_division` VALUES (1094, '152048', '新潟県', '三条市', 'ﾆｲｶﾞﾀｹﾝ', 'ｻﾝｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1095, '152056', '新潟県', '柏崎市', 'ﾆｲｶﾞﾀｹﾝ', 'ｶｼﾜｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (1096, '152064', '新潟県', '新発田市', 'ﾆｲｶﾞﾀｹﾝ', 'ｼﾊﾞﾀｼ');
INSERT INTO `tb_division` VALUES (1097, '152081', '新潟県', '小千谷市', 'ﾆｲｶﾞﾀｹﾝ', 'ｵﾁﾞﾔｼ');
INSERT INTO `tb_division` VALUES (1098, '152099', '新潟県', '加茂市', 'ﾆｲｶﾞﾀｹﾝ', 'ｶﾓｼ');
INSERT INTO `tb_division` VALUES (1099, '152102', '新潟県', '十日町市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾄｵｶﾏﾁｼ');
INSERT INTO `tb_division` VALUES (1100, '152111', '新潟県', '見附市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾐﾂｹｼ');
INSERT INTO `tb_division` VALUES (1101, '152129', '新潟県', '村上市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾑﾗｶﾐｼ');
INSERT INTO `tb_division` VALUES (1102, '152137', '新潟県', '燕市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾂﾊﾞﾒｼ');
INSERT INTO `tb_division` VALUES (1103, '152161', '新潟県', '糸魚川市', 'ﾆｲｶﾞﾀｹﾝ', 'ｲﾄｲｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1104, '152170', '新潟県', '妙高市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾐｮｳｺｳｼ');
INSERT INTO `tb_division` VALUES (1105, '152188', '新潟県', '五泉市', 'ﾆｲｶﾞﾀｹﾝ', 'ｺﾞｾﾝｼ');
INSERT INTO `tb_division` VALUES (1106, '152226', '新潟県', '上越市', 'ﾆｲｶﾞﾀｹﾝ', 'ｼﾞｮｳｴﾂｼ');
INSERT INTO `tb_division` VALUES (1107, '152234', '新潟県', '阿賀野市', 'ﾆｲｶﾞﾀｹﾝ', 'ｱｶﾞﾉｼ');
INSERT INTO `tb_division` VALUES (1108, '152242', '新潟県', '佐渡市', 'ﾆｲｶﾞﾀｹﾝ', 'ｻﾄﾞｼ');
INSERT INTO `tb_division` VALUES (1109, '152251', '新潟県', '魚沼市', 'ﾆｲｶﾞﾀｹﾝ', 'ｳｵﾇﾏｼ');
INSERT INTO `tb_division` VALUES (1110, '152269', '新潟県', '南魚沼市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾐﾅﾐｳｵﾇﾏｼ');
INSERT INTO `tb_division` VALUES (1111, '152277', '新潟県', '胎内市', 'ﾆｲｶﾞﾀｹﾝ', 'ﾀｲﾅｲｼ');
INSERT INTO `tb_division` VALUES (1112, '153079', '新潟県', '聖籠町', 'ﾆｲｶﾞﾀｹﾝ', 'ｾｲﾛｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1113, '153427', '新潟県', '弥彦村', 'ﾆｲｶﾞﾀｹﾝ', 'ﾔﾋｺﾑﾗ');
INSERT INTO `tb_division` VALUES (1114, '153613', '新潟県', '田上町', 'ﾆｲｶﾞﾀｹﾝ', 'ﾀｶﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1115, '153851', '新潟県', '阿賀町', 'ﾆｲｶﾞﾀｹﾝ', 'ｱｶﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1116, '154059', '新潟県', '出雲崎町', 'ﾆｲｶﾞﾀｹﾝ', 'ｲｽﾞﾓｻﾞｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1117, '154610', '新潟県', '湯沢町', 'ﾆｲｶﾞﾀｹﾝ', 'ﾕｻﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1118, '154822', '新潟県', '津南町', 'ﾆｲｶﾞﾀｹﾝ', 'ﾂﾅﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (1119, '155047', '新潟県', '刈羽村', 'ﾆｲｶﾞﾀｹﾝ', 'ｶﾘﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1120, '155811', '新潟県', '関川村', 'ﾆｲｶﾞﾀｹﾝ', 'ｾｷｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1121, '155861', '新潟県', '粟島浦村', 'ﾆｲｶﾞﾀｹﾝ', 'ｱﾜｼﾏｳﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1122, '160008', '富山県', NULL, 'ﾄﾔﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1123, '162019', '富山県', '富山市', 'ﾄﾔﾏｹﾝ', 'ﾄﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1124, '162027', '富山県', '高岡市', 'ﾄﾔﾏｹﾝ', 'ﾀｶｵｶｼ');
INSERT INTO `tb_division` VALUES (1125, '162043', '富山県', '魚津市', 'ﾄﾔﾏｹﾝ', 'ｳｵﾂﾞｼ');
INSERT INTO `tb_division` VALUES (1126, '162051', '富山県', '氷見市', 'ﾄﾔﾏｹﾝ', 'ﾋﾐｼ');
INSERT INTO `tb_division` VALUES (1127, '162060', '富山県', '滑川市', 'ﾄﾔﾏｹﾝ', 'ﾅﾒﾘｶﾜｼ');
INSERT INTO `tb_division` VALUES (1128, '162078', '富山県', '黒部市', 'ﾄﾔﾏｹﾝ', 'ｸﾛﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1129, '162086', '富山県', '砺波市', 'ﾄﾔﾏｹﾝ', 'ﾄﾅﾐｼ');
INSERT INTO `tb_division` VALUES (1130, '162094', '富山県', '小矢部市', 'ﾄﾔﾏｹﾝ', 'ｵﾔﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1131, '162108', '富山県', '南砺市', 'ﾄﾔﾏｹﾝ', 'ﾅﾝﾄｼ');
INSERT INTO `tb_division` VALUES (1132, '162116', '富山県', '射水市', 'ﾄﾔﾏｹﾝ', 'ｲﾐｽﾞｼ');
INSERT INTO `tb_division` VALUES (1133, '163210', '富山県', '舟橋村', 'ﾄﾔﾏｹﾝ', 'ﾌﾅﾊｼﾑﾗ');
INSERT INTO `tb_division` VALUES (1134, '163228', '富山県', '上市町', 'ﾄﾔﾏｹﾝ', 'ｶﾐｲﾁﾏﾁ');
INSERT INTO `tb_division` VALUES (1135, '163236', '富山県', '立山町', 'ﾄﾔﾏｹﾝ', 'ﾀﾃﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1136, '163422', '富山県', '入善町', 'ﾄﾔﾏｹﾝ', 'ﾆｭｳｾﾞﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (1137, '163431', '富山県', '朝日町', 'ﾄﾔﾏｹﾝ', 'ｱｻﾋﾏﾁ');
INSERT INTO `tb_division` VALUES (1138, '170003', '石川県', NULL, 'ｲｼｶﾜｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1139, '172014', '石川県', '金沢市', 'ｲｼｶﾜｹﾝ', 'ｶﾅｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1140, '172022', '石川県', '七尾市', 'ｲｼｶﾜｹﾝ', 'ﾅﾅｵｼ');
INSERT INTO `tb_division` VALUES (1141, '172031', '石川県', '小松市', 'ｲｼｶﾜｹﾝ', 'ｺﾏﾂｼ');
INSERT INTO `tb_division` VALUES (1142, '172049', '石川県', '輪島市', 'ｲｼｶﾜｹﾝ', 'ﾜｼﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1143, '172057', '石川県', '珠洲市', 'ｲｼｶﾜｹﾝ', 'ｽｽﾞｼ');
INSERT INTO `tb_division` VALUES (1144, '172065', '石川県', '加賀市', 'ｲｼｶﾜｹﾝ', 'ｶｶﾞｼ');
INSERT INTO `tb_division` VALUES (1145, '172073', '石川県', '羽咋市', 'ｲｼｶﾜｹﾝ', 'ﾊｸｲｼ');
INSERT INTO `tb_division` VALUES (1146, '172090', '石川県', 'かほく市', 'ｲｼｶﾜｹﾝ', 'ｶﾎｸｼ');
INSERT INTO `tb_division` VALUES (1147, '172103', '石川県', '白山市', 'ｲｼｶﾜｹﾝ', 'ﾊｸｻﾝｼ');
INSERT INTO `tb_division` VALUES (1148, '172111', '石川県', '能美市', 'ｲｼｶﾜｹﾝ', 'ﾉﾐｼ');
INSERT INTO `tb_division` VALUES (1149, '172120', '石川県', '野々市市', 'ｲｼｶﾜｹﾝ', 'ﾉﾉｲﾁｼ');
INSERT INTO `tb_division` VALUES (1150, '173240', '石川県', '川北町', 'ｲｼｶﾜｹﾝ', 'ｶﾜｷﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (1151, '173614', '石川県', '津幡町', 'ｲｼｶﾜｹﾝ', 'ﾂﾊﾞﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (1152, '173657', '石川県', '内灘町', 'ｲｼｶﾜｹﾝ', 'ｳﾁﾅﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1153, '173843', '石川県', '志賀町', 'ｲｼｶﾜｹﾝ', 'ｼｶﾏﾁ');
INSERT INTO `tb_division` VALUES (1154, '173860', '石川県', '宝達志水町', 'ｲｼｶﾜｹﾝ', 'ﾎｳﾀﾞﾂｼﾐｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1155, '174076', '石川県', '中能登町', 'ｲｼｶﾜｹﾝ', 'ﾅｶﾉﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (1156, '174611', '石川県', '穴水町', 'ｲｼｶﾜｹﾝ', 'ｱﾅﾐｽﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1157, '174637', '石川県', '能登町', 'ｲｼｶﾜｹﾝ', 'ﾉﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1158, '180009', '福井県', NULL, 'ﾌｸｲｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1159, '182010', '福井県', '福井市', 'ﾌｸｲｹﾝ', 'ﾌｸｲｼ');
INSERT INTO `tb_division` VALUES (1160, '182028', '福井県', '敦賀市', 'ﾌｸｲｹﾝ', 'ﾂﾙｶﾞｼ');
INSERT INTO `tb_division` VALUES (1161, '182044', '福井県', '小浜市', 'ﾌｸｲｹﾝ', 'ｵﾊﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1162, '182052', '福井県', '大野市', 'ﾌｸｲｹﾝ', 'ｵｵﾉｼ');
INSERT INTO `tb_division` VALUES (1163, '182061', '福井県', '勝山市', 'ﾌｸｲｹﾝ', 'ｶﾂﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1164, '182079', '福井県', '鯖江市', 'ﾌｸｲｹﾝ', 'ｻﾊﾞｴｼ');
INSERT INTO `tb_division` VALUES (1165, '182087', '福井県', 'あわら市', 'ﾌｸｲｹﾝ', 'ｱﾜﾗｼ');
INSERT INTO `tb_division` VALUES (1166, '182095', '福井県', '越前市', 'ﾌｸｲｹﾝ', 'ｴﾁｾﾞﾝｼ');
INSERT INTO `tb_division` VALUES (1167, '182109', '福井県', '坂井市', 'ﾌｸｲｹﾝ', 'ｻｶｲｼ');
INSERT INTO `tb_division` VALUES (1168, '183229', '福井県', '永平寺町', 'ﾌｸｲｹﾝ', 'ｴｲﾍｲｼﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1169, '183822', '福井県', '池田町', 'ﾌｸｲｹﾝ', 'ｲｹﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1170, '184047', '福井県', '南越前町', 'ﾌｸｲｹﾝ', 'ﾐﾅﾐｴﾁｾﾞﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1171, '184233', '福井県', '越前町', 'ﾌｸｲｹﾝ', 'ｴﾁｾﾞﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1172, '184420', '福井県', '美浜町', 'ﾌｸｲｹﾝ', 'ﾐﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1173, '184811', '福井県', '高浜町', 'ﾌｸｲｹﾝ', 'ﾀｶﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1174, '184837', '福井県', 'おおい町', 'ﾌｸｲｹﾝ', 'ｵｵｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1175, '185019', '福井県', '若狭町', 'ﾌｸｲｹﾝ', 'ﾜｶｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1176, '190004', '山梨県', NULL, 'ﾔﾏﾅｼｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1177, '192015', '山梨県', '甲府市', 'ﾔﾏﾅｼｹﾝ', 'ｺｳﾌｼ');
INSERT INTO `tb_division` VALUES (1178, '192023', '山梨県', '富士吉田市', 'ﾔﾏﾅｼｹﾝ', 'ﾌｼﾞﾖｼﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1179, '192040', '山梨県', '都留市', 'ﾔﾏﾅｼｹﾝ', 'ﾂﾙｼ');
INSERT INTO `tb_division` VALUES (1180, '192058', '山梨県', '山梨市', 'ﾔﾏﾅｼｹﾝ', 'ﾔﾏﾅｼｼ');
INSERT INTO `tb_division` VALUES (1181, '192066', '山梨県', '大月市', 'ﾔﾏﾅｼｹﾝ', 'ｵｵﾂｷｼ');
INSERT INTO `tb_division` VALUES (1182, '192074', '山梨県', '韮崎市', 'ﾔﾏﾅｼｹﾝ', 'ﾆﾗｻｷｼ');
INSERT INTO `tb_division` VALUES (1183, '192082', '山梨県', '南アルプス市', 'ﾔﾏﾅｼｹﾝ', 'ﾐﾅﾐｱﾙﾌﾟｽｼ');
INSERT INTO `tb_division` VALUES (1184, '192091', '山梨県', '北杜市', 'ﾔﾏﾅｼｹﾝ', 'ﾎｸﾄｼ');
INSERT INTO `tb_division` VALUES (1185, '192104', '山梨県', '甲斐市', 'ﾔﾏﾅｼｹﾝ', 'ｶｲｼ');
INSERT INTO `tb_division` VALUES (1186, '192112', '山梨県', '笛吹市', 'ﾔﾏﾅｼｹﾝ', 'ﾌｴﾌｷｼ');
INSERT INTO `tb_division` VALUES (1187, '192121', '山梨県', '上野原市', 'ﾔﾏﾅｼｹﾝ', 'ｳｴﾉﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1188, '192139', '山梨県', '甲州市', 'ﾔﾏﾅｼｹﾝ', 'ｺｳｼｭｳｼ');
INSERT INTO `tb_division` VALUES (1189, '192147', '山梨県', '中央市', 'ﾔﾏﾅｼｹﾝ', 'ﾁｭｳｵｳｼ');
INSERT INTO `tb_division` VALUES (1190, '193461', '山梨県', '市川三郷町', 'ﾔﾏﾅｼｹﾝ', 'ｲﾁｶﾜﾐｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1191, '193640', '山梨県', '早川町', 'ﾔﾏﾅｼｹﾝ', 'ﾊﾔｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1192, '193658', '山梨県', '身延町', 'ﾔﾏﾅｼｹﾝ', 'ﾐﾉﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1193, '193666', '山梨県', '南部町', 'ﾔﾏﾅｼｹﾝ', 'ﾅﾝﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1194, '193682', '山梨県', '富士川町', 'ﾔﾏﾅｼｹﾝ', 'ﾌｼﾞｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1195, '193844', '山梨県', '昭和町', 'ﾔﾏﾅｼｹﾝ', 'ｼｮｳﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1196, '194221', '山梨県', '道志村', 'ﾔﾏﾅｼｹﾝ', 'ﾄﾞｳｼﾑﾗ');
INSERT INTO `tb_division` VALUES (1197, '194239', '山梨県', '西桂町', 'ﾔﾏﾅｼｹﾝ', 'ﾆｼｶﾂﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1198, '194247', '山梨県', '忍野村', 'ﾔﾏﾅｼｹﾝ', 'ｵｼﾉﾑﾗ');
INSERT INTO `tb_division` VALUES (1199, '194255', '山梨県', '山中湖村', 'ﾔﾏﾅｼｹﾝ', 'ﾔﾏﾅｶｺﾑﾗ');
INSERT INTO `tb_division` VALUES (1200, '194298', '山梨県', '鳴沢村', 'ﾔﾏﾅｼｹﾝ', 'ﾅﾙｻﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1201, '194301', '山梨県', '富士河口湖町', 'ﾔﾏﾅｼｹﾝ', 'ﾌｼﾞｶﾜｸﾞﾁｺﾏﾁ');
INSERT INTO `tb_division` VALUES (1202, '194425', '山梨県', '小菅村', 'ﾔﾏﾅｼｹﾝ', 'ｺｽｹﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1203, '194433', '山梨県', '丹波山村', 'ﾔﾏﾅｼｹﾝ', 'ﾀﾊﾞﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1204, '200000', '長野県', NULL, 'ﾅｶﾞﾉｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1205, '202011', '長野県', '長野市', 'ﾅｶﾞﾉｹﾝ', 'ﾅｶﾞﾉｼ');
INSERT INTO `tb_division` VALUES (1206, '202029', '長野県', '松本市', 'ﾅｶﾞﾉｹﾝ', 'ﾏﾂﾓﾄｼ');
INSERT INTO `tb_division` VALUES (1207, '202037', '長野県', '上田市', 'ﾅｶﾞﾉｹﾝ', 'ｳｴﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1208, '202045', '長野県', '岡谷市', 'ﾅｶﾞﾉｹﾝ', 'ｵｶﾔｼ');
INSERT INTO `tb_division` VALUES (1209, '202053', '長野県', '飯田市', 'ﾅｶﾞﾉｹﾝ', 'ｲｲﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1210, '202061', '長野県', '諏訪市', 'ﾅｶﾞﾉｹﾝ', 'ｽﾜｼ');
INSERT INTO `tb_division` VALUES (1211, '202070', '長野県', '須坂市', 'ﾅｶﾞﾉｹﾝ', 'ｽｻﾞｶｼ');
INSERT INTO `tb_division` VALUES (1212, '202088', '長野県', '小諸市', 'ﾅｶﾞﾉｹﾝ', 'ｺﾓﾛｼ');
INSERT INTO `tb_division` VALUES (1213, '202096', '長野県', '伊那市', 'ﾅｶﾞﾉｹﾝ', 'ｲﾅｼ');
INSERT INTO `tb_division` VALUES (1214, '202100', '長野県', '駒ヶ根市', 'ﾅｶﾞﾉｹﾝ', 'ｺﾏｶﾞﾈｼ');
INSERT INTO `tb_division` VALUES (1215, '202118', '長野県', '中野市', 'ﾅｶﾞﾉｹﾝ', 'ﾅｶﾉｼ');
INSERT INTO `tb_division` VALUES (1216, '202126', '長野県', '大町市', 'ﾅｶﾞﾉｹﾝ', 'ｵｵﾏﾁｼ');
INSERT INTO `tb_division` VALUES (1217, '202134', '長野県', '飯山市', 'ﾅｶﾞﾉｹﾝ', 'ｲｲﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1218, '202142', '長野県', '茅野市', 'ﾅｶﾞﾉｹﾝ', 'ﾁﾉｼ');
INSERT INTO `tb_division` VALUES (1219, '202151', '長野県', '塩尻市', 'ﾅｶﾞﾉｹﾝ', 'ｼｵｼﾞﾘｼ');
INSERT INTO `tb_division` VALUES (1220, '202177', '長野県', '佐久市', 'ﾅｶﾞﾉｹﾝ', 'ｻｸｼ');
INSERT INTO `tb_division` VALUES (1221, '202185', '長野県', '千曲市', 'ﾅｶﾞﾉｹﾝ', 'ﾁｸﾏｼ');
INSERT INTO `tb_division` VALUES (1222, '202193', '長野県', '東御市', 'ﾅｶﾞﾉｹﾝ', 'ﾄｳﾐｼ');
INSERT INTO `tb_division` VALUES (1223, '202207', '長野県', '安曇野市', 'ﾅｶﾞﾉｹﾝ', 'ｱﾂﾞﾐﾉｼ');
INSERT INTO `tb_division` VALUES (1224, '203033', '長野県', '小海町', 'ﾅｶﾞﾉｹﾝ', 'ｺｳﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1225, '203041', '長野県', '川上村', 'ﾅｶﾞﾉｹﾝ', 'ｶﾜｶﾐﾑﾗ');
INSERT INTO `tb_division` VALUES (1226, '203050', '長野県', '南牧村', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾅﾐﾏｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1227, '203068', '長野県', '南相木村', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾅﾐｱｲｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1228, '203076', '長野県', '北相木村', 'ﾅｶﾞﾉｹﾝ', 'ｷﾀｱｲｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1229, '203092', '長野県', '佐久穂町', 'ﾅｶﾞﾉｹﾝ', 'ｻｸﾎﾏﾁ');
INSERT INTO `tb_division` VALUES (1230, '203211', '長野県', '軽井沢町', 'ﾅｶﾞﾉｹﾝ', 'ｶﾙｲｻﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1231, '203238', '長野県', '御代田町', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾖﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (1232, '203246', '長野県', '立科町', 'ﾅｶﾞﾉｹﾝ', 'ﾀﾃｼﾅﾏﾁ');
INSERT INTO `tb_division` VALUES (1233, '203491', '長野県', '青木村', 'ﾅｶﾞﾉｹﾝ', 'ｱｵｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1234, '203505', '長野県', '長和町', 'ﾅｶﾞﾉｹﾝ', 'ﾅｶﾞﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1235, '203611', '長野県', '下諏訪町', 'ﾅｶﾞﾉｹﾝ', 'ｼﾓｽﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1236, '203629', '長野県', '富士見町', 'ﾅｶﾞﾉｹﾝ', 'ﾌｼﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1237, '203637', '長野県', '原村', 'ﾅｶﾞﾉｹﾝ', 'ﾊﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1238, '203823', '長野県', '辰野町', 'ﾅｶﾞﾉｹﾝ', 'ﾀﾂﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (1239, '203831', '長野県', '箕輪町', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾉﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1240, '203840', '長野県', '飯島町', 'ﾅｶﾞﾉｹﾝ', 'ｲｲｼﾞﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1241, '203858', '長野県', '南箕輪村', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾅﾐﾐﾉﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1242, '203866', '長野県', '中川村', 'ﾅｶﾞﾉｹﾝ', 'ﾅｶｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1243, '203882', '長野県', '宮田村', 'ﾅｶﾞﾉｹﾝ', 'ﾐﾔﾀﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1244, '204021', '長野県', '松川町', 'ﾅｶﾞﾉｹﾝ', 'ﾏﾂｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1245, '204030', '長野県', '高森町', 'ﾅｶﾞﾉｹﾝ', 'ﾀｶﾓﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (1246, '204048', '長野県', '阿南町', 'ﾅｶﾞﾉｹﾝ', 'ｱﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1247, '204072', '長野県', '阿智村', 'ﾅｶﾞﾉｹﾝ', 'ｱﾁﾑﾗ');
INSERT INTO `tb_division` VALUES (1248, '204099', '長野県', '平谷村', 'ﾅｶﾞﾉｹﾝ', 'ﾋﾗﾔﾑﾗ');
INSERT INTO `tb_division` VALUES (1249, '204102', '長野県', '根羽村', 'ﾅｶﾞﾉｹﾝ', 'ﾈﾊﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1250, '204111', '長野県', '下條村', 'ﾅｶﾞﾉｹﾝ', 'ｼﾓｼﾞｮｳﾑﾗ');
INSERT INTO `tb_division` VALUES (1251, '204129', '長野県', '売木村', 'ﾅｶﾞﾉｹﾝ', 'ｳﾙｷﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1252, '204137', '長野県', '天龍村', 'ﾅｶﾞﾉｹﾝ', 'ﾃﾝﾘｭｳﾑﾗ');
INSERT INTO `tb_division` VALUES (1253, '204145', '長野県', '泰阜村', 'ﾅｶﾞﾉｹﾝ', 'ﾔｽｵｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1254, '204153', '長野県', '喬木村', 'ﾅｶﾞﾉｹﾝ', 'ﾀｶｷﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1255, '204161', '長野県', '豊丘村', 'ﾅｶﾞﾉｹﾝ', 'ﾄﾖｵｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1256, '204170', '長野県', '大鹿村', 'ﾅｶﾞﾉｹﾝ', 'ｵｵｼｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1257, '204226', '長野県', '上松町', 'ﾅｶﾞﾉｹﾝ', 'ｱｹﾞﾏﾂﾏﾁ');
INSERT INTO `tb_division` VALUES (1258, '204234', '長野県', '南木曽町', 'ﾅｶﾞﾉｹﾝ', 'ﾅｷﾞｿﾏﾁ');
INSERT INTO `tb_division` VALUES (1259, '204251', '長野県', '木祖村', 'ﾅｶﾞﾉｹﾝ', 'ｷｿﾑﾗ');
INSERT INTO `tb_division` VALUES (1260, '204293', '長野県', '王滝村', 'ﾅｶﾞﾉｹﾝ', 'ｵｳﾀｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1261, '204307', '長野県', '大桑村', 'ﾅｶﾞﾉｹﾝ', 'ｵｵｸﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1262, '204323', '長野県', '木曽町', 'ﾅｶﾞﾉｹﾝ', 'ｷｿﾏﾁ');
INSERT INTO `tb_division` VALUES (1263, '204463', '長野県', '麻績村', 'ﾅｶﾞﾉｹﾝ', 'ｵﾐﾑﾗ');
INSERT INTO `tb_division` VALUES (1264, '204480', '長野県', '生坂村', 'ﾅｶﾞﾉｹﾝ', 'ｲｸｻｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1265, '204501', '長野県', '山形村', 'ﾅｶﾞﾉｹﾝ', 'ﾔﾏｶﾞﾀﾑﾗ');
INSERT INTO `tb_division` VALUES (1266, '204510', '長野県', '朝日村', 'ﾅｶﾞﾉｹﾝ', 'ｱｻﾋﾑﾗ');
INSERT INTO `tb_division` VALUES (1267, '204528', '長野県', '筑北村', 'ﾅｶﾞﾉｹﾝ', 'ﾁｸﾎｸﾑﾗ');
INSERT INTO `tb_division` VALUES (1268, '204811', '長野県', '池田町', 'ﾅｶﾞﾉｹﾝ', 'ｲｹﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1269, '204820', '長野県', '松川村', 'ﾅｶﾞﾉｹﾝ', 'ﾏﾂｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1270, '204854', '長野県', '白馬村', 'ﾅｶﾞﾉｹﾝ', 'ﾊｸﾊﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1271, '204862', '長野県', '小谷村', 'ﾅｶﾞﾉｹﾝ', 'ｵﾀﾘﾑﾗ');
INSERT INTO `tb_division` VALUES (1272, '205214', '長野県', '坂城町', 'ﾅｶﾞﾉｹﾝ', 'ｻｶｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1273, '205419', '長野県', '小布施町', 'ﾅｶﾞﾉｹﾝ', 'ｵﾌﾞｾﾏﾁ');
INSERT INTO `tb_division` VALUES (1274, '205435', '長野県', '高山村', 'ﾅｶﾞﾉｹﾝ', 'ﾀｶﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1275, '205613', '長野県', '山ノ内町', 'ﾅｶﾞﾉｹﾝ', 'ﾔﾏﾉｳﾁﾏﾁ');
INSERT INTO `tb_division` VALUES (1276, '205621', '長野県', '木島平村', 'ﾅｶﾞﾉｹﾝ', 'ｷｼﾞﾏﾀﾞｲﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1277, '205630', '長野県', '野沢温泉村', 'ﾅｶﾞﾉｹﾝ', 'ﾉｻﾞﾜｵﾝｾﾝﾑﾗ');
INSERT INTO `tb_division` VALUES (1278, '205834', '長野県', '信濃町', 'ﾅｶﾞﾉｹﾝ', 'ｼﾅﾉﾏﾁ');
INSERT INTO `tb_division` VALUES (1279, '205885', '長野県', '小川村', 'ﾅｶﾞﾉｹﾝ', 'ｵｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1280, '205907', '長野県', '飯綱町', 'ﾅｶﾞﾉｹﾝ', 'ｲｲﾂﾞﾅﾏﾁ');
INSERT INTO `tb_division` VALUES (1281, '206024', '長野県', '栄村', 'ﾅｶﾞﾉｹﾝ', 'ｻｶｴﾑﾗ');
INSERT INTO `tb_division` VALUES (1282, '210005', '岐阜県', NULL, 'ｷﾞﾌｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1283, '212016', '岐阜県', '岐阜市', 'ｷﾞﾌｹﾝ', 'ｷﾞﾌｼ');
INSERT INTO `tb_division` VALUES (1284, '212024', '岐阜県', '大垣市', 'ｷﾞﾌｹﾝ', 'ｵｵｶﾞｷｼ');
INSERT INTO `tb_division` VALUES (1285, '212032', '岐阜県', '高山市', 'ｷﾞﾌｹﾝ', 'ﾀｶﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1286, '212041', '岐阜県', '多治見市', 'ｷﾞﾌｹﾝ', 'ﾀｼﾞﾐｼ');
INSERT INTO `tb_division` VALUES (1287, '212059', '岐阜県', '関市', 'ｷﾞﾌｹﾝ', 'ｾｷｼ');
INSERT INTO `tb_division` VALUES (1288, '212067', '岐阜県', '中津川市', 'ｷﾞﾌｹﾝ', 'ﾅｶﾂｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1289, '212075', '岐阜県', '美濃市', 'ｷﾞﾌｹﾝ', 'ﾐﾉｼ');
INSERT INTO `tb_division` VALUES (1290, '212083', '岐阜県', '瑞浪市', 'ｷﾞﾌｹﾝ', 'ﾐｽﾞﾅﾐｼ');
INSERT INTO `tb_division` VALUES (1291, '212091', '岐阜県', '羽島市', 'ｷﾞﾌｹﾝ', 'ﾊｼﾏｼ');
INSERT INTO `tb_division` VALUES (1292, '212105', '岐阜県', '恵那市', 'ｷﾞﾌｹﾝ', 'ｴﾅｼ');
INSERT INTO `tb_division` VALUES (1293, '212113', '岐阜県', '美濃加茂市', 'ｷﾞﾌｹﾝ', 'ﾐﾉｶﾓｼ');
INSERT INTO `tb_division` VALUES (1294, '212121', '岐阜県', '土岐市', 'ｷﾞﾌｹﾝ', 'ﾄｷｼ');
INSERT INTO `tb_division` VALUES (1295, '212130', '岐阜県', '各務原市', 'ｷﾞﾌｹﾝ', 'ｶｶﾐｶﾞﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1296, '212148', '岐阜県', '可児市', 'ｷﾞﾌｹﾝ', 'ｶﾆｼ');
INSERT INTO `tb_division` VALUES (1297, '212156', '岐阜県', '山県市', 'ｷﾞﾌｹﾝ', 'ﾔﾏｶﾞﾀｼ');
INSERT INTO `tb_division` VALUES (1298, '212164', '岐阜県', '瑞穂市', 'ｷﾞﾌｹﾝ', 'ﾐｽﾞﾎｼ');
INSERT INTO `tb_division` VALUES (1299, '212172', '岐阜県', '飛騨市', 'ｷﾞﾌｹﾝ', 'ﾋﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1300, '212181', '岐阜県', '本巣市', 'ｷﾞﾌｹﾝ', 'ﾓﾄｽｼ');
INSERT INTO `tb_division` VALUES (1301, '212199', '岐阜県', '郡上市', 'ｷﾞﾌｹﾝ', 'ｸﾞｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1302, '212202', '岐阜県', '下呂市', 'ｷﾞﾌｹﾝ', 'ｹﾞﾛｼ');
INSERT INTO `tb_division` VALUES (1303, '212211', '岐阜県', '海津市', 'ｷﾞﾌｹﾝ', 'ｶｲﾂﾞｼ');
INSERT INTO `tb_division` VALUES (1304, '213021', '岐阜県', '岐南町', 'ｷﾞﾌｹﾝ', 'ｷﾞﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1305, '213039', '岐阜県', '笠松町', 'ｷﾞﾌｹﾝ', 'ｶｻﾏﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (1306, '213411', '岐阜県', '養老町', 'ｷﾞﾌｹﾝ', 'ﾖｳﾛｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1307, '213616', '岐阜県', '垂井町', 'ｷﾞﾌｹﾝ', 'ﾀﾙｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1308, '213624', '岐阜県', '関ケ原町', 'ｷﾞﾌｹﾝ', 'ｾｷｶﾞﾊﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1309, '213811', '岐阜県', '神戸町', 'ｷﾞﾌｹﾝ', 'ｺﾞｳﾄﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1310, '213829', '岐阜県', '輪之内町', 'ｷﾞﾌｹﾝ', 'ﾜﾉｳﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1311, '213837', '岐阜県', '安八町', 'ｷﾞﾌｹﾝ', 'ｱﾝﾊﾟﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1312, '214019', '岐阜県', '揖斐川町', 'ｷﾞﾌｹﾝ', 'ｲﾋﾞｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1313, '214035', '岐阜県', '大野町', 'ｷﾞﾌｹﾝ', 'ｵｵﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1314, '214043', '岐阜県', '池田町', 'ｷﾞﾌｹﾝ', 'ｲｹﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1315, '214213', '岐阜県', '北方町', 'ｷﾞﾌｹﾝ', 'ｷﾀｶﾞﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1316, '215015', '岐阜県', '坂祝町', 'ｷﾞﾌｹﾝ', 'ｻｶﾎｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1317, '215023', '岐阜県', '富加町', 'ｷﾞﾌｹﾝ', 'ﾄﾐｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1318, '215031', '岐阜県', '川辺町', 'ｷﾞﾌｹﾝ', 'ｶﾜﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1319, '215040', '岐阜県', '七宗町', 'ｷﾞﾌｹﾝ', 'ﾋﾁｿｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1320, '215058', '岐阜県', '八百津町', 'ｷﾞﾌｹﾝ', 'ﾔｵﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (1321, '215066', '岐阜県', '白川町', 'ｷﾞﾌｹﾝ', 'ｼﾗｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1322, '215074', '岐阜県', '東白川村', 'ｷﾞﾌｹﾝ', 'ﾋｶﾞｼｼﾗｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1323, '215210', '岐阜県', '御嵩町', 'ｷﾞﾌｹﾝ', 'ﾐﾀｹﾁｮｳ');
INSERT INTO `tb_division` VALUES (1324, '216046', '岐阜県', '白川村', 'ｷﾞﾌｹﾝ', 'ｼﾗｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1325, '220001', '静岡県', NULL, 'ｼｽﾞｵｶｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1326, '221007', '静岡県', '静岡市', 'ｼｽﾞｵｶｹﾝ', 'ｼｽﾞｵｶｼ');
INSERT INTO `tb_division` VALUES (1327, '221309', '静岡県', '浜松市', 'ｼｽﾞｵｶｹﾝ', 'ﾊﾏﾏﾂｼ');
INSERT INTO `tb_division` VALUES (1328, '222038', '静岡県', '沼津市', 'ｼｽﾞｵｶｹﾝ', 'ﾇﾏﾂﾞｼ');
INSERT INTO `tb_division` VALUES (1329, '222054', '静岡県', '熱海市', 'ｼｽﾞｵｶｹﾝ', 'ｱﾀﾐｼ');
INSERT INTO `tb_division` VALUES (1330, '222062', '静岡県', '三島市', 'ｼｽﾞｵｶｹﾝ', 'ﾐｼﾏｼ');
INSERT INTO `tb_division` VALUES (1331, '222071', '静岡県', '富士宮市', 'ｼｽﾞｵｶｹﾝ', 'ﾌｼﾞﾉﾐﾔｼ');
INSERT INTO `tb_division` VALUES (1332, '222089', '静岡県', '伊東市', 'ｼｽﾞｵｶｹﾝ', 'ｲﾄｳｼ');
INSERT INTO `tb_division` VALUES (1333, '222097', '静岡県', '島田市', 'ｼｽﾞｵｶｹﾝ', 'ｼﾏﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1334, '222101', '静岡県', '富士市', 'ｼｽﾞｵｶｹﾝ', 'ﾌｼﾞｼ');
INSERT INTO `tb_division` VALUES (1335, '222119', '静岡県', '磐田市', 'ｼｽﾞｵｶｹﾝ', 'ｲﾜﾀｼ');
INSERT INTO `tb_division` VALUES (1336, '222127', '静岡県', '焼津市', 'ｼｽﾞｵｶｹﾝ', 'ﾔｲﾂﾞｼ');
INSERT INTO `tb_division` VALUES (1337, '222135', '静岡県', '掛川市', 'ｼｽﾞｵｶｹﾝ', 'ｶｹｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1338, '222143', '静岡県', '藤枝市', 'ｼｽﾞｵｶｹﾝ', 'ﾌｼﾞｴﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1339, '222151', '静岡県', '御殿場市', 'ｼｽﾞｵｶｹﾝ', 'ｺﾞﾃﾝﾊﾞｼ');
INSERT INTO `tb_division` VALUES (1340, '222160', '静岡県', '袋井市', 'ｼｽﾞｵｶｹﾝ', 'ﾌｸﾛｲｼ');
INSERT INTO `tb_division` VALUES (1341, '222194', '静岡県', '下田市', 'ｼｽﾞｵｶｹﾝ', 'ｼﾓﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1342, '222208', '静岡県', '裾野市', 'ｼｽﾞｵｶｹﾝ', 'ｽｿﾉｼ');
INSERT INTO `tb_division` VALUES (1343, '222216', '静岡県', '湖西市', 'ｼｽﾞｵｶｹﾝ', 'ｺｻｲｼ');
INSERT INTO `tb_division` VALUES (1344, '222224', '静岡県', '伊豆市', 'ｼｽﾞｵｶｹﾝ', 'ｲｽﾞｼ');
INSERT INTO `tb_division` VALUES (1345, '222232', '静岡県', '御前崎市', 'ｼｽﾞｵｶｹﾝ', 'ｵﾏｴｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (1346, '222241', '静岡県', '菊川市', 'ｼｽﾞｵｶｹﾝ', 'ｷｸｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1347, '222259', '静岡県', '伊豆の国市', 'ｼｽﾞｵｶｹﾝ', 'ｲｽﾞﾉｸﾆｼ');
INSERT INTO `tb_division` VALUES (1348, '222267', '静岡県', '牧之原市', 'ｼｽﾞｵｶｹﾝ', 'ﾏｷﾉﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1349, '223018', '静岡県', '東伊豆町', 'ｼｽﾞｵｶｹﾝ', 'ﾋｶﾞｼｲｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1350, '223026', '静岡県', '河津町', 'ｼｽﾞｵｶｹﾝ', 'ｶﾜﾂﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1351, '223042', '静岡県', '南伊豆町', 'ｼｽﾞｵｶｹﾝ', 'ﾐﾅﾐｲｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1352, '223051', '静岡県', '松崎町', 'ｼｽﾞｵｶｹﾝ', 'ﾏﾂｻﾞｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1353, '223069', '静岡県', '西伊豆町', 'ｼｽﾞｵｶｹﾝ', 'ﾆｼｲｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1354, '223255', '静岡県', '函南町', 'ｼｽﾞｵｶｹﾝ', 'ｶﾝﾅﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1355, '223417', '静岡県', '清水町', 'ｼｽﾞｵｶｹﾝ', 'ｼﾐｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1356, '223425', '静岡県', '長泉町', 'ｼｽﾞｵｶｹﾝ', 'ﾅｶﾞｲｽﾞﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1357, '223441', '静岡県', '小山町', 'ｼｽﾞｵｶｹﾝ', 'ｵﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1358, '224243', '静岡県', '吉田町', 'ｼｽﾞｵｶｹﾝ', 'ﾖｼﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1359, '224294', '静岡県', '川根本町', 'ｼｽﾞｵｶｹﾝ', 'ｶﾜﾈﾎﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1360, '224618', '静岡県', '森町', 'ｼｽﾞｵｶｹﾝ', 'ﾓﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (1361, '230006', '愛知県', NULL, 'ｱｲﾁｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1362, '231002', '愛知県', '名古屋市', 'ｱｲﾁｹﾝ', 'ﾅｺﾞﾔｼ');
INSERT INTO `tb_division` VALUES (1363, '232017', '愛知県', '豊橋市', 'ｱｲﾁｹﾝ', 'ﾄﾖﾊｼｼ');
INSERT INTO `tb_division` VALUES (1364, '232025', '愛知県', '岡崎市', 'ｱｲﾁｹﾝ', 'ｵｶｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (1365, '232033', '愛知県', '一宮市', 'ｱｲﾁｹﾝ', 'ｲﾁﾉﾐﾔｼ');
INSERT INTO `tb_division` VALUES (1366, '232041', '愛知県', '瀬戸市', 'ｱｲﾁｹﾝ', 'ｾﾄｼ');
INSERT INTO `tb_division` VALUES (1367, '232050', '愛知県', '半田市', 'ｱｲﾁｹﾝ', 'ﾊﾝﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1368, '232068', '愛知県', '春日井市', 'ｱｲﾁｹﾝ', 'ｶｽｶﾞｲｼ');
INSERT INTO `tb_division` VALUES (1369, '232076', '愛知県', '豊川市', 'ｱｲﾁｹﾝ', 'ﾄﾖｶﾜｼ');
INSERT INTO `tb_division` VALUES (1370, '232084', '愛知県', '津島市', 'ｱｲﾁｹﾝ', 'ﾂｼﾏｼ');
INSERT INTO `tb_division` VALUES (1371, '232092', '愛知県', '碧南市', 'ｱｲﾁｹﾝ', 'ﾍｷﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1372, '232106', '愛知県', '刈谷市', 'ｱｲﾁｹﾝ', 'ｶﾘﾔｼ');
INSERT INTO `tb_division` VALUES (1373, '232114', '愛知県', '豊田市', 'ｱｲﾁｹﾝ', 'ﾄﾖﾀｼ');
INSERT INTO `tb_division` VALUES (1374, '232122', '愛知県', '安城市', 'ｱｲﾁｹﾝ', 'ｱﾝｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1375, '232131', '愛知県', '西尾市', 'ｱｲﾁｹﾝ', 'ﾆｼｵｼ');
INSERT INTO `tb_division` VALUES (1376, '232149', '愛知県', '蒲郡市', 'ｱｲﾁｹﾝ', 'ｶﾞﾏｺﾞｵﾘｼ');
INSERT INTO `tb_division` VALUES (1377, '232157', '愛知県', '犬山市', 'ｱｲﾁｹﾝ', 'ｲﾇﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1378, '232165', '愛知県', '常滑市', 'ｱｲﾁｹﾝ', 'ﾄｺﾅﾒｼ');
INSERT INTO `tb_division` VALUES (1379, '232173', '愛知県', '江南市', 'ｱｲﾁｹﾝ', 'ｺｳﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1380, '232190', '愛知県', '小牧市', 'ｱｲﾁｹﾝ', 'ｺﾏｷｼ');
INSERT INTO `tb_division` VALUES (1381, '232203', '愛知県', '稲沢市', 'ｱｲﾁｹﾝ', 'ｲﾅｻﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1382, '232211', '愛知県', '新城市', 'ｱｲﾁｹﾝ', 'ｼﾝｼﾛｼ');
INSERT INTO `tb_division` VALUES (1383, '232220', '愛知県', '東海市', 'ｱｲﾁｹﾝ', 'ﾄｳｶｲｼ');
INSERT INTO `tb_division` VALUES (1384, '232238', '愛知県', '大府市', 'ｱｲﾁｹﾝ', 'ｵｵﾌﾞｼ');
INSERT INTO `tb_division` VALUES (1385, '232246', '愛知県', '知多市', 'ｱｲﾁｹﾝ', 'ﾁﾀｼ');
INSERT INTO `tb_division` VALUES (1386, '232254', '愛知県', '知立市', 'ｱｲﾁｹﾝ', 'ﾁﾘｭｳｼ');
INSERT INTO `tb_division` VALUES (1387, '232262', '愛知県', '尾張旭市', 'ｱｲﾁｹﾝ', 'ｵﾜﾘｱｻﾋｼ');
INSERT INTO `tb_division` VALUES (1388, '232271', '愛知県', '高浜市', 'ｱｲﾁｹﾝ', 'ﾀｶﾊﾏｼ');
INSERT INTO `tb_division` VALUES (1389, '232289', '愛知県', '岩倉市', 'ｱｲﾁｹﾝ', 'ｲﾜｸﾗｼ');
INSERT INTO `tb_division` VALUES (1390, '232297', '愛知県', '豊明市', 'ｱｲﾁｹﾝ', 'ﾄﾖｱｹｼ');
INSERT INTO `tb_division` VALUES (1391, '232301', '愛知県', '日進市', 'ｱｲﾁｹﾝ', 'ﾆｯｼﾝｼ');
INSERT INTO `tb_division` VALUES (1392, '232319', '愛知県', '田原市', 'ｱｲﾁｹﾝ', 'ﾀﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1393, '232327', '愛知県', '愛西市', 'ｱｲﾁｹﾝ', 'ｱｲｻｲｼ');
INSERT INTO `tb_division` VALUES (1394, '232335', '愛知県', '清須市', 'ｱｲﾁｹﾝ', 'ｷﾖｽｼ');
INSERT INTO `tb_division` VALUES (1395, '232343', '愛知県', '北名古屋市', 'ｱｲﾁｹﾝ', 'ｷﾀﾅｺﾞﾔｼ');
INSERT INTO `tb_division` VALUES (1396, '232351', '愛知県', '弥富市', 'ｱｲﾁｹﾝ', 'ﾔﾄﾐｼ');
INSERT INTO `tb_division` VALUES (1397, '232360', '愛知県', 'みよし市', 'ｱｲﾁｹﾝ', 'ﾐﾖｼｼ');
INSERT INTO `tb_division` VALUES (1398, '232378', '愛知県', 'あま市', 'ｱｲﾁｹﾝ', 'ｱﾏｼ');
INSERT INTO `tb_division` VALUES (1399, '232386', '愛知県', '長久手市', 'ｱｲﾁｹﾝ', 'ﾅｶﾞｸﾃｼ');
INSERT INTO `tb_division` VALUES (1400, '233021', '愛知県', '東郷町', 'ｱｲﾁｹﾝ', 'ﾄｳｺﾞｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1401, '233421', '愛知県', '豊山町', 'ｱｲﾁｹﾝ', 'ﾄﾖﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1402, '233617', '愛知県', '大口町', 'ｱｲﾁｹﾝ', 'ｵｵｸﾞﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1403, '233625', '愛知県', '扶桑町', 'ｱｲﾁｹﾝ', 'ﾌｿｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1404, '234249', '愛知県', '大治町', 'ｱｲﾁｹﾝ', 'ｵｵﾊﾙﾁｮｳ');
INSERT INTO `tb_division` VALUES (1405, '234257', '愛知県', '蟹江町', 'ｱｲﾁｹﾝ', 'ｶﾆｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (1406, '234273', '愛知県', '飛島村', 'ｱｲﾁｹﾝ', 'ﾄﾋﾞｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1407, '234419', '愛知県', '阿久比町', 'ｱｲﾁｹﾝ', 'ｱｸﾞｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1408, '234427', '愛知県', '東浦町', 'ｱｲﾁｹﾝ', 'ﾋｶﾞｼｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1409, '234451', '愛知県', '南知多町', 'ｱｲﾁｹﾝ', 'ﾐﾅﾐﾁﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1410, '234460', '愛知県', '美浜町', 'ｱｲﾁｹﾝ', 'ﾐﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1411, '234478', '愛知県', '武豊町', 'ｱｲﾁｹﾝ', 'ﾀｹﾄﾖﾁｮｳ');
INSERT INTO `tb_division` VALUES (1412, '235016', '愛知県', '幸田町', 'ｱｲﾁｹﾝ', 'ｺｳﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1413, '235610', '愛知県', '設楽町', 'ｱｲﾁｹﾝ', 'ｼﾀﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1414, '235628', '愛知県', '東栄町', 'ｱｲﾁｹﾝ', 'ﾄｳｴｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1415, '235636', '愛知県', '豊根村', 'ｱｲﾁｹﾝ', 'ﾄﾖﾈﾑﾗ');
INSERT INTO `tb_division` VALUES (1416, '240001', '三重県', NULL, 'ﾐｴｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1417, '242012', '三重県', '津市', 'ﾐｴｹﾝ', 'ﾂｼ');
INSERT INTO `tb_division` VALUES (1418, '242021', '三重県', '四日市市', 'ﾐｴｹﾝ', 'ﾖｯｶｲﾁｼ');
INSERT INTO `tb_division` VALUES (1419, '242039', '三重県', '伊勢市', 'ﾐｴｹﾝ', 'ｲｾｼ');
INSERT INTO `tb_division` VALUES (1420, '242047', '三重県', '松阪市', 'ﾐｴｹﾝ', 'ﾏﾂｻｶｼ');
INSERT INTO `tb_division` VALUES (1421, '242055', '三重県', '桑名市', 'ﾐｴｹﾝ', 'ｸﾜﾅｼ');
INSERT INTO `tb_division` VALUES (1422, '242071', '三重県', '鈴鹿市', 'ﾐｴｹﾝ', 'ｽｽﾞｶｼ');
INSERT INTO `tb_division` VALUES (1423, '242080', '三重県', '名張市', 'ﾐｴｹﾝ', 'ﾅﾊﾞﾘｼ');
INSERT INTO `tb_division` VALUES (1424, '242098', '三重県', '尾鷲市', 'ﾐｴｹﾝ', 'ｵﾜｾｼ');
INSERT INTO `tb_division` VALUES (1425, '242101', '三重県', '亀山市', 'ﾐｴｹﾝ', 'ｶﾒﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1426, '242110', '三重県', '鳥羽市', 'ﾐｴｹﾝ', 'ﾄﾊﾞｼ');
INSERT INTO `tb_division` VALUES (1427, '242128', '三重県', '熊野市', 'ﾐｴｹﾝ', 'ｸﾏﾉｼ');
INSERT INTO `tb_division` VALUES (1428, '242144', '三重県', 'いなべ市', 'ﾐｴｹﾝ', 'ｲﾅﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1429, '242152', '三重県', '志摩市', 'ﾐｴｹﾝ', 'ｼﾏｼ');
INSERT INTO `tb_division` VALUES (1430, '242161', '三重県', '伊賀市', 'ﾐｴｹﾝ', 'ｲｶﾞｼ');
INSERT INTO `tb_division` VALUES (1431, '243035', '三重県', '木曽岬町', 'ﾐｴｹﾝ', 'ｷｿｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1432, '243248', '三重県', '東員町', 'ﾐｴｹﾝ', 'ﾄｳｲﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1433, '243418', '三重県', '菰野町', 'ﾐｴｹﾝ', 'ｺﾓﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1434, '243434', '三重県', '朝日町', 'ﾐｴｹﾝ', 'ｱｻﾋﾁｮｳ');
INSERT INTO `tb_division` VALUES (1435, '243442', '三重県', '川越町', 'ﾐｴｹﾝ', 'ｶﾜｺﾞｴﾁｮｳ');
INSERT INTO `tb_division` VALUES (1436, '244414', '三重県', '多気町', 'ﾐｴｹﾝ', 'ﾀｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1437, '244422', '三重県', '明和町', 'ﾐｴｹﾝ', 'ﾒｲﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1438, '244431', '三重県', '大台町', 'ﾐｴｹﾝ', 'ｵｵﾀﾞｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1439, '244619', '三重県', '玉城町', 'ﾐｴｹﾝ', 'ﾀﾏｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1440, '244708', '三重県', '度会町', 'ﾐｴｹﾝ', 'ﾜﾀﾗｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1441, '244716', '三重県', '大紀町', 'ﾐｴｹﾝ', 'ﾀｲｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1442, '244724', '三重県', '南伊勢町', 'ﾐｴｹﾝ', 'ﾐﾅﾐｲｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (1443, '245437', '三重県', '紀北町', 'ﾐｴｹﾝ', 'ｷﾎｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (1444, '245615', '三重県', '御浜町', 'ﾐｴｹﾝ', 'ﾐﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1445, '245623', '三重県', '紀宝町', 'ﾐｴｹﾝ', 'ｷﾎｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1446, '250007', '滋賀県', NULL, 'ｼｶﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1447, '252018', '滋賀県', '大津市', 'ｼｶﾞｹﾝ', 'ｵｵﾂｼ');
INSERT INTO `tb_division` VALUES (1448, '252026', '滋賀県', '彦根市', 'ｼｶﾞｹﾝ', 'ﾋｺﾈｼ');
INSERT INTO `tb_division` VALUES (1449, '252034', '滋賀県', '長浜市', 'ｼｶﾞｹﾝ', 'ﾅｶﾞﾊﾏｼ');
INSERT INTO `tb_division` VALUES (1450, '252042', '滋賀県', '近江八幡市', 'ｼｶﾞｹﾝ', 'ｵｳﾐﾊﾁﾏﾝｼ');
INSERT INTO `tb_division` VALUES (1451, '252069', '滋賀県', '草津市', 'ｼｶﾞｹﾝ', 'ｸｻﾂｼ');
INSERT INTO `tb_division` VALUES (1452, '252077', '滋賀県', '守山市', 'ｼｶﾞｹﾝ', 'ﾓﾘﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1453, '252085', '滋賀県', '栗東市', 'ｼｶﾞｹﾝ', 'ﾘｯﾄｳｼ');
INSERT INTO `tb_division` VALUES (1454, '252093', '滋賀県', '甲賀市', 'ｼｶﾞｹﾝ', 'ｺｳｶｼ');
INSERT INTO `tb_division` VALUES (1455, '252107', '滋賀県', '野洲市', 'ｼｶﾞｹﾝ', 'ﾔｽｼ');
INSERT INTO `tb_division` VALUES (1456, '252115', '滋賀県', '湖南市', 'ｼｶﾞｹﾝ', 'ｺﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1457, '252123', '滋賀県', '高島市', 'ｼｶﾞｹﾝ', 'ﾀｶｼﾏｼ');
INSERT INTO `tb_division` VALUES (1458, '252131', '滋賀県', '東近江市', 'ｼｶﾞｹﾝ', 'ﾋｶﾞｼｵｳﾐｼ');
INSERT INTO `tb_division` VALUES (1459, '252140', '滋賀県', '米原市', 'ｼｶﾞｹﾝ', 'ﾏｲﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1460, '253839', '滋賀県', '日野町', 'ｼｶﾞｹﾝ', 'ﾋﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1461, '253847', '滋賀県', '竜王町', 'ｼｶﾞｹﾝ', 'ﾘﾕｳｵｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1462, '254258', '滋賀県', '愛荘町', 'ｼｶﾞｹﾝ', 'ｱｲｼｮｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1463, '254410', '滋賀県', '豊郷町', 'ｼｶﾞｹﾝ', 'ﾄﾖｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1464, '254428', '滋賀県', '甲良町', 'ｼｶﾞｹﾝ', 'ｺｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1465, '254436', '滋賀県', '多賀町', 'ｼｶﾞｹﾝ', 'ﾀｶﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1466, '260002', '京都府', NULL, 'ｷｮｳﾄﾌ', NULL);
INSERT INTO `tb_division` VALUES (1467, '261009', '京都府', '京都市', 'ｷｮｳﾄﾌ', 'ｷｮｳﾄｼ');
INSERT INTO `tb_division` VALUES (1468, '262013', '京都府', '福知山市', 'ｷｮｳﾄﾌ', 'ﾌｸﾁﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1469, '262021', '京都府', '舞鶴市', 'ｷｮｳﾄﾌ', 'ﾏｲﾂﾞﾙｼ');
INSERT INTO `tb_division` VALUES (1470, '262030', '京都府', '綾部市', 'ｷｮｳﾄﾌ', 'ｱﾔﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1471, '262048', '京都府', '宇治市', 'ｷｮｳﾄﾌ', 'ｳｼﾞｼ');
INSERT INTO `tb_division` VALUES (1472, '262056', '京都府', '宮津市', 'ｷｮｳﾄﾌ', 'ﾐﾔﾂﾞｼ');
INSERT INTO `tb_division` VALUES (1473, '262064', '京都府', '亀岡市', 'ｷｮｳﾄﾌ', 'ｶﾒｵｶｼ');
INSERT INTO `tb_division` VALUES (1474, '262072', '京都府', '城陽市', 'ｷｮｳﾄﾌ', 'ｼﾞｮｳﾖｳｼ');
INSERT INTO `tb_division` VALUES (1475, '262081', '京都府', '向日市', 'ｷｮｳﾄﾌ', 'ﾑｺｳｼ');
INSERT INTO `tb_division` VALUES (1476, '262099', '京都府', '長岡京市', 'ｷｮｳﾄﾌ', 'ﾅｶﾞｵｶｷｮｳｼ');
INSERT INTO `tb_division` VALUES (1477, '262102', '京都府', '八幡市', 'ｷｮｳﾄﾌ', 'ﾔﾜﾀｼ');
INSERT INTO `tb_division` VALUES (1478, '262111', '京都府', '京田辺市', 'ｷｮｳﾄﾌ', 'ｷｮｳﾀﾅﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1479, '262129', '京都府', '京丹後市', 'ｷｮｳﾄﾌ', 'ｷｮｳﾀﾝｺﾞｼ');
INSERT INTO `tb_division` VALUES (1480, '262137', '京都府', '南丹市', 'ｷｮｳﾄﾌ', 'ﾅﾝﾀﾝｼ');
INSERT INTO `tb_division` VALUES (1481, '262145', '京都府', '木津川市', 'ｷｮｳﾄﾌ', 'ｷﾂﾞｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1482, '263036', '京都府', '大山崎町', 'ｷｮｳﾄﾌ', 'ｵｵﾔﾏｻﾞｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1483, '263222', '京都府', '久御山町', 'ｷｮｳﾄﾌ', 'ｸﾐﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1484, '263435', '京都府', '井手町', 'ｷｮｳﾄﾌ', 'ｲﾃﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1485, '263443', '京都府', '宇治田原町', 'ｷｮｳﾄﾌ', 'ｳｼﾞﾀﾜﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1486, '263648', '京都府', '笠置町', 'ｷｮｳﾄﾌ', 'ｶｻｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1487, '263656', '京都府', '和束町', 'ｷｮｳﾄﾌ', 'ﾜﾂﾞｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1488, '263664', '京都府', '精華町', 'ｷｮｳﾄﾌ', 'ｾｲｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1489, '263672', '京都府', '南山城村', 'ｷｮｳﾄﾌ', 'ﾐﾅﾐﾔﾏｼﾛﾑﾗ');
INSERT INTO `tb_division` VALUES (1490, '264075', '京都府', '京丹波町', 'ｷｮｳﾄﾌ', 'ｷｮｳﾀﾝﾊﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1491, '264636', '京都府', '伊根町', 'ｷｮｳﾄﾌ', 'ｲﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (1492, '264652', '京都府', '与謝野町', 'ｷｮｳﾄﾌ', 'ﾖｻﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1493, '270008', '大阪府', NULL, 'ｵｵｻｶﾌ', NULL);
INSERT INTO `tb_division` VALUES (1494, '271004', '大阪府', '大阪市', 'ｵｵｻｶﾌ', 'ｵｵｻｶｼ');
INSERT INTO `tb_division` VALUES (1495, '271403', '大阪府', '堺市', 'ｵｵｻｶﾌ', 'ｻｶｲｼ');
INSERT INTO `tb_division` VALUES (1496, '272027', '大阪府', '岸和田市', 'ｵｵｻｶﾌ', 'ｷｼﾜﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1497, '272035', '大阪府', '豊中市', 'ｵｵｻｶﾌ', 'ﾄﾖﾅｶｼ');
INSERT INTO `tb_division` VALUES (1498, '272043', '大阪府', '池田市', 'ｵｵｻｶﾌ', 'ｲｹﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1499, '272051', '大阪府', '吹田市', 'ｵｵｻｶﾌ', 'ｽｲﾀｼ');
INSERT INTO `tb_division` VALUES (1500, '272060', '大阪府', '泉大津市', 'ｵｵｻｶﾌ', 'ｲｽﾞﾐｵｵﾂｼ');
INSERT INTO `tb_division` VALUES (1501, '272078', '大阪府', '高槻市', 'ｵｵｻｶﾌ', 'ﾀｶﾂｷｼ');
INSERT INTO `tb_division` VALUES (1502, '272086', '大阪府', '貝塚市', 'ｵｵｻｶﾌ', 'ｶｲﾂﾞｶｼ');
INSERT INTO `tb_division` VALUES (1503, '272094', '大阪府', '守口市', 'ｵｵｻｶﾌ', 'ﾓﾘｸﾞﾁｼ');
INSERT INTO `tb_division` VALUES (1504, '272108', '大阪府', '枚方市', 'ｵｵｻｶﾌ', 'ﾋﾗｶﾀｼ');
INSERT INTO `tb_division` VALUES (1505, '272116', '大阪府', '茨木市', 'ｵｵｻｶﾌ', 'ｲﾊﾞﾗｷｼ');
INSERT INTO `tb_division` VALUES (1506, '272124', '大阪府', '八尾市', 'ｵｵｻｶﾌ', 'ﾔｵｼ');
INSERT INTO `tb_division` VALUES (1507, '272132', '大阪府', '泉佐野市', 'ｵｵｻｶﾌ', 'ｲｽﾞﾐｻﾉｼ');
INSERT INTO `tb_division` VALUES (1508, '272141', '大阪府', '富田林市', 'ｵｵｻｶﾌ', 'ﾄﾝﾀﾞﾊﾞﾔｼｼ');
INSERT INTO `tb_division` VALUES (1509, '272159', '大阪府', '寝屋川市', 'ｵｵｻｶﾌ', 'ﾈﾔｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1510, '272167', '大阪府', '河内長野市', 'ｵｵｻｶﾌ', 'ｶﾜﾁﾅｶﾞﾉｼ');
INSERT INTO `tb_division` VALUES (1511, '272175', '大阪府', '松原市', 'ｵｵｻｶﾌ', 'ﾏﾂﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1512, '272183', '大阪府', '大東市', 'ｵｵｻｶﾌ', 'ﾀﾞｲﾄｳｼ');
INSERT INTO `tb_division` VALUES (1513, '272191', '大阪府', '和泉市', 'ｵｵｻｶﾌ', 'ｲｽﾞﾐｼ');
INSERT INTO `tb_division` VALUES (1514, '272205', '大阪府', '箕面市', 'ｵｵｻｶﾌ', 'ﾐﾉｵｼ');
INSERT INTO `tb_division` VALUES (1515, '272213', '大阪府', '柏原市', 'ｵｵｻｶﾌ', 'ｶｼﾜﾗｼ');
INSERT INTO `tb_division` VALUES (1516, '272221', '大阪府', '羽曳野市', 'ｵｵｻｶﾌ', 'ﾊﾋﾞｷﾉｼ');
INSERT INTO `tb_division` VALUES (1517, '272230', '大阪府', '門真市', 'ｵｵｻｶﾌ', 'ｶﾄﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1518, '272248', '大阪府', '摂津市', 'ｵｵｻｶﾌ', 'ｾｯﾂｼ');
INSERT INTO `tb_division` VALUES (1519, '272256', '大阪府', '高石市', 'ｵｵｻｶﾌ', 'ﾀｶｲｼｼ');
INSERT INTO `tb_division` VALUES (1520, '272264', '大阪府', '藤井寺市', 'ｵｵｻｶﾌ', 'ﾌｼﾞｲﾃﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1521, '272272', '大阪府', '東大阪市', 'ｵｵｻｶﾌ', 'ﾋｶﾞｼｵｵｻｶｼ');
INSERT INTO `tb_division` VALUES (1522, '272281', '大阪府', '泉南市', 'ｵｵｻｶﾌ', 'ｾﾝﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1523, '272299', '大阪府', '四條畷市', 'ｵｵｻｶﾌ', 'ｼｼﾞﾖｳﾅﾜﾃｼ');
INSERT INTO `tb_division` VALUES (1524, '272302', '大阪府', '交野市', 'ｵｵｻｶﾌ', 'ｶﾀﾉｼ');
INSERT INTO `tb_division` VALUES (1525, '272311', '大阪府', '大阪狭山市', 'ｵｵｻｶﾌ', 'ｵｵｻｶｻﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1526, '272329', '大阪府', '阪南市', 'ｵｵｻｶﾌ', 'ﾊﾝﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1527, '273015', '大阪府', '島本町', 'ｵｵｻｶﾌ', 'ｼﾏﾓﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1528, '273210', '大阪府', '豊能町', 'ｵｵｻｶﾌ', 'ﾄﾖﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1529, '273228', '大阪府', '能勢町', 'ｵｵｻｶﾌ', 'ﾉｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (1530, '273414', '大阪府', '忠岡町', 'ｵｵｻｶﾌ', 'ﾀﾀﾞｵｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1531, '273619', '大阪府', '熊取町', 'ｵｵｻｶﾌ', 'ｸﾏﾄﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1532, '273627', '大阪府', '田尻町', 'ｵｵｻｶﾌ', 'ﾀｼﾞﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1533, '273660', '大阪府', '岬町', 'ｵｵｻｶﾌ', 'ﾐｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1534, '273813', '大阪府', '太子町', 'ｵｵｻｶﾌ', 'ﾀｲｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (1535, '273821', '大阪府', '河南町', 'ｵｵｻｶﾌ', 'ｶﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1536, '273830', '大阪府', '千早赤阪村', 'ｵｵｻｶﾌ', 'ﾁﾊﾔｱｶｻｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1537, '280003', '兵庫県', NULL, 'ﾋｮｳｺﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1538, '281000', '兵庫県', '神戸市', 'ﾋｮｳｺﾞｹﾝ', 'ｺｳﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1539, '282014', '兵庫県', '姫路市', 'ﾋｮｳｺﾞｹﾝ', 'ﾋﾒｼﾞｼ');
INSERT INTO `tb_division` VALUES (1540, '282022', '兵庫県', '尼崎市', 'ﾋｮｳｺﾞｹﾝ', 'ｱﾏｶﾞｻｷｼ');
INSERT INTO `tb_division` VALUES (1541, '282031', '兵庫県', '明石市', 'ﾋｮｳｺﾞｹﾝ', 'ｱｶｼｼ');
INSERT INTO `tb_division` VALUES (1542, '282049', '兵庫県', '西宮市', 'ﾋｮｳｺﾞｹﾝ', 'ﾆｼﾉﾐﾔｼ');
INSERT INTO `tb_division` VALUES (1543, '282057', '兵庫県', '洲本市', 'ﾋｮｳｺﾞｹﾝ', 'ｽﾓﾄｼ');
INSERT INTO `tb_division` VALUES (1544, '282065', '兵庫県', '芦屋市', 'ﾋｮｳｺﾞｹﾝ', 'ｱｼﾔｼ');
INSERT INTO `tb_division` VALUES (1545, '282073', '兵庫県', '伊丹市', 'ﾋｮｳｺﾞｹﾝ', 'ｲﾀﾐｼ');
INSERT INTO `tb_division` VALUES (1546, '282081', '兵庫県', '相生市', 'ﾋｮｳｺﾞｹﾝ', 'ｱｲｵｲｼ');
INSERT INTO `tb_division` VALUES (1547, '282090', '兵庫県', '豊岡市', 'ﾋｮｳｺﾞｹﾝ', 'ﾄﾖｵｶｼ');
INSERT INTO `tb_division` VALUES (1548, '282103', '兵庫県', '加古川市', 'ﾋｮｳｺﾞｹﾝ', 'ｶｺｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1549, '282120', '兵庫県', '赤穂市', 'ﾋｮｳｺﾞｹﾝ', 'ｱｺｳｼ');
INSERT INTO `tb_division` VALUES (1550, '282138', '兵庫県', '西脇市', 'ﾋｮｳｺﾞｹﾝ', 'ﾆｼﾜｷｼ');
INSERT INTO `tb_division` VALUES (1551, '282146', '兵庫県', '宝塚市', 'ﾋｮｳｺﾞｹﾝ', 'ﾀｶﾗﾂﾞｶｼ');
INSERT INTO `tb_division` VALUES (1552, '282154', '兵庫県', '三木市', 'ﾋｮｳｺﾞｹﾝ', 'ﾐｷｼ');
INSERT INTO `tb_division` VALUES (1553, '282162', '兵庫県', '高砂市', 'ﾋｮｳｺﾞｹﾝ', 'ﾀｶｻｺﾞｼ');
INSERT INTO `tb_division` VALUES (1554, '282171', '兵庫県', '川西市', 'ﾋｮｳｺﾞｹﾝ', 'ｶﾜﾆｼｼ');
INSERT INTO `tb_division` VALUES (1555, '282189', '兵庫県', '小野市', 'ﾋｮｳｺﾞｹﾝ', 'ｵﾉｼ');
INSERT INTO `tb_division` VALUES (1556, '282197', '兵庫県', '三田市', 'ﾋｮｳｺﾞｹﾝ', 'ｻﾝﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1557, '282201', '兵庫県', '加西市', 'ﾋｮｳｺﾞｹﾝ', 'ｶｻｲｼ');
INSERT INTO `tb_division` VALUES (1558, '282219', '兵庫県', '丹波篠山市', 'ﾋｮｳｺﾞｹﾝ', 'ﾀﾝﾊﾞｻｻﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1559, '282227', '兵庫県', '養父市', 'ﾋｮｳｺﾞｹﾝ', 'ﾔﾌﾞｼ');
INSERT INTO `tb_division` VALUES (1560, '282235', '兵庫県', '丹波市', 'ﾋｮｳｺﾞｹﾝ', 'ﾀﾝﾊﾞｼ');
INSERT INTO `tb_division` VALUES (1561, '282243', '兵庫県', '南あわじ市', 'ﾋｮｳｺﾞｹﾝ', 'ﾐﾅﾐｱﾜｼﾞｼ');
INSERT INTO `tb_division` VALUES (1562, '282251', '兵庫県', '朝来市', 'ﾋｮｳｺﾞｹﾝ', 'ｱｻｺﾞｼ');
INSERT INTO `tb_division` VALUES (1563, '282260', '兵庫県', '淡路市', 'ﾋｮｳｺﾞｹﾝ', 'ｱﾜｼﾞｼ');
INSERT INTO `tb_division` VALUES (1564, '282278', '兵庫県', '宍粟市', 'ﾋｮｳｺﾞｹﾝ', 'ｼｿｳｼ');
INSERT INTO `tb_division` VALUES (1565, '282286', '兵庫県', '加東市', 'ﾋｮｳｺﾞｹﾝ', 'ｶﾄｳｼ');
INSERT INTO `tb_division` VALUES (1566, '282294', '兵庫県', 'たつの市', 'ﾋｮｳｺﾞｹﾝ', 'ﾀﾂﾉｼ');
INSERT INTO `tb_division` VALUES (1567, '283011', '兵庫県', '猪名川町', 'ﾋｮｳｺﾞｹﾝ', 'ｲﾅｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1568, '283657', '兵庫県', '多可町', 'ﾋｮｳｺﾞｹﾝ', 'ﾀｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1569, '283819', '兵庫県', '稲美町', 'ﾋｮｳｺﾞｹﾝ', 'ｲﾅﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1570, '283827', '兵庫県', '播磨町', 'ﾋｮｳｺﾞｹﾝ', 'ﾊﾘﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1571, '284424', '兵庫県', '市川町', 'ﾋｮｳｺﾞｹﾝ', 'ｲﾁｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1572, '284432', '兵庫県', '福崎町', 'ﾋｮｳｺﾞｹﾝ', 'ﾌｸｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1573, '284467', '兵庫県', '神河町', 'ﾋｮｳｺﾞｹﾝ', 'ｶﾐｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1574, '284645', '兵庫県', '太子町', 'ﾋｮｳｺﾞｹﾝ', 'ﾀｲｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (1575, '284815', '兵庫県', '上郡町', 'ﾋｮｳｺﾞｹﾝ', 'ｶﾐｺﾞｵﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1576, '285013', '兵庫県', '佐用町', 'ﾋｮｳｺﾞｹﾝ', 'ｻﾖｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1577, '285854', '兵庫県', '香美町', 'ﾋｮｳｺﾞｹﾝ', 'ｶﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1578, '285862', '兵庫県', '新温泉町', 'ﾋｮｳｺﾞｹﾝ', 'ｼﾝｵﾝｾﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1579, '290009', '奈良県', NULL, 'ﾅﾗｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1580, '292010', '奈良県', '奈良市', 'ﾅﾗｹﾝ', 'ﾅﾗｼ');
INSERT INTO `tb_division` VALUES (1581, '292028', '奈良県', '大和高田市', 'ﾅﾗｹﾝ', 'ﾔﾏﾄﾀｶﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1582, '292036', '奈良県', '大和郡山市', 'ﾅﾗｹﾝ', 'ﾔﾏﾄｺｵﾘﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1583, '292044', '奈良県', '天理市', 'ﾅﾗｹﾝ', 'ﾃﾝﾘｼ');
INSERT INTO `tb_division` VALUES (1584, '292052', '奈良県', '橿原市', 'ﾅﾗｹﾝ', 'ｶｼﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1585, '292061', '奈良県', '桜井市', 'ﾅﾗｹﾝ', 'ｻｸﾗｲｼ');
INSERT INTO `tb_division` VALUES (1586, '292079', '奈良県', '五條市', 'ﾅﾗｹﾝ', 'ｺﾞｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1587, '292087', '奈良県', '御所市', 'ﾅﾗｹﾝ', 'ｺﾞｾｼ');
INSERT INTO `tb_division` VALUES (1588, '292095', '奈良県', '生駒市', 'ﾅﾗｹﾝ', 'ｲｺﾏｼ');
INSERT INTO `tb_division` VALUES (1589, '292109', '奈良県', '香芝市', 'ﾅﾗｹﾝ', 'ｶｼﾊﾞｼ');
INSERT INTO `tb_division` VALUES (1590, '292117', '奈良県', '葛城市', 'ﾅﾗｹﾝ', 'ｶﾂﾗｷﾞｼ');
INSERT INTO `tb_division` VALUES (1591, '292125', '奈良県', '宇陀市', 'ﾅﾗｹﾝ', 'ｳﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1592, '293229', '奈良県', '山添村', 'ﾅﾗｹﾝ', 'ﾔﾏｿﾞｴﾑﾗ');
INSERT INTO `tb_division` VALUES (1593, '293423', '奈良県', '平群町', 'ﾅﾗｹﾝ', 'ﾍｸﾞﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1594, '293431', '奈良県', '三郷町', 'ﾅﾗｹﾝ', 'ｻﾝｺﾞｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1595, '293440', '奈良県', '斑鳩町', 'ﾅﾗｹﾝ', 'ｲｶﾙｶﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1596, '293458', '奈良県', '安堵町', 'ﾅﾗｹﾝ', 'ｱﾝﾄﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1597, '293610', '奈良県', '川西町', 'ﾅﾗｹﾝ', 'ｶﾜﾆｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (1598, '293628', '奈良県', '三宅町', 'ﾅﾗｹﾝ', 'ﾐﾔｹﾁｮｳ');
INSERT INTO `tb_division` VALUES (1599, '293636', '奈良県', '田原本町', 'ﾅﾗｹﾝ', 'ﾀﾜﾗﾓﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1600, '293857', '奈良県', '曽爾村', 'ﾅﾗｹﾝ', 'ｿﾆﾑﾗ');
INSERT INTO `tb_division` VALUES (1601, '293865', '奈良県', '御杖村', 'ﾅﾗｹﾝ', 'ﾐﾂｴﾑﾗ');
INSERT INTO `tb_division` VALUES (1602, '294012', '奈良県', '高取町', 'ﾅﾗｹﾝ', 'ﾀｶﾄﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1603, '294021', '奈良県', '明日香村', 'ﾅﾗｹﾝ', 'ｱｽｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1604, '294241', '奈良県', '上牧町', 'ﾅﾗｹﾝ', 'ｶﾝﾏｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1605, '294250', '奈良県', '王寺町', 'ﾅﾗｹﾝ', 'ｵｳｼﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1606, '294268', '奈良県', '広陵町', 'ﾅﾗｹﾝ', 'ｺｳﾘﾖｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1607, '294276', '奈良県', '河合町', 'ﾅﾗｹﾝ', 'ｶﾜｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1608, '294411', '奈良県', '吉野町', 'ﾅﾗｹﾝ', 'ﾖｼﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1609, '294420', '奈良県', '大淀町', 'ﾅﾗｹﾝ', 'ｵｵﾖﾄﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1610, '294438', '奈良県', '下市町', 'ﾅﾗｹﾝ', 'ｼﾓｲﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1611, '294446', '奈良県', '黒滝村', 'ﾅﾗｹﾝ', 'ｸﾛﾀｷﾑﾗ');
INSERT INTO `tb_division` VALUES (1612, '294462', '奈良県', '天川村', 'ﾅﾗｹﾝ', 'ﾃﾝｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1613, '294471', '奈良県', '野迫川村', 'ﾅﾗｹﾝ', 'ﾉｾｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1614, '294497', '奈良県', '十津川村', 'ﾅﾗｹﾝ', 'ﾄﾂｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1615, '294501', '奈良県', '下北山村', 'ﾅﾗｹﾝ', 'ｼﾓｷﾀﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1616, '294519', '奈良県', '上北山村', 'ﾅﾗｹﾝ', 'ｶﾐｷﾀﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1617, '294527', '奈良県', '川上村', 'ﾅﾗｹﾝ', 'ｶﾜｶﾐﾑﾗ');
INSERT INTO `tb_division` VALUES (1618, '294535', '奈良県', '東吉野村', 'ﾅﾗｹﾝ', 'ﾋｶﾞｼﾖｼﾉﾑﾗ');
INSERT INTO `tb_division` VALUES (1619, '300004', '和歌山県', NULL, 'ﾜｶﾔﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1620, '302015', '和歌山県', '和歌山市', 'ﾜｶﾔﾏｹﾝ', 'ﾜｶﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1621, '302023', '和歌山県', '海南市', 'ﾜｶﾔﾏｹﾝ', 'ｶｲﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1622, '302031', '和歌山県', '橋本市', 'ﾜｶﾔﾏｹﾝ', 'ﾊｼﾓﾄｼ');
INSERT INTO `tb_division` VALUES (1623, '302040', '和歌山県', '有田市', 'ﾜｶﾔﾏｹﾝ', 'ｱﾘﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1624, '302058', '和歌山県', '御坊市', 'ﾜｶﾔﾏｹﾝ', 'ｺﾞﾎﾞｳｼ');
INSERT INTO `tb_division` VALUES (1625, '302066', '和歌山県', '田辺市', 'ﾜｶﾔﾏｹﾝ', 'ﾀﾅﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1626, '302074', '和歌山県', '新宮市', 'ﾜｶﾔﾏｹﾝ', 'ｼﾝｸﾞｳｼ');
INSERT INTO `tb_division` VALUES (1627, '302082', '和歌山県', '紀の川市', 'ﾜｶﾔﾏｹﾝ', 'ｷﾉｶﾜｼ');
INSERT INTO `tb_division` VALUES (1628, '302091', '和歌山県', '岩出市', 'ﾜｶﾔﾏｹﾝ', 'ｲﾜﾃﾞｼ');
INSERT INTO `tb_division` VALUES (1629, '303046', '和歌山県', '紀美野町', 'ﾜｶﾔﾏｹﾝ', 'ｷﾐﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1630, '303411', '和歌山県', 'かつらぎ町', 'ﾜｶﾔﾏｹﾝ', 'ｶﾂﾗｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1631, '303437', '和歌山県', '九度山町', 'ﾜｶﾔﾏｹﾝ', 'ｸﾄﾞﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1632, '303445', '和歌山県', '高野町', 'ﾜｶﾔﾏｹﾝ', 'ｺｳﾔﾁｮｳ');
INSERT INTO `tb_division` VALUES (1633, '303615', '和歌山県', '湯浅町', 'ﾜｶﾔﾏｹﾝ', 'ﾕｱｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1634, '303623', '和歌山県', '広川町', 'ﾜｶﾔﾏｹﾝ', 'ﾋﾛｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1635, '303666', '和歌山県', '有田川町', 'ﾜｶﾔﾏｹﾝ', 'ｱﾘﾀﾞｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1636, '303810', '和歌山県', '美浜町', 'ﾜｶﾔﾏｹﾝ', 'ﾐﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1637, '303828', '和歌山県', '日高町', 'ﾜｶﾔﾏｹﾝ', 'ﾋﾀﾞｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1638, '303836', '和歌山県', '由良町', 'ﾜｶﾔﾏｹﾝ', 'ﾕﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1639, '303909', '和歌山県', '印南町', 'ﾜｶﾔﾏｹﾝ', 'ｲﾅﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1640, '303917', '和歌山県', 'みなべ町', 'ﾜｶﾔﾏｹﾝ', 'ﾐﾅﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1641, '303925', '和歌山県', '日高川町', 'ﾜｶﾔﾏｹﾝ', 'ﾋﾀﾞｶｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1642, '304018', '和歌山県', '白浜町', 'ﾜｶﾔﾏｹﾝ', 'ｼﾗﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1643, '304042', '和歌山県', '上富田町', 'ﾜｶﾔﾏｹﾝ', 'ｶﾐﾄﾝﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1644, '304069', '和歌山県', 'すさみ町', 'ﾜｶﾔﾏｹﾝ', 'ｽｻﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1645, '304212', '和歌山県', '那智勝浦町', 'ﾜｶﾔﾏｹﾝ', 'ﾅﾁｶﾂｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1646, '304221', '和歌山県', '太地町', 'ﾜｶﾔﾏｹﾝ', 'ﾀｲｼﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1647, '304247', '和歌山県', '古座川町', 'ﾜｶﾔﾏｹﾝ', 'ｺｻﾞｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1648, '304271', '和歌山県', '北山村', 'ﾜｶﾔﾏｹﾝ', 'ｷﾀﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1649, '304280', '和歌山県', '串本町', 'ﾜｶﾔﾏｹﾝ', 'ｸｼﾓﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1650, '310000', '鳥取県', NULL, 'ﾄｯﾄﾘｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1651, '312011', '鳥取県', '鳥取市', 'ﾄｯﾄﾘｹﾝ', 'ﾄｯﾄﾘｼ');
INSERT INTO `tb_division` VALUES (1652, '312029', '鳥取県', '米子市', 'ﾄｯﾄﾘｹﾝ', 'ﾖﾅｺﾞｼ');
INSERT INTO `tb_division` VALUES (1653, '312037', '鳥取県', '倉吉市', 'ﾄｯﾄﾘｹﾝ', 'ｸﾗﾖｼｼ');
INSERT INTO `tb_division` VALUES (1654, '312045', '鳥取県', '境港市', 'ﾄｯﾄﾘｹﾝ', 'ｻｶｲﾐﾅﾄｼ');
INSERT INTO `tb_division` VALUES (1655, '313025', '鳥取県', '岩美町', 'ﾄｯﾄﾘｹﾝ', 'ｲﾜﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1656, '313254', '鳥取県', '若桜町', 'ﾄｯﾄﾘｹﾝ', 'ﾜｶｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1657, '313289', '鳥取県', '智頭町', 'ﾄｯﾄﾘｹﾝ', 'ﾁﾂﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1658, '313297', '鳥取県', '八頭町', 'ﾄｯﾄﾘｹﾝ', 'ﾔｽﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1659, '313645', '鳥取県', '三朝町', 'ﾄｯﾄﾘｹﾝ', 'ﾐｻｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1660, '313700', '鳥取県', '湯梨浜町', 'ﾄｯﾄﾘｹﾝ', 'ﾕﾘﾊﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1661, '313718', '鳥取県', '琴浦町', 'ﾄｯﾄﾘｹﾝ', 'ｺﾄｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1662, '313726', '鳥取県', '北栄町', 'ﾄｯﾄﾘｹﾝ', 'ﾎｸｴｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1663, '313840', '鳥取県', '日吉津村', 'ﾄｯﾄﾘｹﾝ', 'ﾋｴﾂﾞｿﾝ');
INSERT INTO `tb_division` VALUES (1664, '313866', '鳥取県', '大山町', 'ﾄｯﾄﾘｹﾝ', 'ﾀﾞｲｾﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1665, '313891', '鳥取県', '南部町', 'ﾄｯﾄﾘｹﾝ', 'ﾅﾝﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1666, '313904', '鳥取県', '伯耆町', 'ﾄｯﾄﾘｹﾝ', 'ﾎｳｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1667, '314013', '鳥取県', '日南町', 'ﾄｯﾄﾘｹﾝ', 'ﾆﾁﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1668, '314021', '鳥取県', '日野町', 'ﾄｯﾄﾘｹﾝ', 'ﾋﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1669, '314030', '鳥取県', '江府町', 'ﾄｯﾄﾘｹﾝ', 'ｺｳﾌﾁｮｳ');
INSERT INTO `tb_division` VALUES (1670, '320005', '島根県', NULL, 'ｼﾏﾈｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1671, '322016', '島根県', '松江市', 'ｼﾏﾈｹﾝ', 'ﾏﾂｴｼ');
INSERT INTO `tb_division` VALUES (1672, '322024', '島根県', '浜田市', 'ｼﾏﾈｹﾝ', 'ﾊﾏﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1673, '322032', '島根県', '出雲市', 'ｼﾏﾈｹﾝ', 'ｲｽﾞﾓｼ');
INSERT INTO `tb_division` VALUES (1674, '322041', '島根県', '益田市', 'ｼﾏﾈｹﾝ', 'ﾏｽﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1675, '322059', '島根県', '大田市', 'ｼﾏﾈｹﾝ', 'ｵｵﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1676, '322067', '島根県', '安来市', 'ｼﾏﾈｹﾝ', 'ﾔｽｷﾞｼ');
INSERT INTO `tb_division` VALUES (1677, '322075', '島根県', '江津市', 'ｼﾏﾈｹﾝ', 'ｺﾞｳﾂｼ');
INSERT INTO `tb_division` VALUES (1678, '322091', '島根県', '雲南市', 'ｼﾏﾈｹﾝ', 'ｳﾝﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1679, '323438', '島根県', '奥出雲町', 'ｼﾏﾈｹﾝ', 'ｵｸｲｽﾞﾓﾁｮｳ');
INSERT INTO `tb_division` VALUES (1680, '323861', '島根県', '飯南町', 'ｼﾏﾈｹﾝ', 'ｲｲﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1681, '324418', '島根県', '川本町', 'ｼﾏﾈｹﾝ', 'ｶﾜﾓﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (1682, '324485', '島根県', '美郷町', 'ｼﾏﾈｹﾝ', 'ﾐｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1683, '324493', '島根県', '邑南町', 'ｼﾏﾈｹﾝ', 'ｵｵﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1684, '325015', '島根県', '津和野町', 'ｼﾏﾈｹﾝ', 'ﾂﾜﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1685, '325058', '島根県', '吉賀町', 'ｼﾏﾈｹﾝ', 'ﾖｼｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1686, '325252', '島根県', '海士町', 'ｼﾏﾈｹﾝ', 'ｱﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1687, '325261', '島根県', '西ノ島町', 'ｼﾏﾈｹﾝ', 'ﾆｼﾉｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1688, '325279', '島根県', '知夫村', 'ｼﾏﾈｹﾝ', 'ﾁﾌﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1689, '325287', '島根県', '隠岐の島町', 'ｼﾏﾈｹﾝ', 'ｵｷﾉｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1690, '330001', '岡山県', NULL, 'ｵｶﾔﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1691, '331007', '岡山県', '岡山市', 'ｵｶﾔﾏｹﾝ', 'ｵｶﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1692, '332020', '岡山県', '倉敷市', 'ｵｶﾔﾏｹﾝ', 'ｸﾗｼｷｼ');
INSERT INTO `tb_division` VALUES (1693, '332038', '岡山県', '津山市', 'ｵｶﾔﾏｹﾝ', 'ﾂﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1694, '332046', '岡山県', '玉野市', 'ｵｶﾔﾏｹﾝ', 'ﾀﾏﾉｼ');
INSERT INTO `tb_division` VALUES (1695, '332054', '岡山県', '笠岡市', 'ｵｶﾔﾏｹﾝ', 'ｶｻｵｶｼ');
INSERT INTO `tb_division` VALUES (1696, '332071', '岡山県', '井原市', 'ｵｶﾔﾏｹﾝ', 'ｲﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1697, '332089', '岡山県', '総社市', 'ｵｶﾔﾏｹﾝ', 'ｿｳｼﾞﾔｼ');
INSERT INTO `tb_division` VALUES (1698, '332097', '岡山県', '高梁市', 'ｵｶﾔﾏｹﾝ', 'ﾀｶﾊｼｼ');
INSERT INTO `tb_division` VALUES (1699, '332101', '岡山県', '新見市', 'ｵｶﾔﾏｹﾝ', 'ﾆｲﾐｼ');
INSERT INTO `tb_division` VALUES (1700, '332119', '岡山県', '備前市', 'ｵｶﾔﾏｹﾝ', 'ﾋﾞｾﾞﾝｼ');
INSERT INTO `tb_division` VALUES (1701, '332127', '岡山県', '瀬戸内市', 'ｵｶﾔﾏｹﾝ', 'ｾﾄｳﾁｼ');
INSERT INTO `tb_division` VALUES (1702, '332135', '岡山県', '赤磐市', 'ｵｶﾔﾏｹﾝ', 'ｱｶｲﾜｼ');
INSERT INTO `tb_division` VALUES (1703, '332143', '岡山県', '真庭市', 'ｵｶﾔﾏｹﾝ', 'ﾏﾆﾜｼ');
INSERT INTO `tb_division` VALUES (1704, '332151', '岡山県', '美作市', 'ｵｶﾔﾏｹﾝ', 'ﾐﾏｻｶｼ');
INSERT INTO `tb_division` VALUES (1705, '332160', '岡山県', '浅口市', 'ｵｶﾔﾏｹﾝ', 'ｱｻｸﾁｼ');
INSERT INTO `tb_division` VALUES (1706, '333468', '岡山県', '和気町', 'ｵｶﾔﾏｹﾝ', 'ﾜｹﾁｮｳ');
INSERT INTO `tb_division` VALUES (1707, '334235', '岡山県', '早島町', 'ｵｶﾔﾏｹﾝ', 'ﾊﾔｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1708, '334456', '岡山県', '里庄町', 'ｵｶﾔﾏｹﾝ', 'ｻﾄｼｮｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1709, '334618', '岡山県', '矢掛町', 'ｵｶﾔﾏｹﾝ', 'ﾔｶｹﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1710, '335860', '岡山県', '新庄村', 'ｵｶﾔﾏｹﾝ', 'ｼﾝｼﾞﾖｳｿﾝ');
INSERT INTO `tb_division` VALUES (1711, '336068', '岡山県', '鏡野町', 'ｵｶﾔﾏｹﾝ', 'ｶｶﾞﾐﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1712, '336220', '岡山県', '勝央町', 'ｵｶﾔﾏｹﾝ', 'ｼｮｳｵｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1713, '336238', '岡山県', '奈義町', 'ｵｶﾔﾏｹﾝ', 'ﾅｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1714, '336432', '岡山県', '西粟倉村', 'ｵｶﾔﾏｹﾝ', 'ﾆｼｱﾜｸﾗｿﾝ');
INSERT INTO `tb_division` VALUES (1715, '336637', '岡山県', '久米南町', 'ｵｶﾔﾏｹﾝ', 'ｸﾒﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1716, '336661', '岡山県', '美咲町', 'ｵｶﾔﾏｹﾝ', 'ﾐｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1717, '336815', '岡山県', '吉備中央町', 'ｵｶﾔﾏｹﾝ', 'ｷﾋﾞﾁｭｳｵｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1718, '340006', '広島県', NULL, 'ﾋﾛｼﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1719, '341002', '広島県', '広島市', 'ﾋﾛｼﾏｹﾝ', 'ﾋﾛｼﾏｼ');
INSERT INTO `tb_division` VALUES (1720, '342025', '広島県', '呉市', 'ﾋﾛｼﾏｹﾝ', 'ｸﾚｼ');
INSERT INTO `tb_division` VALUES (1721, '342033', '広島県', '竹原市', 'ﾋﾛｼﾏｹﾝ', 'ﾀｹﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1722, '342041', '広島県', '三原市', 'ﾋﾛｼﾏｹﾝ', 'ﾐﾊﾗｼ');
INSERT INTO `tb_division` VALUES (1723, '342050', '広島県', '尾道市', 'ﾋﾛｼﾏｹﾝ', 'ｵﾉﾐﾁｼ');
INSERT INTO `tb_division` VALUES (1724, '342076', '広島県', '福山市', 'ﾋﾛｼﾏｹﾝ', 'ﾌｸﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1725, '342084', '広島県', '府中市', 'ﾋﾛｼﾏｹﾝ', 'ﾌﾁｭｳｼ');
INSERT INTO `tb_division` VALUES (1726, '342092', '広島県', '三次市', 'ﾋﾛｼﾏｹﾝ', 'ﾐﾖｼｼ');
INSERT INTO `tb_division` VALUES (1727, '342106', '広島県', '庄原市', 'ﾋﾛｼﾏｹﾝ', 'ｼｮｳﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1728, '342114', '広島県', '大竹市', 'ﾋﾛｼﾏｹﾝ', 'ｵｵﾀｹｼ');
INSERT INTO `tb_division` VALUES (1729, '342122', '広島県', '東広島市', 'ﾋﾛｼﾏｹﾝ', 'ﾋｶﾞｼﾋﾛｼﾏｼ');
INSERT INTO `tb_division` VALUES (1730, '342131', '広島県', '廿日市市', 'ﾋﾛｼﾏｹﾝ', 'ﾊﾂｶｲﾁｼ');
INSERT INTO `tb_division` VALUES (1731, '342149', '広島県', '安芸高田市', 'ﾋﾛｼﾏｹﾝ', 'ｱｷﾀｶﾀｼ');
INSERT INTO `tb_division` VALUES (1732, '342157', '広島県', '江田島市', 'ﾋﾛｼﾏｹﾝ', 'ｴﾀｼﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1733, '343021', '広島県', '府中町', 'ﾋﾛｼﾏｹﾝ', 'ﾌﾁｭｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1734, '343048', '広島県', '海田町', 'ﾋﾛｼﾏｹﾝ', 'ｶｲﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1735, '343072', '広島県', '熊野町', 'ﾋﾛｼﾏｹﾝ', 'ｸﾏﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1736, '343099', '広島県', '坂町', 'ﾋﾛｼﾏｹﾝ', 'ｻｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1737, '343684', '広島県', '安芸太田町', 'ﾋﾛｼﾏｹﾝ', 'ｱｷｵｵﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1738, '343692', '広島県', '北広島町', 'ﾋﾛｼﾏｹﾝ', 'ｷﾀﾋﾛｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1739, '344311', '広島県', '大崎上島町', 'ﾋﾛｼﾏｹﾝ', 'ｵｵｻｷｶﾐｼﾞﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1740, '344621', '広島県', '世羅町', 'ﾋﾛｼﾏｹﾝ', 'ｾﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1741, '345458', '広島県', '神石高原町', 'ﾋﾛｼﾏｹﾝ', 'ｼﾞﾝｾｷｺｳｹﾞﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1742, '350001', '山口県', NULL, 'ﾔﾏｸﾞﾁｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1743, '352012', '山口県', '下関市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｼﾓﾉｾｷｼ');
INSERT INTO `tb_division` VALUES (1744, '352021', '山口県', '宇部市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｳﾍﾞｼ');
INSERT INTO `tb_division` VALUES (1745, '352039', '山口県', '山口市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾔﾏｸﾞﾁｼ');
INSERT INTO `tb_division` VALUES (1746, '352047', '山口県', '萩市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾊｷﾞｼ');
INSERT INTO `tb_division` VALUES (1747, '352063', '山口県', '防府市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾎｳﾌｼ');
INSERT INTO `tb_division` VALUES (1748, '352071', '山口県', '下松市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｸﾀﾞﾏﾂｼ');
INSERT INTO `tb_division` VALUES (1749, '352080', '山口県', '岩国市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｲﾜｸﾆｼ');
INSERT INTO `tb_division` VALUES (1750, '352101', '山口県', '光市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾋｶﾘｼ');
INSERT INTO `tb_division` VALUES (1751, '352110', '山口県', '長門市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾅｶﾞﾄｼ');
INSERT INTO `tb_division` VALUES (1752, '352128', '山口県', '柳井市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾔﾅｲｼ');
INSERT INTO `tb_division` VALUES (1753, '352136', '山口県', '美祢市', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾐﾈｼ');
INSERT INTO `tb_division` VALUES (1754, '352152', '山口県', '周南市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｼｭｳﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1755, '352161', '山口県', '山陽小野田市', 'ﾔﾏｸﾞﾁｹﾝ', 'ｻﾝﾖｳｵﾉﾀﾞｼ');
INSERT INTO `tb_division` VALUES (1756, '353051', '山口県', '周防大島町', 'ﾔﾏｸﾞﾁｹﾝ', 'ｽｵｳｵｵｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1757, '353213', '山口県', '和木町', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾜｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1758, '353418', '山口県', '上関町', 'ﾔﾏｸﾞﾁｹﾝ', 'ｶﾐﾉｾｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1759, '353434', '山口県', '田布施町', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾀﾌﾞｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (1760, '353442', '山口県', '平生町', 'ﾔﾏｸﾞﾁｹﾝ', 'ﾋﾗｵﾁｮｳ');
INSERT INTO `tb_division` VALUES (1761, '355020', '山口県', '阿武町', 'ﾔﾏｸﾞﾁｹﾝ', 'ｱﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1762, '360007', '徳島県', NULL, 'ﾄｸｼﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1763, '362018', '徳島県', '徳島市', 'ﾄｸｼﾏｹﾝ', 'ﾄｸｼﾏｼ');
INSERT INTO `tb_division` VALUES (1764, '362026', '徳島県', '鳴門市', 'ﾄｸｼﾏｹﾝ', 'ﾅﾙﾄｼ');
INSERT INTO `tb_division` VALUES (1765, '362034', '徳島県', '小松島市', 'ﾄｸｼﾏｹﾝ', 'ｺﾏﾂｼﾏｼ');
INSERT INTO `tb_division` VALUES (1766, '362042', '徳島県', '阿南市', 'ﾄｸｼﾏｹﾝ', 'ｱﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1767, '362051', '徳島県', '吉野川市', 'ﾄｸｼﾏｹﾝ', 'ﾖｼﾉｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1768, '362069', '徳島県', '阿波市', 'ﾄｸｼﾏｹﾝ', 'ｱﾜｼ');
INSERT INTO `tb_division` VALUES (1769, '362077', '徳島県', '美馬市', 'ﾄｸｼﾏｹﾝ', 'ﾐﾏｼ');
INSERT INTO `tb_division` VALUES (1770, '362085', '徳島県', '三好市', 'ﾄｸｼﾏｹﾝ', 'ﾐﾖｼｼ');
INSERT INTO `tb_division` VALUES (1771, '363014', '徳島県', '勝浦町', 'ﾄｸｼﾏｹﾝ', 'ｶﾂｳﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1772, '363022', '徳島県', '上勝町', 'ﾄｸｼﾏｹﾝ', 'ｶﾐｶﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (1773, '363219', '徳島県', '佐那河内村', 'ﾄｸｼﾏｹﾝ', 'ｻﾅｺﾞｳﾁｿﾝ');
INSERT INTO `tb_division` VALUES (1774, '363413', '徳島県', '石井町', 'ﾄｸｼﾏｹﾝ', 'ｲｼｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1775, '363421', '徳島県', '神山町', 'ﾄｸｼﾏｹﾝ', 'ｶﾐﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1776, '363685', '徳島県', '那賀町', 'ﾄｸｼﾏｹﾝ', 'ﾅｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1777, '363839', '徳島県', '牟岐町', 'ﾄｸｼﾏｹﾝ', 'ﾑｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1778, '363871', '徳島県', '美波町', 'ﾄｸｼﾏｹﾝ', 'ﾐﾅﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1779, '363880', '徳島県', '海陽町', 'ﾄｸｼﾏｹﾝ', 'ｶｲﾖｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1780, '364011', '徳島県', '松茂町', 'ﾄｸｼﾏｹﾝ', 'ﾏﾂｼｹﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1781, '364029', '徳島県', '北島町', 'ﾄｸｼﾏｹﾝ', 'ｷﾀｼﾞﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1782, '364037', '徳島県', '藍住町', 'ﾄｸｼﾏｹﾝ', 'ｱｲｽﾞﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1783, '364045', '徳島県', '板野町', 'ﾄｸｼﾏｹﾝ', 'ｲﾀﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1784, '364053', '徳島県', '上板町', 'ﾄｸｼﾏｹﾝ', 'ｶﾐｲﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1785, '364681', '徳島県', 'つるぎ町', 'ﾄｸｼﾏｹﾝ', 'ﾂﾙｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1786, '364894', '徳島県', '東みよし町', 'ﾄｸｼﾏｹﾝ', 'ﾋｶﾞｼﾐﾖｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (1787, '370002', '香川県', NULL, 'ｶｶﾞﾜｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1788, '372013', '香川県', '高松市', 'ｶｶﾞﾜｹﾝ', 'ﾀｶﾏﾂｼ');
INSERT INTO `tb_division` VALUES (1789, '372021', '香川県', '丸亀市', 'ｶｶﾞﾜｹﾝ', 'ﾏﾙｶﾞﾒｼ');
INSERT INTO `tb_division` VALUES (1790, '372030', '香川県', '坂出市', 'ｶｶﾞﾜｹﾝ', 'ｻｶｲﾃﾞｼ');
INSERT INTO `tb_division` VALUES (1791, '372048', '香川県', '善通寺市', 'ｶｶﾞﾜｹﾝ', 'ｾﾞﾝﾂｳｼﾞｼ');
INSERT INTO `tb_division` VALUES (1792, '372056', '香川県', '観音寺市', 'ｶｶﾞﾜｹﾝ', 'ｶﾝｵﾝｼﾞｼ');
INSERT INTO `tb_division` VALUES (1793, '372064', '香川県', 'さぬき市', 'ｶｶﾞﾜｹﾝ', 'ｻﾇｷｼ');
INSERT INTO `tb_division` VALUES (1794, '372072', '香川県', '東かがわ市', 'ｶｶﾞﾜｹﾝ', 'ﾋｶﾞｼｶｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1795, '372081', '香川県', '三豊市', 'ｶｶﾞﾜｹﾝ', 'ﾐﾄﾖｼ');
INSERT INTO `tb_division` VALUES (1796, '373222', '香川県', '土庄町', 'ｶｶﾞﾜｹﾝ', 'ﾄﾉｼｮｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1797, '373249', '香川県', '小豆島町', 'ｶｶﾞﾜｹﾝ', 'ｼｮｳﾄﾞｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1798, '373419', '香川県', '三木町', 'ｶｶﾞﾜｹﾝ', 'ﾐｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1799, '373648', '香川県', '直島町', 'ｶｶﾞﾜｹﾝ', 'ﾅｵｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1800, '373869', '香川県', '宇多津町', 'ｶｶﾞﾜｹﾝ', 'ｳﾀﾂﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1801, '373877', '香川県', '綾川町', 'ｶｶﾞﾜｹﾝ', 'ｱﾔｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1802, '374032', '香川県', '琴平町', 'ｶｶﾞﾜｹﾝ', 'ｺﾄﾋﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1803, '374041', '香川県', '多度津町', 'ｶｶﾞﾜｹﾝ', 'ﾀﾄﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (1804, '374067', '香川県', 'まんのう町', 'ｶｶﾞﾜｹﾝ', 'ﾏﾝﾉｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1805, '380008', '愛媛県', NULL, 'ｴﾋﾒｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1806, '382019', '愛媛県', '松山市', 'ｴﾋﾒｹﾝ', 'ﾏﾂﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1807, '382027', '愛媛県', '今治市', 'ｴﾋﾒｹﾝ', 'ｲﾏﾊﾞﾘｼ');
INSERT INTO `tb_division` VALUES (1808, '382035', '愛媛県', '宇和島市', 'ｴﾋﾒｹﾝ', 'ｳﾜｼﾞﾏｼ');
INSERT INTO `tb_division` VALUES (1809, '382043', '愛媛県', '八幡浜市', 'ｴﾋﾒｹﾝ', 'ﾔﾜﾀﾊﾏｼ');
INSERT INTO `tb_division` VALUES (1810, '382051', '愛媛県', '新居浜市', 'ｴﾋﾒｹﾝ', 'ﾆｲﾊﾏｼ');
INSERT INTO `tb_division` VALUES (1811, '382060', '愛媛県', '西条市', 'ｴﾋﾒｹﾝ', 'ｻｲｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1812, '382078', '愛媛県', '大洲市', 'ｴﾋﾒｹﾝ', 'ｵｵｽﾞｼ');
INSERT INTO `tb_division` VALUES (1813, '382108', '愛媛県', '伊予市', 'ｴﾋﾒｹﾝ', 'ｲﾖｼ');
INSERT INTO `tb_division` VALUES (1814, '382132', '愛媛県', '四国中央市', 'ｴﾋﾒｹﾝ', 'ｼｺｸﾁｭｳｵｳｼ');
INSERT INTO `tb_division` VALUES (1815, '382141', '愛媛県', '西予市', 'ｴﾋﾒｹﾝ', 'ｾｲﾖｼ');
INSERT INTO `tb_division` VALUES (1816, '382159', '愛媛県', '東温市', 'ｴﾋﾒｹﾝ', 'ﾄｳｵﾝｼ');
INSERT INTO `tb_division` VALUES (1817, '383562', '愛媛県', '上島町', 'ｴﾋﾒｹﾝ', 'ｶﾐｼﾞﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1818, '383864', '愛媛県', '久万高原町', 'ｴﾋﾒｹﾝ', 'ｸﾏｺｳｹﾞﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1819, '384011', '愛媛県', '松前町', 'ｴﾋﾒｹﾝ', 'ﾏｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1820, '384020', '愛媛県', '砥部町', 'ｴﾋﾒｹﾝ', 'ﾄﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1821, '384224', '愛媛県', '内子町', 'ｴﾋﾒｹﾝ', 'ｳﾁｺﾁｮｳ');
INSERT INTO `tb_division` VALUES (1822, '384429', '愛媛県', '伊方町', 'ｴﾋﾒｹﾝ', 'ｲｶﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1823, '384844', '愛媛県', '松野町', 'ｴﾋﾒｹﾝ', 'ﾏﾂﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1824, '384887', '愛媛県', '鬼北町', 'ｴﾋﾒｹﾝ', 'ｷﾎｸﾁｮｳ');
INSERT INTO `tb_division` VALUES (1825, '385069', '愛媛県', '愛南町', 'ｴﾋﾒｹﾝ', 'ｱｲﾅﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (1826, '390003', '高知県', NULL, 'ｺｳﾁｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1827, '392014', '高知県', '高知市', 'ｺｳﾁｹﾝ', 'ｺｳﾁｼ');
INSERT INTO `tb_division` VALUES (1828, '392022', '高知県', '室戸市', 'ｺｳﾁｹﾝ', 'ﾑﾛﾄｼ');
INSERT INTO `tb_division` VALUES (1829, '392031', '高知県', '安芸市', 'ｺｳﾁｹﾝ', 'ｱｷｼ');
INSERT INTO `tb_division` VALUES (1830, '392049', '高知県', '南国市', 'ｺｳﾁｹﾝ', 'ﾅﾝｺｸｼ');
INSERT INTO `tb_division` VALUES (1831, '392057', '高知県', '土佐市', 'ｺｳﾁｹﾝ', 'ﾄｻｼ');
INSERT INTO `tb_division` VALUES (1832, '392065', '高知県', '須崎市', 'ｺｳﾁｹﾝ', 'ｽｻｷｼ');
INSERT INTO `tb_division` VALUES (1833, '392081', '高知県', '宿毛市', 'ｺｳﾁｹﾝ', 'ｽｸﾓｼ');
INSERT INTO `tb_division` VALUES (1834, '392090', '高知県', '土佐清水市', 'ｺｳﾁｹﾝ', 'ﾄｻｼﾐｽﾞｼ');
INSERT INTO `tb_division` VALUES (1835, '392103', '高知県', '四万十市', 'ｺｳﾁｹﾝ', 'ｼﾏﾝﾄｼ');
INSERT INTO `tb_division` VALUES (1836, '392111', '高知県', '香南市', 'ｺｳﾁｹﾝ', 'ｺｳﾅﾝｼ');
INSERT INTO `tb_division` VALUES (1837, '392120', '高知県', '香美市', 'ｺｳﾁｹﾝ', 'ｶﾐｼ');
INSERT INTO `tb_division` VALUES (1838, '393011', '高知県', '東洋町', 'ｺｳﾁｹﾝ', 'ﾄｳﾖｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1839, '393029', '高知県', '奈半利町', 'ｺｳﾁｹﾝ', 'ﾅﾊﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1840, '393037', '高知県', '田野町', 'ｺｳﾁｹﾝ', 'ﾀﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1841, '393045', '高知県', '安田町', 'ｺｳﾁｹﾝ', 'ﾔｽﾀﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1842, '393053', '高知県', '北川村', 'ｺｳﾁｹﾝ', 'ｷﾀｶﾞﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1843, '393061', '高知県', '馬路村', 'ｺｳﾁｹﾝ', 'ｳﾏｼﾞﾑﾗ');
INSERT INTO `tb_division` VALUES (1844, '393070', '高知県', '芸西村', 'ｺｳﾁｹﾝ', 'ｹﾞｲｾｲﾑﾗ');
INSERT INTO `tb_division` VALUES (1845, '393410', '高知県', '本山町', 'ｺｳﾁｹﾝ', 'ﾓﾄﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1846, '393444', '高知県', '大豊町', 'ｺｳﾁｹﾝ', 'ｵｵﾄﾖﾁｮｳ');
INSERT INTO `tb_division` VALUES (1847, '393631', '高知県', '土佐町', 'ｺｳﾁｹﾝ', 'ﾄｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1848, '393649', '高知県', '大川村', 'ｺｳﾁｹﾝ', 'ｵｵｶﾜﾑﾗ');
INSERT INTO `tb_division` VALUES (1849, '393860', '高知県', 'いの町', 'ｺｳﾁｹﾝ', 'ｲﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1850, '393878', '高知県', '仁淀川町', 'ｺｳﾁｹﾝ', 'ﾆﾖﾄﾞｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1851, '394017', '高知県', '中土佐町', 'ｺｳﾁｹﾝ', 'ﾅｶﾄｻﾁｮｳ');
INSERT INTO `tb_division` VALUES (1852, '394025', '高知県', '佐川町', 'ｺｳﾁｹﾝ', 'ｻｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1853, '394033', '高知県', '越知町', 'ｺｳﾁｹﾝ', 'ｵﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1854, '394050', '高知県', '梼原町', 'ｺｳﾁｹﾝ', 'ﾕｽﾊﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1855, '394106', '高知県', '日高村', 'ｺｳﾁｹﾝ', 'ﾋﾀﾞｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1856, '394114', '高知県', '津野町', 'ｺｳﾁｹﾝ', 'ﾂﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (1857, '394122', '高知県', '四万十町', 'ｺｳﾁｹﾝ', 'ｼﾏﾝﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1858, '394246', '高知県', '大月町', 'ｺｳﾁｹﾝ', 'ｵｵﾂｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1859, '394271', '高知県', '三原村', 'ｺｳﾁｹﾝ', 'ﾐﾊﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1860, '394289', '高知県', '黒潮町', 'ｺｳﾁｹﾝ', 'ｸﾛｼｵﾁｮｳ');
INSERT INTO `tb_division` VALUES (1861, '400009', '福岡県', NULL, 'ﾌｸｵｶｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1862, '401005', '福岡県', '北九州市', 'ﾌｸｵｶｹﾝ', 'ｷﾀｷｭｳｼｭｳｼ');
INSERT INTO `tb_division` VALUES (1863, '401307', '福岡県', '福岡市', 'ﾌｸｵｶｹﾝ', 'ﾌｸｵｶｼ');
INSERT INTO `tb_division` VALUES (1864, '402028', '福岡県', '大牟田市', 'ﾌｸｵｶｹﾝ', 'ｵｵﾑﾀｼ');
INSERT INTO `tb_division` VALUES (1865, '402036', '福岡県', '久留米市', 'ﾌｸｵｶｹﾝ', 'ｸﾙﾒｼ');
INSERT INTO `tb_division` VALUES (1866, '402044', '福岡県', '直方市', 'ﾌｸｵｶｹﾝ', 'ﾉｵｶﾞﾀｼ');
INSERT INTO `tb_division` VALUES (1867, '402052', '福岡県', '飯塚市', 'ﾌｸｵｶｹﾝ', 'ｲｲﾂﾞｶｼ');
INSERT INTO `tb_division` VALUES (1868, '402061', '福岡県', '田川市', 'ﾌｸｵｶｹﾝ', 'ﾀｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1869, '402079', '福岡県', '柳川市', 'ﾌｸｵｶｹﾝ', 'ﾔﾅｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1870, '402109', '福岡県', '八女市', 'ﾌｸｵｶｹﾝ', 'ﾔﾒｼ');
INSERT INTO `tb_division` VALUES (1871, '402117', '福岡県', '筑後市', 'ﾌｸｵｶｹﾝ', 'ﾁｸｺﾞｼ');
INSERT INTO `tb_division` VALUES (1872, '402125', '福岡県', '大川市', 'ﾌｸｵｶｹﾝ', 'ｵｵｶﾜｼ');
INSERT INTO `tb_division` VALUES (1873, '402133', '福岡県', '行橋市', 'ﾌｸｵｶｹﾝ', 'ﾕｸﾊｼｼ');
INSERT INTO `tb_division` VALUES (1874, '402141', '福岡県', '豊前市', 'ﾌｸｵｶｹﾝ', 'ﾌﾞｾﾞﾝｼ');
INSERT INTO `tb_division` VALUES (1875, '402150', '福岡県', '中間市', 'ﾌｸｵｶｹﾝ', 'ﾅｶﾏｼ');
INSERT INTO `tb_division` VALUES (1876, '402168', '福岡県', '小郡市', 'ﾌｸｵｶｹﾝ', 'ｵｺﾞｵﾘｼ');
INSERT INTO `tb_division` VALUES (1877, '402176', '福岡県', '筑紫野市', 'ﾌｸｵｶｹﾝ', 'ﾁｸｼﾉｼ');
INSERT INTO `tb_division` VALUES (1878, '402184', '福岡県', '春日市', 'ﾌｸｵｶｹﾝ', 'ｶｽｶﾞｼ');
INSERT INTO `tb_division` VALUES (1879, '402192', '福岡県', '大野城市', 'ﾌｸｵｶｹﾝ', 'ｵｵﾉｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (1880, '402206', '福岡県', '宗像市', 'ﾌｸｵｶｹﾝ', 'ﾑﾅｶﾀｼ');
INSERT INTO `tb_division` VALUES (1881, '402214', '福岡県', '太宰府市', 'ﾌｸｵｶｹﾝ', 'ﾀﾞｻﾞｲﾌｼ');
INSERT INTO `tb_division` VALUES (1882, '402231', '福岡県', '古賀市', 'ﾌｸｵｶｹﾝ', 'ｺｶﾞｼ');
INSERT INTO `tb_division` VALUES (1883, '402249', '福岡県', '福津市', 'ﾌｸｵｶｹﾝ', 'ﾌｸﾂｼ');
INSERT INTO `tb_division` VALUES (1884, '402257', '福岡県', 'うきは市', 'ﾌｸｵｶｹﾝ', 'ｳｷﾊｼ');
INSERT INTO `tb_division` VALUES (1885, '402265', '福岡県', '宮若市', 'ﾌｸｵｶｹﾝ', 'ﾐﾔﾜｶｼ');
INSERT INTO `tb_division` VALUES (1886, '402273', '福岡県', '嘉麻市', 'ﾌｸｵｶｹﾝ', 'ｶﾏｼ');
INSERT INTO `tb_division` VALUES (1887, '402281', '福岡県', '朝倉市', 'ﾌｸｵｶｹﾝ', 'ｱｻｸﾗｼ');
INSERT INTO `tb_division` VALUES (1888, '402290', '福岡県', 'みやま市', 'ﾌｸｵｶｹﾝ', 'ﾐﾔﾏｼ');
INSERT INTO `tb_division` VALUES (1889, '402303', '福岡県', '糸島市', 'ﾌｸｵｶｹﾝ', 'ｲﾄｼﾏｼ');
INSERT INTO `tb_division` VALUES (1890, '402311', '福岡県', '那珂川市', 'ﾌｸｵｶｹﾝ', 'ﾅｶｶﾞﾜｼ');
INSERT INTO `tb_division` VALUES (1891, '403415', '福岡県', '宇美町', 'ﾌｸｵｶｹﾝ', 'ｳﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1892, '403423', '福岡県', '篠栗町', 'ﾌｸｵｶｹﾝ', 'ｻｻｸﾞﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (1893, '403431', '福岡県', '志免町', 'ﾌｸｵｶｹﾝ', 'ｼﾒﾏﾁ');
INSERT INTO `tb_division` VALUES (1894, '403440', '福岡県', '須恵町', 'ﾌｸｵｶｹﾝ', 'ｽｴﾏﾁ');
INSERT INTO `tb_division` VALUES (1895, '403458', '福岡県', '新宮町', 'ﾌｸｵｶｹﾝ', 'ｼﾝｸﾞｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1896, '403482', '福岡県', '久山町', 'ﾌｸｵｶｹﾝ', 'ﾋｻﾔﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1897, '403491', '福岡県', '粕屋町', 'ﾌｸｵｶｹﾝ', 'ｶｽﾔﾏﾁ');
INSERT INTO `tb_division` VALUES (1898, '403814', '福岡県', '芦屋町', 'ﾌｸｵｶｹﾝ', 'ｱｼﾔﾏﾁ');
INSERT INTO `tb_division` VALUES (1899, '403822', '福岡県', '水巻町', 'ﾌｸｵｶｹﾝ', 'ﾐｽﾞﾏｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1900, '403831', '福岡県', '岡垣町', 'ﾌｸｵｶｹﾝ', 'ｵｶｶﾞｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1901, '403849', '福岡県', '遠賀町', 'ﾌｸｵｶｹﾝ', 'ｵﾝｶﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1902, '404012', '福岡県', '小竹町', 'ﾌｸｵｶｹﾝ', 'ｺﾀｹﾏﾁ');
INSERT INTO `tb_division` VALUES (1903, '404021', '福岡県', '鞍手町', 'ﾌｸｵｶｹﾝ', 'ｸﾗﾃﾏﾁ');
INSERT INTO `tb_division` VALUES (1904, '404217', '福岡県', '桂川町', 'ﾌｸｵｶｹﾝ', 'ｹｲｾﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (1905, '404471', '福岡県', '筑前町', 'ﾌｸｵｶｹﾝ', 'ﾁｸｾﾞﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (1906, '404489', '福岡県', '東峰村', 'ﾌｸｵｶｹﾝ', 'ﾄｳﾎｳﾑﾗ');
INSERT INTO `tb_division` VALUES (1907, '405035', '福岡県', '大刀洗町', 'ﾌｸｵｶｹﾝ', 'ﾀﾁｱﾗｲﾏﾁ');
INSERT INTO `tb_division` VALUES (1908, '405221', '福岡県', '大木町', 'ﾌｸｵｶｹﾝ', 'ｵｵｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1909, '405442', '福岡県', '広川町', 'ﾌｸｵｶｹﾝ', 'ﾋﾛｶﾜﾏﾁ');
INSERT INTO `tb_division` VALUES (1910, '406015', '福岡県', '香春町', 'ﾌｸｵｶｹﾝ', 'ｶﾜﾗﾏﾁ');
INSERT INTO `tb_division` VALUES (1911, '406023', '福岡県', '添田町', 'ﾌｸｵｶｹﾝ', 'ｿｴﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1912, '406040', '福岡県', '糸田町', 'ﾌｸｵｶｹﾝ', 'ｲﾄﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1913, '406058', '福岡県', '川崎町', 'ﾌｸｵｶｹﾝ', 'ｶﾜｻｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1914, '406082', '福岡県', '大任町', 'ﾌｸｵｶｹﾝ', 'ｵｵﾄｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1915, '406091', '福岡県', '赤村', 'ﾌｸｵｶｹﾝ', 'ｱｶﾑﾗ');
INSERT INTO `tb_division` VALUES (1916, '406104', '福岡県', '福智町', 'ﾌｸｵｶｹﾝ', 'ﾌｸﾁﾏﾁ');
INSERT INTO `tb_division` VALUES (1917, '406210', '福岡県', '苅田町', 'ﾌｸｵｶｹﾝ', 'ｶﾝﾀﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1918, '406252', '福岡県', 'みやこ町', 'ﾌｸｵｶｹﾝ', 'ﾐﾔｺﾏﾁ');
INSERT INTO `tb_division` VALUES (1919, '406422', '福岡県', '吉富町', 'ﾌｸｵｶｹﾝ', 'ﾖｼﾄﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1920, '406465', '福岡県', '上毛町', 'ﾌｸｵｶｹﾝ', 'ｺｳｹﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1921, '406473', '福岡県', '築上町', 'ﾌｸｵｶｹﾝ', 'ﾁｸｼﾞｮｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1922, '410004', '佐賀県', NULL, 'ｻｶﾞｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1923, '412015', '佐賀県', '佐賀市', 'ｻｶﾞｹﾝ', 'ｻｶﾞｼ');
INSERT INTO `tb_division` VALUES (1924, '412023', '佐賀県', '唐津市', 'ｻｶﾞｹﾝ', 'ｶﾗﾂｼ');
INSERT INTO `tb_division` VALUES (1925, '412031', '佐賀県', '鳥栖市', 'ｻｶﾞｹﾝ', 'ﾄｽｼ');
INSERT INTO `tb_division` VALUES (1926, '412040', '佐賀県', '多久市', 'ｻｶﾞｹﾝ', 'ﾀｸｼ');
INSERT INTO `tb_division` VALUES (1927, '412058', '佐賀県', '伊万里市', 'ｻｶﾞｹﾝ', 'ｲﾏﾘｼ');
INSERT INTO `tb_division` VALUES (1928, '412066', '佐賀県', '武雄市', 'ｻｶﾞｹﾝ', 'ﾀｹｵｼ');
INSERT INTO `tb_division` VALUES (1929, '412074', '佐賀県', '鹿島市', 'ｻｶﾞｹﾝ', 'ｶｼﾏｼ');
INSERT INTO `tb_division` VALUES (1930, '412082', '佐賀県', '小城市', 'ｻｶﾞｹﾝ', 'ｵｷﾞｼ');
INSERT INTO `tb_division` VALUES (1931, '412091', '佐賀県', '嬉野市', 'ｻｶﾞｹﾝ', 'ｳﾚｼﾉｼ');
INSERT INTO `tb_division` VALUES (1932, '412104', '佐賀県', '神埼市', 'ｻｶﾞｹﾝ', 'ｶﾝｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (1933, '413275', '佐賀県', '吉野ヶ里町', 'ｻｶﾞｹﾝ', 'ﾖｼﾉｶﾞﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (1934, '413411', '佐賀県', '基山町', 'ｻｶﾞｹﾝ', 'ｷﾔﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (1935, '413453', '佐賀県', '上峰町', 'ｻｶﾞｹﾝ', 'ｶﾐﾐﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (1936, '413461', '佐賀県', 'みやき町', 'ｻｶﾞｹﾝ', 'ﾐﾔｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (1937, '413879', '佐賀県', '玄海町', 'ｻｶﾞｹﾝ', 'ｹﾞﾝｶｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (1938, '414018', '佐賀県', '有田町', 'ｻｶﾞｹﾝ', 'ｱﾘﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (1939, '414239', '佐賀県', '大町町', 'ｻｶﾞｹﾝ', 'ｵｵﾏﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (1940, '414247', '佐賀県', '江北町', 'ｻｶﾞｹﾝ', 'ｺｳﾎｸﾏﾁ');
INSERT INTO `tb_division` VALUES (1941, '414255', '佐賀県', '白石町', 'ｻｶﾞｹﾝ', 'ｼﾛｲｼﾁｮｳ');
INSERT INTO `tb_division` VALUES (1942, '414417', '佐賀県', '太良町', 'ｻｶﾞｹﾝ', 'ﾀﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (1943, '420000', '長崎県', NULL, 'ﾅｶﾞｻｷｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1944, '422011', '長崎県', '長崎市', 'ﾅｶﾞｻｷｹﾝ', 'ﾅｶﾞｻｷｼ');
INSERT INTO `tb_division` VALUES (1945, '422029', '長崎県', '佐世保市', 'ﾅｶﾞｻｷｹﾝ', 'ｻｾﾎﾞｼ');
INSERT INTO `tb_division` VALUES (1946, '422037', '長崎県', '島原市', 'ﾅｶﾞｻｷｹﾝ', 'ｼﾏﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1947, '422045', '長崎県', '諫早市', 'ﾅｶﾞｻｷｹﾝ', 'ｲｻﾊﾔｼ');
INSERT INTO `tb_division` VALUES (1948, '422053', '長崎県', '大村市', 'ﾅｶﾞｻｷｹﾝ', 'ｵｵﾑﾗｼ');
INSERT INTO `tb_division` VALUES (1949, '422070', '長崎県', '平戸市', 'ﾅｶﾞｻｷｹﾝ', 'ﾋﾗﾄﾞｼ');
INSERT INTO `tb_division` VALUES (1950, '422088', '長崎県', '松浦市', 'ﾅｶﾞｻｷｹﾝ', 'ﾏﾂｳﾗｼ');
INSERT INTO `tb_division` VALUES (1951, '422096', '長崎県', '対馬市', 'ﾅｶﾞｻｷｹﾝ', 'ﾂｼﾏｼ');
INSERT INTO `tb_division` VALUES (1952, '422100', '長崎県', '壱岐市', 'ﾅｶﾞｻｷｹﾝ', 'ｲｷｼ');
INSERT INTO `tb_division` VALUES (1953, '422118', '長崎県', '五島市', 'ﾅｶﾞｻｷｹﾝ', 'ｺﾞﾄｳｼ');
INSERT INTO `tb_division` VALUES (1954, '422126', '長崎県', '西海市', 'ﾅｶﾞｻｷｹﾝ', 'ｻｲｶｲｼ');
INSERT INTO `tb_division` VALUES (1955, '422134', '長崎県', '雲仙市', 'ﾅｶﾞｻｷｹﾝ', 'ｳﾝｾﾞﾝｼ');
INSERT INTO `tb_division` VALUES (1956, '422142', '長崎県', '南島原市', 'ﾅｶﾞｻｷｹﾝ', 'ﾐﾅﾐｼﾏﾊﾞﾗｼ');
INSERT INTO `tb_division` VALUES (1957, '423076', '長崎県', '長与町', 'ﾅｶﾞｻｷｹﾝ', 'ﾅｶﾞﾖﾁｮｳ');
INSERT INTO `tb_division` VALUES (1958, '423084', '長崎県', '時津町', 'ﾅｶﾞｻｷｹﾝ', 'ﾄｷﾞﾂﾁｮｳ');
INSERT INTO `tb_division` VALUES (1959, '423211', '長崎県', '東彼杵町', 'ﾅｶﾞｻｷｹﾝ', 'ﾋｶﾞｼｿﾉｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1960, '423220', '長崎県', '川棚町', 'ﾅｶﾞｻｷｹﾝ', 'ｶﾜﾀﾅﾁｮｳ');
INSERT INTO `tb_division` VALUES (1961, '423238', '長崎県', '波佐見町', 'ﾅｶﾞｻｷｹﾝ', 'ﾊｻﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (1962, '423831', '長崎県', '小値賀町', 'ﾅｶﾞｻｷｹﾝ', 'ｵﾁﾞｶﾁｮｳ');
INSERT INTO `tb_division` VALUES (1963, '423912', '長崎県', '佐々町', 'ﾅｶﾞｻｷｹﾝ', 'ｻｻﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (1964, '424111', '長崎県', '新上五島町', 'ﾅｶﾞｻｷｹﾝ', 'ｼﾝｶﾐｺﾞﾄｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (1965, '430005', '熊本県', NULL, 'ｸﾏﾓﾄｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (1966, '431001', '熊本県', '熊本市', 'ｸﾏﾓﾄｹﾝ', 'ｸﾏﾓﾄｼ');
INSERT INTO `tb_division` VALUES (1967, '432024', '熊本県', '八代市', 'ｸﾏﾓﾄｹﾝ', 'ﾔﾂｼﾛｼ');
INSERT INTO `tb_division` VALUES (1968, '432032', '熊本県', '人吉市', 'ｸﾏﾓﾄｹﾝ', 'ﾋﾄﾖｼｼ');
INSERT INTO `tb_division` VALUES (1969, '432041', '熊本県', '荒尾市', 'ｸﾏﾓﾄｹﾝ', 'ｱﾗｵｼ');
INSERT INTO `tb_division` VALUES (1970, '432059', '熊本県', '水俣市', 'ｸﾏﾓﾄｹﾝ', 'ﾐﾅﾏﾀｼ');
INSERT INTO `tb_division` VALUES (1971, '432067', '熊本県', '玉名市', 'ｸﾏﾓﾄｹﾝ', 'ﾀﾏﾅｼ');
INSERT INTO `tb_division` VALUES (1972, '432083', '熊本県', '山鹿市', 'ｸﾏﾓﾄｹﾝ', 'ﾔﾏｶﾞｼ');
INSERT INTO `tb_division` VALUES (1973, '432105', '熊本県', '菊池市', 'ｸﾏﾓﾄｹﾝ', 'ｷｸﾁｼ');
INSERT INTO `tb_division` VALUES (1974, '432113', '熊本県', '宇土市', 'ｸﾏﾓﾄｹﾝ', 'ｳﾄｼ');
INSERT INTO `tb_division` VALUES (1975, '432121', '熊本県', '上天草市', 'ｸﾏﾓﾄｹﾝ', 'ｶﾐｱﾏｸｻｼ');
INSERT INTO `tb_division` VALUES (1976, '432130', '熊本県', '宇城市', 'ｸﾏﾓﾄｹﾝ', 'ｳｷｼ');
INSERT INTO `tb_division` VALUES (1977, '432148', '熊本県', '阿蘇市', 'ｸﾏﾓﾄｹﾝ', 'ｱｿｼ');
INSERT INTO `tb_division` VALUES (1978, '432156', '熊本県', '天草市', 'ｸﾏﾓﾄｹﾝ', 'ｱﾏｸｻｼ');
INSERT INTO `tb_division` VALUES (1979, '432164', '熊本県', '合志市', 'ｸﾏﾓﾄｹﾝ', 'ｺｳｼｼ');
INSERT INTO `tb_division` VALUES (1980, '433489', '熊本県', '美里町', 'ｸﾏﾓﾄｹﾝ', 'ﾐｻﾄﾏﾁ');
INSERT INTO `tb_division` VALUES (1981, '433641', '熊本県', '玉東町', 'ｸﾏﾓﾄｹﾝ', 'ｷﾞｮｸﾄｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1982, '433675', '熊本県', '南関町', 'ｸﾏﾓﾄｹﾝ', 'ﾅﾝｶﾝﾏﾁ');
INSERT INTO `tb_division` VALUES (1983, '433683', '熊本県', '長洲町', 'ｸﾏﾓﾄｹﾝ', 'ﾅｶﾞｽﾏﾁ');
INSERT INTO `tb_division` VALUES (1984, '433691', '熊本県', '和水町', 'ｸﾏﾓﾄｹﾝ', 'ﾅｺﾞﾐﾏﾁ');
INSERT INTO `tb_division` VALUES (1985, '434035', '熊本県', '大津町', 'ｸﾏﾓﾄｹﾝ', 'ｵｵﾂﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (1986, '434043', '熊本県', '菊陽町', 'ｸﾏﾓﾄｹﾝ', 'ｷｸﾖｳﾏﾁ');
INSERT INTO `tb_division` VALUES (1987, '434230', '熊本県', '南小国町', 'ｸﾏﾓﾄｹﾝ', 'ﾐﾅﾐｵｸﾞﾆﾏﾁ');
INSERT INTO `tb_division` VALUES (1988, '434248', '熊本県', '小国町', 'ｸﾏﾓﾄｹﾝ', 'ｵｸﾞﾆﾏﾁ');
INSERT INTO `tb_division` VALUES (1989, '434256', '熊本県', '産山村', 'ｸﾏﾓﾄｹﾝ', 'ｳﾌﾞﾔﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (1990, '434281', '熊本県', '高森町', 'ｸﾏﾓﾄｹﾝ', 'ﾀｶﾓﾘﾏﾁ');
INSERT INTO `tb_division` VALUES (1991, '434329', '熊本県', '西原村', 'ｸﾏﾓﾄｹﾝ', 'ﾆｼﾊﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (1992, '434337', '熊本県', '南阿蘇村', 'ｸﾏﾓﾄｹﾝ', 'ﾐﾅﾐｱｿﾑﾗ');
INSERT INTO `tb_division` VALUES (1993, '434418', '熊本県', '御船町', 'ｸﾏﾓﾄｹﾝ', 'ﾐﾌﾈﾏﾁ');
INSERT INTO `tb_division` VALUES (1994, '434426', '熊本県', '嘉島町', 'ｸﾏﾓﾄｹﾝ', 'ｶｼﾏﾏﾁ');
INSERT INTO `tb_division` VALUES (1995, '434434', '熊本県', '益城町', 'ｸﾏﾓﾄｹﾝ', 'ﾏｼｷﾏﾁ');
INSERT INTO `tb_division` VALUES (1996, '434442', '熊本県', '甲佐町', 'ｸﾏﾓﾄｹﾝ', 'ｺｳｻﾏﾁ');
INSERT INTO `tb_division` VALUES (1997, '434477', '熊本県', '山都町', 'ｸﾏﾓﾄｹﾝ', 'ﾔﾏﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (1998, '434680', '熊本県', '氷川町', 'ｸﾏﾓﾄｹﾝ', 'ﾋｶﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (1999, '434825', '熊本県', '芦北町', 'ｸﾏﾓﾄｹﾝ', 'ｱｼｷﾀﾏﾁ');
INSERT INTO `tb_division` VALUES (2000, '434841', '熊本県', '津奈木町', 'ｸﾏﾓﾄｹﾝ', 'ﾂﾅｷﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (2001, '435015', '熊本県', '錦町', 'ｸﾏﾓﾄｹﾝ', 'ﾆｼｷﾏﾁ');
INSERT INTO `tb_division` VALUES (2002, '435058', '熊本県', '多良木町', 'ｸﾏﾓﾄｹﾝ', 'ﾀﾗｷﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (2003, '435066', '熊本県', '湯前町', 'ｸﾏﾓﾄｹﾝ', 'ﾕﾉﾏｴﾏﾁ');
INSERT INTO `tb_division` VALUES (2004, '435074', '熊本県', '水上村', 'ｸﾏﾓﾄｹﾝ', 'ﾐｽﾞｶﾐﾑﾗ');
INSERT INTO `tb_division` VALUES (2005, '435104', '熊本県', '相良村', 'ｸﾏﾓﾄｹﾝ', 'ｻｶﾞﾗﾑﾗ');
INSERT INTO `tb_division` VALUES (2006, '435112', '熊本県', '五木村', 'ｸﾏﾓﾄｹﾝ', 'ｲﾂｷﾑﾗ');
INSERT INTO `tb_division` VALUES (2007, '435121', '熊本県', '山江村', 'ｸﾏﾓﾄｹﾝ', 'ﾔﾏｴﾑﾗ');
INSERT INTO `tb_division` VALUES (2008, '435139', '熊本県', '球磨村', 'ｸﾏﾓﾄｹﾝ', 'ｸﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (2009, '435147', '熊本県', 'あさぎり町', 'ｸﾏﾓﾄｹﾝ', 'ｱｻｷﾞﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (2010, '435317', '熊本県', '苓北町', 'ｸﾏﾓﾄｹﾝ', 'ﾚｲﾎｸﾏﾁ');
INSERT INTO `tb_division` VALUES (2011, '440001', '大分県', NULL, 'ｵｵｲﾀｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (2012, '442011', '大分県', '大分市', 'ｵｵｲﾀｹﾝ', 'ｵｵｲﾀｼ');
INSERT INTO `tb_division` VALUES (2013, '442020', '大分県', '別府市', 'ｵｵｲﾀｹﾝ', 'ﾍﾞｯﾌﾟｼ');
INSERT INTO `tb_division` VALUES (2014, '442038', '大分県', '中津市', 'ｵｵｲﾀｹﾝ', 'ﾅｶﾂｼ');
INSERT INTO `tb_division` VALUES (2015, '442046', '大分県', '日田市', 'ｵｵｲﾀｹﾝ', 'ﾋﾀｼ');
INSERT INTO `tb_division` VALUES (2016, '442054', '大分県', '佐伯市', 'ｵｵｲﾀｹﾝ', 'ｻｲｷｼ');
INSERT INTO `tb_division` VALUES (2017, '442062', '大分県', '臼杵市', 'ｵｵｲﾀｹﾝ', 'ｳｽｷｼ');
INSERT INTO `tb_division` VALUES (2018, '442071', '大分県', '津久見市', 'ｵｵｲﾀｹﾝ', 'ﾂｸﾐｼ');
INSERT INTO `tb_division` VALUES (2019, '442089', '大分県', '竹田市', 'ｵｵｲﾀｹﾝ', 'ﾀｹﾀｼ');
INSERT INTO `tb_division` VALUES (2020, '442097', '大分県', '豊後高田市', 'ｵｵｲﾀｹﾝ', 'ﾌﾞﾝｺﾞﾀｶﾀﾞｼ');
INSERT INTO `tb_division` VALUES (2021, '442101', '大分県', '杵築市', 'ｵｵｲﾀｹﾝ', 'ｷﾂｷｼ');
INSERT INTO `tb_division` VALUES (2022, '442119', '大分県', '宇佐市', 'ｵｵｲﾀｹﾝ', 'ｳｻｼ');
INSERT INTO `tb_division` VALUES (2023, '442127', '大分県', '豊後大野市', 'ｵｵｲﾀｹﾝ', 'ﾌﾞﾝｺﾞｵｵﾉｼ');
INSERT INTO `tb_division` VALUES (2024, '442135', '大分県', '由布市', 'ｵｵｲﾀｹﾝ', 'ﾕﾌｼ');
INSERT INTO `tb_division` VALUES (2025, '442143', '大分県', '国東市', 'ｵｵｲﾀｹﾝ', 'ｸﾆｻｷｼ');
INSERT INTO `tb_division` VALUES (2026, '443221', '大分県', '姫島村', 'ｵｵｲﾀｹﾝ', 'ﾋﾒｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (2027, '443417', '大分県', '日出町', 'ｵｵｲﾀｹﾝ', 'ﾋｼﾞﾏﾁ');
INSERT INTO `tb_division` VALUES (2028, '444618', '大分県', '九重町', 'ｵｵｲﾀｹﾝ', 'ｺｺﾉｴﾏﾁ');
INSERT INTO `tb_division` VALUES (2029, '444626', '大分県', '玖珠町', 'ｵｵｲﾀｹﾝ', 'ｸｽﾏﾁ');
INSERT INTO `tb_division` VALUES (2030, '450006', '宮崎県', NULL, 'ﾐﾔｻﾞｷｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (2031, '452017', '宮崎県', '宮崎市', 'ﾐﾔｻﾞｷｹﾝ', 'ﾐﾔｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (2032, '452025', '宮崎県', '都城市', 'ﾐﾔｻﾞｷｹﾝ', 'ﾐﾔｺﾉｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (2033, '452033', '宮崎県', '延岡市', 'ﾐﾔｻﾞｷｹﾝ', 'ﾉﾍﾞｵｶｼ');
INSERT INTO `tb_division` VALUES (2034, '452041', '宮崎県', '日南市', 'ﾐﾔｻﾞｷｹﾝ', 'ﾆﾁﾅﾝｼ');
INSERT INTO `tb_division` VALUES (2035, '452050', '宮崎県', '小林市', 'ﾐﾔｻﾞｷｹﾝ', 'ｺﾊﾞﾔｼｼ');
INSERT INTO `tb_division` VALUES (2036, '452068', '宮崎県', '日向市', 'ﾐﾔｻﾞｷｹﾝ', 'ﾋｭｳｶﾞｼ');
INSERT INTO `tb_division` VALUES (2037, '452076', '宮崎県', '串間市', 'ﾐﾔｻﾞｷｹﾝ', 'ｸｼﾏｼ');
INSERT INTO `tb_division` VALUES (2038, '452084', '宮崎県', '西都市', 'ﾐﾔｻﾞｷｹﾝ', 'ｻｲﾄｼ');
INSERT INTO `tb_division` VALUES (2039, '452092', '宮崎県', 'えびの市', 'ﾐﾔｻﾞｷｹﾝ', 'ｴﾋﾞﾉｼ');
INSERT INTO `tb_division` VALUES (2040, '453412', '宮崎県', '三股町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾐﾏﾀﾁｮｳ');
INSERT INTO `tb_division` VALUES (2041, '453617', '宮崎県', '高原町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾀｶﾊﾙﾁｮｳ');
INSERT INTO `tb_division` VALUES (2042, '453820', '宮崎県', '国富町', 'ﾐﾔｻﾞｷｹﾝ', 'ｸﾆﾄﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (2043, '453838', '宮崎県', '綾町', 'ﾐﾔｻﾞｷｹﾝ', 'ｱﾔﾁｮｳ');
INSERT INTO `tb_division` VALUES (2044, '454010', '宮崎県', '高鍋町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾀｶﾅﾍﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (2045, '454028', '宮崎県', '新富町', 'ﾐﾔｻﾞｷｹﾝ', 'ｼﾝﾄﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (2046, '454036', '宮崎県', '西米良村', 'ﾐﾔｻﾞｷｹﾝ', 'ﾆｼﾒﾗｿﾝ');
INSERT INTO `tb_division` VALUES (2047, '454044', '宮崎県', '木城町', 'ﾐﾔｻﾞｷｹﾝ', 'ｷｼﾞｮｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (2048, '454052', '宮崎県', '川南町', 'ﾐﾔｻﾞｷｹﾝ', 'ｶﾜﾐﾅﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (2049, '454061', '宮崎県', '都農町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾂﾉﾁｮｳ');
INSERT INTO `tb_division` VALUES (2050, '454214', '宮崎県', '門川町', 'ﾐﾔｻﾞｷｹﾝ', 'ｶﾄﾞｶﾞﾜﾁｮｳ');
INSERT INTO `tb_division` VALUES (2051, '454290', '宮崎県', '諸塚村', 'ﾐﾔｻﾞｷｹﾝ', 'ﾓﾛﾂｶｿﾝ');
INSERT INTO `tb_division` VALUES (2052, '454303', '宮崎県', '椎葉村', 'ﾐﾔｻﾞｷｹﾝ', 'ｼｲﾊﾞｿﾝ');
INSERT INTO `tb_division` VALUES (2053, '454311', '宮崎県', '美郷町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾐｻﾄﾁｮｳ');
INSERT INTO `tb_division` VALUES (2054, '454419', '宮崎県', '高千穂町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾀｶﾁﾎﾁｮｳ');
INSERT INTO `tb_division` VALUES (2055, '454427', '宮崎県', '日之影町', 'ﾐﾔｻﾞｷｹﾝ', 'ﾋﾉｶｹﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (2056, '454435', '宮崎県', '五ヶ瀬町', 'ﾐﾔｻﾞｷｹﾝ', 'ｺﾞｶｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (2057, '460001', '鹿児島県', NULL, 'ｶｺﾞｼﾏｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (2058, '462012', '鹿児島県', '鹿児島市', 'ｶｺﾞｼﾏｹﾝ', 'ｶｺﾞｼﾏｼ');
INSERT INTO `tb_division` VALUES (2059, '462039', '鹿児島県', '鹿屋市', 'ｶｺﾞｼﾏｹﾝ', 'ｶﾉﾔｼ');
INSERT INTO `tb_division` VALUES (2060, '462047', '鹿児島県', '枕崎市', 'ｶｺﾞｼﾏｹﾝ', 'ﾏｸﾗｻﾞｷｼ');
INSERT INTO `tb_division` VALUES (2061, '462063', '鹿児島県', '阿久根市', 'ｶｺﾞｼﾏｹﾝ', 'ｱｸﾈｼ');
INSERT INTO `tb_division` VALUES (2062, '462080', '鹿児島県', '出水市', 'ｶｺﾞｼﾏｹﾝ', 'ｲｽﾞﾐｼ');
INSERT INTO `tb_division` VALUES (2063, '462101', '鹿児島県', '指宿市', 'ｶｺﾞｼﾏｹﾝ', 'ｲﾌﾞｽｷｼ');
INSERT INTO `tb_division` VALUES (2064, '462136', '鹿児島県', '西之表市', 'ｶｺﾞｼﾏｹﾝ', 'ﾆｼﾉｵﾓﾃｼ');
INSERT INTO `tb_division` VALUES (2065, '462144', '鹿児島県', '垂水市', 'ｶｺﾞｼﾏｹﾝ', 'ﾀﾙﾐｽﾞｼ');
INSERT INTO `tb_division` VALUES (2066, '462152', '鹿児島県', '薩摩川内市', 'ｶｺﾞｼﾏｹﾝ', 'ｻﾂﾏｾﾝﾀﾞｲｼ');
INSERT INTO `tb_division` VALUES (2067, '462161', '鹿児島県', '日置市', 'ｶｺﾞｼﾏｹﾝ', 'ﾋｵｷｼ');
INSERT INTO `tb_division` VALUES (2068, '462179', '鹿児島県', '曽於市', 'ｶｺﾞｼﾏｹﾝ', 'ｿｵｼ');
INSERT INTO `tb_division` VALUES (2069, '462187', '鹿児島県', '霧島市', 'ｶｺﾞｼﾏｹﾝ', 'ｷﾘｼﾏｼ');
INSERT INTO `tb_division` VALUES (2070, '462195', '鹿児島県', 'いちき串木野市', 'ｶｺﾞｼﾏｹﾝ', 'ｲﾁｷｸｼｷﾉｼ');
INSERT INTO `tb_division` VALUES (2071, '462209', '鹿児島県', '南さつま市', 'ｶｺﾞｼﾏｹﾝ', 'ﾐﾅﾐｻﾂﾏｼ');
INSERT INTO `tb_division` VALUES (2072, '462217', '鹿児島県', '志布志市', 'ｶｺﾞｼﾏｹﾝ', 'ｼﾌﾞｼｼ');
INSERT INTO `tb_division` VALUES (2073, '462225', '鹿児島県', '奄美市', 'ｶｺﾞｼﾏｹﾝ', 'ｱﾏﾐｼ');
INSERT INTO `tb_division` VALUES (2074, '462233', '鹿児島県', '南九州市', 'ｶｺﾞｼﾏｹﾝ', 'ﾐﾅﾐｷｭｳｼｭｳｼ');
INSERT INTO `tb_division` VALUES (2075, '462241', '鹿児島県', '伊佐市', 'ｶｺﾞｼﾏｹﾝ', 'ｲｻｼ');
INSERT INTO `tb_division` VALUES (2076, '462250', '鹿児島県', '姶良市', 'ｶｺﾞｼﾏｹﾝ', 'ｱｲﾗｼ');
INSERT INTO `tb_division` VALUES (2077, '463035', '鹿児島県', '三島村', 'ｶｺﾞｼﾏｹﾝ', 'ﾐｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (2078, '463043', '鹿児島県', '十島村', 'ｶｺﾞｼﾏｹﾝ', 'ﾄｼﾏﾑﾗ');
INSERT INTO `tb_division` VALUES (2079, '463922', '鹿児島県', 'さつま町', 'ｶｺﾞｼﾏｹﾝ', 'ｻﾂﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (2080, '464040', '鹿児島県', '長島町', 'ｶｺﾞｼﾏｹﾝ', 'ﾅｶﾞｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (2081, '464520', '鹿児島県', '湧水町', 'ｶｺﾞｼﾏｹﾝ', 'ﾕｳｽｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (2082, '464686', '鹿児島県', '大崎町', 'ｶｺﾞｼﾏｹﾝ', 'ｵｵｻｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (2083, '464821', '鹿児島県', '東串良町', 'ｶｺﾞｼﾏｹﾝ', 'ﾋｶﾞｼｸｼﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (2084, '464902', '鹿児島県', '錦江町', 'ｶｺﾞｼﾏｹﾝ', 'ｷﾝｺｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (2085, '464911', '鹿児島県', '南大隅町', 'ｶｺﾞｼﾏｹﾝ', 'ﾐﾅﾐｵｵｽﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (2086, '464929', '鹿児島県', '肝付町', 'ｶｺﾞｼﾏｹﾝ', 'ｷﾓﾂｷﾁｮｳ');
INSERT INTO `tb_division` VALUES (2087, '465011', '鹿児島県', '中種子町', 'ｶｺﾞｼﾏｹﾝ', 'ﾅｶﾀﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (2088, '465020', '鹿児島県', '南種子町', 'ｶｺﾞｼﾏｹﾝ', 'ﾐﾅﾐﾀﾈﾁｮｳ');
INSERT INTO `tb_division` VALUES (2089, '465054', '鹿児島県', '屋久島町', 'ｶｺﾞｼﾏｹﾝ', 'ﾔｸｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (2090, '465232', '鹿児島県', '大和村', 'ｶｺﾞｼﾏｹﾝ', 'ﾔﾏﾄｿﾝ');
INSERT INTO `tb_division` VALUES (2091, '465241', '鹿児島県', '宇検村', 'ｶｺﾞｼﾏｹﾝ', 'ｳｹﾝｿﾝ');
INSERT INTO `tb_division` VALUES (2092, '465259', '鹿児島県', '瀬戸内町', 'ｶｺﾞｼﾏｹﾝ', 'ｾﾄｳﾁﾁｮｳ');
INSERT INTO `tb_division` VALUES (2093, '465275', '鹿児島県', '龍郷町', 'ｶｺﾞｼﾏｹﾝ', 'ﾀﾂｺﾞｳﾁｮｳ');
INSERT INTO `tb_division` VALUES (2094, '465291', '鹿児島県', '喜界町', 'ｶｺﾞｼﾏｹﾝ', 'ｷｶｲﾁｮｳ');
INSERT INTO `tb_division` VALUES (2095, '465305', '鹿児島県', '徳之島町', 'ｶｺﾞｼﾏｹﾝ', 'ﾄｸﾉｼﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (2096, '465313', '鹿児島県', '天城町', 'ｶｺﾞｼﾏｹﾝ', 'ｱﾏｷﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (2097, '465321', '鹿児島県', '伊仙町', 'ｶｺﾞｼﾏｹﾝ', 'ｲｾﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (2098, '465330', '鹿児島県', '和泊町', 'ｶｺﾞｼﾏｹﾝ', 'ﾜﾄﾞﾏﾘﾁｮｳ');
INSERT INTO `tb_division` VALUES (2099, '465348', '鹿児島県', '知名町', 'ｶｺﾞｼﾏｹﾝ', 'ﾁﾅﾁｮｳ');
INSERT INTO `tb_division` VALUES (2100, '465356', '鹿児島県', '与論町', 'ｶｺﾞｼﾏｹﾝ', 'ﾖﾛﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (2101, '470007', '沖縄県', NULL, 'ｵｷﾅﾜｹﾝ', NULL);
INSERT INTO `tb_division` VALUES (2102, '472018', '沖縄県', '那覇市', 'ｵｷﾅﾜｹﾝ', 'ﾅﾊｼ');
INSERT INTO `tb_division` VALUES (2103, '472051', '沖縄県', '宜野湾市', 'ｵｷﾅﾜｹﾝ', 'ｷﾞﾉﾜﾝｼ');
INSERT INTO `tb_division` VALUES (2104, '472077', '沖縄県', '石垣市', 'ｵｷﾅﾜｹﾝ', 'ｲｼｶﾞｷｼ');
INSERT INTO `tb_division` VALUES (2105, '472085', '沖縄県', '浦添市', 'ｵｷﾅﾜｹﾝ', 'ｳﾗｿｴｼ');
INSERT INTO `tb_division` VALUES (2106, '472093', '沖縄県', '名護市', 'ｵｷﾅﾜｹﾝ', 'ﾅｺﾞｼ');
INSERT INTO `tb_division` VALUES (2107, '472107', '沖縄県', '糸満市', 'ｵｷﾅﾜｹﾝ', 'ｲﾄﾏﾝｼ');
INSERT INTO `tb_division` VALUES (2108, '472115', '沖縄県', '沖縄市', 'ｵｷﾅﾜｹﾝ', 'ｵｷﾅﾜｼ');
INSERT INTO `tb_division` VALUES (2109, '472123', '沖縄県', '豊見城市', 'ｵｷﾅﾜｹﾝ', 'ﾄﾐｸﾞｽｸｼ');
INSERT INTO `tb_division` VALUES (2110, '472131', '沖縄県', 'うるま市', 'ｵｷﾅﾜｹﾝ', 'ｳﾙﾏｼ');
INSERT INTO `tb_division` VALUES (2111, '472140', '沖縄県', '宮古島市', 'ｵｷﾅﾜｹﾝ', 'ﾐﾔｺｼﾞﾏｼ');
INSERT INTO `tb_division` VALUES (2112, '472158', '沖縄県', '南城市', 'ｵｷﾅﾜｹﾝ', 'ﾅﾝｼﾞｮｳｼ');
INSERT INTO `tb_division` VALUES (2113, '473014', '沖縄県', '国頭村', 'ｵｷﾅﾜｹﾝ', 'ｸﾆｶﾞﾐｿﾝ');
INSERT INTO `tb_division` VALUES (2114, '473022', '沖縄県', '大宜味村', 'ｵｷﾅﾜｹﾝ', 'ｵｵｷﾞﾐｿﾝ');
INSERT INTO `tb_division` VALUES (2115, '473031', '沖縄県', '東村', 'ｵｷﾅﾜｹﾝ', 'ﾋｶﾞｼｿﾝ');
INSERT INTO `tb_division` VALUES (2116, '473065', '沖縄県', '今帰仁村', 'ｵｷﾅﾜｹﾝ', 'ﾅｷｼﾞﾝｿﾝ');
INSERT INTO `tb_division` VALUES (2117, '473081', '沖縄県', '本部町', 'ｵｷﾅﾜｹﾝ', 'ﾓﾄﾌﾞﾁｮｳ');
INSERT INTO `tb_division` VALUES (2118, '473111', '沖縄県', '恩納村', 'ｵｷﾅﾜｹﾝ', 'ｵﾝﾅｿﾝ');
INSERT INTO `tb_division` VALUES (2119, '473138', '沖縄県', '宜野座村', 'ｵｷﾅﾜｹﾝ', 'ｷﾞﾉｻﾞｿﾝ');
INSERT INTO `tb_division` VALUES (2120, '473146', '沖縄県', '金武町', 'ｵｷﾅﾜｹﾝ', 'ｷﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (2121, '473154', '沖縄県', '伊江村', 'ｵｷﾅﾜｹﾝ', 'ｲｴｿﾝ');
INSERT INTO `tb_division` VALUES (2122, '473243', '沖縄県', '読谷村', 'ｵｷﾅﾜｹﾝ', 'ﾖﾐﾀﾝｿﾝ');
INSERT INTO `tb_division` VALUES (2123, '473251', '沖縄県', '嘉手納町', 'ｵｷﾅﾜｹﾝ', 'ｶﾃﾞﾅﾁｮｳ');
INSERT INTO `tb_division` VALUES (2124, '473260', '沖縄県', '北谷町', 'ｵｷﾅﾜｹﾝ', 'ﾁﾔﾀﾝﾁｮｳ');
INSERT INTO `tb_division` VALUES (2125, '473278', '沖縄県', '北中城村', 'ｵｷﾅﾜｹﾝ', 'ｷﾀﾅｶｸﾞｽｸｿﾝ');
INSERT INTO `tb_division` VALUES (2126, '473286', '沖縄県', '中城村', 'ｵｷﾅﾜｹﾝ', 'ﾅｶｸﾞｽｸｿﾝ');
INSERT INTO `tb_division` VALUES (2127, '473294', '沖縄県', '西原町', 'ｵｷﾅﾜｹﾝ', 'ﾆｼﾊﾗﾁｮｳ');
INSERT INTO `tb_division` VALUES (2128, '473481', '沖縄県', '与那原町', 'ｵｷﾅﾜｹﾝ', 'ﾖﾅﾊﾞﾙﾁｮｳ');
INSERT INTO `tb_division` VALUES (2129, '473502', '沖縄県', '南風原町', 'ｵｷﾅﾜｹﾝ', 'ﾊｴﾊﾞﾙﾁｮｳ');
INSERT INTO `tb_division` VALUES (2130, '473537', '沖縄県', '渡嘉敷村', 'ｵｷﾅﾜｹﾝ', 'ﾄｶｼｷｿﾝ');
INSERT INTO `tb_division` VALUES (2131, '473545', '沖縄県', '座間味村', 'ｵｷﾅﾜｹﾝ', 'ｻﾞﾏﾐｿﾝ');
INSERT INTO `tb_division` VALUES (2132, '473553', '沖縄県', '粟国村', 'ｵｷﾅﾜｹﾝ', 'ｱｸﾞﾆｿﾝ');
INSERT INTO `tb_division` VALUES (2133, '473561', '沖縄県', '渡名喜村', 'ｵｷﾅﾜｹﾝ', 'ﾄﾅｷｿﾝ');
INSERT INTO `tb_division` VALUES (2134, '473570', '沖縄県', '南大東村', 'ｵｷﾅﾜｹﾝ', 'ﾐﾅﾐﾀﾞｲﾄｳｿﾝ');
INSERT INTO `tb_division` VALUES (2135, '473588', '沖縄県', '北大東村', 'ｵｷﾅﾜｹﾝ', 'ｷﾀﾀﾞｲﾄｳｿﾝ');
INSERT INTO `tb_division` VALUES (2136, '473596', '沖縄県', '伊平屋村', 'ｵｷﾅﾜｹﾝ', 'ｲﾍﾔｿﾝ');
INSERT INTO `tb_division` VALUES (2137, '473600', '沖縄県', '伊是名村', 'ｵｷﾅﾜｹﾝ', 'ｲｾﾞﾅｿﾝ');
INSERT INTO `tb_division` VALUES (2138, '473618', '沖縄県', '久米島町', 'ｵｷﾅﾜｹﾝ', 'ｸﾒｼﾞﾏﾁｮｳ');
INSERT INTO `tb_division` VALUES (2139, '473626', '沖縄県', '八重瀬町', 'ｵｷﾅﾜｹﾝ', 'ﾔｴｾﾁｮｳ');
INSERT INTO `tb_division` VALUES (2140, '473758', '沖縄県', '多良間村', 'ｵｷﾅﾜｹﾝ', 'ﾀﾗﾏｿﾝ');
INSERT INTO `tb_division` VALUES (2141, '473812', '沖縄県', '竹富町', 'ｵｷﾅﾜｹﾝ', 'ﾀｹﾄﾐﾁｮｳ');
INSERT INTO `tb_division` VALUES (2142, '473821', '沖縄県', '与那国町', 'ｵｷﾅﾜｹﾝ', 'ﾖﾅｸﾞﾆﾁｮｳ');

-- ----------------------------
-- Table structure for tb_route_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_route_detail`;
CREATE TABLE `tb_route_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` int(10) NULL DEFAULT NULL COMMENT '行程id',
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同乘人数',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '价格',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0停用 1启用）',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记（0正常，1删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行程资金明细;' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_route_detail
-- ----------------------------
INSERT INTO `tb_route_detail` VALUES (1, 20, '1', '9000', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (2, 21, '1', '9000', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (3, 21, '2', '18000', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (4, 21, '3', '27000', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (5, 46, '1', '8999', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (6, 46, '2', '8998', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (7, 46, '3', '8997', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (8, NULL, '1', '8999', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (9, NULL, '2', '8998', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_route_detail` VALUES (10, NULL, '3', '8997', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_route_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_route_record`;
CREATE TABLE `tb_route_record`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用状态（0.停用，1.启用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记（0.正常，1.删除）',
  `standby1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用1',
  `standby2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用2',
  `standby3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用3',
  `standby4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用4',
  `standby5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户接单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_route_record
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
