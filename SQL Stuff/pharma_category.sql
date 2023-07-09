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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` varchar(255) NOT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('','ykpk'),('1','cjyu'),('1107086','gjhl'),('114727','pvsg'),('115476','rvrr'),('13','mkyc'),('148546117','rxai'),('171920087','foap'),('18177792','xpzk'),('18291','pfhn'),('18768','vsez'),('2','hpvf'),('211','tgsv'),('214491192','eyim'),('22915','pyvo'),('2344384','fdpr'),('2429377','fgah'),('2599','dmra'),('281','crgp'),('29658','lwmz'),('3','znss'),('30','dctx'),('30471633','fmef'),('343','tjwd'),('345613437','yuiy'),('3595131','wmth'),('36017883','vqkg'),('389895794','kiok'),('39890015','ywgq'),('3993081','zatg'),('41384','bghs'),('42569','xxzm'),('4440292','xzzl'),('455101371','jrgz'),('472278292','qzhe'),('476039','bvne'),('47914','outn'),('496','uwhc'),('5','oyds'),('52','dpgo'),('52788188','vakq'),('54','jxit'),('540076','demp'),('550441399','xuiv'),('55938130','dica'),('56280309','exhy'),('56784514','utvm'),('5825','wjxz'),('583665','zbkl'),('598013','jmeg'),('6','ajoi'),('601607198','tpyf'),('60457488','wgok'),('60529','akhs'),('6105','kfao'),('623','mbaq'),('63656430','ured'),('6381','irlu'),('64','yjah'),('647231446','dxar'),('7','eiac'),('7006','khxd'),('70440435','zzgv'),('729931646','cyct'),('74308','mrvg'),('747835111','ernv'),('7568','rsto'),('76','crzy'),('78','yagb'),('79','ltmn'),('8','pwng'),('8049','sohg'),('81','hicb'),('817','urrf'),('825036093','jiqr'),('83','mvcs'),('839','jtqm'),('84','skll'),('8474892','tdva'),('8603','qxyf'),('862912573','fjhw'),('8660','tiry'),('8740205','iytb'),('875377','rsul'),('8899','xfyw'),('89','nnph'),('89697638','xtay'),('9044','vkkp'),('92887','vpxv'),('934','ojrd'),('93783783','iusd'),('94145','rvng'),('947','vopj'),('961324545','bhov'),('98','nonj'),('9833','rxpk'),('987','wzgt'),('989407596','nkoe'),('992060660','tuut'),('9986471','tnlr');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17 21:09:29
