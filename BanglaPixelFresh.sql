-- --------------------------------------------------------
-- Host:                         sp-01.pma.rocketnode.net
-- Server version:               10.6.12-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for s879692_banglapixel
DROP DATABASE IF EXISTS `banglapixel_db`;
CREATE DATABASE IF NOT EXISTS `banglapixel_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `banglapixel_db`;

-- Dumping structure for table s879692_banglapixel.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.apartments: ~23 rows (approximately)
DELETE FROM `apartments`;
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(284, 'apartment15538', 'apartment1', 'South Rockford Drive 5538', 'BPM27715'),
	(285, 'apartment34887', 'apartment3', 'Integrity Way 4887', 'IAA44370'),
	(286, 'apartment49560', 'apartment4', 'Tinsel Towers 9560', 'OQO35854'),
	(287, 'apartment54123', 'apartment5', 'Fantastic Plaza 4123', 'ZHU89190'),
	(288, 'apartment12884', 'apartment1', 'South Rockford Drive 2884', 'BWP17481'),
	(289, 'apartment37219', 'apartment3', 'Integrity Way 7219', 'TRQ74282'),
	(290, 'apartment39316', 'apartment3', 'Integrity Way 9316', 'TDJ01991'),
	(291, 'apartment33839', 'apartment3', 'Integrity Way 3839', 'SVO00296'),
	(292, 'apartment37486', 'apartment3', 'Integrity Way 7486', 'FYZ04801'),
	(294, 'apartment38523', 'apartment3', 'Integrity Way 8523', 'QWD83978'),
	(295, 'apartment35749', 'apartment3', 'Integrity Way 5749', 'IAO30259'),
	(296, 'apartment48087', 'apartment4', 'Tinsel Towers 8087', 'VZG24611'),
	(297, 'apartment11865', 'apartment1', 'South Rockford Drive 1865', 'UAW49817'),
	(298, 'apartment5212', 'apartment5', 'Fantastic Plaza 212', 'MQZ24811'),
	(299, 'apartment3132', 'apartment3', 'Integrity Way 132', 'AHN70507'),
	(300, 'apartment3206', 'apartment3', 'Integrity Way 206', 'AHN70507'),
	(301, 'apartment58468', 'apartment5', 'Fantastic Plaza 8468', 'OXF39132'),
	(302, 'apartment34501', 'apartment3', 'Integrity Way 4501', 'KDB24356'),
	(303, 'apartment43817', 'apartment4', 'Tinsel Towers 3817', 'HGQ14520'),
	(304, 'apartment43960', 'apartment4', 'Tinsel Towers 3960', 'OLF99348'),
	(305, 'apartment24788', 'apartment2', 'Morningwood Blvd 4788', 'ZYD20476'),
	(306, 'apartment12951', 'apartment1', 'South Rockford Drive 2951', 'PGB18817'),
	(307, 'apartment57783', 'apartment5', 'Fantastic Plaza 7783', 'POK60295'),
	(308, 'apartment34307', 'apartment3', 'Integrity Way 4307', 'YYJ40505'),
	(309, 'apartment392', 'apartment3', 'Integrity Way 92', 'JIQ20274');

-- Dumping structure for table s879692_banglapixel.bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s879692_banglapixel.bank_accounts: ~1 rows (approximately)
DELETE FROM `bank_accounts`;
INSERT INTO `bank_accounts` (`record_id`, `citizenid`, `business`, `businessid`, `gangid`, `amount`, `account_type`) VALUES
	(21, 'BPM27715', NULL, NULL, NULL, 0, 'Savings');

-- Dumping structure for table s879692_banglapixel.bank_cards
DROP TABLE IF EXISTS `bank_cards`;
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s879692_banglapixel.bank_cards: ~0 rows (approximately)
DELETE FROM `bank_cards`;

-- Dumping structure for table s879692_banglapixel.bank_statements
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s879692_banglapixel.bank_statements: ~0 rows (approximately)
DELETE FROM `bank_statements`;

-- Dumping structure for table s879692_banglapixel.bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.bans: ~0 rows (approximately)
DELETE FROM `bans`;

-- Dumping structure for table s879692_banglapixel.crypto
DROP TABLE IF EXISTS `crypto`;
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.crypto: ~0 rows (approximately)
DELETE FROM `crypto`;
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1032, '[{"PreviousWorth":1027,"NewWorth":1032},{"PreviousWorth":1027,"NewWorth":1032},{"PreviousWorth":1027,"NewWorth":1032},{"NewWorth":1032,"PreviousWorth":1032}]');

-- Dumping structure for table s879692_banglapixel.crypto_transactions
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.crypto_transactions: ~0 rows (approximately)
DELETE FROM `crypto_transactions`;

-- Dumping structure for table s879692_banglapixel.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.dealers: ~0 rows (approximately)
DELETE FROM `dealers`;

-- Dumping structure for table s879692_banglapixel.gloveboxitems
DROP TABLE IF EXISTS `gloveboxitems`;
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.gloveboxitems: ~4 rows (approximately)
DELETE FROM `gloveboxitems`;
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(460, '0KV208XB', '[]'),
	(464, '1MW854FP', '[]'),
	(462, '5AE148KY', '[]'),
	(476, '5PA202HL', '[]');

-- Dumping structure for table s879692_banglapixel.houselocations
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.houselocations: ~0 rows (approximately)
DELETE FROM `houselocations`;

-- Dumping structure for table s879692_banglapixel.house_plants
DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.house_plants: ~0 rows (approximately)
DELETE FROM `house_plants`;

-- Dumping structure for table s879692_banglapixel.lapraces
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.lapraces: ~0 rows (approximately)
DELETE FROM `lapraces`;

-- Dumping structure for table s879692_banglapixel.management_funds
DROP TABLE IF EXISTS `management_funds`;
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2189 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.management_funds: ~15 rows (approximately)
DELETE FROM `management_funds`;
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 3600, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 80700, 'boss'),
	(6, 'mechanic', 14871, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang'),
	(51, 'burgershot', 0, 'boss'),
	(98, 'uwu', 0, 'boss'),
	(863, 'rebel', 0, 'gang');

-- Dumping structure for table s879692_banglapixel.management_outfits
DROP TABLE IF EXISTS `management_outfits`;
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.management_outfits: ~0 rows (approximately)
DELETE FROM `management_outfits`;

-- Dumping structure for table s879692_banglapixel.mdt_bolos
DROP TABLE IF EXISTS `mdt_bolos`;
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_bolos: ~0 rows (approximately)
DELETE FROM `mdt_bolos`;

-- Dumping structure for table s879692_banglapixel.mdt_bulletin
DROP TABLE IF EXISTS `mdt_bulletin`;
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_bulletin: ~1 rows (approximately)
DELETE FROM `mdt_bulletin`;
INSERT INTO `mdt_bulletin` (`id`, `title`, `desc`, `author`, `time`, `jobtype`) VALUES
	(2, 'LSPD', 'Serve & Obey', 'Dablo Escobar', '1702047521041', 'police'),
	(3, 'About K9', 'Dont Bring out K9 Unless You are a sergent.', 'Dablo Escobar', '1702050248742', 'police');

-- Dumping structure for table s879692_banglapixel.mdt_clocking
DROP TABLE IF EXISTS `mdt_clocking`;
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_clocking: ~2 rows (approximately)
DELETE FROM `mdt_clocking`;
INSERT INTO `mdt_clocking` (`id`, `user_id`, `firstname`, `lastname`, `clock_in_time`, `clock_out_time`, `total_time`) VALUES
	(129, 'IAA44370', 'Dablo', 'Escober', '2023-12-29 11:13:08', '2023-12-29 11:35:15', 1327),
	(131, 'TDJ01991', 'CJ', 'Israk', '2023-12-29 11:14:36', '2023-12-29 11:14:33', 9);

-- Dumping structure for table s879692_banglapixel.mdt_convictions
DROP TABLE IF EXISTS `mdt_convictions`;
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_convictions: ~0 rows (approximately)
DELETE FROM `mdt_convictions`;

-- Dumping structure for table s879692_banglapixel.mdt_data
DROP TABLE IF EXISTS `mdt_data`;
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_data: ~0 rows (approximately)
DELETE FROM `mdt_data`;

-- Dumping structure for table s879692_banglapixel.mdt_impound
DROP TABLE IF EXISTS `mdt_impound`;
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_impound: ~0 rows (approximately)
DELETE FROM `mdt_impound`;

-- Dumping structure for table s879692_banglapixel.mdt_incidents
DROP TABLE IF EXISTS `mdt_incidents`;
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_incidents: ~1 rows (approximately)
DELETE FROM `mdt_incidents`;

-- Dumping structure for table s879692_banglapixel.mdt_logs
DROP TABLE IF EXISTS `mdt_logs`;
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_logs: ~0 rows (approximately)
DELETE FROM `mdt_logs`;

-- Dumping structure for table s879692_banglapixel.mdt_reports
DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_reports: ~0 rows (approximately)
DELETE FROM `mdt_reports`;

-- Dumping structure for table s879692_banglapixel.mdt_vehicleinfo
DROP TABLE IF EXISTS `mdt_vehicleinfo`;
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_vehicleinfo: ~0 rows (approximately)
DELETE FROM `mdt_vehicleinfo`;

-- Dumping structure for table s879692_banglapixel.mdt_weaponinfo
DROP TABLE IF EXISTS `mdt_weaponinfo`;
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.mdt_weaponinfo: ~0 rows (approximately)
DELETE FROM `mdt_weaponinfo`;

-- Dumping structure for table s879692_banglapixel.occasion_vehicles
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.occasion_vehicles: ~0 rows (approximately)
DELETE FROM `occasion_vehicles`;

-- Dumping structure for table s879692_banglapixel.osm_valet
DROP TABLE IF EXISTS `osm_valet`;
CREATE TABLE IF NOT EXISTS `osm_valet` (
  `cid` varchar(50) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  `totalcalls` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.osm_valet: ~12 rows (approximately)
DELETE FROM `osm_valet`;
INSERT INTO `osm_valet` (`cid`, `level`, `totalcalls`) VALUES
	('YRC72715', 2, '7'),
	('UBI49161', 1, '1'),
	('QVX53962', 2, '5'),
	('ELM62118', 2, '3'),
	('EGS92330', 1, '1'),
	('MRC85651', 1, '1'),
	('SDO08208', 1, '1'),
	('WBF65425', 1, '1'),
	('ZKG08591', 1, '1'),
	('FRR06178', 1, '1'),
	('BPM27715', 2, '3'),
	('TDJ01991', 1, '1');

-- Dumping structure for table s879692_banglapixel.phone_debt
DROP TABLE IF EXISTS `phone_debt`;
CREATE TABLE IF NOT EXISTS `phone_debt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.phone_debt: ~0 rows (approximately)
DELETE FROM `phone_debt`;

-- Dumping structure for table s879692_banglapixel.phone_gallery
DROP TABLE IF EXISTS `phone_gallery`;
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.phone_gallery: ~6 rows (approximately)
DELETE FROM `phone_gallery`;
INSERT INTO `phone_gallery` (`citizenid`, `image`, `date`) VALUES
	('TRQ74282', 'https://media.discordapp.net/attachments/1179508758821482496/1189629167713661050/screenshot.jpg?ex=659edb7f&is=658c667f&hm=2ae346dd9afe0af8f4f0c43882b777119f6a7e35fd6b83bed293fcb7f2666b4d&', '2023-12-27 18:01:36'),
	('TRQ74282', 'https://media.discordapp.net/attachments/1179508758821482496/1189629226874327040/screenshot.jpg?ex=659edb8d&is=658c668d&hm=0426c16e6792137445a919948616fa54a648668653518b085c36f864f5831c6a&', '2023-12-27 18:01:50'),
	('TRQ74282', 'https://media.discordapp.net/attachments/1179508758821482496/1189629300798935050/screenshot.jpg?ex=659edb9f&is=658c669f&hm=2bf821b44c0276fabeb60d4e32b9e41745ecfc782d4d9eaada977a058cde6275&', '2023-12-27 18:02:07'),
	('BPM27715', 'https://media.discordapp.net/attachments/1179508758821482496/1189629344314822756/screenshot.jpg?ex=659edba9&is=658c66a9&hm=526262cc678b4f096059aa13b3350d3fbfa8b21e300146045857abcd0a44eaaf&', '2023-12-27 18:02:18'),
	('HGQ14520', 'https://media.discordapp.net/attachments/1179508758821482496/1190454876078100500/screenshot.jpg?ex=65a1dc80&is=658f6780&hm=940bc94ddcfc6f7809bb48a73342681abf215b842fd27a2f2e931abc5212d898&', '2023-12-30 00:42:40'),
	('HGQ14520', 'https://media.discordapp.net/attachments/1179508758821482496/1190454911599648899/screenshot.jpg?ex=65a1dc88&is=658f6788&hm=af7e9894d26d874f57d48b905e1df8ac5758fb6f2617cca93b0cce42b3e8f74c&', '2023-12-30 00:42:48');

-- Dumping structure for table s879692_banglapixel.phone_invoices
DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.phone_invoices: ~0 rows (approximately)
DELETE FROM `phone_invoices`;

-- Dumping structure for table s879692_banglapixel.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.phone_messages: ~0 rows (approximately)
DELETE FROM `phone_messages`;

-- Dumping structure for table s879692_banglapixel.phone_tweets
DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` text DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.phone_tweets: ~2 rows (approximately)
DELETE FROM `phone_tweets`;
INSERT INTO `phone_tweets` (`id`, `citizenid`, `firstName`, `lastName`, `message`, `date`, `url`, `picture`, `tweetId`) VALUES
	(142, 'TRQ74282', 'Halka', 'Man', 'Wow', '2023-12-27 18:01:59', 'https://media.discordapp.net/attachments/1179508758821482496/1189629226874327040/screenshot.jpg?ex=659edb8d&is=658c668d&hm=0426c16e6792137445a919948616fa54a648668653518b085c36f864f5831c6a&', 'default', 'TWEET-61620937'),
	(143, 'TRQ74282', 'Halka', 'Man', 'aso chill kori', '2023-12-27 18:02:22', 'https://media.discordapp.net/attachments/1179508758821482496/1189629300798935050/screenshot.jpg?ex=659edb9f&is=658c669f&hm=2bf821b44c0276fabeb60d4e32b9e41745ecfc782d4d9eaada977a058cde6275&', 'default', 'TWEET-48637695'),
	(144, 'BPM27715', 'Kajuto', 'Kirigaya', 'gari nosto ', '2023-12-27 18:02:39', 'https://media.discordapp.net/attachments/1179508758821482496/1189629344314822756/screenshot.jpg?ex=659edba9&is=658c66a9&hm=526262cc678b4f096059aa13b3350d3fbfa8b21e300146045857abcd0a44eaaf&', 'default', 'TWEET-29561323');

-- Dumping structure for table s879692_banglapixel.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `luckywheel_spins` varchar(1) DEFAULT '0',
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=27213 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.players: ~24 rows (approximately)
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `luckywheel_spins`) VALUES
	(26064, 'AHN70507', 1, 'license:98e8dc8f03bf0554acb503b81a94407ba10e8055', 'User', '{"cash":6,"bank":4770,"crypto":0}', '{"firstname":"Haji","birthdate":"2000-08-19","nationality":"Bd","cid":"1","account":"US05QBCore7233980330","phone":"5119134850","gender":0,"lastname":"Iliyas","backstory":"placeholder backstory"}', '{"grade":{"name":"Freelancer","level":0},"type":"none","name":"unemployed","label":"Civilian","onduty":true,"payment":10,"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":215.88131713867188,"y":-810.5802001953125,"z":30.7120361328125}', '{"hunger":32.80000000000383,"fitbit":[],"stress":3,"callsign":"NO CALLSIGN","ishandcuffed":false,"commandbinds":[],"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":76976885,"InstalledApps":[]},"phone":[],"bloodtype":"O-","injail":0,"isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"licences":{"weapon":false,"business":false,"driver":true},"walletid":"QB-74304680","status":[],"inlaststand":false,"jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"tracker":false,"fingerprint":"Bm003F55kYR2898","communityservice":0,"armor":0,"thirst":41.19999999999618,"craftinglevel":0,"dealerrep":0,"jailitems":[],"craftingrep":0}', '[{"type":"weapon","info":{"quality":92.0500000000012,"ammo":157,"serie":"32PGq2Ew298TDWg"},"slot":1,"name":"weapon_snspistol","amount":1},{"type":"item","info":[],"slot":2,"name":"phone","amount":1},{"type":"item","info":{"birthdate":"2000-08-19","type":"Class C Driver License","lastname":"Iliyas","firstname":"Haji"},"slot":3,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":4,"name":"sandwich","amount":4},{"type":"item","info":[],"slot":5,"name":"lockpick","amount":5},{"type":"item","info":[],"slot":6,"name":"water_bottle","amount":4},{"type":"item","info":[],"slot":7,"name":"scorcher","amount":1},{"type":"weapon","info":{"quality":100,"serie":"54ovr7PV718nmhd"},"slot":8,"name":"weapon_petrolcan","amount":1},{"type":"item","info":{"firstname":"Haji","citizenid":"AHN70507","gender":0,"birthdate":"2000-08-19","nationality":"Bd","lastname":"Iliyas"},"slot":9,"name":"id_card","amount":1}]', '2023-12-28 20:46:03', '0'),
	(23339, 'BPM27715', 1, 'license:a59c845b3cd215cf9b515917711dd9f18c0bfc8c', 'BURGIRSHUT', '{"cash":1455,"bank":12231,"crypto":0}', '{"firstname":"Kajuto","birthdate":"1998-01-24","nationality":"Japanese","cid":"1","lastname":"Kirigaya","phone":"2975092715","card":9327594937034424,"gender":0,"account":"US01QBCore3676689596","backstory":"placeholder backstory"}', '{"grade":{"name":"Business Sales","level":2},"onduty":true,"name":"cardealer","label":"Vehicle Dealer","type":"none","payment":390,"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":219.6923065185547,"y":-785.9736328125,"z":30.779541015625}', '{"hunger":54.80000000000564,"fitbit":[],"stress":0,"callsign":"NO CALLSIGN","thirst":43.99999999999636,"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":46390312,"InstalledApps":[]},"phone":[],"bloodtype":"AB-","injail":0,"isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"commandbinds":[],"walletid":"QB-13333741","status":[],"jailitems":[],"jobrep":{"hotdog":0,"trucker":0,"tow":0,"taxi":0},"inlaststand":false,"tracker":false,"communityservice":0,"ishandcuffed":false,"armor":0,"craftinglevel":0,"dealerrep":0,"fingerprint":"sh014q59EWe0593","craftingrep":0}', '[{"type":"item","info":[],"slot":1,"name":"sandwich","amount":7},{"type":"item","info":[],"slot":2,"name":"tosti","amount":48},{"type":"item","info":[],"slot":3,"name":"kurkakola","amount":47},{"type":"item","info":{"ammo":8,"quality":100},"slot":4,"name":"handcuffs","amount":1},{"type":"weapon","info":{"quality":100,"ammo":0,"serie":"09XKN9Br491rJto"},"slot":5,"name":"weapon_knife","amount":1},{"type":"item","info":[],"slot":6,"name":"phone","amount":1},{"type":"item","info":{"firstname":"Kajuto","citizenid":"BPM27715","gender":0,"birthdate":"1998-01-24","nationality":"Japanese","lastname":"Kirigaya"},"slot":7,"name":"id_card","amount":1},{"type":"item","info":{"cardPin":1032,"citizenid":"BPM27715","cardNumber":9327594937034424,"cardActive":true,"name":"Kajuto Kirigaya","cardType":"mastercard"},"slot":8,"name":"mastercard","amount":1},{"type":"weapon","info":{"quality":73.15000000000407,"ammo":8,"serie":"45DnV2TT895kQLS"},"slot":9,"name":"weapon_snspistol","amount":1},{"type":"item","info":{"birthdate":"1998-01-24","type":"Class C Driver License","firstname":"Kajuto","lastname":"Kirigaya"},"slot":10,"name":"driver_license","amount":1},{"type":"weapon","info":{"quality":100,"serie":"79DCC4pE198rjKK"},"slot":11,"name":"weapon_petrolcan","amount":1},{"type":"item","info":{"quality":100},"slot":13,"name":"methkey","amount":1},{"type":"item","info":{"quality":100},"slot":14,"name":"cocainekey","amount":1},{"type":"item","info":{"quality":100},"slot":15,"name":"weedkey","amount":1},{"type":"item","info":[],"slot":16,"name":"water_bottle","amount":2},{"type":"item","info":[],"slot":17,"name":"metalscrap","amount":50},{"type":"item","info":[],"slot":18,"name":"aluminum","amount":17},{"type":"item","info":[],"slot":19,"name":"copper","amount":16},{"type":"item","info":[],"slot":20,"name":"iron","amount":35},{"type":"item","info":[],"slot":21,"name":"oxy","amount":6},{"type":"item","info":[],"slot":22,"name":"steel","amount":19},{"type":"item","info":{"quality":100},"slot":23,"name":"trimming_scissors","amount":1},{"type":"item","info":{"quality":100},"slot":24,"name":"finescale","amount":1},{"type":"item","info":[],"slot":25,"name":"lockpick","amount":2},{"type":"item","info":[],"slot":26,"name":"plastic","amount":4},{"type":"item","info":[],"slot":27,"name":"bottle","amount":1},{"type":"item","info":[],"slot":28,"name":"pistol_ammo","amount":8},{"type":"item","info":[],"slot":29,"name":"heavyarmor","amount":7},{"type":"item","info":[],"slot":30,"name":"coke_brick","amount":1},{"type":"item","info":[],"slot":31,"name":"coke_brick","amount":1},{"type":"item","info":[],"slot":32,"name":"empty_weed_bag","amount":3},{"type":"item","info":[],"slot":33,"name":"bakingsoda","amount":27},{"type":"item","info":{"quality":100},"slot":34,"name":"chopradio","amount":1},{"type":"item","info":[],"slot":35,"name":"rubber","amount":36},{"type":"item","info":[],"slot":36,"name":"coke_brick","amount":1}]', '2023-12-28 18:46:04', '0'),
	(23485, 'BWP17481', 1, 'license:a3286af7f259e89f3489336ec933022b8b0d3114', 'McDavidisridic', '{"crypto":0,"cash":1000,"bank":5470}', '{"cid":"1","birthdate":"1985-12-22","account":"US03QBCore3571274595","gender":0,"lastname":"mcdavid","backstory":"placeholder backstory","firstname":"tony","nationality":"american","phone":"4186883272"}', '{"onduty":true,"isboss":false,"grade":{"name":"Corporal","level":3},"name":"police","payment":460,"label":"Law Enforcement","type":"leo"}', '{"name":"none","grade":{"name":"none","level":0},"label":"No Gang Affiliaton","isboss":false}', '{"x":571.2000122070313,"y":2796.0263671875,"z":42.018310546875}', '{"thirst":4.99999999999545,"stress":0,"craftingrep":0,"communityservice":0,"hunger":0,"status":[],"isdead":false,"fitbit":[],"armor":0,"bloodtype":"A+","attachmentcraftingrep":0,"inside":{"apartment":[]},"licences":{"driver":true,"weapon":false,"business":false},"walletid":"QB-13179621","injail":0,"jailitems":[],"fingerprint":"Dh271Q86PzK3373","criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","ishandcuffed":false,"jobrep":{"taxi":0,"hotdog":0,"tow":0,"trucker":0},"phonedata":{"SerialNumber":24898743,"InstalledApps":[]},"inlaststand":true,"craftinglevel":0,"tracker":false,"dealerrep":0,"commandbinds":[],"phone":[]}', '[{"name":"weapon_pumpshotgun","type":"weapon","amount":1,"slot":1,"info":{"quality":100,"serie":"31Saw4Sm120zAty","ammo":0}},{"name":"phone","type":"item","amount":1,"slot":2,"info":[]},{"name":"scorcher","type":"item","amount":1,"slot":3,"info":[]},{"name":"sandwich","type":"item","amount":5,"slot":4,"info":[]},{"name":"driver_license","type":"item","amount":1,"slot":5,"info":{"firstname":"tony","birthdate":"1985-12-22","lastname":"mcdavid","type":"Class C Driver License"}},{"name":"id_card","type":"item","amount":1,"slot":6,"info":{"firstname":"tony","citizenid":"BWP17481","gender":0,"nationality":"american","birthdate":"1985-12-22","lastname":"mcdavid"}},{"name":"water_bottle","type":"item","amount":5,"slot":7,"info":[]},{"name":"lockpick","type":"item","amount":5,"slot":9,"info":[]}]', '2023-12-25 22:23:21', '0'),
	(23800, 'FYZ04801', 1, 'license:a7f2ccdfad7babec743855c44a8eddedf07f1fb6', 'BurgerShot', '{"cash":0,"bank":5610,"crypto":0}', '{"firstname":"Burger","birthdate":"1991-05-05","nationality":"bangladesh","cid":"1","lastname":"Shot","phone":"3794295597","gender":0,"account":"US06QBCore5978881685","backstory":"placeholder backstory"}', '{"grade":{"name":"Freelancer","level":0},"onduty":true,"name":"unemployed","label":"Civilian","type":"none","payment":10,"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":247.74066162109376,"y":-928.905517578125,"z":28.791259765625}', '{"hunger":74.40000000000146,"fitbit":[],"stress":0,"jailitems":[],"thirst":77.59999999999855,"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":37014677,"InstalledApps":[]},"phone":[],"bloodtype":"A+","fingerprint":"Yu399j14lrK2175","isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"walletid":"QB-21951936","ishandcuffed":false,"armor":0,"status":[],"jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"tracker":false,"injail":0,"communityservice":0,"inlaststand":false,"commandbinds":[],"craftinglevel":0,"dealerrep":0,"callsign":"NO CALLSIGN","craftingrep":0}', '[{"type":"item","info":[],"slot":1,"name":"sandwich","amount":4},{"type":"weapon","info":{"ammo":0,"quality":100,"serie":"80xkm6cg735mkYo"},"slot":2,"name":"weapon_hatchet","amount":1},{"type":"item","info":[],"slot":3,"name":"bandage","amount":3},{"type":"item","info":[],"slot":4,"name":"lockpick","amount":4},{"type":"item","info":{"colorPrimary":0,"xenonColor":0,"pearlescentColor":0,"wheelColor":0,"colorSecondary":0,"plate":"BICYCLE5"},"slot":5,"name":"scorcher","amount":1},{"type":"item","info":{"firstname":"Burger","citizenid":"FYZ04801","gender":0,"birthdate":"1991-05-05","nationality":"bangladesh","lastname":"Shot"},"slot":6,"name":"id_card","amount":1},{"type":"item","info":[],"slot":7,"name":"water_bottle","amount":5},{"type":"weapon","info":{"ammo":0,"quality":100,"serie":"38kBP6vO084UYKa"},"slot":8,"name":"weapon_battleaxe","amount":1},{"type":"weapon","info":{"quality":100,"serie":"98uwW4iw563SjwG"},"slot":9,"name":"weapon_bread","amount":1},{"type":"item","info":{"birthdate":"1991-05-05","type":"Class C Driver License","firstname":"Burger","lastname":"Shot"},"slot":11,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":13,"name":"phone","amount":1}]', '2023-12-28 19:39:57', '0'),
	(27006, 'HGQ14520', 1, 'license:bc35a3d05b46064d887781c7b4fb24fb8c40a0c8', 'grizzly_gang_615', '{"bank":4780,"crypto":0,"cash":500}', '{"firstname":"TENNESSEE","phone":"6284110207","gender":0,"cid":"1","account":"US07QBCore2616966894","nationality":"BLACK","birthdate":"2003-02-25","backstory":"placeholder backstory","lastname":"MONEY"}', '{"label":"Civilian","name":"unemployed","type":"none","onduty":true,"isboss":false,"grade":{"level":0,"name":"Freelancer"},"payment":10}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":173.57801818847657,"y":-1119.83740234375,"z":29.2967529296875}', '{"craftinglevel":0,"craftingrep":0,"thirst":77.59999999999855,"inside":{"apartment":[]},"walletid":"QB-12513339","fingerprint":"ih303e49rHX2825","criminalrecord":{"hasRecord":false},"dealerrep":0,"hunger":74.40000000000146,"commandbinds":[],"tracker":false,"fitbit":[],"inlaststand":false,"armor":0,"status":[],"injail":0,"licences":{"driver":true,"weapon":false,"business":false},"jobrep":{"tow":0,"trucker":0,"hotdog":0,"taxi":0},"phone":[],"phonedata":{"SerialNumber":82834291,"InstalledApps":[]},"ishandcuffed":false,"callsign":"NO CALLSIGN","stress":0,"attachmentcraftingrep":0,"communityservice":0,"jailitems":[],"isdead":false,"bloodtype":"A+"}', '[{"slot":1,"amount":5,"type":"item","name":"water_bottle","info":[]},{"slot":2,"amount":1,"type":"item","name":"id_card","info":{"firstname":"TENNESSEE","lastname":"MONEY","birthdate":"2003-02-25","nationality":"BLACK","gender":0,"citizenid":"HGQ14520"}},{"slot":3,"amount":1,"type":"item","name":"driver_license","info":{"firstname":"TENNESSEE","lastname":"MONEY","type":"Class C Driver License","birthdate":"2003-02-25"}},{"slot":4,"amount":5,"type":"item","name":"sandwich","info":[]},{"slot":5,"amount":1,"type":"item","name":"phone","info":[]},{"slot":6,"amount":1,"type":"item","name":"scorcher","info":[]},{"slot":7,"amount":5,"type":"item","name":"lockpick","info":[]}]', '2023-12-30 01:37:54', '0'),
	(23352, 'IAA44370', 1, 'license:ca331fb15564bc23e6657e769c6b0953b4a0aa17', 'Otaku Sensei', '{"cash":500,"bank":23044,"crypto":0}', '{"gender":0,"lastname":"Escober","cid":"1","phone":"8211869937","account":"US02QBCore3211413714","firstname":"Dablo","nationality":"Bangladeshi","backstory":"placeholder backstory","birthdate":"1985-07-21"}', '{"label":"Law Enforcement","type":"leo","grade":{"level":8,"name":"Chief of Police"},"isboss":true,"name":"police","onduty":true,"payment":600}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":414.962646484375,"y":-1009.3318481445313,"z":29.229248046875}', '{"thirst":100,"hunger":100,"inside":{"apartment":[]},"dealerrep":0,"commandbinds":[],"jailitems":[],"ishandcuffed":false,"armor":0,"walletid":"QB-43542578","fingerprint":"GS227M93Aiu3930","inlaststand":false,"callsign":"xxx","licences":{"driver":true,"weapon":false,"business":false},"craftinglevel":0,"bloodtype":"AB-","status":[],"phonedata":{"InstalledApps":[],"SerialNumber":66299932},"craftingrep":0,"criminalrecord":{"hasRecord":false},"communityservice":0,"phone":[],"isdead":false,"stress":0,"injail":0,"tracker":false,"jobrep":{"tow":0,"hotdog":0,"trucker":0,"taxi":0},"fitbit":[],"attachmentcraftingrep":0}', '[{"type":"weapon","name":"weapon_pistol","info":{"serie":"40GJz6Gw684MFbH","quality":90.40000000000146,"ammo":189,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}]},"slot":1,"amount":1},{"type":"weapon","name":"weapon_carbinerifle","info":{"serie":"71Edq1oo922pIeW","quality":100,"ammo":249,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"label":"3x Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"}]},"slot":2,"amount":1},{"type":"item","name":"heavyarmor","info":[],"slot":3,"amount":3},{"type":"item","name":"handcuffs","info":[],"slot":4,"amount":1},{"type":"item","name":"lockpick","info":[],"slot":6,"amount":5},{"type":"item","name":"id_card","info":{"gender":0,"birthdate":"1985-07-21","nationality":"Bangladeshi","lastname":"Escober","firstname":"Dablo","citizenid":"IAA44370"},"slot":7,"amount":1},{"type":"item","name":"driver_license","info":{"birthdate":"1985-07-21","type":"Class C Driver License","firstname":"Dablo","lastname":"Escober"},"slot":8,"amount":1},{"type":"weapon","name":"weapon_petrolcan","info":{"quality":100,"serie":"52Feh6fd725Nsmb"},"slot":9,"amount":1},{"type":"item","name":"pistol_ammo","info":[],"slot":10,"amount":1},{"type":"item","name":"radio","info":[],"slot":11,"amount":1},{"type":"item","name":"phone","info":[],"slot":12,"amount":1},{"type":"item","name":"chopradio","info":[],"slot":13,"amount":1},{"type":"weapon","name":"weapon_smg","info":{"serie":"93PKz4YZ137dQNe","quality":100,"attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}]},"slot":14,"amount":1},{"type":"item","name":"water_bottle","info":[],"slot":15,"amount":4},{"type":"item","name":"moneyshot","info":[],"slot":16,"amount":3},{"type":"item","name":"scorcher","info":[],"slot":17,"amount":1}]', '2023-12-29 11:35:15', '0'),
	(25078, 'IAO30259', 1, 'license:ef5aa970fdc7f9cfff41f17c219c8be084c43586', 'wasifmahmudrahat', '{"cash":435,"crypto":0,"bank":3170}', '{"birthdate":"1998-02-16","nationality":"Bangladeshi","lastname":"Joestar","cid":"1","firstname":"Jonathan","backstory":"placeholder backstory","account":"US04QBCore9435792847","phone":"1613062451","gender":0}', '{"payment":10,"onduty":true,"grade":{"name":"Freelancer","level":0},"label":"Civilian","name":"unemployed","isboss":false,"type":"none"}', '{"label":"No Gang Affiliaton","name":"none","isboss":false,"grade":{"name":"none","level":0}}', '{"x":111.65274810791016,"y":-1315.4373779296876,"z":29.14501953125}', '{"attachmentcraftingrep":0,"fingerprint":"Df995H03BZu6612","licences":{"business":false,"weapon":false,"driver":true},"isdead":false,"inside":{"apartment":[]},"hunger":61.60000000000218,"phonedata":{"SerialNumber":72435841,"InstalledApps":[]},"bloodtype":"O+","communityservice":0,"criminalrecord":{"hasRecord":false},"injail":0,"thirst":66.39999999999782,"phone":[],"commandbinds":[],"dealerrep":0,"fitbit":[],"callsign":"NO CALLSIGN","ishandcuffed":false,"jailitems":[],"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"tracker":false,"craftingrep":0,"inlaststand":false,"stress":0,"status":[],"armor":0,"craftinglevel":0,"walletid":"QB-26398207"}', '[{"info":{"ammo":67,"serie":"38ZaK1JI163hvQV","quality":84.70000000000232},"name":"weapon_snspistol","slot":1,"type":"weapon","amount":1},{"info":{"gender":0,"citizenid":"IAO30259","nationality":"Bangladeshi","lastname":"Joestar","firstname":"Jonathan","birthdate":"1998-02-16"},"name":"id_card","slot":2,"type":"item","amount":1},{"info":[],"name":"lockpick","slot":3,"type":"item","amount":5},{"info":[],"name":"sandwich","slot":4,"type":"item","amount":3},{"info":[],"name":"water_bottle","slot":5,"type":"item","amount":3},{"info":{"firstname":"Jonathan","lastname":"Joestar","type":"Class C Driver License","birthdate":"1998-02-16"},"name":"driver_license","slot":6,"type":"item","amount":1},{"info":[],"name":"phone","slot":7,"type":"item","amount":1},{"info":[],"name":"scorcher","slot":8,"type":"item","amount":1},{"info":{"quality":100},"name":"trimming_scissors","slot":9,"type":"item","amount":1},{"info":{"quality":100},"name":"finescale","slot":10,"type":"item","amount":1},{"info":{"quality":100},"name":"methkey","slot":11,"type":"item","amount":1},{"info":{"quality":100},"name":"cocainekey","slot":12,"type":"item","amount":1},{"info":{"quality":100},"name":"weedkey","slot":13,"type":"item","amount":1},{"info":{"quality":100},"name":"bakingsoda","slot":14,"type":"item","amount":5},{"info":[],"name":"coke","slot":15,"type":"item","amount":4},{"info":[],"name":"plastic","slot":16,"type":"item","amount":6},{"info":[],"name":"rubber","slot":17,"type":"item","amount":4}]', '2023-12-27 18:02:17', '0'),
	(27157, 'JIQ20274', 1, 'license:a3f76e45f874c36654eecf5ff20658219316c391', '-slwhyn-', '{"cash":500,"bank":5310,"crypto":0}', '{"nationality":"US","gender":0,"backstory":"placeholder backstory","phone":"9988485779","cid":"1","lastname":"tentacion","birthdate":"2000-02-07","firstname":"xxx","account":"US05QBCore7962655493"}', '{"payment":560,"name":"ambulance","label":"EMS","grade":{"level":5,"name":"Surgeon"},"isboss":false,"onduty":true,"type":"ems"}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":167.93406677246095,"y":-987.2703247070313,"z":30.088623046875}', '{"stress":0,"tracker":false,"phone":[],"commandbinds":[],"jailitems":[],"armor":0,"inside":{"apartment":[]},"ishandcuffed":false,"walletid":"QB-86393447","communityservice":0,"criminalrecord":{"hasRecord":false},"fitbit":[],"thirst":80.39999999999873,"callsign":"NO CALLSIGN","fingerprint":"Se405S32BDA0804","jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"attachmentcraftingrep":0,"craftinglevel":0,"dealerrep":0,"isdead":false,"craftingrep":0,"bloodtype":"AB-","phonedata":{"InstalledApps":[],"SerialNumber":48551012},"status":[],"hunger":93.60000000000037,"inlaststand":false,"injail":0,"licences":{"business":false,"driver":true,"weapon":false}}', '[{"type":"weapon","amount":1,"info":{"quality":100,"serie":"40CXt8Io951zJym"},"slot":1,"name":"weapon_remotesniper"},{"type":"item","amount":1,"info":{"lastname":"tentacion","type":"Class C Driver License","birthdate":"2000-02-07","firstname":"xxx"},"slot":2,"name":"driver_license"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"87WHg4PV959lBNx","ammo":0},"slot":3,"name":"weapon_heavysniper_mk2"},{"type":"item","amount":4,"info":[],"slot":4,"name":"sandwich"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"05Aia8iP148erPi"},"slot":5,"name":"weapon_bread"},{"type":"item","amount":5,"info":[],"slot":6,"name":"water_bottle"},{"type":"item","amount":5,"info":[],"slot":7,"name":"lockpick"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"56RDi9Zx279VJgG","ammo":0},"slot":8,"name":"weapon_pistol"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"33jUC2PD980gxPJ"},"slot":9,"name":"weapon_pipebomb"},{"type":"item","amount":1,"info":[],"slot":10,"name":"phone"},{"type":"item","amount":1,"info":{"citizenid":"JIQ20274","gender":0,"nationality":"US","lastname":"tentacion","birthdate":"2000-02-07","firstname":"xxx"},"slot":11,"name":"id_card"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"20lgE3Bj312jSZo"},"slot":12,"name":"weapon_snspistol_mk2"}]', '2023-12-30 19:19:34', '0'),
	(26338, 'KDB24356', 1, 'license:acd1b84aa92d3ac1c321610048a164c400d60021', 'Bl4ckSlay3r', '{"cash":500,"bank":5060,"crypto":0}', '{"firstname":"Bl4ck","birthdate":"1998-11-12","nationality":"Bangladesh","cid":"1","account":"US04QBCore8881564878","phone":"9397972066","gender":0,"lastname":"Slayer","backstory":"placeholder backstory"}', '{"grade":{"name":"Freelancer","level":0},"type":"none","name":"unemployed","label":"Civilian","onduty":true,"payment":10,"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":-223.59561157226563,"y":-1126.7471923828126,"z":23.028564453125}', '{"hunger":93.60000000000037,"fitbit":[],"stress":3,"jailitems":[],"ishandcuffed":false,"walletid":"QB-68854138","criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":17963031,"InstalledApps":[]},"phone":[],"bloodtype":"B-","injail":0,"isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"commandbinds":[],"inlaststand":false,"status":[],"callsign":"NO CALLSIGN","jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"tracker":false,"fingerprint":"AY803R90AeM5986","communityservice":0,"armor":0,"thirst":94.39999999999964,"craftinglevel":0,"dealerrep":0,"licences":{"weapon":false,"business":false,"driver":true},"craftingrep":0}', '[{"type":"weapon","info":{"ammo":74,"quality":76.75000000000353,"serie":"88IsQ8TM721UJyX"},"slot":1,"name":"weapon_snspistol","amount":1},{"type":"item","info":[],"slot":2,"name":"phone","amount":1},{"type":"item","info":{"birthdate":"1998-11-12","type":"Class C Driver License","lastname":"Slayer","firstname":"Bl4ck"},"slot":3,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":4,"name":"sandwich","amount":4},{"type":"item","info":[],"slot":5,"name":"lockpick","amount":4},{"type":"item","info":[],"slot":6,"name":"water_bottle","amount":5},{"type":"item","info":{"firstname":"Bl4ck","citizenid":"KDB24356","gender":0,"birthdate":"1998-11-12","nationality":"Bangladesh","lastname":"Slayer"},"slot":8,"name":"id_card","amount":1}]', '2023-12-28 20:24:18', '0'),
	(25962, 'MQZ24811', 1, 'license:9ad770b6077097ba011854922301878c611145a3', 'Tahmid190', '{"bank":5000,"cash":500,"crypto":0}', '{"birthdate":"2000-07-27","backstory":"placeholder backstory","lastname":"Rahman","gender":0,"nationality":"Bangladeshi","account":"US01QBCore5250703124","phone":"1599518264","firstname":"Tahmid","cid":"1"}', '{"isboss":false,"type":"none","label":"Civilian","grade":{"name":"Freelancer","level":0},"onduty":true,"name":"unemployed","payment":10}', '{"isboss":false,"label":"No Gang Affiliaton","name":"none","grade":{"name":"none","level":0}}', '{"x":290.5450439453125,"y":-1072.3385009765626,"z":0.4498291015625}', '{"armor":0,"craftingrep":0,"currentapartment":"apartment5212","phonedata":{"SerialNumber":83532141,"InstalledApps":[]},"craftinglevel":0,"inside":{"apartment":{"apartmentType":"apartment5","apartmentId":"apartment5212"}},"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"fitbit":[],"dealerrep":0,"isdead":false,"tracker":false,"thirst":94.39999999999964,"walletid":"QB-57930442","fingerprint":"GQ787S60TqP1143","callsign":"NO CALLSIGN","ishandcuffed":false,"bloodtype":"A+","jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":0,"attachmentcraftingrep":0,"hunger":93.60000000000037,"inlaststand":false,"status":[],"communityservice":0,"jailitems":[],"phone":[],"commandbinds":[],"injail":0}', '[{"name":"driver_license","type":"item","amount":1,"info":{"birthdate":"2000-07-27","firstname":"Tahmid","lastname":"Rahman","type":"Class C Driver License"},"slot":1},{"name":"sandwich","type":"item","amount":5,"info":[],"slot":2},{"name":"scorcher","type":"item","amount":1,"info":[],"slot":3},{"name":"id_card","type":"item","amount":1,"info":{"firstname":"Tahmid","citizenid":"MQZ24811","birthdate":"2000-07-27","nationality":"Bangladeshi","lastname":"Rahman","gender":0},"slot":4},{"name":"lockpick","type":"item","amount":5,"info":[],"slot":5},{"name":"water_bottle","type":"item","amount":5,"info":[],"slot":6},{"name":"phone","type":"item","amount":1,"info":[],"slot":7}]', '2023-12-28 09:42:47', '0'),
	(27050, 'OLF99348', 1, 'license:e22dbee697cb31d7256608cd0f5765b2894b5ced', 'RichForever', '{"cash":500,"crypto":0,"bank":5010}', '{"lastname":"a","phone":"5062975421","account":"US04QBCore9979823550","cid":"1","firstname":"a","nationality":"a","birthdate":"2000-01-03","backstory":"placeholder backstory","gender":0}', '{"label":"Civilian","name":"unemployed","type":"none","onduty":true,"isboss":false,"grade":{"level":0,"name":"Freelancer"},"payment":10}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":107.56483459472656,"y":-1655.050537109375,"z":28.94287109375}', '{"craftinglevel":0,"craftingrep":0,"thirst":46.79999999999654,"inside":{"apartment":[]},"walletid":"QB-66413142","fingerprint":"gl998m43Cft1336","dealerrep":0,"isdead":false,"hunger":39.20000000000345,"commandbinds":[],"injail":0,"fitbit":[],"inlaststand":false,"armor":0,"status":[],"criminalrecord":{"hasRecord":false},"licences":{"driver":true,"weapon":false,"business":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"attachmentcraftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":40325472},"ishandcuffed":false,"callsign":"NO CALLSIGN","stress":2,"phone":[],"communityservice":0,"jailitems":[],"tracker":false,"bloodtype":"AB-"}', '[{"slot":1,"amount":5,"type":"item","name":"water_bottle","info":[]},{"slot":2,"amount":1,"type":"item","name":"id_card","info":{"firstname":"a","lastname":"a","birthdate":"2000-01-03","nationality":"a","gender":0,"citizenid":"OLF99348"}},{"slot":3,"amount":1,"type":"item","name":"driver_license","info":{"firstname":"a","lastname":"a","type":"Class C Driver License","birthdate":"2000-01-03"}},{"slot":4,"amount":5,"type":"item","name":"sandwich","info":[]},{"slot":5,"amount":1,"type":"item","name":"phone","info":[]},{"slot":7,"amount":5,"type":"item","name":"lockpick","info":[]}]', '2023-12-30 01:44:47', '0'),
	(23414, 'OQO35854', 1, 'license:561b5e7cdfbfc3850144924d54baca21a654dbcb', 'skymousetwo', '{"bank":5020,"cash":500,"crypto":0}', '{"account":"US06QBCore6254159674","backstory":"placeholder backstory","gender":0,"birthdate":"1999-04-21","phone":"5285559471","cid":"1","lastname":"Sky","firstname":"Mouse","nationality":"HK"}', '{"type":"none","name":"unemployed","payment":10,"label":"Civilian","onduty":true,"isboss":false,"grade":{"name":"Freelancer","level":0}}', '{"grade":{"name":"none","level":0},"isboss":false,"name":"none","label":"No Gang Affiliaton"}', '{"x":1162.2725830078126,"y":-316.04833984375,"z":69.197021484375}', '{"inside":{"apartment":[]},"thirst":69.99999999999455,"tracker":false,"phonedata":{"InstalledApps":[],"SerialNumber":15065177},"licences":{"driver":true,"business":false,"weapon":false},"injail":0,"jobrep":{"taxi":0,"tow":0,"trucker":0,"hotdog":0},"phone":[],"callsign":"NO CALLSIGN","fingerprint":"wN541g07XYa7641","walletid":"QB-75175093","communityservice":0,"jailitems":[],"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":0,"commandbinds":[],"armor":0,"stress":2,"bloodtype":"B-","craftinglevel":0,"dealerrep":0,"craftingrep":0,"ishandcuffed":false,"hunger":0,"fitbit":[],"inlaststand":true,"status":[],"isdead":false}', '[{"name":"id_card","type":"item","slot":2,"info":{"lastname":"Sky","gender":0,"birthdate":"1999-04-21","firstname":"Mouse","citizenid":"OQO35854","nationality":"HK"},"amount":1},{"name":"lockpick","type":"item","slot":3,"info":[],"amount":5},{"name":"driver_license","type":"item","slot":4,"info":{"lastname":"Sky","firstname":"Mouse","birthdate":"1999-04-21","type":"Class C Driver License"},"amount":1},{"name":"water_bottle","type":"item","slot":5,"info":[],"amount":3},{"name":"phone","type":"item","slot":6,"info":[],"amount":1},{"name":"sandwich","type":"item","slot":7,"info":[],"amount":4}]', '2023-12-25 19:08:44', '0'),
	(26215, 'OXF39132', 1, 'license:72f45477465a2deabb3df7fe7d465af535b3aba9', 'Lioaq', '{"bank":5000,"cash":500,"crypto":0}', '{"firstname":"test","birthdate":"2000-01-01","nationality":"test","cid":"1","lastname":"test","phone":"6588454163","gender":1,"account":"US03QBCore5499196831","backstory":"placeholder backstory"}', '{"grade":{"name":"Freelancer","level":0},"type":"none","name":"unemployed","label":"Civilian","isboss":false,"payment":10,"onduty":true}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":424.24615478515627,"y":-980.0439453125,"z":30.6951904296875}', '{"hunger":80.80000000000109,"fitbit":[],"stress":0,"jailitems":[],"ishandcuffed":false,"commandbinds":[],"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":88868644,"InstalledApps":[]},"phone":[],"bloodtype":"B-","injail":0,"isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"licences":{"weapon":false,"business":false,"driver":true},"walletid":"QB-60141068","fingerprint":"UK824d99Czc8562","callsign":"NO CALLSIGN","jobrep":{"hotdog":0,"trucker":0,"tow":0,"taxi":0},"tracker":false,"thirst":83.19999999999891,"communityservice":0,"armor":0,"dealerrep":0,"craftinglevel":0,"status":[],"inlaststand":false,"craftingrep":0}', '[{"type":"item","info":{"firstname":"test","citizenid":"OXF39132","gender":1,"birthdate":"2000-01-01","nationality":"test","lastname":"test"},"slot":1,"name":"id_card","amount":1},{"type":"item","info":[],"slot":2,"name":"phone","amount":1},{"type":"item","info":{"birthdate":"2000-01-01","type":"Class C Driver License","firstname":"test","lastname":"test"},"slot":3,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":4,"name":"sandwich","amount":5},{"type":"item","info":[],"slot":5,"name":"lockpick","amount":5},{"type":"item","info":[],"slot":6,"name":"water_bottle","amount":5}]', '2023-12-28 18:30:45', '0'),
	(27101, 'PGB18817', 1, 'license:39caf1696c7c046e25c9cf2eaf8326d159f8cd87', 'ASUS', '{"cash":0,"crypto":0,"bank":5530}', '{"lastname":"Karim","phone":"2033507774","gender":0,"account":"US03QBCore7960707279","cid":"1","firstname":"Mr","nationality":"Bangladeshi","birthdate":"1988-09-22","backstory":"placeholder backstory","card":5464459033574855}', '{"label":"Civilian","name":"unemployed","type":"none","onduty":true,"isboss":false,"grade":{"level":0,"name":"Freelancer"},"payment":10}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-384.30328369140627,"y":-1641.6263427734376,"z":0.3487548828125}', '{"craftinglevel":0,"craftingrep":0,"thirst":60.79999999999745,"inside":{"apartment":[]},"walletid":"QB-13832662","fingerprint":"Me523d95ZXg2780","dealerrep":0,"isdead":false,"hunger":25.60000000000764,"commandbinds":[],"injail":0,"fitbit":[],"inlaststand":true,"armor":0,"status":[],"criminalrecord":{"hasRecord":false},"licences":{"driver":true,"weapon":false,"business":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"attachmentcraftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":20728737},"ishandcuffed":false,"callsign":"NO CALLSIGN","stress":10,"phone":[],"communityservice":0,"jailitems":[],"tracker":false,"bloodtype":"O+"}', '[{"slot":1,"amount":3,"type":"item","name":"water_bottle","info":[]},{"slot":2,"amount":1,"type":"item","name":"id_card","info":{"firstname":"Mr","lastname":"Karim","birthdate":"1988-09-22","nationality":"Bangladeshi","gender":0,"citizenid":"PGB18817"}},{"slot":3,"amount":1,"type":"item","name":"driver_license","info":{"firstname":"Mr","lastname":"Karim","type":"Class C Driver License","birthdate":"1988-09-22"}},{"slot":4,"amount":3,"type":"item","name":"sandwich","info":[]},{"slot":5,"amount":1,"type":"item","name":"phone","info":[]},{"slot":7,"amount":3,"type":"item","name":"lockpick","info":[]},{"slot":8,"amount":1,"type":"item","name":"mastercard","info":{"cardPin":700,"cardNumber":5464459033574855,"cardType":"mastercard","cardActive":true,"name":"Mr Karim","citizenid":"PGB18817"}}]', '2023-12-30 08:55:45', '0'),
	(27145, 'POK60295', 1, 'license:a40fd99133a03a78e2916884d17ab41d9fcb9316', 'JusticeXena', '{"cash":500,"bank":5010,"crypto":0}', '{"nationality":"mexico","gender":0,"backstory":"placeholder backstory","phone":"3166042917","cid":"1","lastname":"xena","birthdate":"1998-01-01","firstname":"Justice","account":"US02QBCore4000490399"}', '{"payment":10,"name":"unemployed","label":"Civilian","grade":{"level":0,"name":"Freelancer"},"isboss":false,"onduty":true,"type":"none"}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":304.23297119140627,"y":-1088.21533203125,"z":29.4315185546875}', '{"stress":0,"tracker":false,"phone":[],"commandbinds":[],"jailitems":[],"armor":0,"inside":{"apartment":[]},"ishandcuffed":false,"walletid":"QB-52937813","communityservice":0,"criminalrecord":{"hasRecord":false},"fitbit":[],"thirst":94.39999999999964,"callsign":"NO CALLSIGN","fingerprint":"lj019D67TKu5543","jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"attachmentcraftingrep":0,"craftinglevel":0,"dealerrep":0,"isdead":false,"craftingrep":0,"bloodtype":"O-","phonedata":{"InstalledApps":[],"SerialNumber":68136710},"status":[],"hunger":93.60000000000037,"inlaststand":false,"injail":0,"licences":{"business":false,"driver":true,"weapon":false}}', '[{"type":"item","amount":1,"info":[],"slot":1,"name":"phone"},{"type":"item","amount":1,"info":{"lastname":"xena","type":"Class C Driver License","birthdate":"1998-01-01","firstname":"Justice"},"slot":2,"name":"driver_license"},{"type":"item","amount":1,"info":[],"slot":3,"name":"scorcher"},{"type":"item","amount":5,"info":[],"slot":4,"name":"sandwich"},{"type":"item","amount":1,"info":{"citizenid":"POK60295","gender":0,"nationality":"mexico","lastname":"xena","birthdate":"1998-01-01","firstname":"Justice"},"slot":5,"name":"id_card"},{"type":"item","amount":5,"info":[],"slot":6,"name":"water_bottle"},{"type":"item","amount":5,"info":[],"slot":7,"name":"lockpick"}]', '2023-12-30 15:46:19', '0'),
	(24389, 'QWD83978', 2, 'license:9681271a1ea43872495b44562eaa0745dcb752ff', 'Nafiul Hasan', '{"cash":0,"bank":15630,"crypto":0}', '{"firstname":"kala","birthdate":"2202-08-08","nationality":"bangladesh","cid":"2","lastname":"masud","phone":"6096378646","gender":0,"account":"US01QBCore5957956493","backstory":"placeholder backstory"}', '{"grade":{"name":"Sergeant","level":4},"onduty":true,"name":"police","isboss":false,"type":"leo","payment":490,"label":"Law Enforcement"}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":-227.24835205078126,"y":-1124.4263916015626,"z":23.028564453125}', '{"hunger":93.60000000000037,"fitbit":[],"stress":0,"callsign":"NO CALLSIGN","ishandcuffed":false,"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":25051115,"InstalledApps":[]},"phone":[],"armor":0,"fingerprint":"cj038x09lKS0373","isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"thirst":94.39999999999964,"walletid":"QB-48981382","status":[],"commandbinds":[],"jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"inlaststand":false,"bloodtype":"AB-","communityservice":0,"tracker":false,"jailitems":[],"craftinglevel":0,"dealerrep":0,"injail":0,"craftingrep":0}', '[{"type":"item","info":[],"slot":1,"name":"pistol_ammo","amount":8},{"type":"weapon","info":{"quality":89.20000000000162,"ammo":13,"attachments":[{"component":"COMPONENT_AT_AR_FLSH","label":"Flashlight"},{"component":"COMPONENT_AT_SCOPE_MEDIUM","label":"3x Scope"}],"serie":"94wgq2iQ454PGoZ"},"slot":2,"name":"weapon_carbinerifle","amount":1},{"type":"item","info":[],"slot":3,"name":"radio","amount":1},{"type":"weapon","info":{"ammo":70,"quality":59.05000000000621,"attachments":[{"component":"COMPONENT_AT_PI_FLSH","label":"Flashlight"}],"serie":"73iGP3hq443Kgbp"},"slot":4,"name":"weapon_pistol","amount":1},{"type":"weapon","info":{"quality":100,"ammo":-1,"serie":"17wAG9zv067Bnye"},"slot":5,"name":"weapon_stungun","amount":1},{"type":"item","info":[],"slot":6,"name":"handcuffs","amount":1},{"type":"item","info":[],"slot":7,"name":"cartracker","amount":1},{"type":"item","info":{"birthdate":"2202-08-08","type":"Class C Driver License","firstname":"kala","lastname":"masud"},"slot":8,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":9,"name":"rifle_ammo","amount":10},{"type":"item","info":[],"slot":10,"name":"water_bottle","amount":3},{"type":"item","info":{"firstname":"kala","citizenid":"QWD83978","gender":0,"birthdate":"2202-08-08","nationality":"bangladesh","lastname":"masud"},"slot":11,"name":"id_card","amount":1},{"type":"item","info":[],"slot":12,"name":"smg_ammo","amount":1},{"type":"item","info":[],"slot":13,"name":"phone","amount":1},{"type":"item","info":[],"slot":16,"name":"lockpick","amount":5},{"type":"item","info":[],"slot":17,"name":"bandage","amount":35},{"type":"item","info":[],"slot":18,"name":"police_stormram","amount":2}]', '2023-12-28 20:24:16', '0'),
	(23634, 'SVO00296', 1, 'license:0537ef246442d74c99a645bd4a4408ecbc51a091', 'Guru', '{"cash":510,"bank":3500,"crypto":0}', '{"firstname":"Guru","birthdate":"1999-08-01","nationality":"Bangladeshi","cid":"1","lastname":"Sensei","phone":"1249914725","gender":0,"account":"US08QBCore3742827629","backstory":"placeholder backstory"}', '{"grade":{"name":"Freelancer","level":0},"onduty":true,"name":"unemployed","label":"Civilian","type":"none","payment":10,"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":-224.24176025390626,"y":-1126.12744140625,"z":23.028564453125}', '{"hunger":93.60000000000037,"fitbit":[],"stress":0,"callsign":"NO CALLSIGN","ishandcuffed":false,"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":27956380,"InstalledApps":[]},"phone":[],"armor":0,"injail":0,"isdead":false,"attachmentcraftingrep":0,"inside":{"apartment":[]},"bloodtype":"B-","tracker":false,"thirst":94.39999999999964,"fingerprint":"am325S59lRB3583","jobrep":{"hotdog":0,"trucker":0,"tow":0,"taxi":0},"inlaststand":true,"jailitems":[],"communityservice":0,"commandbinds":[],"walletid":"QB-17764926","craftinglevel":0,"status":[],"dealerrep":0,"craftingrep":0}', '[{"type":"weapon","info":{"quality":93.10000000000105,"ammo":175,"serie":"88IPY4Gm340qklC"},"slot":1,"name":"weapon_snspistol","amount":1},{"type":"item","info":[],"slot":2,"name":"lockpick","amount":5},{"type":"item","info":{"birthdate":"1999-08-01","type":"Class C Driver License","lastname":"Sensei","firstname":"Guru"},"slot":3,"name":"driver_license","amount":1},{"type":"item","info":[],"slot":4,"name":"oxy","amount":3},{"type":"item","info":[],"slot":5,"name":"phone","amount":1},{"type":"item","info":{"firstname":"Guru","citizenid":"SVO00296","gender":0,"birthdate":"1999-08-01","nationality":"Bangladeshi","lastname":"Sensei"},"slot":6,"name":"id_card","amount":1},{"type":"item","info":[],"slot":7,"name":"water_bottle","amount":3}]', '2023-12-28 20:24:17', '0'),
	(23620, 'TDJ01991', 1, 'license:e02a66db06eb03189cfe0e9ec47a654f7e677aab', 'FB-CJ_Israk', '{"cash":77,"crypto":0,"bank":6641}', '{"gender":0,"lastname":"Israk","birthdate":"1999-01-15","phone":"2908390746","account":"US02QBCore2938741281","cid":"1","firstname":"CJ","nationality":"Bangladeshi","backstory":"placeholder backstory","card":3549789187427434}', '{"label":"Civilian","type":"none","grade":{"level":0,"name":"Freelancer"},"isboss":false,"name":"unemployed","onduty":true,"payment":10}', '{"label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"},"name":"none"}', '{"x":136.2857208251953,"y":-925.134033203125,"z":30.1728515625}', '{"thirst":55.19999999999709,"hunger":76.80000000000291,"inside":{"apartment":[]},"dealerrep":0,"commandbinds":[],"jailitems":[],"criminalrecord":{"hasRecord":false},"armor":0,"walletid":"QB-75568447","fingerprint":"bP037V86cCw4526","communityservice":0,"ishandcuffed":false,"injail":0,"craftinglevel":0,"bloodtype":"B-","status":[],"phonedata":{"InstalledApps":[],"SerialNumber":68702401},"craftingrep":0,"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"tracker":false,"phone":[],"isdead":false,"stress":0,"callsign":"NO CALLSIGN","inlaststand":false,"licences":{"driver":true,"business":false,"weapon":false},"fitbit":[],"attachmentcraftingrep":0}', '[{"type":"item","name":"sandwich","info":[],"slot":1,"amount":27},{"type":"item","name":"bakingsoda","info":[],"slot":2,"amount":13},{"type":"item","name":"driver_license","info":{"birthdate":"1999-01-15","type":"Class C Driver License","firstname":"CJ","lastname":"Israk"},"slot":3,"amount":1},{"type":"item","name":"beer","info":[],"slot":4,"amount":43},{"type":"item","name":"phone","info":[],"slot":5,"amount":1},{"type":"item","name":"id_card","info":{"gender":0,"citizenid":"TDJ01991","birthdate":"1999-01-15","lastname":"Israk","firstname":"CJ","nationality":"Bangladeshi"},"slot":6,"amount":1},{"type":"item","name":"water_bottle","info":[],"slot":7,"amount":28},{"type":"item","name":"scorcher","info":{"plate":"BICYCLE6","xenonColor":0,"pearlescentColor":0,"wheelColor":0,"colorSecondary":0,"colorPrimary":0},"slot":8,"amount":1},{"type":"item","name":"tosti","info":[],"slot":9,"amount":37},{"type":"item","name":"snikkel_candy","info":[],"slot":10,"amount":50},{"type":"weapon","name":"weapon_petrolcan","info":{"quality":100,"serie":"43brY2JH167DEWq"},"slot":11,"amount":1},{"type":"item","name":"mastercard","info":{"cardActive":true,"name":"CJ Israk","citizenid":"TDJ01991","cardPin":1379,"cardType":"mastercard","cardNumber":3549789187427434},"slot":12,"amount":1},{"type":"item","name":"lighter","info":[],"slot":13,"amount":5},{"type":"item","name":"rolling_paper","info":[],"slot":14,"amount":4},{"type":"item","name":"pistol_ammo","info":[],"slot":15,"amount":12},{"type":"weapon","name":"weapon_snspistol","info":{"quality":96.25000000000056,"ammo":12,"serie":"97har1lt624YXNC"},"slot":16,"amount":1},{"type":"weapon","name":"weapon_knife","info":{"quality":100,"ammo":0,"serie":"15LWI8qX682Cbnf"},"slot":17,"amount":1},{"type":"item","name":"bandage","info":[],"slot":18,"amount":1},{"type":"item","name":"chopradio","info":{"quality":100},"slot":19,"amount":1},{"type":"item","name":"joint","info":[],"slot":20,"amount":6},{"type":"item","name":"lockpick","info":[],"slot":21,"amount":9}]', '2023-12-29 11:51:34', '0'),
	(23536, 'TRQ74282', 1, 'license:652da29b63d74e5ed9a933c395ac5f82793ca5c6', 'MD SAIFUL YT', '{"bank":8016,"crypto":0,"cash":1761}', '{"gender":0,"card":3134347430703250,"phone":"9923101717","birthdate":"2000-06-26","lastname":"Man","cid":"1","account":"US07QBCore5289781138","backstory":"placeholder backstory","firstname":"Halka","nationality":"Bangladesh"}', '{"label":"Garbage","type":"none","payment":50,"onduty":true,"name":"garbage","grade":{"level":0,"name":"Collector"},"isboss":false}', '{"label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"},"name":"none"}', '{"x":-1504.918701171875,"y":1512.4747314453126,"z":115.2813720703125}', '{"isdead":false,"injail":0,"jailitems":[],"hunger":70.40000000000511,"inside":{"apartment":[]},"fingerprint":"fU090r67ZIM3908","jobrep":{"tow":0,"trucker":0,"hotdog":0,"taxi":0},"commandbinds":[],"bloodtype":"AB+","criminalrecord":{"hasRecord":false},"status":[],"walletid":"QB-42767625","phonedata":{"InstalledApps":[],"SerialNumber":34676105},"thirst":63.59999999999763,"fitbit":[],"phone":[],"ishandcuffed":false,"inlaststand":false,"craftingrep":0,"tracker":false,"armor":0,"communityservice":0,"callsign":"NO CALLSIGN","dealerrep":0,"licences":{"business":false,"weapon":true,"driver":true},"stress":11,"craftinglevel":0,"attachmentcraftingrep":0}', '[{"name":"advancedlockpick","slot":1,"amount":1,"type":"item","info":[]},{"name":"chopradio","slot":2,"amount":1,"type":"item","info":{"quality":100}},{"name":"weapon_knife","slot":3,"amount":1,"type":"weapon","info":{"serie":"61ofd8pv083QRlT","quality":99.40000000000008,"ammo":0}},{"name":"sandwich","slot":4,"amount":1,"type":"item","info":[]},{"name":"water_bottle","slot":5,"amount":4,"type":"item","info":[]},{"name":"id_card","slot":6,"amount":1,"type":"item","info":{"birthdate":"2000-06-26","firstname":"Halka","lastname":"Man","gender":0,"nationality":"Bangladesh","citizenid":"TRQ74282"}},{"name":"phone","slot":7,"amount":1,"type":"item","info":[]},{"name":"coca_leaf","slot":8,"amount":26,"type":"item","info":[]},{"name":"pistol_ammo","slot":9,"amount":18,"type":"item","info":[]},{"name":"steel","slot":10,"amount":7,"type":"item","info":[]},{"name":"weaponlicense","slot":11,"amount":1,"type":"item","info":{"lastname":"Man","birthdate":"2000-06-26","firstname":"Halka"}},{"name":"handcuffs","slot":12,"amount":1,"type":"item","info":{"quality":100}},{"name":"metalscrap","slot":13,"amount":14,"type":"item","info":[]},{"name":"bakingsoda","slot":14,"amount":75,"type":"item","info":{"quality":100}},{"name":"rubber","slot":15,"amount":9,"type":"item","info":[]},{"name":"driver_license","slot":16,"amount":1,"type":"item","info":{"lastname":"Man","type":"Class C Driver License","birthdate":"2000-06-26","firstname":"Halka"}},{"name":"scorcher","slot":17,"amount":1,"type":"item","info":{"plate":"BICYCLE1","colorPrimary":0,"wheelColor":0,"colorSecondary":0,"xenonColor":0,"pearlescentColor":0}},{"name":"lsd","slot":18,"amount":2,"type":"item","info":[]},{"name":"aluminum","slot":19,"amount":9,"type":"item","info":[]},{"name":"weed_skunk","slot":20,"amount":7,"type":"item","info":[]},{"name":"radio","slot":21,"amount":1,"type":"item","info":[]},{"name":"weapon_petrolcan","slot":36,"amount":1,"type":"weapon","info":{"serie":"48hQi6Mt259EtKu","quality":100}},{"name":"weapon_snspistol","slot":41,"amount":1,"type":"weapon","info":{"serie":"62Skj3mJ868HtZK","quality":52.75000000000717,"ammo":140}}]', '2023-12-31 13:24:52', '0'),
	(25958, 'UAW49817', 1, 'license:dbf58365765440d98f12d5b7b33fb6e685a186e6', 'ddostokaydandy', '{"bank":5000,"cash":500,"crypto":0}', '{"birthdate":"2000-11-11","backstory":"placeholder backstory","lastname":"Dandy","gender":0,"nationality":"BD","account":"US01QBCore6972497545","phone":"8225041790","firstname":"Tokay","cid":"1"}', '{"isboss":false,"type":"none","label":"Civilian","grade":{"name":"Freelancer","level":0},"onduty":true,"name":"unemployed","payment":10}', '{"isboss":false,"label":"No Gang Affiliaton","name":"none","grade":{"name":"none","level":0}}', '{"x":-681.4549560546875,"y":-1094.795654296875,"z":14.5194091796875}', '{"armor":0,"craftingrep":0,"phonedata":{"SerialNumber":17918483,"InstalledApps":[]},"craftinglevel":0,"inside":{"apartment":[]},"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"fitbit":[],"dealerrep":0,"isdead":false,"tracker":false,"thirst":94.39999999999964,"walletid":"QB-92754188","fingerprint":"Bp601o71Gtg7331","callsign":"NO CALLSIGN","ishandcuffed":false,"bloodtype":"B+","jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":0,"attachmentcraftingrep":0,"hunger":93.60000000000037,"inlaststand":false,"status":[],"communityservice":0,"jailitems":[],"phone":[],"commandbinds":[],"injail":0}', '[{"name":"driver_license","type":"item","amount":1,"info":{"birthdate":"2000-11-11","firstname":"Tokay","lastname":"Dandy","type":"Class C Driver License"},"slot":1},{"name":"sandwich","type":"item","amount":5,"info":[],"slot":2},{"name":"scorcher","type":"item","amount":1,"info":[],"slot":3},{"name":"id_card","type":"item","amount":1,"info":{"firstname":"Tokay","citizenid":"UAW49817","birthdate":"2000-11-11","nationality":"BD","lastname":"Dandy","gender":0},"slot":4},{"name":"lockpick","type":"item","amount":5,"info":[],"slot":5},{"name":"water_bottle","type":"item","amount":5,"info":[],"slot":6},{"name":"phone","type":"item","amount":1,"info":[],"slot":7}]', '2023-12-28 09:39:36', '0'),
	(25928, 'VZG24611', 1, 'license:264c9694b23cca2127d54e0a398b7d913a9df2ed', 'Elber', '{"bank":4810,"cash":500,"crypto":0}', '{"birthdate":"1980-02-01","backstory":"placeholder backstory","lastname":"galarga","gender":0,"nationality":"mexican","account":"US04QBCore3248511213","phone":"2644396369","firstname":"elber","cid":"1"}', '{"isboss":false,"type":"none","label":"Garbage","grade":{"name":"Collector","level":0},"onduty":true,"name":"garbage","payment":50}', '{"isboss":false,"label":"No Gang Affiliaton","name":"none","grade":{"name":"none","level":0}}', '{"x":230.55824279785157,"y":288.1582336425781,"z":105.5758056640625}', '{"armor":0,"craftingrep":0,"phonedata":{"SerialNumber":98566887,"InstalledApps":[]},"craftinglevel":0,"inside":{"apartment":[]},"licences":{"weapon":false,"business":false,"driver":true},"criminalrecord":{"hasRecord":false},"fitbit":[],"dealerrep":0,"isdead":false,"tracker":false,"thirst":74.5999999999949,"walletid":"QB-44622541","fingerprint":"ua425r90AMA4002","callsign":"NO CALLSIGN","ishandcuffed":false,"bloodtype":"AB-","jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":0,"attachmentcraftingrep":0,"hunger":40.40000000000509,"inlaststand":false,"status":[],"communityservice":0,"jailitems":[],"phone":[],"commandbinds":[],"injail":0}', '[{"name":"driver_license","type":"item","amount":1,"info":{"birthdate":"1980-02-01","firstname":"elber","lastname":"galarga","type":"Class C Driver License"},"slot":1},{"name":"sandwich","type":"item","amount":7,"info":[],"slot":2},{"name":"id_card","type":"item","amount":1,"info":{"firstname":"elber","citizenid":"VZG24611","birthdate":"1980-02-01","nationality":"mexican","lastname":"galarga","gender":0},"slot":4},{"name":"lockpick","type":"item","amount":5,"info":[],"slot":5},{"name":"water_bottle","type":"item","amount":4,"info":[],"slot":6},{"name":"phone","type":"item","amount":1,"info":[],"slot":7}]', '2023-12-28 07:47:34', '0'),
	(27149, 'YYJ40505', 1, 'license:ff7d977d9b3b917aa52de6315b5a8be738dca7f1', 'Lurlene', '{"cash":500,"bank":4760,"crypto":0}', '{"nationality":"ph","gender":0,"backstory":"placeholder backstory","phone":"8772519382","cid":"1","lastname":"asda","birthdate":"1999-09-29","firstname":"sdada","account":"US06QBCore3247148067"}', '{"payment":530,"name":"ambulance","label":"EMS","grade":{"level":4,"name":"Doctor"},"isboss":false,"onduty":false,"type":"ems"}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":259.1604309082031,"y":-585.2307739257813,"z":43.2989501953125}', '{"stress":0,"tracker":false,"phone":[],"commandbinds":[],"jailitems":[],"armor":0,"inside":{"apartment":[]},"ishandcuffed":false,"walletid":"QB-62842413","communityservice":0,"criminalrecord":{"hasRecord":false},"fitbit":[],"thirst":88.79999999999927,"callsign":"NO CALLSIGN","fingerprint":"iw777M74iMp1835","jobrep":{"hotdog":0,"taxi":0,"trucker":0,"tow":0},"attachmentcraftingrep":0,"craftinglevel":0,"dealerrep":0,"isdead":false,"craftingrep":0,"bloodtype":"B-","phonedata":{"InstalledApps":[],"SerialNumber":54282180},"status":[],"hunger":87.20000000000073,"inlaststand":false,"injail":0,"licences":{"business":false,"driver":true,"weapon":false}}', '[{"type":"item","amount":1,"info":[],"slot":1,"name":"phone"},{"type":"item","amount":1,"info":{"lastname":"asda","type":"Class C Driver License","birthdate":"1999-09-29","firstname":"sdada"},"slot":2,"name":"driver_license"},{"type":"item","amount":5,"info":[],"slot":4,"name":"sandwich"},{"type":"item","amount":1,"info":{"citizenid":"YYJ40505","gender":0,"nationality":"ph","lastname":"asda","birthdate":"1999-09-29","firstname":"sdada"},"slot":5,"name":"id_card"},{"type":"item","amount":5,"info":[],"slot":6,"name":"water_bottle"},{"type":"item","amount":5,"info":[],"slot":7,"name":"lockpick"}]', '2023-12-30 19:15:17', '0'),
	(23446, 'ZHU89190', 1, 'license:893bb2ec3ffbec4fddb31d2b71222e4c69e33153', 'Flowwyy', '{"bank":5010,"cash":500,"crypto":0}', '{"account":"US07QBCore7357318397","backstory":"placeholder backstory","gender":0,"birthdate":"2000-07-14","phone":"2617954582","cid":"1","nationality":"mexicabn","firstname":"eric","lastname":"sal"}', '{"type":"none","name":"unemployed","payment":10,"label":"Civilian","onduty":true,"isboss":false,"grade":{"name":"Freelancer","level":0}}', '{"grade":{"name":"none","level":0},"isboss":false,"name":"none","label":"No Gang Affiliaton"}', '{"x":531.6263427734375,"y":-188.03076171875,"z":53.4425048828125}', '{"inside":{"apartment":[]},"thirst":77.19999999999891,"tracker":false,"phonedata":{"InstalledApps":[],"SerialNumber":51129310},"licences":{"driver":true,"business":false,"weapon":false},"injail":0,"jobrep":{"taxi":0,"tow":0,"trucker":0,"hotdog":0},"phone":[],"callsign":"NO CALLSIGN","fingerprint":"qQ009O32hev9212","walletid":"QB-52544276","communityservice":0,"jailitems":[],"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":0,"commandbinds":[],"armor":0,"stress":7,"bloodtype":"A+","craftinglevel":0,"dealerrep":0,"craftingrep":0,"ishandcuffed":false,"hunger":74.79999999999564,"fitbit":[],"inlaststand":false,"status":[],"isdead":false}', '[{"name":"id_card","type":"item","slot":2,"info":{"lastname":"sal","citizenid":"ZHU89190","birthdate":"2000-07-14","firstname":"eric","gender":0,"nationality":"mexicabn"},"amount":1},{"name":"lockpick","type":"item","slot":3,"info":[],"amount":5},{"name":"driver_license","type":"item","slot":4,"info":{"lastname":"sal","firstname":"eric","birthdate":"2000-07-14","type":"Class C Driver License"},"amount":1},{"name":"water_bottle","type":"item","slot":5,"info":[],"amount":5},{"name":"phone","type":"item","slot":6,"info":[],"amount":1},{"name":"sandwich","type":"item","slot":7,"info":[],"amount":5}]', '2023-12-25 19:32:09', '0'),
	(27084, 'ZYD20476', 1, 'license:859e306f2efa53bccbbe866dda384bffaa3986af', 'Trout', '{"cash":9996490,"crypto":0,"bank":5000}', '{"firstname":"Tyler","phone":"1863701839","account":"US05QBCore9304117489","cid":"1","lastname":"Tester","nationality":"White","birthdate":"1998-10-24","backstory":"placeholder backstory","gender":0}', '{"label":"Civilian","name":"unemployed","type":"none","onduty":true,"isboss":false,"grade":{"level":0,"name":"Freelancer"},"payment":10}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-2307.177978515625,"y":-323.0637512207031,"z":13.2725830078125}', '{"craftinglevel":0,"craftingrep":0,"thirst":57.99999999999727,"inside":{"apartment":[]},"walletid":"QB-96487192","fingerprint":"eQ292X53sGR7458","dealerrep":0,"isdead":false,"hunger":52.00000000000273,"commandbinds":[],"injail":0,"fitbit":[],"inlaststand":false,"armor":0,"status":[],"criminalrecord":{"hasRecord":false},"licences":{"driver":true,"weapon":false,"business":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"attachmentcraftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":76622180},"ishandcuffed":false,"callsign":"NO CALLSIGN","stress":8,"phone":[],"communityservice":0,"jailitems":[],"tracker":false,"bloodtype":"O+"}', '[{"slot":1,"amount":1,"type":"weapon","name":"weapon_snspistol","info":{"ammo":7,"quality":99.40000000000009,"serie":"64oan6Xh212kzYl"}},{"slot":2,"amount":1,"type":"item","name":"laptop","info":[]},{"slot":3,"amount":9,"type":"item","name":"pistol_ammo","info":[]},{"slot":7,"amount":5,"type":"item","name":"lockpick","info":[]},{"slot":8,"amount":1,"type":"item","name":"id_card","info":{"firstname":"Tyler","lastname":"Tester","birthdate":"1998-10-24","nationality":"White","gender":0,"citizenid":"ZYD20476"}},{"slot":9,"amount":1,"type":"item","name":"driver_license","info":{"firstname":"Tyler","lastname":"Tester","type":"Class C Driver License","birthdate":"1998-10-24"}},{"slot":10,"amount":5,"type":"item","name":"sandwich","info":[]},{"slot":11,"amount":1,"type":"item","name":"phone","info":[]},{"slot":12,"amount":1,"type":"item","name":"scorcher","info":[]},{"slot":13,"amount":5,"type":"item","name":"water_bottle","info":[]}]', '2023-12-30 02:45:27', '0');

-- Dumping structure for table s879692_banglapixel.playerskins
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s879692_banglapixel.playerskins: ~22 rows (approximately)
DELETE FROM `playerskins`;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(1032, 'BPM27715', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","faceFeatures":{"chinBoneSize":0,"noseBoneTwist":0,"nosePeakHigh":0,"lipsThickness":0,"noseWidth":0,"neckThickness":0,"chinBoneLowering":0,"eyeBrownForward":0,"chinBoneLenght":0,"noseBoneHigh":0,"nosePeakLowering":0,"jawBoneWidth":0,"eyesOpening":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"cheeksWidth":0,"cheeksBoneWidth":0,"nosePeakSize":0,"eyeBrownHigh":0,"chinHole":0},"eyeColor":-1,"headOverlays":{"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"blush":{"style":0,"color":0,"secondColor":0,"opacity":0},"beard":{"style":0,"color":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"secondColor":0,"opacity":0},"sunDamage":{"style":0,"color":0,"secondColor":0,"opacity":0},"blemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"ageing":{"style":0,"color":0,"secondColor":0,"opacity":0},"eyebrows":{"style":0,"color":0,"secondColor":0,"opacity":0},"chestHair":{"style":0,"color":0,"secondColor":0,"opacity":0},"lipstick":{"style":0,"color":0,"secondColor":0,"opacity":0},"complexion":{"style":0,"color":0,"secondColor":0,"opacity":0}},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":189},{"component_id":8,"texture":2,"drawable":5},{"component_id":3,"texture":0,"drawable":1},{"component_id":4,"texture":0,"drawable":68},{"component_id":6,"texture":2,"drawable":29},{"component_id":10,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":24}],"hair":{"texture":0,"highlight":10,"style":0,"color":21},"props":[{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1},{"drawable":17,"prop_id":1,"texture":0},{"drawable":4,"prop_id":0,"texture":0}],"headBlend":{"skinThird":0,"shapeMix":0,"skinFirst":0,"shapeSecond":6,"shapeFirst":0,"skinMix":0,"thirdMix":0,"skinSecond":0,"shapeThird":0},"tattoos":{"ZONE_HAIR":[{"hashMale":"FM_M_Hair_003_c","collection":"multiplayer_overlays","name":"hair-0-188","label":"hair-0-188","hashFemale":"FM_F_Hair_003_c","zone":"ZONE_HAIR"}]}}', 1),
	(1034, 'OQO35854', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0}},"headBlend":{"thirdMix":0,"skinMix":0,"shapeMix":0,"shapeSecond":0,"shapeFirst":0,"skinThird":0,"skinSecond":0,"skinFirst":0,"shapeThird":0},"tattoos":[],"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"faceFeatures":{"nosePeakSize":0,"eyesOpening":0,"cheeksBoneHigh":0,"noseWidth":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"nosePeakHigh":0,"cheeksWidth":0,"jawBoneBackSize":0,"eyeBrownForward":0,"lipsThickness":0,"chinHole":0,"jawBoneWidth":0,"noseBoneTwist":0,"chinBoneLenght":0,"eyeBrownHigh":0,"nosePeakLowering":0,"noseBoneHigh":0,"neckThickness":0},"eyeColor":-1,"model":"mp_m_freemode_01","hair":{"color":0,"texture":0,"style":0,"highlight":0}}', 1),
	(1035, 'ZHU89190', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headOverlays":{"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0},"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0}},"headBlend":{"thirdMix":0,"skinMix":0,"shapeMix":0,"shapeSecond":0,"shapeFirst":0,"skinThird":0,"skinSecond":0,"skinFirst":0,"shapeThird":0},"tattoos":[],"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"faceFeatures":{"noseBoneTwist":0,"eyesOpening":0,"jawBoneWidth":0,"noseWidth":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"nosePeakHigh":0,"cheeksWidth":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"noseBoneHigh":0,"nosePeakLowering":0,"chinHole":0,"chinBoneLenght":0,"eyeBrownForward":0,"eyeBrownHigh":0,"lipsThickness":0,"neckThickness":0,"nosePeakSize":0},"eyeColor":-1,"hair":{"color":0,"texture":0,"highlight":0,"style":0},"model":"mp_m_freemode_01"}', 1),
	(1036, 'BWP17481', 'mp_m_freemode_01', '{"headOverlays":{"complexion":{"secondColor":0,"opacity":0,"color":0,"style":0},"blush":{"secondColor":0,"opacity":0,"color":0,"style":0},"lipstick":{"secondColor":0,"opacity":0,"color":0,"style":0},"eyebrows":{"secondColor":0,"opacity":0,"color":0,"style":0},"blemishes":{"secondColor":0,"opacity":0,"color":0,"style":0},"beard":{"secondColor":0,"opacity":0,"color":0,"style":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"color":0,"style":0},"chestHair":{"secondColor":0,"opacity":0,"color":0,"style":0},"ageing":{"secondColor":0,"opacity":0,"color":0,"style":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"color":0,"style":0},"sunDamage":{"secondColor":0,"opacity":0,"color":0,"style":0},"makeUp":{"secondColor":0,"opacity":0,"color":0,"style":0}},"model":"mp_m_freemode_01","headBlend":{"skinSecond":0,"skinMix":0,"skinThird":0,"shapeSecond":0,"shapeMix":0,"skinFirst":0,"shapeThird":0,"thirdMix":0,"shapeFirst":0},"tattoos":[],"hair":{"texture":0,"highlight":0,"color":0,"style":0},"faceFeatures":{"chinBoneSize":0,"cheeksWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"nosePeakLowering":0,"noseWidth":0,"eyeBrownHigh":0,"chinBoneLowering":0,"chinBoneLenght":0,"cheeksBoneHigh":0,"neckThickness":0,"noseBoneTwist":0,"jawBoneWidth":0,"eyesOpening":0,"chinHole":0,"nosePeakHigh":0,"lipsThickness":0,"jawBoneBackSize":0,"noseBoneHigh":0,"nosePeakSize":0},"eyeColor":-1,"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]}', 1),
	(1040, 'TDJ01991', 'mp_m_freemode_01', '{"eyeColor":12,"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":7,"component_id":11,"texture":0},{"drawable":1,"component_id":4,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":12,"component_id":6,"texture":0}],"tattoos":[],"headBlend":{"shapeThird":0,"thirdMix":0,"shapeSecond":0,"shapeMix":0,"skinFirst":0,"skinThird":0,"skinSecond":0,"shapeFirst":0,"skinMix":0},"faceFeatures":{"chinHole":0,"eyeBrownHigh":1,"nosePeakHigh":0,"cheeksWidth":-1,"chinBoneLowering":0.5,"lipsThickness":0.2,"cheeksBoneHigh":-0.5,"chinBoneLenght":-1,"neckThickness":0,"jawBoneBackSize":0.4,"chinBoneSize":0,"eyeBrownForward":-1,"noseBoneTwist":0,"eyesOpening":-1,"nosePeakSize":0,"noseWidth":0,"cheeksBoneWidth":1,"jawBoneWidth":-0.5,"noseBoneHigh":0,"nosePeakLowering":0},"hair":{"style":11,"texture":0,"highlight":0,"color":0},"headOverlays":{"lipstick":{"style":0,"secondColor":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"blemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"beard":{"style":12,"secondColor":0,"opacity":1,"color":61},"ageing":{"style":0,"secondColor":0,"opacity":0,"color":0},"blush":{"style":0,"secondColor":0,"opacity":0,"color":0},"complexion":{"style":0,"secondColor":0,"opacity":0,"color":0},"eyebrows":{"style":4,"secondColor":0,"opacity":1,"color":61},"chestHair":{"style":16,"secondColor":0,"opacity":1,"color":61},"moleAndFreckles":{"style":0,"secondColor":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"sunDamage":{"style":0,"secondColor":0,"opacity":0,"color":0}},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7},{"drawable":17,"texture":0,"prop_id":1}],"model":"mp_m_freemode_01"}', 1),
	(1042, 'SVO00296', 'mp_m_freemode_01', '{"eyeColor":6,"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":7},{"drawable":6,"texture":0,"component_id":11},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":5},{"drawable":17,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":8},{"drawable":30,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":6}],"tattoos":{"ZONE_HAIR":[{"label":"hair-0-186","collection":"multiplayer_overlays","hashMale":"FM_M_Hair_003_a","zone":"ZONE_HAIR","hashFemale":"FM_F_Hair_003_a","name":"hair-0-186"}]},"headBlend":{"shapeThird":0,"thirdMix":0,"skinSecond":1,"shapeMix":0,"shapeFirst":6,"skinFirst":32,"shapeSecond":8,"skinThird":0,"skinMix":0.1},"model":"mp_m_freemode_01","hair":{"style":9,"texture":0,"highlight":29,"color":2},"headOverlays":{"lipstick":{"style":0,"secondColor":0,"opacity":0,"color":0},"ageing":{"style":0,"secondColor":0,"opacity":0,"color":0},"blemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"beard":{"style":1,"secondColor":0,"opacity":0.5,"color":2},"moleAndFreckles":{"style":0,"secondColor":0,"opacity":0,"color":0},"makeUp":{"style":94,"secondColor":0,"opacity":0,"color":0},"complexion":{"style":0,"secondColor":0,"opacity":0,"color":0},"eyebrows":{"style":7,"secondColor":0,"opacity":1,"color":0},"chestHair":{"style":0,"secondColor":0,"opacity":0,"color":0},"sunDamage":{"style":0,"secondColor":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"blush":{"style":0,"secondColor":0,"opacity":0,"color":0}},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"faceFeatures":{"chinHole":0,"eyeBrownHigh":-0.1,"nosePeakHigh":0.5,"cheeksWidth":0,"chinBoneLowering":0.6,"lipsThickness":0,"cheeksBoneHigh":-0.6,"chinBoneLenght":0.1,"neckThickness":0,"jawBoneBackSize":0.3,"eyesOpening":0,"eyeBrownForward":0.6,"noseBoneTwist":0,"nosePeakLowering":0,"nosePeakSize":0,"noseWidth":-0.2,"cheeksBoneWidth":-0.1,"jawBoneWidth":-0.6,"noseBoneHigh":0,"chinBoneSize":0.2}}', 1),
	(1046, 'FYZ04801', 'mp_m_freemode_01', '{"eyeColor":-1,"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":7,"component_id":11,"texture":0}],"tattoos":[],"headBlend":{"shapeThird":0,"thirdMix":0,"skinSecond":0,"shapeFirst":19,"skinThird":0,"skinFirst":15,"skinMix":0,"shapeMix":0,"shapeSecond":0},"faceFeatures":{"chinHole":0,"eyeBrownHigh":0,"nosePeakHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"lipsThickness":0,"cheeksBoneHigh":0,"chinBoneLenght":0,"neckThickness":0,"jawBoneBackSize":0,"noseWidth":0,"eyeBrownForward":0,"noseBoneTwist":0,"nosePeakLowering":0,"nosePeakSize":0,"jawBoneWidth":0,"chinBoneSize":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"eyesOpening":0},"hair":{"style":34,"texture":0,"highlight":0,"color":0},"headOverlays":{"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":1,"secondColor":0,"style":0,"color":0},"beard":{"opacity":1,"secondColor":0,"style":13,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0.4,"secondColor":0,"style":0,"color":0}},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01"}', 1),
	(1052, 'QWD83978', 'mp_m_freemode_01', '{"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":15,"texture":6},{"prop_id":2,"drawable":14,"texture":0},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"eyeColor":-1,"tattoos":{"ZONE_HAIR":[{"name":"hair-0-187","hashFemale":"FM_F_Hair_003_b","collection":"multiplayer_overlays","zone":"ZONE_HAIR","hashMale":"FM_M_Hair_003_b","label":"hair-0-187"}]},"hair":{"style":33,"color":10,"highlight":29,"texture":0},"headBlend":{"shapeFirst":0,"skinFirst":0,"shapeThird":0,"thirdMix":0,"skinSecond":0,"shapeMix":0,"shapeSecond":0,"skinThird":0,"skinMix":0},"headOverlays":{"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0}},"faceFeatures":{"chinBoneLowering":0,"chinBoneSize":0,"chinHole":0,"eyeBrownForward":0,"cheeksWidth":0,"noseBoneTwist":0,"nosePeakHigh":0,"noseWidth":0,"jawBoneBackSize":0,"noseBoneHigh":0,"chinBoneLenght":0,"jawBoneWidth":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"eyesOpening":0,"nosePeakSize":0,"nosePeakLowering":0,"lipsThickness":0,"neckThickness":0},"model":"mp_m_freemode_01","components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":32,"texture":1},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":31,"texture":0},{"component_id":4,"drawable":138,"texture":5},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":214,"texture":0},{"component_id":7,"drawable":8,"texture":0},{"component_id":8,"drawable":2,"texture":0},{"component_id":9,"drawable":14,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":367,"texture":5}]}', 1),
	(1055, 'TRQ74282', 'mp_m_freemode_01', '{"faceFeatures":{"noseWidth":0,"eyesOpening":0,"cheeksBoneHigh":0,"chinHole":0,"nosePeakLowering":0,"neckThickness":0,"nosePeakHigh":0,"noseBoneTwist":0,"lipsThickness":0,"noseBoneHigh":0,"chinBoneLenght":0,"cheeksBoneWidth":0,"jawBoneWidth":0,"nosePeakSize":0,"eyeBrownHigh":0,"chinBoneLowering":0,"chinBoneSize":0,"cheeksWidth":0,"eyeBrownForward":0,"jawBoneBackSize":0},"eyeColor":-1,"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7},{"drawable":4,"texture":7,"prop_id":1}],"hair":{"color":39,"texture":0,"highlight":39,"style":11},"tattoos":[],"headBlend":{"shapeMix":0,"skinFirst":0,"thirdMix":0,"skinThird":0,"skinSecond":0,"shapeSecond":0,"shapeFirst":0,"skinMix":0,"shapeThird":0},"headOverlays":{"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":39,"color":39,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0}},"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":146,"texture":0,"component_id":1},{"drawable":11,"texture":0,"component_id":2},{"drawable":31,"texture":0,"component_id":3},{"drawable":260,"texture":12,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":56,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":162,"texture":0,"component_id":11}]}', 1),
	(1056, 'IAO30259', 'mp_m_freemode_01', '{"faceFeatures":{"noseWidth":0.3,"eyesOpening":-0.5,"cheeksBoneHigh":0,"chinHole":0,"jawBoneBackSize":0.6,"neckThickness":0,"nosePeakHigh":0.2,"noseBoneTwist":0,"lipsThickness":0.3,"noseBoneHigh":-0.1,"chinBoneLenght":0.1,"cheeksBoneWidth":0.6,"jawBoneWidth":-0.1,"nosePeakSize":0,"eyeBrownHigh":-0.2,"nosePeakLowering":0,"chinBoneSize":0,"cheeksWidth":0.4,"chinBoneLowering":0,"eyeBrownForward":0},"eyeColor":0,"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"hair":{"highlight":61,"texture":0,"color":61,"style":21},"tattoos":[],"headBlend":{"shapeMix":0,"skinFirst":11,"thirdMix":0.4,"skinThird":0,"skinMix":0,"shapeSecond":0,"skinSecond":7,"shapeFirst":0,"shapeThird":6},"headOverlays":{"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0.7,"style":0},"beard":{"secondColor":0,"color":61,"opacity":0,"style":6},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0}},"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":8},{"drawable":50,"texture":0,"component_id":11}]}', 1),
	(1057, 'VZG24611', 'u_m_m_jesus_01', '{"tattoos":[],"hair":{"color":-1,"texture":0,"highlight":-1,"style":0},"model":"u_m_m_jesus_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"headOverlays":{"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0}},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"faceFeatures":{"nosePeakLowering":0,"eyesOpening":0,"jawBoneWidth":0,"noseWidth":0,"cheeksBoneWidth":0,"lipsThickness":0,"cheeksBoneHigh":0,"nosePeakSize":0,"chinBoneLenght":0,"chinHole":0,"nosePeakHigh":0,"noseBoneTwist":0,"jawBoneBackSize":0,"eyeBrownForward":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinBoneLowering":0,"cheeksWidth":0,"neckThickness":0,"chinBoneSize":0},"headBlend":{"shapeSecond":0,"skinFirst":0,"thirdMix":0,"shapeFirst":0,"skinSecond":0,"skinThird":0,"shapeMix":0,"shapeThird":0,"skinMix":0},"eyeColor":-1}', 1),
	(1058, 'UAW49817', 'mp_m_freemode_01', '{"headOverlays":{"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0}},"hair":{"color":0,"texture":0,"highlight":0,"style":0},"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"eyeColor":-1,"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"faceFeatures":{"nosePeakLowering":0,"eyesOpening":0,"jawBoneWidth":0,"noseWidth":0,"cheeksBoneWidth":0,"lipsThickness":0,"cheeksBoneHigh":0,"nosePeakSize":0,"chinBoneLenght":0,"chinHole":0,"nosePeakHigh":0,"noseBoneTwist":0,"jawBoneBackSize":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinBoneLowering":0,"eyeBrownForward":0,"neckThickness":0,"chinBoneSize":0},"tattoos":[],"headBlend":{"shapeSecond":0,"skinFirst":0,"thirdMix":0,"shapeFirst":0,"skinSecond":0,"skinThird":0,"shapeMix":0,"shapeThird":0,"skinMix":0}}', 1),
	(1059, 'MQZ24811', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"texture":0,"highlight":0,"style":0},"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"headOverlays":{"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0}},"props":[{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1},{"drawable":-1,"prop_id":0,"texture":-1}],"faceFeatures":{"nosePeakLowering":0,"eyesOpening":0,"jawBoneWidth":0,"noseWidth":0,"cheeksBoneWidth":0,"lipsThickness":0,"cheeksBoneHigh":0,"nosePeakSize":0,"neckThickness":0,"chinHole":0,"nosePeakHigh":0,"noseBoneTwist":0,"jawBoneBackSize":0,"eyeBrownForward":0,"chinBoneLenght":0,"eyeBrownHigh":0,"chinBoneLowering":0,"cheeksWidth":0,"noseBoneHigh":0,"chinBoneSize":0},"eyeColor":-1,"headBlend":{"shapeSecond":0,"skinFirst":0,"thirdMix":0,"shapeFirst":0,"skinSecond":0,"skinThird":0,"shapeMix":0,"shapeThird":0,"skinMix":0}}', 1),
	(1061, 'OXF39132', 'u_f_y_lauren', '{"model":"u_f_y_lauren","eyeColor":-1,"hair":{"style":0,"highlight":-1,"color":-1,"texture":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headBlend":{"thirdMix":0,"shapeMix":0,"shapeThird":0,"skinSecond":0,"skinThird":0,"skinFirst":0,"skinMix":0,"shapeFirst":0,"shapeSecond":0},"headOverlays":{"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0}},"tattoos":[],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"faceFeatures":{"chinBoneLenght":0,"cheeksBoneHigh":0,"neckThickness":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"noseWidth":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"noseBoneHigh":0,"lipsThickness":0,"cheeksWidth":0,"eyeBrownHigh":0,"nosePeakHigh":0,"nosePeakSize":0,"chinHole":0,"jawBoneBackSize":0,"eyeBrownForward":0,"nosePeakLowering":0}}', 1),
	(1062, 'KDB24356', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","eyeColor":23,"hair":{"color":1,"highlight":0,"style":23,"texture":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":3,"component_id":1,"texture":0},{"drawable":210,"component_id":7,"texture":0},{"drawable":641,"component_id":11,"texture":0},{"drawable":321,"component_id":8,"texture":0},{"drawable":170,"component_id":5,"texture":0},{"drawable":221,"component_id":3,"texture":0},{"drawable":8,"component_id":4,"texture":0},{"drawable":24,"component_id":6,"texture":0}],"headBlend":{"thirdMix":0,"shapeMix":0,"shapeThird":5,"skinSecond":7,"skinThird":0,"skinMix":0,"skinFirst":27,"shapeFirst":35,"shapeSecond":0},"headOverlays":{"moleAndFreckles":{"color":0,"opacity":0,"secondColor":0,"style":0},"complexion":{"color":0,"opacity":0,"secondColor":0,"style":0},"beard":{"color":0,"opacity":0,"secondColor":0,"style":0},"sunDamage":{"color":0,"opacity":0,"secondColor":0,"style":0},"blush":{"color":0,"opacity":0,"secondColor":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"blemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"lipstick":{"color":0,"opacity":0,"secondColor":0,"style":0},"ageing":{"color":0,"opacity":0,"secondColor":0,"style":0},"eyebrows":{"color":0,"opacity":0.2,"secondColor":0,"style":0},"chestHair":{"color":0,"opacity":0,"secondColor":0,"style":0},"makeUp":{"color":0,"opacity":0,"secondColor":0,"style":1}},"tattoos":{"ZONE_HAIR":[{"label":"hair-0-187","name":"hair-0-187","hashMale":"FM_M_Hair_003_b","collection":"multiplayer_overlays","zone":"ZONE_HAIR","hashFemale":"FM_F_Hair_003_b"}]},"props":[{"drawable":-1,"prop_id":7,"texture":-1},{"drawable":-1,"prop_id":0,"texture":0},{"drawable":0,"prop_id":1,"texture":0},{"drawable":3,"prop_id":2,"texture":0},{"drawable":3,"prop_id":6,"texture":0}],"faceFeatures":{"chinBoneLenght":0,"cheeksBoneHigh":0,"nosePeakLowering":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"noseWidth":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"noseBoneHigh":0,"lipsThickness":0,"cheeksWidth":0,"eyeBrownHigh":0,"nosePeakHigh":0,"nosePeakSize":0,"chinHole":0,"jawBoneBackSize":0,"eyeBrownForward":0,"neckThickness":0}}', 1),
	(1063, 'AHN70507', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","eyeColor":3,"hair":{"style":33,"highlight":38,"color":34,"texture":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":23,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0},{"drawable":0,"component_id":1,"texture":0}],"headBlend":{"thirdMix":0,"shapeMix":0,"shapeThird":0,"skinSecond":0,"skinThird":0,"skinMix":0,"skinFirst":0,"shapeFirst":44,"shapeSecond":10},"headOverlays":{"moleAndFreckles":{"opacity":0,"style":0,"secondColor":0,"color":0},"complexion":{"opacity":0,"style":0,"secondColor":0,"color":0},"chestHair":{"opacity":0,"style":0,"secondColor":0,"color":0},"sunDamage":{"opacity":0,"style":0,"secondColor":0,"color":0},"blush":{"opacity":0,"style":0,"secondColor":0,"color":0},"bodyBlemishes":{"opacity":0,"style":0,"secondColor":0,"color":0},"makeUp":{"opacity":0,"style":0,"secondColor":17,"color":58},"lipstick":{"opacity":0,"style":0,"secondColor":0,"color":0},"ageing":{"opacity":0,"style":0,"secondColor":0,"color":0},"eyebrows":{"opacity":1,"style":11,"secondColor":0,"color":61},"beard":{"opacity":1,"style":0,"secondColor":0,"color":15},"blemishes":{"opacity":0,"style":0,"secondColor":0,"color":0}},"tattoos":{"ZONE_HAIR":[{"hashFemale":"FM_F_Hair_003_a","name":"hair-0-186","collection":"multiplayer_overlays","zone":"ZONE_HAIR","hashMale":"FM_M_Hair_003_a","label":"hair-0-186"}]},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":17,"prop_id":1,"texture":0},{"drawable":0,"prop_id":2,"texture":0},{"drawable":9,"prop_id":6,"texture":0},{"drawable":18,"prop_id":7,"texture":0}],"faceFeatures":{"chinBoneLenght":0,"cheeksBoneHigh":-0.5,"nosePeakLowering":-0.2,"cheeksBoneWidth":0.2,"chinBoneLowering":0.1,"chinBoneSize":0.3,"noseWidth":-0.5,"eyesOpening":0.1,"jawBoneWidth":1,"noseBoneTwist":0,"noseBoneHigh":-0.1,"lipsThickness":0,"cheeksWidth":-0.5,"eyeBrownHigh":0,"nosePeakHigh":0.3,"nosePeakSize":0.4,"chinHole":0.3,"jawBoneBackSize":-0.7,"eyeBrownForward":0,"neckThickness":0}}', 1),
	(1064, 'IAA44370', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","eyeColor":14,"hair":{"style":194,"highlight":26,"color":27,"texture":3},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":32,"component_id":1,"texture":1},{"drawable":194,"component_id":2,"texture":3},{"drawable":31,"component_id":3,"texture":0},{"drawable":138,"component_id":4,"texture":5},{"drawable":0,"component_id":5,"texture":0},{"drawable":214,"component_id":6,"texture":0},{"drawable":8,"component_id":7,"texture":0},{"drawable":2,"component_id":8,"texture":0},{"drawable":14,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":367,"component_id":11,"texture":5}],"headBlend":{"thirdMix":0.0,"shapeMix":0.2,"shapeThird":0,"skinSecond":0,"skinThird":0,"skinFirst":44,"skinMix":0.0,"shapeFirst":0,"shapeSecond":1},"headOverlays":{"moleAndFreckles":{"style":0,"color":0,"secondColor":0,"opacity":0},"complexion":{"style":0,"color":0,"secondColor":0,"opacity":1.0},"chestHair":{"style":1,"color":0,"secondColor":0,"opacity":1.0},"sunDamage":{"style":0,"color":0,"secondColor":0,"opacity":0},"blush":{"style":0,"color":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"blemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"lipstick":{"style":0,"color":0,"secondColor":0,"opacity":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"eyebrows":{"style":7,"color":26,"secondColor":0,"opacity":1.0},"ageing":{"style":0,"color":0,"secondColor":0,"opacity":0.4},"beard":{"style":12,"color":0,"secondColor":0,"opacity":1.0}},"tattoos":[],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":15,"prop_id":1,"texture":6},{"drawable":14,"prop_id":2,"texture":0},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"faceFeatures":{"chinBoneLenght":0.0,"cheeksBoneHigh":1.0,"neckThickness":0.0,"cheeksBoneWidth":0.4,"chinBoneLowering":0.0,"chinBoneSize":0.0,"noseWidth":0.0,"eyesOpening":0.0,"jawBoneWidth":0.5,"noseBoneTwist":0.0,"noseBoneHigh":0.0,"lipsThickness":0.0,"cheeksWidth":0.0,"eyeBrownHigh":0.0,"nosePeakHigh":0.2,"nosePeakSize":0.0,"chinHole":0.0,"jawBoneBackSize":0.0,"eyeBrownForward":0.0,"nosePeakLowering":0.1}}', 1),
	(1065, 'HGQ14520', 'mp_m_freemode_01', '{"hair":{"style":171,"highlight":0,"texture":0,"color":0},"model":"mp_m_freemode_01","headBlend":{"shapeFirst":14,"thirdMix":0,"skinMix":0.1,"shapeMix":0.5,"shapeThird":0,"skinSecond":33,"shapeSecond":33,"skinThird":0,"skinFirst":14},"eyeColor":-1,"headOverlays":{"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0}},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"tattoos":[],"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11},{"drawable":4,"texture":0,"component_id":8}],"faceFeatures":{"eyeBrownForward":0,"noseBoneHigh":0,"cheeksWidth":0,"chinBoneSize":0,"neckThickness":0,"nosePeakHigh":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"jawBoneWidth":0,"eyeBrownHigh":0,"chinBoneLowering":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"nosePeakSize":0,"noseWidth":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"lipsThickness":0,"noseBoneTwist":0}}', 1),
	(1066, 'OLF99348', 'mp_m_freemode_01', '{"hair":{"style":36,"highlight":0,"color":0,"texture":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":10},{"drawable":9,"texture":0,"component_id":5},{"drawable":15,"texture":0,"component_id":8},{"drawable":85,"texture":0,"component_id":4},{"drawable":17,"texture":2,"component_id":6},{"drawable":10,"texture":3,"component_id":1},{"drawable":11,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":11},{"drawable":0,"texture":0,"component_id":9}],"headBlend":{"shapeFirst":0,"skinThird":0,"skinMix":0,"shapeMix":0,"shapeThird":0,"skinSecond":0,"shapeSecond":0,"thirdMix":0,"skinFirst":0},"eyeColor":-1,"headOverlays":{"makeUp":{"secondColor":0,"opacity":0,"color":0,"style":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"color":0,"style":0},"complexion":{"secondColor":0,"opacity":0,"color":0,"style":0},"ageing":{"secondColor":0,"opacity":0,"color":0,"style":0},"eyebrows":{"secondColor":0,"opacity":1,"color":0,"style":11},"chestHair":{"secondColor":0,"opacity":0,"color":0,"style":0},"beard":{"secondColor":0,"opacity":1,"color":0,"style":4},"lipstick":{"secondColor":0,"opacity":0,"color":0,"style":0},"sunDamage":{"secondColor":0,"opacity":0,"color":0,"style":0},"blush":{"secondColor":0,"opacity":0,"color":0,"style":0},"blemishes":{"secondColor":0,"opacity":0,"color":0,"style":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"color":0,"style":0}},"faceFeatures":{"eyeBrownForward":0,"noseBoneHigh":0,"cheeksWidth":0,"chinBoneSize":0,"neckThickness":0,"nosePeakHigh":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"nosePeakLowering":0,"noseWidth":0,"nosePeakSize":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"lipsThickness":0,"noseBoneTwist":0},"tattoos":[],"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1},{"prop_id":6,"texture":0,"drawable":10},{"prop_id":1,"texture":0,"drawable":26}],"model":"mp_m_freemode_01"}', 1),
	(1067, 'ZYD20476', 'u_m_o_taphillbilly', '{"hair":{"color":-1,"highlight":-1,"style":0,"texture":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"headBlend":{"shapeFirst":0,"skinThird":0,"skinMix":0,"skinSecond":0,"shapeThird":0,"thirdMix":0,"shapeSecond":0,"shapeMix":0,"skinFirst":0},"eyeColor":-1,"headOverlays":{"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0}},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"tattoos":[],"model":"u_m_o_taphillbilly","faceFeatures":{"eyeBrownForward":0,"noseBoneHigh":0,"chinBoneLowering":0,"chinBoneSize":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"neckThickness":0,"cheeksWidth":0,"nosePeakSize":0,"jawBoneWidth":0,"nosePeakHigh":0,"nosePeakLowering":0,"noseWidth":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"lipsThickness":0,"noseBoneTwist":0}}', 1),
	(1068, 'PGB18817', 'u_m_m_jesus_01', '{"hair":{"color":-1,"highlight":-1,"style":0,"texture":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11},{"drawable":0,"texture":0,"component_id":9}],"headBlend":{"shapeFirst":0,"thirdMix":0,"skinMix":0,"shapeMix":0,"shapeThird":0,"skinSecond":0,"shapeSecond":0,"skinThird":0,"skinFirst":0},"eyeColor":-1,"headOverlays":{"makeUp":{"opacity":0,"color":0,"style":0,"secondColor":0},"moleAndFreckles":{"opacity":0,"color":0,"style":0,"secondColor":0},"complexion":{"opacity":0,"color":0,"style":0,"secondColor":0},"ageing":{"opacity":0,"color":0,"style":0,"secondColor":0},"eyebrows":{"opacity":0,"color":0,"style":0,"secondColor":0},"blush":{"opacity":0,"color":0,"style":0,"secondColor":0},"beard":{"opacity":0,"color":0,"style":0,"secondColor":0},"lipstick":{"opacity":0,"color":0,"style":0,"secondColor":0},"chestHair":{"opacity":0,"color":0,"style":0,"secondColor":0},"sunDamage":{"opacity":0,"color":0,"style":0,"secondColor":0},"blemishes":{"opacity":0,"color":0,"style":0,"secondColor":0},"bodyBlemishes":{"opacity":0,"color":0,"style":0,"secondColor":0}},"faceFeatures":{"eyeBrownForward":0,"noseBoneHigh":0,"chinBoneLowering":0,"chinBoneSize":0,"neckThickness":0,"nosePeakHigh":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"cheeksWidth":0,"eyeBrownHigh":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"nosePeakLowering":0,"noseWidth":0,"nosePeakSize":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"lipsThickness":0,"noseBoneTwist":0},"tattoos":[],"model":"u_m_m_jesus_01","props":[{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7},{"drawable":0,"texture":0,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1}]}', 1),
	(1069, 'POK60295', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01","eyeColor":-1,"headBlend":{"skinFirst":0,"skinSecond":0,"skinThird":0,"shapeFirst":0,"thirdMix":0,"shapeThird":0,"shapeSecond":0,"skinMix":0,"shapeMix":0},"hair":{"highlight":0,"texture":0,"color":0,"style":229},"tattoos":[],"faceFeatures":{"eyeBrownForward":0,"neckThickness":0,"nosePeakSize":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneLenght":0,"jawBoneWidth":0,"chinBoneLowering":0,"eyesOpening":0,"nosePeakLowering":0,"cheeksWidth":0,"jawBoneBackSize":0,"cheeksBoneWidth":0,"chinBoneSize":0,"lipsThickness":0,"eyeBrownHigh":0,"chinHole":0,"noseWidth":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headOverlays":{"blemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"color":0,"style":0},"eyebrows":{"opacity":0,"secondColor":0,"color":0,"style":0},"sunDamage":{"opacity":0,"secondColor":0,"color":0,"style":0},"ageing":{"opacity":0,"secondColor":0,"color":0,"style":0},"blush":{"opacity":0,"secondColor":0,"color":0,"style":0},"lipstick":{"opacity":0,"secondColor":0,"color":0,"style":0},"complexion":{"opacity":0,"secondColor":0,"color":0,"style":0},"makeUp":{"opacity":0,"secondColor":0,"color":0,"style":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"beard":{"opacity":0,"secondColor":0,"color":0,"style":0},"chestHair":{"opacity":0,"secondColor":0,"color":0,"style":0}}}', 1),
	(1070, 'YYJ40505', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01","eyeColor":-1,"headBlend":{"skinFirst":0,"shapeMix":0,"skinThird":0,"shapeFirst":0,"shapeThird":0,"skinSecond":0,"thirdMix":0,"skinMix":0,"shapeSecond":0},"hair":{"highlight":0,"texture":0,"color":0,"style":0},"tattoos":[],"faceFeatures":{"eyeBrownForward":0,"eyeBrownHigh":0,"nosePeakSize":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneLenght":0,"jawBoneWidth":0,"chinBoneLowering":0,"eyesOpening":0,"nosePeakLowering":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"neckThickness":0,"chinHole":0,"lipsThickness":0,"chinBoneSize":0,"noseWidth":0,"cheeksWidth":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headOverlays":{"blemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"eyebrows":{"opacity":0,"secondColor":0,"color":0,"style":0},"sunDamage":{"opacity":0,"secondColor":0,"color":0,"style":0},"blush":{"opacity":0,"secondColor":0,"color":0,"style":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"color":0,"style":0},"lipstick":{"opacity":0,"secondColor":0,"color":0,"style":0},"complexion":{"opacity":0,"secondColor":0,"color":0,"style":0},"makeUp":{"opacity":0,"secondColor":0,"color":0,"style":0},"ageing":{"opacity":0,"secondColor":0,"color":0,"style":0},"beard":{"opacity":0,"secondColor":0,"color":0,"style":0},"chestHair":{"opacity":0,"secondColor":0,"color":0,"style":0}}}', 1),
	(1071, 'JIQ20274', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01","eyeColor":-1,"headBlend":{"skinFirst":0,"shapeMix":0,"skinThird":0,"shapeFirst":0,"shapeSecond":0,"shapeThird":0,"thirdMix":0,"skinMix":0,"skinSecond":0},"hair":{"highlight":0,"texture":0,"color":0,"style":0},"tattoos":[],"faceFeatures":{"eyeBrownForward":0,"neckThickness":0,"nosePeakSize":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneLenght":0,"jawBoneWidth":0,"chinBoneLowering":0,"eyesOpening":0,"nosePeakLowering":0,"chinBoneSize":0,"jawBoneBackSize":0,"chinHole":0,"eyeBrownHigh":0,"lipsThickness":0,"noseWidth":0,"cheeksBoneWidth":0,"cheeksWidth":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headOverlays":{"blemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"color":0,"style":0},"eyebrows":{"opacity":0,"secondColor":0,"color":0,"style":0},"sunDamage":{"opacity":0,"secondColor":0,"color":0,"style":0},"makeUp":{"opacity":0,"secondColor":0,"color":0,"style":0},"chestHair":{"opacity":0,"secondColor":0,"color":0,"style":0},"lipstick":{"opacity":0,"secondColor":0,"color":0,"style":0},"complexion":{"opacity":0,"secondColor":0,"color":0,"style":0},"ageing":{"opacity":0,"secondColor":0,"color":0,"style":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"beard":{"opacity":0,"secondColor":0,"color":0,"style":0},"blush":{"opacity":0,"secondColor":0,"color":0,"style":0}}}', 1);

-- Dumping structure for table s879692_banglapixel.player_contacts
DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_contacts: ~11 rows (approximately)
DELETE FROM `player_contacts`;
INSERT INTO `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`) VALUES
	(169, 'TRQ74282', 'Dablo Escober', '8211869937', 'US02QBCore3211413714'),
	(172, 'BPM27715', 'Guru Sensei', '1249914725', 'US08QBCore3742827629'),
	(173, 'BPM27715', 'Dablo Escober', '8211869937', 'US02QBCore3211413714'),
	(174, 'BPM27715', 'Halka Man', '9923101717', 'US07QBCore5289781138'),
	(177, 'TRQ74282', 'CJ Israk', '2908390746', 'US02QBCore2938741281'),
	(178, 'TRQ74282', 'Kajuto Kirigaya', '2975092715', 'US01QBCore3676689596'),
	(179, 'FYZ04801', 'Kajuto Kirigaya', '2975092715', 'US01QBCore3676689596'),
	(180, 'QWD83978', 'Kajuto Kirigaya', '2975092715', 'US01QBCore3676689596'),
	(181, 'AHN70507', 'Kajuto Kirigaya', '2975092715', 'US01QBCore3676689596'),
	(182, 'AHN70507', 'kala masud', '6096378646', 'US01QBCore5957956493'),
	(183, 'AHN70507', 'Kajuto Kirigaya', '2975092715', 'US01QBCore3676689596'),
	(184, 'AHN70507', 'kala masud', '6096378646', 'US01QBCore5957956493'),
	(185, 'QWD83978', 'Haji Iliyas', '5119134850', 'US05QBCore7233980330');

-- Dumping structure for table s879692_banglapixel.player_houses
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.player_houses: ~0 rows (approximately)
DELETE FROM `player_houses`;

-- Dumping structure for table s879692_banglapixel.player_mails
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_mails: ~14 rows (approximately)
DELETE FROM `player_mails`;
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(521, 'QWD83978', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. masud, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 991810, '2023-12-26 22:06:33', '[]'),
	(522, 'QWD83978', 'Los Santos Weather', 'Weather Forecast', 'We\'re happy to report that we have clear skies dominating the forecast, and there is no rain expected in the foreseeable future.', 0, 152446, '2023-12-26 22:30:17', '[]'),
	(523, 'QWD83978', 'Los Santos Weather', 'Weather Update', 'We apologize for the inaccurate forecasts earlier, and I understand your concern. It appears that the weather has taken an unexpected turn, and rain is now falling.', 0, 498444, '2023-12-26 22:45:18', '[]'),
	(524, 'QWD83978', 'Los Santos Weather', 'Emergency Weather', 'This is an emergency weather update. A tsunami is predicted to make contact in less than 5 minutes. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.', 0, 533653, '2023-12-26 22:55:28', '[]'),
	(525, 'QWD83978', 'Los Santos Weather', 'Emergency Weather', 'This is an emergency weather update. A tsunami is imminent. <br> <br> If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.', 0, 991914, '2023-12-26 22:59:28', '[]'),
	(526, 'BPM27715', 'Los Santos Weather', 'Weather Forecast', 'We\'re happy to report that we have clear skies dominating the forecast, and there is no rain expected in the foreseeable future.', 0, 123330, '2023-12-27 10:30:37', '[]'),
	(527, 'BPM27715', 'Los Santos Weather', 'Weather Update', 'We apologize for the inaccurate forecasts earlier, and I understand your concern. It appears that the weather has taken an unexpected turn, and rain is now falling.', 0, 290626, '2023-12-27 10:45:37', '[]'),
	(528, 'BPM27715', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. Kirigaya, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 905833, '2023-12-28 17:54:37', '[]'),
	(529, 'TDJ01991', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. Israk, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 929051, '2023-12-29 06:41:17', '[]'),
	(530, 'TDJ01991', 'Los Santos Weather', 'Weather Update', 'We apologize for the inaccurate forecasts earlier, and I understand your concern. It appears that the weather has taken an unexpected turn, and rain is now falling.', 0, 786177, '2023-12-29 10:45:02', '[]'),
	(531, 'TDJ01991', 'Los Santos Weather', 'Emergency Weather', 'This is an emergency weather update. A tsunami is predicted to make contact in less than 5 minutes. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.', 0, 762448, '2023-12-29 10:55:12', '[]'),
	(532, 'TDJ01991', 'Los Santos Weather', 'Emergency Weather', 'This is an emergency weather update. A tsunami is imminent. <br> <br> If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.', 0, 689379, '2023-12-29 10:59:12', '[]'),
	(533, 'HGQ14520', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. MONEY, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 857813, '2023-12-30 01:28:43', '[]'),
	(534, 'YYJ40505', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. asda, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 690274, '2023-12-30 19:11:13', '[]'),
	(535, 'JIQ20274', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. tentacion, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$250</strong><br /><br />We wish you a quick recovery!', 0, 485664, '2023-12-30 19:11:52', '[]');

-- Dumping structure for table s879692_banglapixel.player_outfits
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_outfits: ~5 rows (approximately)
DELETE FROM `player_outfits`;
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
	(175, 'TRQ74282', 'H 2', 'mp_m_freemode_01', '[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}]', '[{"drawable":0,"texture":0,"component_id":0},{"drawable":92,"texture":0,"component_id":1},{"drawable":11,"texture":0,"component_id":2},{"drawable":31,"texture":0,"component_id":3},{"drawable":32,"texture":2,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":126,"texture":5,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":251,"texture":3,"component_id":11}]'),
	(176, 'TRQ74282', 'H 3', 'mp_m_freemode_01', '[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}]', '[{"drawable":0,"texture":0,"component_id":0},{"drawable":3,"texture":0,"component_id":1},{"drawable":11,"texture":0,"component_id":2},{"drawable":31,"texture":0,"component_id":3},{"drawable":25,"texture":1,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":203,"texture":13,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":656,"texture":0,"component_id":11}]'),
	(177, 'TRQ74282', 'H 1', 'mp_m_freemode_01', '[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":4,"texture":7,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}]', '[{"drawable":0,"texture":0,"component_id":0},{"drawable":146,"texture":0,"component_id":1},{"drawable":11,"texture":0,"component_id":2},{"drawable":31,"texture":0,"component_id":3},{"drawable":260,"texture":12,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":56,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":162,"texture":0,"component_id":11}]'),
	(178, 'QWD83978', 'dwd', 'mp_m_freemode_01', '[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":15,"prop_id":1,"texture":6},{"drawable":14,"prop_id":2,"texture":0},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}]', '[{"drawable":0,"component_id":0,"texture":0},{"drawable":32,"component_id":1,"texture":1},{"drawable":33,"component_id":2,"texture":0},{"drawable":31,"component_id":3,"texture":0},{"drawable":138,"component_id":4,"texture":5},{"drawable":0,"component_id":5,"texture":0},{"drawable":214,"component_id":6,"texture":0},{"drawable":8,"component_id":7,"texture":0},{"drawable":2,"component_id":8,"texture":0},{"drawable":14,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":367,"component_id":11,"texture":5}]'),
	(179, 'IAA44370', 'Imported Outfit', 'mp_m_freemode_01', '[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":15,"prop_id":1,"texture":6},{"drawable":14,"prop_id":2,"texture":0},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}]', '[{"drawable":0,"component_id":0,"texture":0},{"drawable":32,"component_id":1,"texture":1},{"drawable":33,"component_id":2,"texture":0},{"drawable":31,"component_id":3,"texture":0},{"drawable":138,"component_id":4,"texture":5},{"drawable":0,"component_id":5,"texture":0},{"drawable":214,"component_id":6,"texture":0},{"drawable":8,"component_id":7,"texture":0},{"drawable":2,"component_id":8,"texture":0},{"drawable":14,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":367,"component_id":11,"texture":5}]');

-- Dumping structure for table s879692_banglapixel.player_outfit_codes
DROP TABLE IF EXISTS `player_outfit_codes`;
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_outfit_codes: ~1 rows (approximately)
DELETE FROM `player_outfit_codes`;
INSERT INTO `player_outfit_codes` (`id`, `outfitid`, `code`) VALUES
	(9, 178, 'JfHZ4IRyY5');

-- Dumping structure for table s879692_banglapixel.player_plants
DROP TABLE IF EXISTS `player_plants`;
CREATE TABLE IF NOT EXISTS `player_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `seed` varchar(100) NOT NULL,
  `water` double NOT NULL,
  `food` double NOT NULL,
  `stage` double NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_plants: ~0 rows (approximately)
DELETE FROM `player_plants`;

-- Dumping structure for table s879692_banglapixel.player_vehicles
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s879692_banglapixel.player_vehicles: ~10 rows (approximately)
DELETE FROM `player_vehicles`;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`) VALUES
	(185, 'license:652da29b63d74e5ed9a933c395ac5f82793ca5c6', 'TRQ74282', 'kuruma', '-1372848492', '{"tankHealth":997.6762628136975,"modRightFender":-1,"modHydrolic":-1,"modStruts":-1,"modEngineBlock":-1,"plateIndex":0,"modGrille":-1,"engineHealth":959.548507546932,"modFrontWheels":-1,"modKit49":-1,"extras":[],"fuelLevel":97.70237287108663,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color2":2,"wheelSize":1.0,"modRoof":-1,"tireHealth":{"1":1000.0,"2":997.8851318359375,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modKit17":-1,"modSteeringWheel":-1,"modCustomTiresF":false,"modOrnaments":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modRearBumper":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modVanityPlate":-1,"oilLevel":4.76596940834568,"modTrimA":-1,"modSpoilers":-1,"modKit19":-1,"neonEnabled":[false,false,false,false],"wheels":0,"neonColor":[255,0,255],"pearlescentColor":7,"plate":"6XK893QN","modEngine":-1,"modDoorSpeaker":-1,"dirtLevel":7.94328234724281,"modTank":-1,"modKit47":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modBrakes":-1,"modSpeakers":-1,"interiorColor":0,"wheelColor":156,"modDashboard":-1,"modShifterLeavers":-1,"modWindows":-1,"modAPlate":-1,"modTrunk":-1,"color1":2,"modHood":-1,"modAirFilter":-1,"bodyHealth":997.6762628136975,"modDrift":false,"modExhaust":-1,"modArmor":-1,"modFrame":-1,"modFrontBumper":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modSeats":-1,"modLivery":-1,"modTurbo":false,"dashboardColor":0,"modBackWheels":-1,"modKit21":-1,"wheelWidth":1.0,"modCustomTiresR":false,"liveryRoof":-1,"modTrimB":-1,"modAerials":-1,"modHorns":-1,"headlightColor":255,"model":-1372848492,"modTransmission":-1,"windowTint":-1,"modBProofTires":false,"modFender":-1,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modDial":-1,"modSuspension":-1,"modXenon":false}', '6XK893QN', NULL, 'pillboxgarage', 97, 960, 998, 1, 0, 545015, NULL, 0, 0, 0, 0, NULL, 0, 0, 0),
	(186, 'license:a59c845b3cd215cf9b515917711dd9f18c0bfc8c', 'BPM27715', 'gauntlet4', '1934384720', '{"modExhaust":4,"modKit47":-1,"modOrnaments":-1,"tireHealth":{"1":1000.0,"2":990.8448486328125,"3":992.8074951171875,"4":0.0,"5":0.0,"0":999.5,"47":0.0,"45":0.0},"interiorColor":2,"modCustomTiresF":1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowTint":1,"wheelWidth":0.506740629673,"wheelSize":0.73000001907348,"modEngineBlock":-1,"modRoof":-1,"modTrimA":-1,"modVanityPlate":-1,"modCustomTiresR":false,"headlightColor":8,"modTrimB":-1,"modShifterLeavers":-1,"modBrakes":-1,"modGrille":3,"modDrift":false,"modRearBumper":-1,"liveryRoof":-1,"modAerials":-1,"bodyHealth":931.7470193315821,"extras":[],"modStruts":-1,"plate":"0KV208XB","modXenon":1,"modTransmission":-1,"modAirFilter":-1,"modKit21":-1,"color2":0,"modBProofTires":false,"modHorns":-1,"modDashboard":-1,"modFrontWheels":5,"modSideSkirt":0,"modHydrolic":-1,"modFrontBumper":-1,"modFender":0,"modHood":-1,"modSmokeEnabled":1,"tyreSmokeColor":[255,10,10],"wheelColor":0,"oilLevel":4.76596940834568,"modPlateHolder":-1,"modDoorSpeaker":-1,"modTurbo":false,"modSpeakers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBackWheels":-1,"modTrunk":-1,"modSpoilers":-1,"modSteeringWheel":-1,"pearlescentColor":138,"tankHealth":3985.9390818464446,"color1":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modLivery":-1,"fuelLevel":48.45402231818117,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false},"model":1934384720,"modKit19":-1,"modWindows":-1,"neonColor":[255,1,1],"dirtLevel":0.79432823472428,"wheels":1,"modAPlate":-1,"modKit49":-1,"modDial":-1,"dashboardColor":0,"plateIndex":1,"modSeats":-1,"modArmor":-1,"modSuspension":-1,"engineHealth":731.5763041810633,"modArchCover":-1,"modKit17":-1,"modRightFender":-1,"modFrame":-1,"neonEnabled":[1,1,1,1],"modEngine":-1,"modTank":-1}', '0KV208XB', NULL, 'pillboxgarage', 48, 732, 932, 1, 0, 925239, NULL, 0, 0, 0, 0, NULL, 1257859, 0, 0),
	(187, 'license:e02a66db06eb03189cfe0e9ec47a654f7e677aab', 'TDJ01991', 'kuruma', '-1372848492', '{"pearlescentColor":7,"modArchCover":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFrontBumper":-1,"modEngine":-1,"modBackWheels":-1,"modPlateHolder":-1,"plate":"1MW854FP","modStruts":-1,"modDial":-1,"modKit49":-1,"modTrimA":-1,"modTrimB":-1,"extras":[],"modFender":-1,"modCustomTiresF":false,"interiorColor":0,"wheels":0,"modTurbo":false,"model":-1372848492,"wheelWidth":1.0,"modFrame":-1,"oilLevel":4.76596940834568,"modCustomTiresR":false,"tankHealth":3983.5560971422717,"tireHealth":{"1":978.3876342773438,"2":1000.0,"3":995.3665771484375,"4":0.0,"5":0.0,"0":999.5,"47":0.0,"45":0.0},"liveryRoof":-1,"modExhaust":-1,"modRearBumper":-1,"modRoof":-1,"modAPlate":-1,"modTransmission":-1,"neonEnabled":[1,1,1,1],"modSeats":-1,"dashboardColor":0,"neonColor":[255,0,255],"bodyHealth":872.172401727261,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":false,"7":true,"0":true},"modShifterLeavers":-1,"fuelLevel":82.61013641132527,"modEngineBlock":-1,"modHorns":-1,"modKit17":-1,"modHydrolic":-1,"modDrift":false,"modSpoilers":-1,"modVanityPlate":-1,"modGrille":-1,"modKit19":-1,"modBProofTires":false,"modAirFilter":-1,"modArmor":-1,"modSpeakers":-1,"engineHealth":679.9449689239849,"modSmokeEnabled":false,"modTank":-1,"modFrontWheels":-1,"wheelColor":156,"headlightColor":255,"modLivery":-1,"modSideSkirt":-1,"modKit47":-1,"color2":2,"modBrakes":-1,"modXenon":false,"modDashboard":-1,"modSuspension":-1,"tyreSmokeColor":[255,255,255],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modKit21":-1,"modDoorSpeaker":-1,"modHood":-1,"dirtLevel":1.58865646944856,"plateIndex":0,"modOrnaments":-1,"modRightFender":-1,"windowTint":1,"modTrunk":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modSteeringWheel":-1,"wheelSize":1.0,"color1":2,"modWindows":-1}', '1MW854FP', NULL, 'pillboxgarage', 82, 680, 873, 1, 0, 43783, NULL, 0, 0, 0, 0, NULL, 699817, 0, 0),
	(188, 'license:0537ef246442d74c99a645bd4a4408ecbc51a091', 'SVO00296', 'kuruma', '-1372848492', '{"windowStatus":{"1":false,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modVanityPlate":-1,"modKit49":-1,"modCustomTiresF":false,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":2,"neonColor":[255,0,255],"neonEnabled":[false,false,false,false],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"tyreSmokeColor":[255,255,255],"extras":[],"modHydrolic":-1,"modBackWheels":-1,"liveryRoof":-1,"modArchCover":-1,"color1":111,"modExhaust":2,"modGrille":-1,"modHorns":-1,"modSteeringWheel":-1,"modOrnaments":-1,"modAPlate":-1,"modTank":-1,"wheels":0,"dirtLevel":0.0,"modKit17":-1,"modRearBumper":-1,"modDrift":false,"modWindows":-1,"wheelSize":1.0,"modXenon":false,"fuelLevel":22.24119057227988,"modShifterLeavers":-1,"tankHealth":4000.2369900714818,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFender":-1,"headlightColor":255,"modSmokeEnabled":false,"modDashboard":-1,"modPlateHolder":-1,"modFrame":-1,"modEngineBlock":-1,"modTrunk":-1,"modBProofTires":false,"modEngine":-1,"modSeats":-1,"modSuspension":-1,"modAirFilter":-1,"modTrimA":-1,"modRoof":-1,"wheelColor":156,"pearlescentColor":0,"dashboardColor":0,"modDial":-1,"bodyHealth":1000.0592475178704,"modKit47":-1,"model":-1372848492,"modSideSkirt":2,"wheelWidth":1.0,"modKit19":-1,"oilLevel":4.76596940834568,"modLivery":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpoilers":4,"modTransmission":-1,"modAerials":-1,"color2":111,"plateIndex":0,"modDoorSpeaker":-1,"windowTint":-1,"modTrimB":-1,"modArmor":-1,"engineHealth":1000.0592475178704,"modKit21":-1,"modFrontWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modHood":-1,"modStruts":-1,"modSpeakers":-1,"plate":"5AE148KY","modCustomTiresR":false,"interiorColor":0}', '5AE148KY', NULL, 'pillboxgarage', 27, 633, 760, 1, 0, 358010, NULL, 0, 0, 0, 0, NULL, 113004, 0, 0),
	(190, 'license:a59c845b3cd215cf9b515917711dd9f18c0bfc8c', 'BPM27715', 'kuruma', '-1372848492', '{"modExhaust":-1,"modKit47":-1,"modOrnaments":-1,"tireHealth":{"1":987.5352783203125,"2":1000.0,"3":999.75,"4":0.0,"5":0.0,"0":978.6358642578125,"47":0.0,"45":0.0},"interiorColor":0,"modCustomTiresF":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowTint":-1,"wheelWidth":1.0,"wheelSize":1.0,"modEngineBlock":-1,"modRoof":-1,"modTrimA":-1,"modVanityPlate":-1,"modCustomTiresR":false,"headlightColor":255,"modTrimB":-1,"modShifterLeavers":-1,"modBrakes":-1,"modGrille":-1,"modDrift":false,"modRearBumper":-1,"liveryRoof":-1,"modAerials":-1,"bodyHealth":908.711500524578,"extras":[],"modStruts":-1,"plate":"5PA202HL","modXenon":false,"modTransmission":-1,"modAirFilter":-1,"modKit21":-1,"color2":2,"modBProofTires":false,"modHorns":-1,"modDashboard":-1,"modFrontWheels":-1,"modSideSkirt":-1,"modHydrolic":-1,"modFrontBumper":-1,"modFender":-1,"modHood":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"wheelColor":156,"oilLevel":4.76596940834568,"modPlateHolder":-1,"modDoorSpeaker":-1,"modTurbo":false,"modSpeakers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBackWheels":-1,"modTrunk":-1,"modSpoilers":-1,"modSteeringWheel":-1,"pearlescentColor":7,"tankHealth":989.7329804664547,"color1":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modLivery":-1,"fuelLevel":73.07819759463389,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"model":-1372848492,"modKit19":-1,"modWindows":-1,"neonColor":[255,0,255],"dirtLevel":8.73761058196709,"wheels":0,"modAPlate":-1,"modKit49":-1,"modDial":-1,"dashboardColor":0,"plateIndex":0,"modSeats":-1,"modArmor":-1,"modSuspension":-1,"engineHealth":795.1225629590058,"modArchCover":-1,"modKit17":-1,"modRightFender":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"modEngine":-1,"modTank":-1}', '5PA202HL', NULL, 'pillboxgarage', 73, 796, 910, 1, 0, 240718, NULL, 0, 0, 0, 0, NULL, 27293, 0, 0),
	(191, 'license:9681271a1ea43872495b44562eaa0745dcb752ff', 'QWD83978', 'kuruma', '-1372848492', '{"modExhaust":-1,"modKit47":-1,"neonEnabled":[false,false,false,false],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":999.25,"47":0.0,"45":0.0},"interiorColor":0,"modCustomTiresF":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowTint":-1,"plateIndex":3,"wheelSize":0.0,"modEngineBlock":-1,"modRoof":-1,"modTrimA":-1,"modVanityPlate":-1,"modCustomTiresR":false,"headlightColor":255,"modWindows":-1,"modShifterLeavers":-1,"modBrakes":-1,"modGrille":-1,"modDrift":false,"modRearBumper":-1,"modAPlate":-1,"modAerials":-1,"bodyHealth":997.6762628136975,"extras":[],"modStruts":-1,"plate":"6PB160PB","pearlescentColor":111,"model":-1372848492,"modTrunk":-1,"modKit21":-1,"color2":4,"modBProofTires":false,"modHorns":-1,"modDashboard":-1,"modFrontWheels":-1,"modSideSkirt":-1,"modHydrolic":-1,"modLivery":-1,"modFender":-1,"modDial":-1,"modTank":-1,"modArchCover":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"oilLevel":4.76596940834568,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"modTurbo":false,"modSpeakers":-1,"modRightFender":-1,"modBackWheels":-1,"modSuspension":-1,"modSpoilers":-1,"modSteeringWheel":-1,"modSmokeEnabled":false,"modArmor":-1,"color1":4,"modSeats":-1,"wheelWidth":0.0,"fuelLevel":97.70237287108663,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modOrnaments":-1,"modKit19":-1,"modTrimB":-1,"modKit49":-1,"dirtLevel":3.17731293889712,"liveryRoof":-1,"modFrontBumper":-1,"modHood":-1,"modAirFilter":-1,"dashboardColor":0,"tankHealth":1000.0592475178704,"modTransmission":-1,"wheels":0,"modPlateHolder":-1,"modEngine":-1,"neonColor":[255,0,255],"modKit17":-1,"engineHealth":996.0876063442489,"wheelColor":156,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFrame":-1,"modXenon":false}', '6PB160PB', NULL, 'pillboxgarage', 98, 997, 998, 1, 0, 1944, NULL, 0, 0, 0, 0, NULL, 0, 0, 0),
	(192, 'license:98e8dc8f03bf0554acb503b81a94407ba10e8055', 'AHN70507', 'kuruma', '-1372848492', '{"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modBProofTires":false,"modKit49":-1,"modCustomTiresF":false,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"neonEnabled":[false,false,false,false],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"tyreSmokeColor":[255,255,255],"extras":[],"modHydrolic":-1,"modBackWheels":-1,"liveryRoof":-1,"modArchCover":-1,"color1":1,"modExhaust":-1,"modGrille":-1,"modHorns":-1,"modFrontWheels":-1,"modOrnaments":-1,"modAPlate":-1,"modTank":-1,"wheels":0,"dirtLevel":0.0,"modKit17":-1,"modRearBumper":-1,"modDrift":false,"modAirFilter":-1,"wheelSize":1.0,"modXenon":false,"modCustomTiresR":false,"modShifterLeavers":-1,"tankHealth":4000.2369900714818,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFender":-1,"headlightColor":255,"modSmokeEnabled":false,"wheelWidth":1.0,"modPlateHolder":-1,"modFrame":-1,"modDashboard":-1,"modTrunk":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDoorSpeaker":-1,"modLivery":-1,"modKit19":-1,"fuelLevel":90.55341875856809,"modRoof":-1,"wheelColor":156,"pearlescentColor":5,"modEngineBlock":-1,"modDial":-1,"bodyHealth":1000.0592475178704,"oilLevel":4.76596940834568,"model":-1372848492,"windowTint":-1,"modSuspension":-1,"modSeats":-1,"modWindows":-1,"modKit47":-1,"color2":1,"modSteeringWheel":-1,"modSpoilers":-1,"dashboardColor":0,"modAerials":-1,"modTrimB":-1,"modTransmission":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrimA":-1,"modArmor":-1,"modKit21":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1,"modEngine":-1,"plateIndex":0,"modHood":-1,"modStruts":-1,"modSpeakers":-1,"plate":"1NM310BH","modVanityPlate":-1,"interiorColor":0}', '1NM310BH', NULL, 'pillboxgarage', 95, 938, 968, 1, 0, 276399, NULL, 0, 0, 0, 0, NULL, 73028, 0, 0),
	(193, 'license:859e306f2efa53bccbbe866dda384bffaa3986af', 'ZYD20476', 'trhawk', '231217483', '{"modKit19":-1,"modSideSkirt":-1,"modTransmission":-1,"modFrame":-1,"modCustomTiresF":false,"wheels":3,"modXenon":false,"wheelSize":1.0,"modStruts":-1,"extras":{"2":true,"1":false},"modTurbo":false,"modKit49":-1,"modTrimA":-1,"pearlescentColor":4,"modSuspension":-1,"dashboardColor":0,"modArmor":-1,"modAerials":-1,"modPlateHolder":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"fuelLevel":58.78028936959683,"color2":112,"modSteeringWheel":-1,"modTrimB":-1,"modBProofTires":false,"neonColor":[255,0,255],"modRearBumper":-1,"modRightFender":-1,"modGrille":-1,"modHorns":-1,"modFender":-1,"interiorColor":0,"modHood":-1,"windowTint":-1,"modKit21":-1,"modAirFilter":-1,"modSpoilers":-1,"modBackWheels":-1,"modSpeakers":-1,"modHydrolic":-1,"liveryRoof":-1,"plate":"27IBM216","color1":112,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"model":231217483,"modAPlate":-1,"plateIndex":4,"modDrift":false,"modKit17":-1,"neonEnabled":[false,false,false,false],"modLivery":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modVanityPlate":-1,"modKit47":-1,"wheelWidth":1.0,"modArchCover":-1,"modShifterLeavers":-1,"modTrunk":-1,"wheelColor":4,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modDial":-1,"modFrontWheels":-1,"dirtLevel":0.0,"tankHealth":4000.2369900714818,"headlightColor":255,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modTank":-1,"oilLevel":4.76596940834568,"modCustomTiresR":false,"modRoof":-1,"modDashboard":-1,"bodyHealth":1000.0592475178704,"modWindows":-1,"modBrakes":-1,"modSeats":-1,"modExhaust":-1,"modDoorSpeaker":-1,"modEngine":-1,"engineHealth":1000.0592475178704,"modFrontBumper":-1,"modSmokeEnabled":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1}', '27IBM216', NULL, NULL, 100, 1000, 1000, 1, 0, 403541, NULL, 0, 0, 0, 0, NULL, 6522, 0, 0),
	(194, 'license:859e306f2efa53bccbbe866dda384bffaa3986af', 'ZYD20476', 'p1gtr', '1215232069', '{"bodyHealth":998.4705910484217,"modHood":-1,"modRoof":-1,"plate":"81UQX781","modFrontBumper":-1,"modRightFender":-1,"modSpeakers":-1,"tankHealth":1000.0592475178704,"modSmokeEnabled":false,"modTurbo":false,"model":1215232069,"modCustomTiresR":false,"interiorColor":0,"modSpoilers":-1,"modBackWheels":-1,"modKit49":-1,"modAirFilter":-1,"modTransmission":-1,"modBProofTires":false,"modKit21":-1,"modStruts":-1,"modDoorSpeaker":-1,"modDial":-1,"modEngine":-1,"modSideSkirt":-1,"modSeats":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"color1":134,"modKit17":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"fuelLevel":30.18447291952269,"wheels":7,"pearlescentColor":0,"modCustomTiresF":false,"windowTint":-1,"modFrame":-1,"modEngineBlock":-1,"modPlateHolder":-1,"modRearBumper":-1,"oilLevel":4.76596940834568,"modArmor":-1,"modGrille":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"dashboardColor":0,"modAerials":-1,"color2":134,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"dirtLevel":0.0,"modFrontWheels":-1,"modVanityPlate":-1,"modTrunk":-1,"modSuspension":-1,"wheelWidth":0.0,"modHorns":-1,"modShifterLeavers":-1,"modDashboard":-1,"modLivery":-1,"modTrimB":-1,"modArchCover":-1,"plateIndex":4,"modTank":-1,"modAPlate":-1,"modTrimA":-1,"modHydrolic":-1,"modFender":-1,"modDrift":false,"extras":[],"modBrakes":-1,"modXenon":false,"wheelSize":0.0,"wheelColor":0,"modWindows":-1,"modExhaust":-1,"liveryRoof":-1,"modSteeringWheel":-1,"engineHealth":996.8819345789732,"modKit47":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"neonColor":[255,0,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0}}', '81UQX781', NULL, NULL, 100, 1000, 1000, 1, 0, 750755, NULL, 0, 0, 0, 0, NULL, 0, 0, 0),
	(195, 'license:ff7d977d9b3b917aa52de6315b5a8be738dca7f1', 'YYJ40505', 't20', '1663218586', '{"modTrimA":-1,"modArchCover":-1,"modWindows":-1,"modBrakes":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modEngine":-1,"modSpoilers":-1,"modTank":-1,"wheelColor":0,"plate":"43ZMR991","modAPlate":-1,"modStruts":-1,"modHydrolic":-1,"modHorns":-1,"modExhaust":-1,"modArmor":-1,"windowTint":-1,"modDrift":false,"modPlateHolder":-1,"modShifterLeavers":-1,"modKit21":-1,"dirtLevel":0.0,"modFrontWheels":-1,"model":1663218586,"tankHealth":991.3216369359033,"liveryRoof":-1,"modFender":-1,"wheels":7,"modCustomTiresR":false,"modXenon":false,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"extras":[],"modCustomTiresF":false,"modKit47":-1,"modOrnaments":-1,"modDial":-1,"modTurbo":false,"modRearBumper":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":false,"7":true,"0":true},"pearlescentColor":3,"plateIndex":0,"modDoorSpeaker":-1,"modKit19":-1,"modFrontBumper":-1,"modTrunk":-1,"modTrimB":-1,"dashboardColor":0,"modSuspension":-1,"color2":36,"wheelSize":0.0,"modSpeakers":-1,"modKit49":-1,"modAirFilter":-1,"modKit17":-1,"modRoof":-1,"color1":36,"tyreSmokeColor":[255,255,255],"modSeats":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"fuelLevel":34.1561140931441,"modSideSkirt":-1,"modRightFender":-1,"modBProofTires":false,"modGrille":-1,"interiorColor":0,"headlightColor":255,"modFrame":-1,"engineHealth":835.6333029299441,"modAerials":-1,"modVanityPlate":-1,"modBackWheels":-1,"modHood":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"neonColor":[255,0,255],"modSmokeEnabled":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modLivery":-1,"bodyHealth":937.3073169746522,"oilLevel":4.76596940834568,"wheelWidth":0.0,"modEngineBlock":-1}', '43ZMR991', NULL, NULL, 100, 1000, 1000, 1, 0, 386962, NULL, 0, 0, 0, 0, NULL, 0, 0, 0);

-- Dumping structure for table s879692_banglapixel.player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.player_warns: ~0 rows (approximately)
DELETE FROM `player_warns`;

-- Dumping structure for table s879692_banglapixel.promocodes
DROP TABLE IF EXISTS `promocodes`;
CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `item` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `uses` int(255) NOT NULL,
  `redeemed_players` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s879692_banglapixel.promocodes: ~0 rows (approximately)
DELETE FROM `promocodes`;

-- Dumping structure for table s879692_banglapixel.stashitems
DROP TABLE IF EXISTS `stashitems`;
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.stashitems: ~3 rows (approximately)
DELETE FROM `stashitems`;
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(407, 'apartment34887', '[]'),
	(409, 'apartment37219', '{"1":{"label":"Master Card","info":{"cardActive":true,"citizenid":"TRQ74282","name":"Halka Man","cardNumber":3134347430703250,"cardPin":8899,"cardType":"mastercard"},"name":"mastercard","unique":true,"weight":0,"amount":1,"image":"mastercard.png","slot":1,"type":"item","useable":true},"2":{"label":"Advanced Lockpick","info":[],"name":"advancedlockpick","unique":false,"weight":500,"amount":3,"image":"advancedlockpick.png","slot":2,"type":"item","useable":true},"3":{"label":"Handcuffs","info":{"quality":100},"name":"handcuffs","unique":false,"weight":100,"amount":1,"image":"handcuffs.png","slot":3,"type":"item","useable":true},"6":{"label":"Trimming Scissors","info":{"quality":100},"name":"trimming_scissors","unique":false,"weight":1500,"amount":1,"image":"trimming_scissors.png","slot":6,"type":"item","useable":false},"7":{"label":"Fine Scale","info":{"quality":100},"name":"finescale","unique":false,"weight":200,"amount":1,"image":"finescale.png","slot":7,"type":"item","useable":false},"8":{"label":"Key A","info":{"quality":100},"name":"methkey","unique":false,"weight":200,"amount":1,"image":"keya.png","slot":8,"type":"item","useable":false},"9":{"label":"Key B","info":{"quality":100},"name":"cocainekey","unique":false,"weight":200,"amount":1,"image":"keyb.png","slot":9,"type":"item","useable":false},"10":{"label":"Key C","info":{"quality":100},"name":"weedkey","unique":false,"weight":200,"amount":1,"image":"keyc.png","slot":10,"type":"item","useable":false},"11":{"label":"Baking Soda","info":{"quality":100},"name":"bakingsoda","unique":false,"weight":1500,"amount":40,"image":"bakingsoda.png","slot":11,"type":"item","useable":false},"15":{"label":"Empty Weed Bag","info":[],"name":"empty_weed_bag","unique":false,"weight":0,"amount":187,"image":"weed_baggy_empty.png","slot":15,"type":"item","useable":true},"44":{"label":"Plastic","info":[],"name":"plastic","unique":false,"weight":100,"amount":14,"image":"plastic.png","slot":44,"type":"item","useable":false},"45":{"label":"Rubber","info":[],"name":"rubber","unique":false,"weight":100,"amount":45,"image":"rubber.png","slot":45,"type":"item","useable":false}}'),
	(416, 'BSTray3', '[]');

-- Dumping structure for table s879692_banglapixel.trunkitems
DROP TABLE IF EXISTS `trunkitems`;
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s879692_banglapixel.trunkitems: ~2 rows (approximately)
DELETE FROM `trunkitems`;
INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
	(202, '0KV208XB', '[null,null,null,{"info":[],"image":"coke_brick.png","amount":1,"label":"Coke Brick","type":"item","slot":4,"unique":true,"useable":false,"name":"coke_brick","weight":1000},{"info":[],"image":"coke_brick.png","amount":1,"label":"Coke Brick","type":"item","slot":5,"unique":true,"useable":false,"name":"coke_brick","weight":1000},null,{"info":{"plate":"BICYCLE7","xenonColor":0,"pearlescentColor":0,"wheelColor":0,"colorPrimary":0,"colorSecondary":0},"image":"scorcher.png","amount":1,"label":"Scorcher Bike","type":"item","slot":7,"unique":true,"useable":true,"name":"scorcher","weight":500}]'),
	(207, '5PA202HL', '[]');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
