-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-04-11 11:59:51
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
-- 表的结构 `api`
--

CREATE TABLE `api` (
  `id` bigint NOT NULL COMMENT '主键id',
  `code` varchar(255) NOT NULL COMMENT '接口编码',
  `name` varchar(100) DEFAULT NULL COMMENT '接口名称',
  `notes` varchar(200) DEFAULT NULL COMMENT '接口描述',
  `method` varchar(20) DEFAULT NULL COMMENT '请求方法',
  `class_name` varchar(255) DEFAULT NULL COMMENT '类名',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `path` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `content_type` varchar(100) DEFAULT NULL COMMENT '响应类型',
  `service_id` varchar(100) DEFAULT NULL COMMENT '服务ID',
  `status` char(1) DEFAULT '0' COMMENT 'API状态:0:启用 1:禁用',
  `auth` char(1) DEFAULT '0' COMMENT '是否认证:0:不认证 1:认证',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统接口表';

-- --------------------------------------------------------

--
-- 表的结构 `attachment`
--

CREATE TABLE `attachment` (
  `id` bigint NOT NULL COMMENT '附件ID',
  `storage_id` bigint NOT NULL DEFAULT '0' COMMENT '存储ID',
  `attachment_group_id` int NOT NULL DEFAULT '0' COMMENT '组ID',
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

INSERT INTO `attachment` (`id`, `storage_id`, `attachment_group_id`, `name`, `size`, `url`, `file_name`, `thumb_url`, `type`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`, `is_recycle`) VALUES
(13, 0, 0, 'timg (3).jpeg', 26516, 'https://cdn.ckjia.com/10e258da699b4c318ff59e24f2599420.jpeg', '10e258da699b4c318ff59e24f2599420.jpeg', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(16, 0, 0, 'background.jpg', 261548, 'https://cdn.ckjia.com/3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg', '3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(17, 0, 0, 'nav-icon-new.active.png', 3036, 'https://cdn.ckjia.com/5efe50fcd0e744eaa7a2e7c6d851dd82.png', '5efe50fcd0e744eaa7a2e7c6d851dd82.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(18, 0, 0, 'nav-icon-user.active.png', 2150, 'https://cdn.ckjia.com/90cef6a278b34c1690af938193e2d813.png', '90cef6a278b34c1690af938193e2d813.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(19, 0, 0, 'nav-icon-cat.active.png', 3338, 'https://cdn.ckjia.com/8ffa2bf6e6e7491b8460bf308abd30de.png', '8ffa2bf6e6e7491b8460bf308abd30de.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(20, 0, 0, 'nav-icon-index.active.png', 2754, 'https://cdn.ckjia.com/478acfc9aeb140a4b79c6402ba3bd021.png', '478acfc9aeb140a4b79c6402ba3bd021.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(21, 0, 0, 'baiduzhifu2x.png', 19415, 'https://cdn.ckjia.com/5ba794ec8d054ce995d37d364c5a9836.png', '5ba794ec8d054ce995d37d364c5a9836.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(22, 0, 0, 'h_seckill.png', 6008, 'https://cdn.ckjia.com/897d70b0635f48999baa635d6debbbee.png', '897d70b0635f48999baa635d6debbbee.png', '', 1, NULL, NULL, NULL, NULL, '0', 0),
(24, 0, 0, 'mate-bg2.jpeg', 79028, 'https://cdn.ckjia.com/7667a4086d3c40948207dc8e02b52ff9.jpeg', '7667a4086d3c40948207dc8e02b52ff9.jpeg', '', 1, NULL, NULL, NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `blacklist`
--

CREATE TABLE `blacklist` (
  `id` bigint NOT NULL COMMENT '主键id',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `request_uri` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(10) DEFAULT NULL COMMENT '请求方法',
  `start_time` varchar(32) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(32) DEFAULT NULL COMMENT '结束时间',
  `status` char(1) DEFAULT '0' COMMENT '状态：0:关闭 1:开启',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统黑名单表';

--
-- 转存表中的数据 `blacklist`
--

INSERT INTO `blacklist` (`id`, `ip`, `request_uri`, `request_method`, `start_time`, `end_time`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
(1, NULL, '/**/actuator/**', 'ALL', NULL, NULL, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `client`
--

CREATE TABLE `client` (
  `id` bigint NOT NULL COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '自动授权',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户端表';

--
-- 转存表中的数据 `client`
--

INSERT INTO `client` (`id`, `client_id`, `client_secret`, `resource_ids`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`, `create_by`, `update_by`, `create_time`, `update_time`, `status`, `is_deleted`) VALUES
(1, 'mate', 'secret', NULL, 'all', 'refresh_token,password,authorization_code,captcha,sms,social', 'http://localhost:10001', NULL, 3600, 3600, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `id` bigint NOT NULL COMMENT '主键',
  `parent_id` bigint DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '码',
  `c_key` varchar(255) DEFAULT NULL COMMENT '值',
  `value` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置表';

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `parent_id`, `code`, `c_key`, `value`, `sort`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, 0, 'oss', 'default', 'qiniuoss', 0, '默认OSS配置', NULL, NULL, '2020-08-08 01:44:31', '2020-12-16 09:37:21', 0),
(2, 1, 'alioss', 'endpoint', 'oss-cn-beijing.aliyuncs.com', 1, '对象存储服务的URL', NULL, NULL, '2020-08-08 01:46:10', '2020-08-09 16:14:15', 0),
(3, 1, 'alioss', 'customDomain', 'mall-zaitong.oss-cn-beijing.aliyuncs.com', 2, '自定义域名', NULL, NULL, '2020-08-08 01:46:32', '2020-08-09 16:14:08', 0),
(4, 1, 'alioss', 'pathStyleAccess', 'false', 3, 'pathStyleAccess', NULL, NULL, '2020-08-08 01:47:21', '2020-08-08 01:47:35', 0),
(5, 1, 'alioss', 'accessKey', 'LTA******rzjrV', 4, 'Access Key', NULL, NULL, '2020-08-08 01:47:40', '2020-08-09 07:53:48', 0),
(6, 1, 'alioss', 'secretKey', '9H6Bxg**************bfNoy4E', 5, 'Access Secret', NULL, NULL, '2020-08-08 01:53:13', '2020-08-10 01:31:53', 0),
(7, 1, 'alioss', 'bucketName', 'm********g', 6, '空间名', NULL, NULL, '2020-08-08 01:53:14', '2020-08-09 16:13:15', 0),
(8, 1, 'qiniuoss', 'endpoint', 's3-cn-south-1.qiniucs.com', 1, '对象存储服务的URL', NULL, NULL, '2020-08-08 01:46:10', '2020-08-10 01:33:31', 0),
(9, 1, 'qiniuoss', 'customDomain', 'cd**********com8878556757657', 2, '自定义域名', NULL, NULL, '2020-08-08 01:46:32', '2020-11-15 20:02:32', 0),
(10, 1, 'qiniuoss', 'pathStyleAccess', 'false', 3, 'pathStyleAccess', NULL, NULL, '2020-08-08 01:47:21', '2020-08-08 01:47:35', 0),
(11, 1, 'qiniuoss', 'accessKey', 'pj2M-4k_*********************dQpjb1L', 4, 'Access Key', NULL, NULL, '2020-08-08 01:47:40', '2020-08-10 01:33:31', 0),
(12, 1, 'qiniuoss', 'secretKey', 'Dx17O-dbR*******************Mxlc4bb', 5, 'Access Secret', NULL, NULL, '2020-08-08 01:53:13', '2020-08-10 01:33:31', 0),
(13, 1, 'qiniuoss', 'bucketName', 'ckjia', 6, '空间名', NULL, NULL, '2020-08-08 01:53:14', '2020-08-10 01:33:31', 0),
(14, 1, 'miniooss', 'endpoint', '66666', 1, '对象存储服务的URL', NULL, NULL, '2020-08-08 01:46:10', '2020-08-09 02:03:52', 0),
(15, 1, 'miniooss', 'customDomain', '2222', 2, '自定义域名', NULL, NULL, '2020-08-08 01:46:32', '2020-08-08 16:55:54', 0),
(16, 1, 'miniooss', 'pathStyleAccess', 'false', 3, 'pathStyleAccess', NULL, NULL, '2020-08-08 01:47:21', '2020-08-08 01:47:35', 0),
(17, 1, 'miniooss', 'accessKey', '3333', 4, 'Access Key', NULL, NULL, '2020-08-08 01:47:40', '2020-08-08 16:55:58', 0),
(18, 1, 'miniooss', 'secretKey', '4444', 5, 'Access Secret', NULL, NULL, '2020-08-08 01:53:13', '2020-08-08 16:56:02', 0),
(19, 1, 'miniooss', 'bucketName', '5555', 6, '空间名', NULL, NULL, '2020-08-08 01:53:14', '2020-08-08 16:56:06', 0);

-- --------------------------------------------------------

--
-- 表的结构 `data_source`
--

CREATE TABLE `data_source` (
  `id` int NOT NULL COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `db_type` varchar(50) NOT NULL DEFAULT '' COMMENT '数据库类型',
  `driver_class` varchar(100) DEFAULT NULL COMMENT '驱动类型',
  `url` varchar(500) DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源表';

--
-- 转存表中的数据 `data_source`
--

INSERT INTO `data_source` (`id`, `name`, `db_type`, `driver_class`, `url`, `username`, `password`, `remark`, `status`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, 'ldx', 'mysql', 'com.mysql.cj.jdbc.Driver', 'localhost:3306', 'root', 'root', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dept`
--

CREATE TABLE `dept` (
  `id` bigint NOT NULL COMMENT '部门ID',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `parent_id` bigint DEFAULT '0' COMMENT '上级ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组织机构表';

--
-- 转存表中的数据 `dept`
--

INSERT INTO `dept` (`id`, `name`, `sort`, `remark`, `status`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`, `parent_id`) VALUES
(1, '开发部', 0, 'sssss', 0, NULL, NULL, 1648194303, 1648194303, '0', -1),
(2, '开发分部', 0, NULL, 0, NULL, NULL, NULL, NULL, '1', 1),
(3, '开发二部', 2, '测试更新', 0, NULL, NULL, NULL, 1648880538, '0', 1),
(4, '产品部', 2, 'sa', 0, NULL, NULL, NULL, 1648880550, '0', -1),
(5, '产品一部', 1, 'da', 1, NULL, NULL, NULL, 1649231206, '0', 4),
(6, 'sjsj', 0, NULL, 0, NULL, NULL, NULL, 1648886605, '1', -1);

-- --------------------------------------------------------

--
-- 表的结构 `dept_role`
--

CREATE TABLE `dept_role` (
  `id` bigint NOT NULL COMMENT '主键',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- --------------------------------------------------------

--
-- 表的结构 `dict`
--

CREATE TABLE `dict` (
  `id` bigint NOT NULL COMMENT '主键',
  `parent_id` bigint DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典表';

--
-- 转存表中的数据 `dict`
--

INSERT INTO `dict` (`id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(1, 0, 'status', '-1', '状态', 1, '', NULL, NULL, '2020-07-01 09:59:15', '2020-07-01 10:02:00', 0),
(2, 1, 'status', '0', '启用', 1, NULL, NULL, NULL, '2020-07-01 10:02:23', '2020-07-01 10:02:59', 0),
(3, 1, 'status', '1', '禁用', 2, NULL, NULL, NULL, '2020-07-01 10:02:34', '2020-07-01 10:02:59', 0),
(4, 0, 'dbtype', '-1', '数据库类型', 1, NULL, NULL, NULL, '2020-07-11 08:47:02', NULL, 0),
(5, 4, 'dbtype', 'mysql', 'com.mysql.cj.jdbc.Driver', 1, NULL, NULL, NULL, '2020-07-11 08:47:44', '2020-07-11 08:53:11', 0),
(6, 4, 'dbtype', 'oracle', 'oracle.jdbc.OracleDriver', 2, NULL, NULL, NULL, '2020-07-11 08:48:00', '2020-07-11 08:54:05', 0),
(7, 4, 'dbtype', 'oracle12c', 'oracle.jdbc.OracleDriver', 3, NULL, NULL, NULL, '2020-07-11 08:49:10', '2020-07-11 08:54:12', 0),
(24, 0, 'ok', '-1', '确认', NULL, NULL, NULL, NULL, '2020-07-19 13:31:16', '2020-07-19 21:31:28', 0),
(25, 24, 'ok', 'yes', '是', NULL, NULL, NULL, NULL, '2020-07-19 21:31:40', '2020-07-20 05:32:12', 0),
(26, 24, 'ok', 'no', '否', NULL, NULL, NULL, NULL, '2020-07-20 05:32:06', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

CREATE TABLE `log` (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `trace_id` varchar(64) DEFAULT NULL COMMENT '跟踪ID',
  `title` varchar(64) DEFAULT NULL COMMENT '日志标题',
  `operation` text COMMENT '操作内容',
  `method` varchar(64) DEFAULT NULL COMMENT '执行方法',
  `params` text COMMENT '参数',
  `url` varchar(128) DEFAULT NULL COMMENT '请求路径',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip地址',
  `exception` text,
  `execute_time` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `location` varchar(64) DEFAULT NULL COMMENT '地区',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `tenant_id` int DEFAULT NULL COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志表';

-- --------------------------------------------------------

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
(1000, '系统管理', NULL, '/system', 'Layout', 0, 'ant-design:appstore-outlined', 1, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1100, '用户管理', NULL, '/system/user', '/system/user/index', 1000, 'ant-design:user-outlined', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
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
(1400, '部门管理', NULL, '/system/depart', '/system/depart/index', 1000, 'ant-design:apartment-outlined', 3, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1401, '部门新增', 'sys:depart:add', NULL, NULL, 1400, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1402, '部门修改', 'sys:depart:edit', NULL, NULL, 1400, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1403, '部门删除', 'sys:depart:delete', NULL, NULL, 1400, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(1404, '部门导出', 'sys:depart:export', NULL, NULL, 1400, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2015, '开发运维', NULL, '/devops', 'Layout', 0, 'ant-design:tool-outlined', 3, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2016, '数据源管理', '', '/devops/datasource', '/devops/datasource/index', 2015, 'ant-design:database-outlined', 1, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2017, '数据源新增', 'sys:datasource:add', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2018, '数据源修改', 'sys:datasource:edit', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2019, '数据源删除', 'sys:datasource:delete', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2020, '数据源导出', 'sys:datasource:export', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2021, '代码生成', NULL, '/devops/generator', '/devops/generator/index', 2015, 'ant-design:experiment-outlined', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2022, '代码生成', 'devops:gen', NULL, NULL, 2021, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2023, '监控配置中心ss', 'test', '/devops/monitor', '/devops/monitor/index', 0, 'ant-design:desktop-outlined', 1, '0', '1', '1', '0', NULL, NULL, NULL, 1649677441, '0', '0'),
(2026, '客户端管理', NULL, '/system/client', '/system/client/index', 1000, 'ant-design:mobile-outlined', 7, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2027, '新增客户端', 'sys:client:add', NULL, NULL, 2026, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2028, '修改客户端', 'sys:client:edit', NULL, NULL, 2026, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2029, '删除客户端', 'sys:client:delete', NULL, NULL, 2026, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2030, '导出客户端', 'sys:client:export', NULL, NULL, 2026, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2031, '启禁客户端', 'sys:client:status', NULL, NULL, 2026, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2032, '操作日志', NULL, '/system/log', '/system/log/index', 1000, 'ant-design:ordered-list-outlined', 8, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2033, '详细日志', 'sys:log:detail', NULL, NULL, 2032, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2034, '日志删除', 'sys:log:delete', NULL, NULL, 2032, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2035, '字典管理', NULL, '/system/dict', '/system/dict/index', 1000, 'ant-design:read-outlined', 6, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2036, '新增字典', 'sys:dict:add', NULL, NULL, 2035, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2037, '修改字典', 'sys:dict:edit', NULL, NULL, 2035, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2038, '删除字典', 'sys:dict:delete', NULL, NULL, 2035, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2045, '网关中心', NULL, '/gateway', 'Layout', 0, 'ant-design:instagram-outlined', 2, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2047, '黑名单管理', NULL, '/gateway/blacklist', '/gateway/blacklist/index', 2045, 'ant-design:codepen-square-filled', 3, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2048, '新增黑名单', 'gw:bl:add', NULL, NULL, 2047, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2049, '修改黑名单', 'gw:bl:edit', NULL, NULL, 2047, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2050, '删除黑名单', 'gw:bl:del', NULL, NULL, 2047, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2051, '黑名单状态', 'gw:bl:status', NULL, NULL, 2047, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2055, 'API管理', NULL, '/gateway/api', '/gateway/api/index', 2045, 'ant-design:sliders-outlined', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2056, '微服务管理', NULL, '/gateway/route', '/gateway/route/index', 2045, 'ant-design:ungroup-outlined', 1, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2057, '同步API', 'gw:api:sync', NULL, NULL, 2055, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2058, '删除API', 'gw:api:del', NULL, NULL, 2055, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2059, '修改API', 'gw:api:edit', NULL, NULL, 2055, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2060, '新增微服务', 'gw:route:add', NULL, NULL, 2056, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2061, '修改微服务', 'gw:route:edit', NULL, NULL, 2056, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2062, '删除微服务', 'gw:route:del', NULL, NULL, 2056, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2064, '工作台', NULL, '/dashboard', 'Layout', 0, 'ant-design:windows-outlined', 0, '0', '0', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2065, '分析页', NULL, '/dashboard', '/dashboard/analysis/index', 2064, 'ant-design:rise-outlined', 0, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2068, '工作台', NULL, '/dashboard/workbench', '/dashboard/workbench/index', 2064, 'ant-design:block-outlined', 2, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2069, '关于Artemis', NULL, '/about/index', '/sys/about/index', 0, 'ant-design:info-circle-outlined', 100, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0');

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
(2716, 1000, 2, 0, 0),
(2717, 1300, 2, 0, 0),
(2718, 1301, 2, 0, 0),
(2719, 1302, 2, 0, 0),
(2720, 1303, 2, 0, 0),
(2721, 1304, 2, 0, 0),
(2722, 1305, 2, 0, 0),
(2723, 1306, 2, 0, 0),
(2724, 1100, 2, 0, 0),
(2725, 1101, 2, 0, 0),
(2726, 1102, 2, 0, 0),
(2727, 1103, 2, 0, 0),
(2728, 1104, 2, 0, 0),
(2729, 1105, 2, 0, 0),
(2730, 1106, 2, 0, 0),
(2731, 1400, 2, 0, 0),
(2732, 1401, 2, 0, 0),
(2733, 1402, 2, 0, 0),
(2734, 1403, 2, 0, 0),
(2735, 1404, 2, 0, 0),
(2736, 1200, 2, 0, 0),
(2737, 1201, 2, 0, 0),
(2738, 1202, 2, 0, 0),
(2739, 1203, 2, 0, 0),
(2740, 1204, 2, 0, 0),
(2741, 1205, 2, 0, 0),
(2742, 2035, 2, 0, 0),
(2743, 2036, 2, 0, 0),
(2744, 2037, 2, 0, 0),
(2745, 2038, 2, 0, 0),
(2746, 2026, 2, 0, 0),
(2747, 2027, 2, 0, 0),
(2748, 2028, 2, 0, 0),
(2749, 2029, 2, 0, 0),
(2750, 2030, 2, 0, 0),
(2751, 2031, 2, 0, 0),
(2752, 2032, 2, 0, 0),
(2753, 2034, 2, 0, 0),
(2754, 2033, 2, 0, 0);

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
(1, '超级管理员', 'super', '超级管理员组', 1, '0', NULL, NULL, 1649578786, 1649673962, '0'),
(2, '管理员', 'admin', '管理员', 2, '0', NULL, NULL, 1649578786, 1649674792, '0');

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
(2, 3, 2, NULL, NULL),
(9, 22, 2, 0, 0),
(10, 2, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `route`
--

CREATE TABLE `route` (
  `id` bigint NOT NULL COMMENT '主键id',
  `name` varchar(100) DEFAULT NULL COMMENT '服务名称',
  `path` varchar(255) DEFAULT NULL COMMENT '服务前缀',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `service_id` varchar(100) DEFAULT NULL COMMENT '服务编码',
  `status` char(1) DEFAULT '0' COMMENT 'API状态:0:启用 1:禁用',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `tenant_id` int DEFAULT NULL COMMENT '租户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统路由表';

--
-- 转存表中的数据 `route`
--

INSERT INTO `route` (`id`, `name`, `path`, `url`, `service_id`, `status`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`, `tenant_id`) VALUES
(1, '系统服务', '/mate-system/**', 'mate-system', 'mate-system', '0', NULL, NULL, NULL, NULL, '0', NULL),
(2, '认证服务', '/mate-uaa/**', 'mate-uaa', 'mate-uaa', '0', NULL, NULL, NULL, NULL, '0', NULL),
(3, '代码服务', '/mate-code/**', 'mate-code', 'mate-code', '0', NULL, NULL, NULL, NULL, '0', NULL),
(4, '组件服务', '/mate-component/**', 'mate-component', 'mate-component', '0', NULL, NULL, NULL, NULL, '0', NULL);

-- --------------------------------------------------------

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
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` int DEFAULT NULL COMMENT '生日',
  `sex` smallint DEFAULT NULL COMMENT '性别',
  `dept_id` bigint DEFAULT '0' COMMENT '部门id',
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

INSERT INTO `user` (`id`, `account`, `password`, `nickname`, `real_name`, `avatar`, `email`, `telephone`, `birthday`, `sex`, `dept_id`, `status`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(2, 'vben', '123456', 'admi1', '超级管理员', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'vben@mate.vip1', '18810001000', NULL, 1, 1, '1', 'test', NULL, NULL, NULL, NULL, '0'),
(3, 'amin2', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'amin2', '杨幂', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mat02e@mate.vip', '18910001002', NULL, 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(4, 'amin4', '{bcrypt}$2a$10$UIrEMyC0GUIUdJuGPYeGO.Nc8AZYlTiC8MUttPaYQ7P.V5q/cTAAG', 'adin4', '刘德华', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate3@mate.vip', '18910001004', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(6, 'adm6n', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'adin6', 'mate6', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mat6e@mate.vip', '18910001006', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '1'),
(22, 'pp1', '{bcrypt}$2a$10$jddK.xwTn99XM9ggy64Zgu.eBK2GBiyk9RmtQEjg99S2F8otQ8ieq', 'pp1', '11', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'pp1@163.com', '1899', NULL, 2, 1, '0', '', NULL, NULL, NULL, NULL, '0');

--
-- 转储表的索引
--

--
-- 表的索引 `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- 表的索引 `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `data_source`
--
ALTER TABLE `data_source`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `dept_role`
--
ALTER TABLE `dept_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `dict`
--
ALTER TABLE `dict`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `log`
--
ALTER TABLE `log`
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
-- 表的索引 `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- 表的索引 `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- 使用表AUTO_INCREMENT `api`
--
ALTER TABLE `api`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=89;

--
-- 使用表AUTO_INCREMENT `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '附件ID', AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `data_source`
--
ALTER TABLE `data_source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `dept`
--
ALTER TABLE `dept`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `dept_role`
--
ALTER TABLE `dept_role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `dict`
--
ALTER TABLE `dict`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=2070;

--
-- 使用表AUTO_INCREMENT `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2755;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `route`
--
ALTER TABLE `route`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
