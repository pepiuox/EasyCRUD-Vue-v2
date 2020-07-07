-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.6040
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla forever.cols_set
DROP TABLE IF EXISTS `cols_set`;
CREATE TABLE IF NOT EXISTS `cols_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `col_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `type_input` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `list_page` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `add_page` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_page` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `view_page` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `delete_page` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `search_text` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `col_set` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forever.grupos
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `idGrp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idGrp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forever.productos
DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idPro` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(50) NOT NULL,
  `unidad` char(50) NOT NULL,
  `capacidad` char(50) NOT NULL,
  `grupo` int(11) NOT NULL,
  `sub_grupo` int(11) NOT NULL,
  `producto` varchar(350) NOT NULL,
  `puntos` double(11,2) NOT NULL,
  `gerente` double(11,2) NOT NULL,
  `asistente_gerente` double(11,2) NOT NULL,
  `supevisor` double(11,2) NOT NULL,
  `asistente_supervisor` double(11,2) NOT NULL,
  `cliente_novus` double(11,2) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `detalle` varchar(250) NOT NULL,
  `uso_sugerido` varchar(500) NOT NULL,
  `contenido` varchar(500) NOT NULL,
  `ingredientes` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  PRIMARY KEY (`idPro`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forever.sub_grupos
DROP TABLE IF EXISTS `sub_grupos`;
CREATE TABLE IF NOT EXISTS `sub_grupos` (
  `idSug` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `nombre_sub_grupo` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forever.table_config
DROP TABLE IF EXISTS `table_config`;
CREATE TABLE IF NOT EXISTS `table_config` (
  `tcon_Id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`tcon_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla forever.table_queries
DROP TABLE IF EXISTS `table_queries`;
CREATE TABLE IF NOT EXISTS `table_queries` (
  `tque_Id` int(11) NOT NULL AUTO_INCREMENT,
  `name_table` varchar(50) DEFAULT NULL,
  `col_name` varchar(50) DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `input_type` int(11) DEFAULT NULL,
  `joins` varchar(50) DEFAULT NULL,
  `j_table` varchar(50) DEFAULT NULL,
  `j_id` varchar(50) DEFAULT NULL,
  `j_value` varchar(50) DEFAULT NULL,
  `j_as` varchar(50) DEFAULT NULL,
  `query` varchar(250) DEFAULT NULL,
  `jvpos` int(11) DEFAULT NULL,
  PRIMARY KEY (`tque_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
