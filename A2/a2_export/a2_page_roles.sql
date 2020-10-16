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
-- Table structure for table `page_roles`
--

DROP TABLE IF EXISTS `page_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_role_enum_idx` (`role`),
  KEY `page_role_page_id_idx` (`page_id`),
  KEY `page_role_developer_id_idx` (`developer_id`),
  CONSTRAINT `page_role_developer_id` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_enum` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON UPDATE CASCADE,
  CONSTRAINT `page_role_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_roles`
--

LOCK TABLES `page_roles` WRITE;
/*!40000 ALTER TABLE `page_roles` DISABLE KEYS */;
INSERT INTO `page_roles` VALUES (31,'editor',123,12),(32,'reviewer',123,23),(33,'writer',123,34),(34,'editor',234,23),(35,'reviewer',234,34),(36,'writer',234,12),(37,'editor',345,34),(38,'reviewer',345,12),(39,'writer',345,23),(40,'editor',456,12),(41,'reviewer',456,23),(42,'writer',456,34),(43,'editor',567,23),(44,'reviewer',567,34),(45,'writer',567,12);
/*!40000 ALTER TABLE `page_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_roles_AFTER_INSERT` AFTER INSERT ON `page_roles` FOR EACH ROW CASE NEW.role
	WHEN 'owner' THEN
		INSERT INTO page_priviledges VALUES (null, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'read', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'delete', NEW.page_id, NEW.developer_id);
	WHEN 'admin' THEN
		INSERT INTO page_priviledges VALUES (null, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'read', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'update', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'delete', NEW.page_id, NEW.developer_id);
	WHEN 'writer' THEN
		INSERT INTO page_priviledges VALUES (null, 'create', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'read', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'update', NEW.page_id, NEW.developer_id);
	WHEN 'editor' THEN
		INSERT INTO page_priviledges VALUES (null, 'read', NEW.page_id, NEW.developer_id);
        INSERT INTO page_priviledges VALUES (null, 'update', NEW.page_id, NEW.developer_id);
	WHEN 'reviewer' THEN
		INSERT INTO page_priviledges VALUES (null, 'read', NEW.page_id, NEW.developer_id);
END CASE */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 13:07:07
