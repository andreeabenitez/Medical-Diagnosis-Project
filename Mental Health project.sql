CREATE DATABASE  IF NOT EXISTS `mental_health_diagnosis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mental_health_diagnosis`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mental_health_diagnosis
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `Diagnosis_ID` int NOT NULL AUTO_INCREMENT,
  `Diagnosis_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Diagnosis_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'Major depressive Disorder'),(2,'Panic Disorder'),(3,'Generalized Anxiety'),(4,'Bipolar Disorder');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Employee_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_name` varchar(30) DEFAULT NULL,
  `Employee_surname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'John','Doe'),(2,'Jane','Smith'),(3,'Michael','Johnson'),(4,'Emily','Davis'),(5,'Daniel','Martinez'),(6,'Sophia','Garcia'),(7,'James','Wilson'),(8,'Olivia','Brown'),(9,'David','Miller'),(10,'Isabella','Taylor');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medication_ID` int NOT NULL AUTO_INCREMENT,
  `medication_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`medication_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Mood Stabilizers'),(2,'Antipsychotics'),(3,'SSRIs'),(4,'Anxiolytics'),(5,'Antidepressants'),(6,'Benzodiazepines');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int NOT NULL AUTO_INCREMENT,
  `Age` int DEFAULT NULL,
  `Gender` varchar(9) DEFAULT NULL,
  `Diagnosis_ID` int DEFAULT NULL,
  `medication_ID` int DEFAULT NULL,
  `therapy_ID` int DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Diagnosis_ID` (`Diagnosis_ID`),
  KEY `medication_ID` (`medication_ID`),
  KEY `therapy_ID` (`therapy_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Diagnosis_ID`) REFERENCES `diagnosis` (`Diagnosis_ID`),
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`medication_ID`) REFERENCES `medication` (`medication_ID`),
  CONSTRAINT `patients_ibfk_3` FOREIGN KEY (`therapy_ID`) REFERENCES `therapy` (`therapy_ID`),
  CONSTRAINT `patients_ibfk_4` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,43,'Female',1,1,1,6),(2,40,'Female',1,2,1,9),(3,55,'Female',1,3,2,5),(4,34,'Female',1,3,2,1),(5,52,'Male',2,4,1,2),(6,28,'Male',2,3,3,7),(7,59,'Male',3,1,4,10),(8,32,'Female',1,5,3,7),(9,21,'Female',1,5,2,7),(10,21,'Female',2,5,3,3),(11,42,'Female',2,5,2,8),(12,54,'Female',2,5,2,4),(13,46,'Female',3,4,1,9),(14,19,'Male',4,2,4,1),(15,23,'Female',2,2,4,2),(16,38,'Female',3,1,1,10),(17,30,'Male',4,1,2,8),(18,28,'Female',4,3,2,6),(19,52,'Female',3,4,2,6),(20,37,'Male',4,1,4,5),(21,19,'Male',1,6,3,2),(22,41,'Female',4,5,1,5),(23,50,'Male',3,4,1,3),(24,53,'Female',2,4,2,9),(25,60,'Male',1,4,1,7),(26,19,'Female',4,2,4,9),(27,23,'Male',4,6,1,8),(28,56,'Male',3,6,2,3),(29,58,'Male',1,5,3,3),(30,41,'Female',1,3,3,10),(31,44,'Male',1,2,2,5),(32,47,'Male',4,6,2,3),(33,39,'Female',3,3,1,2),(34,27,'Female',1,1,3,4),(35,53,'Male',3,3,1,2),(36,53,'Male',4,1,3,4),(37,45,'Female',4,6,2,6),(38,33,'Male',3,5,4,10),(39,31,'Male',1,5,4,3),(40,41,'Female',4,4,1,9),(41,46,'Female',3,2,4,4),(42,56,'Male',2,2,4,2),(43,31,'Female',2,3,4,4),(44,50,'Female',4,3,3,3),(45,40,'Female',2,2,3,3),(46,43,'Female',4,5,4,2),(47,48,'Male',3,5,3,1),(48,26,'Male',3,6,1,4),(49,41,'Female',1,2,3,8),(50,46,'Female',3,3,1,3),(51,40,'Male',3,4,3,7),(52,31,'Female',2,2,4,5),(53,38,'Female',4,6,1,1),(54,18,'Male',2,1,2,9),(55,28,'Female',2,2,2,6),(56,29,'Female',4,5,2,5),(57,43,'Male',2,2,1,6),(58,31,'Male',1,5,1,4),(59,35,'Female',2,5,3,1),(60,47,'Male',4,3,1,6),(61,56,'Female',3,6,1,3),(62,41,'Female',3,1,2,7),(63,30,'Male',4,1,1,5),(64,37,'Male',1,4,4,8),(65,23,'Female',3,3,3,9),(66,30,'Male',4,2,2,5),(67,28,'Female',1,6,2,2),(68,35,'Female',1,1,3,3),(69,39,'Female',1,4,3,3),(70,52,'Female',4,3,1,2),(71,51,'Female',3,6,1,4),(72,57,'Male',1,2,2,9),(73,60,'Female',1,6,2,6),(74,57,'Male',2,1,4,2),(75,24,'Male',1,1,3,2),(76,45,'Female',2,5,2,5),(77,21,'Male',3,1,2,1),(78,32,'Female',4,4,1,1),(79,29,'Male',4,1,3,8),(80,29,'Male',3,3,3,10),(81,21,'Male',1,3,1,4),(82,23,'Male',1,6,1,6),(83,33,'Male',2,3,2,7),(84,31,'Female',3,5,3,4),(85,57,'Male',3,3,2,10),(86,19,'Male',2,1,1,5),(87,22,'Male',3,5,2,6),(88,50,'Male',1,5,4,9),(89,56,'Female',2,3,3,7),(90,22,'Female',1,6,4,9),(91,55,'Female',3,3,4,2),(92,43,'Female',4,4,4,1),(93,49,'Female',2,4,3,3),(94,22,'Female',4,5,2,8),(95,49,'Male',4,1,3,3),(96,40,'Female',1,1,1,9),(97,51,'Male',1,4,4,4),(98,46,'Male',1,5,4,2),(99,43,'Female',2,2,4,9),(100,24,'Male',3,2,3,2),(101,56,'Male',3,3,1,3),(102,23,'Male',4,4,3,2),(103,31,'Male',4,5,2,6),(104,36,'Male',1,1,2,1),(105,44,'Female',3,2,4,2),(106,19,'Female',2,1,4,2),(107,40,'Male',1,4,3,1),(108,30,'Male',3,1,1,3),(109,23,'Male',2,4,2,5),(110,30,'Female',4,2,4,6),(111,41,'Male',3,4,3,10),(112,58,'Female',3,6,2,1),(113,37,'Male',4,4,2,6),(114,20,'Female',1,6,4,8),(115,28,'Male',3,4,2,5),(116,33,'Male',4,2,2,8),(117,43,'Male',4,1,4,1),(118,31,'Male',4,5,1,3),(119,29,'Male',4,4,3,1),(120,45,'Female',4,1,2,9),(121,50,'Male',1,4,4,6),(122,19,'Male',2,4,3,10),(123,35,'Female',3,3,4,2),(124,50,'Male',1,3,1,8),(125,53,'Male',3,6,2,2),(126,43,'Male',3,6,3,8),(127,47,'Female',4,2,1,1),(128,53,'Male',1,2,3,7),(129,31,'Male',4,1,3,5),(130,28,'Male',3,2,1,1),(131,35,'Male',3,1,3,1),(132,50,'Male',4,4,2,6),(133,47,'Female',2,6,2,6),(134,41,'Female',1,4,2,2),(135,37,'Female',4,5,2,6),(136,42,'Female',1,4,3,10),(137,32,'Male',2,5,1,3),(138,53,'Male',3,3,1,2),(139,57,'Female',1,5,3,5),(140,57,'Male',3,3,1,10),(141,41,'Female',4,4,4,10),(142,55,'Male',3,1,4,8),(143,50,'Male',3,2,4,2),(144,21,'Male',4,6,2,6),(145,21,'Female',1,2,1,5),(146,29,'Male',2,3,3,6),(147,48,'Male',1,6,3,1),(148,45,'Female',3,1,1,8),(149,46,'Male',3,4,2,6),(150,47,'Male',4,5,4,8),(151,22,'Female',2,3,3,8),(152,19,'Male',2,3,4,10),(153,58,'Male',3,5,1,9),(154,21,'Female',2,1,1,1),(155,26,'Female',1,6,4,1),(156,27,'Female',3,5,2,8),(157,44,'Male',2,2,4,10),(158,60,'Male',3,4,4,4),(159,55,'Female',1,3,3,2),(160,26,'Female',3,6,2,9),(161,18,'Male',2,3,1,1),(162,22,'Male',3,6,2,10),(163,21,'Female',2,2,4,2),(164,35,'Male',1,6,2,1),(165,37,'Male',4,4,2,10),(166,52,'Female',3,6,2,2),(167,19,'Male',1,2,4,7),(168,23,'Male',1,3,1,3),(169,28,'Male',2,6,4,10),(170,56,'Female',3,6,4,2),(171,24,'Male',1,4,4,6),(172,47,'Female',4,5,3,6),(173,19,'Male',2,6,2,4),(174,55,'Female',4,6,2,3),(175,51,'Male',1,3,1,9),(176,24,'Male',2,6,1,10),(177,31,'Female',1,2,1,3),(178,56,'Male',1,1,4,2),(179,41,'Male',2,6,3,9),(180,19,'Male',3,4,4,7),(181,23,'Male',3,5,2,7),(182,28,'Male',1,6,3,9),(183,18,'Female',4,6,4,4),(184,59,'Female',1,5,2,1),(185,40,'Female',2,4,1,10),(186,54,'Female',3,1,1,5),(187,25,'Male',3,1,3,1),(188,36,'Male',1,2,1,4),(189,60,'Female',3,2,1,4),(190,35,'Male',1,3,3,1),(191,56,'Female',2,5,1,4),(192,58,'Female',4,6,1,6),(193,47,'Male',4,1,2,4),(194,53,'Female',2,1,3,9),(195,27,'Male',2,3,1,2),(196,27,'Female',4,3,4,8),(197,50,'Male',3,4,4,5),(198,31,'Male',2,4,3,5),(199,24,'Female',1,6,2,10),(200,54,'Female',4,6,2,2),(201,24,'Female',2,3,4,1),(202,50,'Male',3,2,4,3),(203,30,'Male',1,3,2,10),(204,48,'Male',1,3,4,2),(205,26,'Male',3,4,4,9),(206,31,'Male',2,5,4,7),(207,43,'Female',4,4,2,7),(208,59,'Female',2,6,4,2),(209,26,'Male',3,5,1,6),(210,50,'Male',3,1,4,10),(211,46,'Female',4,3,3,6),(212,40,'Female',1,5,4,9),(213,46,'Male',4,6,2,6),(214,51,'Female',1,1,4,7),(215,39,'Male',2,3,1,9),(216,21,'Female',3,4,3,8),(217,49,'Female',2,3,3,6),(218,34,'Female',1,6,1,8),(219,20,'Female',4,1,3,5),(220,44,'Female',1,4,1,3),(221,40,'Male',3,1,1,3),(222,49,'Female',1,5,4,2),(223,60,'Male',2,2,1,7),(224,47,'Male',4,2,1,4),(225,51,'Female',2,1,4,5),(226,21,'Male',3,1,4,7),(227,33,'Male',1,6,3,1),(228,22,'Male',3,2,2,10),(229,41,'Female',3,4,1,5),(230,40,'Female',3,2,4,4),(231,22,'Female',2,1,4,10),(232,34,'Male',3,2,1,7),(233,55,'Female',4,3,4,10),(234,18,'Female',4,3,4,6),(235,29,'Male',3,3,1,8),(236,27,'Male',3,4,4,1),(237,50,'Male',4,2,2,2),(238,18,'Male',4,3,1,3),(239,54,'Female',1,1,1,4),(240,60,'Male',3,3,4,2),(241,20,'Female',4,2,3,1),(242,38,'Female',3,1,2,2),(243,18,'Male',2,4,4,4),(244,24,'Female',3,2,1,3),(245,20,'Female',2,2,4,10),(246,26,'Female',3,3,4,2),(247,54,'Male',2,5,2,9),(248,44,'Female',1,5,3,3),(249,47,'Male',2,5,1,6),(250,32,'Male',1,6,2,2),(251,56,'Male',4,2,4,2),(252,30,'Female',4,2,2,2),(253,31,'Male',2,3,3,3),(254,38,'Male',4,4,1,8),(255,55,'Female',2,3,1,9),(256,26,'Male',1,5,4,8),(257,26,'Male',3,5,4,9),(258,22,'Female',2,6,3,1),(259,31,'Female',2,1,4,1),(260,44,'Male',3,6,3,3),(261,20,'Male',3,4,4,7),(262,51,'Female',1,5,3,5),(263,37,'Female',1,4,3,6),(264,35,'Female',3,6,4,6),(265,26,'Female',4,6,2,10),(266,31,'Female',1,3,2,2),(267,23,'Male',1,4,1,8),(268,52,'Female',2,4,3,5),(269,35,'Female',1,6,1,4),(270,36,'Male',2,6,2,7),(271,30,'Male',4,2,2,4),(272,51,'Male',4,3,4,7),(273,56,'Female',3,4,3,4),(274,33,'Female',1,4,2,5),(275,46,'Male',3,2,4,9),(276,45,'Male',4,2,2,4),(277,24,'Male',2,2,3,2),(278,49,'Female',3,6,2,2),(279,59,'Female',2,3,4,7),(280,32,'Male',2,4,4,6),(281,48,'Male',2,1,2,6),(282,35,'Male',1,4,1,10),(283,52,'Male',1,3,4,5),(284,44,'Female',4,1,1,2),(285,28,'Female',3,4,1,6),(286,35,'Male',3,2,2,2),(287,41,'Male',4,5,1,1),(288,49,'Male',1,6,1,7),(289,51,'Female',4,1,1,7),(290,26,'Male',4,1,4,2),(291,54,'Male',2,4,3,3),(292,30,'Female',2,4,1,1),(293,51,'Female',3,5,2,3),(294,51,'Female',4,4,2,8),(295,38,'Male',4,6,4,2),(296,26,'Male',2,2,1,9),(297,58,'Female',3,6,1,9),(298,56,'Male',3,1,4,9),(299,60,'Female',3,2,3,2),(300,32,'Male',1,1,1,7),(301,54,'Female',3,6,2,10),(302,55,'Female',3,5,2,4),(303,32,'Male',3,2,1,6),(304,37,'Female',1,6,1,7),(305,21,'Female',1,3,1,7),(306,27,'Male',4,2,3,6),(307,51,'Female',4,6,3,5),(308,60,'Male',2,3,4,3),(309,24,'Male',2,6,4,3),(310,47,'Male',2,3,3,3),(311,30,'Female',2,2,3,7),(312,32,'Male',2,4,2,9),(313,20,'Male',4,6,1,4),(314,28,'Male',2,3,1,2),(315,20,'Female',2,4,3,4),(316,28,'Female',3,1,3,6),(317,60,'Female',1,6,2,5),(318,37,'Male',1,6,2,4),(319,45,'Male',4,6,2,5),(320,49,'Male',3,1,4,9),(321,44,'Male',4,4,2,5),(322,18,'Male',1,1,4,10),(323,50,'Female',1,6,1,2),(324,33,'Male',2,1,3,7),(325,33,'Male',2,3,2,5),(326,36,'Male',4,2,4,3),(327,37,'Male',4,1,2,5),(328,42,'Female',1,4,4,3),(329,43,'Male',2,1,2,6),(330,34,'Male',3,5,1,1),(331,50,'Male',1,3,2,3),(332,46,'Male',1,2,3,9),(333,32,'Female',4,1,2,1),(334,55,'Male',4,2,3,3),(335,43,'Female',2,2,1,4),(336,34,'Male',4,5,3,2),(337,60,'Male',3,1,1,1),(338,51,'Female',4,3,3,8),(339,48,'Male',2,5,2,5),(340,42,'Female',3,5,2,2),(341,21,'Male',3,2,4,7),(342,25,'Female',2,2,1,3),(343,24,'Female',4,1,1,5),(344,35,'Male',3,4,2,7),(345,20,'Female',1,6,2,5),(346,56,'Male',3,5,1,3),(347,32,'Female',2,1,3,10),(348,35,'Female',4,6,4,7),(349,34,'Female',1,3,3,2),(350,47,'Male',1,2,2,9),(351,33,'Male',2,3,3,6),(352,39,'Male',4,6,3,2),(353,57,'Female',2,5,3,1),(354,34,'Male',3,2,3,9),(355,27,'Male',2,6,1,7),(356,40,'Male',1,6,3,4),(357,60,'Male',2,1,3,7),(358,55,'Male',1,2,3,9),(359,49,'Female',4,5,2,4),(360,46,'Female',3,1,4,5),(361,22,'Female',1,4,4,9),(362,56,'Male',2,3,2,2),(363,33,'Female',1,2,2,4),(364,53,'Male',1,1,1,1),(365,50,'Female',1,6,4,8),(366,40,'Male',1,5,3,6),(367,31,'Female',3,6,1,4),(368,29,'Female',3,6,2,4),(369,24,'Female',1,4,2,4),(370,31,'Male',2,6,3,6),(371,60,'Female',4,6,3,2),(372,57,'Male',4,1,4,7),(373,45,'Female',3,3,3,9),(374,19,'Female',1,3,1,4),(375,34,'Male',3,1,1,3),(376,51,'Female',3,3,3,10),(377,57,'Female',3,3,4,6),(378,27,'Female',2,1,3,5),(379,33,'Male',2,3,4,3),(380,21,'Female',1,3,1,8),(381,27,'Female',2,3,2,8),(382,32,'Male',3,2,3,2),(383,54,'Female',3,6,3,1),(384,39,'Female',3,3,4,4),(385,44,'Female',3,6,2,1),(386,37,'Male',1,2,3,8),(387,19,'Female',3,2,2,2),(388,45,'Male',2,3,4,9),(389,36,'Female',4,5,4,3),(390,19,'Male',1,5,2,9),(391,25,'Male',3,1,1,1),(392,34,'Female',4,6,3,3),(393,19,'Female',1,1,3,10),(394,46,'Female',2,5,3,5),(395,38,'Male',2,2,1,6),(396,19,'Male',2,4,2,8),(397,56,'Female',4,2,4,1),(398,23,'Male',1,2,1,6),(399,32,'Female',1,6,4,4),(400,33,'Male',3,5,2,4),(401,49,'Male',3,5,4,1),(402,59,'Male',2,2,1,4),(403,18,'Female',4,2,2,9),(404,43,'Male',3,3,2,5),(405,44,'Female',1,1,2,6),(406,52,'Female',2,3,4,7),(407,25,'Female',4,4,1,10),(408,50,'Male',3,1,2,9),(409,58,'Female',1,2,4,4),(410,44,'Male',2,1,1,5),(411,51,'Female',1,5,3,6),(412,31,'Female',3,2,4,5),(413,32,'Female',3,2,2,7),(414,20,'Male',4,4,2,8),(415,33,'Female',4,3,4,3),(416,59,'Male',4,1,3,3),(417,35,'Female',4,3,1,6),(418,31,'Male',4,5,1,3),(419,45,'Female',3,5,2,4),(420,55,'Female',3,1,2,8),(421,28,'Male',4,2,4,1),(422,20,'Female',1,2,1,4),(423,50,'Male',1,6,4,5),(424,41,'Female',3,1,2,4),(425,46,'Male',4,1,4,9),(426,26,'Male',3,3,3,4),(427,39,'Male',2,6,2,5),(428,52,'Female',2,3,4,9),(429,35,'Female',4,5,2,3),(430,57,'Female',2,6,4,3),(431,20,'Female',1,5,3,3),(432,51,'Female',4,6,4,3),(433,57,'Male',2,2,4,7),(434,52,'Female',4,5,1,8),(435,37,'Female',4,3,1,3),(436,35,'Female',2,6,2,5),(437,24,'Female',2,3,4,7),(438,49,'Male',4,5,1,1),(439,48,'Female',1,6,4,4),(440,36,'Female',2,5,3,8),(441,40,'Male',2,1,2,6),(442,37,'Male',1,6,1,9),(443,53,'Female',3,3,2,7),(444,27,'Male',2,3,2,7),(445,59,'Male',1,6,3,5),(446,35,'Female',4,2,1,9),(447,39,'Female',2,1,3,8),(448,33,'Male',4,5,4,1),(449,52,'Female',3,6,3,8),(450,25,'Male',4,5,1,5),(451,20,'Female',3,1,4,5),(452,52,'Male',1,1,2,8),(453,58,'Male',4,2,1,6),(454,44,'Male',1,4,4,8),(455,18,'Male',3,3,2,9),(456,21,'Female',3,3,4,8),(457,18,'Male',2,2,3,10),(458,30,'Male',1,5,2,8),(459,28,'Male',3,3,2,2),(460,18,'Female',2,6,4,7),(461,40,'Male',1,2,1,5),(462,25,'Female',4,2,2,2),(463,31,'Female',4,5,3,8),(464,37,'Male',2,4,1,7),(465,24,'Female',1,1,4,3),(466,56,'Male',3,2,1,1),(467,45,'Female',4,6,4,1),(468,57,'Female',3,6,1,9),(469,50,'Male',4,5,2,10),(470,55,'Male',2,1,4,4),(471,60,'Male',1,4,3,6),(472,38,'Male',4,4,1,3),(473,59,'Male',4,2,2,6),(474,49,'Female',1,5,4,1),(475,20,'Male',3,3,3,6),(476,39,'Female',3,1,1,9),(477,40,'Male',2,6,3,7),(478,60,'Female',4,1,4,6),(479,29,'Male',4,2,2,3),(480,55,'Male',1,4,2,1),(481,58,'Female',3,1,1,1),(482,36,'Female',3,2,3,8),(483,60,'Male',1,6,3,7),(484,60,'Male',1,3,3,9),(485,32,'Male',4,3,3,9),(486,58,'Male',3,5,4,6),(487,24,'Female',3,5,4,5),(488,56,'Male',1,2,1,7),(489,27,'Female',4,1,3,3),(490,60,'Male',4,6,4,1),(491,33,'Female',4,1,1,10),(492,42,'Male',2,1,3,10),(493,18,'Male',4,2,2,5),(494,23,'Male',2,4,1,8),(495,19,'Male',1,3,4,7),(496,24,'Male',3,1,4,9),(497,22,'Male',2,6,2,2),(498,23,'Male',1,5,3,2),(499,48,'Male',4,5,2,5),(500,58,'Male',4,3,3,1),(501,13,'Female',1,1,1,3),(502,11,'female',1,2,3,3);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_new_patient` BEFORE INSERT ON `patients` FOR EACH ROW BEGIN

SET NEW.employee_id = 3;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `therapy`
--

DROP TABLE IF EXISTS `therapy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapy` (
  `therapy_ID` int NOT NULL AUTO_INCREMENT,
  `Therapy_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`therapy_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapy`
--

LOCK TABLES `therapy` WRITE;
/*!40000 ALTER TABLE `therapy` DISABLE KEYS */;
INSERT INTO `therapy` VALUES (1,'Interpersonal Therapy'),(2,'Mindfulness-Based Therapy'),(3,'Cognitive Behavioral Therapy'),(4,'Dialectical Behavioral Therapy');
/*!40000 ALTER TABLE `therapy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_patient`
--

DROP TABLE IF EXISTS `v_patient`;
/*!50001 DROP VIEW IF EXISTS `v_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_patient` AS SELECT 
 1 AS `patient_id`,
 1 AS `therapy_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vv_patient`
--

DROP TABLE IF EXISTS `vv_patient`;
/*!50001 DROP VIEW IF EXISTS `vv_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vv_patient` AS SELECT 
 1 AS `patient_id`,
 1 AS `diagnosis_name`,
 1 AS `medication_name`,
 1 AS `therapy_type`,
 1 AS `employee_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_patient`
--

DROP TABLE IF EXISTS `vw_patient`;
/*!50001 DROP VIEW IF EXISTS `vw_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_patient` AS SELECT 
 1 AS `patient_id`,
 1 AS `diagnosis_id`,
 1 AS `medication_id`,
 1 AS `therapy_id`,
 1 AS `employee_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mental_health_diagnosis'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `new_therapy` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `new_therapy` ON SCHEDULE EVERY 1 MONTH STARTS '2024-11-14 20:58:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO medication (medication_ID, medication_name)
    SELECT patient_id, 'Finish', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH)
    FROM patients
    WHERE estado = 'Antipsychotics' */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'mental_health_diagnosis'
--
/*!50003 DROP FUNCTION IF EXISTS `new_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_age`(age INT) RETURNS int
    DETERMINISTIC
BEGIN
    IF age < 18 THEN
        RETURN NULL;
    END IF;

    RETURN age;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_into`( IN patient_id INT, IN age int, IN gender varchar (20), in diagnosis_id int, in medication_id int, in therapy_id int, in employee_id int )
BEGIN INSERT INTO patients (patient_id, age, gender, diagnosis_id, medication_id, therapy_id, employee_id) 
VALUES (patient_id, age, gender, diagnosis_id, medication_id, therapy_id, employee_id); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_patient`
--

/*!50001 DROP VIEW IF EXISTS `v_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_patient` AS select `p`.`Patient_ID` AS `patient_id`,`t`.`Therapy_type` AS `therapy_type` from (`patients` `p` join `therapy` `t` on((`p`.`therapy_ID` = `t`.`therapy_ID`))) where ((`p`.`Age` > 39) and (`t`.`Therapy_type` = 'Interpersonal Therapy')) group by `p`.`Patient_ID` order by `p`.`Patient_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vv_patient`
--

/*!50001 DROP VIEW IF EXISTS `vv_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vv_patient` AS select `p`.`Patient_ID` AS `patient_id`,`d`.`Diagnosis_name` AS `diagnosis_name`,`m`.`medication_name` AS `medication_name`,`t`.`Therapy_type` AS `therapy_type`,`e`.`Employee_name` AS `employee_name` from ((((`patients` `p` join `diagnosis` `d` on((`p`.`Diagnosis_ID` = `d`.`Diagnosis_ID`))) join `medication` `m` on((`p`.`medication_ID` = `m`.`medication_ID`))) join `therapy` `t` on((`p`.`therapy_ID` = `t`.`therapy_ID`))) join `employees` `e` on((`p`.`Employee_ID` = `e`.`Employee_ID`))) group by `p`.`Patient_ID` order by `p`.`Patient_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_patient`
--

/*!50001 DROP VIEW IF EXISTS `vw_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_patient` AS select `patients`.`Patient_ID` AS `patient_id`,`patients`.`Diagnosis_ID` AS `diagnosis_id`,`patients`.`medication_ID` AS `medication_id`,`patients`.`therapy_ID` AS `therapy_id`,`patients`.`Employee_ID` AS `employee_id` from `patients` where (`patients`.`Age` > 39) */;
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

-- Dump completed on 2024-11-19  7:52:24
