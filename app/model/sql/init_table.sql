-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-04-14 11:25:55
-- 服务器版本： 8.0.28-0ubuntu0.20.04.3
-- PHP 版本： 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `vben`
--

-- --------------------------------------------------------

--
-- 表的结构 `attachment`
--

CREATE TABLE `attachment` (
  `id` bigint NOT NULL COMMENT '附件ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `name` varchar(128) NOT NULL COMMENT '文件名称',
  `size` int NOT NULL COMMENT '文件大小',
  `url` varchar(2080) NOT NULL COMMENT '文件地址',
  `file_name` varchar(200) DEFAULT NULL COMMENT '上传文件名',
  `thumb_url` varchar(2080) NOT NULL DEFAULT '' COMMENT '缩略图地址',
  `type` tinyint NOT NULL COMMENT '类型',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件表';

--
-- 转存表中的数据 `attachment`
--

INSERT INTO `attachment` (`id`, `name`, `size`, `url`, `file_name`, `thumb_url`, `type`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`, `is_recycle`) VALUES
(1, 'timg (3).jpeg', 26516, 'https://cdn.ckjia.com/10e258da699b4c318ff59e24f2599420.jpeg', '10e258da699b4c318ff59e24f2599420.jpeg', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(2, 'background.jpg', 261548, 'https://cdn.ckjia.com/3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg', '3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg', '', 1, NULL, NULL, NULL, NULL, '0', 0);

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` bigint NOT NULL COMMENT '菜单ID',
  `name` varchar(32) DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限',
  `path` varchar(128) DEFAULT NULL COMMENT '路径',
  `component` varchar(128) DEFAULT NULL COMMENT '组件',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `sort` int DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '是否缓存该页面: 1:是  0:不是',
  `type` char(1) DEFAULT '0' COMMENT '菜单类型',
  `hidden` char(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `target` char(1) NOT NULL DEFAULT '0' COMMENT '是否外链',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `permission`, `path`, `component`, `parent_id`, `icon`, `sort`, `keep_alive`, `type`, `hidden`, `target`, `create_by`, `update_by`, `create_time`, `update_time`, `status`, `is_deleted`) VALUES
(1000, '系统管理', NULL, '/system', 'Layout', 0, 'ant-design:appstore-outlined', 10, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1100, '用户管理', NULL, '/system/account', '/system/account/index', 1000, 'ant-design:user-outlined', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1101, '用户新增', 'sys:user:add', '', NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1102, '用户修改', 'sys:user:edit', NULL, NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1103, '用户删除', 'sys:user:delete', NULL, NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1104, '用户启用', 'sys:user:enable', NULL, NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1105, '用户禁用', 'sys:user:disable', NULL, NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1106, '用户导出', 'sys:user:export', NULL, NULL, 1100, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1200, '角色管理', NULL, '/system/role', '/system/role/index', 1000, 'ant-design:team-outlined', 4, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1201, '角色新增', 'sys:role:add', NULL, NULL, 1200, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1202, '角色修改', 'sys:role:edit', NULL, NULL, 1200, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1203, '角色删除', 'sys:role:delete', NULL, NULL, 1200, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1204, '角色导出', 'sys:role:export', NULL, NULL, 1200, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1205, '角色权限', 'sys:role:perm', NULL, NULL, 1200, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1300, '菜单管理', NULL, '/system/menu', '/system/menu/index', 1000, 'ant-design:menu-unfold-outlined', 1, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1301, '菜单新增', 'sys:menu:add', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1302, '菜单修改', 'sys:menu:edit', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1303, '菜单删除', 'sys:menu:delete', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1304, '菜单启用', 'sys:menu:enable', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1305, '菜单禁用', 'sys:menu:disable', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1306, '菜单导出', 'sys:menu:export', NULL, NULL, 1300, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2064, '工作台', NULL, '/dashboard', 'Layout', 0, 'ant-design:windows-outlined', 1, '0', '0', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2065, '分析页', NULL, '/dashboard', '/dashboard/analysis/index', 2064, 'ant-design:rise-outlined', 0, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2068, '工作台', NULL, '/dashboard/workbench', '/dashboard/workbench/index', 2064, 'ant-design:block-outlined', 2, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0');


-- --------------------------------------------------------

--
-- 表的结构 `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint NOT NULL COMMENT '主键',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限表';

--
-- 转存表中的数据 `permission_role`
--

INSERT INTO `permission_role` (`id`, `menu_id`, `role_id`, `create_time`, `update_time`) VALUES
(1, 1000, 1, 0, 0),
(2, 1300, 1, 0, 0),
(3, 1304, 1, 0, 0),
(4, 1301, 1, 0, 0),
(5, 1302, 1, 0, 0),
(6, 1303, 1, 0, 0),
(7, 1305, 1, 0, 0),
(8, 1306, 1, 0, 0),
(9, 1100, 1, 0, 0),
(10, 1106, 1, 0, 0),
(11, 1105, 1, 0, 0),
(12, 1104, 1, 0, 0),
(13, 1103, 1, 0, 0),
(14, 1102, 1, 0, 0),
(15, 1101, 1, 0, 0),
(16, 1200, 1, 0, 0),
(17, 1202, 1, 0, 0),
(18, 1201, 1, 0, 0),
(19, 1203, 1, 0, 0),
(20, 1204, 1, 0, 0),
(21, 1205, 1, 0, 0),
(22, 2064, 1, 0, 0),
(23, 2065, 1, 0, 0),
(24, 2068, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `role_name`, `role_code`, `description`, `sort`, `status`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, '企业', 'enterprise', '企业', 1, '0', NULL, NULL, 1649578786, 1649934648, '0'),
(2, '专家', 'expert', '管理员', 2, '0', NULL, NULL, 1649578786, 1649934663, '0'),
(3, '质控单位', 'quality', '质控单位', 3, '0', '', '', 1649925084, 1649934668, '0'),
(4, '管理部门', 'admin', '管理部门', 4, '0', '', '', 1649925084, 1649934668, '0');

-- --------------------------------------------------------

--
-- 表的结构 `role_user`
--

CREATE TABLE `role_user` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色id',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `create_time`, `update_time`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `company`
--

CREATE TABLE `company` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `company_name` varchar(30) DEFAULT NULL COMMENT '企业名称',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `area` varchar(20) DEFAULT NULL COMMENT '区域',
  `address` varchar(40) DEFAULT NULL COMMENT '企业地址',
  `legal_person` varchar(20) DEFAULT NULL COMMENT '企业法人',
  `env_person` varchar(20) DEFAULT NULL COMMENT '环保负责人姓名',
  `env_person_phone` varchar(11) DEFAULT NULL COMMENT '环保负责人手机',
  `handle_person` varchar(20) DEFAULT NULL COMMENT '经办人姓名',
  `handle_person_phone` varchar(11) DEFAULT NULL COMMENT '经办人手机',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `info` json DEFAULT NULL COMMENT '其他',
  `status` tinyint DEFAULT 1 COMMENT '公司状态: 1未发布 2已发布',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司表';

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `user_id`, `company_name`,  `province`, `city`, `area`, `address`, `legal_person`, `env_person`, `env_person_phone`, `handle_person`, `handle_person_phone`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, 1, '长三', '浙江', '嘉兴', '南湖区', '亚太路', 'AAA', 'BBB', 'BBB_phone', 'CCC', 'CCC_phone', 'test', NULL, NULL, NULL, NULL, '0'),
(2, 1, '东湖A', '浙江', '嘉兴', '平湖', '东湖街道', 'AAA_t', 'BBB', 'BBB_phone', 'CCC', 'CCC_phone', 'test', NULL, NULL, NULL, NULL, '0');

--
-- 表的结构 `user`
--
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `nickname`, `real_name`, `avatar`, `status`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, 'vben', 'lbd4pvfpICb1pX6gf3ar1Q==', 'admi1', '超级管理员', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', '1', 'test', NULL, NULL, NULL, NULL, '0'),
(2, 'test', 'lbd4pvfpICb1pX6gf3ar1Q==', 'amin2', '测试', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', '1', 'test', NULL, NULL, NULL, NULL, '0');



--
-- 转储表的索引
--

--
-- 表的索引 `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `role_name` (`role_name`),
  ADD UNIQUE KEY `role_code` (`role_code`),
  ADD KEY `idx_role_role_code` (`role_code`) USING BTREE;

--
-- 表的索引 `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_user_id_foreign` (`user_id`);

--
-- 表的索引 `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account` (`account`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公司ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '附件ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=2400;

--
-- 使用表AUTO_INCREMENT `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
