# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.15)
# Database: mtg
# Generation Time: 2014-07-10 15:14:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sets`;

CREATE TABLE `sets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `code` varchar(4) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `gatherer_code` varchar(4) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `release_date` date DEFAULT NULL,
  `block` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;

INSERT INTO `sets` (`id`, `name`, `code`, `gatherer_code`, `release_date`, `block`)
VALUES
	(1,'Limited Edition Alpha','LEA','1E','1993-08-05',''),
	(2,'Limited Edition Beta','LEB','2E','1993-10-01',''),
	(3,'Arabian Nights','ARN','AN','1993-12-01',''),
	(4,'Unlimited Edition','2ED','2U','1993-12-01',''),
	(5,'Antiquities','ATQ','AQ','1994-03-01',''),
	(6,'Revised Edition','3ED','3E','1994-04-01',''),
	(7,'Legends','LEG','LE','1994-06-01',''),
	(8,'Promo set for Gatherer','PPR','PPR','1994-07-01',''),
	(9,'The Dark','DRK','DK','1994-08-01',''),
	(10,'Fallen Empires','FEM','FE','1994-11-01',''),
	(11,'Fourth Edition','4ED','4E','1995-04-01',''),
	(12,'Ice Age','ICE','IA','1995-06-01','Ice Age'),
	(13,'Chronicles','CHR','CH','1995-07-01',''),
	(14,'Homelands','HML','HM','1995-10-01',''),
	(15,'Alliances','ALL','AL','1996-06-10','Ice Age'),
	(16,'Rivals Quick Start Set','RQS','RQS','1996-07-01',''),
	(17,'Mirage','MIR','MI','1996-10-08','Mirage'),
	(18,'Introductory Two-Player Set','ITP','ITP','1996-12-31',''),
	(19,'Visions','VIS','VI','1997-02-03','Mirage'),
	(20,'Fifth Edition','5ED','5E','1997-03-24',''),
	(21,'Portal','POR','PO','1997-05-01',''),
	(22,'Vanguard','VAN','VAN','1997-05-01',''),
	(23,'Weatherlight','WTH','WL','1997-06-09','Mirage'),
	(24,'Tempest','TMP','TE','1997-10-14','Tempest'),
	(25,'Stronghold','STH','ST','1998-03-02','Tempest'),
	(26,'Portal Second Age','PO2','P2','1998-06-01',''),
	(27,'Exodus','EXO','EX','1998-06-15','Tempest'),
	(28,'Unglued','UGL','UG','1998-08-11',''),
	(29,'Urza\'s Saga','USG','UZ','1998-10-12','Urza\'s'),
	(30,'Anthologies','ATH','ATH','1998-11-01',''),
	(31,'Urza\'s Legacy','ULG','GU','1999-02-15','Urza\'s'),
	(32,'Classic Sixth Edition','6ED','6E','1999-04-21',''),
	(33,'Portal Three Kingdoms','PTK','PK','1999-05-01',''),
	(34,'Urza\'s Destiny','UDS','CG','1999-06-07','Urza\'s'),
	(35,'Starter 1999','S99','P3','1999-07-01',''),
	(36,'Mercadian Masques','MMQ','MM','1999-10-04','Masques'),
	(37,'Battle Royale Box Set','BRB','BR','1999-11-12',''),
	(38,'Nemesis','NMS','NE','2000-02-14','Masques'),
	(39,'Starter 2000','S00','P4','2000-04-01',''),
	(40,'Prophecy','PCY','PR','2000-06-05','Masques'),
	(41,'Beatdown Box Set','BTD','BD','2000-10-01',''),
	(42,'Invasion','INV','IN','2000-10-02','Invasion'),
	(43,'Planeshift','PLS','PS','2001-02-05','Invasion'),
	(44,'Seventh Edition','7ED','7E','2001-04-11',''),
	(45,'Apocalypse','APC','AP','2001-06-04','Invasion'),
	(46,'Odyssey','ODY','OD','2001-10-01','Odyssey'),
	(47,'Deckmasters','DKM','DKM','2001-12-01',''),
	(48,'Torment','TOR','TOR','2002-02-04','Odyssey'),
	(49,'Judgment','JUD','JUD','2002-05-27','Odyssey'),
	(50,'Onslaught','ONS','ONS','2002-10-07','Onslaught'),
	(51,'Legions','LGN','LGN','2003-02-03','Onslaught'),
	(52,'Scourge','SCG','SCG','2003-05-26','Onslaught'),
	(53,'Eighth Edition','8ED','8ED','2003-07-28',''),
	(54,'Mirrodin','MRD','MRD','2003-10-02','Mirrodin'),
	(55,'Darksteel','DST','DST','2004-02-06','Mirrodin'),
	(56,'Fifth Dawn','5DN','5DN','2004-06-04','Mirrodin'),
	(57,'Champions of Kamigawa','CHK','CHK','2004-10-01','Kamigawa'),
	(58,'Unhinged','UNH','UNH','2004-11-20',''),
	(59,'Betrayers of Kamigawa','BOK','BOK','2005-02-04','Kamigawa'),
	(60,'Saviors of Kamigawa','SOK','SOK','2005-06-03','Kamigawa'),
	(61,'Ninth Edition','9ED','9ED','2005-07-29',''),
	(62,'Ravnica: City of Guilds','RAV','RAV','2005-10-07','Ravnica'),
	(63,'Guildpact','GPT','GPT','2006-02-03','Ravnica'),
	(64,'Dissension','DIS','DIS','2006-05-05','Ravnica'),
	(65,'Coldsnap','CSP','CSP','2006-07-21','Ice Age'),
	(66,'Time Spiral','TSP','TSP','2006-10-06','Time Spiral'),
	(67,'Time Spiral \"Timeshifted\"','TSB','TSB','2006-10-06','Time Spiral'),
	(68,'Happy Holidays','HHO','HHO','2006-12-25',''),
	(69,'Planar Chaos','PLC','PLC','2007-02-02','Time Spiral'),
	(70,'Future Sight','FUT','FUT','2007-05-04','Time Spiral'),
	(71,'Tenth Edition','10E','10E','2007-07-13',''),
	(72,'Masters Edition','MED','MED','2007-09-10',''),
	(73,'Lorwyn','LRW','LRW','2007-10-12','Lorwyn'),
	(74,'Duel Decks: Elves vs. Goblins','EVG','EVG','2007-11-16',''),
	(75,'Morningtide','MOR','MOR','2008-02-01','Lorwyn'),
	(76,'Shadowmoor','SHM','SHM','2008-05-02','Shadowmoor'),
	(77,'Eventide','EVE','EVE','2008-07-25','Shadowmoor'),
	(78,'From the Vault: Dragons','DRB','DRB','2008-08-29',''),
	(79,'Masters Edition II','ME2','ME2','2008-09-22',''),
	(80,'Shards of Alara','ALA','ALA','2008-10-03','Alara'),
	(81,'Duel Decks: Jace vs. Chandra','DD2','DD2','2008-11-07',''),
	(82,'Conflux','CON','CON','2009-02-06','Alara'),
	(83,'Duel Decks: Divine vs. Demonic','DDC','DDC','2009-04-10',''),
	(84,'Alara Reborn','ARB','ARB','2009-04-30','Alara'),
	(85,'Magic 2010','M10','M10','2009-07-17',''),
	(86,'From the Vault: Exiled','V09','V09','2009-08-28',''),
	(87,'Planechase','HOP','HOP','2009-09-04',''),
	(88,'Masters Edition III','ME3','ME3','2009-09-07',''),
	(89,'Zendikar','ZEN','ZEN','2009-10-02','Zendikar'),
	(90,'Duel Decks: Garruk vs. Liliana','DDD','DDD','2009-10-30',''),
	(91,'Premium Deck Series: Slivers','H09','H09','2009-11-20',''),
	(92,'Worldwake','WWK','WWK','2010-02-05','Zendikar'),
	(93,'Duel Decks: Phyrexia vs. the Coalition','DDE','DDE','2010-03-19',''),
	(94,'Rise of the Eldrazi','ROE','ROE','2010-04-23','Zendikar'),
	(95,'Duels of the Planeswalkers','DPA','DPA','2010-06-04',''),
	(96,'Archenemy','ARC','ARC','2010-06-18',''),
	(97,'Magic 2011','M11','M11','2010-07-16',''),
	(98,'From the Vault: Relics','V10','V10','2010-08-27',''),
	(99,'Duel Decks: Elspeth vs. Tezzeret','DDF','DDF','2010-09-03',''),
	(100,'Scars of Mirrodin','SOM','SOM','2010-10-01','Scars of Mirrodin'),
	(101,'Premium Deck Series: Fire and Lightning','PD2','PD2','2010-11-19',''),
	(102,'Masters Edition IV','ME4','ME4','2011-01-10',''),
	(103,'Mirrodin Besieged','MBS','MBS','2011-02-04','Scars of Mirrodin'),
	(104,'Duel Decks: Knights vs. Dragons','DDG','DDG','2011-04-01',''),
	(105,'New Phyrexia','NPH','NPH','2011-05-13','Scars of Mirrodin'),
	(106,'Magic: The Gathering-Commander','CMD','CMD','2011-06-17',''),
	(107,'Magic 2012','M12','M12','2011-07-15',''),
	(108,'From the Vault: Legends','V11','V11','2011-08-26',''),
	(109,'Duel Decks: Ajani vs. Nicol Bolas','DDH','DDH','2011-09-02',''),
	(110,'Innistrad','ISD','ISD','2011-09-30','Innistrad'),
	(111,'Premium Deck Series: Graveborn','PD3','PD3','2011-11-18',''),
	(112,'Dark Ascension','DKA','DKA','2012-02-03','Innistrad'),
	(113,'Duel Decks: Venser vs. Koth','DDI','DDI','2012-03-30',''),
	(114,'Avacyn Restored','AVR','AVR','2012-05-04','Innistrad'),
	(115,'Planechase 2012 Edition','PC2','PC2','2012-06-01',''),
	(116,'Magic 2013','M13','M13','2012-07-13',''),
	(117,'From the Vault: Realms','V12','V12','2012-08-31',''),
	(118,'Duel Decks: Izzet vs. Golgari','DDJ','DDJ','2012-09-07',''),
	(119,'Return to Ravnica','RTR','RTR','2012-10-05','Return to Ravnica'),
	(120,'Commander\'s Arsenal','CMA','CM1','2012-11-02',''),
	(121,'Gatecrash','GTC','GTC','2013-02-01','Return to Ravnica'),
	(122,'Duel Decks: Sorin vs. Tibalt','DDK','DDK','2013-03-15',''),
	(123,'Dragon\'s Maze','DGM','DGM','2013-05-03','Return to Ravnica'),
	(124,'Modern Masters','MMA','MMA','2013-06-07',''),
	(125,'Magic 2014 Core Set','M14','M14','2013-07-19',''),
	(126,'From the Vault: Twenty','V13','V13','2013-08-23',''),
	(127,'Duel Decks: Heroes vs. Monsters','DDL','DDL','2013-09-06',''),
	(128,'Theros','THS','THS','2013-09-27','Theros'),
	(129,'Commander 2013 Edition','C13','C13','2013-11-01',''),
	(130,'Born of the Gods','BNG','BNG','2014-02-07','Theros'),
	(131,'Duel Decks: Jace vs. Vraska','DDM','DDM','2014-03-14',''),
	(132,'Journey into Nyx','JOU','JOU','2014-05-02','Theros'),
	(133,'Modern Event Deck 2014','MD1','MD1','2014-05-30',''),
	(134,'Magic: The Gatheringâ€”Conspiracy','CNS','CNS','2014-06-06',''),
	(135,'Vintage Masters','VMA','VMA','2014-06-16','');

/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
