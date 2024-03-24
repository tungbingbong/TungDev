-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: e-banking
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `current_account`
--

DROP TABLE IF EXISTS `current_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `current_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acc_no` varchar(255) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `current_interest_id` bigint(20) DEFAULT NULL,
  `current_user_id` bigint(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9vaaftej2i3scvq70lswlrbcd` (`current_interest_id`),
  KEY `FK_849smf9wajwwxxqsr4v131aub` (`current_user_id`),
  CONSTRAINT `FK_849smf9wajwwxxqsr4v131aub` FOREIGN KEY (`current_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_9vaaftej2i3scvq70lswlrbcd` FOREIGN KEY (`current_interest_id`) REFERENCES `interest_rate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_account`
--

LOCK TABLES `current_account` WRITE;
/*!40000 ALTER TABLE `current_account` DISABLE KEYS */;
INSERT INTO `current_account` VALUES (1,'134537869537',6544000,'4451527205185425','2021-03-21 14:54:57',NULL,2,2607,1),(2,'579404981171',4200000,'8868849926942529','2021-03-21 14:54:57',NULL,12,2809,1);
/*!40000 ALTER TABLE `current_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 10:11:15
