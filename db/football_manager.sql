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
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_ID` int NOT NULL,
  `manager_Name` varchar(50) NOT NULL,
  `manager_Formation` int NOT NULL,
  `manager_Country` varchar(50) NOT NULL,
  `manager_Trophies` int NOT NULL,
  `manager_staff` int NOT NULL,
  `manager_value` int NOT NULL,
  `manager_wage` int NOT NULL,
  `manager_overall` int NOT NULL,
  `manager_tactics` varchar(50) NOT NULL,
  `manager_contract` int NOT NULL,
  `team_ID` int NOT NULL,
  PRIMARY KEY (`manager_ID`),
  KEY `team_ID` (`team_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`team_ID`) REFERENCES `team` (`team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (16,'Ole Gunnar Solskjaer',442,'Norway',18,5,4,17166,85,'Long Ball',4,10260),(42,'Steve Bruce',4321,'England',28,6,33,86608,67,'Long Ball',5,10261),(54,'Mikel Arteta',442,'Spain',4,10,43,41927,90,'Possesion',5,9825),(61,'Sam Allardyce',442,'England',21,8,38,24424,67,'Long Ball',1,8659),(62,'Lee Johnson',442,'England',21,5,11,19943,83,'Possesion',5,8472),(64,'Jurgen Klopp',433,'Germany',40,8,89,92533,100,'GegenPress',10,8650),(68,'David Moyes',532,'England',20,5,15,82228,76,'Long Ball',5,8654),(90,'Dean Smith',541,'England',30,5,8,91778,80,'Counter Attack',1,10252),(94,'Pep Guardiola',433,'Spain',1,7,47,90980,90,'Possesion',1,8456),(100,'Carlo Ancelotti',433,'Italy',28,5,11,34912,92,'High Press',1,8668),(112,'Jose Mourinho',343,'Portugal',5,9,50,95194,91,'Park The Bus',5,8586),(113,'Michael O Neill',343,'Ireland',10,6,1,39520,77,'Park The Bus',1,10194),(123,'Thomas Tuchel',4141,'Germany',5,7,46,52053,99,'Counter Attack',3,8455),(141,'Steve Cooper',3421,'England',9,9,24,88408,96,'Counter Attack',2,10003),(142,'Daniel Farke',343,'Germany',7,9,30,48314,61,'Counter Attack',3,9850),(163,'Ralph Hasenhuttl',442,'Austria',12,9,16,34483,99,'Long Ball',4,8466),(183,'Roy Hodgson',433,'England',18,9,24,48449,94,'Possesion',4,9826),(186,'Brendan Rodgers',541,'England',23,8,4,71654,92,'High Press',4,8197),(190,'Jonathan Woodgate',433,'England',19,6,5,71253,80,'High Press',2,8678),(217,'Xisco Munoz',451,'Spain',13,8,31,71398,98,'High Press',2,9817),(226,'Javi Garcia',4141,'Spain',13,8,28,35152,88,'Counter Attack',3,10267),(227,'Unai Emery',442,'Spain',14,6,7,51366,77,'Counter Attack',1,10205),(236,'Fernando Vazquez',451,'Spain',30,6,5,19229,91,'Counter Attack',1,9783),(240,'Zinedine Zidane',4141,'France',11,6,11,78599,100,'High Press',1,8633),(241,'Ronald Koeman',532,'Netherlands',7,6,2,22047,70,'High Press',1,8634),(267,'Julen Lopetegui',451,'Spain',16,5,10,41688,96,'Possesion',4,8302),(272,'David Gallejo',532,'Spain',19,9,15,93108,75,'Counter Attack',2,9869),(275,'Jose Bordalas',451,'Spain',4,7,32,67528,72,'Possesion',2,8305),(286,'Manuel Pellegrini',433,'Chile',30,10,30,84160,63,'High Press',5,8603),(294,'Vicente Moreno',442,'Spain',9,10,13,99401,79,'Possesion',3,8558),(299,'Marcelino Garcia Toral',451,'Spain',7,6,40,49354,69,'Possesion',3,8315),(305,'Diego Simeone',532,'Argentina',7,6,21,75432,88,'Possesion',5,9906),(312,'Sergio Pellicer Garcia',433,'Spain',13,7,38,77999,77,'Possesion',5,9864),(315,'Paco Lopez',451,'Spain',13,7,38,27564,77,'Possesion',1,8581),(317,'Imanol Alguacil',433,'Spain',30,5,6,20163,65,'Possesion',4,8560),(318,'Diego Martinez',451,'Spain',30,9,39,22366,69,'Long Ball',4,7878),(332,'Andoni Iraola',532,'Spain',1,8,17,48962,84,'Park The Bus',2,8370),(352,'Eduardo Coudet',4141,'Spain',16,5,30,43728,100,'Park The Bus',2,9910),(358,'Jose Luis Mendilibar',451,'Spain',10,7,17,66370,71,'Possesion',3,8372),(360,'Pepe Mel',4141,'Spain',28,10,2,42122,90,'Possesion',4,8306),(390,'Hansi Flick',4141,'Germany',6,5,11,60062,63,'High Press',3,9823),(396,'Daniel Thioune',4141,'Germany',18,7,50,96768,74,'Park The Bus',1,9790),(403,'Hannes Wolf',343,'Germany',12,8,22,45588,79,'Park The Bus',3,8178),(404,'Lucien Favre',433,'Switzerland',30,9,28,24303,60,'Park The Bus',1,9789),(409,'Dimitrios Grammozis',343,'Greece',2,6,47,59980,74,'Possesion',2,10189),(418,'Kenan Kocak',451,'Turkey',20,5,38,16036,94,'Counter Attack',2,9904),(421,'Oliver Glasner',442,'Austria',17,9,16,44446,65,'Possesion',4,8721),(428,'Markus Gisdol',343,'Austria',18,5,39,68496,79,'Possesion',5,8722),(432,'Adolf Hutter',451,'Germany',22,8,10,88402,89,'Possesion',1,9810),(442,'Pal Dardai',4141,'Germany',2,7,5,54735,64,'Possesion',3,8177),(447,'Florian Kohfeldt',451,'Germany',25,9,36,58962,93,'Possesion',3,8697),(458,'Sebastian Hoeness',433,'Germany',16,7,28,39688,89,'Possesion',5,8226),(474,'Marco Rose',343,'Germany',12,8,16,91502,66,'Possesion',4,9788),(477,'Pellegrino Matarazzo',4141,'Italy',11,8,19,73688,67,'Possesion',4,10269),(563,'Bo Svensson',343,'Bosnia',8,5,9,94284,74,'Possesion',1,9905),(566,'Heiko Herrlich',451,'Germany',25,7,4,63397,98,'Long Ball',1,8406),(571,'Tomas Oral',343,'Germany',4,5,17,96790,91,'Counter Attack',4,8234),(579,'Markus Anfang',532,'Germany',23,9,48,47235,70,'Park The Bus',1,8262),(588,'Gian Piero Gasperini',451,'Italy',3,9,23,16340,89,'Park The Bus',5,8524),(589,'Simone Inzaghi',532,'Italy',16,5,19,70521,82,'Park The Bus',2,8543),(599,'Davide Ballardini',451,'Italy',10,8,39,32640,71,'Park The Bus',1,10233),(601,'Alfredo Agliett',442,'Italy',2,5,16,67086,66,'Park The Bus',1,8533),(609,'Giuseppe Iachini',532,'Italy',9,10,9,83839,78,'Park The Bus',5,8535),(618,'Andrea Pirlo',4141,'Italy',8,8,14,70072,79,'High Press',5,9885),(622,'Stefano Pioli',451,'Italy',2,7,38,94588,69,'Possesion',1,8564),(637,'Sinisa Mihajlovic',4141,'Bosnia',29,5,13,38318,73,'Possesion',3,9857),(642,'Paulo  Fonseca',442,'Italy',2,7,16,66806,99,'High Press',2,8686),(654,'Gennaro Gattuso',451,'Italy',24,10,25,10399,76,'Possesion',2,9875),(666,'Claudio Ranieri',343,'Italy',30,5,44,44937,62,'High Press',1,9882),(671,'Antonio Conte',433,'Italy',20,8,14,49247,95,'Park The Bus',4,8636),(694,'Davide Nicola',4141,'Italy',17,8,47,86443,90,'Park The Bus',1,9804),(705,'Luca Gotti',4141,'Italy',4,10,3,16134,91,'Counter Attack',3,8600),(724,'Rocco Boscaglia',451,'Italy',21,10,27,15764,86,'Possesion',5,8540),(729,'Ivan Juric',343,'Serbia',13,10,19,98136,86,'Long Ball',5,9876),(732,'Roberto De Zerbi',442,'Italy',29,7,3,89705,82,'Counter Attack',5,7943),(759,'Alessio Dionisi',442,'Italy',18,10,41,20953,80,'Park The Bus',3,8534),(769,'Fabio Grosso',532,'Italy',29,5,2,19387,81,'Park The Bus',5,9891),(778,'Sandro Pochesci',451,'Italy',19,7,13,89379,87,'Park The Bus',2,208931),(804,'Antoine Kombouare',343,'France',3,5,20,57513,84,'Possesion',4,9830),(806,'Jean-Louis Gasset',4141,'France',27,7,24,64224,86,'Possesion',3,9827),(809,'Yohann Eudeline',442,'France',7,8,36,24315,83,'Possesion',2,7819),(815,'Adrian Ursea',532,'France',16,6,16,27119,78,'Possesion',5,9831),(825,'Christophe Pelissier',433,'France',17,8,15,32580,83,'Possesion',2,8689),(830,'Rudi Garcia',442,'Spain',12,8,34,71733,99,'Counter Attack',2,9748),(834,'Patrice Garande',343,'France',1,7,6,33986,88,'Park The Bus',5,9941),(836,'Niko Kovac',451,'Croatia',29,6,36,51641,66,'Park The Bus',5,9829),(852,'Mauricio Pochettino',4141,'Argentina',2,9,18,40990,95,'Park The Bus',3,9847),(884,'Christophe Galtier',451,'France',24,10,11,48204,88,'Counter Attack',2,8639),(894,'Bruno Genesio',532,'France',7,9,7,61922,71,'Long Ball',5,9851),(896,'Jorge Luis Sampaoli',451,'Argentina',4,8,27,52587,80,'Possesion',1,8592),(899,'Claude Jacques Puel',433,'France',24,5,25,61533,72,'Possesion',4,9853),(905,'Michel Der Zakarian',442,'Austria',30,7,7,55074,86,'Possesion',5,10249),(936,'David Guion',433,'France',25,10,4,81765,98,'Possesion',3,9837),(938,'Mathieu Chabert',451,'France',15,10,30,40686,65,'Possesion',3,7794),(970,'Laurent Batlles',4141,'France',9,5,1,28316,60,'Possesion',4,10242),(981,'Mehmed Bazdarevic',442,'Serbia',11,8,13,60098,63,'Possesion',5,9747),(986,'Stephane Moulin',451,'France',13,6,27,60180,69,'High Press',5,8121),(993,'Olivier Pantaloni',41212,'France',28,10,48,64496,74,'High Press',1,6391);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
