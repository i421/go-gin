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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (8,8,'桐乡市天运环保科技有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(9,9,'桐乡市新光明印染有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(10,10,'浙江中誉五金有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(11,11,'浙江恒震特种材料股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(12,12,'浙江济丰包装纸业有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(13,13,'合众新能源汽车有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(14,14,'浙江华赢新材科技有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(15,15,'浙江枧洋高分子科技有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(16,16,'嘉兴市铁塔厂','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(17,17,'巨石集团有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(18,18,'新东方油墨有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(19,19,'桐乡市化工有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(20,20,'桐乡市华能铁塔厂','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(21,21,'桐乡市大盛金属表面处理有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(22,22,'桐乡市恒球皮草制品有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(23,23,'桐乡市恒邦新材料有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(24,24,'桐乡市桐德电力配件股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(25,25,'桐乡市益能材料处理有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(26,26,'桐乡市道远裘革科技有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(27,27,'桐乡市铁盛线路器材股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(28,28,'桐乡市高桥皮革有限责任公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(29,29,'桐乡恒泰新材料股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(30,30,'洋紫荆油墨股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(31,31,'浙江中辉裘革科技有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(32,32,'浙江华友钴业股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(33,33,'浙江嘉澳环保科技股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(34,34,'浙江新都绿色能源有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(35,35,'浙江牧羊人实业股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0'),(36,36,'浙江祥隆皮革股份有限公司','浙江省','嘉兴市','桐乡市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=2435 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1000,'系统管理','','/system','Layout',0,'ant-design:appstore-outlined',10,'0','0','0','0',NULL,NULL,NULL,1668071506,'0','0'),(1100,'用户管理','','/system/account','/system/account/index',1000,'ant-design:user-outlined',1,'0','1','0','0',NULL,NULL,NULL,1668263255,'0','0'),(1101,'用户新增','sys:user:add','',NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1102,'用户修改','sys:user:edit',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1103,'用户删除','sys:user:delete',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1104,'用户启用','sys:user:enable',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1105,'用户禁用','sys:user:disable',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1106,'用户导出','sys:user:export',NULL,NULL,1100,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1200,'角色管理','','/system/role','/system/role/index',1000,'ant-design:team-outlined',2,'0','1','0','0',NULL,NULL,NULL,1668263290,'0','0'),(1201,'角色新增','sys:role:add',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1202,'角色修改','sys:role:edit',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1203,'角色删除','sys:role:delete',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1204,'角色导出','sys:role:export',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1205,'角色权限','sys:role:perm',NULL,NULL,1200,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1300,'菜单管理','','/system/menu','/system/menu/index',1000,'ant-design:menu-unfold-outlined',3,'0','1','0','0',NULL,NULL,NULL,1668263305,'0','0'),(1301,'桐乡删除','tongxiang:company:delete',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1302,'桐乡切换','tongxiang:company:toggle',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1303,'嘉善删除','jiashan:company:delete',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1304,'嘉善切换','jiashan:company:toggle',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1305,'平湖删除','pinghu:company:delete',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(1306,'平湖切换','pinghu:company:toggle',NULL,NULL,1300,NULL,1,'0','2','0','1',NULL,NULL,NULL,NULL,'0','0'),(2064,'工作台','','/dashboard','Layout',0,'ant-design:windows-outlined',1,'0','0','0','0',NULL,NULL,NULL,1668071516,'0','0'),(2065,'公司列表','','/dashboard','/dashboard/analysis/index',2064,'ant-design:rise-outlined',1,'0','1','0','0',NULL,NULL,NULL,1668769246,'0','0'),(2401,'公司列表','','/company/index','/company/index',2400,'ant-design:amazon-circle-filled',1,'0','1','0','0','','',1668221086,1668221970,'0','0'),(2404,'平湖','','/pinghu','Layout',0,'ant-design:bank-outlined',3,'0','0','0','0','','',1668225879,1668239820,'0','0'),(2405,'桐乡','','/tongxiang','Layout',0,'ant-design:bank-outlined',5,'0','0','0','0','','',1668225922,1668225922,'0','0'),(2406,'嘉善','','/jiashan','Layout',0,'ant-design:bank-outlined',6,'0','0','0','0','','',1668225998,1668225998,'0','0'),(2410,'工业企业土壤和地下水自行监测-平湖','','/pinghu/zxjc','/pinghu/zxjc/index',2404,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668226594,1668239831,'0','0'),(2411,'土壤和地下水自行监测报告信息公开-平湖','','/pinghu/xxgk','/pinghu/xxgk/index',2404,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668226620,1668226670,'0','0'),(2412,'重点监管单位土壤污染隐患排查-平湖','','/pinghu/yhpc','/pinghu/yhpc/index',2404,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668226650,1668226650,'0','0'),(2413,'有毒有害物质排放定期报告-平湖','','/pinghu/dqbg','/pinghu/dqbg/index',2404,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668226716,1668226716,'0','0'),(2414,'企业拆除活动污染防治方案-平湖','','/pinghu/fzfa','/pinghu/fzfa/index',2404,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668226762,1668227532,'0','0'),(2415,'地下水污染风险管控-平湖','','/pinghu/fxgk','/pinghu/fxgk/index',2404,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668226803,1668226803,'0','0'),(2416,'土壤污染状况调查地块现场采样质控-平湖','','/pinghu/cyzk','/pinghu/cyzk/index',2404,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668226852,1668226852,'0','0'),(2417,'土壤污染状况调查地块检测分析外部质控-平湖','','/pinghu/wbzk','/pinghu/wbzk/index',2404,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668226920,1668226920,'0','0'),(2418,'工业企业土壤和地下水自行监测-桐乡','','/tongxiang/zxjc','/tongxiang/zxjc/index',2405,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668227188,1668227188,'0','0'),(2419,'土壤和地下水自行监测报告信息公开-桐乡','','/tongxiang/xxgk','/tongxiang/xxgk/index',2405,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668227236,1668227236,'0','0'),(2420,'重点监管单位土壤污染隐患排查-桐乡','','/tongxiang/yhpc','/tongxiang/yhpc/index',2405,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668227279,1668227279,'0','0'),(2421,'有毒有害物质排放定期报告-桐乡','','/tongxiang/dqbg','/tongxiang/dqbg/index',2405,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668227325,1668227325,'0','0'),(2422,'企业拆除活动污染防治方案-桐乡','','/tongxiang/fzfa','/tongxiang/fzfa/index',2405,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668227402,1668227402,'0','0'),(2423,'地下水污染风险管控-桐乡','','/tongxiang/fxgk','/tongxiang/fxgk/index',2405,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668227570,1668227570,'0','0'),(2424,'土壤污染状况调查地块现场采样质控-桐乡','','/tongxiang/cyzk','/tongxiang/cyzk/index',2405,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668227598,1668227598,'0','0'),(2425,'土壤污染状况调查地块检测分析外部质控-桐乡','','/tongxiang/wbzk','/tongxiang/wbzk/index',2405,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668227630,1668227630,'0','0'),(2426,'工业企业土壤和地下水自行监测-嘉善','','/jiashan/zxjc','/jiashan/zxjc/index',2406,'ant-design:align-center-outlined',1,'0','1','0','0','','',1668227690,1668227690,'0','0'),(2427,'土壤和地下水自行监测报告信息公开-嘉善','','/jiashan/xxgk','/jiashan/xxgk/index',2406,'ant-design:align-center-outlined',2,'0','1','0','0','','',1668227747,1668227747,'0','0'),(2428,'重点监管单位土壤污染隐患排查-嘉善','','/jiashan/yhpc','/jiashan/yhpc/index',2406,'ant-design:align-center-outlined',3,'0','1','0','0','','',1668227788,1668227788,'0','0'),(2429,'有毒有害物质排放定期报告-嘉善','','/jiashan/dqbg','/jiashan/dqbg/index',2406,'ant-design:align-center-outlined',4,'0','1','0','0','','',1668227823,1668227823,'0','0'),(2430,'企业拆除活动污染防治方案-嘉善','','/jiashan/fzfa','/jiashan/fzfa/index',2406,'ant-design:align-center-outlined',5,'0','1','0','0','','',1668227882,1668227882,'0','0'),(2431,'地下水污染风险管控-嘉善','','/jiashan/fxgk','/jiashan/fxgk/index',2406,'ant-design:align-center-outlined',6,'0','1','0','0','','',1668227926,1668227926,'0','0'),(2432,'土壤污染状况调查地块现场采样质控-嘉善','','/jiashan/cyzk','/jiashan/cyzk/index',2406,'ant-design:align-center-outlined',7,'0','1','0','0','','',1668227977,1668227977,'0','0'),(2433,'土壤污染状况调查地块检测分析外部质控-嘉善','','/jiashan/wbzk','/jiashan/wbzk/index',2406,'ant-design:align-center-outlined',8,'0','1','0','0','','',1668228065,1668228065,'0','0'),(2434,'重置密码','','/system/changePassword','/system/password/index',1000,'ant-design:appstore-outlined',4,'0','1','0','0','','',1669428047,1669428724,'0','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (669,1000,1,0,0),(670,1100,1,0,0),(671,1101,1,0,0),(672,1102,1,0,0),(673,1103,1,0,0),(674,1104,1,0,0),(675,1105,1,0,0),(676,1106,1,0,0),(677,1200,1,0,0),(678,1201,1,0,0),(679,1202,1,0,0),(680,1203,1,0,0),(681,1204,1,0,0),(682,1205,1,0,0),(683,1300,1,0,0),(684,1301,1,0,0),(685,1302,1,0,0),(686,1303,1,0,0),(687,1304,1,0,0),(688,1305,1,0,0),(689,1306,1,0,0),(690,2064,1,0,0),(691,2065,1,0,0),(692,2404,1,0,0),(693,2410,1,0,0),(694,2411,1,0,0),(695,2412,1,0,0),(696,2413,1,0,0),(697,2414,1,0,0),(698,2415,1,0,0),(699,2416,1,0,0),(700,2417,1,0,0),(701,2405,1,0,0),(702,2418,1,0,0),(703,2419,1,0,0),(704,2420,1,0,0),(705,2421,1,0,0),(706,2422,1,0,0),(707,2423,1,0,0),(708,2424,1,0,0),(709,2425,1,0,0),(710,2406,1,0,0),(711,2426,1,0,0),(712,2427,1,0,0),(713,2428,1,0,0),(714,2429,1,0,0),(715,2430,1,0,0),(716,2431,1,0,0),(717,2432,1,0,0),(718,2433,1,0,0),(719,2434,1,0,0),(720,1000,16,0,0),(721,1300,16,0,0),(722,1302,16,0,0),(723,2064,16,0,0),(724,2065,16,0,0),(725,2405,16,0,0),(726,2418,16,0,0),(727,2419,16,0,0),(728,2420,16,0,0),(729,2421,16,0,0),(730,2422,16,0,0),(731,2423,16,0,0),(732,2424,16,0,0),(733,2425,16,0,0),(734,2434,16,0,0),(735,2064,15,0,0),(736,2065,15,0,0),(737,2405,15,0,0),(738,2418,15,0,0),(739,2419,15,0,0),(740,2420,15,0,0),(741,2421,15,0,0),(742,2422,15,0,0),(743,2423,15,0,0),(744,2424,15,0,0),(745,2425,15,0,0),(746,1000,15,0,0),(747,2434,15,0,0),(748,2064,14,0,0),(749,2065,14,0,0),(750,2405,14,0,0),(751,2418,14,0,0),(752,2419,14,0,0),(753,2420,14,0,0),(754,2421,14,0,0),(755,2422,14,0,0),(756,2423,14,0,0),(757,2424,14,0,0),(758,2425,14,0,0),(759,1000,14,0,0),(760,2434,14,0,0),(761,1000,13,0,0),(762,1300,13,0,0),(763,1301,13,0,0),(764,1302,13,0,0),(765,2064,13,0,0),(766,2065,13,0,0),(767,2405,13,0,0),(768,2418,13,0,0),(769,2419,13,0,0),(770,2420,13,0,0),(771,2421,13,0,0),(772,2422,13,0,0),(773,2423,13,0,0),(774,2424,13,0,0),(775,2425,13,0,0),(776,2434,13,0,0),(777,1000,12,0,0),(778,1300,12,0,0),(779,1304,12,0,0),(780,2064,12,0,0),(781,2065,12,0,0),(782,2406,12,0,0),(783,2426,12,0,0),(784,2427,12,0,0),(785,2428,12,0,0),(786,2429,12,0,0),(787,2430,12,0,0),(788,2431,12,0,0),(789,2432,12,0,0),(790,2433,12,0,0),(791,2434,12,0,0),(792,2064,11,0,0),(793,2065,11,0,0),(794,2406,11,0,0),(795,2426,11,0,0),(796,2427,11,0,0),(797,2428,11,0,0),(798,2429,11,0,0),(799,2430,11,0,0),(800,2431,11,0,0),(801,2432,11,0,0),(802,2433,11,0,0),(803,1000,11,0,0),(804,2434,11,0,0),(805,2064,10,0,0),(806,2065,10,0,0),(807,2406,10,0,0),(808,2426,10,0,0),(809,2427,10,0,0),(810,2428,10,0,0),(811,2429,10,0,0),(812,2430,10,0,0),(813,2431,10,0,0),(814,2432,10,0,0),(815,2433,10,0,0),(816,1000,10,0,0),(817,2434,10,0,0),(818,1000,9,0,0),(819,1300,9,0,0),(820,1303,9,0,0),(821,1304,9,0,0),(822,2064,9,0,0),(823,2065,9,0,0),(824,2406,9,0,0),(825,2426,9,0,0),(826,2427,9,0,0),(827,2428,9,0,0),(828,2429,9,0,0),(829,2430,9,0,0),(830,2431,9,0,0),(831,2432,9,0,0),(832,2433,9,0,0),(833,2434,9,0,0),(834,1000,8,0,0),(835,1300,8,0,0),(836,1306,8,0,0),(837,2064,8,0,0),(838,2065,8,0,0),(839,2404,8,0,0),(840,2410,8,0,0),(841,2411,8,0,0),(842,2412,8,0,0),(843,2413,8,0,0),(844,2414,8,0,0),(845,2415,8,0,0),(846,2416,8,0,0),(847,2417,8,0,0),(848,2434,8,0,0),(849,2064,7,0,0),(850,2065,7,0,0),(851,2404,7,0,0),(852,2410,7,0,0),(853,2411,7,0,0),(854,2412,7,0,0),(855,2413,7,0,0),(856,2414,7,0,0),(857,2415,7,0,0),(858,2416,7,0,0),(859,2417,7,0,0),(860,1000,7,0,0),(861,2434,7,0,0),(862,2064,6,0,0),(863,2065,6,0,0),(864,2404,6,0,0),(865,2410,6,0,0),(866,2411,6,0,0),(867,2412,6,0,0),(868,2413,6,0,0),(869,2414,6,0,0),(870,2415,6,0,0),(871,2416,6,0,0),(872,2417,6,0,0),(873,1000,6,0,0),(874,2434,6,0,0),(875,1000,5,0,0),(876,1300,5,0,0),(877,1305,5,0,0),(878,1306,5,0,0),(879,2064,5,0,0),(880,2065,5,0,0),(881,2404,5,0,0),(882,2410,5,0,0),(883,2411,5,0,0),(884,2412,5,0,0),(885,2413,5,0,0),(886,2414,5,0,0),(887,2415,5,0,0),(888,2416,5,0,0),(889,2417,5,0,0),(890,2434,5,0,0);
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
INSERT INTO `role` VALUES (1,'超级管理员','superAdmin','superAdmin',1,'0',NULL,NULL,1649578786,1669428082,'0'),(5,'平湖-企业','pinghu-company','company',10,'0','','',1668242543,1669429309,'0'),(6,'平湖-专家','pinghu-expert','expert',11,'0','','',1668242632,1669429301,'0'),(7,'平湖-质控单位','pinghu-zk','zk',12,'0','','',1668242695,1669429293,'0'),(8,'平湖-管理部门','pinghu-gl','gl',13,'0','','',1668242729,1669429285,'0'),(9,'嘉善-企业','jiashan-company','company',20,'0','','',1668242793,1669429277,'0'),(10,'嘉善-专家','jiashan-expert','expert',21,'0','','',1668242824,1669429269,'0'),(11,'嘉善-质控单位','jiashan-zk','zk',22,'0','','',1668242917,1669429259,'0'),(12,'嘉善-管理部门','jiashan-gl','gl',23,'0','','',1668242943,1669429250,'0'),(13,'桐乡-企业','tongxiang-company','company',30,'0','','',1668242973,1669429243,'0'),(14,'桐乡-专家','tongxiang-expert','expert',31,'0','','',1668243004,1669429232,'0'),(15,'桐乡-质控单位','tongxiang-zk','zk',32,'0','','',1668243043,1669429220,'0'),(16,'桐乡-管理部门','tongxiang-gl','gl',33,'0','','',1668243096,1669429211,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (26,37,15,0,0),(27,38,16,0,0),(28,8,13,NULL,NULL),(29,9,13,NULL,NULL),(30,10,13,NULL,NULL),(31,11,13,NULL,NULL),(32,12,13,NULL,NULL),(33,13,13,NULL,NULL),(34,14,13,NULL,NULL),(35,15,13,NULL,NULL),(36,16,13,NULL,NULL),(37,17,13,NULL,NULL),(38,18,13,NULL,NULL),(39,19,13,NULL,NULL),(40,20,13,NULL,NULL),(41,21,13,NULL,NULL),(42,22,13,NULL,NULL),(43,23,13,NULL,NULL),(44,24,13,NULL,NULL),(45,25,13,NULL,NULL),(46,26,13,NULL,NULL),(47,27,13,NULL,NULL),(48,28,13,NULL,NULL),(49,29,13,NULL,NULL),(50,30,13,NULL,NULL),(51,31,13,NULL,NULL),(52,32,13,NULL,NULL),(53,33,13,NULL,NULL),(54,34,13,NULL,NULL),(55,35,13,NULL,NULL),(56,36,13,NULL,NULL),(57,37,15,NULL,NULL),(58,38,16,NULL,NULL),(80,1,1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','lbd4pvfpICb1pX6gf3ar1Q==','admi1','超级管理员','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2084118128,2518711034&fm=26&gp=0.jpg','0','test',NULL,NULL,NULL,NULL,'0'),(8,'桐乡市天运环保科技有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(9,'桐乡市新光明印染有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(10,'浙江中誉五金有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(11,'浙江恒震特种材料股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(12,'浙江济丰包装纸业有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(13,'合众新能源汽车有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(14,'浙江华赢新材科技有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(15,'浙江枧洋高分子科技有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(16,'嘉兴市铁塔厂','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(17,'巨石集团有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(18,'新东方油墨有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(19,'桐乡市化工有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(20,'桐乡市华能铁塔厂','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(21,'桐乡市大盛金属表面处理有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(22,'桐乡市恒球皮草制品有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(23,'桐乡市恒邦新材料有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(24,'桐乡市桐德电力配件股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(25,'桐乡市益能材料处理有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(26,'桐乡市道远裘革科技有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(27,'桐乡市铁盛线路器材股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(28,'桐乡市高桥皮革有限责任公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(29,'桐乡恒泰新材料股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(30,'洋紫荆油墨股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(31,'浙江中辉裘革科技有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(32,'浙江华友钴业股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(33,'浙江嘉澳环保科技股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(34,'浙江新都绿色能源有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(35,'浙江牧羊人实业股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(36,'浙江祥隆皮革股份有限公司','lbd4pvfpICb1pX6gf3ar1Q==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0'),(37,'浙江清华长三角研究院','lbd4pvfpICb1pX6gf3ar1Q==','浙江清华长三角研究院','','','0','','','',0,0,'0'),(38,'嘉兴市生态环境局桐乡分局','lbd4pvfpICb1pX6gf3ar1Q==','嘉兴市生态环境局桐乡分局','','','0','','','',0,0,'0');
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

-- Dump completed on 2022-11-26 10:24:14
