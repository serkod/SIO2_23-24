-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.43-community-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bdd_vehicules
--

CREATE DATABASE IF NOT EXISTS bdd_vehicules;
USE bdd_vehicules;

--
-- Definition of table `t_agents`
--

DROP TABLE IF EXISTS `t_agents`;
CREATE TABLE `t_agents` (
  `MatA` varchar(4) NOT NULL,
  `NomA` varchar(25) DEFAULT NULL,
  `PrenomA` varchar(15) DEFAULT NULL,
  `PB` tinyint(1) DEFAULT NULL,
  `PC` tinyint(1) DEFAULT NULL,
  `PhotoA` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`MatA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_agents`
--

/*!40000 ALTER TABLE `t_agents` DISABLE KEYS */;
INSERT INTO `t_agents` (`MatA`,`NomA`,`PrenomA`,`PB`,`PC`,`PhotoA`) VALUES 
 ('B125','CHECHUR','Macha',1,1,'objet OLE non gr'),
 ('E540','BIENUNEPOZ','Humphrey',1,0,'objet OLE non gr'),
 ('E578','ZEBLUES','Agathe',1,1,'objet OLE non gr'),
 ('e712','fotohoukoi','Thomas',1,1,'objet OLE non gr'),
 ('G124','MORFLAIS','Ella',1,0,'objet OLE non gr'),
 ('H540','MANSOIF','Grard',0,0,'objet OLE non gr');
/*!40000 ALTER TABLE `t_agents` ENABLE KEYS */;


--
-- Definition of table `t_vehicules`
--

DROP TABLE IF EXISTS `t_vehicules`;
CREATE TABLE `t_vehicules` (
  `NumV` varchar(8) NOT NULL,
  `MarqueV` varchar(50) DEFAULT NULL,
  `ModeleV` varchar(50) DEFAULT NULL,
  `TypeV` varchar(50) NOT NULL,
  `PrixV` decimal(19,4) DEFAULT NULL,
  `AnneeV` smallint(6) DEFAULT NULL,
  `EtatV` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NumV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_vehicules`
--

/*!40000 ALTER TABLE `t_vehicules` DISABLE KEYS */;
INSERT INTO `t_vehicules` (`NumV`,`MarqueV`,`ModeleV`,`TypeV`,`PrixV`,`AnneeV`,`EtatV`) VALUES 
 ('123456','opel','Inconnu','Berline','500000.0000',1995,'OK'),
 ('123459','RENAULT','Inconnu','Utilitaire','500000.0000',2002,'HS'),
 ('187487','peugeot','206','Berline','1300000.0000',1998,'OK'),
 ('195258','toyota','Landcruiser','4x4','4500000.0000',1999,'OK'),
 ('198365','nissan','Patrol','4x4','4000000.0000',1999,NULL),
 ('209112','Peugeot','Partner','Utilitaire','1900000.0000',2000,'OK'),
 ('215478','peugeot','Partner','Utilitaire','2000000.0000',2000,NULL),
 ('224012','renault','Mgane','Berline','2000000.0000',2002,'OK'),
 ('245096','renault','Kangoo','Utilitaire','1700000.0000',2004,NULL),
 ('247985','Kia','Inconnu','Camion','3500000.0000',2004,NULL),
 ('299999','KIA','Inconnu','Berline','1000000.0000',2009,'OK');
/*!40000 ALTER TABLE `t_vehicules` ENABLE KEYS */;

--
-- Definition of table `t_attribuer`
--

DROP TABLE IF EXISTS `t_attribuer`;
CREATE TABLE `t_attribuer` (
  `NumAtt` int(11) NOT NULL AUTO_INCREMENT,
  `MatA` varchar(4) NOT NULL,
  `NumV` varchar(50) NOT NULL,
  `DateAtt` datetime NOT NULL,
  PRIMARY KEY (`NumAtt`),
  KEY `MatA` (`MatA`),
  KEY `NumV` (`NumV`),
  CONSTRAINT `t_attribuer_ibfk_1` FOREIGN KEY (`MatA`) REFERENCES `t_agents` (`MatA`),
  CONSTRAINT `t_attribuer_ibfk_2` FOREIGN KEY (`NumV`) REFERENCES `t_vehicules` (`NumV`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_attribuer`
--

/*!40000 ALTER TABLE `t_attribuer` DISABLE KEYS */;
INSERT INTO `t_attribuer` (`NumAtt`,`MatA`,`NumV`,`DateAtt`) VALUES 
 (3,'G124','187487','2008-03-01 00:00:00'),
 (4,'G124','245096','2011-04-12 00:00:00'),
 (5,'H540','198365','2004-10-13 00:00:00'),
 (6,'B125','198365','2006-06-13 00:00:00'),
 (8,'E712','247985','2009-03-02 00:00:00'),
 (9,'E578','247985','2010-11-24 00:00:00'),
 (10,'B125','245096','2010-02-03 00:00:00'),
 (11,'H540','215478','2006-06-13 00:00:00'),
 (12,'E540','209112','2006-05-25 00:00:00'),
 (14,'E578','198365','2009-02-03 00:00:00'),
 (27,'B125','195258','2013-02-08 00:00:00'),
 (28,'E578','195258','2013-02-24 00:00:00');
/*!40000 ALTER TABLE `t_attribuer` ENABLE KEYS */;


--
-- Definition of table `t_reparations`
--

DROP TABLE IF EXISTS `t_reparations`;
CREATE TABLE `t_reparations` (
  `NumR` int(11) NOT NULL AUTO_INCREMENT,
  `DateR` datetime NOT NULL,
  `NumV` varchar(8) NOT NULL,
  `DescR` text,
  `KmR` int(11) NOT NULL,
  `PrixR` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`NumR`),
  KEY `NumV` (`NumV`),
  CONSTRAINT `t_reparations_ibfk_1` FOREIGN KEY (`NumV`) REFERENCES `t_vehicules` (`NumV`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_reparations`
--

/*!40000 ALTER TABLE `t_reparations` DISABLE KEYS */;
INSERT INTO `t_reparations` (`NumR`,`DateR`,`NumV`,`DescR`,`KmR`,`PrixR`) VALUES 
 (8,'2009-08-10 00:00:00','198365','Changement filtre  huile\r\nVidange',175559,'10000.0000'),
 (9,'2009-04-02 00:00:00','247985','Rvision',25700,'5000.0000'),
 (10,'2005-12-21 00:00:00','247985','Vidange et changement des pneus avant',54800,'18000.0000'),
 (11,'2005-06-15 00:00:00','245096','Problmes lectriques',15400,'12000.0000'),
 (12,'2006-05-04 00:00:00','245096','Rvision',35000,'9000.0000'),
 (13,'2004-07-25 00:00:00','224012','Rvision',15900,'14000.0000'),
 (14,'2006-07-25 00:00:00','224012','Rparations diverses, carrosserie',35000,'65000.0000'),
 (15,'2001-08-14 00:00:00','215478','Alternateur',25600,'25000.0000'),
 (16,'2005-12-25 00:00:00','215478','Echange standard bloc moteur',75600,'255000.0000'),
 (17,'2002-03-30 00:00:00','209112','Distribution',48700,'56000.0000'),
 (18,'2003-09-08 00:00:00','198365','Rvision complte',68400,'47300.0000'),
 (19,'2004-11-14 00:00:00','198365','Circuit freinage, pneumatiques, hydraulique, transmission',124800,'128900.0000'),
 (20,'1999-11-30 00:00:00','195258','Bullbar pulvrise',25650,'36000.0000'),
 (21,'2004-04-04 00:00:00','195258','Rvision intgrale',105400,'85000.0000'),
 (25,'2012-02-04 00:00:00','195258','Pot echappement',210365,'25000.0000');
/*!40000 ALTER TABLE `t_reparations` ENABLE KEYS */;





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
