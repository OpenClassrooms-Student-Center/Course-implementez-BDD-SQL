-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: localhost    Database: foodly_screencasts
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aliment`
--

DROP TABLE IF EXISTS `aliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `marque` varchar(100) DEFAULT NULL,
  `sucre` float DEFAULT NULL,
  `calories` int NOT NULL,
  `graisses` float DEFAULT NULL,
  `proteines` float DEFAULT NULL,
  `bio` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliment`
--

LOCK TABLES `aliment` WRITE;
/*!40000 ALTER TABLE `aliment` DISABLE KEYS */;
INSERT INTO `aliment` VALUES (1,'pomme','sans marque',19.1,72,0.2,0.4,0),(2,'poire','sans marque',27.5,134,0.2,1.1,1),(3,'banane','chiquita',24,101,0.3,1.1,0),(4,'jambon','herta',0.2,34,0.8,6.6,0),(5,'compote','andros',11,51,0,0.5,0),(6,'steak haché','charal',0.8,68,4.8,4.8,0),(7,'saumon','guyader',0,206,12.3,22.1,0),(8,'haricots verts','bonduelle',5.8,25,0.1,1.5,0),(9,'riz','oncle benz',28.2,130,0.3,2.7,0),(10,'pâtes completes','barilla',64,353,2.7,14,1),(11,'blanc de dinde','père dodu',0.6,98,0.9,22,0),(12,'filet de poulet','le gaulois',0,121,1.8,26.2,0),(13,'muesli','bjorg',26.5,170,5,3.5,1),(14,'café','carte noire',0,0,0,0,0),(15,'jus d\'orange','innocent',16,74,0,1.6,0),(16,'jus de pomme','andros',24,100,0.2,0.2,1),(17,'pomme de terre','doréac',21.1,104,0.2,2.8,0),(18,'oeuf','naturalia',0.4,74,5.1,6.5,1),(19,'baguette','sans marque',36.1,185,1.2,7.5,0),(20,'lait d\'amande','bjorg',6.1,80,5.3,1.5,1);
/*!40000 ALTER TABLE `aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langue`
--

DROP TABLE IF EXISTS `langue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langue`
--

LOCK TABLES `langue` WRITE;
/*!40000 ALTER TABLE `langue` DISABLE KEYS */;
INSERT INTO `langue` VALUES (1,'français'),(2,'anglais');
/*!40000 ALTER TABLE `langue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `langue_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `langue_id` (`langue_id`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`langue_id`) REFERENCES `langue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'durantay','quentin','qentin@gmail.com',1),(2,'dupont','marie','marie@hotmail.fr',1),(3,'miller','vincent','vm@yahoo.com',2),(4,'zuckerberg','marc','marc@gmail.com',2),(5,'paul','pierre','pp@orange.fr',1),(6,'de vauclerc','lisa','lisadv@gmail.com',1),(7,'gluntig','éléonore','glunt@sfr.com',1),(8,'cavill','henry','henry@outlook.fr',2),(9,'hopper','lionel','hpp@gmail.com',2),(10,'tember','fabienne','fabienne@yopmail.com',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_aliment`
--

DROP TABLE IF EXISTS `utilisateur_aliment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur_aliment` (
  `utilisateur_id` int NOT NULL,
  `aliment_id` int NOT NULL,
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `aliment_id` (`aliment_id`),
  CONSTRAINT `utilisateur_aliment_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utilisateur_aliment_ibfk_2` FOREIGN KEY (`aliment_id`) REFERENCES `aliment` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_aliment`
--

LOCK TABLES `utilisateur_aliment` WRITE;
/*!40000 ALTER TABLE `utilisateur_aliment` DISABLE KEYS */;
INSERT INTO `utilisateur_aliment` VALUES (1,7),(1,3),(1,5),(2,2),(2,19),(2,14),(3,4),(3,15),(3,12),(1,17),(4,5),(4,4),(4,7),(5,1),(5,18),(5,3),(6,2),(6,12),(6,6),(7,16),(7,19),(7,1),(8,3),(8,5),(9,18),(9,9),(9,14),(10,16),(10,3);
/*!40000 ALTER TABLE `utilisateur_aliment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `utilisateurs_gmail_vw`
--

DROP TABLE IF EXISTS `utilisateurs_gmail_vw`;
/*!50001 DROP VIEW IF EXISTS `utilisateurs_gmail_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `utilisateurs_gmail_vw` AS SELECT 
 1 AS `id`,
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `email`,
 1 AS `langue_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `utilisateurs_gmail_vw`
--

/*!50001 DROP VIEW IF EXISTS `utilisateurs_gmail_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `utilisateurs_gmail_vw` AS select `utilisateur`.`id` AS `id`,`utilisateur`.`nom` AS `nom`,`utilisateur`.`prenom` AS `prenom`,`utilisateur`.`email` AS `email`,`utilisateur`.`langue_id` AS `langue_id` from `utilisateur` where (`utilisateur`.`email` like '%gmail.com') */;
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

-- Dump completed on 2020-12-17 22:24:54
