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
-- Table structure for table `website_roles`
--

DROP TABLE IF EXISTS `website_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `website_id` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_enum_idx` (`role`),
  KEY `role_website_id_idx` (`website_id`),
  KEY `role_developer_id_idx` (`developer_id`),
  CONSTRAINT `role_developer_id` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_enum` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON UPDATE CASCADE,
  CONSTRAINT `role_website_id` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_roles`
--

LOCK TABLES `website_roles` WRITE;
/*!40000 ALTER TABLE `website_roles` DISABLE KEYS */;
INSERT INTO `website_roles` VALUES (19,'owner',123,12),(20,'editor',123,23),(21,'admin',123,34),(22,'owner',234,23),(23,'editor',234,34),(24,'admin',234,12),(25,'owner',345,34),(26,'editor',345,12),(27,'admin',345,23),(28,'owner',456,12),(29,'editor',456,23),(30,'admin',456,34),(31,'owner',567,23),(32,'editor',567,34),(33,'admin',567,12),(34,'owner',678,34),(35,'editor',678,12),(36,'admin',678,23);
/*!40000 ALTER TABLE `website_roles` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_roles_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW CASE NEW.role
	WHEN 'owner' THEN
		INSERT INTO website_priviledges VALUES (null, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'delete', NEW.website_id, NEW.developer_id);
	WHEN 'admin' THEN
		INSERT INTO website_priviledges VALUES (null, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'delete', NEW.website_id, NEW.developer_id);
	WHEN 'writer' THEN
		INSERT INTO website_priviledges VALUES (null, 'create', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
	WHEN 'editor' THEN
		INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
        INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
	WHEN 'reviewer' THEN
		INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
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
