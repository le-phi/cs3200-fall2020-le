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
-- Temporary view structure for view `developer_roles_and_privileges`
--

DROP TABLE IF EXISTS `developer_roles_and_privileges`;
/*!50001 DROP VIEW IF EXISTS `developer_roles_and_privileges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `developer_roles_and_privileges` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `username`,
 1 AS `email`,
 1 AS `website_name`,
 1 AS `visits`,
 1 AS `website_updated`,
 1 AS `website_role`,
 1 AS `website_priviledge`,
 1 AS `title`,
 1 AS `views`,
 1 AS `page_updated`,
 1 AS `page_role`,
 1 AS `page_priviledge`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `developer_roles_and_privileges`
--

/*!50001 DROP VIEW IF EXISTS `developer_roles_and_privileges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `developer_roles_and_privileges` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`p`.`username` AS `username`,`p`.`email` AS `email`,`w`.`name` AS `website_name`,`w`.`visits` AS `visits`,`w`.`updated` AS `website_updated`,`wr`.`role` AS `website_role`,`wp`.`priviledge` AS `website_priviledge`,`pg`.`title` AS `title`,`pg`.`views` AS `views`,`pg`.`updated` AS `page_updated`,`pr`.`role` AS `page_role`,`pp`.`priviledge` AS `page_priviledge` from (((((((`persons` `p` join `developers` `d` on((`p`.`id` = `d`.`id`))) join `website_roles` `wr` on((`d`.`id` = `wr`.`developer_id`))) join `website_priviledges` `wp` on((`d`.`id` = `wp`.`developer_id`))) join `websites` `w` on((`w`.`id` = `wr`.`website_id`))) join `page_roles` `pr` on((`d`.`id` = `pr`.`developer_id`))) join `page_priviledges` `pp` on((`d`.`id` = `pp`.`developer_id`))) join `pages` `pg` on((`w`.`id` = `pg`.`website_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 13:07:08
