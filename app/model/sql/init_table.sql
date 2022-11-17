-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: comp
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,NULL,'timg (3).jpeg',26516,'https://cdn.ckjia.com/10e258da699b4c318ff59e24f2599420.jpeg','10e258da699b4c318ff59e24f2599420.jpeg','',1,NULL,NULL,NULL,NULL,'0',0),(2,NULL,'background.jpg',261548,'https://cdn.ckjia.com/3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg','3b8f8e2b5ffb43b0905397b82a6b3ec6.jpg','',1,NULL,NULL,NULL,NULL,'0',0);
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `user_id` bigint unsigned NOT NULL COMMENT '用户id',
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
  `path` text,
  `status` int DEFAULT '1',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `company_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,1,'长三','浙江','嘉兴','南湖区','亚太路','AAA','BBB','BBB_phone','CCC','CCC_phone','test','http://localhost:9090/basic-api/dir/uploads/anonymous/t2.pdf,http://localhost:9090/basic-api/dir/uploads/anonymous/t1.pdf',2,NULL,NULL,NULL,NULL,'0'),(2,2,'东湖A','浙江','嘉兴','平湖','东湖街道','AAA_t','BBB','BBB_phone','CCC','CCC_phone','test',NULL,1,NULL,NULL,NULL,NULL,'0'),(3,1,'1111','11','11','11','11','11','11','11','11','11','1','http://localhost:9090/basic-api/dir/uploads/anonymous/t2.pdf',1,'','',0,0,'0');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1000,'系统管理','','/system','Layout',0,'ant-design:appstore-outlined',10,'0','0','0','0',NULL,NULL,NULL,1668071506,'0','0'),(1100,'用户管理','','/system/account','/system/account/index',1000,'ant-design:user-outlined',1,'0','1','0','0',NULL,NULL,NULL,1668263255,'0','0'),(1101,'用户新增','sys:user:add','',NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1102,'用户修改','sys:user:edit',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1103,'用户删除','sys:user:delete',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1104,'用户启用','sys:user:enable',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1105,'用户禁用','sys:user:disable',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1106,'用户导出','sys:user:export',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1200,'角色管理','','/system/role','/system/role/index',1000,'ant-design:team-outlined',2,'0','1','0','0',NULL,NULL,NULL,1668263290,'0','0'),(1201,'角色新增','sys:role:add',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1202,'角色修改','sys:role:edit',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1203,'角色删除','sys:role:delete',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1204,'角色导出','sys:role:export',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1205,'角色权限','sys:role:perm',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1300,'菜单管理','','/system/menu','/system/menu/index',1000,'ant-design:menu-unfold-outlined',3,'0','1','0','0',NULL,NULL,NULL,1668263305,'0','0'),(1301,'菜单新增','sys:menu:add',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1302,'菜单修改','sys:menu:edit',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1303,'菜单删除','sys:menu:delete',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1304,'菜单启用','sys:menu:enable',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1305,'菜单禁用','sys:menu:disable',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1306,'菜单导出','sys:menu:export',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2064,'工作台','','/dashboard','Layout',0,'ant-design:windows-outlined',1,'0','0','0','0',NULL,NULL,NULL,1668071516,'0','0'),(2065,'分析页','','/dashboard','/dashboard/analysis/index',2064,'ant-design:rise-outlined',1,'0','1','0','0',NULL,NULL,NULL,1668071489,'0','0'),(2068,'工作台',NULL,'/dashboard/workbench','/dashboard/workbench/index',2064,'ant-design:block-outlined',2,'0','1','0','0',NULL,NULL,NULL,NULL,'0','0'),(2401,'公司列表','','/company/index','/company/index',2400,'ant-design:amazon-circle-filled',1,'0','1','0','0','','',1668221086,1668221970,'0','0'),(2404,'平湖','','/pinghu','Layout',0,'ant-design:bank-outlined',3,'0','0','0','0','','',1668225879,1668239820,'0','0'),(2405,'桐乡','','/tongxiang','Layout',0,'ant-design:bank-outlined',5,'0','0','0','0','','',1668225922,1668225922,'0','0'),(2406,'嘉善','','/jiashan','Layout',0,'ant-design:bank-outlined',6,'0','0','0','0','','',1668225998,1668225998,'0','0'),(2410,'工业企业土壤和地下水自行监测-平湖','','/pinghu/zxjc','/pinghu/zxjc/index',2404,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668226594,1668239831,'0','0'),(2411,'土壤和地下水自行监测报告信息公开-平湖','','/pinghu/xxgk','/pinghu/xxgk/index',2404,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668226620,1668226670,'0','0'),(2412,'重点监管单位土壤污染隐患排查-平湖','','/pinghu/yhpc','/pinghu/yhpc/index',2404,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668226650,1668226650,'0','0'),(2413,'有毒有害物质排放定期报告-平湖','','/pinghu/dqbg','/pinghu/dqbg/index',2404,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668226716,1668226716,'0','0'),(2414,'企业拆除活动污染防治方案-平湖','','/pinghu/fzfa','/pinghu/fzfa/index',2404,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668226762,1668227532,'0','0'),(2415,'地下水污染风险管控-平湖','','/pinghu/fxgk','/pinghu/fxgk/index',2404,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668226803,1668226803,'0','0'),(2416,'土壤污染状况调查地块现场采样质控-平湖','','/pinghu/cyzk','/pinghu/cyzk/index',2404,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668226852,1668226852,'0','0'),(2417,'土壤污染状况调查地块检测分析外部质控-平湖','','/pinghu/wbzk','/pinghu/wbzk/index',2404,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668226920,1668226920,'0','0'),(2418,'工业企业土壤和地下水自行监测-桐乡','','/tongxiang/zxjc','/tongxiang/zxjc/index',2405,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668227188,1668227188,'0','0'),(2419,'土壤和地下水自行监测报告信息公开-桐乡','','/tongxiang/xxgk','/tongxiang/xxgk/index',2405,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668227236,1668227236,'0','0'),(2420,'重点监管单位土壤污染隐患排查-桐乡','','/tongxiang/yhpc','/tongxiang/yhpc/index',2405,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668227279,1668227279,'0','0'),(2421,'有毒有害物质排放定期报告-桐乡','','/tongxiang/dqbg','/tongxiang/dqbg/index',2405,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668227325,1668227325,'0','0'),(2422,'企业拆除活动污染防治方案-桐乡','','/tongxiang/fzfa','/tongxiang/fzfa/index',2405,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668227402,1668227402,'0','0'),(2423,'地下水污染风险管控-桐乡','','/tongxiang/fxgk','/tongxiang/fxgk/index',2405,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668227570,1668227570,'0','0'),(2424,'土壤污染状况调查地块现场采样质控-桐乡','','/tongxiang/cyzk','/tongxiang/cyzk/index',2405,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668227598,1668227598,'0','0'),(2425,'土壤污染状况调查地块检测分析外部质控-桐乡','','/tongxiang/wbzk','/tongxiang/wbzk/index',2405,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668227630,1668227630,'0','0'),(2426,'工业企业土壤和地下水自行监测-嘉善','','/jiashan/zxjc','/jiashan/zxjc/index',2406,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668227690,1668227690,'0','0'),(2427,'土壤和地下水自行监测报告信息公开-嘉善','','/jiashan/xxgk','/jiashan/xxgk/index',2406,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668227747,1668227747,'0','0'),(2428,'重点监管单位土壤污染隐患排查-嘉善','','/jiashan/yhpc','/jiashan/yhpc/index',2406,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668227788,1668227788,'0','0'),(2429,'有毒有害物质排放定期报告-嘉善','','/jiashan/dqbg','/jiashan/dqbg/index',2406,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668227823,1668227823,'0','0'),(2430,'企业拆除活动污染防治方案-嘉善','','/jiashan/fzfa','/jiashan/fzfa/index',2406,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668227882,1668227882,'0','0'),(2431,'地下水污染风险管控-嘉善','','/jiashan/fxgk','/jiashan/fxgk/index',2406,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668227926,1668227926,'0','0'),(2432,'土壤污染状况调查地块现场采样质控-嘉善','','/jiashan/cyzk','/jiashan/cyzk/index',2406,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668227977,1668227977,'0','0'),(2433,'土壤污染状况调查地块检测分析外部质控-嘉善','','/jiashan/wbzk','/jiashan/wbzk/index',2406,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668228065,1668228065,'0','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (277,2404,6,0,0),(278,2410,6,0,0),(279,2411,6,0,0),(280,2412,6,0,0),(281,2413,6,0,0),(282,2414,6,0,0),(283,2415,6,0,0),(284,2416,6,0,0),(285,2417,6,0,0),(286,2064,6,0,0),(287,2065,6,0,0),(288,2068,6,0,0),(289,2404,5,0,0),(290,2410,5,0,0),(291,2411,5,0,0),(292,2412,5,0,0),(293,2413,5,0,0),(294,2414,5,0,0),(295,2415,5,0,0),(296,2416,5,0,0),(297,2417,5,0,0),(298,2064,5,0,0),(299,2065,5,0,0),(300,2068,5,0,0),(301,2064,7,0,0),(302,2065,7,0,0),(303,2068,7,0,0),(304,2404,7,0,0),(305,2410,7,0,0),(306,2411,7,0,0),(307,2412,7,0,0),(308,2413,7,0,0),(309,2414,7,0,0),(310,2415,7,0,0),(311,2416,7,0,0),(312,2417,7,0,0),(313,2064,8,0,0),(314,2065,8,0,0),(315,2068,8,0,0),(316,2404,8,0,0),(317,2410,8,0,0),(318,2411,8,0,0),(319,2412,8,0,0),(320,2413,8,0,0),(321,2414,8,0,0),(322,2415,8,0,0),(323,2416,8,0,0),(324,2417,8,0,0),(325,2406,9,0,0),(326,2426,9,0,0),(327,2427,9,0,0),(328,2428,9,0,0),(329,2429,9,0,0),(330,2430,9,0,0),(331,2431,9,0,0),(332,2432,9,0,0),(333,2433,9,0,0),(334,2064,9,0,0),(335,2065,9,0,0),(336,2068,9,0,0),(337,2406,10,0,0),(338,2426,10,0,0),(339,2427,10,0,0),(340,2428,10,0,0),(341,2429,10,0,0),(342,2430,10,0,0),(343,2431,10,0,0),(344,2432,10,0,0),(345,2433,10,0,0),(346,2064,10,0,0),(347,2065,10,0,0),(348,2068,10,0,0),(349,1000,1,0,0),(350,1100,1,0,0),(351,1101,1,0,0),(352,1102,1,0,0),(353,1103,1,0,0),(354,1104,1,0,0),(355,1105,1,0,0),(356,1106,1,0,0),(357,1200,1,0,0),(358,1201,1,0,0),(359,1202,1,0,0),(360,1203,1,0,0),(361,1204,1,0,0),(362,1205,1,0,0),(363,1300,1,0,0),(364,1301,1,0,0),(365,1302,1,0,0),(366,1303,1,0,0),(367,1304,1,0,0),(368,1305,1,0,0),(369,1306,1,0,0),(370,2064,1,0,0),(371,2065,1,0,0),(372,2068,1,0,0),(373,2404,1,0,0),(374,2410,1,0,0),(375,2411,1,0,0),(376,2412,1,0,0),(377,2413,1,0,0),(378,2414,1,0,0),(379,2415,1,0,0),(380,2416,1,0,0),(381,2417,1,0,0),(382,2405,1,0,0),(383,2418,1,0,0),(384,2419,1,0,0),(385,2420,1,0,0),(386,2421,1,0,0),(387,2422,1,0,0),(388,2423,1,0,0),(389,2424,1,0,0),(390,2425,1,0,0),(391,2406,1,0,0),(392,2426,1,0,0),(393,2427,1,0,0),(394,2428,1,0,0),(395,2429,1,0,0),(396,2430,1,0,0),(397,2431,1,0,0),(398,2432,1,0,0),(399,2433,1,0,0),(400,2406,11,0,0),(401,2426,11,0,0),(402,2427,11,0,0),(403,2428,11,0,0),(404,2429,11,0,0),(405,2430,11,0,0),(406,2431,11,0,0),(407,2432,11,0,0),(408,2433,11,0,0),(409,2064,11,0,0),(410,2065,11,0,0),(411,2068,11,0,0),(412,2064,12,0,0),(413,2065,12,0,0),(414,2068,12,0,0),(415,2406,12,0,0),(416,2426,12,0,0),(417,2427,12,0,0),(418,2428,12,0,0),(419,2429,12,0,0),(420,2430,12,0,0),(421,2431,12,0,0),(422,2432,12,0,0),(423,2433,12,0,0),(424,2064,13,0,0),(425,2065,13,0,0),(426,2068,13,0,0),(427,2405,13,0,0),(428,2418,13,0,0),(429,2419,13,0,0),(430,2420,13,0,0),(431,2421,13,0,0),(432,2422,13,0,0),(433,2423,13,0,0),(434,2424,13,0,0),(435,2425,13,0,0),(436,2064,14,0,0),(437,2065,14,0,0),(438,2068,14,0,0),(439,2405,14,0,0),(440,2418,14,0,0),(441,2419,14,0,0),(442,2420,14,0,0),(443,2421,14,0,0),(444,2422,14,0,0),(445,2423,14,0,0),(446,2424,14,0,0),(447,2425,14,0,0),(448,2064,15,0,0),(449,2065,15,0,0),(450,2068,15,0,0),(451,2405,15,0,0),(452,2418,15,0,0),(453,2419,15,0,0),(454,2420,15,0,0),(455,2421,15,0,0),(456,2422,15,0,0),(457,2423,15,0,0),(458,2424,15,0,0),(459,2425,15,0,0),(460,2064,16,0,0),(461,2065,16,0,0),(462,2068,16,0,0),(463,2405,16,0,0),(464,2418,16,0,0),(465,2419,16,0,0),(466,2420,16,0,0),(467,2421,16,0,0),(468,2422,16,0,0),(469,2423,16,0,0),(470,2424,16,0,0),(471,2425,16,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','superAdmin','超级管理员',1,'0',NULL,NULL,1649578786,1668242884,'0'),(5,'平湖-企业','pinghu-company','平湖-企业',10,'0','','',1668242543,1668242638,'0'),(6,'平湖-专家','pinghu-expert','平湖-专家',11,'0','','',1668242632,1668242632,'0'),(7,'平湖-质控单位','pinghu-zk','平湖-质控单位',12,'0','','',1668242695,1668242695,'0'),(8,'平湖-管理部门','pinghu-gl','平湖-管理部门',13,'0','','',1668242729,1668242729,'0'),(9,'嘉善-企业','jiashan-company','嘉善-企业',20,'0','','',1668242793,1668242793,'0'),(10,'嘉善-专家','jiashan-expert','jiashan-expert',21,'0','','',1668242824,1668242824,'0'),(11,'嘉善-质控单位','jiashan-zk','嘉善-质控单位',22,'0','','',1668242917,1668242917,'0'),(12,'嘉善-管理部门','jiashan-gl','嘉善-管理部门',23,'0','','',1668242943,1668242943,'0'),(13,'桐乡-企业','tongxiang-company','桐乡-企业',30,'0','','',1668242973,1668242973,'0'),(14,'桐乡-专家','tongxiang-expert','桐乡-专家',31,'0','','',1668243004,1668243004,'0'),(15,'桐乡-质控单位','tongxiang-zk','桐乡-质控单位',32,'0','','',1668243043,1668243043,'0'),(16,'桐乡-管理部门','tongxiang-gl','桐乡-管理部门',33,'0','','',1668243096,1668243096,'0');
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
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(21,3,5,0,0);
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
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','lbd4pvfpICb1pX6gf3ar1Q==','admi1','超级管理员','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','0','test',NULL,NULL,NULL,NULL,'0'),(3,'平湖xxx企业','lbd4pvfpICb1pX6gf3ar1Q==','平湖xxx企业','','','0','','','',0,0,'0');
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

-- Dump completed on 2022-11-17 22:17:34
