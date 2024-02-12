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
/*Table structure for table `m_contact` */

DROP TABLE IF EXISTS `m_contact`;

CREATE TABLE `m_contact` (
  `M_ContactID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `M_ContactName` varchar(100) DEFAULT NULL COMMENT 'contact''s name',
  `M_ContactDetails` varchar(255) DEFAULT NULL COMMENT 'contact''s detail',
  `M_ContactNotes` varchar(255) DEFAULT NULL COMMENT 'notes for the contact',
  `M_ContactS_UserID` int(11) NOT NULL DEFAULT 0 COMMENT 'whos input',
  `M_ContactIsActive` char(1) NOT NULL DEFAULT 'Y' COMMENT 'active or not',
  `M_ContactCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'when created',
  `M_ContactLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'when updated',
  PRIMARY KEY (`M_ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
