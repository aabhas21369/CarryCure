CREATE DATABASE  IF NOT EXISTS `pharma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharma`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: pharma
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('a',3),('ab',7),('accusantium',3),('ad',7),('adipisci',5),('alias',9),('aliquid',1),('amet',6),('aperiam',6),('asperiores',0),('assumenda',7),('at',2),('atque',1),('aut',5),('autem',7),('beatae',9),('blanditiis',3),('consectetur',4),('consequatur',7),('consequuntur',3),('cum',8),('cupiditate',5),('delectus',9),('dignissimos',2),('distinctio',9),('dolor',8),('dolorem',6),('dolores',0),('ea',3),('eius',6),('enim',6),('eos',8),('esse',0),('est',3),('et',5),('eum',7),('eveniet',0),('ex',6),('facere',3),('fugiat',8),('id',9),('illo',1),('illum',1),('impedit',2),('in',6),('incidunt',1),('inventore',3),('ipsa',0),('iste',7),('laudantium',2),('magnam',5),('maxime',2),('minima',9),('molestiae',3),('mollitia',4),('necessitatibus',5),('neque',5),('nobis',8),('non',5),('occaecati',4),('odio',1),('officia',4),('omnis',8),('perferendis',4),('placeat',4),('porro',2),('possimus',5),('praesentium',5),('provident',1),('quam',0),('qui',1),('quia',1),('quibusdam',7),('quo',1),('quod',5),('quos',2),('ratione',0),('recusandae',9),('reiciendis',1),('rem',4),('repellat',8),('repellendus',7),('reprehenderit',5),('repudiandae',4),('rerum',5),('sapiente',8),('sed',6),('similique',4),('sit',7),('sunt',1),('tempora',8),('tempore',6),('tenetur',0),('totam',4),('ut',8),('vel',7),('velit',7),('veniam',6),('voluptas',6),('voluptatem',3);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17 21:09:30
