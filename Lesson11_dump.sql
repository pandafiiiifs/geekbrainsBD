-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watchlog_catalogs` AFTER INSERT ON `catalogs` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `created_at` datetime NOT NULL,
  `table_name` varchar(45) NOT NULL,
  `str_id` bigint NOT NULL,
  `name_value` varchar(45) NOT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('2020-09-18 14:33:07','users',7,'Кнехт'),('2020-09-18 14:33:12','users',8,'Liu Kangh'),('2020-09-18 14:33:12','users',9,'Sub-Zero'),('2020-09-18 14:33:12','users',10,'Scorpion'),('2020-09-18 14:33:12','users',11,'Raiden'),('2020-09-18 14:34:12','products',11,'PATRIOT PSD34G13332'),('2020-09-18 14:34:12','products',12,'DARK ROCK PRO 4 (BK022)'),('2020-09-18 14:34:12','products',13,'Коврик');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `prods_desc`
--

DROP TABLE IF EXISTS `prods_desc`;
/*!50001 DROP VIEW IF EXISTS `prods_desc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `prods_desc` (
  `prod_id` tinyint NOT NULL,
  `prod_name` tinyint NOT NULL,
  `cat_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `desription` text COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-09-15 08:53:20','2020-09-15 08:53:20'),(8,NULL,NULL,5000.00,2,'2020-09-15 09:08:03','2020-09-15 09:08:03'),(9,'GeForce GTX 1080',NULL,15000.00,12,'2020-09-15 09:08:08','2020-09-15 09:08:08'),(10,'GeForce GTX 1080','Мощная видеокарта',15000.00,12,'2020-09-15 09:08:11','2020-09-15 09:08:11'),(11,'PATRIOT PSD34G13332','Оперативная память',3000.00,13,'2020-09-18 14:34:12','2020-09-18 14:34:12'),(12,'DARK ROCK PRO 4 (BK022)','Куллера',500.00,14,'2020-09-18 14:34:12','2020-09-18 14:34:12'),(13,'Коврик','Коврик для мыши',150.00,15,'2020-09-18 14:34:12','2020-09-18 14:34:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watchlog_products` AFTER INSERT ON `products` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2020-09-15 08:51:08','2020-09-15 08:51:08'),(2,'Наталья','1984-11-12','2020-09-15 08:51:08','2020-09-15 08:51:08'),(3,'Александр','1985-05-20','2020-09-15 08:51:08','2020-09-15 08:51:08'),(4,'Сергей','1988-02-14','2020-09-15 08:51:08','2020-09-15 08:51:08'),(5,'Иван','1998-01-12','2020-09-15 08:51:08','2020-09-15 08:51:08'),(6,'Мария','1992-08-29','2020-09-15 08:51:08','2020-09-15 08:51:08'),(7,'Кнехт','1900-01-01','2020-09-18 14:33:07','2020-09-18 14:33:07'),(8,'Liu Kangh','1900-01-01','2020-09-18 14:33:12','2020-09-18 14:33:12'),(9,'Sub-Zero','1103-01-01','2020-09-18 14:33:12','2020-09-18 14:33:12'),(10,'Scorpion','1103-01-01','2020-09-18 14:33:12','2020-09-18 14:33:12'),(11,'Raiden','0000-00-00','2020-09-18 14:33:12','2020-09-18 14:33:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watchlog_users` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'shop'
--
/*!50003 DROP PROCEDURE IF EXISTS `hello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hello`()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Доброе утро';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Добрый день';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Добрый вечер';
	ELSE
		SELECT 'Доброй ночи';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `prods_desc`
--

/*!50001 DROP TABLE IF EXISTS `prods_desc`*/;
/*!50001 DROP VIEW IF EXISTS `prods_desc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prods_desc` (`prod_id`,`prod_name`,`cat_name`) AS select `p`.`id` AS `prod_id`,`p`.`name` AS `name`,`cat`.`name` AS `name` from (`products` `p` left join `catalogs` `cat` on((`p`.`catalog_id` = `cat`.`id`))) */;
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

-- Dump completed on 2020-09-18 14:35:50
