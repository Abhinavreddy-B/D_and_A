-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: Project4
-- ------------------------------------------------------
-- Server version       8.0.29

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
-- Table structure for table `AWARDS`
--

DROP TABLE IF EXISTS `AWARDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARDS` (
  `Prize_Money` int NOT NULL DEFAULT '100000',
  `Name` varchar(40) NOT NULL,
  `AWARDED_IN` int NOT NULL,
  `AWARDED_TO` varchar(40) NOT NULL,
  PRIMARY KEY (`Name`,`AWARDED_IN`,`AWARDED_TO`),
  UNIQUE KEY `AWARDED_TO` (`AWARDED_TO`),
  KEY `Awarded_In_LeagueFK` (`AWARDED_IN`),
  CONSTRAINT `Awarded_In_LeagueFK` FOREIGN KEY (`AWARDED_IN`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE,
  CONSTRAINT `Awarded_To_PlayerFK` FOREIGN KEY (`AWARDED_TO`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARDS`
--

LOCK TABLES `AWARDS` WRITE;
/*!40000 ALTER TABLE `AWARDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AWARDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTATORS`
--

DROP TABLE IF EXISTS `COMMENTATORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENTATORS` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(30) NOT NULL,
  `Commentators` varchar(30) NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`,`Commentators`),
  CONSTRAINT `COMMENTATORS_Date_Time_VenueFK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTATORS`
--

LOCK TABLES `COMMENTATORS` WRITE;
/*!40000 ALTER TABLE `COMMENTATORS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTATORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIXTURE`
--

DROP TABLE IF EXISTS `FIXTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIXTURE` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Result` varchar(30) NOT NULL,
  `Match_No` int NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIXTURE`
--

LOCK TABLES `FIXTURE` WRITE;
/*!40000 ALTER TABLE `FIXTURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIXTURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FORM`
--

DROP TABLE IF EXISTS `FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FORM` (
  `Fantasy_points` int NOT NULL DEFAULT '0',
  `Form` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Fantasy_points`),
  UNIQUE KEY `Form` (`Form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FORM`
--

LOCK TABLES `FORM` WRITE;
/*!40000 ALTER TABLE `FORM` DISABLE KEYS */;
/*!40000 ALTER TABLE `FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JERSEY`
--

DROP TABLE IF EXISTS `JERSEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JERSEY` (
  `Jersey_Number` int NOT NULL,
  `BELONGS_TO` varchar(30) NOT NULL,
  PRIMARY KEY (`Jersey_Number`,`BELONGS_TO`),
  KEY `BELONGS_TO_FK` (`BELONGS_TO`),
  CONSTRAINT `BELONGS_TO_FK` FOREIGN KEY (`BELONGS_TO`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JERSEY`
--

LOCK TABLES `JERSEY` WRITE;
/*!40000 ALTER TABLE `JERSEY` DISABLE KEYS */;
/*!40000 ALTER TABLE `JERSEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEAGUE`
--

DROP TABLE IF EXISTS `LEAGUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEAGUE` (
  `Prize_Money` int NOT NULL DEFAULT '10000000',
  `Runner_Up` varchar(20) NOT NULL,
  `Winner` varchar(20) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Season_Number` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Season_Number`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Season_Number` (`Season_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEAGUE`
--

LOCK TABLES `LEAGUE` WRITE;
/*!40000 ALTER TABLE `LEAGUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LEAGUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER`
--

DROP TABLE IF EXISTS `PARTNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTNER` (
  `CIN` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CIN`),
  UNIQUE KEY `CIN` (`CIN`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER`
--

LOCK TABLES `PARTNER` WRITE;
/*!40000 ALTER TABLE `PARTNER` DISABLE KEYS */;
INSERT INTO `PARTNER` VALUES (1,'Hello'),(3,'Hello2');
/*!40000 ALTER TABLE `PARTNER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER_TYPE`
--

DROP TABLE IF EXISTS `PARTNER_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTNER_TYPE` (
  `CIN` int NOT NULL,
  `Type` varchar(40) NOT NULL,
  PRIMARY KEY (`CIN`,`Type`),
  UNIQUE KEY `CIN` (`CIN`),
  CONSTRAINT `PART_TYPEFK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER_TYPE`
--

LOCK TABLES `PARTNER_TYPE` WRITE;
/*!40000 ALTER TABLE `PARTNER_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTNER_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER` (
  `Base_price` int NOT NULL,
  `Auctioned_price` int NOT NULL DEFAULT '2000000',
  `Name` varchar(40) NOT NULL,
  `CName` varchar(40) NOT NULL,
  `Fantasy_points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FORMFK` (`Fantasy_points`),
  CONSTRAINT `FORMFK` FOREIGN KEY (`Fantasy_points`) REFERENCES `FORM` (`Fantasy_points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_FOR_IN_OF`
--

DROP TABLE IF EXISTS `PLAYS_FOR_IN_OF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_FOR_IN_OF` (
  `PName` varchar(40) NOT NULL,
  `TName` varchar(30) NOT NULL,
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Season_Number` int NOT NULL,
  PRIMARY KEY (`PName`,`TName`,`Date_Time`,`Venue`,`Season_Number`),
  KEY `TName_FK` (`TName`),
  KEY `Date_Time_Venue_FK` (`Date_Time`,`Venue`),
  KEY `Season_Number_FK` (`Season_Number`),
  CONSTRAINT `Date_Time_Venue_FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PName_FK` FOREIGN KEY (`PName`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Season_Number_FK` FOREIGN KEY (`Season_Number`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TName_FK` FOREIGN KEY (`TName`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_FOR_IN_OF`
--

LOCK TABLES `PLAYS_FOR_IN_OF` WRITE;
/*!40000 ALTER TABLE `PLAYS_FOR_IN_OF` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYS_FOR_IN_OF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_IN`
--

DROP TABLE IF EXISTS `PLAYS_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_IN` (
  `Name` varchar(30) NOT NULL,
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`,`Date_Time`,`Venue`),
  KEY `PLAYS_INDate_Time_VenueFK` (`Date_Time`,`Venue`),
  CONSTRAINT `PLAYS_IN_NameFK` FOREIGN KEY (`Name`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLAYS_INDate_Time_VenueFK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_IN`
--

LOCK TABLES `PLAYS_IN` WRITE;
/*!40000 ALTER TABLE `PLAYS_IN` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYS_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_LEAGUE`
--

DROP TABLE IF EXISTS `SPONSORS_LEAGUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_LEAGUE` (
  `Number` int NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Number`,`CIN`),
  KEY `SPONSORS_LEAGUE_CINFK` (`CIN`),
  CONSTRAINT `SPONSORS_LEAGUE_CINFK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_LEAGUE_NumberFK` FOREIGN KEY (`Number`) REFERENCES `LEAGUE` (`Season_Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_LEAGUE`
--

LOCK TABLES `SPONSORS_LEAGUE` WRITE;
/*!40000 ALTER TABLE `SPONSORS_LEAGUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPONSORS_LEAGUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_PLAYER`
--

DROP TABLE IF EXISTS `SPONSORS_PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_PLAYER` (
  `Name` varchar(40) NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Name`,`CIN`),
  KEY `SPONSORS_PLAYER_CINFK` (`CIN`),
  CONSTRAINT `SPONSORS_PLAYER_CINFK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_PLAYER_NameFK` FOREIGN KEY (`Name`) REFERENCES `PLAYER` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_PLAYER`
--

LOCK TABLES `SPONSORS_PLAYER` WRITE;
/*!40000 ALTER TABLE `SPONSORS_PLAYER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPONSORS_PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPONSORS_TEAM`
--

DROP TABLE IF EXISTS `SPONSORS_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPONSORS_TEAM` (
  `Name` varchar(30) NOT NULL,
  `CIN` int NOT NULL,
  PRIMARY KEY (`Name`,`CIN`),
  KEY `SPONSORS_Team_CINFK` (`CIN`),
  CONSTRAINT `SPONSORS_Team_CINFK` FOREIGN KEY (`CIN`) REFERENCES `PARTNER` (`CIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SPONSORS_TEAM_NameFK` FOREIGN KEY (`Name`) REFERENCES `TEAM` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPONSORS_TEAM`
--

LOCK TABLES `SPONSORS_TEAM` WRITE;
/*!40000 ALTER TABLE `SPONSORS_TEAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPONSORS_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM`
--

DROP TABLE IF EXISTS `TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM` (
  `Place` varchar(20) NOT NULL,
  `RTM_Cards` int NOT NULL DEFAULT '0',
  `Money_Left` int NOT NULL DEFAULT '0',
  `Brand_Value` int NOT NULL,
  `Fair_play_points` decimal(5,2) NOT NULL DEFAULT '0.00',
  `Total_points` int NOT NULL DEFAULT '0',
  `Name` varchar(30) NOT NULL,
  `Coach` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Coach` (`Coach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM_MANAGER`
--

DROP TABLE IF EXISTS `TEAM_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM_MANAGER` (
  `Manager_First_Name` varchar(20) NOT NULL,
  `Manager_Last_Name` varchar(20) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `ManKey` (`Manager_First_Name`,`Manager_Last_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_MANAGER`
--

LOCK TABLES `TEAM_MANAGER` WRITE;
/*!40000 ALTER TABLE `TEAM_MANAGER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEAM_MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UMPIRE`
--

DROP TABLE IF EXISTS `UMPIRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UMPIRE` (
  `Date_Time` timestamp NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Umpire_Name` varchar(20) NOT NULL,
  `Umpire_Position` int NOT NULL,
  PRIMARY KEY (`Date_Time`,`Venue`,`Umpire_Name`),
  UNIQUE KEY `Umpire_Name` (`Umpire_Name`),
  CONSTRAINT `FK` FOREIGN KEY (`Date_Time`, `Venue`) REFERENCES `FIXTURE` (`Date_Time`, `Venue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UMPIRE`
--

LOCK TABLES `UMPIRE` WRITE;
/*!40000 ALTER TABLE `UMPIRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `UMPIRE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 13:08:53