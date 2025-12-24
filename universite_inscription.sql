-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: universite
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etudiant_id` int DEFAULT NULL,
  `enseignement_id_cours` int DEFAULT NULL,
  `enseignement_id_prof` int DEFAULT NULL,
  `enseignement_semestre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_insc_etudiant` (`etudiant_id`),
  KEY `fk_insc_enseignement` (`enseignement_id_cours`,`enseignement_id_prof`,`enseignement_semestre`),
  CONSTRAINT `fk_insc_enseignement` FOREIGN KEY (`enseignement_id_cours`, `enseignement_id_prof`, `enseignement_semestre`) REFERENCES `enseignement` (`cours_id`, `professeur_id`, `semestre`),
  CONSTRAINT `fk_insc_etudiant` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription`
--

LOCK TABLES `inscription` WRITE;
/*!40000 ALTER TABLE `inscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-24 18:02:48
