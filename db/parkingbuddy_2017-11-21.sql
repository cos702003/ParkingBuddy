# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 0.0.0.0 (MySQL 5.7.20)
# Database: parkingbuddy
# Generation Time: 2017-11-21 15:27:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ar_internal_metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ar_internal_metadata`;

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`)
VALUES
	('environment','development','2017-11-19 22:39:11','2017-11-19 22:39:11');

/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CamList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CamList`;

CREATE TABLE `CamList` (
  `Cam_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cam_Name` varchar(10) DEFAULT NULL,
  `Video_Type` varchar(3) DEFAULT NULL,
  `Resolution` varchar(9) DEFAULT NULL,
  `Frame_Per_Second` int(11) DEFAULT NULL,
  `L_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cam_ID`),
  KEY `L_ID_idx` (`L_ID`),
  CONSTRAINT `L_ID` FOREIGN KEY (`L_ID`) REFERENCES `LotList` (`Lot_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CamList` WRITE;
/*!40000 ALTER TABLE `CamList` DISABLE KEYS */;

INSERT INTO `CamList` (`Cam_ID`, `Cam_Name`, `Video_Type`, `Resolution`, `Frame_Per_Second`, `L_ID`)
VALUES
	(1,'cam1','mp4','1080',30,1),
	(2,'cam2','mp4','1080',30,1),
	(3,'cam3','mp4','1080',30,1),
	(4,'cam4','mp4','1080',30,2),
	(5,'cam5','mp4','1080',30,2),
	(6,'cam6','mp4','1080',30,3),
	(7,'cam7','mp4','1080',30,3);

/*!40000 ALTER TABLE `CamList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table car_counts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `car_counts`;

CREATE TABLE `car_counts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Count_Log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Count_Log`;

CREATE TABLE `Count_Log` (
  `Log_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `Lot_ID` int(11) DEFAULT NULL,
  `Cam_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Log_ID`),
  UNIQUE KEY `Log_ID_UNIQUE` (`Log_ID`),
  KEY `Lot_ID_idx` (`Lot_ID`),
  KEY `Cam_ID_idx` (`Cam_ID`),
  CONSTRAINT `Cam_ID` FOREIGN KEY (`Cam_ID`) REFERENCES `CamList` (`Cam_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Lot_ID` FOREIGN KEY (`Lot_ID`) REFERENCES `LotList` (`Lot_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Count_Log` WRITE;
/*!40000 ALTER TABLE `Count_Log` DISABLE KEYS */;

INSERT INTO `Count_Log` (`Log_ID`, `TimeStamp`, `Count`, `Lot_ID`, `Cam_ID`)
VALUES
	(1,'2017-11-17 12:00:00',49,1,1),
	(2,'2017-11-17 12:00:01',4,1,2),
	(3,'2017-11-17 12:00:02',0,1,3),
	(4,'2017-11-17 12:00:03',24,2,4),
	(5,'2017-11-17 12:00:04',44,2,5),
	(6,'2017-11-17 12:00:01',256,3,6),
	(7,'2017-11-17 12:00:10',123,3,7),
	(8,'2017-11-17 20:00:00',54,1,1),
	(9,'2017-11-17 20:00:01',55,1,2),
	(10,'2017-11-17 20:00:02',20,1,3),
	(11,'2017-11-17 20:00:04',25,2,4),
	(12,'2017-11-17 20:00:10',67,2,5),
	(13,'2017-11-17 20:00:55',240,3,6),
	(15,'2017-12-17 04:00:20',0,1,1),
	(16,'2017-12-17 04:01:33',0,2,4),
	(17,'2017-12-17 04:00:02',450,3,7),
	(18,'2017-12-17 04:00:20',0,1,2),
	(19,'2017-12-17 04:00:20',0,1,3),
	(20,'2017-12-17 04:00:20',0,2,5),
	(21,'2017-12-17 04:00:20',0,3,6);

/*!40000 ALTER TABLE `Count_Log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LotList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LotList`;

CREATE TABLE `LotList` (
  `Lot_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Lot_Name` varchar(25) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Space_Type` varchar(20) DEFAULT NULL,
  `Space_Position` varchar(7) DEFAULT NULL,
  `Lot_Template` blob,
  `Address` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `File` varchar(45) NOT NULL,
  PRIMARY KEY (`Lot_ID`,`File`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `LotList` WRITE;
/*!40000 ALTER TABLE `LotList` DISABLE KEYS */;

INSERT INTO `LotList` (`Lot_ID`, `Lot_Name`, `Capacity`, `Space_Type`, `Space_Position`, `Lot_Template`, `Address`, `City`, `ZipCode`, `File`)
VALUES
	(1,'C-Science',250,'car','line',NULL,NULL,NULL,44240,'file.mp4'),
	(2,'MSC',100,'car','line',NULL,NULL,NULL,44240,'file.mp4'),
	(3,'Stadium',1000,'car','line',NULL,NULL,NULL,44240,'file.mp4');

/*!40000 ALTER TABLE `LotList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20171119223341');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `user_ID` varchar(15) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `access_Time` datetime DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`user_ID`, `name`, `access_Time`, `role`)
VALUES
	('admin','admin',NULL,'admin');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
