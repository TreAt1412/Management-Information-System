-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: sme
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `companyID` int NOT NULL,
  `role` int NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_company` (`username`,`companyID`,`email`),
  KEY `companyid_idx` (`companyID`),
  CONSTRAINT `companyid` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'dvanh','48690',1,0,'do@gmai');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accountID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountindex_idx` (`accountID`),
  CONSTRAINT `accountindex` FOREIGN KEY (`accountID`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountant`
--

LOCK TABLES `accountant` WRITE;
/*!40000 ALTER TABLE `accountant` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `taxNum` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `taxNum_UNIQUE` (`taxNum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'MISA 123','MISA','3939222','công ty Bánh kẹo');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `taxNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `bankAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wage` int NOT NULL,
  `companyID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyiddd_idx` (`companyID`),
  CONSTRAINT `companyiddd` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `good` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `goodCategory` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryindex_idx` (`goodCategory`),
  CONSTRAINT `categoryindex` FOREIGN KEY (`goodCategory`) REFERENCES `goodcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodcategory`
--

DROP TABLE IF EXISTS `goodcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodcategory`
--

LOCK TABLES `goodcategory` WRITE;
/*!40000 ALTER TABLE `goodcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbill`
--

DROP TABLE IF EXISTS `inbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `overBalanceID` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `overbalance_idx` (`overBalanceID`),
  CONSTRAINT `overbalance` FOREIGN KEY (`overBalanceID`) REFERENCES `overbalance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbill`
--

LOCK TABLES `inbill` WRITE;
/*!40000 ALTER TABLE `inbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accountID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountidex_idx` (`accountID`),
  CONSTRAINT `accountidex` FOREIGN KEY (`accountID`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbill`
--

DROP TABLE IF EXISTS `outbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receiver` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `overBalanceID` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `overban_idx` (`overBalanceID`),
  CONSTRAINT `overban` FOREIGN KEY (`overBalanceID`) REFERENCES `overbalance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbill`
--

LOCK TABLES `outbill` WRITE;
/*!40000 ALTER TABLE `outbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overbalance`
--

DROP TABLE IF EXISTS `overbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overbalance` (
  `id` int NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `bankName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `bankAccount` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `companyID` int NOT NULL,
  `offset` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyindex_idx` (`companyID`),
  CONSTRAINT `companyindex` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overbalance`
--

LOCK TABLES `overbalance` WRITE;
/*!40000 ALTER TABLE `overbalance` DISABLE KEYS */;
/*!40000 ALTER TABLE `overbalance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasebill`
--

DROP TABLE IF EXISTS `purchasebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasebill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sellerCode` varchar(45) NOT NULL,
  `sellerName` varchar(45) NOT NULL,
  `billCode` varchar(45) NOT NULL,
  `accountingDate` datetime NOT NULL,
  `voucherDate` datetime NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `reciever` varchar(45) DEFAULT NULL,
  `companyID` int NOT NULL,
  `overBalanceID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billCode_UNIQUE` (`billCode`),
  KEY `companyindex_idx` (`companyID`),
  KEY `overbalanceindex_idx` (`overBalanceID`),
  CONSTRAINT `company_purchase` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `overbalanceindex` FOREIGN KEY (`overBalanceID`) REFERENCES `overbalance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasebill`
--

LOCK TABLES `purchasebill` WRITE;
/*!40000 ALTER TABLE `purchasebill` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasedetail`
--

DROP TABLE IF EXISTS `purchasedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasedetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goodID` int NOT NULL,
  `quantity` int NOT NULL,
  `tax` decimal(2,0) NOT NULL,
  `purchaseID` int NOT NULL,
  `storageAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moneyAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_idx` (`purchaseID`),
  KEY `good_purchase_idx` (`goodID`),
  CONSTRAINT `good_purchase` FOREIGN KEY (`goodID`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase` FOREIGN KEY (`purchaseID`) REFERENCES `purchasebill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedetail`
--

LOCK TABLES `purchasedetail` WRITE;
/*!40000 ALTER TABLE `purchasedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellingbill`
--

DROP TABLE IF EXISTS `sellingbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellingbill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buyerCode` varchar(45) NOT NULL,
  `buyerName` varchar(45) NOT NULL,
  `billCode` varchar(45) NOT NULL,
  `accountingDate` datetime NOT NULL,
  `voucherDate` datetime NOT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `seller` varchar(45) DEFAULT NULL,
  `companyID` int NOT NULL,
  `overBalanceID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billCode_UNIQUE` (`billCode`),
  KEY `company_selling_idx` (`companyID`),
  KEY `overbalcend_idx` (`overBalanceID`),
  CONSTRAINT `company_selling` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `overbalcend` FOREIGN KEY (`overBalanceID`) REFERENCES `overbalance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellingbill`
--

LOCK TABLES `sellingbill` WRITE;
/*!40000 ALTER TABLE `sellingbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellingbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellingdetail`
--

DROP TABLE IF EXISTS `sellingdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellingdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goodID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `tax` decimal(2,0) DEFAULT NULL,
  `sellingID` int DEFAULT NULL,
  `storageAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moneyAccount` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_idx` (`sellingID`),
  KEY `goodindex2_idx` (`goodID`),
  CONSTRAINT `goodindex2` FOREIGN KEY (`goodID`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selling` FOREIGN KEY (`sellingID`) REFERENCES `sellingbill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellingdetail`
--

LOCK TABLES `sellingdetail` WRITE;
/*!40000 ALTER TABLE `sellingdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellingdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagetable`
--

DROP TABLE IF EXISTS `wagetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagetable` (
  `id` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `totalMoney` int NOT NULL,
  `date` datetime NOT NULL,
  `status` int NOT NULL,
  `companyID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyyy_idx` (`companyID`),
  CONSTRAINT `companyyy` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagetable`
--

LOCK TABLES `wagetable` WRITE;
/*!40000 ALTER TABLE `wagetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagetabledetail`
--

DROP TABLE IF EXISTS `wagetabledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wagetabledetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `wage` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagetabledetail`
--

LOCK TABLES `wagetabledetail` WRITE;
/*!40000 ALTER TABLE `wagetabledetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagetabledetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 19:23:36
