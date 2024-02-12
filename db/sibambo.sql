-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sibambo
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `m_employee`
--

DROP TABLE IF EXISTS `m_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_employee` (
  `M_EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `M_EmployeeM_PositionID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeS_CompanyID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeCode` varchar(50) DEFAULT NULL,
  `M_EmployeeName` varchar(50) DEFAULT NULL,
  `M_EmployeeDOB` date DEFAULT NULL,
  `M_EmployeeAddress` varchar(255) DEFAULT NULL,
  `M_EmployeeM_CityID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeM_ContactID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeJoinDate` date DEFAULT NULL,
  `M_EmployeeNote` varchar(255) DEFAULT NULL,
  `M_EmployeeS_UserID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeIsActive` char(1) NOT NULL DEFAULT 'Y',
  `M_EmployeeCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `M_EmployeeLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`M_EmployeeID`),
  KEY `M_EmployeeM_PosID` (`M_EmployeeM_PositionID`),
  KEY `M_EmployeeS_CompanyID` (`M_EmployeeS_CompanyID`),
  KEY `M_EmployeeCode` (`M_EmployeeCode`),
  KEY `M_EmployeeName` (`M_EmployeeName`),
  KEY `M_EmployeeIsActive` (`M_EmployeeIsActive`),
  KEY `M_EmployeeM_ContactID` (`M_EmployeeM_ContactID`),
  KEY `M_EmployeeAddress` (`M_EmployeeAddress`),
  KEY `M_EmployeeJoinDate` (`M_EmployeeJoinDate`),
  KEY `M_EmployeeDOB` (`M_EmployeeDOB`),
  KEY `M_EmployeeS_UserID` (`M_EmployeeS_UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_employee`
--

LOCK TABLES `m_employee` WRITE;
/*!40000 ALTER TABLE `m_employee` DISABLE KEYS */;
INSERT INTO `m_employee` VALUES (1,1,1,'A','Ady Saputro','2020-11-26','Cikadut',60,2,'2023-07-01','Mas Ady ok',1,'Y','2023-06-22 10:52:33','2023-11-09 12:29:38');
/*!40000 ALTER TABLE `m_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_position`
--

DROP TABLE IF EXISTS `m_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_position` (
  `M_PositionID` int(11) NOT NULL AUTO_INCREMENT,
  `M_PositionS_CompanyID` int(11) NOT NULL DEFAULT 0,
  `M_PositionCode` varchar(25) DEFAULT NULL,
  `M_PositionName` varchar(50) DEFAULT NULL,
  `M_PositionNote` varchar(255) DEFAULT NULL,
  `M_PositionIsActive` char(1) NOT NULL DEFAULT 'Y',
  `M_PositionCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `M_PositionLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`M_PositionID`),
  KEY `M_PositionS_CompanyID` (`M_PositionS_CompanyID`),
  KEY `M_PositionCode` (`M_PositionCode`),
  KEY `M_PositionName` (`M_PositionName`),
  KEY `M_PositionIsActive` (`M_PositionIsActive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_position`
--

LOCK TABLES `m_position` WRITE;
/*!40000 ALTER TABLE `m_position` DISABLE KEYS */;
INSERT INTO `m_position` VALUES (1,0,'01','Direktur Utama','Ok','Y','2024-01-02 10:05:31','2024-01-02 11:03:21');
/*!40000 ALTER TABLE `m_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_company`
--

DROP TABLE IF EXISTS `s_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_company` (
  `S_CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `S_CompanyCode` varchar(64) DEFAULT NULL,
  `S_CompanyName` varchar(100) DEFAULT NULL,
  `S_CompanyIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_CompanyCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_CompanyLastUpdated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`S_CompanyID`),
  KEY `S_CompanyCode` (`S_CompanyCode`),
  KEY `S_CompanyName` (`S_CompanyName`),
  KEY `S_CompanyIsActive` (`S_CompanyIsActive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_company`
--

LOCK TABLES `s_company` WRITE;
/*!40000 ALTER TABLE `s_company` DISABLE KEYS */;
INSERT INTO `s_company` VALUES (1,'4d04436c1fde54f24348bc5b8cc821eb','DEFAULT','Y','2023-06-19 22:02:14','2023-06-19 22:02:14');
/*!40000 ALTER TABLE `s_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_conf`
--

DROP TABLE IF EXISTS `s_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_conf` (
  `S_ConfID` int(11) NOT NULL AUTO_INCREMENT,
  `S_ConfCompanyName` varchar(100) DEFAULT NULL,
  `S_ConfCompanyAddress` varchar(2000) DEFAULT NULL,
  `S_ConfCompanyPhones` varchar(255) DEFAULT NULL,
  `S_ConfCompanyEmail` varchar(100) DEFAULT NULL,
  `S_ConfPIC` varchar(2000) DEFAULT NULL,
  `S_ConfPPN` double NOT NULL DEFAULT 10,
  `S_ConfSiteName` varchar(50) DEFAULT NULL,
  `S_ConfIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_ConfCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_ConfLastUpdate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`S_ConfID`),
  KEY `S_ConfIsActive` (`S_ConfIsActive`),
  KEY `S_ConfPPN` (`S_ConfPPN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_conf`
--

LOCK TABLES `s_conf` WRITE;
/*!40000 ALTER TABLE `s_conf` DISABLE KEYS */;
INSERT INTO `s_conf` VALUES (1,'SIBAMBO','[{\"name\":\"Office\",\"address\":\"Jl. Mande Raya No. 26 Cikadut Cicaheum Bandung\"},{\"name\":\"Jakarta 1\",\"address\":\"Jl. Kemanggisan Pulo I No. 6 Palmerah Jakarta Barat\"},{\"name\":\"Jakarta 2\",\"address\":\"Jl. Tanah Merdeka No. 80B RT 15 / RW 05 Rambutan, Ciracas Jakarta Timur\"}]','[{\"name\":\"Phone / Fax\",\"number\":\"+62(22) 7238019\"},{\"name\":\"Mobile Phone\",\"number\":\"-\"}]','adywater@gmail.com','{\"delivery\":{\"ack\":21,\"admin\":24},\"invoice\":{\"ack\":25,\"admin\":22}}',11,'Ady Water','Y','2021-09-11 15:59:20','2024-01-02 10:05:02');
/*!40000 ALTER TABLE `s_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_menu` (
  `S_MenuID` int(11) NOT NULL AUTO_INCREMENT,
  `S_MenuCode` varchar(25) DEFAULT NULL,
  `S_MenuName` varchar(50) DEFAULT NULL,
  `S_MenuUrl` varchar(100) DEFAULT NULL,
  `S_MenuLeft` int(11) NOT NULL DEFAULT 0,
  `S_MenuRight` int(11) NOT NULL DEFAULT 0,
  `S_MenuLevel` int(11) NOT NULL DEFAULT 1,
  `S_MenuIcon` varchar(25) DEFAULT NULL,
  `S_MenuIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_MenuCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_MenuLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`S_MenuID`),
  KEY `S_MenuCode` (`S_MenuCode`),
  KEY `S_MenuName` (`S_MenuName`),
  KEY `S_MenuUrl` (`S_MenuUrl`),
  KEY `S_MenuLeft` (`S_MenuLeft`),
  KEY `S_MenuRight` (`S_MenuRight`),
  KEY `S_MenuIsActive` (`S_MenuIsActive`),
  KEY `S_MenuLevel` (`S_MenuLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_menu`
--

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;
INSERT INTO `s_menu` VALUES (1,NULL,'Dashboard','/d',1,2,1,'mdi-monitor-dashboard','Y','2023-06-19 22:20:54','2023-06-28 09:32:48'),(2,NULL,'Masterdata','#',21,40,1,'mdi-monitor-dashboard','Y','2023-06-19 22:21:33','2023-06-27 11:01:27'),(4,NULL,'Jabatan','/master/position',24,25,2,NULL,'Y','2023-06-19 22:22:03','2024-01-02 10:04:00');
/*!40000 ALTER TABLE `s_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_privilege`
--

DROP TABLE IF EXISTS `s_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_privilege` (
  `S_PrivilegeID` int(11) NOT NULL AUTO_INCREMENT,
  `S_PrivilegeS_UserGroupID` int(11) NOT NULL DEFAULT 0,
  `S_PrivilegeS_MenuID` int(11) NOT NULL DEFAULT 0,
  `S_PrivilegeOptions` varchar(255) DEFAULT NULL,
  `S_PrivilegeIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_PrivilegeCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_PrivilegeLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`S_PrivilegeID`),
  KEY `S_PrivilegeS_UserGroupID` (`S_PrivilegeS_UserGroupID`),
  KEY `S_PrivilegeS_MenuID` (`S_PrivilegeS_MenuID`),
  KEY `S_PrivilegeIsActive` (`S_PrivilegeIsActive`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_privilege`
--

LOCK TABLES `s_privilege` WRITE;
/*!40000 ALTER TABLE `s_privilege` DISABLE KEYS */;
INSERT INTO `s_privilege` VALUES (1,1,1,NULL,'Y','2023-06-27 10:20:23','2023-06-27 14:17:26'),(3,1,4,NULL,'Y','2023-06-27 10:20:23','2023-06-27 14:23:12');
/*!40000 ALTER TABLE `s_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user` (
  `S_UserID` int(11) NOT NULL AUTO_INCREMENT,
  `S_UserS_UserGroupID` int(11) NOT NULL DEFAULT 0,
  `S_UserS_CompanyID` int(11) NOT NULL DEFAULT 0,
  `S_UserUsername` varchar(25) DEFAULT NULL,
  `S_UserPassword` varchar(80) DEFAULT NULL,
  `S_UserPasswordDev` varchar(80) DEFAULT NULL,
  `S_UserFullName` varchar(100) DEFAULT NULL,
  `S_UserIsLogin` char(1) NOT NULL DEFAULT 'N',
  `S_UserLastLogin` datetime DEFAULT NULL,
  `S_UserLastUsed` datetime DEFAULT NULL,
  `S_UserToken` varchar(2000) DEFAULT NULL,
  `S_UserM_TagID` int(11) NOT NULL DEFAULT 0,
  `S_UserIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_UserCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_UserLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`S_UserID`),
  KEY `S_UserUsername` (`S_UserUsername`),
  KEY `S_UserPassword` (`S_UserPassword`),
  KEY `S_UserIsLogin` (`S_UserIsLogin`),
  KEY `S_UserLastLogin` (`S_UserLastLogin`),
  KEY `S_UserIsActive` (`S_UserIsActive`),
  KEY `S_UserS_UserGroupID` (`S_UserS_UserGroupID`),
  KEY `S_UserLastUsed` (`S_UserLastUsed`),
  KEY `S_UserM_TagID` (`S_UserM_TagID`),
  KEY `S_UserS_CompanyID` (`S_UserS_CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user`
--

LOCK TABLES `s_user` WRITE;
/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;
INSERT INTO `s_user` VALUES (1,1,1,'admin','*F82D171544019C4AEB3D26B7AEBA9904FD54B69E','*5D36795B3151469CC53D235CF881C9A98EC8BEAD','Admin','N','2024-01-02 11:03:21',NULL,NULL,0,'Y','2023-06-19 22:05:14','2024-01-02 11:03:21');
/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_usergroup`
--

DROP TABLE IF EXISTS `s_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_usergroup` (
  `S_UserGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `S_UserGroupCode` varchar(25) DEFAULT NULL,
  `S_UserGroupName` varchar(50) DEFAULT NULL,
  `S_UserGroupDashboard` varchar(255) DEFAULT NULL,
  `S_UserGroupIsActive` char(1) NOT NULL DEFAULT 'Y',
  `S_UserGroupCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `S_UserGroupLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`S_UserGroupID`),
  KEY `S_UserGroupCode` (`S_UserGroupCode`),
  KEY `S_UserGroupName` (`S_UserGroupName`),
  KEY `S_UserGroupIsActive` (`S_UserGroupIsActive`),
  KEY `S_UserGroupDashboard` (`S_UserGroupDashboard`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_usergroup`
--

LOCK TABLES `s_usergroup` WRITE;
/*!40000 ALTER TABLE `s_usergroup` DISABLE KEYS */;
INSERT INTO `s_usergroup` VALUES (1,'ONE.GROUP.SA','Super Admin',NULL,'Y','2023-06-19 17:18:32','2023-06-19 17:18:32'),(2,'ONE.GROUP.EMPLOYEE','Karyawan',NULL,'Y','2023-06-19 17:18:32','2023-06-19 17:18:32');
/*!40000 ALTER TABLE `s_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sibambo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 11:11:29
