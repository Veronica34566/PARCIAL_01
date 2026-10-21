/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-11.8.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pixel_security_360
-- ------------------------------------------------------
-- Server version	11.8.9-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `autenticacion`
--

DROP TABLE IF EXISTS `autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion` (
  `id_autenticacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `agente_usuario` varchar(150) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_acceso` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_autenticacion`),
  UNIQUE KEY `token` (`token`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `autenticacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `autenticacion` WRITE;
/*!40000 ALTER TABLE `autenticacion` DISABLE KEYS */;
INSERT INTO `autenticacion` VALUES
(1,1,'ana.gomez','HashDemo001','Windows 11 - Chrome','tok_auth_001',1,'2026-10-21 01:55:05'),
(2,2,'luis.perez','HashDemo002','Windows 11 - Chrome','tok_auth_002',1,'2026-10-21 01:55:05'),
(3,3,'maria.rodriguez','HashDemo003','Windows 11 - Chrome','tok_auth_003',1,'2026-10-21 01:55:05'),
(4,4,'carlos.lopez','HashDemo004','Windows 11 - Chrome','tok_auth_004',1,'2026-10-21 01:55:05'),
(5,5,'sofia.martinez','HashDemo005','Windows 11 - Chrome','tok_auth_005',1,'2026-10-21 01:55:05'),
(6,6,'pedro.diaz','HashDemo006','Windows 11 - Chrome','tok_auth_006',1,'2026-10-21 01:55:05'),
(7,7,'laura.castillo','HashDemo007','Windows 11 - Chrome','tok_auth_007',1,'2026-10-21 01:55:05'),
(8,8,'jose.morales','HashDemo008','Windows 11 - Chrome','tok_auth_008',1,'2026-10-21 01:55:05'),
(9,9,'elena.torres','HashDemo009','Windows 11 - Chrome','tok_auth_009',1,'2026-10-21 01:55:05'),
(10,10,'david.sanchez','HashDemo010','Windows 11 - Chrome','tok_auth_010',1,'2026-10-21 01:55:05'),
(11,11,'paola.rivera','HashDemo011','Windows 11 - Chrome','tok_auth_011',1,'2026-10-21 01:55:05'),
(12,12,'miguel.herrera','HashDemo012','Windows 11 - Chrome','tok_auth_012',1,'2026-10-21 01:55:05'),
(13,13,'andrea.vargas','HashDemo013','Windows 11 - Chrome','tok_auth_013',1,'2026-10-21 01:55:05'),
(14,14,'ricardo.mendez','HashDemo014','Windows 11 - Chrome','tok_auth_014',1,'2026-10-21 01:55:05'),
(15,15,'gabriela.ortiz','HashDemo015','Windows 11 - Chrome','tok_auth_015',1,'2026-10-21 01:55:05'),
(16,16,'fernando.cruz','HashDemo016','Windows 11 - Chrome','tok_auth_016',1,'2026-10-21 01:55:05'),
(17,17,'daniela.rojas','HashDemo017','Windows 11 - Chrome','tok_auth_017',1,'2026-10-21 01:55:05'),
(18,18,'roberto.jimenez','HashDemo018','Windows 11 - Chrome','tok_auth_018',1,'2026-10-21 01:55:05'),
(19,19,'patricia.flores','HashDemo019','Windows 11 - Chrome','tok_auth_019',1,'2026-10-21 01:55:05'),
(20,20,'jorge.navarro','HashDemo020','Windows 11 - Chrome','tok_auth_020',1,'2026-10-21 01:55:05');
/*!40000 ALTER TABLE `autenticacion` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titular` varchar(120) NOT NULL,
  `marca_tarjeta` enum('Visa','Mastercard','American Express','Discover','Otra') NOT NULL,
  `ultimos_digitos` char(4) NOT NULL,
  `token_pago` varchar(255) DEFAULT NULL,
  `mes_vencimiento` tinyint(4) NOT NULL,
  `anio_vencimiento` smallint(6) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado_pago` enum('Pendiente','Aprobado','Rechazado') NOT NULL,
  `tarjeta_predeterminada` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_pago` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `referencia` (`referencia`),
  UNIQUE KEY `token_pago` (`token_pago`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`monto` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`mes_vencimiento` between 1 and 12)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES
(1,'PAG-001',1,'Ana Gomez','Visa','1001','tok_pago_001',12,2028,26.00,'Rechazado',1,'2026-10-21 01:56:04'),
(2,'PAG-002',2,'Luis Perez','Mastercard','1002','tok_pago_002',12,2028,27.00,'Aprobado',0,'2026-10-21 01:56:04'),
(3,'PAG-003',3,'Maria Rodriguez','Visa','1003','tok_pago_003',12,2028,28.00,'Pendiente',0,'2026-10-21 01:56:04'),
(4,'PAG-004',4,'Carlos Lopez','Mastercard','1004','tok_pago_004',12,2028,29.00,'Aprobado',0,'2026-10-21 01:56:04'),
(5,'PAG-005',5,'Sofia Martinez','Visa','1005','tok_pago_005',12,2028,30.00,'Rechazado',0,'2026-10-21 01:56:04'),
(6,'PAG-006',6,'Pedro Diaz','Mastercard','1006','tok_pago_006',12,2028,31.00,'Pendiente',0,'2026-10-21 01:56:04'),
(7,'PAG-007',7,'Laura Castillo','Visa','1007','tok_pago_007',12,2028,32.00,'Rechazado',0,'2026-10-21 01:56:04'),
(8,'PAG-008',8,'Jose Morales','Mastercard','1008','tok_pago_008',12,2028,33.00,'Aprobado',0,'2026-10-21 01:56:04'),
(9,'PAG-009',9,'Elena Torres','Visa','1009','tok_pago_009',12,2028,34.00,'Pendiente',0,'2026-10-21 01:56:04'),
(10,'PAG-010',10,'David Sanchez','Mastercard','1010','tok_pago_010',12,2028,35.00,'Aprobado',0,'2026-10-21 01:56:04'),
(11,'PAG-011',11,'Paola Rivera','Visa','1011','tok_pago_011',12,2028,36.00,'Rechazado',0,'2026-10-21 01:56:04'),
(12,'PAG-012',12,'Miguel Herrera','Mastercard','1012','tok_pago_012',12,2028,37.00,'Pendiente',0,'2026-10-21 01:56:04'),
(13,'PAG-013',13,'Andrea Vargas','Visa','1013','tok_pago_013',12,2028,38.00,'Rechazado',0,'2026-10-21 01:56:04'),
(14,'PAG-014',14,'Ricardo Mendez','Mastercard','1014','tok_pago_014',12,2028,39.00,'Aprobado',0,'2026-10-21 01:56:04'),
(15,'PAG-015',15,'Gabriela Ortiz','Visa','1015','tok_pago_015',12,2028,40.00,'Pendiente',0,'2026-10-21 01:56:04'),
(16,'PAG-016',16,'Fernando Cruz','Mastercard','1016','tok_pago_016',12,2028,41.00,'Aprobado',0,'2026-10-21 01:56:04'),
(17,'PAG-017',17,'Daniela Rojas','Visa','1017','tok_pago_017',12,2028,42.00,'Rechazado',0,'2026-10-21 01:56:04'),
(18,'PAG-018',18,'Roberto Jimenez','Mastercard','1018','tok_pago_018',12,2028,43.00,'Pendiente',0,'2026-10-21 01:56:04'),
(19,'PAG-019',19,'Patricia Flores','Visa','1019','tok_pago_019',12,2028,44.00,'Rechazado',0,'2026-10-21 01:56:04'),
(20,'PAG-020',20,'Jorge Navarro','Mastercard','1020','tok_pago_020',12,2028,45.00,'Aprobado',0,'2026-10-21 01:56:04');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_reporte` date NOT NULL,
  `nivel_riesgo` enum('Bajo','Medio','Alto','Critico') NOT NULL,
  `estado` enum('Pendiente','En proceso','Completado') NOT NULL,
  `visible_cliente` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_reporte`),
  UNIQUE KEY `referencia` (`referencia`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_pruebas` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES
(1,'REP-001',1,1,'Reporte de seguridad 1','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-02','Bajo','Pendiente',1),
(2,'REP-013',13,13,'Reporte de seguridad 13','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-14','Bajo','Pendiente',1),
(3,'REP-004',4,4,'Reporte de seguridad 4','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-05','Critico','En proceso',1),
(4,'REP-017',17,17,'Reporte de seguridad 17','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-18','Bajo','Pendiente',1),
(5,'REP-010',10,10,'Reporte de seguridad 10','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-11','Medio','En proceso',1),
(6,'REP-009',9,9,'Reporte de seguridad 9','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-10','Alto','Completado',1),
(7,'REP-016',16,16,'Reporte de seguridad 16','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-17','Critico','En proceso',1),
(8,'REP-015',15,15,'Reporte de seguridad 15','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-16','Alto','Completado',1),
(9,'REP-020',20,20,'Reporte de seguridad 20','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-21','Critico','En proceso',1),
(10,'REP-008',8,8,'Reporte de seguridad 8','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-09','Critico','En proceso',1),
(11,'REP-007',7,7,'Reporte de seguridad 7','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-08','Bajo','Pendiente',1),
(12,'REP-002',2,2,'Reporte de seguridad 2','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-03','Medio','En proceso',1),
(13,'REP-003',3,3,'Reporte de seguridad 3','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-04','Alto','Completado',1),
(14,'REP-012',12,12,'Reporte de seguridad 12','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-13','Critico','Completado',1),
(15,'REP-011',11,11,'Reporte de seguridad 11','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-12','Bajo','Pendiente',1),
(16,'REP-019',19,19,'Reporte de seguridad 19','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-20','Bajo','Pendiente',1),
(17,'REP-006',6,6,'Reporte de seguridad 6','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-07','Alto','Completado',1),
(18,'REP-014',14,14,'Reporte de seguridad 14','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-15','Medio','En proceso',1),
(19,'REP-018',18,18,'Reporte de seguridad 18','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-19','Alto','Completado',1),
(20,'REP-005',5,5,'Reporte de seguridad 5','Evaluacion de seguridad realizada en un entorno autorizado','2026-10-06','Bajo','Pendiente',1);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tipos_pruebas`
--

DROP TABLE IF EXISTS `tipos_pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pruebas` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('Activo','Desactivado') NOT NULL DEFAULT 'Activo',
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `referencia` (`referencia`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pruebas`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tipos_pruebas` WRITE;
/*!40000 ALTER TABLE `tipos_pruebas` DISABLE KEYS */;
INSERT INTO `tipos_pruebas` VALUES
(1,'TP001','Reconocimiento','Identificacion de activos y servicios del objetivo autorizado','2026-10-20','Activo',1),
(2,'TP002','Analisis de Vulnerabilidades','Deteccion y evaluacion de posibles vulnerabilidades','2026-10-20','Activo',1),
(3,'TP003','Explotacion','Validacion controlada de vulnerabilidades autorizadas','2026-10-20','Activo',1),
(4,'TP004','Escalar Privilegios o Post-Explotacion','Evaluacion autorizada del impacto y los privilegios obtenidos','2026-10-20','Activo',1),
(5,'TP005','Escaneo de Puertos','Identificacion de puertos abiertos autorizados','2026-10-20','Activo',1),
(6,'TP006','Auditoria Web','Evaluacion de la seguridad de aplicaciones web','2026-10-20','Activo',1),
(7,'TP007','Auditoria de Red','Revision de configuraciones y seguridad de red','2026-10-20','Activo',1),
(8,'TP008','Analisis de Malware','Analisis controlado de archivos sospechosos','2026-10-20','Activo',1),
(9,'TP009','Prueba de Autenticacion','Evaluacion de mecanismos de inicio de sesion','2026-10-20','Activo',1),
(10,'TP010','Auditoria de Permisos','Revision de permisos y privilegios de usuarios','2026-10-20','Activo',1),
(11,'TP011','Seguridad de Base de Datos','Revision de controles de acceso a bases de datos','2026-10-20','Activo',1),
(12,'TP012','Auditoria de API','Evaluacion de la seguridad de interfaces API','2026-10-20','Activo',1),
(13,'TP013','Prueba de Configuracion','Revision de configuraciones seguras de sistemas','2026-10-20','Activo',1),
(14,'TP014','Analisis de Cifrado','Revision de mecanismos de cifrado','2026-10-20','Activo',1),
(15,'TP015','Seguridad de Servidores','Evaluacion de controles de seguridad de servidores','2026-10-20','Activo',1),
(16,'TP016','Auditoria de Firewall','Revision de reglas y controles del firewall','2026-10-20','Activo',1),
(17,'TP017','Seguridad de Dispositivos','Revision de la proteccion de dispositivos','2026-10-20','Activo',1),
(18,'TP018','Prueba de Sesiones','Evaluacion de la gestion de sesiones','2026-10-20','Activo',1),
(19,'TP019','Auditoria de Acceso','Revision de los controles de acceso','2026-10-20','Activo',1),
(20,'TP020','Evaluacion de Riesgos','Clasificacion de riesgos de seguridad identificados','2026-10-20','Activo',1);
/*!40000 ALTER TABLE `tipos_pruebas` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `sexo` enum('Femenino','Masculino','Otro') NOT NULL,
  `estado_civil` enum('Soltero','Casado','Divorciado','Viudo','Otro') NOT NULL,
  `tipo_empresa` enum('Publica','Privada') NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `tipo_usuario` enum('Cliente','Administrador','Vendedor','Ejecutivo','Otro') NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Ana','Gomez','ana.gomez','tok_usr_001','HashDemo001','Panama','Femenino','Soltero','Privada','Via España','Cliente',1,'2026-10-21 01:54:21'),
(2,'Luis','Perez','luis.perez','tok_usr_002','HashDemo002','La Chorrera','Masculino','Casado','Publica','Barrio Balboa','Administrador',1,'2026-10-21 01:54:21'),
(3,'Maria','Rodriguez','maria.rodriguez','tok_usr_003','HashDemo003','Arraijan','Femenino','Soltero','Privada','Vista Alegre','Cliente',1,'2026-10-21 01:54:21'),
(4,'Carlos','Lopez','carlos.lopez','tok_usr_004','HashDemo004','Panama','Masculino','Casado','Privada','San Francisco','Vendedor',1,'2026-10-21 01:54:21'),
(5,'Sofia','Martinez','sofia.martinez','tok_usr_005','HashDemo005','David','Femenino','Soltero','Publica','Centro','Ejecutivo',1,'2026-10-21 01:54:21'),
(6,'Pedro','Diaz','pedro.diaz','tok_usr_006','HashDemo006','Santiago','Masculino','Divorciado','Privada','Barrio Norte','Cliente',1,'2026-10-21 01:54:21'),
(7,'Laura','Castillo','laura.castillo','tok_usr_007','HashDemo007','Chitre','Femenino','Casado','Publica','El Carmen','Cliente',1,'2026-10-21 01:54:21'),
(8,'Jose','Morales','jose.morales','tok_usr_008','HashDemo008','Panama','Masculino','Soltero','Privada','Bethania','Vendedor',1,'2026-10-21 01:54:21'),
(9,'Elena','Torres','elena.torres','tok_usr_009','HashDemo009','Colon','Femenino','Viudo','Publica','Barrio Sur','Cliente',1,'2026-10-21 01:54:21'),
(10,'David','Sanchez','david.sanchez','tok_usr_010','HashDemo010','Penonome','Masculino','Casado','Privada','Centro','Ejecutivo',1,'2026-10-21 01:54:21'),
(11,'Paola','Rivera','paola.rivera','tok_usr_011','HashDemo011','Panama','Femenino','Soltero','Privada','Costa del Este','Cliente',1,'2026-10-21 01:54:21'),
(12,'Miguel','Herrera','miguel.herrera','tok_usr_012','HashDemo012','David','Masculino','Casado','Publica','San Mateo','Administrador',1,'2026-10-21 01:54:21'),
(13,'Andrea','Vargas','andrea.vargas','tok_usr_013','HashDemo013','Arraijan','Femenino','Divorciado','Privada','Nuevo Chorrillo','Cliente',1,'2026-10-21 01:54:21'),
(14,'Ricardo','Mendez','ricardo.mendez','tok_usr_014','HashDemo014','Chitre','Masculino','Soltero','Publica','Centro','Vendedor',1,'2026-10-21 01:54:21'),
(15,'Gabriela','Ortiz','gabriela.ortiz','tok_usr_015','HashDemo015','Panama','Femenino','Casado','Privada','El Dorado','Ejecutivo',1,'2026-10-21 01:54:21'),
(16,'Fernando','Cruz','fernando.cruz','tok_usr_016','HashDemo016','Colon','Masculino','Soltero','Publica','Cativá','Cliente',1,'2026-10-21 01:54:21'),
(17,'Daniela','Rojas','daniela.rojas','tok_usr_017','HashDemo017','Santiago','Femenino','Soltero','Privada','Centro','Cliente',1,'2026-10-21 01:54:21'),
(18,'Roberto','Jimenez','roberto.jimenez','tok_usr_018','HashDemo018','La Chorrera','Masculino','Divorciado','Publica','El Coco','Administrador',1,'2026-10-21 01:54:21'),
(19,'Patricia','Flores','patricia.flores','tok_usr_019','HashDemo019','Panama','Femenino','Casado','Privada','Juan Diaz','Cliente',1,'2026-10-21 01:54:21'),
(20,'Jorge','Navarro','jorge.navarro','tok_usr_020','HashDemo020','David','Masculino','Soltero','Publica','Pedregal','Vendedor',1,'2026-10-21 01:54:21');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-21  2:18:08
