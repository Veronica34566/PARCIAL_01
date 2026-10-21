/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-11.8.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: parcial01
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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `resultado` enum('exitoso','fallido','denegado') NOT NULL,
  `modulo` enum('usuarios','autenticacion','reportes','pagos') NOT NULL,
  `requiere_revision` tinyint(1) NOT NULL DEFAULT 0,
  `codigo_evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_auditoria`),
  UNIQUE KEY `codigo_evento` (`codigo_evento`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES
(1,1,'Inicio de sesion','2026-10-11 08:00:00','exitoso','autenticacion',0,'AUD-001'),
(2,2,'Consulta de servicios','2026-10-11 08:15:00','exitoso','reportes',0,'AUD-002'),
(3,3,'Intento de acceso fallido','2026-10-11 08:30:00','fallido','autenticacion',1,'AUD-003'),
(4,4,'Actualizacion de usuario','2026-10-11 09:00:00','exitoso','usuarios',0,'AUD-004'),
(5,5,'Acceso bloqueado','2026-10-11 09:15:00','denegado','autenticacion',1,'AUD-005'),
(6,6,'Consulta de pagos','2026-10-11 09:30:00','exitoso','pagos',0,'AUD-006'),
(7,7,'Registro de pago','2026-10-11 10:00:00','exitoso','pagos',0,'AUD-007'),
(8,8,'Intento de acceso fallido','2026-10-11 10:15:00','fallido','autenticacion',1,'AUD-008'),
(9,9,'Consulta de reportes','2026-10-11 10:30:00','exitoso','reportes',0,'AUD-009'),
(10,10,'Cierre de sesion','2026-10-11 11:00:00','exitoso','autenticacion',0,'AUD-010');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `autenticacion`
--

DROP TABLE IF EXISTS `autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion` (
  `id_auth` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_dispositivo` varchar(100) NOT NULL,
  `fecha_acceso` datetime NOT NULL,
  `resultado` enum('exitoso','fallido','bloqueado') NOT NULL,
  `tipo_acceso` enum('web','movil','escritorio') NOT NULL,
  `verificado` tinyint(1) NOT NULL DEFAULT 0,
  `codigo_sesion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_auth`),
  UNIQUE KEY `codigo_sesion` (`codigo_sesion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `autenticacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `autenticacion` WRITE;
/*!40000 ALTER TABLE `autenticacion` DISABLE KEYS */;
INSERT INTO `autenticacion` VALUES
(1,1,'PC-ADMIN-01','2026-10-11 08:00:00','exitoso','escritorio',1,'SES-001'),
(2,2,'Laptop-LUIS','2026-10-11 08:15:00','exitoso','web',1,'SES-002'),
(3,3,'Movil-MARIA','2026-10-11 08:30:00','fallido','movil',0,'SES-003'),
(4,4,'PC-CARLOS','2026-10-11 09:00:00','exitoso','escritorio',1,'SES-004'),
(5,5,'Laptop-SOFIA','2026-10-11 09:15:00','bloqueado','web',0,'SES-005'),
(6,6,'Movil-PEDRO','2026-10-11 09:30:00','fallido','movil',0,'SES-006'),
(7,7,'PC-LAURA','2026-10-11 10:00:00','exitoso','escritorio',1,'SES-007'),
(8,8,'Laptop-JOSE','2026-10-11 10:15:00','exitoso','web',1,'SES-008'),
(9,9,'Movil-ELENA','2026-10-11 10:30:00','bloqueado','movil',0,'SES-009'),
(10,10,'PC-DAVID','2026-10-11 11:00:00','exitoso','escritorio',1,'SES-010');
/*!40000 ALTER TABLE `autenticacion` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `contrataciones`
--

DROP TABLE IF EXISTS `contrataciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrataciones` (
  `id_contratacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `estado` enum('pendiente','activa','cancelada') NOT NULL DEFAULT 'pendiente',
  `renovacion_automatica` tinyint(1) NOT NULL DEFAULT 0,
  `codigo_contrato` varchar(30) NOT NULL,
  PRIMARY KEY (`id_contratacion`),
  UNIQUE KEY `codigo_contrato` (`codigo_contrato`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `contrataciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `contrataciones_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrataciones`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `contrataciones` WRITE;
/*!40000 ALTER TABLE `contrataciones` DISABLE KEYS */;
INSERT INTO `contrataciones` VALUES
(1,1,1,'2026-10-01','activa',1,'CONT-001'),
(2,2,2,'2026-10-02','activa',0,'CONT-002'),
(3,3,3,'2026-10-03','pendiente',0,'CONT-003'),
(4,4,4,'2026-10-04','activa',1,'CONT-004'),
(5,5,5,'2026-10-05','activa',0,'CONT-005'),
(6,6,6,'2026-10-06','cancelada',0,'CONT-006'),
(7,7,7,'2026-10-07','pendiente',1,'CONT-007'),
(8,8,8,'2026-10-08','activa',0,'CONT-008'),
(9,9,9,'2026-10-09','cancelada',0,'CONT-009'),
(10,10,10,'2026-10-10','pendiente',1,'CONT-010');
/*!40000 ALTER TABLE `contrataciones` ENABLE KEYS */;
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
  `id_contratacion` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL CHECK (`monto` >= 0),
  `fecha_pago` date NOT NULL,
  `estado_pago` enum('pendiente','pagado','rechazado') NOT NULL,
  `metodo_pago` enum('tarjeta','transferencia','efectivo') NOT NULL,
  `confirmado` tinyint(1) NOT NULL DEFAULT 0,
  `referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `referencia` (`referencia`),
  KEY `id_contratacion` (`id_contratacion`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_contratacion`) REFERENCES `contrataciones` (`id_contratacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES
(1,1,25.00,'2026-10-11','pagado','tarjeta',1,'PAGO-001'),
(2,2,150.00,'2026-10-11','pagado','transferencia',1,'PAGO-002'),
(3,3,300.00,'2026-10-12','pendiente','tarjeta',0,'PAGO-003'),
(4,4,35.00,'2026-10-12','pagado','efectivo',1,'PAGO-004'),
(5,5,200.00,'2026-10-13','pagado','transferencia',1,'PAGO-005'),
(6,6,50.00,'2026-10-13','rechazado','tarjeta',0,'PAGO-006'),
(7,7,450.00,'2026-10-14','pendiente','transferencia',0,'PAGO-007'),
(8,8,40.00,'2026-10-14','pagado','efectivo',1,'PAGO-008'),
(9,9,180.00,'2026-10-15','rechazado','tarjeta',0,'PAGO-009'),
(10,10,120.00,'2026-10-15','pendiente','transferencia',0,'PAGO-010');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL CHECK (`precio` >= 0),
  `tipo` enum('software','soporte','redes','seguridad') NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES
(1,'Antivirus empresarial','Proteccion contra malware',25.00,'seguridad',0),
(2,'Auditoria de red','Revision de seguridad de red',150.00,'redes',1),
(3,'Desarrollo web','Creacion de sitios web',300.00,'software',1),
(4,'Soporte tecnico','Asistencia tecnica a usuarios',35.00,'soporte',1),
(5,'Prueba de vulnerabilidades','Evaluacion de vulnerabilidades',200.00,'seguridad',1),
(6,'Configuracion de router','Configuracion de equipos de red',50.00,'redes',1),
(7,'Sistema de inventario','Desarrollo de sistema de inventario',450.00,'software',1),
(8,'Mantenimiento de PC','Mantenimiento preventivo de equipos',40.00,'soporte',1),
(9,'Monitoreo de seguridad','Supervision de eventos de seguridad',180.00,'seguridad',1),
(10,'Instalacion de red','Instalacion de red local',120.00,'redes',0);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
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
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Ana','Gomez','ana.gomez@pixel.test','activo',1),
(2,'Luis','Perez','luis.perez@pixel.test','activo',1),
(3,'Maria','Rodriguez','maria.rodriguez@pixel.test','activo',1),
(4,'Carlos','Lopez','carlos.lopez@pixel.test','activo',1),
(5,'Sofia','Martinez','sofia.martinez@pixel.test','activo',1),
(6,'Pedro','Diaz','pedro.diaz@pixel.test','inactivo',0),
(7,'Laura','Castillo','laura.castillo@pixel.test','activo',1),
(8,'Jose','Morales','jose.morales@pixel.test','activo',1),
(9,'Elena','Torres','elena.torres@pixel.test','inactivo',0),
(10,'David','Sanchez','david.sanchez@pixel.test','activo',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Temporary table structure for view `v_auditoria`
--

DROP TABLE IF EXISTS `v_auditoria`;
/*!50001 DROP VIEW IF EXISTS `v_auditoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_auditoria` AS SELECT
 NULL AS `id_auditoria`,
 NULL AS `usuario`,
 NULL AS `accion`,
 NULL AS `fecha_evento`,
 NULL AS `resultado`,
 NULL AS `modulo`,
 NULL AS `requiere_revision` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_contrataciones`
--

DROP TABLE IF EXISTS `v_contrataciones`;
/*!50001 DROP VIEW IF EXISTS `v_contrataciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_contrataciones` AS SELECT
 NULL AS `id_contratacion`,
 NULL AS `codigo_contrato`,
 NULL AS `usuario`,
 NULL AS `servicio`,
 NULL AS `precio`,
 NULL AS `fecha_contratacion`,
 NULL AS `estado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_ia`
--

DROP TABLE IF EXISTS `v_ia`;
/*!50001 DROP VIEW IF EXISTS `v_ia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ia` AS SELECT
 NULL AS `resultado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_seguridad`
--

DROP TABLE IF EXISTS `v_seguridad`;
/*!50001 DROP VIEW IF EXISTS `v_seguridad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_seguridad` AS SELECT
 NULL AS `id_usuario`,
 NULL AS `nombre`,
 NULL AS `apellido`,
 NULL AS `estado`,
 NULL AS `activo` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'parcial01'
--

--
-- Dumping routines for database 'parcial01'
--

--
-- Final view structure for view `v_auditoria`
--

/*!50001 DROP VIEW IF EXISTS `v_auditoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_auditoria` AS select `a`.`id_auditoria` AS `id_auditoria`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `usuario`,`a`.`accion` AS `accion`,`a`.`fecha_evento` AS `fecha_evento`,`a`.`resultado` AS `resultado`,`a`.`modulo` AS `modulo`,`a`.`requiere_revision` AS `requiere_revision` from (`auditoria` `a` join `usuarios` `u` on(`a`.`id_usuario` = `u`.`id_usuario`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_contrataciones`
--

/*!50001 DROP VIEW IF EXISTS `v_contrataciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_contrataciones` AS select `c`.`id_contratacion` AS `id_contratacion`,`c`.`codigo_contrato` AS `codigo_contrato`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `usuario`,`s`.`nombre` AS `servicio`,`s`.`precio` AS `precio`,`c`.`fecha_contratacion` AS `fecha_contratacion`,`c`.`estado` AS `estado` from ((`contrataciones` `c` join `usuarios` `u` on(`c`.`id_usuario` = `u`.`id_usuario`)) join `servicios` `s` on(`c`.`id_servicio` = `s`.`id_servicio`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ia`
--

/*!50001 DROP VIEW IF EXISTS `v_ia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ia` AS select 2 + 4 AS `resultado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_seguridad`
--

/*!50001 DROP VIEW IF EXISTS `v_seguridad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`estudiante`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_seguridad` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`nombre` AS `nombre`,`usuarios`.`apellido` AS `apellido`,`usuarios`.`estado` AS `estado`,`usuarios`.`activo` AS `activo` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-21  0:34:20
