-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: yiirest
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `post_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_user_created_by` (`created_by`),
  KEY `FK_comment_post_post_id` (`post_id`),
  CONSTRAINT `FK_comment_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FK_comment_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'koment 1','lorem ipsum koment 1',4,NULL,NULL,1),(2,'koment 1','lorem ipsum koment 1',4,NULL,NULL,1),(3,'koment 1','lorem ipsum koment 1',2,1587224122,1587224122,1),(4,'koment 1-2','lorem ipsum koment 1-2',2,1587224444,1587224444,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1587199897),('m130524_201442_init',1587199900),('m190124_110200_add_verification_token_column_to_user_table',1587199901),('m200418_090630_create_post_table',1587201443),('m200418_091055_create_comment_table',1587201736),('m200421_141150_add_access_token_column_to_user_table',1587478908);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_user_created_by` (`created_by`),
  CONSTRAINT `FK_post_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,'Demo post','Lorem ipsum',NULL,NULL,1),(3,'Demo post','Lorem ipsum',NULL,NULL,1),(4,'Demo post','Lorem ipsum',1587217059,1587217059,1),(6,'test title','Lorem ipsum',1587217495,1587217495,1),(7,'Post Ketujuh','Lorem ipsum',1587218526,1587481520,1),(8,'test title','Lorem ipsum',1587218559,1587218559,1),(9,'test title','Lorem ipsum',1587222447,1587222447,1),(10,'test title','Lorem ipsum',1587222449,1587222449,1),(11,'test title','Lorem ipsum',1587222450,1587222450,1),(12,'test title','Lorem ipsum',1587222452,1587222452,1),(13,'test title','Lorem ipsum',1587222453,1587222453,1),(14,'test title','Lorem ipsum',1587222454,1587222454,1),(15,'test title','Lorem ipsum',1587222456,1587222456,1),(16,'test title','Lorem ipsum',1587222457,1587222457,1),(17,'test title','Lorem ipsum',1587222459,1587222459,1),(18,'test title','Lorem ipsum',1587222460,1587222460,1),(19,'test title','Lorem ipsum',1587222462,1587222462,1),(20,'test title','Lorem ipsum',1587222464,1587222464,1),(21,'test title','Lorem ipsum',1587222465,1587222465,1),(22,'test title','Lorem ipsum',1587222467,1587222467,1),(23,'test title','Lorem ipsum',1587222469,1587222469,1),(24,'test title','Lorem ipsum',1587462601,1587462601,1),(25,'Post 25','Lorem ipsum oleh admin',1587479186,1587481066,1),(26,'Post 26','Lorem ipsum oleh webmaster',1587479235,1587480162,4);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','DJdj_g-jJQyuGC2R9OS7Fs2gYxpgeZn1','admin','$2y$13$wfN7tR/kGYh.cwIW6EncQOJHYDHVEqp.pFz3wfknreWjjv4ffQRI.',NULL,'sibeduls@yahoo.com',10,1587201843,1587201843,'ibqt3WSaziHwiyJyuuphBvihFsrlPdSi_1587201843'),(2,'system','Fr3RD9HNOE7391AD37RU8k05Hh0W58o-','system','$2y$13$JyzCJ4YX0NCVbrB4gdh0tOq.mfpMx/sY5VKnj8hpSNjOX24ZrGyJy',NULL,'si_beduls@yahoo.com',10,1587201929,1587201929,'BtA47eznEH7QCFxz8GJYcNorGf9MyzJI_1587201929'),(3,'jimmi','PoNe56OCelSoCCrAqfUzHuJBznSlKpKw','jimmi','$2y$13$4JrtEA8cmihbmXCwTlnHM./rqVhLtm3STq5Dh3fSyEYmsip5/qZ6G',NULL,'jimmy@ethaner.com',10,1587463020,1587463142,'PRdg1Mmnbjyz7_wzFEpTx8Kcob8xdBkl_1587463020'),(4,'webmaster','SSDM-3sd82CkY8SNRerPx2K3p_S5QLof','webmaster','$2y$13$3OVwTTCnED77JwmdDlqr2e9cdwhRq1C/xrC/xKiePx24EdoaaaRV6',NULL,'webmaster@example.com',10,1587478958,1587478972,'xxex2nLr94vpvzkl_bDZoJMJzK5X1gaP_1587478958');
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

-- Dump completed on 2020-04-21 22:16:40
