CREATE DATABASE  IF NOT EXISTS `little_lemon` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `little_lemon`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: little_lemon
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `TableNumber` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID_fk_idx` (`CustomerID`),
  CONSTRAINT `CustomerID_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-03-16',3,1),(2,'2023-03-17',4,2),(3,'2023-03-18',2,3),(4,'2023-03-19',1,4),(5,'2023-03-20',5,5),(6,'2023-03-21',3,6),(7,'2023-03-22',4,7),(8,'2023-03-23',2,8),(9,'2023-03-24',1,9),(10,'2023-03-25',5,10);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactdetails`
--

DROP TABLE IF EXISTS `contactdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactdetails` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`ContactID`),
  KEY `CustomerID_fk_idx` (`CustomerID`),
  KEY `StaffID_fk_idx` (`StaffID`),
  CONSTRAINT `CustomerID_fk2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StaffID_fk1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactdetails`
--

LOCK TABLES `contactdetails` WRITE;
/*!40000 ALTER TABLE `contactdetails` DISABLE KEYS */;
INSERT INTO `contactdetails` VALUES (1,'john.smith@gmail.com','555-1234','123 Main St','USA','New York',1,1),(2,'emily.watson@gmail.com','555-5678','456 Oak Ave','USA','Los Angeles',2,1),(3,'william.brown@gmail.com','555-9012','789 Maple Dr','USA','Chicago',3,1),(4,'sophia.johnson@gmail.com','555-3456','321 Elm St','USA','Houston',4,1),(5,'oliver.davis@gmail.com','555-7890','654 Pine Ave','USA','Miami',5,1),(6,'emma.martinez@gmail.com','555-2345','987 Cedar Blvd','USA','San Francisco',6,1),(7,'daniel.garcia@gmail.com','555-6789','543 Birch St','USA','Boston',7,1),(8,'mia.miller@gmail.com','555-0123','876 Oakwood Ln','USA','Seattle',8,1),(9,'noah.wilson@gmail.com','555-4567','432 Maple Ave','USA','Dallas',9,1);
/*!40000 ALTER TABLE `contactdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Smith'),(2,'Emily Watson'),(3,'William Brown'),(4,'Sophia Johnson'),(5,'Oliver Davis'),(6,'Emma Martinez'),(7,'Jacob Rodriguez'),(8,'Ava Wilson'),(9,'Ethan Garcia'),(10,'Mia Hernandez');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menucontent`
--

DROP TABLE IF EXISTS `menucontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menucontent` (
  `MenuID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  KEY `MenuID_fk_idx` (`MenuID`),
  KEY `MenuItemID_fk_idx` (`MenuItemID`),
  CONSTRAINT `MenuID_fk1` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MenuItemID_fk` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitems` (`MenuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menucontent`
--

LOCK TABLES `menucontent` WRITE;
/*!40000 ALTER TABLE `menucontent` DISABLE KEYS */;
INSERT INTO `menucontent` VALUES (1,1),(1,3),(1,5),(2,2),(2,4),(3,3),(3,5),(4,1),(4,4),(5,2),(5,5);
/*!40000 ALTER TABLE `menucontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `Course` varchar(45) DEFAULT NULL,
  `Starter` varchar(45) DEFAULT NULL,
  `Desert` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Main','Tacos','Churros'),(2,'Main','Pizza','Tiramisu'),(3,'Main','Kung Pao Chicken','Fortune Cookies'),(4,'Main','Butter Chicken','Gulab Jamun'),(5,'Main','Hamburger','Brownies');
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Mexican Food','Mexican'),(2,'Italian Food','Italian'),(3,'Chinese Food','Chinese'),(4,'Indian Food','Indian'),(5,'American Food','American');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  `OrderID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `OrderID_fk_idx` (`OrderID`),
  KEY `StaffID_fk_idx` (`StaffID`),
  CONSTRAINT `OrderID_fk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StaffID_fk` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
INSERT INTO `orderdeliverystatus` VALUES (1,'2023-03-16','Delivered',1,1),(2,'2023-03-17','Delivered',2,2),(3,'2023-03-18','In Progress',3,3),(4,'2023-03-19','Cancelled',4,4),(5,'2023-03-20','Delivered',5,5),(6,'2023-03-21','In Progress',6,1),(7,'2023-03-22','Cancelled',7,2),(8,'2023-03-23','Delivered',8,3),(9,'2023-03-24','In Progress',9,4),(10,'2023-03-25','Delivered',10,5);
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `MenuID` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `MenuID_fk_idx` (`MenuID`),
  KEY `CustomerID_fk_idx` (`CustomerID`),
  CONSTRAINT `CustomerID_fk1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `MenuID_fk` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-03-16',2,60.00,1,1),(2,'2023-03-17',3,70.00,2,2),(3,'2023-03-18',4,80.00,3,3),(4,'2023-03-19',2,65.00,4,4),(5,'2023-03-20',1,52.50,5,5),(6,'2023-03-21',3,67.00,1,6),(7,'2023-03-22',2,58.00,2,7),(8,'2023-03-23',4,84.00,3,8),(9,'2023-03-24',2,57.00,4,9),(10,'2023-03-25',1,50.00,5,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Waiter'),(2,'Chef'),(3,'Manager'),(4,'Bartender');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `RoleID` int NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `RoleID_fk_idx` (`RoleID`),
  CONSTRAINT `RoleID_fk` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Maria Hernandez',2500,1),(2,'David Lee',3000,2),(3,'Karen Williams',3500,3),(4,'Mark Johnson',4000,3),(5,'Lisa Davis',2800,1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 13:52:44
