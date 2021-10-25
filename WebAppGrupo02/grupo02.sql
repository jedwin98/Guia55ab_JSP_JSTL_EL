# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: grupo02
# ------------------------------------------------------
# Server version 5.5.5-10.4.10-MariaDB

DROP DATABASE IF EXISTS `grupo02`;
CREATE DATABASE `grupo02` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `grupo02`;

#
# Source for table libro
#

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `titulo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autor` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `editorial` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#
# Dumping data for table libro
#

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'9788423973378','LA ILIADA','Homero','S.L.U. ESPASA LIBROS');
INSERT INTO `libro` VALUES (2,'9788424926335','La Odisea','Homero','GREDOS');
INSERT INTO `libro` VALUES (3,'9788426108814','La Eneida','Publio Virgilio Maron','Juventud');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table usuarios
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Dumping data for table usuarios
#

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Digitador','1234','Digitador Prueba',1);
INSERT INTO `usuarios` VALUES (2,'Mantenimiento','1234','Mantenimiento Prueba',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
