-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: vben
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '附件ID',
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
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (13,0,0,'timg (3).jpeg',26516,'https://cdn.ckjia.com/10e258da699b4c318ff59e24f2599420.jpeg','10e258da699b4c318ff59e24f2599420.jpeg','',1,NULL,NULL,NULL,NULL,'0',0),(16,0,0,'background.jpg',261548,'https://cdn.ckjia.com/3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg','3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg','',1,NULL,NULL,NULL,NULL,'0',0),(17,0,0,'nav-icon-new.active.png',3036,'https://cdn.ckjia.com/5efe50fcd0e744eaa7a2e7c6d851dd82.png','5efe50fcd0e744eaa7a2e7c6d851dd82.png','',1,NULL,NULL,NULL,NULL,'0',0),(18,0,0,'nav-icon-user.active.png',2150,'https://cdn.ckjia.com/90cef6a278b34c1690af938193e2d813.png','90cef6a278b34c1690af938193e2d813.png','',1,NULL,NULL,NULL,NULL,'0',0),(19,0,0,'nav-icon-cat.active.png',3338,'https://cdn.ckjia.com/8ffa2bf6e6e7491b8460bf308abd30de.png','8ffa2bf6e6e7491b8460bf308abd30de.png','',1,NULL,NULL,NULL,NULL,'0',0),(20,0,0,'nav-icon-index.active.png',2754,'https://cdn.ckjia.com/478acfc9aeb140a4b79c6402ba3bd021.png','478acfc9aeb140a4b79c6402ba3bd021.png','',1,NULL,NULL,NULL,NULL,'0',0),(21,0,0,'baiduzhifu2x.png',19415,'https://cdn.ckjia.com/5ba794ec8d054ce995d37d364c5a9836.png','5ba794ec8d054ce995d37d364c5a9836.png','',1,NULL,NULL,NULL,NULL,'0',0),(22,0,0,'h_seckill.png',6008,'https://cdn.ckjia.com/897d70b0635f48999baa635d6debbbee.png','897d70b0635f48999baa635d6debbbee.png','',1,NULL,NULL,NULL,NULL,'0',0),(24,0,0,'mate-bg2.jpeg',79028,'https://cdn.ckjia.com/7667a4086d3c40948207dc8e02b52ff9.jpeg','7667a4086d3c40948207dc8e02b52ff9.jpeg','',1,NULL,NULL,NULL,NULL,'0',0);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `request_uri` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(10) DEFAULT NULL COMMENT '请求方法',
  `start_time` varchar(32) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(32) DEFAULT NULL COMMENT '结束时间',
  `status` char(1) DEFAULT '0' COMMENT '状态：0:关闭 1:开启',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统黑名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (1,NULL,'/**/actuator/**','ALL',NULL,NULL,'1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `is_deleted` int NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户端表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'mate','secret',NULL,'all','refresh_token,password,authorization_code,captcha,sms,social','http://localhost:10001',NULL,3600,3600,NULL,NULL,NULL,NULL,NULL,NULL,'0',0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '码',
  `c_key` varchar(255) DEFAULT NULL COMMENT '值',
  `value` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,0,'oss','default','qiniuoss',0,'默认OSS配置',NULL,NULL,1672727702,1672727702,0),(2,1,'alioss','endpoint','oss-cn-beijing.aliyuncs.com',1,'对象存储服务的URL',NULL,NULL,1672727702,1672727702,0),(3,1,'alioss','customDomain','mall-zaitong.oss-cn-beijing.aliyuncs.com',2,'自定义域名',NULL,NULL,1672727702,1672727702,0),(4,1,'alioss','pathStyleAccess','false',3,'pathStyleAccess',NULL,NULL,1672727702,1672727702,0),(5,1,'alioss','accessKey','LTA******rzjrV',4,'Access Key',NULL,NULL,1672727702,1672727702,0),(6,1,'alioss','secretKey','9H6Bxg**************bfNoy4E',5,'Access Secret',NULL,NULL,1672727702,1672727702,0),(7,1,'alioss','bucketName','m********g',6,'空间名',NULL,NULL,1672727702,1672727702,0),(8,1,'qiniuoss','endpoint','s3-cn-south-1.qiniucs.com',1,'对象存储服务的URL',NULL,NULL,1672727702,1672727702,0),(9,1,'qiniuoss','customDomain','cd**********com8878556757657',2,'自定义域名',NULL,NULL,1672727702,1672727702,0),(10,1,'qiniuoss','pathStyleAccess','false',3,'pathStyleAccess',NULL,NULL,1672727702,1672727702,0),(11,1,'qiniuoss','accessKey','pj2M-4k_*********************dQpjb1L',4,'Access Key',NULL,NULL,1672727702,1672727702,0),(12,1,'qiniuoss','secretKey','Dx17O-dbR*******************Mxlc4bb',5,'Access Secret',NULL,NULL,1672727702,1672727702,0),(13,1,'qiniuoss','bucketName','ckjia',6,'空间名',NULL,NULL,1672727702,1672727702,0),(14,1,'miniooss','endpoint','66666',1,'对象存储服务的URL',NULL,NULL,1672727702,1672727702,0),(15,1,'miniooss','customDomain','2222',2,'自定义域名',NULL,NULL,1672727702,1672727702,0),(16,1,'miniooss','pathStyleAccess','false',3,'pathStyleAccess',NULL,NULL,1672727702,1672727702,0),(17,1,'miniooss','accessKey','3333',4,'Access Key',NULL,NULL,1672727702,1672727702,0),(18,1,'miniooss','secretKey','4444',5,'Access Secret',NULL,NULL,1672727702,1672727702,0),(19,1,'miniooss','bucketName','5555',6,'空间名',NULL,NULL,1672727702,1672727702,0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  `parent_id` int DEFAULT '-1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组织机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'开发部',0,'sssss',0,NULL,NULL,1648194303,1648194303,'0',-1),(2,'开发分部',0,NULL,0,NULL,NULL,NULL,NULL,'1',1),(3,'开发二部',2,'测试更新',0,NULL,NULL,NULL,1648880538,'0',1),(4,'产品部',2,'hha',0,NULL,NULL,NULL,1672883920,'0',-1),(5,'产品一部',1,'da',1,NULL,NULL,NULL,1649231206,'0',4);
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_role`
--

DROP TABLE IF EXISTS `dept_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_role`
--

LOCK TABLES `dept_role` WRITE;
/*!40000 ALTER TABLE `dept_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,0,'status','-1','状态',1,'',NULL,NULL,'2020-07-01 09:59:15','2020-07-01 10:02:00',0),(2,1,'status','0','启用',1,NULL,NULL,NULL,'2020-07-01 10:02:23','2020-07-01 10:02:59',0),(3,1,'status','1','禁用',2,NULL,NULL,NULL,'2020-07-01 10:02:34','2020-07-01 10:02:59',0),(4,0,'dbtype','-1','数据库类型',1,NULL,NULL,NULL,'2020-07-11 08:47:02',NULL,0),(5,4,'dbtype','mysql','com.mysql.cj.jdbc.Driver',1,NULL,NULL,NULL,'2020-07-11 08:47:44','2020-07-11 08:53:11',0),(6,4,'dbtype','oracle','oracle.jdbc.OracleDriver',2,NULL,NULL,NULL,'2020-07-11 08:48:00','2020-07-11 08:54:05',0),(7,4,'dbtype','oracle12c','oracle.jdbc.OracleDriver',3,NULL,NULL,NULL,'2020-07-11 08:49:10','2020-07-11 08:54:12',0),(24,0,'ok','-1','确认',NULL,NULL,NULL,NULL,'2020-07-19 13:31:16','2020-07-19 21:31:28',0),(25,24,'ok','yes','是',NULL,NULL,NULL,NULL,'2020-07-19 21:31:40','2020-07-20 05:32:12',0),(26,24,'ok','no','否',NULL,NULL,NULL,NULL,'2020-07-20 05:32:06',NULL,0);
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint unsigned NOT NULL COMMENT '用户id',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(64) DEFAULT NULL COMMENT '日志标题',
  `operation` text COMMENT '操作内容',
  `method` varchar(64) DEFAULT NULL COMMENT '执行方法',
  `params` text COMMENT '参数',
  `url` varchar(128) DEFAULT NULL COMMENT '请求路径',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(64) DEFAULT NULL COMMENT '地区',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `log_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(32) DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限',
  `path` varchar(128) DEFAULT NULL COMMENT '路径',
  `component` varchar(128) DEFAULT NULL COMMENT '组件',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `tree` varchar(30) NOT NULL COMMENT '树',
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
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2072 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1000,'系统管理',NULL,'/system','Layout',-1,'','ant-design:appstore-outlined',1,'0','0','0','1',NULL,NULL,NULL,NULL,'0','0'),(1100,'用户管理',NULL,'/system/account','/system/account/index',1000,'','ant-design:user-outlined',2,'0','1','0','1',NULL,NULL,NULL,NULL,'0','0'),(1101,'用户新增','sys:user:add','',NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1102,'用户修改','sys:user:edit',NULL,NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1103,'用户删除','sys:user:delete',NULL,NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1104,'用户启用','sys:user:enable',NULL,NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1105,'用户禁用','sys:user:disable',NULL,NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1106,'用户导出','sys:user:export',NULL,NULL,1100,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1200,'角色管理',NULL,'/system/role','/system/role/index',1000,'','ant-design:team-outlined',3,'0','1','0','1',NULL,NULL,NULL,NULL,'0','0'),(1201,'角色新增','sys:role:add',NULL,NULL,1200,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1202,'角色修改','sys:role:edit',NULL,NULL,1200,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1203,'角色删除','sys:role:delete',NULL,NULL,1200,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1204,'角色导出','sys:role:export',NULL,NULL,1200,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1205,'角色权限','sys:role:perm',NULL,NULL,1200,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1300,'菜单管理',NULL,'/system/menu','/system/menu/index',1000,'','ant-design:menu-unfold-outlined',3,'0','1','0','1',NULL,NULL,NULL,NULL,'0','0'),(1301,'菜单新增','sys:menu:add',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1302,'菜单修改','sys:menu:edit',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1303,'菜单删除','sys:menu:delete',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1304,'菜单启用','sys:menu:enable',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1305,'菜单禁用','sys:menu:disable',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1306,'菜单导出','sys:menu:export',NULL,NULL,1300,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1400,'部门管理',NULL,'/system/dept','/system/dept/index',1000,'','ant-design:apartment-outlined',1,'0','1','0','1',NULL,NULL,NULL,NULL,'0','0'),(1401,'部门新增','sys:depart:add',NULL,NULL,1400,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1402,'部门修改','sys:depart:edit',NULL,NULL,1400,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1403,'部门删除','sys:depart:delete',NULL,NULL,1400,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1404,'部门导出','sys:depart:export',NULL,NULL,1400,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2032,'操作日志',NULL,'/system/log','/system/log/index',1000,'','ant-design:ordered-list-outlined',8,'0','1','0','1',NULL,NULL,NULL,NULL,'0','0'),(2033,'详细日志','sys:log:detail',NULL,NULL,2032,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2034,'日志删除','sys:log:delete',NULL,NULL,2032,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2035,'字典管理','','/system/dict','/system/dict/index',1000,'','ant-design:read-outlined',6,'0','1','0','0',NULL,NULL,NULL,1672985326,'0','0'),(2036,'新增字典','sys:dict:add',NULL,NULL,2035,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2037,'修改字典','sys:dict:edit',NULL,NULL,2035,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2038,'删除字典','sys:dict:delete',NULL,NULL,2035,'',NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2064,'工作台',NULL,'/dashboard','Layout',-1,'','ant-design:windows-outlined',0,'0','0','0','0',NULL,NULL,NULL,NULL,'0','0'),(2065,'分析页',NULL,'/dashboard','/dashboard/analysis/index',2064,'','ant-design:rise-outlined',0,'0','1','0','0',NULL,NULL,NULL,NULL,'0','0'),(2068,'工作台','','/dashboard/workbench','/dashboard/workbench/index',2064,'','ant-design:block-outlined',2,'0','1','0','0',NULL,NULL,NULL,1672971001,'0','0'),(2069,'关于Artemis',NULL,'/about/index','/sys/about/index',-1,'','ant-design:info-circle-outlined',100,'0','1','0','0',NULL,NULL,NULL,NULL,'0','0');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (2767,2064,1,0,0),(2768,2065,1,0,0),(2769,2068,1,0,0),(2770,1000,1,0,0),(2771,1300,1,0,0),(2772,1304,1,0,0),(2773,1301,1,0,0),(2774,1302,1,0,0),(2775,1303,1,0,0),(2776,1305,1,0,0),(2777,1306,1,0,0),(2778,1100,1,0,0),(2779,1106,1,0,0),(2780,1105,1,0,0),(2781,1104,1,0,0),(2782,1103,1,0,0),(2783,1102,1,0,0),(2784,1101,1,0,0),(2785,1400,1,0,0),(2786,1401,1,0,0),(2787,1402,1,0,0),(2788,1403,1,0,0),(2789,1404,1,0,0),(2790,1200,1,0,0),(2791,1202,1,0,0),(2792,1201,1,0,0),(2793,1203,1,0,0),(2794,1204,1,0,0),(2795,1205,1,0,0),(2796,2035,1,0,0),(2797,2036,1,0,0),(2798,2037,1,0,0),(2799,2038,1,0,0),(2806,2032,1,0,0),(2807,2033,1,0,0),(2808,2034,1,0,0),(2832,2069,1,0,0),(2833,2064,2,0,0),(2834,2065,2,0,0),(2835,2068,2,0,0),(2836,1000,2,0,0),(2837,1300,2,0,0),(2838,1304,2,0,0),(2839,1301,2,0,0),(2840,1302,2,0,0),(2841,1303,2,0,0),(2842,1305,2,0,0),(2843,1306,2,0,0),(2844,1100,2,0,0),(2845,1106,2,0,0),(2846,1105,2,0,0),(2847,1104,2,0,0),(2848,1103,2,0,0),(2849,1102,2,0,0),(2850,1101,2,0,0),(2851,1400,2,0,0),(2852,1401,2,0,0),(2853,1402,2,0,0),(2854,1403,2,0,0),(2855,1404,2,0,0),(2856,1200,2,0,0),(2857,1202,2,0,0),(2858,1201,2,0,0),(2859,1203,2,0,0),(2860,1204,2,0,0),(2861,1205,2,0,0),(2862,2035,2,0,0),(2863,2036,2,0,0),(2864,2037,2,0,0),(2865,2038,2,0,0),(2872,2032,2,0,0),(2873,2033,2,0,0),(2874,2034,2,0,0),(2897,2069,2,0,0),(3137,1000,8,0,0),(3138,1100,8,0,0),(3139,1101,8,0,0),(3140,1102,8,0,0),(3141,1103,8,0,0),(3142,1104,8,0,0),(3143,1105,8,0,0),(3144,1106,8,0,0),(3145,2064,8,0,0),(3146,2068,8,0,0),(3152,1000,9,0,0),(3153,1300,9,0,0),(3154,1301,9,0,0),(3155,2064,9,0,0),(3156,2065,9,0,0);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_name` (`role_name`),
  UNIQUE KEY `role_code` (`role_code`),
  KEY `idx_role_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','super','超级管理员组',1,'0',NULL,NULL,1649578786,1672727702,'0'),(2,'管理员','admin','管理员',2,'0',NULL,NULL,1649578786,1649934663,'0'),(8,'测试角色','test','test',3,'0','','',1649925084,1650809651,'0');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '用户id',
  `role_id` bigint unsigned NOT NULL COMMENT '角色id',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (2,3,2,NULL,NULL),(9,22,2,0,0),(10,2,1,0,0),(11,23,2,0,0),(14,25,2,0,0),(15,26,2,0,0),(17,27,2,0,0),(18,28,2,0,0),(19,29,2,0,0),(21,30,8,0,0);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `is_deleted` char(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'vben','lbd4pvfpICb1pX6gf3ar1Q==','admi1','超级管理员','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','vben@mate.vip1','18810001000',NULL,1,1,'0','test',NULL,NULL,NULL,NULL,'0'),(3,'amin2','lbd4pvfpICb1pX6gf3ar1Q==','amin2','杨幂','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','mat02e@mate.vip','18910001002',NULL,1,4,'0',NULL,NULL,NULL,NULL,NULL,'0'),(4,'amin4','lbd4pvfpICb1pX6gf3ar1Q==','adin4','刘德华','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','mate3@mate.vip','18910001004',NULL,1,1,'0',NULL,NULL,NULL,NULL,NULL,'0'),(6,'adm6n','lbd4pvfpICb1pX6gf3ar1Q==','adin6','mate6','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','mat6e@mate.vip','18910001006',NULL,1,1,'0',NULL,NULL,NULL,NULL,NULL,'1'),(22,'pp1','lbd4pvfpICb1pX6gf3ar1Q==','pp1','11','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','pp1@163.com','1899',NULL,2,1,'0','',NULL,NULL,NULL,NULL,'0'),(30,'test','lbd4pvfpICb1pX6gf3ar1Q==','test','','','test@gmail.com','',0,0,1,'0','tests','','',0,0,'0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 14:27:52
