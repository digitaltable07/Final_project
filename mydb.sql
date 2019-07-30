-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: digitalser
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `admin_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorymaster`
--

DROP TABLE IF EXISTS `categorymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorymaster` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK_4cxtbkdsbf0srpgoj6lwsuvua` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorymaster`
--

LOCK TABLES `categorymaster` WRITE;
/*!40000 ALTER TABLE `categorymaster` DISABLE KEYS */;
INSERT INTO `categorymaster` VALUES (1,'Veg'),(2,'Veg2');
/*!40000 ALTER TABLE `categorymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chef` (
  `chef_id` varchar(255) NOT NULL,
  `chef_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chef_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerdetails` (
  `mobile_no` bigint(10) NOT NULL,
  `customer_firstname` varchar(30) DEFAULT NULL,
  `customer_lastname` varchar(30) DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mobile_no`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
INSERT INTO `customerdetails` VALUES (1414,'pravin','Karanjikar','edfdftergb'),(1236548,'madhura','pille','madhura@gmail.com'),(2313123,'manali','Patil','panchalprins@gmail.com'),(25469856,'dhara','patil','dhara@bewafa.com'),(814988935,'manali','mali','manali@gmail.com'),(1234567891,'Shreyas','Karanjikar','karanjikar1997@gmail.com');
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'lpol',NULL,'manali','patil',0,1253,NULL,NULL,NULL),(1,'nagpur','india','pappu','kapgate',123,100,'maharashtra',NULL,NULL),(2,'Mumbai','India','pravin','panchal',400101,323,'Maharashtra',NULL,NULL),(3,'Kharghar','India','manali','mali',402203,0,'Maharashtra','mayuri@123','mayuri');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_no` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`feedback_no`),
  UNIQUE KEY `menu_id_UNIQUE` (`menu_id`),
  KEY `menu_refere` (`menu_id`),
  KEY `FK_mobileno` (`mobile_no`),
  CONSTRAINT `FK_mobileno` FOREIGN KEY (`mobile_no`) REFERENCES `customerdetails` (`mobile_no`),
  CONSTRAINT `menu_refere` FOREIGN KEY (`menu_id`) REFERENCES `menudetails` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menudetails`
--

DROP TABLE IF EXISTS `menudetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menudetails` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(45) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price_half` float DEFAULT NULL,
  `price_full` float DEFAULT NULL,
  `time_for_preparation` time(6) DEFAULT NULL,
  `add_on_time` time(6) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `menumaster` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menudetails`
--

LOCK TABLES `menudetails` WRITE;
/*!40000 ALTER TABLE `menudetails` DISABLE KEYS */;
INSERT INTO `menudetails` VALUES (11,'Veg Biryani',1,60,120,'00:00:20.000000',NULL),(12,'Paneer Kadai',1,60,120,'00:00:20.000000',NULL),(43,'fdsf',0,45,45,'12:01:00.000000','12:12:00.000000'),(321,'dsfsef',0,43,43,NULL,NULL);
/*!40000 ALTER TABLE `menudetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menumaster`
--

DROP TABLE IF EXISTS `menumaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menumaster` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menumaster`
--

LOCK TABLES `menumaster` WRITE;
/*!40000 ALTER TABLE `menumaster` DISABLE KEYS */;
INSERT INTO `menumaster` VALUES (5,'chinese'),(4,'cold drinks'),(3,'Dessert'),(2,'NonVeg'),(1,'Veg');
/*!40000 ALTER TABLE `menumaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menusdetails`
--

DROP TABLE IF EXISTS `menusdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menusdetails` (
  `menu_id` int(11) NOT NULL,
  `add_on_time` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `price_full` float DEFAULT NULL,
  `price_half` float DEFAULT NULL,
  `time_for_preparation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`),
  KEY `FK_i9gmh3ka7lgsghxwhb3chrfnm` (`category_id`),
  CONSTRAINT `FK_i9gmh3ka7lgsghxwhb3chrfnm` FOREIGN KEY (`category_id`) REFERENCES `categorymaster` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menusdetails`
--

LOCK TABLES `menusdetails` WRITE;
/*!40000 ALTER TABLE `menusdetails` DISABLE KEYS */;
INSERT INTO `menusdetails` VALUES (11,'5',1,'panir masala',200,100,'15'),(12,'5',1,'Aloo Matar',100,50,'10'),(13,'',1,'butterscotch',0,0,''),(52,'2',1,'samosa',20,10,'5');
/*!40000 ALTER TABLE `menusdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails1`
--

DROP TABLE IF EXISTS `orderdetails1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails1` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`sr_no`),
  KEY `order_id` (`order_id`),
  KEY `FK_menuid` (`menu_id`),
  CONSTRAINT `FK_menuid` FOREIGN KEY (`menu_id`) REFERENCES `menudetails` (`menu_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `ordermaster1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails1`
--

LOCK TABLES `orderdetails1` WRITE;
/*!40000 ALTER TABLE `orderdetails1` DISABLE KEYS */;
INSERT INTO `orderdetails1` VALUES (1,1,11,150);
/*!40000 ALTER TABLE `orderdetails1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermaster1`
--

DROP TABLE IF EXISTS `ordermaster1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordermaster1` (
  `order_id` int(11) NOT NULL,
  `table_no` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `table_id` (`table_no`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_no`) REFERENCES `tablemaster1` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermaster1`
--

LOCK TABLES `ordermaster1` WRITE;
/*!40000 ALTER TABLE `ordermaster1` DISABLE KEYS */;
INSERT INTO `ordermaster1` VALUES (1,1,'2019-07-19','00:00:04');
/*!40000 ALTER TABLE `ordermaster1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `table_no` int(11) DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_mode` int(11) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `table_no` (`table_no`),
  KEY `order_no` (`order_no`),
  KEY `payment_mode` (`payment_mode`),
  KEY `FK_mobileNo1` (`mobile_no`),
  CONSTRAINT `FK_mobileNo1` FOREIGN KEY (`mobile_no`) REFERENCES `customerdetails` (`mobile_no`),
  CONSTRAINT `order_no` FOREIGN KEY (`order_no`) REFERENCES `orderdetails1` (`order_id`),
  CONSTRAINT `payment_mode` FOREIGN KEY (`payment_mode`) REFERENCES `paymentmode` (`mode_id`),
  CONSTRAINT `table_no` FOREIGN KEY (`table_no`) REFERENCES `tablemaster1` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmode`
--

DROP TABLE IF EXISTS `paymentmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmode` (
  `mode_id` int(11) NOT NULL,
  `mode_name` varchar(410) DEFAULT NULL,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmode`
--

LOCK TABLES `paymentmode` WRITE;
/*!40000 ALTER TABLE `paymentmode` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablemaster1`
--

DROP TABLE IF EXISTS `tablemaster1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablemaster1` (
  `table_no` int(11) NOT NULL,
  `no_of_seats` int(11) DEFAULT NULL,
  `table_desc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablemaster1`
--

LOCK TABLES `tablemaster1` WRITE;
/*!40000 ALTER TABLE `tablemaster1` DISABLE KEYS */;
INSERT INTO `tablemaster1` VALUES (1,4,NULL),(22,5,'Big Table '),(23,4,'Big Table '),(24,5,'sdfsd');
/*!40000 ALTER TABLE `tablemaster1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 15:20:22
