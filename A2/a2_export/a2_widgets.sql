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
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dtype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `css_class` varchar(45) DEFAULT NULL,
  `css_style` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `shareable` tinyint(1) DEFAULT NULL,
  `expandable` tinyint(1) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `size` int DEFAULT '2',
  `html` varchar(45) DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_type_enum_idx` (`dtype`),
  KEY `widget_page_id_idx` (`page_id`),
  CONSTRAINT `widget_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `widget_type_enum` FOREIGN KEY (`dtype`) REFERENCES `widget_types` (`widget_type`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (123,'heading','head123',NULL,NULL,NULL,NULL,'Welcome',0,NULL,NULL,NULL,NULL,2,NULL,123),(234,'html','post234',NULL,NULL,NULL,NULL,'<p>Lorem</p>',0,NULL,NULL,NULL,NULL,2,NULL,234),(345,'heading','head345',NULL,NULL,NULL,NULL,'Hi',1,NULL,NULL,NULL,NULL,2,NULL,345),(456,'html','intro456',NULL,NULL,NULL,NULL,'<h1>Hi</h1>',2,NULL,NULL,NULL,NULL,2,NULL,345),(567,'image','image345',50,100,NULL,NULL,NULL,3,'/img/567.png',NULL,NULL,NULL,2,NULL,345),(678,'youtube','video456',400,300,NULL,NULL,NULL,0,'https://youtu.be/h67VX51QXiQ',NULL,NULL,NULL,2,NULL,456);
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
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
