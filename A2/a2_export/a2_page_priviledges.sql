-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a2
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `page_priviledges`
--

DROP TABLE IF EXISTS `page_priviledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_priviledges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priviledge` varchar(45) DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_priviledge_enum_idx` (`priviledge`),
  KEY `page_priviledge_page_id_idx` (`page_id`),
  KEY `page_priviledge_developer_id_idx` (`developer_id`),
  CONSTRAINT `page_priviledge_developer_id` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_priviledge_enum` FOREIGN KEY (`priviledge`) REFERENCES `priviledges` (`priviledge`) ON UPDATE CASCADE,
  CONSTRAINT `page_priviledge_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_priviledges`
--

LOCK TABLES `page_priviledges` WRITE;
/*!40000 ALTER TABLE `page_priviledges` DISABLE KEYS */;
INSERT INTO `page_priviledges` VALUES (46,'read',123,12),(47,'update',123,12),(48,'read',123,23),(49,'create',123,34),(50,'read',123,34),(51,'update',123,34),(52,'read',234,23),(53,'update',234,23),(54,'read',234,34),(55,'create',234,12),(56,'read',234,12),(57,'update',234,12),(58,'read',345,34),(59,'update',345,34),(60,'read',345,12),(61,'create',345,23),(62,'read',345,23),(63,'update',345,23),(64,'read',456,12),(65,'update',456,12),(66,'read',456,23),(67,'create',456,34),(68,'read',456,34),(69,'update',456,34),(70,'read',567,23),(71,'update',567,23),(72,'read',567,34),(73,'create',567,12),(74,'read',567,12),(75,'update',567,12);
/*!40000 ALTER TABLE `page_priviledges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 13:07:08
