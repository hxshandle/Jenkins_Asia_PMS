-- MySQL dump 10.13  Distrib 5.5.20, for Win32 (x86)
--
-- Host: localhost    Database: jenkins_asia_uat
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) NOT NULL DEFAULT '',
  `ufrom` varchar(255) NOT NULL DEFAULT '',
  `ufrom_id` int(10) NOT NULL DEFAULT '0',
  `userto` varchar(255) NOT NULL DEFAULT '',
  `userto_id` int(10) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `address1` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_assigned`
--

DROP TABLE IF EXISTS `company_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_assigned` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `company` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `company` (`company`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_assigned`
--

LOCK TABLES `company_assigned` WRITE;
/*!40000 ALTER TABLE `company_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverable_item`
--

DROP TABLE IF EXISTS `deliverable_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverable_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(10) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `project` int(10) NOT NULL,
  `phase` int(10) NOT NULL,
  `desc` text,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `phase` (`phase`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverable_item`
--

LOCK TABLES `deliverable_item` WRITE;
/*!40000 ALTER TABLE `deliverable_item` DISABLE KEYS */;
INSERT INTO `deliverable_item` (`ID`, `name`, `status`, `start_date`, `end_date`, `project`, `phase`, `desc`, `valid`) VALUES (1,'Item 1',12,'2012-04-07 00:00:00','2012-04-15 00:00:00',1,1,'',1),(2,'Item 2',12,'2012-04-07 00:00:00','2012-04-21 00:00:00',1,1,'',1),(3,'Item 3',12,'2012-04-26 00:00:00','2012-06-29 00:00:00',1,2,'',1),(4,'D1',11,'2012-05-05 00:00:00','2012-05-26 00:00:00',2,3,'',1),(5,'D1',12,'2012-04-05 00:00:00','2012-11-30 00:00:00',7,10,'',1),(6,'ssss',11,'2012-06-04 00:00:00','2012-06-28 00:00:00',9,11,'',1),(7,'xxxx',11,'2012-06-04 00:00:00','2012-07-09 00:00:00',9,12,'',1),(8,'ssss',11,'2012-06-04 00:00:00','2012-07-06 00:00:00',9,13,'',1),(9,'aaaa',11,'2012-06-04 00:00:00','2012-06-30 00:00:00',9,14,'',1),(10,'1111',12,'2012-09-09 00:00:00','2012-09-09 00:00:00',11,15,'',1),(11,'2222',12,'2012-09-09 00:00:00','2012-09-09 00:00:00',11,15,'',1);
/*!40000 ALTER TABLE `deliverable_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_info`
--

DROP TABLE IF EXISTS `document_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_info` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `document_no` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `description` text,
  `file` int(10) NOT NULL,
  `project` int(10) DEFAULT NULL,
  `task` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `visibility` varchar(45) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ecn` int(10) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_info`
--

LOCK TABLES `document_info` WRITE;
/*!40000 ALTER TABLE `document_info` DISABLE KEYS */;
INSERT INTO `document_info` (`ID`, `name`, `document_no`, `revision`, `description`, `file`, `project`, `task`, `order`, `quality`, `visibility`, `insert_date`, `ecn`) VALUES (1,'dsa',NULL,'sad','',115,7,10,2,17,'1,2,3,4',NULL,-1),(2,'sdsa',NULL,'dsadsa','',115,7,7,2,10,'1,2',NULL,-1),(3,'ads',NULL,'sa','',115,7,3,1,9,'1,3,4,',NULL,-1),(4,'sssss',NULL,'ssss','',115,7,6,1,11,'3,4,5,',NULL,-1),(5,'sda',NULL,'assdas','',115,7,-1,-1,-1,'2,3,',NULL,-1),(6,'sada',NULL,'sada','aaaaaa',115,7,7,-1,-1,'3,4,',NULL,-1),(7,'Test Document',NULL,'1.0','dsa',116,7,9,-1,-1,'4,5,7,',NULL,-1),(8,'sdadsa',NULL,'sad','dsadsa',117,11,-1,-1,-1,'2,3,4,5,1','2012-08-19 14:15:28',-1),(9,'dsa',NULL,'asda','asdada',118,7,-1,1,-1,'2,3,4,5,1','2012-08-19 14:20:39',-1),(10,'dsa',NULL,'dsad','dsadsa',120,7,-1,-1,-1,'2,3,','2012-08-24 12:13:54',-1),(11,'sssssss',NULL,'ssssssssssss','asdasdsa',125,11,-1,-1,-1,'3,4,','2012-09-07 16:10:20',-1),(12,'ssssssss',NULL,'ssssss','sssssss',0,11,-1,-1,-1,'2,3,4,','2012-09-08 02:58:04',-1),(13,'ssssssss',NULL,'ss','',126,11,-1,-1,-1,'2,3,4,','2012-09-08 02:59:43',-1),(14,'aaaaa',NULL,'sdad','dsadsa',127,11,-1,-1,-1,'2,3,4,','2012-09-08 03:00:38',-1),(15,'1111',NULL,'1111','1111',128,11,-1,-1,-1,'2,3,4,','2012-09-08 03:01:12',-1),(16,'sd',NULL,'sda','dsadsa',129,11,-1,-1,-1,'2,3,4,','2012-09-08 09:19:29',-1),(17,'1111',NULL,'111','111111',130,11,-1,-1,-1,'1,2,3,4,','2012-09-08 09:50:08',-1),(18,'1111',NULL,'111','sdsad',131,11,-1,-1,-1,'2,3,','2012-09-08 09:51:21',-1),(19,'dsadsad',NULL,'sadsa','',132,11,-1,-1,-1,'1,3,','2012-09-08 09:53:34',-1),(20,'dsadsad',NULL,'sadsa','',132,11,-1,-1,-1,'1,3,','2012-09-08 09:54:33',-1),(21,'11111',NULL,'11111','111111',133,10,-1,-1,-1,'1,2,3,4,','2012-09-08 09:55:53',-1),(22,'sss',NULL,'ssss','aaaaa',134,11,-1,-1,-1,'1,2,3,4,','2012-09-09 12:08:06',7),(23,'Test Document',NULL,'0.1','dsadsadsa',135,7,-1,-1,7,'2,4,','2012-10-11 15:20:13',8),(24,'dsa','','0.1','',136,11,-1,-1,-1,'1,2,3,4,5,','2012-10-14 05:00:44',0),(25,'asda','aaaaaaaa','0.5','sadsa',137,11,-1,-1,-1,'1,2,3,4,','2012-10-14 05:03:23',0);
/*!40000 ALTER TABLE `document_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineering_change_note`
--

DROP TABLE IF EXISTS `engineering_change_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engineering_change_note` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(10) NOT NULL,
  `submitter` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `submit_time` datetime NOT NULL,
  `approver` int(10) DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL,
  `submitter_comments` text,
  `approver_comments` text,
  `project` int(10) NOT NULL,
  `phase` int(10) DEFAULT NULL,
  `deliverable` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `submitter` (`submitter`),
  KEY `approver` (`approver`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineering_change_note`
--

LOCK TABLES `engineering_change_note` WRITE;
/*!40000 ALTER TABLE `engineering_change_note` DISABLE KEYS */;
INSERT INTO `engineering_change_note` (`ID`, `status`, `submitter`, `name`, `submit_time`, `approver`, `approve_time`, `submitter_comments`, `approver_comments`, `project`, `phase`, `deliverable`, `order`, `quality`) VALUES (1,2,3,'fdsfds','2012-04-07 15:43:37',3,'2012-04-07 15:44:06','fdsfdsfds','fdsfds',1,1,2,NULL,NULL),(2,3,3,'ssss','2012-04-07 15:43:48',2,'2012-04-07 15:52:21','dfdfd','rweq',1,2,3,NULL,NULL),(3,3,3,'ff','2012-04-07 15:44:17',3,'2012-04-07 15:44:22','dd','fff',1,1,1,NULL,NULL),(4,2,9,'sss','2012-04-07 15:44:50',2,'2012-04-07 15:52:26','dsds','ewr',1,1,1,NULL,NULL),(5,2,9,'gfgg','2012-04-07 15:44:57',2,'2012-04-07 15:50:31','sds','fds',1,1,2,NULL,NULL),(6,2,10,'fff','2012-04-07 15:45:28',2,'2012-04-07 15:52:40','sds','',1,1,1,NULL,NULL),(7,2,1,'dsadsa','2012-09-09 15:07:54',1,'2012-09-09 19:42:17','dsadsadsa','',11,15,10,5,18),(8,1,2,'111111111111','2012-09-27 20:50:56',NULL,NULL,'dsadsadsa',NULL,11,0,-1,6,-1);
/*!40000 ALTER TABLE `engineering_change_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `project` int(10) NOT NULL DEFAULT '0',
  `milestone` int(10) NOT NULL DEFAULT '0',
  `user` int(10) NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `added` varchar(255) NOT NULL DEFAULT '',
  `datei` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `folder` int(10) NOT NULL,
  `visible` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`),
  KEY `datei` (`datei`),
  KEY `added` (`added`),
  KEY `project` (`project`),
  KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`ID`, `name`, `desc`, `project`, `milestone`, `user`, `tags`, `added`, `datei`, `type`, `title`, `folder`, `visible`) VALUES (4,'_61047.keyfile_u','dsadsa',1,0,2,'Sdsa','1334468396','files/standard/1/_61047.keyfile_u','application/octet-stream','BBC',0,''),(2,'_13133.keyfile','fdsfds',1,0,2,'Dfsf','1334468011','files/standard/1/Folder1/_13133.keyfile','application/octet-stream','ABC',1,''),(3,'_63721.keyfile','fdsfds',1,0,2,'Dfsf','1334468140','files/standard/1/Folder1/_63721.keyfile','application/octet-stream','ABC',1,''),(5,'handle_41440.pem','',1,0,2,'','1334585632','files/standard/1/handle_41440.pem','application/octet-stream','',0,''),(6,'ABS_Guide_cn_79810.pdf','',1,0,2,'','1334585985','files/standard/1/ABS_Guide_cn_79810.pdf','application/octet-stream','',0,''),(7,'php_manual_zh_23873.chm','',1,0,2,'','1334585988','files/standard/1/php_manual_zh_23873.chm','application/octet-stream','',0,''),(8,'150_albumpic_80920_0_4175.jpg','',7,0,2,'','1336567484','files\\standard\\7\\150_albumpic_80920_0_4175.jpg','application/octet-stream','',0,''),(9,'arrow_bottom_75115.png','',7,0,2,'','1336567533','files\\standard\\7\\arrow_bottom_75115.png','application/octet-stream','',0,''),(10,'150_albumpic_80920_0_34631.jpg','',7,0,2,'','1336567872','files/standard/7/150_albumpic_80920_0_34631.jpg','application/octet-stream','',0,''),(11,'150_albumpic_80920_0_61143.jpg','',7,0,2,'','1336568401','files/standard/7/150_albumpic_80920_0_61143.jpg','application/octet-stream','',0,''),(12,'150_albumpic_80920_0_84620.jpg','',7,0,2,'','1336568549','files/standard/7/150_albumpic_80920_0_84620.jpg','application/octet-stream','',0,''),(13,'150_albumpic_80920_0_73679.jpg','',7,0,2,'','1336568570','files/standard/7/150_albumpic_80920_0_73679.jpg','application/octet-stream','',0,''),(14,'150_albumpic_80920_0_98020.jpg','',7,0,2,'','1336568577','files/standard/7/150_albumpic_80920_0_98020.jpg','application/octet-stream','',0,''),(15,'150_albumpic_80920_0_39527.jpg','',7,0,2,'','1336568617','files/standard/7/150_albumpic_80920_0_39527.jpg','application/octet-stream','',0,''),(16,'150_albumpic_80920_0_11406.jpg','',7,0,2,'','1336568646','files/standard/7/150_albumpic_80920_0_11406.jpg','application/octet-stream','',0,''),(17,'150_albumpic_80920_0_77514.jpg','',7,0,2,'','1336568733','files/standard/7/150_albumpic_80920_0_77514.jpg','application/octet-stream','',0,''),(18,'150_albumpic_80920_0_48321.jpg','',7,0,2,'','1336568797','files/standard/7/150_albumpic_80920_0_48321.jpg','application/octet-stream','',0,''),(19,'150_albumpic_80920_0_41154.jpg','',7,0,2,'','1336568809','files/standard/7/150_albumpic_80920_0_41154.jpg','application/octet-stream','',0,''),(20,'150_albumpic_80920_0_90232.jpg','',7,0,2,'','1336568873','files/standard/7/150_albumpic_80920_0_90232.jpg','application/octet-stream','',0,''),(21,'150_albumpic_80920_0_54785.jpg','',7,0,2,'','1336568894','files/standard/7/150_albumpic_80920_0_54785.jpg','application/octet-stream','',0,''),(22,'150_albumpic_80920_0_99039.jpg','',7,0,2,'','1336569057','files/standard/7/150_albumpic_80920_0_99039.jpg','application/octet-stream','',0,''),(23,'150_albumpic_80920_0_17056.jpg','',7,0,2,'','1336569197','files/standard/7/150_albumpic_80920_0_17056.jpg','application/octet-stream','',0,''),(24,'150_albumpic_80920_0_63713.jpg','',7,0,2,'','1336569265','files/standard/7/150_albumpic_80920_0_63713.jpg','application/octet-stream','',0,''),(25,'150_albumpic_80920_0_39831.jpg','',7,0,2,'','1336569292','files/standard/7/150_albumpic_80920_0_39831.jpg','application/octet-stream','',0,''),(26,'150_albumpic_80920_0_64890.jpg','',7,0,2,'','1336569376','files/standard/7/150_albumpic_80920_0_64890.jpg','application/octet-stream','',0,''),(27,'150_albumpic_80920_0_57071.jpg','',7,0,2,'','1336569427','files/standard/7/150_albumpic_80920_0_57071.jpg','application/octet-stream','',0,''),(28,'150_albumpic_80920_0_89219.jpg','',7,0,2,'','1336569513','files/standard/7/150_albumpic_80920_0_89219.jpg','application/octet-stream','',0,''),(29,'150_albumpic_80920_0_11374.jpg','',7,0,2,'','1336569582','files/standard/7/150_albumpic_80920_0_11374.jpg','application/octet-stream','',0,''),(30,'150_albumpic_80920_0_41666.jpg','',7,0,2,'','1336571399','files/standard/7/150_albumpic_80920_0_41666.jpg','application/octet-stream','',0,''),(31,'150_albumpic_80920_0_50939.jpg','',7,0,2,'','1336572412','files/standard/7/150_albumpic_80920_0_50939.jpg','application/octet-stream','',0,''),(32,'150_albumpic_80920_0_53210.jpg','',7,0,2,'','1336573104','files/standard/7/150_albumpic_80920_0_53210.jpg','application/octet-stream','',0,''),(33,'150_albumpic_80920_0_42724.jpg','',7,0,2,'','1336573175','files/standard/7/150_albumpic_80920_0_42724.jpg','application/octet-stream','',0,''),(34,'150_albumpic_80920_0_79400.jpg','',7,0,2,'','1336573461','files/standard/7/150_albumpic_80920_0_79400.jpg','application/octet-stream','',0,''),(35,'150_albumpic_80920_0_55082.jpg','',7,0,2,'','1336834546','files/standard/7/150_albumpic_80920_0_55082.jpg','application/octet-stream','',0,''),(36,'150_albumpic_80920_0_94034.jpg','',7,0,2,'','1336834595','files/standard/7/150_albumpic_80920_0_94034.jpg','application/octet-stream','',0,''),(37,'arrow_bottom_28416.png','',7,0,2,'','1336834736','files/standard/7/arrow_bottom_28416.png','application/octet-stream','',0,''),(38,'150_albumpic_80920_0_92329.jpg','',7,0,2,'','1338092964','files/standard/7/150_albumpic_80920_0_92329.jpg','application/octet-stream','',0,''),(39,'1_f01_19804.jpg','',7,0,2,'','1338099239','files/standard/7/1_f01_19804.jpg','application/octet-stream','',0,''),(40,'1_f01_41121.jpg','',7,0,2,'','1338101921','files/standard/7/1_f01_41121.jpg','application/octet-stream','',0,''),(41,'150_albumpic_80920_0_2511.jpg','',7,0,2,'','1338101947','files/standard/7/150_albumpic_80920_0_2511.jpg','application/octet-stream','',0,''),(42,'1_f01_59910.jpg','',7,0,2,'','1338102420','files/standard/7/1_f01_59910.jpg','application/octet-stream','',0,''),(43,'150_albumpic_80920_0_25384.jpg','',7,0,2,'','1338102437','files/standard/7/150_albumpic_80920_0_25384.jpg','application/octet-stream','',0,''),(44,'1_f01_53082.jpg','',7,0,2,'','1338102447','files/standard/7/1_f01_53082.jpg','application/octet-stream','',0,''),(45,'1_f01_90749.jpg','',7,0,2,'','1338102466','files/standard/7/1_f01_90749.jpg','application/octet-stream','',0,''),(46,'1_f01_24952.jpg','',7,0,2,'','1338102481','files/standard/7/1_f01_24952.jpg','application/octet-stream','',0,''),(47,'arrow_bottom_62790.png','',7,0,2,'','1338102497','files/standard/7/arrow_bottom_62790.png','application/octet-stream','',0,''),(48,'1_f01_82485.jpg','',7,0,2,'','1338102635','files/standard/7/1_f01_82485.jpg','application/octet-stream','',0,''),(49,'1_f01_80297.jpg','',7,0,2,'','1338102645','files/standard/7/1_f01_80297.jpg','application/octet-stream','',0,''),(50,'1_f01_57137.jpg','',7,0,2,'','1338102662','files/standard/7/1_f01_57137.jpg','application/octet-stream','',0,''),(51,'1_f01_6497.jpg','',7,0,2,'','1338102668','files/standard/7/1_f01_6497.jpg','application/octet-stream','',0,''),(52,'150_albumpic_80920_0_26258.jpg','',7,0,2,'','1338102742','files/standard/7/150_albumpic_80920_0_26258.jpg','application/octet-stream','',0,''),(53,'150_albumpic_80920_0_41389.jpg','',7,0,2,'','1338102749','files/standard/7/150_albumpic_80920_0_41389.jpg','application/octet-stream','',0,''),(54,'150_albumpic_80920_0_92648.jpg','',7,0,2,'','1338102764','files/standard/7/150_albumpic_80920_0_92648.jpg','application/octet-stream','',0,''),(55,'150_albumpic_80920_0_19055.jpg','',7,0,2,'','1338102769','files/standard/7/150_albumpic_80920_0_19055.jpg','application/octet-stream','',0,''),(56,'150_albumpic_80920_0_26173.jpg','',7,0,2,'','1338102778','files/standard/7/150_albumpic_80920_0_26173.jpg','application/octet-stream','',0,''),(57,'1_f01_14397.jpg','',7,0,2,'','1338102786','files/standard/7/1_f01_14397.jpg','application/octet-stream','',0,''),(58,'150_albumpic_80920_0_45032.jpg','',7,0,2,'','1338102822','files/standard/7/150_albumpic_80920_0_45032.jpg','application/octet-stream','',0,''),(59,'150_albumpic_80920_0_60950.jpg','',7,0,2,'','1338102829','files/standard/7/150_albumpic_80920_0_60950.jpg','application/octet-stream','',0,''),(60,'150_albumpic_80920_0_68687.jpg','',7,0,2,'','1338103038','files/standard/7/150_albumpic_80920_0_68687.jpg','application/octet-stream','',0,''),(61,'150_albumpic_80920_0_25531.jpg','',7,0,2,'','1338103051','files/standard/7/150_albumpic_80920_0_25531.jpg','application/octet-stream','',0,''),(62,'150_albumpic_80920_0_12383.jpg','',7,0,2,'','1338103063','files/standard/7/150_albumpic_80920_0_12383.jpg','application/octet-stream','',0,''),(63,'150_albumpic_80920_0_79643.jpg','',7,0,2,'','1338103073','files/standard/7/150_albumpic_80920_0_79643.jpg','application/octet-stream','',0,''),(64,'150_albumpic_80920_0_65052.jpg','',7,0,2,'','1338103076','files/standard/7/150_albumpic_80920_0_65052.jpg','application/octet-stream','',0,''),(65,'150_albumpic_80920_0_5574.jpg','',7,0,2,'','1338103186','files/standard/7/150_albumpic_80920_0_5574.jpg','application/octet-stream','',0,''),(66,'150_albumpic_80920_0_659.jpg','',7,0,2,'','1338103191','files/standard/7/150_albumpic_80920_0_659.jpg','application/octet-stream','',0,''),(67,'150_albumpic_80920_0_92578.jpg','',7,0,2,'','1338103245','files/standard/7/150_albumpic_80920_0_92578.jpg','application/octet-stream','',0,''),(68,'150_albumpic_80920_0_33129.jpg','',7,0,2,'','1338103249','files/standard/7/150_albumpic_80920_0_33129.jpg','application/octet-stream','',0,''),(69,'150_albumpic_80920_0_91044.jpg','',7,0,2,'','1338103253','files/standard/7/150_albumpic_80920_0_91044.jpg','application/octet-stream','',0,''),(70,'150_albumpic_80920_0_20734.jpg','',7,0,2,'','1338103256','files/standard/7/150_albumpic_80920_0_20734.jpg','application/octet-stream','',0,''),(71,'150_albumpic_80920_0_35700.jpg','',7,0,2,'','1338103331','files/standard/7/150_albumpic_80920_0_35700.jpg','application/octet-stream','',0,''),(72,'150_albumpic_80920_0_51094.jpg','',7,0,2,'','1338103375','files/standard/7/150_albumpic_80920_0_51094.jpg','application/octet-stream','',0,''),(73,'150_albumpic_80920_0_44053.jpg','',7,0,2,'','1338103378','files/standard/7/150_albumpic_80920_0_44053.jpg','application/octet-stream','',0,''),(74,'150_albumpic_80920_0_95948.jpg','',7,0,2,'','1338103384','files/standard/7/150_albumpic_80920_0_95948.jpg','application/octet-stream','',0,''),(75,'1_f01_17145.jpg','',7,0,2,'','1338103696','files/standard/7/1_f01_17145.jpg','application/octet-stream','',0,''),(76,'150_albumpic_80920_0_16143.jpg','',7,0,2,'','1338103709','files/standard/7/150_albumpic_80920_0_16143.jpg','application/octet-stream','',0,''),(77,'arrow_bottom_90964.png','',7,0,2,'','1338103715','files/standard/7/arrow_bottom_90964.png','application/octet-stream','',0,''),(78,'1_f01_32663.jpg','',7,0,2,'','1338103720','files/standard/7/1_f01_32663.jpg','application/octet-stream','',0,''),(79,'150_albumpic_80920_0_85545.jpg','',7,0,2,'','1338103730','files/standard/7/150_albumpic_80920_0_85545.jpg','application/octet-stream','',0,''),(80,'1_f01_6039.jpg','',7,0,2,'','1338103745','files/standard/7/1_f01_6039.jpg','application/octet-stream','',0,''),(81,'1_f01_51091.jpg','',7,0,2,'','1338103751','files/standard/7/1_f01_51091.jpg','application/octet-stream','',0,''),(82,'arrow_bottom_54207.png','',7,0,2,'','1338103757','files/standard/7/arrow_bottom_54207.png','application/octet-stream','',0,''),(83,'150_albumpic_80920_0_81861.jpg','',7,0,2,'','1338103994','files/standard/7/150_albumpic_80920_0_81861.jpg','application/octet-stream','',0,''),(84,'arrow_bottom_40729.png','',7,0,2,'','1338103998','files/standard/7/arrow_bottom_40729.png','application/octet-stream','',0,''),(85,'150_albumpic_80920_0_52290.jpg','',7,0,2,'','1338104002','files/standard/7/150_albumpic_80920_0_52290.jpg','application/octet-stream','',0,''),(86,'150_albumpic_80920_0_74949.jpg','',7,0,2,'','1338104220','files/standard/7/150_albumpic_80920_0_74949.jpg','application/octet-stream','',0,''),(87,'1_f01_93320.jpg','',7,0,2,'','1338104281','files/standard/7/1_f01_93320.jpg','application/octet-stream','',0,''),(88,'1_f01_29104.jpg','',7,0,2,'','1338104307','files/standard/7/1_f01_29104.jpg','application/octet-stream','',0,''),(89,'150_albumpic_80920_0_70175.jpg','',7,0,2,'','1338104312','files/standard/7/150_albumpic_80920_0_70175.jpg','application/octet-stream','',0,''),(90,'arrow_bottom_83020.png','',7,0,2,'','1338104318','files/standard/7/arrow_bottom_83020.png','application/octet-stream','',0,''),(91,'150_albumpic_80920_0_4135.jpg','',7,0,2,'','1338133353','files/standard/7/150_albumpic_80920_0_4135.jpg','application/octet-stream','',0,''),(92,'150_albumpic_80920_0_3346.jpg','',7,0,2,'','1338133435','files/standard/7/150_albumpic_80920_0_3346.jpg','application/octet-stream','',0,''),(93,'150_albumpic_80920_0_30471.jpg','',7,0,2,'','1338133529','files/standard/7/150_albumpic_80920_0_30471.jpg','application/octet-stream','',0,''),(94,'arrow_bottom_10642.png','',7,0,2,'','1338136395','files/standard/7/arrow_bottom_10642.png','application/octet-stream','',0,''),(95,'150_albumpic_80920_0_52656.jpg','',9,0,2,'','1338812052','files/standard/9/150_albumpic_80920_0_52656.jpg','application/octet-stream','',0,''),(96,'application_89376.ini','',7,0,1,'','1345127863','files/standard/7/application_89376.ini','application/octet-stream','',0,''),(97,'application_3894.ini','',7,0,1,'','1345127930','files/standard/7/application_3894.ini','application/octet-stream','',0,''),(98,'application_27653.ini','',7,0,1,'','1345127991','files/standard/7/application_27653.ini','application/octet-stream','',0,''),(99,'application_81601.ini','',7,0,1,'','1345128134','files/standard/7/application_81601.ini','application/octet-stream','',0,''),(100,'application_44695.ini','',7,0,1,'','1345129095','files/standard/7/application_44695.ini','application/octet-stream','',0,''),(101,'application_19798.ini','',7,0,1,'','1345129156','files/standard/7/application_19798.ini','application/octet-stream','',0,''),(102,'application_91394.ini','',7,0,1,'','1345129175','files/standard/7/application_91394.ini','application/octet-stream','',0,''),(103,'application_81475.ini','',7,0,1,'','1345129191','files/standard/7/application_81475.ini','application/octet-stream','',0,''),(104,'application_63186.ini','',7,0,1,'','1345129285','files/standard/7/application_63186.ini','application/octet-stream','',0,''),(105,'application_77373.ini','',7,0,1,'','1345129327','files/standard/7/application_77373.ini','application/octet-stream','',0,''),(106,'application_39977.ini','',7,0,1,'','1345129589','files/standard/7/application_39977.ini','application/octet-stream','',0,''),(115,'Screenshot1_47765.mkm','',7,0,1,'','1345301401','files/standard/7/Screenshot1_47765.mkm','application/octet-stream','',0,''),(111,'bg_btn_bar_8693.png','',7,0,1,'','1345131148','files/standard/7/bg_btn_bar_8693.png','application/octet-stream','',0,''),(114,'Screenshot1_86447.mkm','',7,0,1,'','1345301370','files/standard/7/Screenshot1_86447.mkm','application/octet-stream','',0,''),(116,'Screenshot1_98688.mkm','',7,0,1,'','1345344651','files/standard/7/Screenshot1_98688.mkm','application/octet-stream','',0,''),(117,'Screenshot1_51648.mkm','',11,0,1,'','1345385725','files/standard/11/Screenshot1_51648.mkm','application/octet-stream','',0,''),(118,'Screenshot1_89133.mkm','',7,0,1,'','1345386030','files/standard/7/Screenshot1_89133.mkm','application/octet-stream','',0,''),(119,'Screenshot1_32283.mkm','',7,0,1,'','1345472942','files/standard/7/Screenshot1_32283.mkm','application/octet-stream','',0,''),(120,'bg_btn_bar_51447.png','',7,0,1,'','1345810430','files/standard/7/bg_btn_bar_51447.png','application/octet-stream','',0,''),(121,'Screenshot1_71482.mkm','',7,0,1,'','1346767777','files/standard/7/Screenshot1_71482.mkm','application/octet-stream','',0,''),(122,'Screenshot1_93809.mkm','',7,0,1,'','1346767797','files/standard/7/Screenshot1_93809.mkm','application/octet-stream','',0,''),(123,'Screenshot1_6411.mkm','',7,0,1,'','1346767917','files/standard/7/Screenshot1_6411.mkm','application/octet-stream','',0,''),(124,'Screenshot1_15650.mkm','',7,0,1,'','1346768008','files/standard/7/Screenshot1_15650.mkm','application/octet-stream','',0,''),(125,'bg_btn_bar_54665.png','',11,0,1,'','1347034197','files/standard/11/bg_btn_bar_54665.png','application/octet-stream','',0,''),(126,'Screenshot1_69775.mkm','',11,0,1,'','1347073178','files/standard/11/Screenshot1_69775.mkm','application/octet-stream','',0,''),(127,'Screenshot1_89493.mkm','',11,0,1,'','1347073236','files/standard/11/Screenshot1_89493.mkm','application/octet-stream','',0,''),(128,'Screenshot1_44378.mkm','',11,0,1,'','1347073268','files/standard/11/Screenshot1_44378.mkm','application/octet-stream','',0,''),(129,'Screenshot1_80606.mkm','',11,0,1,'','1347095966','files/standard/11/Screenshot1_80606.mkm','application/octet-stream','',0,''),(130,'Screenshot1_9868.mkm','',11,0,1,'','1347097803','files/standard/11/Screenshot1_9868.mkm','application/octet-stream','',0,''),(131,'Screenshot1_12949.mkm','',11,0,1,'','1347097871','files/standard/11/Screenshot1_12949.mkm','application/octet-stream','',0,''),(132,'Screenshot1_21581.mkm','',11,0,1,'','1347097962','files/standard/11/Screenshot1_21581.mkm','application/octet-stream','',0,''),(133,'Screenshot1_28463.mkm','',10,0,1,'','1347098147','files/standard/10/Screenshot1_28463.mkm','application/octet-stream','',0,''),(134,'Screenshot1_83995.mkm','',11,0,1,'','1347192473','files/standard/11/Screenshot1_83995.mkm','application/octet-stream','',0,''),(135,'application_85444.ini','',7,0,2,'','1349968809','files/standard/7/application_85444.ini','application/octet-stream','',0,''),(136,'chrome_35767.manifest','',11,0,2,'','1350190841','files/standard/11/chrome_35767.manifest','application/octet-stream','',0,''),(137,'chrome_51191.manifest','',11,0,2,'','1350191001','files/standard/11/chrome_51191.manifest','application/octet-stream','',0,'');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_attached`
--

DROP TABLE IF EXISTS `files_attached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_attached` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` int(10) unsigned NOT NULL DEFAULT '0',
  `message` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `file` (`file`,`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_attached`
--

LOCK TABLES `files_attached` WRITE;
/*!40000 ALTER TABLE `files_attached` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_attached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project` int(10) NOT NULL,
  `inner_cost` int(11) DEFAULT NULL,
  `inner_cost_currency` varchar(3) NOT NULL DEFAULT 'RMB',
  `external_cost` int(11) DEFAULT NULL,
  `external_cost_currency` varchar(3) NOT NULL DEFAULT 'RMB',
  `real_cost` int(11) DEFAULT NULL,
  `real_cost_currency` varchar(3) NOT NULL DEFAULT 'RMB',
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(10) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `project` (`project`),
  KEY `approved` (`approved`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
INSERT INTO `finance` (`ID`, `name`, `project`, `inner_cost`, `inner_cost_currency`, `external_cost`, `external_cost_currency`, `real_cost`, `real_cost_currency`, `approved`, `published`, `order`, `valid`) VALUES (1,'123',1,1235,'USD',0,'USD',NULL,'RMB',1,1,0,1),(2,'sdfsd',1,100,'USD',100,'USD',NULL,'RMB',1,0,0,1),(3,'dsa',1,123,'USD',100,'USD',NULL,'RMB',0,0,0,1);
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `action` int(1) NOT NULL DEFAULT '0',
  `project` int(10) NOT NULL DEFAULT '0',
  `datum` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `datum` (`datum`),
  KEY `type` (`type`),
  KEY `action` (`action`),
  FULLTEXT KEY `username` (`username`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`ID`, `user`, `username`, `name`, `type`, `action`, `project`, `datum`) VALUES (1,1,'sys_admin','mgrLv1','user',1,0,'1333773564'),(2,1,'sys_admin','mgrLv2','user',1,0,'1333773606'),(3,1,'sys_admin','customerLv1','user',1,0,'1333773630'),(4,1,'sys_admin','customerLv2','user',1,0,'1333773650'),(5,1,'sys_admin','supplierLv1','user',1,0,'1333773671'),(6,1,'sys_admin','supplierLv2','user',1,0,'1333773690'),(7,1,'sys_admin','admin','user',1,0,'1333773713'),(8,1,'sys_admin','emp1','user',1,0,'1333773743'),(9,1,'sys_admin','emp2','user',1,0,'1333773766'),(10,1,'sys_admin','emp3','user',1,0,'1333773787'),(11,1,'sys_admin','emp3','user',2,0,'1333774122'),(12,1,'sys_admin','emp2','user',2,0,'1333774122'),(13,1,'sys_admin','emp1','user',2,0,'1333774122'),(14,1,'sys_admin','admin','user',2,0,'1333774122'),(15,1,'sys_admin','supplierLv2','user',2,0,'1333774122'),(16,1,'sys_admin','supplierLv1','user',2,0,'1333774122'),(17,1,'sys_admin','customerLv2','user',2,0,'1333774122'),(18,1,'sys_admin','customerLv1','user',2,0,'1333774122'),(19,1,'sys_admin','mgrLv2','user',2,0,'1333774122'),(20,1,'sys_admin','mgrLv1','user',2,0,'1333774122'),(21,1,'sys_admin','sys_admin','user',2,0,'1333774122'),(22,3,'mgrLv2','project-A','projekt',1,1,'1333775135'),(23,3,'mgrLv2','emp2','user',6,1,'1333775135'),(24,3,'mgrLv2','emp1','user',6,1,'1333775135'),(25,3,'mgrLv2','supplierLv1','user',6,1,'1333775135'),(26,3,'mgrLv2','customerLv1','user',6,1,'1333775135'),(27,3,'mgrLv2','mgrLv2','user',6,1,'1333775135'),(28,1,'sys_admin','mgrLv1','user',2,0,'1333775422'),(29,1,'sys_admin','emp3','user',2,0,'1333775609'),(30,1,'sys_admin','emp2','user',2,0,'1333775630'),(31,1,'sys_admin','emp1','user',2,0,'1333775649'),(32,1,'sys_admin','admin','user',2,0,'1333775663'),(33,1,'sys_admin','supplierLv2','user',2,0,'1333775735'),(34,1,'sys_admin','supplierLv1','user',2,0,'1333775758'),(35,1,'sys_admin','customerLv2','user',2,0,'1333775791'),(36,1,'sys_admin','customerLv1','user',2,0,'1333775811'),(37,1,'sys_admin','mgrLv2','user',2,0,'1333775838'),(38,3,'mgrLv2','emp3','user',6,1,'1333784113'),(39,3,'mgrLv2','emp3','user',7,1,'1333784124'),(40,3,'mgrLv2','emp3','user',7,1,'1333784137'),(41,3,'mgrLv2','mgrLv2','user',7,1,'1333784309'),(42,1,'sys_admin','mgrLv2','user',6,1,'1333784472'),(43,1,'sys_admin','emp3','user',6,1,'1333784482'),(44,3,'mgrLv2','emp3','user',7,1,'1333784574'),(45,2,'mgrLv1','Folder1','folder',1,1,'1334237242'),(46,2,'mgrLv1','ABC','file',3,1,'1334468238'),(47,2,'mgrLv1','Project-B','projekt',1,1,'1334663829'),(48,2,'mgrLv1','emp2','user',6,2,'1334663829'),(49,2,'mgrLv1','emp1','user',6,2,'1334663829'),(50,2,'mgrLv1','customerLv2','user',6,2,'1334663829'),(51,2,'mgrLv1','customerLv1','user',6,2,'1334663829'),(52,2,'mgrLv1','mgrLv1','user',6,2,'1334663829'),(53,2,'mgrLv1','Project-C','projekt',1,1,'1334664679'),(61,2,'mgrLv1','dsa','projekt',1,1,'1334665038'),(64,2,'mgrLv1','2','projekt',3,4,'1334665056'),(59,2,'mgrLv1','dsa','projekt',1,1,'1334665029'),(58,2,'mgrLv1','2','projekt',3,3,'1334664688'),(63,2,'mgrLv1','2','projekt',3,5,'1334665047'),(65,2,'mgrLv1','çš„è¯´æ³•','projekt',1,1,'1334666437'),(66,2,'mgrLv1','mgrLv1','user',6,6,'1334666437'),(67,2,'mgrLv1','Handle-Test','projekt',1,1,'1336485223'),(68,2,'mgrLv1','tasklist','tasklist',1,7,'1336485223'),(69,2,'mgrLv1','emp3','user',6,7,'1336485223'),(70,2,'mgrLv1','emp2','user',6,7,'1336485223'),(71,2,'mgrLv1','emp1','user',6,7,'1336485223'),(72,2,'mgrLv1','supplierLv1','user',6,7,'1336485223'),(73,2,'mgrLv1','customerLv1','user',6,7,'1336485223'),(74,2,'mgrLv1','mgrLv2','user',6,7,'1336485223'),(75,2,'mgrLv1','mgrLv1','user',6,7,'1336485223'),(76,2,'mgrLv1','å“’å“’æ»´','message',1,7,'1337688736'),(77,2,'mgrLv1','PPPPPPPPPPP','projekt',1,1,'1338726662'),(78,2,'mgrLv1','tasklist','tasklist',1,8,'1338726662'),(79,2,'mgrLv1','mgrLv1','user',6,8,'1338726662'),(80,2,'mgrLv1','sssss','projekt',1,1,'1338726858'),(81,2,'mgrLv1','tasklist','tasklist',1,9,'1338726858'),(82,2,'mgrLv1','mgrLv1','user',6,9,'1338726858'),(83,2,'mgrLv1','vvvvvvv','projekt',1,1,'1338731286'),(84,2,'mgrLv1','tasklist','tasklist',1,10,'1338731287'),(85,2,'mgrLv1','mgrLv1','user',6,10,'1338731287'),(86,2,'mgrLv1','sss','task',2,9,'1338812298'),(87,2,'mgrLv1','sss','task',2,9,'1338812372'),(88,2,'mgrLv1','sss','task',2,9,'1338812443'),(89,2,'mgrLv1','fdsfds','task',2,7,'1340802829'),(90,11,'emp3','emp3','user',2,0,'1343132688'),(91,11,'emp3','emp3','user',2,0,'1343132898'),(92,11,'emp3','emp3','user',2,0,'1343132925'),(93,1,'sys_admin','dffsfds','task',2,7,'1343557393'),(94,1,'sys_admin','dffsfds','task',2,7,'1343557857'),(95,1,'sys_admin','dffsfds','task',2,7,'1343557896'),(96,1,'sys_admin','dffsfds','task',2,7,'1343558991'),(97,1,'sys_admin','dffsfds','task',2,7,'1343559140'),(98,1,'sys_admin','dffsfds','task',2,7,'1343559721'),(99,1,'sys_admin','dffsfds','task',2,7,'1343559747'),(100,1,'sys_admin','dffsfds','task',2,7,'1343559762'),(101,1,'sys_admin','sds','task',2,7,'1344346274'),(102,1,'sys_admin','Manual Elite','projekt',1,1,'1344347604'),(103,1,'sys_admin','tasklist','tasklist',1,11,'1344347604'),(104,1,'sys_admin','sys_admin','user',6,11,'1344347604'),(105,1,'sys_admin','A  & B','task',2,7,'1344349209'),(106,1,'sys_admin','A  & B','task',2,7,'1344349739'),(107,1,'sys_admin','emp1','user',2,0,'1344517259'),(108,1,'sys_admin','emp3','user',2,0,'1344517277'),(109,1,'sys_admin','dddd','task',2,7,'1344517811'),(110,1,'sys_admin','dddd','task',2,7,'1344518123'),(111,1,'sys_admin','dddd','task',2,7,'1344518870'),(112,1,'sys_admin','sss','task',2,7,'1344522841'),(113,1,'sys_admin','sss','task',2,7,'1344522847'),(114,1,'sys_admin','sss','task',2,7,'1344522858'),(115,1,'sys_admin','sss','task',2,7,'1344522894'),(116,1,'sys_admin','sss','task',2,7,'1344522918'),(117,1,'sys_admin','sss','task',2,7,'1344522957'),(118,1,'sys_admin','sss','task',2,7,'1344523055'),(119,1,'sys_admin','sss','task',2,7,'1344526516'),(120,1,'sys_admin','sss','task',2,7,'1344526662'),(121,1,'sys_admin','sss','task',2,7,'1344526714'),(122,1,'sys_admin','sss','task',2,7,'1344526768'),(123,1,'sys_admin','sss','task',2,7,'1344526809'),(124,1,'sys_admin','sss','task',2,7,'1344526922'),(125,1,'sys_admin','sss','task',2,7,'1344527006'),(126,1,'sys_admin','sss','task',2,7,'1344527036'),(127,1,'sys_admin','sss','task',2,7,'1344527171'),(128,1,'sys_admin','sss','task',2,7,'1344527259'),(129,1,'sys_admin','emp2','user',2,0,'1344527605'),(130,1,'sys_admin','sss','task',2,7,'1344527630'),(131,1,'sys_admin','dsa','task',2,7,'1344527700'),(132,1,'sys_admin','dsa','task',2,7,'1344527811'),(133,1,'sys_admin','dsa','task',2,7,'1344740252'),(134,1,'sys_admin','dsa','task',2,7,'1344744455'),(135,1,'sys_admin','application_84269.ini','file',3,7,'1345129632'),(136,1,'sys_admin','1_36117.wmv','file',3,7,'1345129750'),(137,1,'sys_admin','Firefoxlatesttar_37272.bz2','file',3,7,'1345130110'),(138,1,'sys_admin','Firefoxlatesttar_282.bz2','file',3,7,'1345131269'),(139,1,'sys_admin','Firefoxlatesttar_42135.bz2','file',3,7,'1345131275'),(140,1,'sys_admin','springframework305RELEASEwithdocs_40073.zip','file',3,7,'1345131334'),(141,1,'sys_admin','ss','task',2,7,'1345733304'),(142,1,'sys_admin','dddddddd','task',2,7,'1345733488'),(143,1,'sys_admin','dddddddd','task',2,7,'1345733652'),(144,1,'sys_admin','dddddddd','task',2,7,'1345734030'),(145,1,'sys_admin','dddddddd','task',2,7,'1345734142'),(146,1,'sys_admin','dddddddd','task',2,7,'1345734324'),(147,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764395'),(148,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764412'),(149,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764685'),(150,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764710'),(151,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764733'),(152,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764780'),(153,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764922'),(154,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764938'),(155,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764962'),(156,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346764990'),(157,1,'sys_admin','sssssssssssssssssss','task',2,7,'1346765022'),(158,1,'sys_admin','customerLv1','user',6,11,'1347131295');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `project` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `posted` varchar(255) NOT NULL DEFAULT '',
  `user` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `replyto` int(11) NOT NULL DEFAULT '0',
  `milestone` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `project` (`project`),
  KEY `user` (`user`),
  KEY `replyto` (`replyto`),
  KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`ID`, `project`, `title`, `text`, `tags`, `posted`, `user`, `username`, `replyto`, `milestone`) VALUES (1,7,'å“’å“’æ»´','èŒƒå¾·è¨','Dsa','1337688736',2,'mgrLv1',0,0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `project` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `start` varchar(255) NOT NULL DEFAULT '',
  `end` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `name` (`name`),
  KEY `end` (`end`),
  KEY `project` (`project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_assigned`
--

DROP TABLE IF EXISTS `milestones_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_assigned` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `milestone` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user` (`user`),
  KEY `milestone` (`milestone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_assigned`
--

LOCK TABLES `milestones_assigned` WRITE;
/*!40000 ALTER TABLE `milestones_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project` int(10) NOT NULL,
  `customer_po_number` varchar(255) DEFAULT NULL,
  `attachment1` varchar(255) DEFAULT NULL,
  `jenkins_po_number` varchar(255) DEFAULT NULL,
  `attachment2` varchar(255) DEFAULT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `account_payment` varchar(255) DEFAULT NULL,
  `customer_model_number` varchar(255) DEFAULT NULL,
  `customer_part_number` varchar(255) DEFAULT NULL,
  `jenkins_model_number` varchar(255) DEFAULT NULL,
  `jenkins_part_number` varchar(255) DEFAULT NULL,
  `payment_one_schedule` varchar(255) DEFAULT NULL,
  `payment_one_status` tinyint(4) DEFAULT NULL,
  `payment_one_attachment` varchar(255) DEFAULT NULL,
  `payment_two_schedule` varchar(255) DEFAULT NULL,
  `payment_two_status` tinyint(4) DEFAULT NULL,
  `payment_two_attachment` varchar(255) DEFAULT NULL,
  `payment_three_schedule` varchar(255) DEFAULT NULL,
  `payment_three_status` tinyint(4) DEFAULT NULL,
  `payment_three_attachment` varchar(255) DEFAULT NULL,
  `final_total_amount_received` varchar(255) DEFAULT NULL,
  `delivery_date_one` varchar(255) DEFAULT NULL,
  `delivery_date_two` varchar(255) DEFAULT NULL,
  `desc` text,
  `submit_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(10) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `inner_cost` int(11) DEFAULT NULL,
  `inner_cost_currency` varchar(3) DEFAULT NULL,
  `external_cost` int(11) DEFAULT NULL,
  `external_cost_currency` varchar(3) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `delivery_status_one` int(10) DEFAULT NULL,
  `delivery_status_two` int(10) DEFAULT NULL,
  `waiverDesc` longtext,
  `isFulfilled` int(1) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`ID`, `name`, `project`, `customer_po_number`, `attachment1`, `jenkins_po_number`, `attachment2`, `factory`, `terms`, `account_payment`, `customer_model_number`, `customer_part_number`, `jenkins_model_number`, `jenkins_part_number`, `payment_one_schedule`, `payment_one_status`, `payment_one_attachment`, `payment_two_schedule`, `payment_two_status`, `payment_two_attachment`, `payment_three_schedule`, `payment_three_status`, `payment_three_attachment`, `final_total_amount_received`, `delivery_date_one`, `delivery_date_two`, `desc`, `submit_time`, `end_time`, `status`, `valid`, `quantity`, `inner_cost`, `inner_cost_currency`, `external_cost`, `external_cost_currency`, `published`, `delivery_status_one`, `delivery_status_two`, `waiverDesc`, `isFulfilled`) VALUES (1,'sdd',7,'sss','','12','87','12','12','12','12','12','12','12','12',36,'88','12',36,'89','12',36,'90','12','sds','aaa','ddddd','2012-05-27 14:09:07','2012-05-12 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,38,36,NULL,-1),(2,'x',7,'xxxx','39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'czxczx','xxx','ssssss','2012-05-27 14:14:13','2012-05-23 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(3,'321321',7,'1231','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-01','2012-05-02','dsadsa','2012-09-08 18:36:14','2012-05-01 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(4,'dsadsa',7,'11111','','321',NULL,'5555','1111','1222','','','','','',38,NULL,'',38,NULL,'',38,NULL,'200','2012-05-01','2012-05-02','1`11111','2012-09-08 18:40:12','2012-06-01 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,37,38,NULL,-1),(5,'111',11,'Order 1','','',NULL,'','','','','','','','',36,NULL,'',36,NULL,'',36,NULL,'','2012-09-01','2012-09-01','sas','2012-09-09 01:07:36','2012-09-01 00:00:00',14,1,122,NULL,NULL,NULL,NULL,NULL,36,36,NULL,-1),(6,'aaaaaaaa',11,'saddsa','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-01','2012-05-02','sdadsa','2012-09-19 23:11:53','2012-05-01 00:00:00',14,1,122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(7,'aaaa',11,'ssss','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-01','2012-05-02','sss','2012-09-19 23:13:31','2012-05-01 00:00:00',14,1,122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(8,'zzzz',11,'zzzz','','',NULL,'','','','','','','','',36,NULL,'',36,NULL,'',36,NULL,'','2012-05-01','2012-05-02','xz','2012-09-19 23:16:58','2012-05-01 00:00:00',14,1,122,NULL,NULL,NULL,NULL,NULL,36,36,'',-1),(9,'sss',11,'ssd','','',NULL,'','','','','','','','',36,NULL,'',36,NULL,'',36,NULL,'','2012-05-01','2012-05-02','saas','2012-09-19 23:18:12','2012-06-01 00:00:00',14,1,122,NULL,NULL,NULL,NULL,NULL,36,36,'dsadsadasdsad<br />dsa<br />dsa<br />d<br />asd<br />as',1),(10,'fdsfds',11,'sdfsd','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-09-01','2012-05-02','fdsfdsfds','2012-09-24 21:44:14','2012-05-01 00:00:00',14,1,222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(11,'22222222',11,'222222','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-09-01','2012-05-02','dsadsa','2012-09-24 21:45:07','2012-05-01 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),(12,'3333',11,'323','','',NULL,'','','','','','','','',36,NULL,'',36,NULL,'',36,NULL,'','2012-09-01','2012-09-01','dsa','2012-09-24 21:46:36','2012-06-01 00:00:00',14,1,111,NULL,NULL,NULL,NULL,NULL,36,36,'',-1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_attached`
--

DROP TABLE IF EXISTS `order_attached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_attached` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` int(10) NOT NULL,
  `fileId` int(10) NOT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_attached`
--

LOCK TABLES `order_attached` WRITE;
/*!40000 ALTER TABLE `order_attached` DISABLE KEYS */;
INSERT INTO `order_attached` (`ID`, `orderId`, `fileId`, `type`) VALUES (1,3,1,0),(2,3,2,0),(3,3,3,0),(4,4,3,0),(45,5,8,0),(46,5,1,1),(47,5,2,1),(48,5,3,1),(49,5,1,2),(50,5,2,2),(51,5,3,2),(52,5,21,3),(53,5,20,3),(54,5,19,3),(55,5,17,3),(56,6,0,0),(57,7,0,0),(116,9,0,0),(117,9,0,1),(118,9,0,2),(119,9,0,3),(132,8,0,0),(133,8,0,1),(134,8,0,2),(135,8,0,3),(136,10,0,0),(137,11,0,0),(240,12,3,0),(241,12,9,0),(242,12,3,0),(243,12,4,0),(244,12,10,1),(245,12,0,2),(246,12,0,3),(247,12,3,4),(248,12,4,4);
/*!40000 ALTER TABLE `order_attached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_compliance`
--

DROP TABLE IF EXISTS `order_compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_compliance` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(45) NOT NULL,
  `complianceType` varchar(255) NOT NULL,
  `complianceField` longtext,
  `isFinished` int(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_compliance`
--

LOCK TABLES `order_compliance` WRITE;
/*!40000 ALTER TABLE `order_compliance` DISABLE KEYS */;
INSERT INTO `order_compliance` (`ID`, `orderId`, `complianceType`, `complianceField`, `isFinished`) VALUES (1,'12','Customer Quality Test/Inspection','',1),(2,'12','Third Party Test/Inspection','',1),(3,'12','Jenkins Quality Inspection','',-1);
/*!40000 ALTER TABLE `order_compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ecn`
--

DROP TABLE IF EXISTS `order_ecn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ecn` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` int(10) NOT NULL,
  `ecnId` int(10) NOT NULL,
  `isFinished` int(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ecn`
--

LOCK TABLES `order_ecn` WRITE;
/*!40000 ALTER TABLE `order_ecn` DISABLE KEYS */;
INSERT INTO `order_ecn` (`ID`, `orderId`, `ecnId`, `isFinished`) VALUES (1,6,7,-1),(2,7,7,-1),(3,8,7,1),(4,10,7,-1),(5,11,7,-1),(6,12,7,-1);
/*!40000 ALTER TABLE `order_ecn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_qualitys`
--

DROP TABLE IF EXISTS `order_qualitys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_qualitys` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `orderId` int(10) NOT NULL,
  `qualityId` int(10) NOT NULL,
  `isFinish` int(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_qualitys`
--

LOCK TABLES `order_qualitys` WRITE;
/*!40000 ALTER TABLE `order_qualitys` DISABLE KEYS */;
INSERT INTO `order_qualitys` (`ID`, `orderId`, `qualityId`, `isFinish`) VALUES (1,9,18,1),(2,9,20,1),(3,10,20,-1),(4,11,18,-1),(5,12,18,1);
/*!40000 ALTER TABLE `order_qualitys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phase`
--

DROP TABLE IF EXISTS `phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phase` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` text,
  `project` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `parentPhase` int(11) DEFAULT '-1',
  `childPhase` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `project` (`project`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phase`
--

LOCK TABLES `phase` WRITE;
/*!40000 ALTER TABLE `phase` DISABLE KEYS */;
INSERT INTO `phase` (`ID`, `name`, `desc`, `project`, `status`, `valid`, `parentPhase`, `childPhase`) VALUES (1,'Phase 1','',1,18,1,-1,-1),(2,'Phase 2','',1,18,1,-1,-1),(3,'P1','',2,18,0,-1,-1),(4,'P2','',2,18,0,-1,-1),(5,'P2','',2,18,3,-1,-1),(6,'P3','',2,18,1,-1,7),(7,'P4','',2,18,1,6,-1),(8,'P5','',2,18,1,-1,-1),(9,'P6','',2,18,1,8,-1),(10,'P1','',7,18,1,-1,-1),(11,'pppp','',9,18,1,-1,-1),(12,'ssss','',9,18,1,-1,-1),(13,'xxxx','',9,18,1,-1,-1),(14,'ssssssss','',9,18,1,-1,-1),(15,'1111','',11,18,1,-1,-1);
/*!40000 ALTER TABLE `phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectfolders`
--

DROP TABLE IF EXISTS `projectfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectfolders` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `project` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `visible` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `project` (`project`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectfolders`
--

LOCK TABLES `projectfolders` WRITE;
/*!40000 ALTER TABLE `projectfolders` DISABLE KEYS */;
INSERT INTO `projectfolders` (`ID`, `parent`, `project`, `name`, `description`, `visible`) VALUES (1,0,1,'Folder1','dsadsa','');
/*!40000 ALTER TABLE `projectfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekte`
--

DROP TABLE IF EXISTS `projekte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projekte` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `project_no` varchar(255) DEFAULT NULL,
  `desc` text NOT NULL,
  `status` int(10) NOT NULL,
  `budget` float NOT NULL DEFAULT '0',
  `level` varchar(255) NOT NULL DEFAULT 'A-All new' COMMENT 'A-All new\nB-Innovation\nC-Cosmetics',
  `prioity` int(1) NOT NULL DEFAULT '1' COMMENT '1~5',
  `customer_name` varchar(255) NOT NULL DEFAULT '',
  `supplier` varchar(255) DEFAULT '',
  `target_fob` double DEFAULT NULL,
  `target_fob_currency` varchar(3) DEFAULT 'RMB',
  `forecasted_annual_quantity_1` int(11) DEFAULT '0',
  `forecasted_annual_quantity_2` int(11) DEFAULT '0',
  `forecasted_annual_quantity_3` int(11) DEFAULT '0',
  `customer_leader` int(10) DEFAULT NULL,
  `supplier_leader` int(10) DEFAULT NULL,
  `project_leader` int(10) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `valid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekte`
--

LOCK TABLES `projekte` WRITE;
/*!40000 ALTER TABLE `projekte` DISABLE KEYS */;
INSERT INTO `projekte` (`ID`, `name`, `project_no`, `desc`, `status`, `budget`, `level`, `prioity`, `customer_name`, `supplier`, `target_fob`, `target_fob_currency`, `forecasted_annual_quantity_1`, `forecasted_annual_quantity_2`, `forecasted_annual_quantity_3`, `customer_leader`, `supplier_leader`, `project_leader`, `start_date`, `end_date`, `real_end_date`, `valid`) VALUES (1,'project-A',NULL,'',5,0,'A',1,'Virtual Customer A','Supplier AA',200,'USD',100,200,300,4,6,3,'2012-04-07 00:00:00','2012-04-27 00:00:00','2012-06-29 00:00:00',1),(2,'Project-B','aaaa','',9,0,'A',1,'C1','S1',0,'RMB',0,0,0,0,0,0,'2012-04-17 00:00:00','2012-04-29 00:00:00','2012-04-17 00:00:00',1),(6,'çš„è¯´æ³•',NULL,'dsfd',9,0,'A',1,'s','S1',0,'RMB',0,0,0,4,6,2,'2012-04-17 00:00:00','2012-04-17 00:00:00',NULL,1),(7,'Handle-Test-Changed','PPPP','',10,0,'A',1,'c1','Supplier AA',1,'RMB',0,0,0,4,6,2,'2012-05-08 00:00:00','2012-08-23 00:00:00','2012-11-30 00:00:00',1),(8,'PPPPPPPPPPP',NULL,'sadsadsadsa',9,0,'A',1,'','',0,'RMB',0,0,0,0,0,0,'2012-06-03 00:00:00','2012-06-03 00:00:00',NULL,1),(9,'sssss',NULL,'dsa',9,0,'A',1,'','',0,'RMB',0,0,0,0,0,0,'2012-06-03 00:00:00','2012-06-03 00:00:00','2012-07-09 00:00:00',1),(10,'vvvvvvv','sssds','',9,0,'A',1,'','',0,'RMB',0,0,0,0,0,0,'2012-06-03 00:00:00','2012-06-20 00:00:00','2012-06-03 00:00:00',1),(11,'Manual Elite','2131321','sadsads',9,0,'A',1,'','',0,'RMB',0,0,0,0,0,0,'2012-08-07 00:00:00','2012-08-07 00:00:00','2012-09-09 00:00:00',1);
/*!40000 ALTER TABLE `projekte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekte_assigned`
--

DROP TABLE IF EXISTS `projekte_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projekte_assigned` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `projekt` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user` (`user`),
  KEY `projekt` (`projekt`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekte_assigned`
--

LOCK TABLES `projekte_assigned` WRITE;
/*!40000 ALTER TABLE `projekte_assigned` DISABLE KEYS */;
INSERT INTO `projekte_assigned` (`ID`, `user`, `projekt`) VALUES (1,10,1),(2,9,1),(3,6,1),(4,4,1),(7,3,1),(9,10,2),(10,9,2),(11,5,2),(12,4,2),(13,2,2),(23,9,7),(22,10,7),(21,11,7),(20,2,6),(24,6,7),(25,4,7),(26,3,7),(27,2,7),(28,2,8),(29,2,9),(30,2,10),(31,1,11),(32,4,11);
/*!40000 ALTER TABLE `projekte_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `project` int(10) NOT NULL,
  `desc` text,
  `submit_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(10) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `price_currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`ID`, `name`, `project`, `desc`, `submit_time`, `end_time`, `status`, `valid`, `quantity`, `price`, `price_currency`) VALUES (1,'dsad',1,'dsadsa','2012-04-07 16:59:47','2012-02-02 00:00:00',33,1,231312,1000,'RMB'),(2,'dsa',1,'dsadsa','2012-04-07 17:02:22',NULL,32,1,1111,NULL,NULL),(3,'dsa',1,'dsadsa','2012-04-07 17:06:36',NULL,32,1,123,NULL,NULL),(4,'sda',1,'dsadsa','2012-04-07 17:08:09','2012-02-02 00:00:00',34,1,123,100,'RMB');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `action_no` varchar(255) NOT NULL,
  `issue_date` datetime NOT NULL,
  `product_no` varchar(255) DEFAULT NULL,
  `product_desc` longtext,
  `ship_no` varchar(255) DEFAULT NULL,
  `lot_quantity` int(10) DEFAULT NULL,
  `Sample_size` int(10) DEFAULT NULL,
  `defects` int(11) DEFAULT NULL,
  `reject_rate` double DEFAULT '0',
  `quantity_in_inventory` varchar(255) DEFAULT NULL,
  `quantity_in_process` varchar(255) DEFAULT NULL,
  `containment_desc` longtext,
  `acknowledge_by` varchar(255) DEFAULT NULL,
  `acknowledge_date` datetime DEFAULT NULL,
  `verified_for_closure_by` varchar(255) DEFAULT NULL,
  `verification_date` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `project` int(11) NOT NULL,
  `order` int(10) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` (`ID`, `action_no`, `issue_date`, `product_no`, `product_desc`, `ship_no`, `lot_quantity`, `Sample_size`, `defects`, `reject_rate`, `quantity_in_inventory`, `quantity_in_process`, `containment_desc`, `acknowledge_by`, `acknowledge_date`, `verified_for_closure_by`, `verification_date`, `valid`, `project`, `order`) VALUES (1,'','2012-05-01 00:00:00','dsa','dsa','dsadsada',0,0,0,0,'','','dsadsa','','2012-05-02 00:00:00','dfs','2012-05-03 00:00:00',1,0,-1),(2,'','2012-05-01 00:00:00','dsa','dsa','dsadsada',0,0,0,0,'','','dsadsa','','2012-05-02 00:00:00','dfs','2012-05-03 00:00:00',1,0,-1),(3,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,1,-1),(4,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,1,-1),(5,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,1,-1),(6,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,1,-1),(7,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','21','2012-10-02 00:00:00',1,7,-1),(8,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,7,-1),(9,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,7,-1),(10,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,7,-1),(11,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,7,-1),(12,'dsa','2012-05-01 00:00:00','sss','dd','sd',0,0,0,0,'','','sdsadsadsa','','2012-05-02 00:00:00','ddddddd','2012-05-03 00:00:00',1,7,-1),(13,'dsadsa','2012-05-13 00:00:00','','','',0,0,0,0,'','','','','2012-05-13 00:00:00','','2012-05-13 00:00:00',1,7,-1),(14,'sdfs','2012-05-13 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','fdsdsa','','2012-05-13 00:00:00','','2012-05-13 00:00:00',1,7,-1),(15,'sdfs','2012-05-13 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'123','','fdsdsa','','2012-05-13 00:00:00','','2012-05-13 00:00:00',1,7,-1),(16,'ACT:100','2012-05-12 00:00:00','P:120','Desc1','Ship:100',0,0,0,0,'1','2','Desc2','','2012-05-13 00:00:00','Sam','2012-05-14 00:00:00',1,7,-1),(17,'ACT:1','2012-05-02 00:00:00','P','','s',1,2,3,0.5,'','','','','2012-05-02 00:00:00','','2012-05-02 00:00:00',1,7,-1),(18,'dsad','2012-05-01 00:00:00','dsa','dsa','dsa',1111,0,0,0,'','','','','2012-01-01 00:00:00','','2012-01-01 00:00:00',1,11,5),(19,'dsad','2012-05-12 00:00:00','dsa','dsa','dsa',1111,1,0,0,'','','','','2012-01-01 00:00:00','','2012-01-01 00:00:00',1,-1,-1),(20,'dsad','2012-05-12 00:00:00','dsa','dsa','dsa',111,0,0,0,'','','','','2012-01-01 00:00:00','','2012-01-01 00:00:00',1,11,-1),(21,'dsadsa','2012-05-01 00:00:00','dsa','dsa','dsadsa',111,0,0,0,'','','','','2012-01-01 00:00:00','','2012-01-01 00:00:00',1,7,-1),(22,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','AAA','','2012-10-02 00:00:00','321','2012-10-02 00:00:00',1,7,-1),(23,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(24,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(25,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(26,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(27,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(28,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(29,'111112','2012-10-02 00:00:00','dsa','dsa','dsadsa',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(30,'121','2012-10-02 00:00:00','321','12312','dsadsa',1111111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(31,'121','2012-10-02 00:00:00','321','12312','dsadsa',1111111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(32,'121','2012-10-02 00:00:00','321','12312','dsadsa',1111111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(33,'dsadsa','2012-10-02 00:00:00','dsa','dsad','dsadsa',111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(34,'dsadsa','2012-10-02 00:00:00','dsa','dsadsa','dsadsa',1111111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(35,'111112','2012-10-02 00:00:00','dsadsa','dsa','dsad',0,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1),(36,'dsad','2012-10-02 00:00:00','321','dsad','dsad',1111111,0,0,0,'','','','','2012-10-02 00:00:00','','2012-10-02 00:00:00',1,7,-1);
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_details`
--

DROP TABLE IF EXISTS `quality_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `quality` int(11) NOT NULL,
  `reject_desc` longtext,
  `quantity` varchar(255) DEFAULT NULL,
  `required_desc` longtext,
  `root_cause` longtext,
  `containment_action` longtext,
  `supplier_short_term_corrective_act` longtext,
  `shot_term_implementation_date` datetime DEFAULT NULL,
  `short_term_verified` int(1) DEFAULT NULL,
  `supplier_long_term_corrective_act` longtext,
  `long_term_implementation_date` datetime DEFAULT NULL,
  `vendor_process_audit_plan_revision` varchar(255) DEFAULT NULL,
  `long_term_verified` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_details`
--

LOCK TABLES `quality_details` WRITE;
/*!40000 ALTER TABLE `quality_details` DISABLE KEYS */;
INSERT INTO `quality_details` (`ID`, `quality`, `reject_desc`, `quantity`, `required_desc`, `root_cause`, `containment_action`, `supplier_short_term_corrective_act`, `shot_term_implementation_date`, `short_term_verified`, `supplier_long_term_corrective_act`, `long_term_implementation_date`, `vendor_process_audit_plan_revision`, `long_term_verified`) VALUES (1,0,'dsadsa','100','dsadsa','dsadsa','dsadsadsa','dsadsa','2012-05-12 00:00:00',0,'dsadsa','2012-05-12 00:00:00','sdadsa',NULL),(2,0,'qqqqqqqqq','100','sssssssssss','ddddddddddd','xxxxxxxxxx','zzzzzzzzzzz','2012-02-03 00:00:00',0,'sdssssssssssssssssss','2012-02-06 00:00:00','sdds',NULL),(3,9,'xxxxxxxxxxx','dsadsa','dddddddddd','aaaaaaaaaaaaa','dddddddddddd','zzzzzzzzzzzz','2012-02-06 00:00:00',0,'ddddddddddd','2012-02-06 00:00:00','2012-02-07',NULL),(4,11,'sssssssssss','122','xxxxxxxx','zzzzzzzzzzz','cccccccccccc','dddddddddddddddddddd','2012-05-12 00:00:00',0,'xxxxxxxxx','2012-05-12 00:00:00','sssssssss',0),(5,10,'sssssssssss','1222','xxxxxxxxxxxxx','zzzzzzzzzzzzzz','ccccccccccccccc','eeeeeeeeeeeee','2012-05-12 00:00:00',0,'ssssssssssssssss',NULL,'123132',0),(6,7,'ssssssssssss','111','xxxxxxxxxxxxxxx','zzzzzzzzzzzzz','ccccccccccccccc','xxxxxxxxxxxxx','2012-05-12 00:00:00',0,'ssssssssssssssss','2012-05-12 00:00:00','ssssssssss',0),(7,7,'ssssssssssss','111','xxxxxxxxxxxxxxx','zzzzzzzzzzzzz','ccccccccccccccc','xxxxxxxxxxxxx','2012-05-12 00:00:00',0,'ssssssssssssssss','2012-05-12 00:00:00','ssssssssss',0),(8,7,'xxxxxxxxxxxxxx','1111111111','','','','','2012-02-06 00:00:00',0,'',NULL,'',0),(9,11,'ssssssssssssss','122','xxxxxxxxxxxxxxxxxx','','','',NULL,0,'',NULL,'',0),(10,11,'ssssssssssssss','122','xxxxxxxxxxxxxxxxxx','','','',NULL,0,'',NULL,'',0),(11,9,'','AXC','','','','',NULL,0,'',NULL,'',0),(12,7,'','ssssssssssss','','','','',NULL,0,'',NULL,'',0),(13,9,'dd','sssssssss','','','','',NULL,0,'',NULL,'',0),(14,7,'sssss','ssss','','','','',NULL,0,'',NULL,'',0),(15,7,'ssss','aaaa','','','','',NULL,0,'',NULL,'',0),(16,16,'AAAA','10/111','ddddddddddddd','ssssaaaaasddd','dsadsadsadsad','111111111111111','2012-05-05 00:00:00',1,'2222222222222222','2012-05-06 00:00:00','ssssssssss',1),(17,16,'dsadsa','1231','fdsfds','dsadsa','dsadsa','dsadsadsa',NULL,0,'',NULL,'',0),(18,16,'sdsadsa','ssss','dsadsadsa','sdadsadsa','','',NULL,0,'',NULL,'',0),(19,18,'','','','','','',NULL,0,'',NULL,'',0),(20,18,'dsadsa','1111111','dsadsa','dsadsa','dsadsa','dsadsa','2012-05-12 00:00:00',0,'dsadsa','2012-05-12 00:00:00','2012-05-25',0);
/*!40000 ALTER TABLE `quality_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_details_attached`
--

DROP TABLE IF EXISTS `quality_details_attached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_details_attached` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_details_attached`
--

LOCK TABLES `quality_details_attached` WRITE;
/*!40000 ALTER TABLE `quality_details_attached` DISABLE KEYS */;
INSERT INTO `quality_details_attached` (`ID`, `details_id`, `file_id`) VALUES (1,16,93),(2,17,94);
/*!40000 ALTER TABLE `quality_details_attached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_notify`
--

DROP TABLE IF EXISTS `quality_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_notify` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `qualityId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_notify`
--

LOCK TABLES `quality_notify` WRITE;
/*!40000 ALTER TABLE `quality_notify` DISABLE KEYS */;
INSERT INTO `quality_notify` (`ID`, `qualityId`, `userId`) VALUES (1,21,9),(2,21,10),(3,21,11),(8,23,1),(9,23,2),(10,23,9),(11,23,3),(12,24,1),(13,24,2),(14,24,9),(15,24,3),(16,25,1),(17,25,2),(18,25,9),(19,25,3),(20,26,1),(21,26,2),(22,26,9),(23,26,3),(24,27,1),(25,27,2),(26,27,9),(27,27,3),(28,28,1),(29,28,2),(30,28,9),(31,28,3),(32,29,1),(33,29,2),(34,29,9),(35,29,3),(36,30,1),(37,30,2),(38,30,9),(39,30,10),(40,31,1),(41,31,2),(42,31,9),(43,31,10),(44,32,1),(45,32,2),(46,32,9),(47,32,10),(48,33,9),(49,35,9),(50,36,9),(51,1,9),(52,22,9);
/*!40000 ALTER TABLE `quality_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `projects` text NOT NULL,
  `tasks` text NOT NULL,
  `milestones` text NOT NULL,
  `messages` text NOT NULL,
  `files` text NOT NULL,
  `chat` text NOT NULL,
  `timetracker` text NOT NULL,
  `admin` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`ID`, `name`, `projects`, `tasks`, `milestones`, `messages`, `files`, `chat`, `timetracker`, `admin`) VALUES (1,'Admin','a:4:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;s:5:\"close\";i:1;}','a:4:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;s:5:\"close\";i:1;}','a:4:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;s:5:\"close\";i:1;}','a:4:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;s:5:\"close\";i:1;}','a:3:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;}','a:1:{s:3:\"add\";i:1;}','a:4:{s:3:\"add\";i:1;s:4:\"edit\";i:1;s:3:\"del\";i:1;s:4:\"read\";i:1;}','a:1:{s:3:\"add\";i:1;}');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_assigned`
--

DROP TABLE IF EXISTS `roles_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_assigned` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL,
  `role` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_assigned`
--

LOCK TABLES `roles_assigned` WRITE;
/*!40000 ALTER TABLE `roles_assigned` DISABLE KEYS */;
INSERT INTO `roles_assigned` (`ID`, `user`, `role`) VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1);
/*!40000 ALTER TABLE `roles_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(10) NOT NULL,
  `project` int(10) NOT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `available_count` int(11) NOT NULL DEFAULT '0',
  `tag_id` varchar(255) NOT NULL,
  `description` text,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` (`ID`, `name`, `status`, `project`, `total_count`, `available_count`, `tag_id`, `description`, `valid`) VALUES (1,'213',0,1,12,10,'123','ddsffds',1);
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_request`
--

DROP TABLE IF EXISTS `sample_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_request` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `approved` tinyint(4) NOT NULL DEFAULT '0',
  `submit_time` datetime NOT NULL,
  `sample` int(10) NOT NULL,
  `project` int(10) NOT NULL,
  `submit_by` int(10) NOT NULL,
  `approved_by` int(10) DEFAULT NULL,
  `approved_time` datetime DEFAULT NULL,
  `submitter_comments` text,
  `approver_comments` text,
  `isretrieve` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_request`
--

LOCK TABLES `sample_request` WRITE;
/*!40000 ALTER TABLE `sample_request` DISABLE KEYS */;
INSERT INTO `sample_request` (`ID`, `approved`, `submit_time`, `sample`, `project`, `submit_by`, `approved_by`, `approved_time`, `submitter_comments`, `approver_comments`, `isretrieve`) VALUES (1,26,'2012-04-07 14:59:48',1,1,9,2,'2012-04-07 15:33:39','saddad','dsfdsfsd',1),(2,26,'2012-04-07 15:04:36',1,1,9,2,'2012-04-07 15:33:45','123','fdsfsdfs',1),(3,25,'2012-04-07 15:04:52',1,1,9,NULL,NULL,'434324',NULL,1),(4,25,'2012-04-07 15:09:23',1,1,10,NULL,NULL,'sddsfds',NULL,1),(5,25,'2012-04-07 15:11:12',1,1,10,NULL,NULL,'dfsfdsfdsfaaaa',NULL,1),(6,25,'2012-04-07 15:11:29',1,1,10,NULL,NULL,'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',NULL,1),(7,25,'2012-04-07 15:12:12',1,1,10,NULL,NULL,'errrrrrrrrrrrrrr',NULL,1),(8,25,'2012-04-07 15:13:40',1,1,10,NULL,NULL,'erw',NULL,1),(9,25,'2012-04-07 15:23:39',1,1,10,NULL,NULL,'fdsfds',NULL,1),(10,25,'2012-04-07 15:24:46',1,1,10,NULL,NULL,'fdsfds',NULL,1),(11,25,'2012-04-07 15:25:48',1,1,10,NULL,NULL,'dsadsa',NULL,1),(12,25,'2012-04-07 15:27:19',1,1,10,NULL,NULL,'dsadsa',NULL,1),(13,27,'2012-04-07 15:27:40',1,1,10,2,'2012-06-27 19:50:41','cxzcxz','',1),(14,25,'2012-04-07 15:28:29',1,1,10,NULL,NULL,'dsadsa',NULL,1),(15,25,'2012-04-07 15:30:07',1,1,10,NULL,NULL,'dasdas',NULL,1),(16,25,'2012-04-07 15:30:34',1,1,10,NULL,NULL,'dsadsada',NULL,1),(17,25,'2012-04-07 15:32:32',1,1,10,NULL,NULL,'ssdssa',NULL,1),(18,25,'2012-04-07 15:32:52',1,1,10,NULL,NULL,'dsadsa',NULL,1);
/*!40000 ALTER TABLE `sample_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `ID` tinyint(1) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `subtitle` varchar(255) DEFAULT '',
  `locale` varchar(6) DEFAULT '',
  `timezone` varchar(60) DEFAULT NULL,
  `dateformat` varchar(50) DEFAULT NULL,
  `template` varchar(255) DEFAULT '',
  `mailnotify` tinyint(1) DEFAULT '1',
  `mailfrom` varchar(255) DEFAULT NULL,
  `mailfromname` varchar(255) DEFAULT NULL,
  `mailmethod` varchar(5) DEFAULT NULL,
  `mailhost` varchar(255) DEFAULT NULL,
  `mailuser` varchar(255) DEFAULT NULL,
  `mailpass` varchar(255) DEFAULT NULL,
  `rssuser` varchar(255) DEFAULT NULL,
  `rsspass` varchar(255) DEFAULT NULL,
  KEY `ID` (`ID`),
  KEY `name` (`name`),
  KEY `subtitle` (`subtitle`),
  KEY `locale` (`locale`),
  KEY `template` (`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`ID`, `name`, `subtitle`, `locale`, `timezone`, `dateformat`, `template`, `mailnotify`, `mailfrom`, `mailfromname`, `mailmethod`, `mailhost`, `mailuser`, `mailpass`, `rssuser`, `rsspass`) VALUES (0,'Collabtive','Projectmanagement','en','Asia/Shanghai','Y-m-d','standard',1,'hxs_handle@126.com','Handle-Yahoo','smtp','smtp.126.com','hxs_handle@126.com','Iamallgood123','','');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL DEFAULT 'project' COMMENT 'project,phase,deliverable,task',
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`ID`, `type`, `value`) VALUES (1,'ECN','need_approve'),(2,'ECN','approved'),(3,'ECN','rejected'),(4,'project','need_approve'),(5,'project','approved'),(6,'project','rejected'),(7,'project','padding'),(8,'project','closed'),(9,'project','planning'),(10,'project','in_progress'),(11,'deliverable','not_start'),(12,'deliverable','in_progress'),(13,'deliverable','closed'),(14,'order','submitted'),(15,'order','in_progress'),(16,'order','accepted'),(17,'order','rejected'),(18,'phase','not_start'),(19,'phase','in_progress'),(20,'phase','completed'),(21,'phase','closed'),(22,'quality','not_start'),(23,'quality','in_progress'),(24,'quality','closed'),(25,'sampleRequest','need_approve'),(26,'sampleRequest','approved'),(27,'sampleRequest','rejected'),(28,'task','not_start'),(29,'task','in_progress'),(30,'task','completed'),(31,'task','closed'),(32,'purchase','submitted'),(33,'purchase','in_progress'),(34,'purchase','accepted'),(35,'purchase','rejected'),(36,'order1','in_progress'),(37,'order1','delayed'),(38,'order1','late'),(39,'order1','canceled'),(40,'order1','on_hold');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_attachement`
--

DROP TABLE IF EXISTS `task_attachement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_attachement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_attachement`
--

LOCK TABLES `task_attachement` WRITE;
/*!40000 ALTER TABLE `task_attachement` DISABLE KEYS */;
INSERT INTO `task_attachement` (`ID`, `taskId`, `fileId`) VALUES (1,3,34),(2,3,35),(3,3,36),(4,3,37),(5,2,38),(6,14,0),(7,14,0),(8,2,0),(9,2,99),(10,2,102),(11,2,107),(12,2,108),(13,2,109),(14,2,110),(15,2,111),(16,2,112),(17,2,113),(18,14,119),(19,16,121),(20,16,122),(21,16,123),(22,16,124);
/*!40000 ALTER TABLE `task_attachement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_distribution`
--

DROP TABLE IF EXISTS `task_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_distribution` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_distribution`
--

LOCK TABLES `task_distribution` WRITE;
/*!40000 ALTER TABLE `task_distribution` DISABLE KEYS */;
INSERT INTO `task_distribution` (`ID`, `task_id`, `user_id`) VALUES (3,14,6),(4,14,4),(5,13,9),(6,13,10),(7,13,11),(20,10,9),(21,10,10),(22,10,11),(23,15,9),(24,15,10),(25,15,11),(59,16,9),(60,16,10),(61,16,11);
/*!40000 ALTER TABLE `task_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasklist`
--

DROP TABLE IF EXISTS `tasklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasklist` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `project` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `start` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `access` tinyint(4) NOT NULL DEFAULT '0',
  `milestone` int(10) NOT NULL DEFAULT '0',
  `deliverable_item` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `status` (`status`),
  KEY `milestone` (`milestone`),
  KEY `deliverable_item` (`deliverable_item`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasklist`
--

LOCK TABLES `tasklist` WRITE;
/*!40000 ALTER TABLE `tasklist` DISABLE KEYS */;
INSERT INTO `tasklist` (`ID`, `project`, `name`, `desc`, `start`, `status`, `access`, `milestone`, `deliverable_item`) VALUES (1,7,'tasklist','','1336485223',1,0,0,0),(2,8,'tasklist','','1338726662',1,0,0,0),(3,9,'tasklist','','1338726858',1,0,0,0),(4,10,'tasklist','','1338731287',1,0,0,0),(5,11,'tasklist','','1344347604',1,0,0,0);
/*!40000 ALTER TABLE `tasklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `liste` int(10) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL,
  `status_update` longtext,
  `project` int(10) NOT NULL DEFAULT '0',
  `phase` int(10) NOT NULL,
  `deliverable_item` int(10) DEFAULT NULL,
  `parent` int(10) DEFAULT NULL,
  `location` varchar(255) NOT NULL DEFAULT 'Shanghai',
  `valid` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `liste` (`liste`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`ID`, `start_date`, `end_date`, `title`, `text`, `liste`, `status`, `status_update`, `project`, `phase`, `deliverable_item`, `parent`, `location`, `valid`) VALUES (1,'2012-05-09 00:00:00','2012-05-26 00:00:00','dffsfds','sd',1,30,'dsdadsa<br />dsadsa<br />',7,10,5,-1,'dsadsa',1),(2,'2012-05-09 00:00:00','2012-05-30 00:00:00','sds','fdsfds',1,29,'fdsfasfdasd<br />sdfsfds',7,10,5,-1,'d',1),(3,'2012-05-09 00:00:00','2012-06-30 00:00:00','fdsfds','dsadsa',1,29,NULL,7,10,5,-1,'ds',1),(4,'2012-06-04 00:00:00','2012-07-07 00:00:00','sss','sss',3,29,NULL,9,12,7,-1,'ss',1),(5,'2012-06-04 00:00:00','2012-07-09 00:00:00','sss1','sss',3,29,NULL,9,12,7,4,'sds',1),(6,'2012-06-21 00:00:00','2012-06-22 00:00:00','A  & B','dsad',1,29,'',7,10,5,-1,'sss',1),(7,'2012-08-09 00:00:00','2012-08-09 00:00:00','dddd','dsadsasd',1,29,'dsadsasd',7,10,5,-1,'sss',1),(8,'2012-08-09 00:00:00','2012-08-09 00:00:00','dsa','asdasad',1,29,'',7,10,5,-1,'dsadsa',1),(9,'2012-08-09 00:00:00','2012-08-09 00:00:00','sss','sasa',1,29,'sds',7,10,5,-1,'sda',1),(10,'2012-08-12 00:00:00','2012-08-12 00:00:00','dddddddd','dfs<br />dsa<br />dsadsa<br />',1,29,'asdsadsa<br />dsadsadsa<br />',7,10,5,-1,'sada',1),(11,'2012-08-12 00:00:00','2012-08-12 00:00:00','sda','sdadsa',1,29,NULL,7,10,5,-1,'sa',1),(12,'2012-08-12 00:00:00','2012-08-12 00:00:00','ss','as',1,29,NULL,7,10,5,-1,'sa',1),(13,'2012-08-12 00:00:00','2012-08-12 00:00:00','ss','as<br />dsadsa<br />',1,29,'dsadsa<br />dsadsa',7,10,5,-1,'sa',1),(14,'2012-08-12 00:00:00','2012-08-12 00:00:00','dsa','dsa',1,29,'dsadsa',7,10,5,-1,'dsa',1),(15,'2012-08-23 00:00:00','2012-08-23 00:00:00','aaaaaaaaaaaa','ssssssssss',1,29,NULL,7,10,5,-1,'as',1),(16,'2012-08-23 00:00:00','2012-08-23 00:00:00','sssssssssssssssssss','vasddsa',1,29,'çš„æ’’çš„æ’’<br /><br /> --sys_admin 2012-09-04 21:22:42<br />Something wrong<br /> --sys_admin 2012-09-04 21:23:41<br/> added new file Screenshot1_6411.mkm  --sys_admin2012-09-04 22:12:13<br/> added new file Screenshot1_15650.mkm<br/>  --sys_admin 2012-09-04 22:13:31',7,10,5,-1,'sad',1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_assigned`
--

DROP TABLE IF EXISTS `tasks_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_assigned` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `task` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user` (`user`),
  KEY `task` (`task`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_assigned`
--

LOCK TABLES `tasks_assigned` WRITE;
/*!40000 ALTER TABLE `tasks_assigned` DISABLE KEYS */;
INSERT INTO `tasks_assigned` (`ID`, `user`, `task`) VALUES (27,2,1),(26,11,1),(29,2,2),(28,11,2),(11,3,3),(10,11,3),(8,2,4),(9,2,5),(35,11,6),(34,9,6),(39,9,7),(83,9,8),(81,11,9),(80,10,9),(79,9,9),(122,2,10),(121,11,10),(120,10,10),(119,9,10),(88,9,11),(89,10,11),(90,11,11),(91,9,12),(92,10,12),(93,11,12),(102,11,13),(101,10,13),(100,9,13),(99,9,14),(123,9,15),(124,10,15),(125,11,15),(161,11,16),(160,10,16),(159,9,16);
/*!40000 ALTER TABLE `tasks_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetracker`
--

DROP TABLE IF EXISTS `timetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetracker` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL DEFAULT '0',
  `project` int(10) NOT NULL DEFAULT '0',
  `task` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `started` varchar(255) NOT NULL DEFAULT '',
  `ended` varchar(255) NOT NULL DEFAULT '',
  `hours` float NOT NULL DEFAULT '0',
  `pstatus` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user` (`user`,`project`,`task`),
  KEY `started` (`started`),
  KEY `ended` (`ended`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetracker`
--

LOCK TABLES `timetracker` WRITE;
/*!40000 ALTER TABLE `timetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `full_name` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `role_type` int(2) DEFAULT '0',
  `email` varchar(255) DEFAULT '',
  `tel1` varchar(255) DEFAULT NULL,
  `tel2` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT '',
  `company` varchar(255) DEFAULT '',
  `lastlogin` varchar(255) DEFAULT '',
  `zip` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `adress` varchar(255) DEFAULT '',
  `adress2` varchar(255) DEFAULT '',
  `state` varchar(255) DEFAULT '',
  `country` varchar(255) DEFAULT '',
  `tags` varchar(255) DEFAULT '',
  `locale` varchar(6) DEFAULT '',
  `avatar` varchar(255) DEFAULT '',
  `rate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`),
  KEY `pass` (`pass`),
  KEY `locale` (`locale`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `name`, `full_name`, `title`, `role_type`, `email`, `tel1`, `tel2`, `pass`, `company`, `lastlogin`, `zip`, `gender`, `url`, `adress`, `adress2`, `state`, `country`, `tags`, `locale`, `avatar`, `rate`) VALUES (1,'sys_admin','','',1,'0','','','7656e41a7c6e7d9ea19740e1326389f0bff91441','','1349607447','','','','','','en','','0','','','0'),(2,'mgrLv1','Manage Lv1','1@126.com',3,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1350191848','','','','','','en','','','','','0'),(3,'mgrLv2','Supplier LV2','2@126.com',4,'21@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1348750038','','','','','','en','','','','','0'),(4,'customerLv1','Customer Lv 1','1@126.com',6,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1349609890','','','','','','en','','','','','0'),(5,'customerLv2','Customer Lv 2','1@126.com',7,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1349609103','','','','','','en','','','','','0'),(6,'supplierLv1','Supplier LV1','1@126.com',8,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1349608567','','','','','','en','','','','','0'),(7,'supplierLv2','Supplier LV2','1@126.com',9,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1349608525','','','','','','en','','','','','0'),(8,'admin','Administrator','1@126.com',2,'1@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','','','','','','','en','','','','','0'),(9,'emp1','Employee 1','1@126.com',5,'handle.huang@outlook.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1349609453','','','','','','en','','','','','0'),(10,'emp2','Employee 2','1@126.com',5,'hxs_handle@126.com','','','37fa265330ad83eaa879efb1e2db6380896cf639','','1347199564','','','','','','en','','','','','0'),(11,'emp3','Employee 3','1@126.com',5,'handle.huang@outlook.com','','12231','37fa265330ad83eaa879efb1e2db6380896cf639','','1343133148','','m','sssssssss','','','','','','en','','0');
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

-- Dump completed on 2012-10-14 13:17:29
