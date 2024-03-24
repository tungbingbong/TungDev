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
-- Table structure for table `saving_account`
--

DROP TABLE IF EXISTS `saving_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `saving_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `closeDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `initialAmount` int(11) DEFAULT NULL,
  `openDate` datetime DEFAULT NULL,
  `tenor` varchar(255) DEFAULT NULL,
  `saving_interest_id` bigint(20) DEFAULT NULL,
  `saving_user_id` bigint(20) DEFAULT NULL,
  `accNo` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nsefqefcpb77bjxr2rvfyl0vq` (`saving_interest_id`),
  KEY `FK_k4vsc86toluqpgie5y4npaawm` (`saving_user_id`),
  CONSTRAINT `FK_k4vsc86toluqpgie5y4npaawm` FOREIGN KEY (`saving_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_nsefqefcpb77bjxr2rvfyl0vq` FOREIGN KEY (`saving_interest_id`) REFERENCES `interest_rate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving_account`
--

LOCK TABLES `saving_account` WRITE;
/*!40000 ALTER TABLE `saving_account` DISABLE KEYS */;
INSERT INTO `saving_account` VALUES (8,'2021-09-21 20:38:02','',20000000,'2021-03-21 20:38:02','6',NULL,2,'89443904041091',2607,1),(11,'2022-03-21 20:40:36','',23000000,'2021-03-21 20:40:36','12',NULL,2,'63767502905152',1234,1),(17,'2021-04-10 08:01:05','test',20000000,'2021-04-09 22:02:38','6',NULL,2,'45077217513776',1234,0),(19,'2022-04-09 22:10:31','testtttt',23000000,'2021-04-09 22:10:31','12',NULL,2,'67482073047169',1234,0),(20,'2022-04-10 01:28:59','test',20000000,'2021-04-10 01:28:59','12',NULL,2,'75832764210365',123456,0);
/*!40000 ALTER TABLE `saving_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 10:11:16
