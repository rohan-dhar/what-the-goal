-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: football
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `director_ID` int NOT NULL,
  `team_ID` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `team_budget` bigint NOT NULL,
  `team_owner` varchar(50) NOT NULL,
  `team_trophies` int NOT NULL,
  `team_value` bigint NOT NULL,
  `team_expenses` bigint NOT NULL,
  PRIMARY KEY (`team_ID`),
  KEY `director_ID` (`director_ID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`director_ID`) REFERENCES `director` (`director_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (4769,6391,'GFC Ajaccio',4800000,'Herzog, Rowe and Hammes',0,7680000,2304000),(4769,7794,'Sporting Club de Bastia',8852000,'Kulas-Auer',3,14163200,4248960),(4769,7819,'Stade Malherbe Caen',6629000,'Gislason, Pouros and Morissette',0,10606400,3181920),(21518,7878,'Granada CF',8597000,'Murazik, Toy and Reynolds',0,13755200,4126560),(10257,7943,'Sassuolo',15269000,'Turner-Homenick',0,24430400,7329120),(4769,8121,'Angers SCO',4531000,'Rath-Jerde',0,7249600,2174880),(7809,8177,'Hertha BSC',81326000,'Koss Inc',4,130121600,39036480),(7809,8178,'Bayer 04 Leverkusen',54236000,'Bartell-Moen',2,86777600,26033280),(1729,8197,'Leicester City',49488000,'Rogahn, Parisian and Wiegand',5,79180800,23754240),(7809,8226,'TSG 1899 Hoffenheim',39234000,'Walsh-Greenholt',0,62774400,18832320),(7809,8234,'FC Ingolstadt 04',16380000,'Cole, Kulas and Gleason',0,26208000,7862400),(7809,8262,'SV Darmstadt 98',5567000,'Braun, Abshire and Fadel',0,8907200,2672160),(21518,8302,'Sevilla FC',39009000,'Kessler-Parisian',14,62414400,18724320),(21518,8305,'Getafe CF',9343000,'Kris Group',0,14948800,4484640),(21518,8306,'UD Las Palmas',1971000,'Walsh-Beahan',0,3153600,946080),(21518,8315,'Athletic Club de Bilbao',20904000,'Feest-Ankunding',35,33446400,10033920),(21518,8370,'Rayo Vallecano',2221000,'Krajcik-Gaylord',0,3553600,1066080),(21518,8372,'SD Eibar',7361000,'Hyatt Inc',0,11777600,3533280),(7809,8406,'FC Augsburg',11780000,'Hoppe, Windler and Smitham',0,18848000,5654400),(1729,8455,'Chelsea',91078000,'Rippin-Bergnaum',31,145724800,43717440),(1729,8456,'Manchester City',209703000,'Carroll-Bosco',26,335524800,100657440),(1729,8466,'Southampton',37976000,'Sporer-Grant',1,60761600,18228480),(1729,8472,'Sunderland',18803000,'Larkin-Rau',10,30084800,9025440),(10257,8524,'Atalanta',31640000,'Kub-Anderson',1,50624000,15187200),(10257,8533,'Chievo Verona',5277000,'Beatty Group',1,8443200,2532960),(10257,8534,'Empoli',6397000,'Hegmann-Deckow',0,10235200,3070560),(10257,8535,'Fiorentina',28658000,'Grimes, Kertzmann and Stokes',10,45852800,13755840),(10257,8540,'Palermo',13035000,'Gleason, MacGyver and King',0,20856000,6256800),(10257,8543,'Lazio',38279000,'Shanahan-Hickle',16,61246400,18373920),(21518,8558,'RCD Espanyol',2342000,'Torp-Roob',0,3747200,1124160),(21518,8560,'Real Sociedad',17798000,'Pacocha, Heidenreich and Morar',6,28476800,8543040),(10257,8564,'Milan',41696000,'Rempel-Wuckert',48,66713600,20014080),(21518,8581,'Levante UD',10455000,'Olson and Sons',0,16728000,5018400),(1729,8586,'Tottenham Hotspur',88323000,'Runolfsson, Altenwerth and Koepp',26,141316800,42395040),(4769,8592,'Olympique de Marseille',15865000,'Stoltenberg-Cronin',27,25384000,7615200),(10257,8600,'Udinese',9762000,'Koepp-Raynor',1,15619200,4685760),(21518,8603,'Real Betis',18143000,'Little and Sons',3,29028800,8708640),(21518,8633,'Real Madrid',212955000,'Bins, Steuber and Zemlak',95,340728000,102218400),(21518,8634,'FC Barcelona',212282000,'Sir Joan Laporta',96,339651200,101895360),(10257,8636,'Inter',89250000,'Botsford-Nolan',39,142800000,42840000),(4769,8639,'LOSC Lille',15865000,'Dach LLC',10,25384000,7615200),(1729,8650,'Liverpool',96955000,'FSG',65,155128000,46538400),(1729,8654,'West Ham United',44837000,'Von LLC',6,71739200,21521760),(1729,8659,'West Bromwich Albion',20747000,'Kohler-Auer',9,33195200,9958560),(1729,8668,'Everton',60535000,'Robel LLC',24,96856000,29056800),(1729,8678,'Bournemouth',15865786,'Stehr Group',0,25385257,7615577),(10257,8686,'Roma',49730000,'Miller and Sons',15,79568000,23870400),(4769,8689,'FC Lorient',5838000,'Schmidt Inc',1,9340800,2802240),(7809,8697,'SV Werder Bremen',13875000,'Kautzer-Abernathy',15,22200000,6660000),(7809,8721,'VfL Wolfsburg',44816000,'Gleason and Sons',3,71705600,21511680),(7809,8722,'1. FC Koln',16573000,'Kiehn-Lehner',7,26516800,7955040),(4769,9747,'En Avant de Guingamp',5689000,'Trantow-Bins',3,9102400,2730720),(4769,9748,'Olympique Lyonnais',49602000,'Purdy-Price',22,79363200,23808960),(21518,9783,'Deportivo de La Coruna',5424000,'Goldner, Stoltenberg and Wolff',6,8678400,2603520),(7809,9788,'Borussia Monchengladbach',28534000,'Cartwright-Kiehn',10,45654400,13696320),(7809,9789,'Borussia Dortmund',67795000,'Gottlieb Inc',21,108472000,32541600),(7809,9790,'Hamburger SV',7267000,'Ruecker LLC',13,11627200,3488160),(10257,9804,'Torino',17641000,'Shields, Larson and Jenkins',12,28225600,8467680),(7809,9810,'Eintracht Frankfurt',22985000,'Schinner Inc',7,36776000,11032800),(1729,9817,'Watford',14787999,'Metz, McLaughlin and Bayer',0,23660798,7098239),(7809,9823,'FC Bayern Munich',135397000,'Terry-Parker',78,216635200,64990560),(1729,9825,'Arsenal',89792000,'Reynolds-Gorczany',48,143667200,43100160),(1729,9826,'Crystal Palace',35590000,'Konopelski-Hane',1,56944000,17083200),(4769,9827,'FC Girondins de Bordeaux',11785000,'Johnston-Schmidt',17,18856000,5656800),(4769,9829,'AS Monaco',39139000,'Larkin-Mills',18,62622400,18786720),(4769,9830,'FC Nantes',9888000,'Bartoletti Inc',14,15820800,4746240),(4769,9831,'OGC Nice',11785000,'Lindgren-Turner',8,18856000,5656800),(4769,9837,'Stade de Reims',6975000,'Greenholt Inc',12,11160000,3348000),(4769,9847,'Paris Saint-Germain',151066000,'Legros, Davis and Torp',43,241705600,72511680),(1729,9850,'Norwich City',32873000,'MacGyver-Feest',2,52596800,15779040),(4769,9851,'Stade Rennais FC',13786000,'Cremin, Streich and Smitham',4,22057600,6617280),(4769,9853,'AS Saint-Etienne',14125000,'Effertz and Sons',22,22600000,6780000),(10257,9857,'Bologna',16929000,'Brown LLC',10,27086400,8125920),(21518,9864,'Malaga CF',3217000,'Rippin, Raynor and Mosciski',1,5147200,1544160),(21518,9869,'Real Sporting de Gijon',4995000,'Jacobson Group',0,7992000,2397600),(10257,9875,'Napoli',52863000,'Raynor, Miller and Rosenbaum',11,84580800,25374240),(10257,9876,'Hellas Verona',11785000,'Kiehn-Torp',1,18856000,5656800),(10257,9882,'Sampdoria',13707000,'Franecki, Ritchie and Beer',7,21931200,6579360),(10257,9885,'Juventus',118651000,'Pagac, Collins and Moen',69,189841600,56952480),(10257,9891,'Frosinone',6397000,'Abernathy, Wunsch and Runolfsson',0,10235200,3070560),(7809,9904,'Hannover 96',13875000,'Hoppe Inc',3,22200000,6660000),(7809,9905,'1. FSV Mainz 05',13427000,'Bogan, Ledner and Brakus',0,21483200,6444960),(21518,9906,'Atletico Madrid',77488000,'Green-Will',33,123980800,37194240),(21518,9910,'RC Celta',13300000,'Leannon-Grady',1,21280000,6384000),(4769,9941,'Toulouse Football Club',7881000,'Hilpert-Stracke',1,12609600,3782880),(1729,10003,'Swansea City',18645000,'Bernhard-Nikolaus',1,29832000,8949600),(7809,10189,'FC Schalke 04',24138000,'Stehr Inc',15,38620800,11586240),(1729,10194,'Stoke City',25023000,'Rohan, Crooks and Kirlin',1,40036800,12011040),(21518,10205,'Villarreal CF',37210000,'Simonis Group',2,59536000,17860800),(10257,10233,'Genoa',9683000,'Batz, Terry and Emard',10,15492800,4647840),(4769,10242,'ESTAC Troyes',5838000,'Kunde Group',1,9340800,2802240),(4769,10249,'Montpellier HSC',9903000,'Mraz Group',4,15844800,4753440),(1729,10252,'Aston Villa',44774000,'Konopelski Group',25,71638400,21491520),(1729,10260,'Manchester United',210291000,'Simonis, Waelchi and Crist',66,336465600,100939680),(1729,10261,'Newcastle United',37542000,'Lesch, Miller and Swift',14,60067200,18020160),(21518,10267,'Valencia CF',74962000,'Roob, Nicolas and Casper',23,119939200,35981760),(7809,10269,'VfB Stuttgart',22756000,'Hegmann-Shields',9,36409600,10922880),(10257,208931,'Carpi',4670000,'Kessler Inc',0,7472000,2241600);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-15 21:23:14
