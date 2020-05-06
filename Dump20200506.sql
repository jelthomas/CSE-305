CREATE DATABASE  IF NOT EXISTS `jelthomas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jelthomas`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: mysql4.cs.stonybrook.edu    Database: jelthomas
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `AdvPurchaseDiscount`
--

DROP TABLE IF EXISTS `AdvPurchaseDiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdvPurchaseDiscount` (
  `AirlineID` char(2) NOT NULL,
  `Days` int(11) NOT NULL,
  `DiscountRate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`AirlineID`,`Days`),
  CONSTRAINT `fk_adv_airline_id` FOREIGN KEY (`AirlineID`) REFERENCES `Airline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvPurchaseDiscount`
--

LOCK TABLES `AdvPurchaseDiscount` WRITE;
/*!40000 ALTER TABLE `AdvPurchaseDiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvPurchaseDiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airline` (
  `Id` char(2) NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline`
--

LOCK TABLES `Airline` WRITE;
/*!40000 ALTER TABLE `Airline` DISABLE KEYS */;
INSERT INTO `Airline` VALUES ('AA','AmericanAirlines'),('AI','AirIndia'),('DE','Delta'),('SW','SouthWest');
/*!40000 ALTER TABLE `Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `Id` char(3) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('IGI','Indira Gandhi International','Delhi','India'),('JFK','John F Kennedy','Queens','USA'),('LAX','Los Angeles International','Los Angeles','USA'),('LGA','LaGuardia','Queens','USA'),('MIA','Miami International','Miami','USA');
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auctions`
--

DROP TABLE IF EXISTS `Auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auctions` (
  `AccountNo` int(11) NOT NULL,
  `AirlineID` char(2) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `Class` varchar(20) NOT NULL,
  `Date` datetime NOT NULL,
  `NYOP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`AccountNo`,`AirlineID`,`FlightNo`,`Class`,`Date`),
  KEY `fk_auc_airline_flight_no` (`AirlineID`,`FlightNo`),
  CONSTRAINT `fk_auc_acct_no` FOREIGN KEY (`AccountNo`) REFERENCES `Customer` (`AccountNo`),
  CONSTRAINT `fk_auc_airline_flight_no` FOREIGN KEY (`AirlineID`, `FlightNo`) REFERENCES `Flight` (`AirlineID`, `FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auctions`
--

LOCK TABLES `Auctions` WRITE;
/*!40000 ALTER TABLE `Auctions` DISABLE KEYS */;
INSERT INTO `Auctions` VALUES (10018,'AA',111,'First','2020-05-05 21:48:14',10.00),(10018,'AA',111,'First','2020-05-05 21:48:28',15.00);
/*!40000 ALTER TABLE `Auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Id` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL AUTO_INCREMENT,
  `CreditCardNo` varchar(20) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountNo`),
  KEY `fk_cust_id` (`Id`),
  CONSTRAINT `fk_cust_id` FOREIGN KEY (`Id`) REFERENCES `person` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (10017,10017,'9999-8888-6666-3333','2020-05-02',198),(10018,10018,'4444-3333-2222-1111','2020-05-04',100);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerPreferences`
--

DROP TABLE IF EXISTS `CustomerPreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerPreferences` (
  `AccountNo` int(11) NOT NULL,
  `Preference` varchar(50) NOT NULL,
  PRIMARY KEY (`AccountNo`,`Preference`),
  CONSTRAINT `fk_acct_no` FOREIGN KEY (`AccountNo`) REFERENCES `Customer` (`AccountNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerPreferences`
--

LOCK TABLES `CustomerPreferences` WRITE;
/*!40000 ALTER TABLE `CustomerPreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerPreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Id` int(11) NOT NULL,
  `SSN` varchar(11) NOT NULL,
  `IsManager` tinyint(1) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `fk_emp_id` (`Id`),
  CONSTRAINT `fk_emp_id` FOREIGN KEY (`Id`) REFERENCES `Person` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (9999,'001112112',1,'2020-01-01',50.00),(10007,'009122234',0,'2020-01-03',16.00);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fare`
--

DROP TABLE IF EXISTS `Fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fare` (
  `AirlineID` char(2) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `FareType` varchar(20) NOT NULL,
  `Class` varchar(20) NOT NULL,
  `Fare` decimal(10,2) NOT NULL,
  PRIMARY KEY (`AirlineID`,`FlightNo`,`FareType`,`Class`),
  CONSTRAINT `fk_fare_airline_flight` FOREIGN KEY (`AirlineID`, `FlightNo`) REFERENCES `Flight` (`AirlineID`, `FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fare`
--

LOCK TABLES `Fare` WRITE;
/*!40000 ALTER TABLE `Fare` DISABLE KEYS */;
INSERT INTO `Fare` VALUES ('AA',103,'oneway','Basic',75.00),('AA',103,'oneway','Economy',95.00),('AA',103,'oneway','First',135.00),('DE',101,'oneway','Basic',100.00),('DE',101,'oneway','Economy',120.00),('DE',101,'oneway','First',200.00),('DE',105,'oneway','Basic',50.00),('DE',106,'oneway','Basic',100.01),('DE',106,'oneway','Economy',120.01),('DE',106,'oneway','First',120.01),('DE',107,'oneway','Basic',200.01),('DE',107,'oneway','Economy',215.01),('DE',107,'oneway','First',235.01),('SW',100,'roundtrip','Basic',200.00),('SW',100,'roundtrip','Economy',300.00),('SW',100,'roundtrip','First',400.00),('SW',104,'oneway','Basic',150.00),('SW',104,'oneway','Economy',170.00),('SW',104,'oneway','First',190.00);
/*!40000 ALTER TABLE `Fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight` (
  `AirlineID` char(2) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `NoOfSeats` int(11) NOT NULL,
  `DaysOperating` char(7) NOT NULL,
  `MinLengthOfStay` int(11) NOT NULL,
  `MaxLengthOfStay` int(11) NOT NULL,
  PRIMARY KEY (`AirlineID`,`FlightNo`),
  CONSTRAINT `fk_flight_airline_id` FOREIGN KEY (`AirlineID`) REFERENCES `Airline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES ('AA',103,140,'0101010',1,8),('AA',111,135,'1111011',1,7),('DE',101,120,'0100010',2,7),('DE',105,132,'1111110',1,12),('DE',106,129,'1010101',1,8),('DE',107,129,'1010101',1,8),('SW',100,192,'0010100',3,14),('SW',102,192,'0010100',3,14),('SW',104,150,'1010011',2,4);
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Includes`
--

DROP TABLE IF EXISTS `Includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Includes` (
  `ResrNo` int(11) NOT NULL,
  `AirlineID` char(2) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `LegNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ResrNo`,`AirlineID`,`FlightNo`,`LegNo`),
  KEY `fk_inc_id_flight_leg` (`AirlineID`,`FlightNo`,`LegNo`),
  CONSTRAINT `fk_inc_id_flight_leg` FOREIGN KEY (`AirlineID`, `FlightNo`, `LegNo`) REFERENCES `Leg` (`AirlineID`, `FlightNo`, `LegNo`),
  CONSTRAINT `fk_inc_res_no` FOREIGN KEY (`ResrNo`) REFERENCES `Reservation` (`ResrNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Includes`
--

LOCK TABLES `Includes` WRITE;
/*!40000 ALTER TABLE `Includes` DISABLE KEYS */;
INSERT INTO `Includes` VALUES (45370465,'SW',104,104,'2020-06-07'),(141166569,'AA',103,103,'2020-07-01'),(537046976,'AA',103,103,'2020-07-01'),(655525642,'DE',101,100,'2020-01-03'),(709829297,'SW',100,101,'2020-02-04'),(709829297,'SW',102,102,'2020-02-11'),(758143992,'DE',106,106,'2020-05-17'),(758143992,'DE',107,107,'2020-05-24');
/*!40000 ALTER TABLE `Includes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leg`
--

DROP TABLE IF EXISTS `Leg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leg` (
  `AirlineID` char(2) NOT NULL,
  `FlightNo` int(11) NOT NULL,
  `LegNo` int(11) NOT NULL,
  `DepAirportID` char(3) NOT NULL,
  `ArrAirportID` char(3) NOT NULL,
  `ArrTime` datetime NOT NULL,
  `DepTime` datetime NOT NULL,
  `ActualArrTime` datetime DEFAULT NULL,
  `ActualDepTime` datetime DEFAULT NULL,
  PRIMARY KEY (`AirlineID`,`FlightNo`,`LegNo`),
  UNIQUE KEY `AirlineID` (`AirlineID`,`FlightNo`,`DepAirportID`),
  KEY `fk_leg_dep_airport` (`DepAirportID`),
  KEY `fk_leg_arr_airport` (`ArrAirportID`),
  CONSTRAINT `fk_leg_airline_flight` FOREIGN KEY (`AirlineID`, `FlightNo`) REFERENCES `Flight` (`AirlineID`, `FlightNo`),
  CONSTRAINT `fk_leg_arr_airport` FOREIGN KEY (`ArrAirportID`) REFERENCES `Airport` (`Id`),
  CONSTRAINT `fk_leg_dep_airport` FOREIGN KEY (`DepAirportID`) REFERENCES `Airport` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leg`
--

LOCK TABLES `Leg` WRITE;
/*!40000 ALTER TABLE `Leg` DISABLE KEYS */;
INSERT INTO `Leg` VALUES ('AA',103,103,'JFK','MIA','2020-07-01 10:30:00','2020-07-01 09:00:00','2020-07-01 10:45:00','2020-07-01 09:00:00'),('DE',101,100,'LGA','IGI','2020-01-03 13:00:00','2020-01-03 10:00:00','2020-01-03 13:00:00','2020-01-03 10:30:00'),('DE',105,105,'MIA','IGI','2020-05-12 08:00:00','2020-05-12 05:00:00','2020-05-12 08:00:00','2020-05-12 05:00:00'),('DE',106,106,'LGA','MIA','2020-05-17 07:00:00','2020-05-17 05:30:00','2020-05-17 07:00:00','2020-05-17 05:30:00'),('DE',107,107,'MIA','LAX','2020-05-24 07:00:00','2020-05-24 05:30:00','2020-05-24 07:00:00','2020-05-24 05:30:00'),('SW',100,101,'JFK','LAX','2020-02-04 15:00:00','2020-02-04 13:00:00','2020-02-04 15:00:00','2020-02-04 13:00:00'),('SW',102,102,'LAX','JFK','2020-02-11 15:00:00','2020-02-11 13:00:00','2020-02-11 15:00:00','2020-02-11 13:00:00'),('SW',104,104,'MIA','LAX','2020-06-07 14:00:00','2020-06-07 11:00:00','2020-06-07 14:00:00','2020-06-07 11:00:00');
/*!40000 ALTER TABLE `Leg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `Id` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`AccountNo`),
  KEY `fk_pass_acct_no` (`AccountNo`),
  CONSTRAINT `fk_pass_acct_no` FOREIGN KEY (`AccountNo`) REFERENCES `Customer` (`AccountNo`),
  CONSTRAINT `fk_pass_id` FOREIGN KEY (`Id`) REFERENCES `Person` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (10017,10017),(10018,10018);
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `ZipCode` varchar(11) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Role` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10023 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (9999,'Steve','Miller','123 One Street','Manchester','Vermont','05255','pass','steve.miller@gmail.com','Manager'),(10007,'Hernan','Zavala','101','Manchester','Vermont','05255','ok','hernan@gmail.com','Employee'),(10017,'Manav','Sehgal','101 Sehgal Street','Manchester','Vermont','05255','manav','manav@gmail.com','Customer'),(10018,'Jerry','Thomas','1456','Stony','New York','11790','pass','jerry@gmail.com','Customer');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `ResrNo` int(11) NOT NULL,
  `ResrDate` date DEFAULT NULL,
  `BookingFee` decimal(10,2) NOT NULL,
  `TotalFare` decimal(10,2) NOT NULL,
  `RepSSN` varchar(11) DEFAULT NULL,
  `AccountNo` int(11) NOT NULL,
  PRIMARY KEY (`ResrNo`),
  KEY `fk_res_acc_no` (`AccountNo`),
  KEY `fk_res_rep_ssn` (`RepSSN`),
  CONSTRAINT `fk_res_acc_no` FOREIGN KEY (`AccountNo`) REFERENCES `Customer` (`AccountNo`),
  CONSTRAINT `fk_res_rep_ssn` FOREIGN KEY (`RepSSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (45370465,'2020-05-05',19.00,209.00,NULL,10018),(141166569,'2020-05-05',9.50,104.50,NULL,10017),(537046976,'2020-05-05',9.50,104.50,NULL,10018),(655525642,'2020-05-05',10.00,110.00,'009122234',10017),(709829297,'2020-05-05',20.00,220.00,'009122234',10018),(758143992,'2020-05-05',35.50,390.52,NULL,10017);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationPassenger`
--

DROP TABLE IF EXISTS `ReservationPassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReservationPassenger` (
  `ResrNo` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  `SeatNo` char(5) NOT NULL,
  `Class` varchar(20) NOT NULL,
  `Meal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ResrNo`,`Id`,`AccountNo`),
  KEY `fk_resPass_id_acct_no` (`Id`,`AccountNo`),
  CONSTRAINT `fk_resPass_id_acct_no` FOREIGN KEY (`Id`, `AccountNo`) REFERENCES `Passenger` (`Id`, `AccountNo`),
  CONSTRAINT `fk_resPass_res_no` FOREIGN KEY (`ResrNo`) REFERENCES `Reservation` (`ResrNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationPassenger`
--

LOCK TABLES `ReservationPassenger` WRITE;
/*!40000 ALTER TABLE `ReservationPassenger` DISABLE KEYS */;
INSERT INTO `ReservationPassenger` VALUES (45370465,10018,10018,'1A','First','Lollypop'),(141166569,10017,10017,'10L','Economy','Pork'),(537046976,10018,10018,'1A','Economy','Cheese'),(655525642,10017,10017,'10A','First','Steak'),(709829297,10018,10018,'10A','First','Steak'),(758143992,10017,10017,'10A','First','Slab O\' Meat');
/*!40000 ALTER TABLE `ReservationPassenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 14:10:50
