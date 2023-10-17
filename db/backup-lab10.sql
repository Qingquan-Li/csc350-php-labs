mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.34, for Linux (aarch64)
--
-- Host: localhost    Database: forum
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
-- Current Database: `forum`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `forum` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `forum`;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forums` (
  `forum_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`forum_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (5,'CSS'),(4,'HTML'),(6,'Kindling'),(7,'Modern Dance'),(1,'MySQL'),(2,'PHP'),(3,'Sports');
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `forum_id` tinyint unsigned NOT NULL,
  `user_id` mediumint unsigned NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `date_entered` datetime NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `parent_id` (`parent_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `date_entered` (`date_entered`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,0,1,1,'Question about normalization.','I\'m confused about normalization. For the second normal form (2NF), I read...','2023-10-17 19:16:14'),(2,0,1,2,'Database Design','I\'m creating a new database and am having problems with the structure. How many tables should I have?...','2023-10-17 19:16:14'),(3,2,1,2,'Database Design','The number of tables your database includes...','2023-10-17 19:16:14'),(4,0,1,3,'Database Design','Okay, thanks!','2023-10-17 19:16:14'),(5,0,2,3,'PHP Errors','I\'m using the scripts from Chapter 3 and I can\'t get the first calculator example to work. When I submit the form...','2023-10-17 19:16:14'),(6,5,2,1,'PHP Errors','What version of PHP are you using?','2023-10-17 19:16:16'),(7,6,2,3,'PHP Errors','Version 5.2','2023-10-17 19:16:16'),(8,7,2,1,'PHP Errors','In that case, try the debugging steps outlined in Chapter 7.','2023-10-17 19:16:16'),(9,0,3,2,'Chicago Bulls','Can the Bulls really win it all this year?','2023-10-17 19:16:16'),(10,9,3,1,'Chicago Bulls','I don\'t know, but they sure look good!','2023-10-17 19:16:16'),(11,0,5,3,'CSS Resources','Where can I found out more information about CSS?','2023-10-17 19:16:16'),(12,11,5,1,'CSS Resources','Read Elizabeth Castro\'s excellent book on (X)HTML and CSS. Or search Google on \"CSS\".','2023-10-17 19:16:16'),(13,0,4,3,'HTML vs. XHTML','What are the differences between HTML and XHTML?','2023-10-17 19:16:16'),(14,13,4,1,'HTML vs. XHTML','XHTML is a cross between HTML and XML. The differences are largely syntactic. Blah, blah, blah...','2023-10-17 19:16:16'),(15,0,6,4,'Why?','Why do you have a forum dedicated to kindling? Don\'t you deal mostly with PHP, MySQL, and so forth?','2023-10-17 19:16:16'),(16,0,2,3,'Dynamic HTML using PHP','Can I use PHP to dynamically generate HTML on the fly? Thanks...','2023-10-17 19:16:16'),(17,16,2,1,'Dynamic HTML using PHP','You most certainly can.','2023-10-17 19:16:16'),(18,17,2,3,'Dynamic HTML using PHP, still not clear','Um, how?','2023-10-17 19:16:16'),(19,18,2,2,'Dynamic HTML using PHP, clearer?','I think what Larry is trying to say is that you should buy and read his book.','2023-10-17 19:16:16'),(20,15,6,4,'Why? Why? Why?','Really, why?','2023-10-17 19:16:16'),(21,20,6,1,'Because','Because','2023-10-17 19:16:16');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `pass` char(40) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `login` (`pass`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'troutster','e727d1464ae12436e899a726da5b2f11d8381b26','Larry','Ullman','lu@example.com'),(2,'funny man','ab87d24bdc7452e55738deb5f868e1f16dea5ace','David','Brent','db@example.com'),(3,'Gareth','0d73e0a895b147446cba85df36b3e7d1e4ecec97','Gareth','Keenan','gk@example.com'),(4,'tim','4cb0c3898531df6f039fc8fbeacf5c8ad15393c1','Tim','Canterbury','tc@example.com'),(5,'finchy','45c30192fc7a8849b45f10573663ff63500f5431','Chris','Finch','cf@example.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `banking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `banking` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `banking`;

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
  PRIMARY KEY (`account_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'Checking',5460.23),(2,2,'Checking',909325.24),(3,3,'Checking',892.00),(4,2,'Savings',13546.97);
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
  PRIMARY KEY (`customer_id`),
  KEY `full_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'Kojo','Nnamdi'),(2,'David','Sedaris'),(1,'Sarah','Vowell');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `to_account_id` int unsigned NOT NULL,
  `from_account_id` int unsigned NOT NULL,
  `amount` decimal(5,2) unsigned NOT NULL,
  `date_entered` timestamp NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `to_account_id` (`to_account_id`),
  KEY `from_account_id` (`from_account_id`),
  KEY `date_entered` (`date_entered`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-17 20:33:54
