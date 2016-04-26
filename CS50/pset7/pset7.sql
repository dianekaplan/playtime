-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: pset7
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  `share_price` decimal(65,4) unsigned NOT NULL,
  `transaction_type` int(1) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,17,'GOOG',3,750.0000,1,'2016-04-03 22:27:13'),(2,17,'ABC',0,0.0000,0,'2016-04-03 22:28:08'),(3,17,'ABC',2,87.0000,1,'2016-04-03 22:29:43'),(4,17,'DIA',48,178.0000,0,'2016-04-03 22:29:50'),(5,18,'CAF',20,17.0000,1,'2016-04-03 23:34:49'),(6,18,'GOOG',5,749.9100,1,'2016-04-03 23:46:49'),(7,18,'DIA',6,177.7200,1,'2016-04-03 23:46:55'),(8,18,'CAF',20,17.0400,0,'2016-04-03 23:47:02'),(9,17,'GOOG',15,749.9100,1,'2016-04-04 00:38:08'),(10,17,'ABC',2,86.5100,0,'2016-04-04 00:46:25'),(11,17,'DIA',5,177.7200,1,'2016-04-04 00:46:33'),(12,17,'',0,0.0000,3,'2016-04-04 00:46:41'),(13,17,'GOOG',18,749.9100,0,'2016-04-04 00:56:31'),(14,17,'MAC',8,79.8000,1,'2016-04-04 00:56:38'),(15,17,'FB',6,116.0600,1,'2016-04-04 00:56:46'),(16,17,'CAN',10,0.0000,1,'2016-04-04 00:56:57'),(17,17,'APP',7,0.1123,1,'2016-04-04 00:57:12'),(18,17,'FB',6,116.0600,0,'2016-04-04 00:58:36'),(19,17,'FB',5,116.0600,1,'2016-04-04 00:59:56'),(20,17,'FB',5,116.0600,2,'2016-04-04 01:00:03'),(21,17,'',0,0.0000,3,'2016-04-04 01:00:25'),(22,17,'GOOG',10,749.9100,1,'2016-04-04 01:01:20');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`symbol`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (1,1,'ABC',5),(6,1,'CCE',10),(7,1,'GOOG',10),(8,2,'ABC',10),(9,2,'CCE',10),(10,3,'GOOG',10),(11,3,'ABC',10),(12,3,'CCE',10),(13,2,'GOOG',10),(14,4,'ABC',10),(15,4,'CCE',10),(16,4,'GOOG',10),(17,5,'ABC',10),(18,5,'CCE',10),(19,5,'GOOG',10),(20,6,'ABC',10),(21,6,'CCE',10),(22,6,'GOOG',10),(23,7,'ABC',10),(24,7,'CCE',10),(25,7,'GOOG',10),(26,8,'ABC',10),(27,8,'CCE',10),(28,8,'GOOG',10),(29,9,'ABC',10),(30,9,'CCE',10),(31,9,'GOOG',10),(32,10,'ABC',10),(33,10,'CCE',10),(34,10,'GOOG',10),(35,11,'ABC',10),(36,11,'CCE',10),(37,11,'GOOG',10),(48,18,'GOOG',5),(49,18,'DIA',6),(51,17,'DIA',5),(52,17,'MAC',8),(54,17,'CAN',10),(55,17,'APP',7),(57,17,'GOOG',10);
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_types`
--

DROP TABLE IF EXISTS `transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_types`
--

LOCK TABLES `transaction_types` WRITE;
/*!40000 ALTER TABLE `transaction_types` DISABLE KEYS */;
INSERT INTO `transaction_types` VALUES (1,'BUY'),(2,'SELL'),(3,'DEPOSIT');
/*!40000 ALTER TABLE `transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` decimal(65,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'andi','$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS',10000.0000),(2,'caesar','$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa',10000.0000),(3,'eli','$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW',10000.0000),(4,'hdan','$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G',10000.0000),(5,'jason','$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe',10000.0000),(6,'john','$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy',10000.0000),(7,'levatich','$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK',10000.0000),(8,'rob','$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2',10000.0000),(9,'skroob','$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK',10000.0000),(10,'zamyla','$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e',10000.0000),(11,'dk1','$2y$10$Mu2SAo5X1ZgGm3o/pQZSCuhm3r8eR/L806ud2Ukhd3iXpEV1c7Ccq',10000.0000),(13,'dk2','$2y$10$P4YNaP.iPJTwHz7VPxVnmee4q2rYtmBrCHw5Al1kxxwuZy5t4qDE2',10000.0000),(14,'dk3','$2y$10$ccNduyR2sXHGGXQOuw06weFTU.StYnN4X86M6/lTaIGzip7ZHhn4W',10000.0000),(15,'dk4','$2y$10$s4QCO8vu6Khncx45GjLMWudJx5cMSyLxhT4EbCo1.k5RFHPdVaWJm',10000.0000),(16,'dk5','$2y$10$lj7Stv7vYuhPu80cPnHJteZpCRQPjswZbL9HKQviblsmUcc/N7wdG',10000.0000),(17,'dianekaplan','$2y$10$VkbzEZma/oZFdxxQoyE2J.WgjwCQUEhNmTc0U6cFgThy8POQJFf.S',11262.0139),(18,'dknew','$2y$10$TN5M13BwnhX5.5Q2s675Wu/ZOs0IYMWSEMOVilIpGh8E6VlDjoxpO',5184.1300);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-04  1:17:22
