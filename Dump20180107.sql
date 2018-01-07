-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ea
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `account_role_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,10000,1),(2,10001,1),(3,10002,2),(4,10003,3),(5,10004,2);
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `passwords` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (10000,'chow','123456'),(10001,'alber','654321'),(10002,'choose','123654'),(10003,'jun','654123'),(10004,'anna','123321');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `yearName` int(11) NOT NULL,
  `weekName` int(11) NOT NULL,
  `dayofMonday` date DEFAULT NULL,
  `dayofTuesday` date DEFAULT NULL,
  `dayofWednesday` date DEFAULT NULL,
  `dayofThursday` date DEFAULT NULL,
  `dayofFriday` date DEFAULT NULL,
  `dayofSaturday` date DEFAULT NULL,
  `dayofSunday` date DEFAULT NULL,
  PRIMARY KEY (`yearName`,`weekName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (2017,1,'2017-08-21','2017-08-22','2017-08-23','2017-08-24','2017-08-25','2017-08-26','2017-08-27'),(2017,2,'2017-08-28','2017-08-29','2017-08-30','2017-08-31','2017-09-01','2017-09-02','2017-09-03'),(2017,3,'2017-09-04','2017-09-05','2017-09-06','2017-09-07','2017-09-08','2017-09-09','2017-09-10'),(2017,4,'2017-09-11','2017-09-12','2017-09-13','2017-09-14','2017-09-15','2017-09-16','2017-09-17'),(2017,5,'2017-09-18','2017-09-19','2017-09-20','2017-09-21','2017-09-22','2017-09-23','2017-09-24'),(2017,6,'2017-09-25','2017-09-26','2017-09-27','2017-09-28','2017-09-29','2017-09-30','2017-10-01'),(2017,7,'2017-10-02','2017-10-03','2017-10-04','2017-10-05','2017-10-06','2017-10-07','2017-10-08'),(2017,8,'2017-10-09','2017-10-10','2017-10-11','2017-10-12','2017-10-13','2017-10-14','2017-10-15'),(2017,9,'2017-10-16','2017-10-17','2017-10-18','2017-10-19','2017-10-20','2017-10-21','2017-10-22'),(2017,10,'2017-10-23','2017-10-24','2017-10-25','2017-10-26','2017-10-27','2017-10-28','2017-10-29'),(2017,11,'2017-10-30','2017-10-31','2017-11-01','2017-11-02','2017-11-03','2017-11-04','2017-11-05'),(2017,12,'2017-11-06','2017-11-07','2017-11-08','2017-11-09','2017-11-10','2017-11-11','2017-11-12'),(2017,13,'2017-11-13','2017-11-14','2017-11-15','2017-11-16','2017-11-17','2017-11-18','2017-11-19'),(2017,14,'2017-11-20','2017-11-21','2017-11-22','2017-11-23','2017-11-24','2017-11-25','2017-11-26'),(2017,15,'2017-11-27','2017-11-28','2017-11-29','2017-11-30','2017-12-01','2017-12-02','2017-12-03'),(2017,16,'2017-12-04','2017-12-05','2017-12-06','2017-12-07','2017-12-08','2017-12-09','2017-12-10'),(2017,17,'2017-12-11','2017-12-12','2017-12-13','2017-12-14','2017-12-15','2017-12-16','2017-12-17'),(2017,18,'2017-12-18','2017-12-19','2017-12-20','2017-12-21','2017-12-22','2017-12-23','2017-12-24'),(2017,19,'2017-12-25','2017-12-26','2017-12-27','2017-12-28','2017-12-29','2017-12-30','2017-12-31'),(2018,20,'2018-01-01','2018-01-02','2018-01-03','2018-01-04','2018-01-05','2018-01-06','2018-01-07'),(2018,21,'2018-01-08','2018-01-09','2018-01-10','2018-01-11','2018-01-12','2018-01-13','2018-01-14'),(2018,22,'2018-01-15','2018-01-16','2018-01-17','2018-01-18','2018-01-19','2018-01-20','2018-01-21');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `classname` varchar(45) NOT NULL,
  `exist` int(11) DEFAULT '0',
  `superior_limit` int(11) DEFAULT '120',
  `credit` int(11) DEFAULT '2',
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (10000,10002,'高等数学',2,120,2,NULL),(10001,10004,'大学英语',1,120,2,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_classroom`
--

DROP TABLE IF EXISTS `class_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_classroom` (
  `class_date` date NOT NULL,
  `class_order` int(11) NOT NULL,
  `classroom` varchar(20) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`class_date`,`class_order`,`classroom`),
  KEY `class_order` (`class_order`),
  KEY `classroom` (`classroom`),
  KEY `class_classroom_ibfk_3` (`class_id`),
  CONSTRAINT `class_classroom_ibfk_1` FOREIGN KEY (`class_order`) REFERENCES `classorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_classroom_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_classroom_ibfk_4` FOREIGN KEY (`classroom`) REFERENCES `classroom` (`roomname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_classroom`
--

LOCK TABLES `class_classroom` WRITE;
/*!40000 ALTER TABLE `class_classroom` DISABLE KEYS */;
INSERT INTO `class_classroom` VALUES ('2017-08-21',1,'博知101',10000),('2017-08-23',3,'博知102',10000),('2017-08-27',5,'博知103',10000),('2017-08-29',1,'博知101',10000);
/*!40000 ALTER TABLE `class_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classorder`
--

DROP TABLE IF EXISTS `classorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classorder` (
  `id` int(11) NOT NULL,
  `classtime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classorder`
--

LOCK TABLES `classorder` WRITE;
/*!40000 ALTER TABLE `classorder` DISABLE KEYS */;
INSERT INTO `classorder` VALUES (1,'8:00~8:50'),(2,'9:00~9:50'),(3,'10:10~11:00'),(4,'11:00~11:50'),(5,'13:30~14:20'),(6,'14:30~15:20'),(7,'15:30~16:20'),(8,'16:30~17:20'),(9,'18:30~19:20'),(10,'19:30~20:20');
/*!40000 ALTER TABLE `classorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomname` (`roomname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (1,'博知101',NULL),(2,'博知102',NULL),(3,'博知103',NULL);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance` (
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_method` enum('0','1') DEFAULT '0',
  `daily_achievement` int(11) DEFAULT NULL,
  `test_scores` int(11) DEFAULT NULL,
  `final_scores` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (10000,10000,'0',30,5,5,2),(10000,10001,'0',NULL,NULL,NULL,NULL),(10001,10000,'0',30,90,90,4),(10001,10001,'0',5,5,5,3);
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'student','this is a student.'),(2,'teacher','this is a teacher'),(3,'manager','this is a manager');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `account_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `sex` enum('M','F','N') DEFAULT 'M',
  `birth` date NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `eamil` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT 'default',
  `information` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (10000,'周','小良','M','1994-10-25','13923323333','z@qdu.com','man1.jpg',''),(10002,'派','大星','M','1995-01-05','13123323366','paipai@qdu.com','man1.jpg',NULL),(10003,'孙','晴','M','1975-06-05','+8207566123423','sun@niit.com','man1.jpg',''),(10004,'安','娜','F','1979-11-21','13666666667','anna@qdu.com','woman1.jpg','');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `logtime` timestamp NULL DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ea'
--

--
-- Dumping routines for database 'ea'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-07 21:36:38
