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
-- Table structure for table `billing_details`
--

DROP TABLE IF EXISTS `billing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_details` (
  `billing_id` varchar(255) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `total_cost` varchar(255) DEFAULT NULL,
  `mode_of_payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `billing_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_details`
--

LOCK TABLES `billing_details` WRITE;
/*!40000 ALTER TABLE `billing_details` DISABLE KEYS */;
INSERT INTO `billing_details` VALUES ('','11803','2051428.4104284','wjat'),('1','76','165139547.67381','qcyg'),('137537912','3','749600.44713175','rshq'),('143','454','22468499.453706','ihhc'),('14947','6924','42051.769','ulyd'),('1496275','43218635','','lfwn'),('16132','8942','5045.908','sjfd'),('1691616','93708','4.213','eset'),('18118837','8','','xvlz'),('18821','7750','3314872.827','pnvd'),('19','8514','1298.650497217','balx'),('19639630','3962','3.0047','uedg'),('2','521','2.2748141','hyyw'),('210','95','0.0008275','jatb'),('214678221','9','','dyvl'),('223','11429538','25.395733764','fuam'),('22469','261','3.130312','tgpj'),('225493894','2','997879.51','zfsf'),('2446','30122','3.34','zzax'),('250','','166524070.998','tmwp'),('2565710','74547','1502889.27056','urcl'),('2682','5372452','44409.1731','iwya'),('2746','207987896','','agky'),('28','71236565','15005.3375','idcp'),('290715','96164289','','nefg'),('2968127','26','','njmx'),('3','82624003','896408487','rqec'),('3138','5047375','65.506','ucnb'),('316398630','1771007','60225794.105','knel'),('32','8459211','7479.019','cnrp'),('3237484','7033','2138.82193','wywv'),('334','136402','1508.632','vvuy'),('335747','3738','194.621898','ufii'),('3358','622934','39.763','uavn'),('339394','983914','','epzr'),('3635','258279','131103.0033572','qvgq'),('364','23730978','317.85','lsad'),('3663','29','812798.41816575','envk'),('375894130','2126','11.8','vltt'),('377427632','42526085','59455149.199041','jdjr'),('399','274044382','','fatw'),('399189','210239','3804.085','lwbb'),('4','2048765','1.102416','pion'),('43782930','373','396716326.31314','tqoi'),('44','36477','44811154.556447','opir'),('5','261840836','','htgx'),('50273','346','430949784.16277','ktsu'),('5191968','160940','20.556','kqgr'),('52620','368980','3.7679066','mjak'),('53955','8860525','97524766.675983','wjyp'),('54226','51382713','13.441','gzla'),('545383143','9873627','2261591.2184214','ytdr'),('555950782','5975340','0.8855616','naic'),('570','574','48.6876','ntre'),('581629','709','304200543.9','ksnn'),('582912','67647883','573508605.71773','ysoj'),('62','773089055','24990726.996','qcly'),('622','858944','3478.02','nbip'),('6259996','44537','656','mvzo'),('6345045','47933','5.9315105','khrx'),('634630557','69','444556.54142749','zdmk'),('6399926','171','304.022997987','rgeu'),('644','93','467214.878427','wmrp'),('6568373','5','783.4','grru'),('6625598','88562','208.58458','kcpk'),('66622032','73750356','40','dvzq'),('671','67','26670547.14104','dimi'),('68628','71456273','177.55','rfen'),('687198430','1','468.51','lnpk'),('691352','20519656','279808594','ksrg'),('6916321','482','8239.3','fjov'),('7','149727','49462.1054017','dlbt'),('703814590','43','582','ljvq'),('70409','7072576','3952067.8','hfrv'),('732037747','4376','37693283.22634','ztdv'),('74','28542','457391.3312','zbon'),('741549593','540835','5.457','borm'),('7544441','253642340','23948.595551801','kdad'),('77296040','46','854358.583','wprq'),('7765','60','1873110.0403','gldg'),('778461','76025','','vmgj'),('78199200','928788','85865711','sjnj'),('8','845853','2855.305','ptgu'),('80','84025','103.9656751','dmbd'),('803','15','107798.17262','cics'),('810962','7','61.813965687','sunr'),('83530731','5119','','bnmq'),('84','7322472','','qpwt'),('8421317','2862384','6510.433065','vozd'),('84359','99009','1739.8743','mait'),('86380536','3937','3060.7224','uegg'),('884261','21443536','2.99639414','wheh'),('9','18877','7492.1871277','sfam'),('90','470294','','quqz'),('904','259230','78093.977486883','euyh'),('911','622425','25391.0030024','soxx'),('9158','49664','5.864','rvvn'),('923','84291','213170.17038974','kxgb'),('954','1248839','','kozx'),('99887','56205894','2875764.01','kzrj');
/*!40000 ALTER TABLE `billing_details` ENABLE KEYS */;
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
