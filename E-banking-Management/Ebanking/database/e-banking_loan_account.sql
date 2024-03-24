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
-- Table structure for table `loan_account`
--

DROP TABLE IF EXISTS `loan_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loan_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `close_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `remain_amount` varchar(255) DEFAULT NULL,
  `tenor` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `loan_interest_id` bigint(20) DEFAULT NULL,
  `loan_user_id` bigint(20) DEFAULT NULL,
  `accNo` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5n62op80dvrubhjbvkq3xb9hh` (`loan_interest_id`),
  KEY `FK_7xs6kmc7qtiaeat6fccgaojr5` (`loan_user_id`),
  CONSTRAINT `FK_5n62op80dvrubhjbvkq3xb9hh` FOREIGN KEY (`loan_interest_id`) REFERENCES `interest_rate` (`id`),
  CONSTRAINT `FK_7xs6kmc7qtiaeat6fccgaojr5` FOREIGN KEY (`loan_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_account`
--

LOCK TABLES `loan_account` WRITE;
/*!40000 ALTER TABLE `loan_account` DISABLE KEYS */;
INSERT INTO `loan_account` VALUES (4,'2021-09-21 20:54:10','','2021-03-21 20:54:10','12000000','6','12000000',1,2,'10951344983907',1234,1),(5,'2022-03-21 20:54:31','','2021-03-21 20:54:31','20000000','12','20000000',NULL,2,'82302451262038',3872,1),(6,'2022-03-21 21:36:28','','2021-03-21 21:36:28','15000000','12','15000000',NULL,2,'15716233150494',1256,2),(8,'2021-10-10 08:57:28','test','2021-04-10 08:57:28','1000000','6','1000000',NULL,2,'52445845806084',1234,0),(10,'2021-10-10 09:31:10','test','2021-04-10 09:31:10','12000000','6','12000000',NULL,2,'10095072954777',1234,1),(11,'2021-10-10 09:40:08','test','2021-04-10 09:40:08','12000000','6','12000000',NULL,2,'66107217070785',1234,0);
/*!40000 ALTER TABLE `loan_account` ENABLE KEYS */;
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
