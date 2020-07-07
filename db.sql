-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.30-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5669
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla granja.almacen
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `idAlmc` int(11) NOT NULL AUTO_INCREMENT,
  `granja_id` varchar(50) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `precio_unitario` decimal(11,2) NOT NULL DEFAULT '0.00',
  `destino_ubicacion` varchar(50) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  PRIMARY KEY (`idAlmc`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.almacen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;

-- Volcando estructura para tabla granja.cargos
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `idCrg` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`idCrg`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.cargos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`idCrg`, `cargo`) VALUES
	(1, 'Supervisor'),
	(2, 'Capataz'),
	(3, 'Capataz 2'),
	(4, 'Galponero'),
	(5, 'Guardian'),
	(6, 'Volante'),
	(7, 'Cocinera'),
	(8, 'Comedor');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Volcando estructura para tabla granja.cols_set
DROP TABLE IF EXISTS `cols_set`;
CREATE TABLE IF NOT EXISTS `cols_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) DEFAULT NULL,
  `col_name` varchar(50) DEFAULT NULL,
  `type_input` varchar(50) DEFAULT NULL,
  `list_page` varchar(50) DEFAULT NULL,
  `add_page` varchar(50) DEFAULT NULL,
  `update_page` varchar(50) DEFAULT NULL,
  `view_page` varchar(50) DEFAULT NULL,
  `delete_page` varchar(50) DEFAULT NULL,
  `search_text` varchar(50) DEFAULT NULL,
  `col_set` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.cols_set: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `cols_set` DISABLE KEYS */;
INSERT INTO `cols_set` (`id`, `table_name`, `col_name`, `type_input`, `list_page`, `add_page`, `update_page`, `view_page`, `delete_page`, `search_text`, `col_set`) VALUES
	(1, 'empresa', 'idEmp', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(2, 'empresa', 'empresa', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(3, 'empresa', 'ruc', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(4, 'empresa', 'direccion', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(5, 'empresa', 'idEmp', '1', 'list', ' ', ' ', ' ', ' ', ' ', NULL),
	(6, 'empresa', 'empresa', '1', ' ', 'add', ' ', ' ', ' ', ' ', NULL),
	(7, 'empresa', 'ruc', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(8, 'empresa', 'direccion', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(9, 'empresa', 'idEmp', '1', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(10, 'empresa', 'empresa', '2', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(11, 'empresa', 'ruc', '7', ' ', ' ', ' ', ' ', ' ', ' ', NULL),
	(12, 'empresa', 'direccion', '1', 'list', 'add', 'update', 'view', 'delete', 'search', NULL);
/*!40000 ALTER TABLE `cols_set` ENABLE KEYS */;

-- Volcando estructura para tabla granja.cuentas
DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `idCnt` int(11) NOT NULL AUTO_INCREMENT,
  `cuentas` varchar(50) NOT NULL,
  PRIMARY KEY (`idCnt`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.cuentas: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` (`idCnt`, `cuentas`) VALUES
	(1, 'HAYA S.A.C.'),
	(2, 'GRANJA DE ORO'),
	(3, 'CERRO BLANCO'),
	(4, 'EFECTIVO'),
	(5, 'TRANSFERENCIA');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;

-- Volcando estructura para tabla granja.cuentas_banco
DROP TABLE IF EXISTS `cuentas_banco`;
CREATE TABLE IF NOT EXISTS `cuentas_banco` (
  `idCbnc` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL,
  `tipo_financiera_id` int(11) NOT NULL,
  `banco_financiera_id` int(11) NOT NULL,
  `tipo_cuenta` enum('Ahorros','Cta Corriente') NOT NULL,
  `numero_cuenta` varchar(150) NOT NULL,
  `tipo_tarjeta` enum('Credito','Debito') NOT NULL,
  `numero_tarjeta` varchar(150) NOT NULL,
  PRIMARY KEY (`idCbnc`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.cuentas_banco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentas_banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas_banco` ENABLE KEYS */;

-- Volcando estructura para tabla granja.empresa
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `idEmp` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(50) NOT NULL,
  `ruc` char(50) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`idEmp`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.empresa: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idEmp`, `empresa`, `ruc`, `direccion`) VALUES
	(1, 'HAYA S.A.C.', '20543709388', ''),
	(2, 'GRANJA DE ORO', '20602513514', ''),
	(3, 'CERRO BLANCO', '20602513531', '');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Volcando estructura para tabla granja.entidades_financieras
DROP TABLE IF EXISTS `entidades_financieras`;
CREATE TABLE IF NOT EXISTS `entidades_financieras` (
  `idEnfc` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_financiera_id` int(11) NOT NULL,
  `nombre_entidad` varchar(150)  NOT NULL,
  `pagina_web` varchar(250)  NOT NULL,
  PRIMARY KEY (`idEnfc`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.entidades_financieras: ~59 rows (aproximadamente)
/*!40000 ALTER TABLE `entidades_financieras` DISABLE KEYS */;
INSERT INTO `entidades_financieras` (`idEnfc`, `tipo_financiera_id`, `nombre_entidad`, `pagina_web`) VALUES
	(1, 1, 'Banco de Comercio', 'http://www.bancomercio.com.pe/'),
	(2, 1, 'Banco de Crédito del Perú', 'http://www.viabcp.com/'),
	(3, 1, 'Banco Interamericano de Finanzas (BanBif)', 'https://www.banbif.com.pe/Personas'),
	(4, 1, 'Banco Pichincha', 'https://www.pichincha.pe/'),
	(5, 1, 'BBVA', 'https://www.bbva.pe/'),
	(6, 1, 'Citibank Perú', 'http://www.citibank.com.pe/'),
	(7, 1, 'Interbank', 'http://www.interbank.com.pe/'),
	(8, 1, 'MiBanco', 'https://www.mibanco.com.pe/'),
	(9, 1, 'Scotiabank Perú', 'http://www.scotiabank.com.pe/'),
	(10, 1, 'Banco GNB Perú', 'http://www.bancognb.com.pe/'),
	(11, 1, 'Banco Falabella', 'http://www.bancofalabella.com.pe/'),
	(12, 1, 'Banco Ripley ', 'http://www.bancoripley.com.pe/'),
	(13, 1, 'Banco Santander Perú', 'http://www.santander.com.pe/'),
	(14, 1, 'Banco Azteca', 'http://www.bancoazteca.com.pe/'),
	(15, 1, 'CRAC CAT Perú', 'https://momentosbancocencosud.pe'),
	(16, 1, 'ICBC PERU BANK', 'http://www.icbc.com.cn/ICBC/%E6%B5%B7%E5%A4%96%E5%88%86%E8%A1%8C/%E5%B7%A5%E9%93%B6%E7%A7%98%E9%B2%81%E7%BD%91%E7%AB%99/es/'),
	(17, 2, 'Agrobanco', 'http://www.agrobanco.com.pe/'),
	(18, 2, 'Banco de la Nación', 'http://www.bn.com.pe/'),
	(19, 2, 'COFIDE', 'http://www.cofide.com.pe/'),
	(20, 2, 'Fondo MiVivienda', 'http://www.mivivienda.com.pe/'),
	(21, 3, 'Amérika', 'http://www.amerikaf.pe/'),
	(22, 3, 'Crediscotia', 'http://www.crediscotia.com.pe/'),
	(23, 3, 'Confianza', 'https://www.confianza.pe/'),
	(24, 3, 'Compartamos', 'http://www.compartamos.com.pe/'),
	(25, 3, 'Credinka', 'https://www.credinka.com/#Index'),
	(26, 3, 'Efectiva', 'http://www.efectiva.com.pe/'),
	(27, 3, 'Proempresa', 'http://www.proempresa.com.pe'),
	(28, 3, 'Mitsui Auto Finance', 'http://mafperu.com/'),
	(29, 3, 'Oh!', 'http://www.tarjetaoh.com.pe/'),
	(30, 3, 'Qapaq', 'http://www.qapaq.pe/'),
	(31, 3, 'TFC', 'http://www.tfc.com.pe'),
	(32, 4, 'Arequipa', 'https://www.cajaarequipa.pe/'),
	(33, 4, 'Cusco', 'http://www.cmac-cusco.com.pe/'),
	(34, 4, 'Del Santa', 'http://www.cajadelsanta.pe/'),
	(35, 4, 'Trujillo', 'http://www.cajatrujillo.com.pe'),
	(36, 4, 'Huancayo', 'https://www.cajahuancayo.com.pe/'),
	(37, 4, 'Ica', 'http://www.cmacica.com.pe/'),
	(38, 4, 'Maynas', 'http://www.cmacmaynas.com.pe'),
	(39, 4, 'Paita', 'http://www.cmac-paita.com.pe/'),
	(40, 4, 'Piura', 'http://www.cmacpiura.com.pe/'),
	(41, 4, 'Sullana', 'http://www.cajasullana.pe/'),
	(42, 4, 'Tacna', 'http://www.cmactacna.com.pe/'),
	(43, 5, 'Caja Metropolitana de Lima', 'http://www.cajametropolitana.com.pe/'),
	(44, 6, 'Incasur', 'http://www.cajaincasur.com.pe'),
	(45, 6, 'Los Andes', 'http://www.cajarurallosandes.com'),
	(46, 6, 'Prymera', 'http://www.prymera.com.pe'),
	(47, 6, 'Sipán ', 'http://www.cajasipan.com.pe'),
	(48, 6, 'Del Centro', 'http://www.cajacentro.com.pe'),
	(49, 6, 'Raíz', 'http://raiz.com.pe'),
	(50, 7, 'Acceso Crediticio', 'https://acceso.com.pe'),
	(51, 7, 'Alternativa ', 'http://www.alternativa.com.pe'),
	(52, 7, 'BBVA Consumer Finance', 'http://www.bbvaconsumerfinance.com.pe'),
	(53, 7, 'Credivisión', 'http://mail.credivisionperu.com.pe'),
	(54, 7, 'Inversiones La Cruz', 'http://www.inversioneslacruz.com'),
	(55, 7, 'Mi Casita', 'http://www.micasita.com.pe'),
	(56, 7, 'Progreso', 'http://marcimex.com.pe'),
	(57, 7, 'GMG Servicios Perú', 'http://www.edpymegmg.com'),
	(58, 7, 'Santander Consumer Perú', 'http://www.santanderconsumer.com.pe'),
	(59, 8, 'J.P. Morgan Banco de Inversión', 'https://www.jpmorgan.com/country/pe/es/jpmorgan');
/*!40000 ALTER TABLE `entidades_financieras` ENABLE KEYS */;

-- Volcando estructura para tabla granja.fecha_laboral
DROP TABLE IF EXISTS `fecha_laboral`;
CREATE TABLE IF NOT EXISTS `fecha_laboral` (
  `idLbr` int(11) NOT NULL AUTO_INCREMENT,
  `granja_id` int(11) NOT NULL DEFAULT '0',
  `personal_id` int(11) NOT NULL DEFAULT '0',
  `desde` date NOT NULL,
  `al` date NOT NULL,
  `d1` tinyint(1) NOT NULL DEFAULT '0',
  `d2` tinyint(1) NOT NULL DEFAULT '0',
  `d3` tinyint(1) NOT NULL DEFAULT '0',
  `d4` tinyint(1) NOT NULL DEFAULT '0',
  `d5` tinyint(1) NOT NULL DEFAULT '0',
  `d6` tinyint(1) NOT NULL DEFAULT '0',
  `d7` tinyint(1) NOT NULL DEFAULT '0',
  `d8` tinyint(1) NOT NULL DEFAULT '0',
  `d9` tinyint(1) NOT NULL DEFAULT '0',
  `d10` tinyint(1) NOT NULL DEFAULT '0',
  `d11` tinyint(1) NOT NULL DEFAULT '0',
  `d12` tinyint(1) NOT NULL DEFAULT '0',
  `d13` tinyint(1) NOT NULL DEFAULT '0',
  `d14` tinyint(1) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `salario` decimal(11,2) NOT NULL DEFAULT '0.00',
  `comedor` decimal(11,2) NOT NULL DEFAULT '0.00',
  `horas_extra` decimal(11,2) NOT NULL DEFAULT '0.00',
  `monto_neto` decimal(11,2) NOT NULL DEFAULT '0.00',
  `despacho` decimal(11,2) NOT NULL DEFAULT '0.00',
  `pago_total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `actualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLbr`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.fecha_laboral: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fecha_laboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `fecha_laboral` ENABLE KEYS */;

-- Volcando estructura para tabla granja.granjas
DROP TABLE IF EXISTS `granjas`;
CREATE TABLE IF NOT EXISTS `granjas` (
  `idGrnj` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_granja` varchar(150) NOT NULL,
  `numero_galpones` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`idGrnj`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.granjas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `granjas` DISABLE KEYS */;
INSERT INTO `granjas` (`idGrnj`, `nombre_granja`, `numero_galpones`, `empresa_id`) VALUES
	(1, 'Contreras', 0, 1),
	(2, 'Contreras 1', 10, 1),
	(3, 'Contreras 2', 0, 0),
	(4, 'Contreras 3', 0, 2),
	(5, 'Contreras 4', 0, 3);
/*!40000 ALTER TABLE `granjas` ENABLE KEYS */;

-- Volcando estructura para tabla granja.granjas_uggroups
DROP TABLE IF EXISTS `granjas_uggroups`;
CREATE TABLE IF NOT EXISTS `granjas_uggroups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.granjas_uggroups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `granjas_uggroups` DISABLE KEYS */;
INSERT INTO `granjas_uggroups` (`GroupID`, `Label`) VALUES
	(1, 'Supervisor');
/*!40000 ALTER TABLE `granjas_uggroups` ENABLE KEYS */;

-- Volcando estructura para tabla granja.granjas_ugmembers
DROP TABLE IF EXISTS `granjas_ugmembers`;
CREATE TABLE IF NOT EXISTS `granjas_ugmembers` (
  `UserName` varchar(300) NOT NULL,
  `GroupID` int(11) NOT NULL,
  PRIMARY KEY (`UserName`(50),`GroupID`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.granjas_ugmembers: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `granjas_ugmembers` DISABLE KEYS */;
INSERT INTO `granjas_ugmembers` (`UserName`, `GroupID`) VALUES
	('admin', -1),
	('carmen', -1),
	('jorge', -1),
	('perci', 1);
/*!40000 ALTER TABLE `granjas_ugmembers` ENABLE KEYS */;

-- Volcando estructura para tabla granja.granjas_ugrights
DROP TABLE IF EXISTS `granjas_ugrights`;
CREATE TABLE IF NOT EXISTS `granjas_ugrights` (
  `TableName` varchar(300) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `AccessMask` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TableName`(50),`GroupID`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.granjas_ugrights: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `granjas_ugrights` DISABLE KEYS */;
INSERT INTO `granjas_ugrights` (`TableName`, `GroupID`, `AccessMask`) VALUES
	('almacen', -1, 'ADESPIM'),
	('almacen', 1, 'AESPI'),
	('cargos', -1, 'DEM'),
	('cuentas', -1, 'AEDSPI'),
	('cuentas_banco', -1, 'AEDSPI'),
	('empresa', -1, 'AEDSPI'),
	('fecha_laboral', -1, 'AEDSPI'),
	('granjas', -1, 'ADESPIM'),
	('ingresos', -1, 'AEDSPI'),
	('inventario', -1, 'AEDSPI'),
	('pagos_personal', -1, 'SP'),
	('personal', -1, 'ADESPIM'),
	('personal_granjas', -1, 'AEDSPI'),
	('planilla', -1, 'ASPI'),
	('proveedores', -1, 'AEDSPI'),
	('proveedores', 1, 'AESPI'),
	('salidas', -1, 'AEDSPI'),
	('usuarios', -1, 'ADESPIM');
/*!40000 ALTER TABLE `granjas_ugrights` ENABLE KEYS */;

-- Volcando estructura para tabla granja.ingresos
DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `idIgr` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` date NOT NULL,
  `cantidad` decimal(11,2) NOT NULL DEFAULT '0.00',
  `cuenta_id` int(11) NOT NULL,
  `observaciones` varchar(50) NOT NULL,
  `actualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idIgr`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.ingresos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;

-- Volcando estructura para tabla granja.inventario
DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `idInv` int(11) NOT NULL AUTO_INCREMENT,
  `granja` int(11) NOT NULL DEFAULT '0',
  `area` int(11) NOT NULL DEFAULT '0',
  `panel` int(11) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `unidad` enum('Unidad','Caja','Kilo','Rollo','Metro','Litro','Galon') NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `observacion` varchar(150) NOT NULL,
  PRIMARY KEY (`idInv`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.inventario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;

-- Volcando estructura para tabla granja.personal
DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `idPrsn` int(11) NOT NULL AUTO_INCREMENT,
  `granja_id` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50)  NOT NULL DEFAULT '0',
  `apellido` varchar(50)  NOT NULL DEFAULT '0',
  `edad` int(11) NOT NULL DEFAULT '0',
  `cumpleanos` date NOT NULL,
  `dni` char(20)  NOT NULL DEFAULT '0',
  `imagen` varchar(150)  NOT NULL,
  `telefono` int(11) NOT NULL DEFAULT '0',
  `tipo_pago` enum('Efectivo','CTA bancaria','Otra CTA')  NOT NULL,
  `tipo_financiera_id` int(11) NOT NULL,
  `banco_financiera_id` int(11) NOT NULL,
  `numero_cuenta` varchar(50)  NOT NULL DEFAULT '0',
  `otra_cuenta` varchar(50)  NOT NULL DEFAULT '0',
  `cargo_id` int(11) NOT NULL DEFAULT '0',
  `salario` decimal(11,2) NOT NULL DEFAULT '0.00',
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPrsn`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.personal: ~49 rows (aproximadamente)
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` (`idPrsn`, `granja_id`, `nombre`, `apellido`, `edad`, `cumpleanos`, `dni`, `imagen`, `telefono`, `tipo_pago`, `tipo_financiera_id`, `banco_financiera_id`, `numero_cuenta`, `otra_cuenta`, `cargo_id`, `salario`, `creado`) VALUES
	(1, 1, 'PERCY CLODOALDO', 'GOMEZ EUFRACIO', 0, '0000-00-00', '40923805', '', 0, '', 0, 0, '151-3131040078', '', 0, 1400.00, '2019-08-02 18:04:52'),
	(2, 1, 'VALENTIN ', 'GOMEZ CISNEROS', 0, '0000-00-00', '', '', 0, '', 0, 0, '', '', 0, 0.00, '2019-08-02 18:04:52'),
	(3, 1, 'MAURA ', 'MARTINEZ YANE', 0, '0000-00-00', '15292735', '', 0, '', 0, 0, '191-94223298046', '', 0, 620.00, '2019-08-02 18:04:52'),
	(4, 1, 'SEBASTIAN ', 'GONSALEZ CURO', 0, '0000-00-00', '47366107', '', 0, '', 0, 0, '', '', 0, 490.00, '2019-08-02 18:04:52'),
	(5, 2, 'LUCIO', 'ESCALANTE GUILLEN', 0, '0000-00-00', '31186718', '', 0, '', 0, 0, '151-31309883424', '', 0, 860.00, '2019-08-02 18:04:52'),
	(6, 2, 'LUCIO ', 'GOMEZ ARRIETA', 0, '0000-00-00', '9552421', '', 0, '', 0, 0, '', '', 0, 820.00, '2019-08-02 18:04:52'),
	(7, 2, 'NICOLAS ELIAS', 'ACUÑA GARCIA', 0, '0000-00-00', '15292079', '', 0, '', 0, 0, '151-3130989996', '', 0, 780.00, '2019-08-02 18:04:52'),
	(8, 2, 'NIVARDO', 'OCHOA GUINTANILLA', 0, '0000-00-00', '43635874', '', 0, '', 0, 0, '151-3130990005', '', 0, 790.00, '2019-08-02 18:04:52'),
	(9, 2, 'ORESTES AQUILINO', 'RAMIREZ TARAZONA', 0, '0000-00-00', '46926787', '', 0, '', 0, 0, '151-3130990013', '', 0, 790.00, '2019-08-02 18:04:52'),
	(10, 2, 'ALEXANDER ', 'ESCALANTE', 0, '0000-00-00', '76159196', '', 0, '', 0, 0, '151-3130990021', '', 0, 780.00, '2019-08-02 18:04:52'),
	(11, 2, 'WILFREDO ', 'PEREZ SAAVEDRA', 0, '0000-00-00', '6772680', '', 0, '', 0, 0, '151-3130989953', '', 0, 780.00, '2019-08-02 18:04:52'),
	(12, 2, 'JHONATAN ', 'MARTINEZ GALINDO', 0, '0000-00-00', '47260605', '', 0, '', 0, 0, '898-3131205416', '', 0, 790.00, '2019-08-02 18:04:52'),
	(13, 2, 'JOEL VIVIANO', 'GUARDIAN ROCA', 0, '0000-00-00', '73088534', '', 0, '', 0, 0, '151-3130989970', '', 0, 780.00, '2019-08-02 18:04:52'),
	(14, 2, 'YONY ', 'GALINDO MARTINEZ', 0, '0000-00-00', '74472750', '', 0, '', 0, 0, '151-3132628990', '', 0, 700.00, '2019-08-02 18:04:52'),
	(15, 2, 'ADRIAN ', 'RAMIREZ LOPEZ', 0, '0000-00-00', '32605514', '', 0, '', 0, 0, '151-3130989961', '', 0, 600.00, '2019-08-02 18:04:52'),
	(16, 2, 'AQUILES ', 'HUAMAN MONTALVAN', 0, '0000-00-00', '42825652', '', 0, '', 0, 0, '242-3132541928', '', 0, 600.00, '2019-08-02 18:04:52'),
	(17, 2, 'WILSON JHON', 'RAMOS RIVAS', 0, '0000-00-00', '46374746', '', 0, '', 0, 0, '151-3130990757', '', 0, 780.00, '2019-08-02 18:04:52'),
	(18, 4, 'JOHNY IVAN', 'GOMEZ EUFRACIO', 0, '0000-00-00', '44019526', '', 0, 'CTA bancaria', 0, 0, '151-3130983238', '', 2, 920.00, '2019-08-02 18:27:47'),
	(19, 4, 'ROEL ', 'ROJAS LUNA', 0, '0000-00-00', '77415898', '', 0, 'CTA bancaria', 0, 0, '151-3130983270', '', 3, 840.00, '2019-08-03 21:47:13'),
	(20, 4, 'GIANCARLO', 'ARANA SERRUCHE', 0, '0000-00-00', '48434710', '', 0, '', 0, 0, '151-3130983319', '', 0, 790.00, '2019-08-02 18:04:52'),
	(21, 4, 'LENER ', 'ARANA SERRUCHE', 0, '0000-00-00', '45649721', '', 0, '', 0, 0, '151-3130983289', '', 0, 790.00, '2019-08-02 18:04:52'),
	(22, 4, 'CASTRO ABANTO ', 'JUAN', 0, '0000-00-00', '6914098', '', 0, '', 0, 0, '191-24017479-0-78', '', 0, 790.00, '2019-08-02 18:04:52'),
	(23, 4, 'HEBERTH ', 'SOSA MESA', 0, '0000-00-00', '43829987', '', 0, '', 0, 0, '151-3131040132', '', 0, 790.00, '2019-08-02 18:04:52'),
	(24, 4, 'ORLANDO ', 'SOSA MEZA', 0, '0000-00-00', 'O4212314', '', 0, '', 0, 0, '242-3133929938', '', 0, 790.00, '2019-08-02 18:04:52'),
	(25, 4, 'ANGEL ', 'SOSA COLLASO', 0, '0000-00-00', '71634045', '', 0, '', 0, 0, '151-3130983378', '', 0, 790.00, '2019-08-02 18:04:52'),
	(26, 4, 'JUAN MANUEL ', 'ARANA SERRUCHE', 0, '0000-00-00', '41114482', '', 0, '', 0, 0, 'CTA INTERBANK', '', 0, 790.00, '2019-08-02 18:04:52'),
	(27, 4, 'JHOEL', 'KIRINO VALLES', 0, '0000-00-00', '76192860', '', 0, '', 0, 0, '161-3136107888', '', 0, 790.00, '2019-08-02 18:04:52'),
	(28, 4, 'WALTER ', 'TORRES HEREDIA', 0, '0000-00-00', '48844900', '', 0, '', 0, 0, '242-3133397901', '', 0, 790.00, '2019-08-02 18:04:52'),
	(29, 4, 'ALEJANDRO ', 'MATA VIÑA', 0, '0000-00-00', '255575595', '', 0, 'Efectivo', 0, 0, '', '', 0, 790.00, '2019-08-02 18:04:52'),
	(30, 4, 'ELADIO ', 'NUÑES SALAZAR', 0, '0000-00-00', '44216031', '', 0, '', 0, 0, '', 'CTA DE ADRIANO', 0, 790.00, '2019-08-02 18:04:52'),
	(31, 4, 'ELVER', 'MARQUEZ PARIATON', 0, '0000-00-00', '44125951', '', 0, '', 0, 0, '', 'CTA DE JUAN MANUEL', 0, 790.00, '2019-08-02 18:04:52'),
	(32, 4, 'RODOLFO ', 'MAVAVE', 0, '0000-00-00', '26643965', '', 0, 'Efectivo', 0, 0, '', '', 0, 600.00, '2019-08-02 18:04:52'),
	(33, 4, 'ALEXANDE ', 'GOMEZ MAURICIO', 0, '0000-00-00', '', '', 0, '', 0, 0, '', 'CTA DE LUCIO', 0, 600.00, '2019-08-02 18:04:52'),
	(34, 4, 'WENINGER', 'ANGULO ROJAS', 0, '0000-00-00', '74652405', '', 0, 'Efectivo', 0, 0, '', '', 0, 600.00, '2019-08-02 18:04:52'),
	(35, 4, 'LUISA SANDRA', 'ELESCAS ROMERO', 0, '0000-00-00', '48172134', '', 0, 'Efectivo', 0, 0, '', '', 0, 600.00, '2019-08-02 18:04:52'),
	(36, 5, 'EDWIN ', 'ROJAS LUNA', 0, '0000-00-00', '47128092', '', 0, '', 0, 0, '151-31309888370', '', 0, 860.00, '2019-08-02 18:04:52'),
	(37, 5, 'WILIBALDO ', 'MORALES GOMEZ', 0, '0000-00-00', '40291677', '', 0, 'Efectivo', 0, 0, '', '', 0, 820.00, '2019-08-02 18:04:52'),
	(38, 5, 'GREGORIO ', 'SARABIA SIPRIANO', 0, '0000-00-00', '45757260', '', 0, '', 0, 0, '151-3130989937', '', 0, 790.00, '2019-08-02 18:04:52'),
	(39, 5, 'CRISTHIAN ', 'ROMERO CARBAJAL', 0, '0000-00-00', '70842349', '', 0, '', 0, 0, '151-3130989929', '', 0, 790.00, '2019-08-02 18:04:52'),
	(40, 5, 'ELICEO ', 'AGUIRRE ROJAS', 0, '0000-00-00', '47891765', '', 0, '', 0, 0, '242-3136156450', '', 0, 790.00, '2019-08-02 18:04:52'),
	(41, 5, 'IGNACIO', 'JHIRO NESTARES', 0, '0000-00-00', '', '', 0, '', 0, 0, '', 'cta de edwin', 0, 600.00, '2019-08-02 18:04:52'),
	(42, 5, 'NEICER ', 'TORRES HEREDIA', 0, '0000-00-00', '47366107', '', 0, '', 0, 0, '191-94235228047', '', 0, 790.00, '2019-08-02 18:04:52'),
	(43, 5, 'NOLASCO', 'CHILCON DIAZ', 0, '0000-00-00', '47917955', '', 0, '', 0, 0, '', '', 0, 700.00, '2019-08-02 18:04:52'),
	(44, 5, 'ADRIANO ', 'NUÑEZ SALAZAR', 0, '0000-00-00', '45989983', '', 0, '', 0, 0, '191-92200047059', '', 0, 790.00, '2019-08-02 18:04:52'),
	(45, 5, 'ELMER ', 'GONSALEZ CURO', 0, '0000-00-00', '10216316', '', 0, '', 0, 0, '', '', 0, 790.00, '2019-08-02 18:04:52'),
	(46, 5, 'JUAN', 'BELACRUZ VARGAS', 0, '0000-00-00', '72615807', '', 0, '', 0, 0, '', '', 0, 790.00, '2019-08-02 18:04:52'),
	(47, 5, 'ELVIO ', 'FLORES CHECCLLO', 0, '0000-00-00', '71821672', '', 0, '', 0, 0, '151-3130989910', '', 0, 790.00, '2019-08-02 18:04:52'),
	(48, 5, 'MIGUEL ', 'VILLAREYES NIEVES', 0, '0000-00-00', 'O6823192', '', 0, '', 0, 0, '', '', 0, 700.00, '2019-08-02 18:04:52'),
	(49, 5, 'ELIO ELIESER ', 'BERNAL ARAGOZA', 0, '0000-00-00', '25064285', '', 0, 'Efectivo', 0, 0, '', '', 0, 600.00, '2019-08-02 18:04:52');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

-- Volcando estructura para tabla granja.personal_granjas
DROP TABLE IF EXISTS `personal_granjas`;
CREATE TABLE IF NOT EXISTS `personal_granjas` (
  `idPgj` int(11) NOT NULL AUTO_INCREMENT,
  `granja_id` int(11) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idPgj`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.personal_granjas: ~49 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_granjas` DISABLE KEYS */;
INSERT INTO `personal_granjas` (`idPgj`, `granja_id`, `personal_id`, `observacion`) VALUES
	(1, 4, 1, ''),
	(2, 4, 2, NULL),
	(3, 4, 3, NULL),
	(4, 4, 4, NULL),
	(5, 4, 5, NULL),
	(6, 4, 6, NULL),
	(7, 4, 7, NULL),
	(8, 4, 8, NULL),
	(9, 4, 9, NULL),
	(10, 4, 10, NULL),
	(11, 4, 11, NULL),
	(12, 4, 12, NULL),
	(13, 4, 13, NULL),
	(14, 4, 14, NULL),
	(15, 4, 15, NULL),
	(16, 4, 16, NULL),
	(17, 4, 17, NULL),
	(18, 4, 18, NULL),
	(19, 2, 19, NULL),
	(20, 2, 20, NULL),
	(21, 2, 21, NULL),
	(22, 2, 22, NULL),
	(23, 2, 23, NULL),
	(24, 2, 24, NULL),
	(25, 2, 25, NULL),
	(26, 2, 26, NULL),
	(27, 2, 27, NULL),
	(28, 2, 28, NULL),
	(29, 2, 29, NULL),
	(30, 2, 30, NULL),
	(31, 2, 31, NULL),
	(32, 5, 32, NULL),
	(33, 5, 33, NULL),
	(34, 5, 34, NULL),
	(35, 5, 35, NULL),
	(36, 5, 36, NULL),
	(37, 5, 37, NULL),
	(38, 5, 38, NULL),
	(39, 5, 39, NULL),
	(40, 5, 40, NULL),
	(41, 5, 41, NULL),
	(42, 5, 42, NULL),
	(43, 5, 43, NULL),
	(44, 5, 44, NULL),
	(45, 5, 45, NULL),
	(46, 1, 46, NULL),
	(47, 1, 47, NULL),
	(48, 1, 48, NULL),
	(49, 1, 49, NULL);
/*!40000 ALTER TABLE `personal_granjas` ENABLE KEYS */;

-- Volcando estructura para tabla granja.proveedores
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `idPrv` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) DEFAULT NULL,
  `ruc` int(11) DEFAULT NULL,
  `rubro` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pagina_web` varchar(50) DEFAULT NULL,
  `nombre_contacto` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(50) DEFAULT NULL,
  `detalles` varchar(250) DEFAULT NULL,
  `comentarios` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idPrv`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.proveedores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para tabla granja.salidas
DROP TABLE IF EXISTS `salidas`;
CREATE TABLE IF NOT EXISTS `salidas` (
  `idSald` int(11) NOT NULL AUTO_INCREMENT,
  `ejecutivo` enum('Jorge','Wilbert') NOT NULL,
  `tipo_gasto` enum('Efectivo','Visa') NOT NULL,
  `fecha_salida` date NOT NULL,
  `gastos` enum('Granja','Personal') NOT NULL,
  `monto` decimal(11,2) NOT NULL DEFAULT '0.00',
  `observaciones` varchar(250) NOT NULL,
  `actualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idSald`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.salidas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;

-- Volcando estructura para tabla granja.table_config
DROP TABLE IF EXISTS `table_config`;
CREATE TABLE IF NOT EXISTS `table_config` (
  `tcon_Id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` text,
  PRIMARY KEY (`tcon_Id`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.table_config: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `table_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_config` ENABLE KEYS */;

-- Volcando estructura para tabla granja.table_queries
DROP TABLE IF EXISTS `table_queries`;
CREATE TABLE IF NOT EXISTS `table_queries` (
  `tque_Id` int(11) NOT NULL AUTO_INCREMENT,
  `name_table` varchar(50) DEFAULT NULL,
  `col_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `joins` varchar(50) DEFAULT NULL,
  `j_table` varchar(50) DEFAULT NULL,
  `j_id` varchar(50) DEFAULT NULL,
  `j_value` varchar(50) DEFAULT NULL,
  `j_as` varchar(50) DEFAULT NULL,
  `query` varchar(250) DEFAULT NULL,
  `jvpos` int(11) DEFAULT NULL,
  PRIMARY KEY (`tque_Id`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.table_queries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `table_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_queries` ENABLE KEYS */;

-- Volcando estructura para tabla granja.tipo_financiera
DROP TABLE IF EXISTS `tipo_financiera`;
CREATE TABLE IF NOT EXISTS `tipo_financiera` (
  `idFncr` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idFncr`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.tipo_financiera: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_financiera` DISABLE KEYS */;
INSERT INTO `tipo_financiera` (`idFncr`, `tipo`) VALUES
	(1, 'Empresas Bancarias'),
	(2, 'Entidades Financieras Estatales'),
	(3, 'Empresas Financieras'),
	(4, 'Cajas Municipales de Ahorro y Crédito (CMAC)'),
	(5, 'Cajas Municipales de Crédito y Popular (CMCP)'),
	(6, 'Cajas Rurales de Ahorro y Crédito (CRAC)'),
	(7, 'Edpymes'),
	(8, 'Bancos de Inversión');
/*!40000 ALTER TABLE `tipo_financiera` ENABLE KEYS */;

-- Volcando estructura para tabla granja.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsr` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `clave` char(50) NOT NULL,
  `nivel` enum('Super admin','Admin','Supervisor') NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsr`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB;

-- Volcando datos para la tabla granja.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`idUsr`, `usuario`, `clave`, `nivel`, `estado`, `creado`) VALUES
	(1, 'admin', 'truelove', 'Super admin', 'Activo', '2019-08-02 16:17:53'),
	(2, 'carmen', 'carmenchota', 'Admin', 'Activo', '2019-08-02 19:06:07'),
	(3, 'jorge', 'jorgito', 'Admin', 'Activo', '2019-08-02 19:06:23'),
	(4, 'perci', 'estepata', 'Supervisor', 'Activo', '2019-08-02 19:06:38');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
