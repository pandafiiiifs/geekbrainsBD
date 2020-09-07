-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: Urok7
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `label` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('Moscow','Москва'),('Omsk','Омск'),('Saint Petersburg','Санкт-Петербург'),('Tomsk','Томск'),('Ufa','Уфа');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `otkuda` varchar(50) NOT NULL,
  `kuda` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_otkuda_label` (`otkuda`),
  KEY `fk_kuda_label` (`kuda`),
  CONSTRAINT `fk_kuda_label` FOREIGN KEY (`kuda`) REFERENCES `cities` (`label`),
  CONSTRAINT `fk_otkuda_label` FOREIGN KEY (`otkuda`) REFERENCES `cities` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'Moscow','Saint Petersburg'),(2,'Saint Petersburg','Omsk'),(3,'Omsk','Tomsk'),(4,'Tomsk','Ufa'),(5,'Ufa','Moscow');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,6,'2017-06-06 19:45:58','2016-03-08 20:38:08'),(2,8,3,'2016-05-24 00:44:22','2017-12-23 03:16:26'),(3,5,2,'2020-01-25 18:29:01','2018-05-27 23:23:03'),(4,0,8,'2011-05-12 05:30:48','2014-03-10 07:39:57'),(5,3,5,'2015-11-24 20:06:35','2011-09-03 08:34:41'),(6,3,7,'2017-06-03 12:47:43','2011-05-08 20:05:10'),(7,8,1,'2011-12-29 09:57:10','2019-06-08 22:53:23'),(8,3,9,'2017-08-09 12:32:22','2011-01-04 03:21:56'),(9,2,9,'2014-05-31 07:58:55','2019-10-07 00:10:38'),(10,2,6,'2018-05-08 16:55:39','2015-11-09 02:04:02'),(11,0,5,'2011-04-17 04:15:35','2017-10-29 18:44:26'),(12,6,5,'2015-09-06 04:18:18','2018-10-09 18:41:03'),(13,3,2,'2014-11-12 12:31:18','2013-04-30 19:21:48'),(14,2,0,'2014-08-02 09:47:32','2017-10-04 12:09:19'),(15,1,7,'2018-10-06 21:31:03','2012-01-26 03:30:32'),(16,9,5,'2011-09-21 21:23:42','2020-02-21 18:57:05'),(17,8,3,'2011-12-11 08:29:59','2012-03-24 00:10:51'),(18,6,0,'2013-04-06 09:29:57','2019-03-08 20:38:49'),(19,0,8,'2014-02-05 00:59:12','2013-07-26 22:07:35'),(20,0,2,'2016-09-17 02:39:33','2010-11-24 08:21:13'),(21,1,5,'2019-07-12 17:38:51','2019-06-06 08:18:40'),(22,9,2,'2017-08-07 05:59:19','2017-07-12 19:59:47'),(23,8,4,'2012-08-15 17:36:12','2014-08-03 03:03:17'),(24,7,4,'2019-04-30 17:03:34','2019-08-03 09:20:55'),(25,7,6,'2019-06-02 07:00:32','2017-06-12 04:16:43'),(26,2,9,'2013-05-19 06:54:13','2019-02-08 13:11:19'),(27,5,2,'2018-03-01 22:42:35','2017-06-27 15:45:30'),(28,8,8,'2016-07-23 13:50:14','2016-06-23 06:19:52'),(29,1,8,'2019-05-06 21:52:02','2017-09-22 21:01:48'),(30,0,3,'2011-09-18 22:49:03','2011-06-22 07:35:16'),(31,1,8,'2019-06-16 12:51:46','2012-12-05 18:53:26'),(32,0,7,'2012-07-17 20:08:22','2013-01-04 01:32:50'),(33,0,5,'2018-07-28 13:31:31','2016-04-28 19:02:55'),(34,4,0,'2013-08-07 02:49:20','2014-10-16 13:42:29'),(35,9,4,'2018-08-26 01:50:27','2015-11-05 06:05:41'),(36,1,5,'2012-09-26 16:02:59','2010-12-30 22:34:31'),(37,7,9,'2015-09-12 20:29:45','2017-11-06 16:02:31'),(38,3,5,'2014-02-10 14:28:15','2011-03-04 02:59:07'),(39,1,9,'2014-02-13 12:36:58','2013-10-29 03:49:22'),(40,0,2,'2017-05-25 18:07:06','2016-07-23 03:04:07'),(41,4,7,'2011-05-02 12:23:02','2019-01-17 22:16:51'),(42,3,8,'2020-05-23 06:03:18','2014-01-17 11:05:34'),(43,4,4,'2019-07-25 18:47:55','2014-05-13 08:36:25'),(44,8,5,'2014-10-31 04:48:36','2012-07-20 03:31:26'),(45,2,2,'2015-10-09 06:36:33','2013-07-11 18:19:09'),(46,3,0,'2020-03-22 02:10:08','2014-01-28 22:21:28'),(47,3,6,'2012-06-03 06:46:17','2020-03-08 09:04:55'),(48,3,5,'2011-01-05 08:35:20','2018-11-25 18:01:15'),(49,1,7,'2018-08-07 09:50:48','2018-06-12 09:09:20'),(50,2,5,'2018-05-25 02:13:38','2012-06-10 07:29:00'),(51,9,1,'2012-09-03 17:44:20','2018-12-22 15:48:44'),(52,1,4,'2020-07-23 07:27:47','2012-04-23 20:01:48'),(53,2,6,'2018-10-03 23:36:25','2012-12-05 06:44:36'),(54,5,9,'2014-03-18 00:19:15','2013-06-18 15:01:58'),(55,0,9,'2018-01-12 22:11:12','2020-01-16 14:45:43'),(56,9,2,'2018-05-27 05:44:02','2012-03-03 04:13:04'),(57,3,5,'2015-07-31 10:14:59','2016-09-23 10:04:24'),(58,4,7,'2016-09-04 12:23:52','2017-03-17 23:12:30'),(59,7,2,'2013-11-10 04:19:17','2010-10-05 20:45:12'),(60,6,1,'2016-12-24 03:33:56','2014-05-17 08:30:04'),(61,4,4,'2020-03-29 15:15:37','2013-09-12 16:30:58'),(62,7,0,'2017-03-03 06:32:02','2011-09-30 23:09:54'),(63,8,7,'2014-07-26 04:41:03','2011-11-12 07:55:25'),(64,0,8,'2011-10-08 19:47:37','2013-08-26 05:01:48'),(65,5,1,'2014-06-21 09:07:49','2019-05-06 04:14:57'),(66,8,6,'2012-01-29 20:37:27','2012-02-14 23:42:20'),(67,9,5,'2015-09-24 03:13:46','2018-09-07 02:28:45'),(68,7,7,'2018-10-04 03:07:00','2014-08-18 05:35:34'),(69,1,3,'2016-06-23 01:48:55','2014-12-25 18:58:17'),(70,4,8,'2011-11-30 22:53:44','2010-12-09 03:27:37'),(71,2,1,'2010-10-03 21:47:24','2013-10-03 13:06:13'),(72,3,6,'2016-01-31 19:28:20','2014-10-14 04:10:53'),(73,3,7,'2020-05-04 14:45:08','2013-10-20 00:31:38'),(74,4,4,'2013-12-09 03:36:00','2012-03-21 04:58:32'),(75,3,1,'2019-09-10 13:20:58','2012-08-02 09:17:51'),(76,6,2,'2017-02-27 17:23:02','2014-03-05 10:05:39'),(77,1,0,'2011-06-13 17:54:56','2019-08-07 23:28:59'),(78,4,2,'2015-10-26 00:26:40','2017-01-01 17:09:16'),(79,6,2,'2012-08-26 02:20:57','2018-12-26 06:17:21'),(80,6,5,'2017-01-18 13:21:54','2012-12-22 21:40:55'),(81,5,8,'2017-11-28 09:47:22','2016-06-06 14:49:04'),(82,8,1,'2017-12-29 05:37:37','2015-03-16 23:14:49'),(83,1,0,'2018-08-08 18:47:01','2017-09-16 03:35:59'),(84,0,1,'2020-04-23 18:10:19','2015-06-14 13:13:51'),(85,5,5,'2020-08-13 18:11:51','2015-08-23 19:50:46'),(86,1,5,'2013-10-20 00:30:32','2014-07-12 04:18:50'),(87,0,8,'2017-08-15 11:26:39','2015-10-10 20:00:55'),(88,3,7,'2013-12-28 03:22:09','2019-12-25 11:23:19'),(89,5,3,'2011-11-23 15:10:06','2019-07-14 05:18:02'),(90,2,5,'2012-10-07 04:01:36','2016-12-05 07:26:23'),(91,2,9,'2014-07-07 01:44:31','2014-10-20 16:28:15'),(92,5,6,'2019-09-21 22:36:16','2013-01-16 09:02:37'),(93,2,5,'2012-08-09 07:31:47','2018-07-13 11:27:41'),(94,6,6,'2013-09-17 22:53:15','2018-05-15 23:52:18'),(95,0,8,'2013-04-03 15:22:07','2011-12-30 01:46:26'),(96,6,8,'2014-10-05 06:33:57','2011-01-23 23:01:09'),(97,7,7,'2018-07-04 16:53:08','2014-09-22 22:52:40'),(98,5,8,'2012-03-18 04:44:46','2013-04-24 21:18:46'),(99,3,9,'2016-11-15 04:24:37','2015-12-30 22:58:05'),(100,1,8,'2020-02-20 16:53:06','2016-02-08 13:45:36'),(101,NULL,156,'2020-09-07 10:33:03','2020-09-07 10:33:03'),(102,1,NULL,'2020-09-07 10:33:50','2020-09-07 10:33:50'),(103,6,NULL,'2020-09-07 10:33:50','2020-09-07 10:33:50'),(104,9,NULL,'2020-09-07 10:33:50','2020-09-07 10:33:50'),(105,1,NULL,'2020-09-07 10:35:52','2020-09-07 10:35:52'),(106,2,NULL,'2020-09-07 10:35:52','2020-09-07 10:35:52'),(107,3,NULL,'2020-09-07 10:35:52','2020-09-07 10:35:52'),(108,6,NULL,'2020-09-07 10:35:52','2020-09-07 10:35:52'),(109,9,NULL,'2020-09-07 10:35:52','2020-09-07 10:35:52');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказов',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_order_product_id` (`product_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,1,'2020-09-07 10:36:08','2020-09-07 10:36:08'),(1,2,1,'2020-09-07 10:36:08','2020-09-07 10:36:08'),(2,1,1,'2020-09-07 10:36:27','2020-09-07 10:36:27'),(2,2,1,'2020-09-07 10:36:27','2020-09-07 10:36:27'),(4,1,1,'2020-09-07 10:36:41','2020-09-07 10:36:41'),(4,4,3,'2020-09-07 10:36:41','2020-09-07 10:36:41'),(4,5,2,'2020-09-07 10:36:41','2020-09-07 10:36:41');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-09-07 09:47:39','2020-09-07 09:47:39'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-09-07 09:47:39','2020-09-07 09:47:39');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrics`
--

DROP TABLE IF EXISTS `rubrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrics`
--

LOCK TABLES `rubrics` WRITE;
/*!40000 ALTER TABLE `rubrics` DISABLE KEYS */;
INSERT INTO `rubrics` VALUES (1,'Видеокарты'),(2,'Память');
/*!40000 ALTER TABLE `rubrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2020-09-07 09:47:31','2020-09-07 09:47:31'),(2,'Наталья','1984-11-12','2020-09-07 09:47:31','2020-09-07 09:47:31'),(3,'Александр','1985-05-20','2020-09-07 09:47:31','2020-09-07 09:47:31'),(4,'Сергей','1988-02-14','2020-09-07 09:47:31','2020-09-07 09:47:31'),(5,'Иван','1998-01-12','2020-09-07 09:47:31','2020-09-07 09:47:31'),(6,'Мария','1992-08-29','2020-09-07 09:47:31','2020-09-07 09:47:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Urok7'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-07 10:43:27
