-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-04-02 00:55:38
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
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `tenant_id` int DEFAULT NULL COMMENT '租户ID'
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
-- 表的结构 `depart`
--

CREATE TABLE `depart` (
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
-- 转存表中的数据 `depart`
--

INSERT INTO `depart` (`id`, `name`, `sort`, `remark`, `status`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`, `parent_id`) VALUES
(1, '开发部', 0, 'sssss', 0, NULL, NULL, 1648194303, 1648194303, '0', -1),
(2, '开发分部', 0, NULL, 0, NULL, NULL, NULL, NULL, '0', 1),
(3, '开发二部', 1, NULL, 0, NULL, NULL, NULL, NULL, '0', 1),
(4, '产品部', 1, NULL, 0, NULL, NULL, NULL, NULL, '0', -1),
(5, '产品一部', 1, NULL, 0, NULL, NULL, NULL, NULL, '0', 4);

-- --------------------------------------------------------

--
-- 表的结构 `depart_role`
--

CREATE TABLE `depart_role` (
  `id` bigint NOT NULL COMMENT '主键',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `depart_id` bigint NOT NULL COMMENT '部门ID',
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
(1000, '系统管理', NULL, '/system', 'Layout', -1, 'ant-design:appstore-outlined', 1, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
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
(2015, '开发运维', NULL, '/devops', 'Layout', -1, 'ant-design:tool-outlined', 3, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2016, '数据源管理', '', '/devops/datasource', '/devops/datasource/index', 2015, 'ant-design:database-outlined', 1, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2017, '数据源新增', 'sys:datasource:add', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2018, '数据源修改', 'sys:datasource:edit', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2019, '数据源删除', 'sys:datasource:delete', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2020, '数据源导出', 'sys:datasource:export', NULL, NULL, 2016, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2021, '代码生成', NULL, '/devops/generator', '/devops/generator/index', 2015, 'ant-design:experiment-outlined', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2022, '代码生成', 'devops:gen', NULL, NULL, 2021, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2023, '监控配置中心', NULL, '/devops/monitor', '/devops/monitor/index', 2015, 'ant-design:desktop-outlined', 3, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
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
(2039, '组件管理', NULL, '/content/component', '/content/component/index', 2040, 'ant-design:usb-outlined', 1, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2040, '内容管理', NULL, '/content', 'Layout', -1, 'ant-design:dribbble-outlined', 4, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2041, '文件管理', NULL, '/content/attachment', '/content/attachment/index', 2040, 'ant-design:folder-open-twotone', 2, '0', '1', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2042, '修改组件', 'sys:comp:edit', NULL, NULL, 2039, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2043, '上传文件', 'sys:attach:add', NULL, NULL, 2041, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2044, '删除文件', 'sys:attach:delete', NULL, NULL, 2041, NULL, 1, '0', '2', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
(2045, '网关中心', NULL, '/gateway', 'Layout', -1, 'ant-design:instagram-outlined', 2, '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0'),
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
(2064, '工作台', NULL, '/dashboard', 'Layout', -1, 'ant-design:windows-outlined', 0, '0', '0', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2065, '分析页', NULL, '/dashboard', '/dashboard/analysis/index', 2064, 'ant-design:rise-outlined', 0, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2068, '工作台', NULL, '/dashboard/workbench', '/dashboard/workbench/index', 2064, 'ant-design:block-outlined', 2, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0'),
(2069, '关于Artemis', NULL, '/about/index', '/sys/about/index', -1, 'ant-design:info-circle-outlined', 100, '0', '1', '0', '0', NULL, NULL, NULL, NULL, '0', '0');

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
(977, 1000, 2, NULL, NULL),
(978, 1300, 2, NULL, NULL),
(979, 1301, 2, NULL, NULL),
(980, 1302, 2, NULL, NULL),
(981, 1303, 2, NULL, NULL),
(982, 2009, 2, NULL, NULL),
(2171, NULL, NULL, NULL, NULL),
(2370, 1000, 3, NULL, NULL),
(2371, 1300, 3, NULL, NULL),
(2372, 1301, 3, NULL, NULL),
(2373, 1302, 3, NULL, NULL),
(2374, 1303, 3, NULL, NULL),
(2375, 1304, 3, NULL, NULL),
(2376, 1305, 3, NULL, NULL),
(2377, 1306, 3, NULL, NULL),
(2378, 1100, 3, NULL, NULL),
(2379, 1101, 3, NULL, NULL),
(2380, 1102, 3, NULL, NULL),
(2381, 1103, 3, NULL, NULL),
(2382, 1104, 3, NULL, NULL),
(2383, 1105, 3, NULL, NULL),
(2384, 1106, 3, NULL, NULL),
(2385, 1400, 3, NULL, NULL),
(2386, 1401, 3, NULL, NULL),
(2387, 1402, 3, NULL, NULL),
(2388, 1403, 3, NULL, NULL),
(2389, 1404, 3, NULL, NULL),
(2390, 1200, 3, NULL, NULL),
(2391, 1201, 3, NULL, NULL),
(2392, 1202, 3, NULL, NULL),
(2393, 1203, 3, NULL, NULL),
(2394, 1204, 3, NULL, NULL),
(2395, 1205, 3, NULL, NULL),
(2396, 2039, 3, NULL, NULL),
(2397, 2042, 3, NULL, NULL),
(2398, 2035, 3, NULL, NULL),
(2399, 2036, 3, NULL, NULL),
(2400, 2037, 3, NULL, NULL),
(2401, 2038, 3, NULL, NULL),
(2402, 2026, 3, NULL, NULL),
(2403, 2027, 3, NULL, NULL),
(2404, 2028, 3, NULL, NULL),
(2405, 2029, 3, NULL, NULL),
(2406, 2030, 3, NULL, NULL),
(2407, 2031, 3, NULL, NULL),
(2408, 2032, 3, NULL, NULL),
(2409, 2033, 3, NULL, NULL),
(2410, 2034, 3, NULL, NULL),
(2411, 2045, 3, NULL, NULL),
(2412, 2056, 3, NULL, NULL),
(2413, 2060, 3, NULL, NULL),
(2414, 2061, 3, NULL, NULL),
(2415, 2062, 3, NULL, NULL),
(2416, 2055, 3, NULL, NULL),
(2417, 2057, 3, NULL, NULL),
(2418, 2058, 3, NULL, NULL),
(2419, 2059, 3, NULL, NULL),
(2420, 2047, 3, NULL, NULL),
(2421, 2048, 3, NULL, NULL),
(2422, 2049, 3, NULL, NULL),
(2423, 2050, 3, NULL, NULL),
(2424, 2051, 3, NULL, NULL),
(2567, 2064, 4, NULL, NULL),
(2568, 2065, 4, NULL, NULL),
(2569, 1000, 4, NULL, NULL),
(2570, 1300, 4, NULL, NULL),
(2571, 1301, 4, NULL, NULL),
(2572, 1302, 4, NULL, NULL),
(2573, 1303, 4, NULL, NULL),
(2574, 1304, 4, NULL, NULL),
(2575, 1305, 4, NULL, NULL),
(2576, 1306, 4, NULL, NULL),
(2577, 1100, 4, NULL, NULL),
(2578, 1101, 4, NULL, NULL),
(2579, 1102, 4, NULL, NULL),
(2580, 1103, 4, NULL, NULL),
(2581, 1104, 4, NULL, NULL),
(2582, 1105, 4, NULL, NULL),
(2583, 1106, 4, NULL, NULL),
(2584, 1400, 4, NULL, NULL),
(2585, 1401, 4, NULL, NULL),
(2586, 1402, 4, NULL, NULL),
(2587, 1403, 4, NULL, NULL),
(2588, 1404, 4, NULL, NULL),
(2589, 1200, 4, NULL, NULL),
(2590, 1201, 4, NULL, NULL),
(2591, 1202, 4, NULL, NULL),
(2592, 1203, 4, NULL, NULL),
(2593, 1204, 4, NULL, NULL),
(2594, 1205, 4, NULL, NULL),
(2595, 2035, 4, NULL, NULL),
(2596, 2036, 4, NULL, NULL),
(2597, 2037, 4, NULL, NULL),
(2598, 2038, 4, NULL, NULL),
(2599, 2026, 4, NULL, NULL),
(2600, 2027, 4, NULL, NULL),
(2601, 2028, 4, NULL, NULL),
(2602, 2029, 4, NULL, NULL),
(2603, 2030, 4, NULL, NULL),
(2604, 2031, 4, NULL, NULL),
(2605, 2032, 4, NULL, NULL),
(2606, 2033, 4, NULL, NULL),
(2607, 2034, 4, NULL, NULL),
(2608, 2045, 4, NULL, NULL),
(2609, 2056, 4, NULL, NULL),
(2610, 2060, 4, NULL, NULL),
(2611, 2061, 4, NULL, NULL),
(2612, 2062, 4, NULL, NULL),
(2613, 2055, 4, NULL, NULL),
(2614, 2057, 4, NULL, NULL),
(2615, 2058, 4, NULL, NULL),
(2616, 2059, 4, NULL, NULL),
(2617, 2047, 4, NULL, NULL),
(2618, 2048, 4, NULL, NULL),
(2619, 2049, 4, NULL, NULL),
(2620, 2050, 4, NULL, NULL),
(2621, 2051, 4, NULL, NULL),
(2622, 2015, 4, NULL, NULL),
(2623, 2016, 4, NULL, NULL),
(2624, 2017, 4, NULL, NULL),
(2625, 2018, 4, NULL, NULL),
(2626, 2019, 4, NULL, NULL),
(2627, 2020, 4, NULL, NULL),
(2628, 2021, 4, NULL, NULL),
(2629, 2022, 4, NULL, NULL),
(2630, 2023, 4, NULL, NULL),
(2631, 2040, 4, NULL, NULL),
(2632, 2053, 4, NULL, NULL),
(2633, 2039, 4, NULL, NULL),
(2634, 2042, 4, NULL, NULL),
(2635, 2041, 4, NULL, NULL),
(2636, 2043, 4, NULL, NULL),
(2637, 2044, 4, NULL, NULL),
(2638, 1000, 1, NULL, NULL),
(2639, 1300, 1, NULL, NULL),
(2640, 1301, 1, NULL, NULL),
(2641, 1302, 1, NULL, NULL),
(2642, 1303, 1, NULL, NULL),
(2643, 1304, 1, NULL, NULL),
(2644, 1305, 1, NULL, NULL),
(2645, 1306, 1, NULL, NULL),
(2646, 1100, 1, NULL, NULL),
(2647, 1101, 1, NULL, NULL),
(2648, 1102, 1, NULL, NULL),
(2649, 1103, 1, NULL, NULL),
(2650, 1104, 1, NULL, NULL),
(2651, 1105, 1, NULL, NULL),
(2652, 1106, 1, NULL, NULL),
(2653, 1400, 1, NULL, NULL),
(2654, 1401, 1, NULL, NULL),
(2655, 1402, 1, NULL, NULL),
(2656, 1403, 1, NULL, NULL),
(2657, 1404, 1, NULL, NULL),
(2658, 1200, 1, NULL, NULL),
(2659, 1201, 1, NULL, NULL),
(2660, 1202, 1, NULL, NULL),
(2661, 1203, 1, NULL, NULL),
(2662, 1204, 1, NULL, NULL),
(2663, 1205, 1, NULL, NULL),
(2664, 2035, 1, NULL, NULL),
(2665, 2036, 1, NULL, NULL),
(2666, 2037, 1, NULL, NULL),
(2667, 2038, 1, NULL, NULL),
(2668, 2026, 1, NULL, NULL),
(2669, 2027, 1, NULL, NULL),
(2670, 2028, 1, NULL, NULL),
(2671, 2029, 1, NULL, NULL),
(2672, 2030, 1, NULL, NULL),
(2673, 2031, 1, NULL, NULL),
(2674, 2032, 1, NULL, NULL),
(2675, 2033, 1, NULL, NULL),
(2676, 2034, 1, NULL, NULL),
(2677, 2039, 1, NULL, NULL),
(2678, 2042, 1, NULL, NULL),
(2679, 2040, 1, NULL, NULL),
(2680, 2053, 1, NULL, NULL),
(2681, 2041, 1, NULL, NULL),
(2682, 2043, 1, NULL, NULL),
(2683, 2044, 1, NULL, NULL),
(2684, 2045, 1, NULL, NULL),
(2685, 2056, 1, NULL, NULL),
(2686, 2060, 1, NULL, NULL),
(2687, 2061, 1, NULL, NULL),
(2688, 2062, 1, NULL, NULL),
(2689, 2055, 1, NULL, NULL),
(2690, 2057, 1, NULL, NULL),
(2691, 2058, 1, NULL, NULL),
(2692, 2059, 1, NULL, NULL),
(2693, 2047, 1, NULL, NULL),
(2694, 2048, 1, NULL, NULL),
(2695, 2049, 1, NULL, NULL),
(2696, 2050, 1, NULL, NULL),
(2697, 2051, 1, NULL, NULL),
(2698, 2015, 1, NULL, NULL),
(2699, 2016, 1, NULL, NULL),
(2700, 2017, 1, NULL, NULL),
(2701, 2018, 1, NULL, NULL),
(2702, 2019, 1, NULL, NULL),
(2703, 2020, 1, NULL, NULL),
(2704, 2021, 1, NULL, NULL),
(2705, 2022, 1, NULL, NULL),
(2706, 2023, 1, NULL, NULL),
(2707, 2065, 1, NULL, NULL),
(2708, 2068, 1, NULL, NULL),
(2709, 2064, 1, NULL, NULL);

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
(1, '超级管理员', 'super', '超级管理员组', 0, '0', NULL, NULL, NULL, NULL, '0'),
(2, '管理员', 'admin', '管理员', 0, '0', NULL, NULL, NULL, NULL, '0');

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
(1, 2, 1, NULL, NULL);

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
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` smallint DEFAULT NULL COMMENT '性别',
  `depart_id` bigint DEFAULT '0' COMMENT '部门id',
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

INSERT INTO `user` (`id`, `account`, `password`, `name`, `real_name`, `avatar`, `email`, `telephone`, `birthday`, `sex`, `depart_id`, `status`, `remark`, `create_by`, `update_by`, `create_time`, `update_time`, `is_deleted`) VALUES
(2, 'vben', '123456', 'admin', '超级管理员', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18810001000', '2022-03-14 16:24:08', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, '0'),
(3, 'admin2', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'admin2', '杨幂', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 4, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(4, 'admin4', '{bcrypt}$2a$10$UIrEMyC0GUIUdJuGPYeGO.Nc8AZYlTiC8MUttPaYQ7P.V5q/cTAAG', 'admin4', '刘德华', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(5, 'admin5', '{bcrypt}$2a$10$WF2dEcJetVqRFOn/AfrfZu4.Z5HcBFZ49/fL/KKOQ6b.xJtXZHoqe', 'admin5', 'mate', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(6, 'admin6', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'admin6', 'mate', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(7, 'admin7', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'admin6', 'mate', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(8, 'admin8', '{bcrypt}$2a$10$6YPJ0dkaqh9x3zwTfidRBeT0U5vJ7Si7wXFx9Gc/K3pMxz8J18TrW', 'admin6', 'mate', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '0', NULL, NULL, NULL, NULL, NULL, '0'),
(9, 'admin9', '{bcrypt}$2a$10$pDzXQpiSIl74Jekj9CxMWOPbEV9MHkjkZ7GXX/RomtIyXz8m6Ruia', 'admin6', 'mate', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '1', NULL, NULL, NULL, NULL, NULL, '0'),
(10, 'admin10', '{bcrypt}$2a$10$A5cfRbFDCsOg.1UTlWyEZu8DJHSr9GnANXQMsRSIDAtZHuiQicr0K', 'admin6', '测试管理员', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'mate@mate.vip', '18910001000', NULL, 1, 1, '1', '测试管理员', NULL, NULL, NULL, NULL, '0'),
(22, 'pp1', '{bcrypt}$2a$10$jddK.xwTn99XM9ggy64Zgu.eBK2GBiyk9RmtQEjg99S2F8otQ8ieq', 'pp1', '11', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg', 'pp1@163.com', '1899', '2020-06-26 16:00:00', 2, 1, '0', NULL, NULL, NULL, NULL, NULL, '0');

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
-- 表的索引 `depart`
--
ALTER TABLE `depart`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `depart_role`
--
ALTER TABLE `depart_role`
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
-- 使用表AUTO_INCREMENT `depart`
--
ALTER TABLE `depart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `depart_role`
--
ALTER TABLE `depart_role`
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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2710;

--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
