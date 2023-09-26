mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.34, for Linux (aarch64)
--
-- Host: localhost    Database: sitename
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `type` enum('Checking','Savings') NOT NULL,
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'Checking',5460.23),(2,2,'Checking',909325.24),(3,3,'Checking',892.00);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Sarah','Vowell'),(2,'David','Sedaris'),(3,'Kojo','Nnamdi');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `pass` char(40) NOT NULL,
  `registration_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jake','Li','jakeli@mail.com','e727d1464ae12436e899a726da5b2f11d8381b26','2023-09-26 19:22:37'),(2,'Zoe','Isabella','email2@example.com','6b793ca1c216835ba85c1fbd1399ce729e34b4e5','2023-09-26 19:31:44'),(3,'John','Lennon','john@beatles.com','2a50435b0f512f60988db719106a258fb7e338ff','2023-09-26 19:31:54'),(4,'Paul','McCartney','paul@beatles.com','6ae16792c502a5b47da180ce8456e5ae7d65e262','2023-09-26 19:31:54'),(5,'George','Harrison','george@beatles.com ','1af17e73721dbe0c40011b82ed4bb1a7dbe3ce29','2023-09-26 19:31:54'),(6,'Ringo','Starr','ringo@beatles.com','520f73691bcf89d508d923a2dbc8e6fa58efb522','2023-09-26 19:31:54'),(7,'David','Jones','davey@monkees.com','ec23244e40137ef72763267f17ed6c7ebb2b019f','2023-09-26 19:32:06'),(8,'Peter','Tork','peter@monkees.com','b8f6bc0c646f68ec6f27653f8473ae4ae81fd302','2023-09-26 19:32:06'),(9,'Micky','Dolenz','micky@monkees.com ','0599b6e3c9206ef135c83a921294ba6417dbc673','2023-09-26 19:32:06'),(10,'Mike','Nesmith','mike@monkees.com','804a1773e9985abeb1f2605e0cc22211cc58cb1b','2023-09-26 19:32:06'),(11,'David','Sedaris','david@authors.com','f54e748ae9624210402eeb2c15a9f506a110ef72','2023-09-26 19:32:06'),(12,'Nick','Hornby','nick@authors.com','815f12d7b9d7cd690d4781015c2a0a5b3ae207c0','2023-09-26 19:32:06'),(13,'Melissa','Bank','melissa@authors.com','15ac6793642add347cbf24b8884b97947f637091','2023-09-26 19:32:06'),(14,'Toni','Morrison','toni@authors.com','ce3a79105879624f762c01ecb8abee7b31e67df5','2023-09-26 19:32:06'),(15,'Jonathan','Franzen','jonathan@authors.com','c969581a0a7d6f790f4b520225f34fd90a09c86f','2023-09-26 19:32:06'),(16,'Don','DeLillo','don@authors.com','01a3ff9a11b328afd3e5affcba4cc9e539c4c455','2023-09-26 19:32:06'),(17,'Graham','Greene','graham@authors.com','7c16ec1fcbc8c3ec99790f25c310ef63febb1bb3','2023-09-26 19:32:06'),(18,'Michael','Chabon','michael@authors.com','bd58cc413f97c33930778416a6dbd2d67720dc41','2023-09-26 19:32:06'),(19,'Richard','Brautigan','richard@authors.com','b1f8414005c218fb53b661f17b4f671bccecea3d','2023-09-26 19:32:06'),(20,'Russell','Banks','russell@authors.com','6bc4056557e33f1e209870ab578ed362f8b3c1b8','2023-09-26 19:32:06'),(21,'Homer','Simpson','homer@simpson.com','54a0b2dcbc5a944907d29304405f0552344b3847','2023-09-26 19:32:06'),(22,'Marge','Simpson','marge@simpson.com','cea9be7b57e183dea0e4cf000489fe073908c0ca','2023-09-26 19:32:06'),(23,'Bart','Simpson','bart@simpson.com','73265774abd1028ed8ef06afc5fa0f9a7ccbb6aa','2023-09-26 19:32:06'),(24,'Lisa','Simpson','lisa@simpson.com','a09bb16971ec0759dfff75c088f004e205c9e27b','2023-09-26 19:32:06'),(25,'Maggie','Simpson','maggie@simpson.com','0e87350b393ceced1d4751b828d18102be123edb','2023-09-26 19:32:06'),(26,'Abe','Simpson','abe@simpson.com','6591827c8e3d4624e8fc1ee324f31fa389fdafb4','2023-09-26 19:32:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 22:54:37
