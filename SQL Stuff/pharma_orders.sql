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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `total_cost` float DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cart` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `cart` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('','180','aperiam',4,'550 Raynor Ferry\nDaxstad, VT 94412-0555',1289920),('1','2859322','cupiditate',0,'01851 Fredy Meadows\nNew Cletaside, MO 16650-4790',3334.39),('11429538','26677905','consequuntur',8,'1658 Ziemann Lodge\nJordynton, OK 58732-7255',73765500),('11803','184285743','asperiores',0,'917 Hamill Well Suite 705\nFeeneyborough, TX 84856',658706),('1248839','4867640','illum',1,'578 Austin Mills Apt. 648\nSouth Jimmie, HI 08028',10154.5),('136402','54141047','ipsa',1,'39285 Lenore Island\nFritschland, NE 57548',56.3943),('149727','33236684','dolor',9,'2046 Swaniawski Bypass\nJayceeville, KY 07787-2240',4215.35),('15','81','ratione',5,'0693 Smitham Point\nLake Vivienne, MN 42008',491),('160940','12938786','ad',5,'8265 Veum Courts Suite 655\nSouth Trentonside, NJ 10194',11443),('171','18507','assumenda',6,'665 Schultz Lodge Apt. 010\nNew Tianafort, CT 03217',3210810),('1771007','74711649','praesentium',4,'0303 Claud Islands Apt. 775\nWest Kaileeborough, MO 57099',4033210),('18877','553263934','magnam',0,'3331 Kertzmann Summit Apt. 108\nRodriguezmouth, NH 54865',644729000),('2','355975970','ea',2,'125 Karlie Square\nSimeonland, FL 53198-2726',1841740),('2048765','5335','inventore',9,'47775 Amari Parkway\nPort Brando, ND 86891-8005',4333970),('20519656','89900','tempora',2,'6267 Hiram Curve\nEast Gertrude, OK 44224',2.45185),('207987896','2086435','autem',5,'75983 Schneider Junction\nZboncakville, MS 03536',1704930),('210239','','a',9,'2022 Brekke Roads\nWardshire, MT 19655',5932250),('2126','51','in',7,'2548 Harber Branch\nEast Janick, MN 08809-6578',13341.2),('21443536','776','qui',6,'8270 Breitenberg Walks\nWardfurt, SC 34717-7869',556281000),('23730978','8514','rerum',8,'249 Balistreri Lights Apt. 257\nNorth Lupe, NV 08275-9621',340),('253642340','122','accusantium',3,'03168 Wilburn Valley Apt. 925\nTillmanton, AZ 37177-4583',780.09),('258279','802790679','quo',3,'8264 Koelpin Square\nPort Arielmouth, NV 67365-0395',451771),('259230','844490110','repudiandae',0,'272 Jodie Mews Suite 562\nSouth Marlinville, NJ 11438-0181',568365000),('26','82','rem',8,'7296 Viola Canyon Suite 993\nNew Christian, CO 36930-0331',47.5598),('261','262682','consequatur',0,'15365 Domenica Courts\nNorth Elva, NJ 15931',5),('261840836','83178','repellat',2,'8763 Jovani Squares Suite 117\nNew Emmettport, CA 12540',0.29),('274044382','715','perferendis',5,'288 Kutch Spur\nWuckertberg, LA 86250',1721),('28542','478312','id',7,'0269 Kulas Expressway Apt. 916\nPort Ken, CO 39774-5360',437176000),('2862384','5','impedit',9,'9772 Baumbach Place Suite 034\nEwellburgh, WA 72507',322.789),('29','155','aliquid',7,'7351 Wyman Village\nHickleburgh, ND 14617',24.3),('3','1435','alias',0,'77721 Eldred Circle Suite 093\nNorth Frida, MO 16329',192218),('30122','83701','repellendus',5,'89502 Rutherford Vista Apt. 876\nLake Bethelville, AR 98682-2766',4.0709),('346','7250','placeat',9,'0194 Rath Stream Suite 102\nLake Unique, IN 09724',0),('36477','72634','porro',2,'11362 Ortiz Throughway Apt. 544\nWatersborough, LA 44251-1176',43.4313),('368980','804402','quod',4,'125 Kristina Turnpike Apt. 279\nGrantland, LA 78849-4071',5.91038),('373','81592','recusandae',9,'40689 Carroll Plain Suite 575\nRosendomouth, HI 85988',6784410),('3738','90','tenetur',8,'57486 Schowalter Crest\nBalistreriview, MD 80347',120.623),('3937','97989','velit',5,'498 O\'Hara Cove\nPort Quentinchester, MD 71066-2570',0.159167),('3962','2391197','consectetur',5,'4541 Cronin Trace Apt. 848\nBernierfurt, WA 35788',151689),('42526085','381016450','enim',7,'5010 Corkery Ports Suite 251\nEast Jaqueline, MA 99656-8897',461281),('43','5228','incidunt',9,'928 Elton Manor Apt. 704\nJessyfurt, AL 83737-6201',0),('43218635','64','mollitia',5,'617 Ross Prairie\nEast Karley, DC 60084',0),('4376','5519090','laudantium',0,'867 Willms Falls\nSouth Tryciaborough, IA 86352-4432',14153.9),('44537','1','ab',9,'050 Beatty Mountains Apt. 365\nPort Kirk, CO 77726',131979000),('454','7','officia',7,'75857 Marques Alley Suite 555\nNew Dejuan, GA 13769-8316',9091450),('46','3','delectus',4,'150 Roberts Rue Suite 798\nSouth Florencio, NC 25920',37668.2),('470294','98040','veniam',0,'40693 Crystel Hollow Apt. 924\nUniqueside, AZ 86263-3240',2568990),('47933','869','sed',1,'6006 O\'Reilly Court Apt. 514\nJamisonborough, WI 65749',0),('482','34796','dolores',7,'798 Abshire Row Apt. 200\nNaderport, CT 75129',0),('49664','3478138','dolorem',9,'8481 Audie Forges\nAudreanneborough, CO 33049-8136',36284.1),('5','80479','quos',3,'4243 Kadin Stravenue Apt. 574\nVerdahaven, IL 37230',19.5733),('5047375','842','reprehenderit',5,'1009 Maximo Viaduct\nHolliehaven, TN 49350-2219',133099000),('5119','307024372','dignissimos',3,'15006 Fritsch Stravenue Suite 442\nMertzmouth, IN 99216-7616',1373030),('51382713','4506','facere',0,'97541 Hayes Green Apt. 271\nKesslerfurt, NE 04953',7.7),('521','87329110','similique',2,'74957 Jerde Rest\nNorth Minaton, FL 20947-6729',10.2511),('5372452','4187','eum',0,'3501 Isabelle Isle Apt. 884\nNorth Lon, NH 92058',1434170),('540835','6','minima',6,'260 Thelma Lakes Apt. 314\nDamarisfurt, KY 97744',97271.6),('56205894','77','quam',2,'408 Flatley Skyway\nNorth Meredith, ND 73836-3546',1967610),('574','852800','sapiente',1,'2745 Anderson Village\nVandervortborough, ND 44699-7608',649.297),('5975340','2191','beatae',5,'30632 Murazik Walks\nNew Arnoberg, KY 91160-0457',1889.3),('60','9371','totam',4,'13935 Huels Mission Suite 967\nHerbertland, IN 99878-3086',0),('622425','3175203','distinctio',6,'0930 Cormier Shoal\nFriesenstad, AK 17041-9002',0),('622934','67326','nobis',8,'24081 Werner Groves Apt. 760\nSouth Leonie, MO 96497-3909',6.1938),('67','2','aut',7,'43454 Lilyan Prairie\nHalvorsonfort, FL 59405-8219',273.98),('67647883','3988','est',5,'382 Noemi Drive Suite 654\nOrtizview, CT 59874-0309',71456800),('69','17940539','amet',8,'41121 Greg Lights\nPfannerstillborough, LA 09444-6039',14386),('6924','802','quibusdam',1,'86532 Turner Common\nAbshireberg, ND 71055',451171),('7','547684890','iste',4,'32845 Leatha Lodge\nWest Pedroton, UT 44472',332.356),('7033','1932','at',6,'2709 Mercedes Heights Suite 343\nOdieville, CA 12438-2463',75.5026),('7072576','3768','eius',8,'452 Lucy Streets Apt. 101\nNorth Owenport, KY 13639',293.714),('709','4357','eveniet',4,'6335 Kessler Plain\nLake Cornelius, NV 35221-6423',459.551),('71236565','699','odio',6,'57535 Myriam Fork Suite 725\nNew Santos, VA 55997',4.2),('71456273','7149641','omnis',2,'54394 Volkman Pines Apt. 008\nGunnerfurt, MN 48776',18370300),('7322472','272679971','cum',3,'21529 Jaida Views Suite 189\nLake Estelle, NE 39207',834488),('73750356','978361','vel',0,'3852 Boehm Mountains\nEast Magdalenview, DE 02174-9112',72186.7),('74547','38968999','eos',9,'190 Crawford Inlet\nLynchbury, MT 81111-8258',271),('76','966562','ut',1,'38832 Adeline Course Apt. 345\nEast Fletcher, NC 82173',58450.1),('76025','47','fugiat',6,'939 Ophelia Pike Apt. 879\nPort Stevie, WY 74095-2251',732691000),('773089055','229836','blanditiis',4,'10457 Gulgowski Village Apt. 292\nWhitechester, WY 54913-6924',0),('7750','4','et',8,'32295 Antone Greens\nKuhnhaven, CT 37560-5147',11.8579),('8','66','neque',0,'6144 Justen Estate Suite 014\nEast Murlborough, PA 05221-1817',20113.4),('82624003','683','non',6,'1466 Corene Pike\nJohnstonbury, LA 16238-9414',7616780),('84025','885','sunt',1,'4631 Hirthe Pike Apt. 905\nShieldsside, RI 95841-4081',36.5634),('84291','998274664','voluptatem',5,'19877 Roob Common\nFeilfurt, TX 19299',10626.8),('845853','14','adipisci',6,'6573 Betsy Ridges Apt. 102\nDenesikburgh, RI 28147-2014',0),('8459211','44233272','ex',6,'86617 Marta Throughway Apt. 769\nKundeland, AZ 04687',1327780),('8514','389962923','esse',6,'6138 Hamill Pass Suite 017\nFriesentown, AK 61394',3496440),('858944','684','occaecati',4,'630 Daphnee Corner\nGulgowskiton, WA 10939',60969600),('88562','194611','atque',0,'860 Allen Ford Suite 384\nThompsonville, DE 51943-6039',62590800),('8860525','8760','sit',5,'945 Zieme Shore Suite 468\nPfannerstillmouth, LA 98201-4781',67890.2),('8942','745','possimus',6,'925 Kihn Fords\nEast Donny, ME 55942',0),('9','75602304','provident',5,'61584 Hamill Path Suite 230\nDoylemouth, RI 09436',43.8),('928788','782','quia',9,'240 Shanahan Haven\nSchmelertown, MT 77522',58.2),('93','560932','maxime',4,'4761 Terrence Expressway Apt. 950\nBorerfort, SC 18492-2138',595306),('93708','819597','reiciendis',8,'8830 Gutkowski Crest Suite 040\nHowellview, NH 83887-9505',16476),('95','655','necessitatibus',5,'076 Gavin Valley\nJohnstonport, MT 74088-7765',124.068),('96164289','606282600','molestiae',0,'4115 Moore Creek Apt. 551\nNorth Rosalyn, TN 85931-8316',0),('983914','4802','illo',2,'6165 Stiedemann Village Suite 899\nChristiansenville, KY 41307-9353',2058720),('9873627','998','voluptas',3,'404 Dorian Haven Suite 468\nEast Gilbert, MA 40128',0),('99009','9','tempore',4,'202 Leda Forks Apt. 299\nWest Ruthiechester, OH 55762',2025.32);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
