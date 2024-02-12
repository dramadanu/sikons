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
/*Table structure for table `m_contactdetail` */

DROP TABLE IF EXISTS `m_contactdetail`;

CREATE TABLE `m_contactdetail` (
  `M_ContactDetailID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `M_ContactDetailM_ContactID` int(11) DEFAULT NULL COMMENT 'contact''s id',
  `M_ContactDetailType` char(1) DEFAULT 'P' COMMENT 'type of contact',
  `M_ContactDetailDesc` varchar(50) DEFAULT NULL COMMENT 'description',
  `M_ContactDetailS_UserID` int(11) NOT NULL DEFAULT 0 COMMENT 'whos input',
  `M_ContactDetailIsActive` char(1) NOT NULL DEFAULT 'Y' COMMENT 'active or not',
  `M_ContactDetailCreated` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'when created',
  `M_ContactDetailLastUpdated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'when updated',
  PRIMARY KEY (`M_ContactDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
