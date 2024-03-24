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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `current_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qe431raripfpqaufdpqvg8l5n` (`current_id`),
  KEY `user_id_idx` (`receiver_id`),
  CONSTRAINT `FK_qe431raripfpqaufdpqvg8l5n` FOREIGN KEY (`current_id`) REFERENCES `current_account` (`id`),
  CONSTRAINT `receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'10000','2021-03-21 14:54:57','','Deposit',1,1,2),(3,'20000','2021-03-21 15:44:50','this is withdraw','Withdraw',1,0,2),(6,'1000000','2021-04-10 16:29:10','LÆ°Æ¡ng','Deposit',1,0,2),(7,'1000000','2021-04-10 16:54:47','Buy Bed','Deposit',2,0,12),(8,'100000','2021-04-10 17:14:15','Test nho','Deposit',1,0,2),(9,'100000','2021-04-10 17:14:40','TEst giong ong dai nho','Deposit',2,0,12),(10,'100000','2021-04-10 17:18:12','test 1','Deposit',2,0,12),(11,'200000','2021-04-10 17:18:43','test 1 dai','Deposit',1,0,2),(12,'127000','2021-04-10 20:16:45','fill cho du','Deposit',1,0,2),(13,'12000','2021-04-10 20:53:58','test withdraw','Withdraw',1,1,2),(14,'6546000','2021-04-10 20:59:11','','Deposit',1,0,2),(15,'6545000','2021-04-10 20:59:29','','Withdraw',1,1,2),(16,'6547000','2021-04-10 20:59:42','','Withdraw',1,1,2),(17,'6545000','2021-04-10 20:59:52','','Deposit',1,0,2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 10:11:14
