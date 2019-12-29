-- MySQL dump 10.13  Distrib 5.7.24, for macos10.14 (x86_64)
--
-- Host: localhost    Database: o2o
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_area`
--

DROP TABLE IF EXISTS `tb_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area`
--

LOCK TABLES `tb_area` WRITE;
/*!40000 ALTER TABLE `tb_area` DISABLE KEYS */;
INSERT INTO `tb_area` VALUES (2,'东苑',1,NULL,NULL),(3,'西苑',2,NULL,NULL);
/*!40000 ALTER TABLE `tb_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_head_line`
--

DROP TABLE IF EXISTS `tb_head_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_head_line`
--

LOCK TABLES `tb_head_line` WRITE;
/*!40000 ALTER TABLE `tb_head_line` DISABLE KEYS */;
INSERT INTO `tb_head_line` VALUES (1,'1','地利生鲜','/upload/item/headtitle/1.jpg',1,1,NULL,NULL),(2,'2','新隆嘉','/upload/item/headtitle/2.jpg',2,1,NULL,NULL),(3,'3','头条3','/upload/item/headtitle/3.jpg',3,1,NULL,NULL),(4,'4','头条4','/upload/item/headtitle/4.jpg',4,1,NULL,NULL);
/*!40000 ALTER TABLE `tb_head_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_local_auth`
--

DROP TABLE IF EXISTS `tb_local_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`username`),
  KEY `fk_localauth_profile` (`user_id`),
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_local_auth`
--

LOCK TABLES `tb_local_auth` WRITE;
/*!40000 ALTER TABLE `tb_local_auth` DISABLE KEYS */;
INSERT INTO `tb_local_auth` VALUES (1,1,'testbind','59yqs2q2656l296559y9050y0l652s5l','2019-12-14 14:26:45','2019-12-14 16:23:44');
/*!40000 ALTER TABLE `tb_local_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_person_info`
--

DROP TABLE IF EXISTS `tb_person_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '0:禁止使用本商城,1:允许使用本商城',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '1:顾客,2:店家,3:超级管理员',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_person_info`
--

LOCK TABLES `tb_person_info` WRITE;
/*!40000 ALTER TABLE `tb_person_info` DISABLE KEYS */;
INSERT INTO `tb_person_info` VALUES (1,'测试','test','test','1',1,2,NULL,NULL),(3,'测试一下',NULL,NULL,NULL,1,1,'2019-12-10 11:26:46',NULL);
/*!40000 ALTER TABLE `tb_person_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_procate` (`product_category_id`),
  KEY `fk_product_shop` (`shop_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'正式的商品6','正式的商品描述66','/upload/item/shop/1/2019112814524716199.jpg','26','16',2,'2019-11-25 16:49:10','2019-11-28 14:52:47',1,NULL,1),(2,'测试2','测试Desc2','/upload/baigeixiansheng.jpg','33','3',1,'2019-11-25 16:49:10','2019-11-29 15:44:12',1,1,1),(3,'测试3','测试Desc3','/upload/huojushousunnan.jpg','666','268',3,'2019-11-25 16:49:10','2019-11-25 16:49:10',1,1,1),(4,'测试商品1','描述测试商品1','/upload/item/shop/1/2019112611202624671.jpg','1678','875',20,'2019-11-26 11:20:27','2019-11-26 11:20:27',1,1,1),(5,'海底捞火锅测试蘸料','测试商品类别2','/upload/item/shop/1/2019112616524421400.jpg','200','100',100,'2019-11-26 16:52:44','2019-11-29 11:51:11',1,6,1),(6,'永兴测试美食城','快躲开','/upload/item/shop/1/2019112911520128067.jpg','987','765',666,'2019-11-29 11:50:03','2019-11-29 11:52:02',1,6,1),(7,'包子6号','好吃','/upload/item/shop/1/2019120909544636105.jpeg','5','6',62,'2019-12-09 09:54:46','2019-12-09 09:54:46',1,2,1),(8,'包子26号','好吃就完事了','/upload/item/shop/23/2019121110425298833.jpeg','33','5',26,'2019-12-09 10:02:15','2019-12-11 10:42:52',1,7,23);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_category`
--

DROP TABLE IF EXISTS `tb_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_category`
--

LOCK TABLES `tb_product_category` WRITE;
/*!40000 ALTER TABLE `tb_product_category` DISABLE KEYS */;
INSERT INTO `tb_product_category` VALUES (1,'店铺商品类别2',20,NULL,1),(2,'店铺商品类别3',2,NULL,1),(6,'商品类别11',200,NULL,1),(7,'肉包',26,NULL,23),(8,' 菜包',16,NULL,23);
/*!40000 ALTER TABLE `tb_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_img`
--

DROP TABLE IF EXISTS `tb_product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proming_product` (`product_id`),
  CONSTRAINT `fk_proming_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_img`
--

LOCK TABLES `tb_product_img` WRITE;
/*!40000 ALTER TABLE `tb_product_img` DISABLE KEYS */;
INSERT INTO `tb_product_img` VALUES (5,'upload/item/shop/1/2019112611202773378.jpg',NULL,NULL,'2019-11-26 11:20:27',4),(6,'upload/item/shop/1/2019112611202770876.jpg',NULL,NULL,'2019-11-26 11:20:27',4),(7,'upload/item/shop/1/2019112616524430989.jpg',NULL,NULL,'2019-11-26 16:52:44',5),(8,'upload/item/shop/1/2019112616524435414.jpg',NULL,NULL,'2019-11-26 16:52:44',5),(21,'upload/item/shop/1/2019112814524744954.jpg',NULL,NULL,'2019-11-28 14:52:47',1),(22,'upload/item/shop/1/2019112814524728171.jpg',NULL,NULL,'2019-11-28 14:52:47',1),(24,'upload/item/shop/1/2019112911520162674.jpg',NULL,NULL,'2019-11-29 11:52:02',6),(25,'/upload/item/shop/1/2019120909544663941.jpeg',NULL,NULL,'2019-12-09 09:54:46',7),(26,'/upload/item/shop/1/2019120909544682826.jpeg',NULL,NULL,'2019-12-09 09:54:46',7),(28,'/upload/item/shop/23/2019121110425247821.jpeg',NULL,NULL,'2019-12-11 10:42:52',8);
/*!40000 ALTER TABLE `tb_product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop`
--

DROP TABLE IF EXISTS `tb_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) NOT NULL,
  `shop_desc` varchar(1024) DEFAULT NULL,
  `shop_addr` varchar(200) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(1024) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop`
--

LOCK TABLES `tb_shop` WRITE;
/*!40000 ALTER TABLE `tb_shop` DISABLE KEYS */;
INSERT INTO `tb_shop` VALUES (1,1,2,14,'破坏之王','懦夫救星鬼王达','无敌风火轮','51999999666','/upload/item/shop/1/2019120614464626518.jpg',110,'2019-11-13 20:05:00','2019-12-06 14:46:47',1,'审核中'),(10,1,3,22,'深岩之洲','巨石之核','格瑞姆巴托','13503609930','/upload/item/shop/10/2019112017181140711.jpg',50,'2019-11-20 17:18:11','2019-11-20 17:18:11',1,NULL),(18,1,2,22,'北京祝福你','武动乾坤','三兄弟终聚首','999999','/upload/item/shop/18/2019112520203720046.jpg',40,'2019-11-23 10:43:23','2019-11-25 20:20:38',1,NULL),(19,1,2,20,'火焰之地','拉格纳罗斯','萨弗拉斯燃灭之手','999999666','/upload/item/shop/19/2019112515244481298.jpg',30,'2019-11-25 15:24:45','2019-11-25 15:24:45',1,NULL),(20,1,2,20,'巨龙之魂惩戒骑','不眠的约萨希 ','实验标本切片斧410等级','66669999666','/upload/item/shop/20/2019112515330168265.jpg',20,'2019-11-25 15:33:01','2019-11-25 15:33:01',1,NULL),(21,1,2,22,'雷电王座','雷神雷电之王','金陵雷神范儿','66666666','/upload/item/shop/21/2019112519585593555.jpg',16,'2019-11-25 19:58:56','2019-11-25 19:58:56',1,NULL),(22,1,3,20,'梦泉包子铺','香就完事儿了','远望','111111','/upload/item/shop/22/2019120909334311475.jpg',66,'2019-12-09 09:33:44','2019-12-09 09:33:44',1,NULL),(23,1,2,24,'不二心肮脏包子铺','50元一个肉包','华南安盛身后','999876','/upload/item/shop/23/2019121213182531966.jpeg',88,'2019-12-09 09:39:24','2019-12-12 13:18:26',1,NULL),(35,3,2,22,'奶茶来了','奶茶来了','北苑6栋',NULL,NULL,0,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tb_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop_category`
--

DROP TABLE IF EXISTS `tb_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_category`
--

LOCK TABLES `tb_shop_category` WRITE;
/*!40000 ALTER TABLE `tb_shop_category` DISABLE KEYS */;
INSERT INTO `tb_shop_category` VALUES (1,'咖啡奶茶','咖啡奶茶','/upload/item/shopcategory/1.jpg',1,NULL,NULL,NULL),(3,'咖啡','测试类别','test3',0,NULL,NULL,1),(10,'二手市场','二手商品交易','/upload/item/shopcategory/2.jpg',100,'2019-11-30 09:19:43','2019-11-30 09:19:43',NULL),(11,'美容美发','美容美发','/upload/item/shopcategory/3.jpg',99,'2019-11-30 09:22:32','2019-11-30 09:22:32',NULL),(12,'美食饮品','美食饮品','/upload/item/shopcategory/4.jpg',98,'2019-11-30 09:28:12','2019-11-30 09:28:12',NULL),(13,'休闲娱乐','休闲娱乐','/upload/item/shopcategory/5.jpg',97,'2019-11-30 09:28:12','2019-11-30 09:28:12',NULL),(14,'二手车','二手车','店铺种类14',80,'2019-11-30 09:32:13','2019-11-30 09:32:13',10),(15,'二手书籍','二手书籍','店铺种类15',79,'2019-11-30 09:32:13','2019-11-30 09:32:13',10),(17,'美容','美容','店铺种类17',76,'2019-11-30 09:34:43','2019-11-30 09:34:43',11),(18,'美发','美发','店铺种类18',74,'2019-11-30 09:34:43','2019-11-30 09:34:43',11),(20,'大排档','大排档','店铺种类20',59,'2019-11-30 09:36:46','2019-11-30 09:36:46',12),(22,'奶茶店','奶茶店','店铺种类22',58,'2019-11-30 09:36:46','2019-11-30 09:36:46',12),(24,'密室逃生','密室逃生','店铺种类24',56,'2019-11-30 09:38:19','2019-11-30 09:38:19',13),(25,'KTV','KTV','店铺种类25',57,'2019-11-30 09:38:19','2019-11-30 09:38:19',13),(27,'培训教育','培训教育','/upload/item/shopcategory/6.jpg',96,'2019-11-30 09:39:57','2019-11-30 09:39:57',NULL),(28,'租赁市场','租赁市场','/upload/item/shopcategory/7.jpg',95,'2019-11-30 09:39:57','2019-11-30 09:39:57',NULL),(29,'程序设计','程序设计','店铺种类29',50,'2019-11-30 09:41:32','2019-11-30 09:41:32',27),(30,'声乐舞蹈','声乐舞蹈','店铺种类30',49,'2019-11-30 09:41:32','2019-11-30 09:41:32',27),(31,'演出道具','演出道具','店铺种类31',45,'2019-11-30 09:42:26','2019-11-30 09:42:26',28),(32,'交通工具','交通工具','店铺种类32',44,'2019-11-30 09:42:26','2019-11-30 09:42:26',28);
/*!40000 ALTER TABLE `tb_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_wechat_auth`
--

DROP TABLE IF EXISTS `tb_wechat_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_wechat_auth`
--

LOCK TABLES `tb_wechat_auth` WRITE;
/*!40000 ALTER TABLE `tb_wechat_auth` DISABLE KEYS */;
INSERT INTO `tb_wechat_auth` VALUES (2,3,'darunfawoerma','2019-12-10 11:26:46');
/*!40000 ALTER TABLE `tb_wechat_auth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16  7:19:49
