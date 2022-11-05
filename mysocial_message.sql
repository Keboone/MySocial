-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mysocial
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `from` varchar(40) NOT NULL,
  `to` varchar(40) DEFAULT NULL,
  `messageText` varchar(1000) NOT NULL,
  `conversation_id` int NOT NULL,
  PRIMARY KEY (`messageId`,`conversation_id`),
  KEY `fk_message_conversation1_idx` (`conversation_id`),
  CONSTRAINT `fk_message_conversation1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`conversationId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'James','Harry','Hi!',1),(2,'Harry','James','Hello!',1),(6,'James','Harry','Whats up?',1),(8,'James','Harry','Halo?? Are you there?',1),(17,'James','Richard','Hi are you going to Harry tonight?',2),(18,'James',NULL,'How you doing right here?',3),(19,'Richard',NULL,'Good thanks!',3),(20,'James',NULL,'And you Harry?',3),(21,'Harry',NULL,'Pretty well :D',3),(22,'John',NULL,'Im fine too!',3),(24,'James',NULL,'Thats good, see you tomorrow!',3),(27,'James','','Yeah',3),(28,'James','Harry','hej',3),(29,'James','Harry','HELLO',1),(30,'James','John','dadada',3),(31,'James','Harry','SGSGS\r\n',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 18:36:33
