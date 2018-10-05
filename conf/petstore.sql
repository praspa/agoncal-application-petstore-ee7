-- MySQL dump 10.16  Distrib 10.2.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: petstore
-- ------------------------------------------------------
-- Server version	10.2.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `petstore`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `petstore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `petstore`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `name` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `iso3` varchar(3) NOT NULL,
  `iso_code` varchar(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `numcode` varchar(3) NOT NULL,
  `printable_name` varchar(80) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street1` varchar(50) NOT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `uuid` varchar(256) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2r67e919tj04df0noxm1f6bxv` (`country_id`),
  CONSTRAINT `FK2r67e919tj04df0noxm1f6bxv` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `unit_cost` float NOT NULL,
  `version` int(11) DEFAULT NULL,
  `product_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKorywub2ms5p9l57d5v77r252q` (`product_fk`),
  CONSTRAINT `FKorywub2ms5p9l57d5v77r252q` FOREIGN KEY (`product_fk`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `item_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1x9aqv137m1pjc1atcx66hkaj` (`item_fk`),
  CONSTRAINT `FK1x9aqv137m1pjc1atcx66hkaj` FOREIGN KEY (`item_fk`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `name` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `category_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlgbo1awuhjmqsihofofq3tbuo` (`category_fk`),
  CONSTRAINT `FKlgbo1awuhjmqsihofofq3tbuo` FOREIGN KEY (`category_fk`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `id` bigint(20) NOT NULL,
  `credit_card_expiry_date` varchar(5) NOT NULL,
  `credit_card_number` varchar(30) NOT NULL,
  `credit_card_type` int(11) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street1` varchar(50) NOT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) NOT NULL,
  `discount` float DEFAULT NULL,
  `discount_rate` float DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `totalWithVat` float DEFAULT NULL,
  `totalWithoutVat` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `vat_rate` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `customer_fk` bigint(20) NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7rl0tqgxogwpuxttukl4xsq7m` (`customer_fk`),
  KEY `FKbd4l5kphorgnikpt73os83lrd` (`country_id`),
  CONSTRAINT `FK7rl0tqgxogwpuxttukl4xsq7m` FOREIGN KEY (`customer_fk`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKbd4l5kphorgnikpt73os83lrd` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_order_order_line`
--

DROP TABLE IF EXISTS `t_order_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order_order_line` (
  `order_fk` bigint(20) NOT NULL,
  `order_line_fk` bigint(20) NOT NULL,
  PRIMARY KEY (`order_fk`,`order_line_fk`),
  UNIQUE KEY `UK_jo44h7yfc34r15gudii8hsq9q` (`order_line_fk`),
  CONSTRAINT `FK31k94wis8jfbsi72sareeh32` FOREIGN KEY (`order_fk`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `FK3aqi5l05d51b1bkigjt0v6bwa` FOREIGN KEY (`order_line_fk`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'petstore'
--

--
-- Dumping routines for database 'petstore'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05 15:30:55
