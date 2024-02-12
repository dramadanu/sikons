/*
SQLyog Ultimate
MySQL - 10.9.8-MariaDB-log : Database - sibambo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `m_employee` */

DROP TABLE IF EXISTS `m_employee`;

CREATE TABLE `m_employee` (
  `M_EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `M_EmployeeM_PositionID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeCode` varchar(50) DEFAULT NULL,
  `M_EmployeeName` varchar(50) DEFAULT NULL,
  `M_EmployeeDOB` date DEFAULT NULL,
  `M_EmployeeAddress` varchar(255) DEFAULT NULL,
  `M_EmployeeM_CityID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeM_ContactID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeJoinDate` date DEFAULT NULL,
  `M_EmployeeNote` text DEFAULT NULL,
  `M_EmployeeS_UserID` int(11) NOT NULL DEFAULT 0,
  `M_EmployeeIsActive` char(1) NOT NULL DEFAULT 'Y',
  `M_EmployeeCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `M_EmployeeLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`M_EmployeeID`),
  KEY `M_EmployeeM_PosID` (`M_EmployeeM_PositionID`),
  KEY `M_EmployeeCode` (`M_EmployeeCode`),
  KEY `M_EmployeeName` (`M_EmployeeName`),
  KEY `M_EmployeeIsActive` (`M_EmployeeIsActive`),
  KEY `M_EmployeeM_ContactID` (`M_EmployeeM_ContactID`),
  KEY `M_EmployeeAddress` (`M_EmployeeAddress`),
  KEY `M_EmployeeJoinDate` (`M_EmployeeJoinDate`),
  KEY `M_EmployeeDOB` (`M_EmployeeDOB`),
  KEY `M_EmployeeS_UserID` (`M_EmployeeS_UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
