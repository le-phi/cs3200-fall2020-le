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
-- Table structure for table `website_priviledges`
--

DROP TABLE IF EXISTS `website_priviledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_priviledges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `priviledge` varchar(45) DEFAULT NULL,
  `website_id` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priviledge_enum_idx` (`priviledge`),
  KEY `website_id_idx` (`website_id`),
  KEY `developer_id_idx` (`developer_id`),
  CONSTRAINT `website_priviledge_developer_id` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_enum` FOREIGN KEY (`priviledge`) REFERENCES `priviledges` (`priviledge`) ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_website_id` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_priviledges`
--

LOCK TABLES `website_priviledges` WRITE;
/*!40000 ALTER TABLE `website_priviledges` DISABLE KEYS */;
INSERT INTO `website_priviledges` VALUES (1,'create',123,12),(2,'read',123,12),(3,'update',123,12),(4,'delete',123,12),(5,'read',123,23),(6,'update',123,23),(7,'create',123,34),(8,'read',123,34),(9,'update',123,34),(10,'delete',123,34),(11,'create',234,23),(12,'read',234,23),(13,'update',234,23),(14,'delete',234,23),(15,'read',234,34),(16,'update',234,34),(17,'create',234,12),(18,'read',234,12),(19,'update',234,12),(20,'delete',234,12),(21,'create',345,34),(22,'read',345,34),(23,'update',345,34),(24,'delete',345,34),(25,'read',345,12),(26,'update',345,12),(27,'create',345,23),(28,'read',345,23),(29,'update',345,23),(30,'delete',345,23),(31,'create',456,12),(32,'read',456,12),(33,'update',456,12),(34,'delete',456,12),(35,'read',456,23),(36,'update',456,23),(37,'create',456,34),(38,'read',456,34),(39,'update',456,34),(40,'delete',456,34),(41,'create',567,23),(42,'read',567,23),(43,'update',567,23),(44,'delete',567,23),(45,'read',567,34),(46,'update',567,34),(47,'create',567,12),(48,'read',567,12),(49,'update',567,12),(50,'delete',567,12),(51,'create',678,34),(52,'read',678,34),(53,'update',678,34),(54,'delete',678,34),(55,'read',678,12),(56,'update',678,12),(57,'create',678,23),(58,'read',678,23),(59,'update',678,23),(60,'delete',678,23);
/*!40000 ALTER TABLE `website_priviledges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 13:07:07
