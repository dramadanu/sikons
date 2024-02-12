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
/*Table structure for table `m_vendor` */

DROP TABLE IF EXISTS `m_vendor`;

CREATE TABLE `m_vendor` (
  `M_VendorID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `M_VendorNumber` varchar(50) DEFAULT NULL COMMENT 'vendor''s number',
  `M_VendorName` varchar(100) DEFAULT NULL COMMENT 'vendor''s name',
  `M_VendorAddress` varchar(255) DEFAULT NULL COMMENT 'vendor''s address',
  `M_VendorM_CityID` int(11) DEFAULT NULL COMMENT 'vendor''s city',
  `M_VendorM_ContactID` int(11) DEFAULT NULL COMMENT 'vendor''s contact',
  `M_VendorS_UserID` int(11) NOT NULL DEFAULT 0 COMMENT 'whos input',
  `M_VendorIsActive` char(1) NOT NULL DEFAULT 'Y' COMMENT 'active or not',
  `M_VendorCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'when created',
  `M_VendorLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'when updated',
  PRIMARY KEY (`M_VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
