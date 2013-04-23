-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.10-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema gestioncomposant
--

CREATE DATABASE IF NOT EXISTS gestioncomposant;
USE gestioncomposant;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `login` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `composantlogiciel`
--

DROP TABLE IF EXISTS `composantlogiciel`;
CREATE TABLE `composantlogiciel` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `nature` varchar(50) NOT NULL,
  `licence` varchar(50) NOT NULL,
  `cout` varchar(50) DEFAULT NULL,
  `id_rp` int(11) NOT NULL,
  `id_version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_version` (`id_version`),
  KEY `id_rp` (`id_rp`),
  CONSTRAINT `composantlogiciel_ibfk_1` FOREIGN KEY (`id_version`) REFERENCES `versions` (`id`),
  CONSTRAINT `composantlogiciel_ibfk_2` FOREIGN KEY (`id_rp`) REFERENCES `responsableprojet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composantlogiciel`
--

/*!40000 ALTER TABLE `composantlogiciel` DISABLE KEYS */;
/*!40000 ALTER TABLE `composantlogiciel` ENABLE KEYS */;


--
-- Definition of table `liste_cl`
--

DROP TABLE IF EXISTS `liste_cl`;
CREATE TABLE `liste_cl` (
  `id` int(11) NOT NULL,
  `liste` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liste_cl`
--

/*!40000 ALTER TABLE `liste_cl` DISABLE KEYS */;
/*!40000 ALTER TABLE `liste_cl` ENABLE KEYS */;


--
-- Definition of table `produitlogiciel`
--

DROP TABLE IF EXISTS `produitlogiciel`;
CREATE TABLE `produitlogiciel` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `nature` varchar(50) NOT NULL,
  `client` varchar(50) DEFAULT NULL,
  `cout` float DEFAULT NULL,
  `licence` varchar(50) NOT NULL,
  `etat` varchar(50) NOT NULL,
  `id_rp` int(11) NOT NULL,
  `id_listcl` int(11) DEFAULT NULL,
  `id_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_version` (`id_version`),
  KEY `id_listcl` (`id_listcl`),
  KEY `id_rp` (`id_rp`),
  CONSTRAINT `produitlogiciel_ibfk_1` FOREIGN KEY (`id_version`) REFERENCES `versions` (`id`),
  CONSTRAINT `produitlogiciel_ibfk_2` FOREIGN KEY (`id_listcl`) REFERENCES `liste_cl` (`id`),
  CONSTRAINT `produitlogiciel_ibfk_3` FOREIGN KEY (`id_rp`) REFERENCES `responsableprojet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produitlogiciel`
--

/*!40000 ALTER TABLE `produitlogiciel` DISABLE KEYS */;
/*!40000 ALTER TABLE `produitlogiciel` ENABLE KEYS */;


--
-- Definition of table `responsableprojet`
--

DROP TABLE IF EXISTS `responsableprojet`;
CREATE TABLE `responsableprojet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `responsableprojet`
--

/*!40000 ALTER TABLE `responsableprojet` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsableprojet` ENABLE KEYS */;


--
-- Definition of table `versions`
--

DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
