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
/*Table structure for table `m_customer` */

DROP TABLE IF EXISTS `m_customer`;

CREATE TABLE `m_customer` (
  `M_CostumerID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `M_CostumerNumber` varchar(25) DEFAULT NULL COMMENT 'costumer''s number',
  `M_CostumerName` varchar(100) DEFAULT NULL COMMENT 'costumer''s name',
  `M_CostumerAddress` varchar(255) DEFAULT NULL COMMENT 'costumer''s address',
  `M_CostumerM_CityID` int(11) DEFAULT NULL COMMENT 'costumer''s city',
  `M_CostumerM_ContactID` int(11) DEFAULT NULL COMMENT 'costumer''s contact',
  `M_CostumerNote` text DEFAULT NULL COMMENT 'notes for the costumer',
  `M_CostumerS_UserID` int(11) NOT NULL DEFAULT 0 COMMENT 'whos input',
  `M_CostumerIsActive` char(1) DEFAULT 'Y' COMMENT 'active or not',
  `M_CostumerCreated` datetime DEFAULT current_timestamp() COMMENT 'when created',
  `M_CostumerLastUpdated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'when updated',
  PRIMARY KEY (`M_CostumerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
