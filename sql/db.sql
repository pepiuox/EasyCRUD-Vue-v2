-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.6053
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla forever.categorias
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCat` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_categoria` varchar(50) COLLATE utf8_bin NOT NULL,
  `img_categoria` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idCat`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.categorias: ~0 rows (aproximadamente)
DELETE FROM `categorias`;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla forever.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `RUC` char(11) COLLATE utf8_bin NOT NULL DEFAULT '',
  `DNI` char(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `apellido_paterno` varchar(50) COLLATE utf8_bin NOT NULL,
  `apellido_materno` varchar(50) COLLATE utf8_bin NOT NULL,
  `pais` varchar(50) COLLATE utf8_bin NOT NULL,
  `region_estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `provincia` varchar(50) COLLATE utf8_bin NOT NULL,
  `distrito` varchar(50) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(250) COLLATE utf8_bin NOT NULL,
  `referencia_direccion` varchar(250) COLLATE utf8_bin NOT NULL,
  `tipo_de_cliente` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono_1` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono_2` varchar(50) COLLATE utf8_bin NOT NULL,
  `fax` varchar(50) COLLATE utf8_bin NOT NULL,
  `celular` varchar(50) COLLATE utf8_bin NOT NULL,
  `web` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `moneda` varchar(50) COLLATE utf8_bin NOT NULL,
  `limite_de_credito` varchar(50) COLLATE utf8_bin NOT NULL,
  `condicion_de_pago` varchar(50) COLLATE utf8_bin NOT NULL,
  `vendedor` varchar(50) COLLATE utf8_bin NOT NULL,
  `zona` varchar(50) COLLATE utf8_bin NOT NULL,
  `afecta_retencion` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idClient`) USING BTREE,
  UNIQUE KEY `DNI` (`DNI`) USING BTREE,
  UNIQUE KEY `usuario` (`usuario`) USING BTREE,
  UNIQUE KEY `RUC` (`RUC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.clientes: ~0 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla forever.cliente_contacto
DROP TABLE IF EXISTS `cliente_contacto`;
CREATE TABLE IF NOT EXISTS `cliente_contacto` (
  `idContact` int(11) NOT NULL AUTO_INCREMENT,
  `RUC` char(11) COLLATE utf8_bin NOT NULL DEFAULT '',
  `razon_social` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `apellido_paterno` varchar(50) COLLATE utf8_bin NOT NULL,
  `apellido_materno` varchar(50) COLLATE utf8_bin NOT NULL,
  `DNI` char(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cargo` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) COLLATE utf8_bin NOT NULL,
  `area` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idContact`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.cliente_contacto: ~0 rows (aproximadamente)
DELETE FROM `cliente_contacto`;
/*!40000 ALTER TABLE `cliente_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contacto` ENABLE KEYS */;

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

-- Volcando datos para la tabla forever.cols_set: ~0 rows (aproximadamente)
DELETE FROM `cols_set`;
/*!40000 ALTER TABLE `cols_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `cols_set` ENABLE KEYS */;

-- Volcando estructura para tabla forever.descuentos
DROP TABLE IF EXISTS `descuentos`;
CREATE TABLE IF NOT EXISTS `descuentos` (
  `idDesc` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idDesc`) USING BTREE,
  UNIQUE KEY `producto_id` (`producto_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.descuentos: ~0 rows (aproximadamente)
DELETE FROM `descuentos`;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;

-- Volcando estructura para tabla forever.entrada_almacen
DROP TABLE IF EXISTS `entrada_almacen`;
CREATE TABLE IF NOT EXISTS `entrada_almacen` (
  `idEAlm` int(11) NOT NULL AUTO_INCREMENT,
  `nro_entrada` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nro_orden` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `doc_ref` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `numero_doc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `almacen` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tipo_movimiento` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cliente_proveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idEAlm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.entrada_almacen: ~0 rows (aproximadamente)
DELETE FROM `entrada_almacen`;
/*!40000 ALTER TABLE `entrada_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_almacen` ENABLE KEYS */;

-- Volcando estructura para tabla forever.familias
DROP TABLE IF EXISTS `familias`;
CREATE TABLE IF NOT EXISTS `familias` (
  `idFam` int(11) NOT NULL AUTO_INCREMENT,
  `familia` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idFam`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.familias: ~0 rows (aproximadamente)
DELETE FROM `familias`;
/*!40000 ALTER TABLE `familias` DISABLE KEYS */;
/*!40000 ALTER TABLE `familias` ENABLE KEYS */;

-- Volcando estructura para tabla forever.grupos
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `idGrp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idGrp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.grupos: ~4 rows (aproximadamente)
DELETE FROM `grupos`;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` (`idGrp`, `nombre_grupo`) VALUES
	(1, 'Complememtos nutricionales'),
	(2, 'Cuidado de cutis'),
	(3, 'Cuidado de la piel'),
	(4, 'Aseo y cuidado personal');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;

-- Volcando estructura para tabla forever.img_productos
DROP TABLE IF EXISTS `img_productos`;
CREATE TABLE IF NOT EXISTS `img_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `imagen_producto` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla forever.img_productos: ~0 rows (aproximadamente)
DELETE FROM `img_productos`;
/*!40000 ALTER TABLE `img_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `img_productos` ENABLE KEYS */;

-- Volcando estructura para tabla forever.marcas
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `idMarc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` char(50) COLLATE utf8_bin NOT NULL,
  `familia_producto` char(50) COLLATE utf8_bin NOT NULL,
  `logo_marca` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idMarc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.marcas: ~0 rows (aproximadamente)
DELETE FROM `marcas`;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;

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
  `puntos` double(11,3) NOT NULL,
  `gerente` double(11,2) NOT NULL,
  `asistente_gerente` double(11,2) NOT NULL,
  `supevisor` double(11,2) NOT NULL,
  `asistente_supervisor` double(11,2) NOT NULL,
  `cliente_novus` double(11,2) NOT NULL,
  `precio_publico` double(11,2) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `detalle` text NOT NULL DEFAULT '',
  `uso_sugerido` varchar(500) NOT NULL,
  `contenido` varchar(500) NOT NULL,
  `ingredientes` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  PRIMARY KEY (`idPro`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla forever.productos: ~23 rows (aproximadamente)
DELETE FROM `productos`;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`idPro`, `codigo`, `unidad`, `capacidad`, `grupo`, `sub_grupo`, `producto`, `puntos`, `gerente`, `asistente_gerente`, `supevisor`, `asistente_supervisor`, `cliente_novus`, `precio_publico`, `descripcion`, `detalle`, `uso_sugerido`, `contenido`, `ingredientes`, `imagen`) VALUES
	(1, '217-230', '', '', 1, 1, 'Clean 9', 0.591, 300.72, 329.66, 358.60, 375.95, 491.94, 0.00, '¡Logra  tu Peso Ideal con este Fabuloso  Kit!', ' Ayuda a que desintoxiques  tu cuerpo,  quemes  grasas acumuladas, elimines  el colesterol malo, sin disminuir tu masa muscular ni afectar  tu salud, con la GARCINIA  CAMBOGIA, ALOE VERA y los mejores productos  naturales para que te veas bien y te s', 'Sigue al pie de la letra las indicaciones que vienen adjuntas en un folleto.', 'Este programa consta de seis  productos: 3  Botellas de Jugo de ALOE VERA GEL Puro, de 1 Litro cada uno; 70 cápsulas de FOREVER GARCINIA, 100 tabletas de  Forever Bee Pollen y 1 Bolsa de  FOREVER  LITE ULTRA (batido) totalmente sincronizados para que logres tu objetivo principal que es controlar tu peso. Además recibes un TOMATODO y una linda caja donde puedes exhibir tus productos. ', '', ''),
	(4, '617', '1 tubo', '4 oz. líq. (118ml)', 0, 0, 'Aloe  Sunscreen  Lotion', 0.083, 42.24, 46.30, 50.33, 52.77, 69.05, 81.26, 'Ayuda a Aliviar, Hidratar y Proteger  Tu  Piel.', 'Alivia, lubrica, humecta y protege tu  piel contra la luz solar y el viento. Humecta tu  piel para prolongar el bronceado.  Protección de doble acción para después de asolearse. Suave y segura para ser usada también  por niños.  Mantiene el balance n', 'Aplique generosamente a todas las áreas expuestas 15 a 30 minutos antes de asolearse. Vuelva a aplicar cuando sienta la piel reseca o dentro de 40 minutos después de cualquier actividad acuática.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Salicilato Butiloctil, Triglicérido Caprílico/Cáprico, Glicerina, Olivato de Cetearilo, Olivato de Sorbitano, Cloruro de Sodio, Alcohol Cetil, Estearato Gliceril, Isostearato Poligliceril-4, Dimeticona Cetil PEG/PPG-10/1, Laurato Hexil, Dimeticona Cetil, Fenoxietanol, Estearato PEG-75, Trietanolamina, Goma Xantan, Cetil Éter20, Estearil Éter-20, Acetato de Tocoferil, Fragancia (Parfum), Metilisotiazolinona.', ''),
	(6, '63', '1 tubo', '4 oz. líq. (118ml)', 0, 0, 'Aloe Moisturizing Lotion', 0.056, 28.49, 31.23, 33.97, 35.63, 46.59, 53.79, 'Poderoso Humectante e Hidratante Para Tu  Rostro y  Tu  Cuerpo.', 'Crema única que humecta, hidrata  y conserva  tu   piel suave, tersa, flexible  y elástica, al mismo tiempo que mantiene el equilibrio natural del PH  de tu  piel.   Ayuda a contrarrestar los efectos de la contaminación y el medio ambiente. Es ideal', 'Úsalo sobre  tus manos, rostro  y tu  cuerpo.  Masajea  hasta que la loción haya sido absorbida totalmente por tu  piel. ', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Agua (Aqua), Benzoato Alquil C12-15, Ácido Esteárico, Estearato Gliceril, Polisobuteno Hidrogenado, Metil Éter Glucosa-20, Sorbitol, Aceite de Semilla Prunus Armeniaca (Albaricoque), Polisorbato 60, Trietanolamina, Alcohol Cetil, Colágeno Soluble, Elastina Hidrolizada, Aceite de Semilla Simmondsia Chinensis (Jojoba), Tocoferol (Vitamina E Natural/ vitamine E naturelle), Hialuronato de Sodio, Sodio PCA, Ex', ''),
	(8, '51', '', '4  onzas ó 118 ml', 0, 0, 'Aloe  Própolis  Creme', 0.079, 40.15, 44.05, 47.92, 50.24, 65.78, 75.85, 'Hidrata, Desinfecta, Calma y Cicatriza la piel.', 'Ayuda en casos de acné, manchas,  quemaduras,  cortes, etc. Proporciona alivio refrescante. Excelente para ayudar a solucionar la mayoría de los  problemas de la piel.  Excelente  como humectante  y como acondicionadora de la piel.  Aloe  Própolis  Creme  ayuda a mantener un tono y textura de piel sana siempre. Ayuda  a desinflamar y a combatir cualquier  tipo de infección, elimina bacterias.Es una mezcla de Gel Puro de Aloe Barbadensis (nuestro propio Gel Patentado de Sábila  Estabilizada) y los Propóleos de nuestras Abejas (antibiótico natural) con otros  ingredientes reconocidos como: Glicerina, Lanolina, Alantoína, Extracto de Manzanilla, etc. para contribuir a una piel saludable. La Manzanilla, es una de las hierbas curativas más conocidas de la naturaleza, también ha sido añadida a esta mezcla. Las vitaminas A, C y E  completan la fórmula reconocida por sus propiedades de acondicionamiento natural de la piel.', 'Aplicar libremente según sea necesario.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Estearato Gliceril, Glicol Propileno, Alcohol Cetil, Estearato PEG100, Lanolina, Sorbitol, Palmitato Etilhexil, Estearato Etilhexil, Adipato Dietilhexil, Alantoína, Extracto de Propóleos de Abeja, Alcohol Lanolina, Dimeticona, Tocoferol (Vitamina E Natural/vitamine E naturelle), Beta Caroteno (Provitamina A), Aceite Zea Mays (Maíz), Extracto de Flor Chamomilla Recutita (Matricaria), Trietanolamina, Ácido ', ''),
	(9, ' 64', '', '4  onzas ó 118 ml', 0, 0, 'Aloe  Heat  Lotion', 0.056, 28.49, 31.23, 33.97, 35.63, 46.59, 53.79, ' Alivio Rápido para los Calambres y  los Músculos Cansados y  Adoloridos.', 'Aloe  Heat  Lotion  es una crema  ligera  que  hace que los músculos  entren  en  calor y es el compañero ideal  para  un masaje calmante y relajante. Suaviza y acondiciona la piel . Ayuda  a dar un rápido alivio a los músculos adoloridos, causado por la tensión  y el estrés  o  después de haber practicado algún deporte o de un trabajo arduo  y pesado. Su acción analgésica  la hace muy útil para  usarla en casos de torceduras, contusiones, calambres y espasmos. Alivia dolores y desinflama  rápidamente. Ideal en masajes de músculos  y en articulaciones agarrotadas  y adoloridas.  Aplicada en el pecho, también previene irritaciones de garganta  y nariz causada por resfríos. Adecuado para ser usado en niños y adultos. Después de un largo y extenuante día, todos sentimos el cuerpo adolorido y cansado, esta crema  lubricante, con PH balanceado, hace  entrar en calor los músculos cansados y agotados y los relaja  estupendamente.  Contiene Gel Puro de Aloe Barbadensis (nuestro propio  Gel Patentado de Sábila  Estabilizada),  Mentol,   Aceite de Eucalipto, Aceite de Hueso de Chabacano, Aceite de Ajonjolí,  Aceite de  Jojoba, Lanolina, Alantoína y  Vitamina C. ', 'Aplicar y masajear la zona deseada hasta que sea absorbida totalmente por la piel. Evite el contacto con los ojos', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Agua (Aqua), Salicilato Metil, Estearato Gliceril, Propanodiol, Alcohol Cetil, Arginina, Mentol, Estearato PEG-100, Aceite de Hoja Eucalyptus Globulus, Aceite de Semilla Prunus Armeniaca (Albaricoque), Aceite de Semilla Sesamum Indicum (Ajonjolí), Hetilhexanoato Cetil, Carbomer, Alantoína, Ácido Ascórbico, EDTA Disódico, Fenoxietanol, Metilisotiazolinona.', ''),
	(10, '40', '', '16  onzas ó  473 ml', 0, 0, '  Aloe   First  Spray ', 0.079, 40.15, 44.05, 47.92, 50.24, 65.78, 75.85, ' Hidrata, Desinfecta y Protege la piel.', 'Exclusiva fórmula para proteger y suavizar la piel después de cortadas, rasguños, quemaduras y quemaduras de sol menores. Recomendado para tratar salpullidos, cortes, moretones y erosiones. Ayuda a cicatrizar, desinflamar y a aliviar el dolor.  También se usa en salones de belleza, como solución antes de la permanente, porque protege al cabello de los efectos de la resequedad. Es especialmente suavizante, después de la depilación.  Se usa también como spray para el cabello, lo protege y lo revitaliza.  Está formulada sobre una base de Gel Puro de Aloe Barbadensis (nuestro propio Gel  Patentado de Sábila Estabilizada), Propóleos de Abejas, Alantoína, Vitamina E Natural, Extracto de Caléndula, Extracto de Milenaria, Extracto de Tomillo, Extracto de Manzanilla, Extracto de Diente de León, Extracto de Eucalipto, Extracto de Pasionaria, Extracto de Salvia, Extracto de Jengibre, Extracto de Borraja y  Extracto de Sándalo. La combinación del Aloe con las hierbas, proporciona un suavizante natural. ', 'Aplique en la zona que necesite aliviar y humectar', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Alantoína, Glicerina, Tocoferol (Vitamina E Natural), Propóleos de Abeja, Extracto de Flor Calendula Officinalis, Extracto de Achillea Millefolium, Extracto de Flor/Hoja Thymus Vulgaris (Tomillo), Extracto de Flor Anthemis Nobilis, Extracto de Rizoma/Raíz Taraxacum Officinale (Diente de León), Extracto de Hoja Eucalyptus Globulus, Extracto de Flor Passiflora Edulis, Extracto de Hoja Salvia Officinalis (Salvia), Extracto de Raíz Zingiber', ''),
	(11, '61', '1 tubo', '4  onzas ó 118 ml', 0, 0, 'Aloe Vera Gelly ', 0.056, 28.49, 31.23, 33.97, 35.63, 46.59, 53.79, 'Suaviza e Hidrata tu Piel, Calma y Cicatriza las Heridas. ', 'Sus propiedades humectantes e hidratantes son ideales para calmar, hidratar, acondicionar y regenerar las células de todas las capas de tu  piel. Ideal para la piel irritada, heridas, quemaduras, erupciones o picaduras. Alivia la picazón, hinchazón y dolor. Reduce el edema y la inflamación de las áreas dañadas. Es bactericida,  virucida y fungicida; es decir elimina bacterias, virus y hongos. Regenera tejidos. Es absorbido rápidamente por la piel y no mancha la ropa. En los  salones de belleza se usa el Gelly alrededor de la línea del cabello, para proteger la piel antes de la permanente o tinte. Puede usarse también sobre la piel antes de un tratamiento ultrasónico o después de una electrólisis. En  el tocador, botiquín de primeros auxilios,  en la cocina y hasta en el campamento, Ideal para la piel que necesita un poco de cuidado extra. De uso tópico. Gel esencialmente idéntico  en sus propiedades, al interior de una hoja  de  Sábila, exclusiva de FOREVER, lubrica sanamente los tejidos sensibles. Compuesto por Gel Puro de  Aloe Barbadensis (nuestro propio Gel Patentado de Sábila Estabilizada) e ingredientes naturales como: Tocoferol (Vitamina E Natural),  Alantoína, Vitamina C, etc. Para reforzar el efecto beneficioso del Aloe en las afecciones dérmicas, recomendamos el uso en conjunto con la  Pulpa de Aloe Vera y el Aloe Própolis Creme.', ' Limpiar la piel antes de una aplicación abundante del Gel. Repetir la aplicación según sea necesario.', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Alantoína, Glicerina, Tocoferol (Vitamina E Natural), Propóleos de Abeja, Extracto de Flor Calendula Officinalis, Extracto de Achillea Millefolium, Extracto de Flor/Hoja Thymus Vulgaris (Tomillo), Extracto de Flor Anthemis Nobilis, Extracto de Rizoma/Raíz Taraxacum Officinale (Diente de León), Extracto de Hoja Eucalyptus Globulus, Extracto de Flor Passiflora Edulis, Extracto de Hoja Salvia Officinalis (Salvia), Extracto de Raíz Zingiber', ''),
	(12, ' 62', '', '4  onzas ó 118 ml', 0, 0, ' Aloe  Lotion', 0.056, 28.49, 31.23, 33.97, 35.63, 46.59, 53.79, 'Poderoso Humectante Para Tu  Rostro y Tu Cuerpo. ', 'Ayuda a reducir la aparición de estrías.  Es  una loción finamente texturizada, excelente  como hidratante, tonificante, nutritiva y humectante;  ligera en aroma,  pero efectiva para aliviar la piel reseca,  irritada o maltratada por el viento y el medio ambiente.   Restaura  rápidamente el PH, manteniendo la piel suave y flexible.  Penetra en las capas profundas de la piel y debe emplearse en golpes, traumatismo y dolores musculares. Excelente humectante súper refrescante,  para la cara,                         las manos, el cuerpo y para después de asolearse. Es una fórmula mejorada con los últimos avances de la tecnología cutánea. De uso tópico.   Crema maravillosa de Gel de Aloe Barbadensis (nuestro propio Gel  Patentado  de  Sábila Estabilizada) combinada con Aceite de Jojoba, Colágeno, Elastina, Vitamina E  y otros ingredientes. ', ': Aplica  y  frota  en círculos hasta que la loción haya sido absorbida totalmente por tu  piel.                                                        Repetir las veces que sea necesario.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Agua (Aqua), Glicol Propileno, Ácido Esteárico, Estearato Gliceril, Trietanolamina, Alcohol Cetil, Aceite de Semilla Prunus Armeniaca (Albaricoque), Petrolato, Lanolina, Aceite de Semilla Simmondsia Chinensis (Jojoba), Colágeno Soluble, Elastina Hidrolizada, Tocoferol (Vitamina E Natural/vitamine E naturelle), Ácido Oleico, Estearato Estearil, Adipato Dietilhexil, Estearato Etilhexil, Palmitato Etilhexil,', ''),
	(13, '238', '', ' 3.5   onzas ó  99 gr', 0, 0, 'Aloe  Scrub', 0.065, 33.05, 36.24, 39.40, 41.31, 54.10, 62.41, 'Piel más Radiante y Saludable.', 'Es un  eficaz  exfoliador  y  limpiador  del  cutis  y del cuerpo,  lo suficientemente delicado y  apropiado para el uso diario y suficientemente  fuerte para eliminar la suciedad que se acumula en los delicados  poros  de nuestra  piel. Ayuda a eliminar las espinillas,  la acumulación de maquillaje, smog, impurezas, etc.  Protege de la resequedad y de los efectos dañinos de los radicales libres y de los limpiadores sintéticos.  Abre y penetra en los poros  hasta la tercera capa  de la piel.  Retira  delicadamente las células muertas, elimina la suciedad que tapa los poros y la apariencia opaca del cutis, para  revelar un nuevo cutis, radiante y saludable.  Con  Aceite de Jojoba suspendida  en  Gel Puro de Aloe Barbadensis (nuestro propio Gel  Patentado de  Sábila Estabilizada) .. “ Más adentro del cutis “, es el concepto de limpieza que FOREVER  ha desarrollado, mediante una exclusiva combinación de Gel Estabilizado de Sábila ,  micro-esferas sólidas, hechas a base de Aceite de Jojoba  Pura  y Vitamina E . en combinación, estos ingredientes naturales limpiarán para que comience el proceso exclusivo de renovación del cutis', 'Aplica  en tu  rostro  o cuerpo húmedo y da masajes circulares con las yemas de los dedos o con esponja, durante 2 ó 3 minutos. Después enjuaga con abundante agua.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Agua (Aqua), Aceite Hidrogenado de Jojoba, Estearato Gliceril, Glicol Propileno, Isetionato Cocoil de Sodio, Óxido de Lauramina, Alcohol Cetil, Betaina Cocamidopropil, Estearato PEG-100, Sílice Hidratada, Lactato de Sodio, Tocoferil (Vitamina E Natural/vitamine E naturelle), Ácido Cítrico, Ácido Ascórbico (Vitamina C), Úrea Diazolidinil, Metilparaben, Propilparaben, Fragancia, Azul.', ''),
	(15, '612', '', '4  onzas ó 118 ml', 0, 0, 'Aloe Activator', 0.064, 32.56, 35.71, 38.83, 40.70, 53.27, 62.70, 'Eficaz para un sin número de propósitos saludables.', 'Líquido 100% Puro de Aloe Barbadensis (nuestro propio Gel Patentado de Sábila Estabilizada).  ¡Es como aplicar la sábila directamente de la hoja! Concentrado de Sábila madura de alta penetración que activa  la regeneración celular.   Destilado de hojas de sábila seleccionadas para el cuidado intensivo de la piel y de los tejidos de nuestro cuerpo.  Es un estupendo agente hidratante, que contiene Enzimas, Aminoácidos, Polisacáridos, y Alantoína.  ES UN AGENTE QUE FOMENTA EL DESARROLLO Y LA RENOVACIÓN CELULAR. Antiinflamatorio, Limpiador  o  Astringente, Germicida, Bactericida, Humectante, Analgésico (quita el dolor),  Antiséptico (desinfecta), Fungicida  (ayuda a combatir hongos), Cicatrizante y Regenerador de tejidos  (rejuvenecedor). Cualquier producto tópico mejora su eficacia, si primero se aplica el   Aloe  Activador. El  Aloe  Activador  es  increíblemente versátil, aunque está considerado como el principal componente del régimen  de belleza  Aloe Fleur de Jouvence, es sumamente eficaz para un sin número  de otros propósitos.', 'Puede aplicarse en los ojos, nariz, oído, garganta, calvicie,  heridas de todo tipo, hongos, limpieza íntima, hemorroides, belleza, reemplazo del alcohol, agua oxigenada.y una infinidad de usos  tópicos.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès officinal stabilisé), Alantoína, Fenoxietanol, Metilisotiazolinona.', ''),
	(16, '55', '', '', 0, 0, 'Aloe Body Toning Kit', 0.344, 175.02, 191.88, 208.74, 218.83, 286.44, 330.43, '¡Reduce Medidas  y Adiós a la Celulitis!', 'Ayuda a reducir medidas. Tonifica y afirma la piel.  Ayuda  a estimular la circulación y a limpiar la piel, eliminando el líquido atrapado que puede ser causa de celulitis.  Aloe  Body  Toning  Kit  ha sido desarrollado para ayudarte a adelgazar, tonificar y afirmar tu cuerpo.   El cuerpo humano es perfecto y la naturaleza nos ha dado materiales para esculpir la bella figura que llevamos dentro. Este atractivo estuche incluye: Aloe Body Toner, para usarse con la envoltura de plástico;  Aloe Body Conditioning Creme, de uso tópico  (no para envolver); Aloe Bath Gelée, para un relajante baño de tina; una esponja de calabaza, especial para suavizar la piel   y un rollo de plástico,  para envolver. Contiene  Gel Puro de Aloe Barbadensis (nuestro propio Gel de Sábila Estabilizada), extractos herbales de Europa (conocidos por sus características moldeadoras y tonificantes), el Aceite de Canela y agentes calentadores. ', 'Cuando use el Toner y Conditioning Creme: • Lave sus manos inmediatamente después de la aplicación. • Evite contacto con los ojos. • No aplique a la cara, pechos o áreas genitales. • Si ocurre irritación de la piel u otra reacción, enjuague con agua inmediatamente. • No aplique a la piel irritada o recién afeitada. PARA MEJORES RESULTADOS SIGA LAS INSTRUCCIONES EXACTAMENTE COMO SE INDICA.', 'El Aloe Body Toning Kit incluye: • Aloe Body Toner • Aloe Body Conditioning Creme • Aloe Bath Gelée • Esponja de Luffa y envoltura plástica.', '', ''),
	(17, '14', '', '8.5 Onzas o 251 ml', 0, 0, '  Aloe Bath Gelee', 0.073, 37.12, 40.70, 44.27, 46.42, 60.79, 70.09, '¡Disfruta de una Sensación de Relax, Limpieza y Frescura', 'Es un gel sensacional  de acción dual (en ducha o tina), ofrece una extraordinaria   sensación de  vigor,  al mismo tiempo  libera de estrés,  por su acción relajante. Se aplica con una esponja, de preferencia usar la esponja de fibra de calabaza  que viene con el kit completo, ayuda a remover  las células muertas, dejando tu  piel increíblemente limpia y fresca.  Su rica formulación penetra en la piel, dejando atrás la resequedad, lista para el siguiente paso: Tonificarla. Asimismo, ayuda a refrescar la mente para iniciar cada día, con una agradable sensación de fresca energía o terminarlo relajado, libre de estrés. Formulado con Gel Puro de  Aloe Barbadensis (nuestro propio Gel  Patentado de Sábila Estabilizada), Extracto de Hiedra, Extracto de Cola de Caballo, Glicerina  y Complejos Herbolarios Europeos, para relajar y refrescar el cuerpo.', ': Aplica  con una esponja. Masajea  lentamente la piel con movimientos circulares, empezando por las extremidades y luego hacía el corazón. Enjuagar y luego secar con vitalidad para ayudar a retirar las células muertas.', '', 'Jugo de Hoja de Áloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Lauril Sulfato de Amonio, Laureth Sulfato de Amonio, Cocamidopropil Betaína, Cocoato Gliceril PEG-3, Glicerina, Extracto de Hoja/Tallo de Hedera Helix (Hiedra), Extracto de Flor Spiraea Ulmaria, Extracto de Hoja Clematis Vitalba, Extracto de Fucus Vesiculosus, Extracto de Equisetum Arvense, Cloruro de Sodio, Ácido Ascórbico, Fenoxietanol, Metilisotiazolinona, Fragancia (Parfum), Amarillo 5, Azul 1.', ''),
	(18, '56', '', '4 Onzas o 118 ml', 0, 0, 'Aloe Body Toner', 0.113, 57.48, 63.00, 68.55, 71.88, 93.88, 108.51, 'Embellece tu Cuerpo Moldeándolo y Reafirmándolo', 'Fórmula herbolaria que ayuda a quemar grasas. Especialmente preparado para  embellecer  tu  cuerpo  al darle  forma, tonificarlo  y afirmarlo. Limpia tu  piel.  Libera los líquidos atrapados y minimiza la aparición de celulitis. Reduce  el aspecto a “cáscara de naranja”.  Ayuda a estimular la circulación en el tejido graso.  Tiene un efecto desintoxicante.  Humecta y acondiciona tu piel.  Nuestro secreto está en combinar el Gel Puro de Aloe Barbadensis (nuestro propio Gel Patentado de  Sábila Estabilizada), emulsificantes, humectantes, más las propiedades increíbles de calentamiento y circulación del  aceite de canela y el extracto de  pimiento rojo . Este producto está formulado para utilizarse  con un plástico envolvente, que mantiene el calor  y suaviza la  superficie del cuerpo.', ': Aplica en tu  piel  con movimientos circulares y masajea  fuertemente el mayor tiempo posible, hasta que desaparezca y luego envolver  con el plástico y dejar actuar  unos 40 minutos:', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Triglicéridos C10- 18, Estearato Gliceril, Dicaprilato/Dicaprato de Glicol Propileno, Glicol Butileno, Alcohol Cetil, Trietanolamina, Glicol Propileno, Extracto de Hedera Helix (Hiedra), Extracto de Flor Spiraea Ulmaria, Extracto de Hoja Clematis Vitalba, Extracto de Fucus Vesiculosis, Extracto de Equisetum Arvense, Colágeno Soluble, Elastina Hidrolizada, Aceite de Hoja de Cinnamomum Cassia, Estearato PEG-100, Polisorbato 2', ''),
	(19, '57', '', '4 Onzas o 118 ml', 0, 0, 'Aloe Body Conditioning Creme', 0.135, 68.68, 75.29, 81.89, 85.86, 112.40, 129.65, 'Hidrata y Favorece la Reducción de la Celulitis.', 'Crema que te ayuda a reafirmar tu  piel, dejándola suave y elástica. No es grasosa y da una suave y tersa sensación a la piel. Ayuda a estimular la circulación debajo de la piel,  que puede ayudar a soltar los fluidos atrapados y el tejido grasoso que a menudo causa celulitis.  Es una exclusiva crema emulsionante, con extractos de hierbas, para usar efectivamente como  crema de masajes. Ideal para usar después del Aloe Body Toner y en las  partes del cuerpo que no se pueden envolver. Aloe Body Conditioning  Creme, es la pareja ideal del Aloe  Body  Toner. Estos elementos complementarios del Body Toning Kit, combinados con una dieta y ejercicio regular, ayudan a reducir la aparición de  celulitis. El desequilibrio en la actividad hormonal, como los altos niveles de estrógeno, son factores que contribuyen a la formación de fluidos y tejido grasoso.    ', 'Aplica  con movimientos circulares, hasta que desaparezca totalmente, después  de retirar el plástico.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Triglicéridos C10-18, Estearato Gliceril, Glicol Propileno, Dicaprilato/Dicaprato Glicol Propileno, Alcohol Cetil, Aceite de Raíz Curcuma Zedoaria, Aceite de Raíz Zingiber Officinale (Jengibre), Aceite de Hoja Cinnamomum Cassia, Trietanolamina, Extracto de Hedera Helix (Hiedra), Extracto de Flor Spiraea Ulmaria, Extracto de Hoja Clematis Vitalba, Extracto de Fucus Vesiculosus, Extracto de Equisetum Arvense, Colágeno Soluble', ''),
	(20, '69', '', '2 Onzas  o 56.7 g.', 0, 0, 'R3 Factor', 0.124, 63.08, 69.19, 75.25, 78.90, 103.23, 119.11, 'Crema  Anti  Arrugas', 'R3 Factor es una crema anti arrugas que RETIENE la humedad natural de tu cutis, RESTAURA  su elasticidad y RENUEVA   tu apariencia aportando un espléndido brillo natural.Es perfecto para tratar  las "patas de gallo" y  las líneas de expresión . Proporciona una primera línea de defensa para combatir los dañinos efectos del tiempo y preservar la apariencia juvenil de tu cutis. Factor Skin Defense Creme es una rica combinación de Gel Estabilizado de Aloe Vera, colágeno soluble y alfa-hidroxiácidos, fortificada con vitaminas A y E, vitales para la salud de su cutis. La vitamina E es un poderoso antioxidante, mientras que la vitamina A ayuda al mantenimiento de un cutis saludable, siendo beneficiosa para cualquier tipo de piel. Los alfa-hidroxiácidos (AAH) provienen de fuentes naturales de las plantas y son denominados Ácidos Frutales.  El Ácido Glicólico es extraído de la caña de azúcar, el Ácido Cítrico se deriva de las frutas cítricas, el Ácido Tartárico proviene de las uvas y el Ácido Málico se encuentra en las manzanas.  La combinación de todos estos ácidos frutales produce un efecto exfoliante que ayuda a eliminar las células muertas de la superficie cutánea. Estas células crean una barrera para las cremas hidratantes, impidiendo la renovación celular. En un periodo de 21 a 28 días, el tiempo que dura el ciclo de renovación de la piel, podrá apreciar los efectos de la crema R3. Al combinar los AAHs con el gel de Aloe Vera.', 'Aplica  en la yema de tus  dedos y  colócalo  en el rostro,  en los cuatro puntos más saltantes y extiende  con masajes circulares hasta que se absorba  totalmente', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Glicol Butileno, Escualano, Éter Metil Glucosa 20, Dimeticona Cetil, Aceite de semilla del Prunus Armeniaca (Albaricoque), Estearato Gliceril, Poliacrilamida, Isoparafina C13- 14, Laureth-7, Linoleato Tocoferil, Hialuronato de Sodio, Acetato Tocoferil, Ácido Glicólico, Extracto de Saccharum Officinarum (Caña de Azúcar), Extracto de Fruta del Citrus Medica Limonum (Limón), Extracto del Pyrus Malus (Manzana), Extracto de Hoja del Camellia', ''),
	(21, '311', '', ' 2.5 OZ. (71 g)', 0, 0, 'Sonya Aloe Deep Moisturizing Cream', 0.133, 67.65, 74.15, 80.68, 84.58, 110.74, 127.72, 'Crema extra hidratante para restaurar y preservar el brillo juvenil de tu cutis.', 'Ayuda  a mantener y a brindar profunda hidratación a las capas externas de la piel y a restaurar el aspecto juvenil,  preservando  un  brillo luminoso  Esta crema ultra humectante calma la sed de humedad de su piel como nunca antes.  Combate los radicales libres para ayudar a preservar y fortalecer el colágeno de la piel, la proteína más abundante en el cuerpo, porque contiene extracto  de corteza de pino.  Los científicos consideran que el combatir los radicales libres es una de las mejores maneras de contrarrestar las señales del envejecimiento.   Sonya Aloe Deep Moisturizing  Creme  contiene revolucionarios ingredientes como el Extracto de Corteza de Pino,es la última edición a nuestra excepcional línea se Sonya Skin Care . El Extracto de Corteza de Pino  contiene sustancias naturales llamadas OPCs (Proantocianidina Oligoméricas), las cuales poseen unas de las más fuertes propiedades antioxidantes que se encuentren en la naturaleza. El Extracto de Corteza de Pino se combina con el Gel de Aloe Barbadensis(nuestro propio Gel Patentado de Sábila Estabilizada), Aceite de Semilla de Girasol,Arginina, Hialuronato Sódico, Ceramidas e Hidratantes de última generación en nuestra nueva crema Sonya Aloe Deep Moisturizing Cream.', 'Para una intensa y profunda hidratación por la noche, use después del Aloe Nourishing Serum. Separe la cuchara plástica y el disco de debajo de la tapa del frasco. Usando la cuchara, saque cierta cantidad de la crema y colóquela sobre el disco. Con la yema de los dedos aplique la crema a la cara y el cuello y masajee la piel. Lave la cuchara y el disco con agua caliente después de cada uso y seque con una toalla limpia antes de colocarlos nuevamente en el frasco.', '', '.  INGREDIENTES: Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Propanodiol, Glicol Butileno, Aceite de Semilla Macadamia Ternifolia, Benzoato Alquílico C12-15, Estearato Glicerilo, Lactato Lauril, Sorbitol, Dimeticona, Aceite de Semilla Helianthus Annuus (Girasol), Alcohol Cetílico, Eter Metil Glucosa 20, Hidroxiestearato Isostearil, Arginina, Estearato PEG-100, Carbomer, Extracto de Corteza Pinus Strobus, Glicerina, Tripéptido-5 Palmitoil, Ceramida 3, Ceramida 6 II, C', ''),
	(22, '234', '', '4 Onzas o 118 ml', 0, 0, 'Forever Marine Mask', 0.090, 45.80, 50.20, 54.60, 57.25, 74.91, 86.45, 'Mascarilla Marina, de fácil  aplicación.', 'Esta mascarilla fácil de aplicar penetra profundamente y deja el cutis  fresco  y revitalizado. Proporciona una limpieza profunda , al mismo tiempo que da equilibrio a  la textura del  cutis  con minerales marinos  naturales como el Alga Marina Kelp.  Hidrata  y acondiciona la piel  en profundidad gracias a nuestro  Gel Estabilizado de Aloe Vera,  la Miel y el Extracto de Pepino', '.Después de una limpieza a conciencia de su rostro, aplique Forever Marine Mask generosamente con un movimiento hacia arriba y afuera sobre su rostro entero, evitando el área de los ojos. Deje secar entre 15 y 20 minutos, manténgase inmóvil durante ese tiempo. Luego quite con agua tibia y una toalla suave. Para resultados óptimos, aplíquela por lo menos dos veces a la semana.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada/gel d’aloès vulgaire stabilisé), Agua (Aqua), Bentonita, Glicerina, Miel, Caolín, Hialuronato de Sodio, Extracto de Alga, Extracto de Macrocystis Pyrifera, Extracto de Hoja Rosmarinus Officinalis (Romero), Extracto de Fruta Cucumis Sativus (Pepino), Tocoferol (Vitamina E Natural/vitamine E naturelle), Ácido Ascórbico, Palmitato Retinil, 1, 2-Hexanodiol, Glicol Caprilil, Metilparaben, Fragancia (Parfum).', ''),
	(23, '236', '', ' 1 Onza. (28.3g)', 0, 0, 'Forever Epiblanc', 0.080, 40.70, 44.65, 48.54, 50.91, 66.56, 76.84, 'Crema Reparadora - Especial para Manchas Oscuras.', 'La fórmula exclusiva de Forever Epiblanc está específicamente diseñada  para  aclarar, dar brillo e igualar el tono del cutis, al mismo tiempo que ayuda a disminuir la apariencia de manchas oscuras e imperfecciones de la piel. Nuestro  Gel de Aloe Vera Estabilizado es una excelente base para los extractos botánicos naturales como Arbutina (Gayubas), arar ambientales.', 'Aplique por la mañana y noche en el área de la piel o cutis limpio en donde se desea un rostro sin imperfecciones. Siga con un humectante. Se recomienda además el uso de Aloe Sunscreen de Forever Living  (protector solar) durante el día.', '', 'Jugo de Hoja Aloe Barbadensis (Gel de Sábila Estabilizada), Agua (Aqua), Glicerina, Arbutina, Trietanolamina, Fosfato Ascorbil de Sodio, Extracto de Rumex Occidentalis, Hialuronato de Sodio, Vitamina E (Natural), Goma Xantan, Carbomer, Dimeticona, 1, 2-Hexanodiol, Glicol Caprilil, EDTA Disódico, Metilparaben, Fragancia (Parfum).', ''),
	(24, '187', '', '1 oz. líq. (30ml)', 0, 0, 'Forever Alpha-E-Factor', 0.117, 59.50, 65.22, 70.96, 74.91, 97.42, 112.36, 'Serum Rejuvenecedor del Cutis', 'Es un emoliente ligero que ofrece una óptima protección contra los factores ambientales y los radicales libres. Mejora la elasticidad.  Ayuda a  conservar la piel limpia y protegida, ofreciéndote  un aspecto más terso y juvenil.   Rejuvenece tu  cutis debido a sus ricos ingredientes que nutren e hidratan la piel desde el interior, ofreciendo a tu piel un aspecto radiante.   Combina los antioxidantes más puros, humectantes y emulsionantes para mantener su piel hidratada y equilibrada por más tiempo.   Además es uno de los productos más versátiles para el cuidado de la piel.Adecuado incluso para el cutis más sensible. La base de este emoliente: Alpha-E Factor® es nuestro Gel Estabilizado de Aloe Vera, al cual le hemos añadido los siguientes ingredientes: Vitamina E, Vitamina A, Vitamina C, Lecitina, Aceite de Semilla de Borraja, Bisabolol, Triglicérido Caprilico / Cáprico de coco y Aceite de Semilla de Soya.         ', 'Aplica  en la yema de tus  dedos y colócala  en el rostro en los cuatro puntos más saltantes y extienda con masajes circulares hasta que se absorba. ', '', 'Triglicérido Caprílico/Cáprico, Ciclometicona, Acetato de Tocoferil, Palmitato Retinil, Palmitato Ascorbil, Extracto de Aloe Barbadensis, Bisabolol, Tocoferol, Lecitina, Aceite de Semilla de Borraja (Borago Officinalis), Aceite de Fríjol de Soya (Glycine Soja), Metilparaben, Propilparaben, Fragancia.', ''),
	(25, '186', '', '4 onzas. líq. (118 ml)', 0, 0, 'Sonya Aloe Eyes Makeup Remover', 0.047, 23.92, 26.20, 28.49, 29.90, 39.07, 45.11, 'Desmaquillador de Ojos', 'Esta delicada y ligera fórmula de áloe trabaja rápida y suavemente para quitar totalmente el maquillaje.  •Acondiciona e hidrata las pestañas . • No deja residuos .  Puede aplicarse maquillaje inmediatamente después de su uso. Fórmula exclusiva; no contiene aceite.   Hágale un favor a su cutis: nunca se duerma con maquillaje.  ¡Piel limpia es piel sana! El Gel de Aloe Barbadensis (nuestro propio gel de sábila estabilizada), proporciona el cuidado, acondicionamiento y alivio inmediato  para el área delicada de los ojos. ', 'Satura  una pequeña mota de algodón o hisopo con el removedor. Aplica  en tus ojos cerrados y delicadamente quita el maquillaje. Repite si es necesario.', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Cocoamfodiacetato Disódico, Polisorbato 20, Cocoato de Sucrosa, Aminoácidos de Laurel Sódico de Avena, Hidroxietilcelulosa, Fenoxietanol, Metilparaben, Propilparaben, EDTA Disódico, Fragrancia.', ''),
	(26, '278', '', '4 onzas. líq. (118 ml)', 0, 0, 'Sonya Aloe Deep Cleansing Exfoliator', 0.096, 48.83, 53.57, 58.26, 61.09, 79.93, 92.22, 'Limpia suavemente sin irritar tu cutis', 'Es un excelente exfoliante que ayuda a eliminar totalmente el maquillaje, suciedad e impurezas  de tu rostro. Deja tu cutis limpio, flexible  y con una sensación suave y sedosa. La Sábila  le dará la  hidratación que tu piel necesita,   mientras que los suaves gránulos de Jojoba, limpiarán tus poros a  profundidad, dándole a tu piel la limpieza que se merece. Contiene Gel Puro  de Aloe Barbadensis  (nuestro propio Gel de Sábila Estabilizada),  Aceite Hidrogenado de Jojoba, Almidón Zea Mays (Maíz), Arginina, Glicerina, Extracto  de fruta Cucumis Sativus (Pepino) , Citrus Medica Limonum  (Limón), EDTA Disódico, Fragancia, etc.', ': Primero humedece  tu  cara con agua, luego coloca un poco del producto en la yema de tus  dedos y masajea  delicadamente con movimientos circulares, de  2 a 3 minutos (evita  el contacto con los ojos). Enjuaga  con agua tibia, luego seca  dándote palmaditas con una toalla facial.  Aplicar 1 ó 2 veces por semana', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Almidón Zea Mays (Maíz), Glucósido Decil, Copolímero de Acrilato, Aceite Hidrogenado de Jojoba, Cocamidopropil Betaína, Arginina, Glicerina, Extracto de Fruta Cucumis Sativus (Pepino), Extracto de Fruta Citrus Medica Limonum (Limón), Fenoxietanol, Metilisotiazolinona, EDTA Disódico, Fragancia.', ''),
	(27, '279', '', '6 oz. líq. (177 ml)', 0, 0, 'Sonya Aloe Refreshing  Toner', 0.128, 65.11, 71.37, 77.64, 81.43, 106.59, 122.95, 'Refresca e hidrata el cutis.', 'Este genial tónico repara la piel dañada y proporciona la humedad  necesaria. No contiene alcohol. Es un tónico tanto refrescante como hidratante. Aloe Refreshing Toner con Té Blanco proporciona humedad vital para ayudarte a mantener tu cutis adecuadamente hidratado. Tonifica  tu piel con  el  Gel Puro  de Aloe Barbadensiss (nuestro propio Gel Patentado de Sábila Estabilizada), Glicerina, Hialuronato de Sodio, Esteres de Cera de Jojoba, PEG-120 ,Extracto de Hoja de  Camellia Seninsis (Té Blanco), Extracto de fruta Cucumes Sativus (Pepino), Alantoína, Aceite de Castor  Hidrogenado, PEG-40, Ácido Cítrico, FraganciA, etc. Al aplicarse después de limpiar con Sonya Aloe Purifying Cleanser, la piel de tu cutis absorberá instantáneamente las propiedades nutritivas del Gel de Sábila Estabilizado, Extracto de Té Blanco, Pepino y otros fabulosos humectantes.', 'Usa  por la mañana y por la noche después del limpiador Sonya Aloe Purifying Cleanser.Aplica  con una mota de algodón o pañito facial sobre la cara, cuello y otras áreas donde lo necesites.', '', 'Gel de Aloe Barbadensis (Gel de Sábila Estabilizada), Agua, Glicerina, Éter Metil Glucosa 20, Sorbitol, Hialuronato de Sodio, Ésters de Cera de Jojoba PEG-120, Lactato de Sodio, Beta-Glucan, Extracto de Hoja Camellia Sinensis (Té Blanco), Extracto de Fruta Cucumis Sativus (Pepino), Alantoína, Hexanediol 1,2, Glicol Caprilil, Tropolone, Aceite de Castor Hidrogenado PEG-40, Tridecil Éter 9, Ácido Cítrico, EDTA Disódico, Fragancia.', ''),
	(28, '281', '', '4 oz. líq. (118 ml)', 0, 0, 'Sonya Aloe  Nourishing Serum', 0.159, 80.89, 88.65, 96.46, 101.10, 132.39, 152.70, 'Fórmula liviana y sedosa que restaura la humedad de tu cutis. ', 'Restaura   y conserva la humedad  natural de tu  piel para  ayudarte  a mantener  una apariencia  juvenil  y combatir los signos  del envejecimiento.Aloe Nourishing Serum con Gel Puro de Aloe Barbadensis  (nuestro propio  Gel Patentado de Sábila Estabilizada), Extracto de Mimosa, Extracto de Hoja  de Camellia Sinensis (Té Blanco),  Acetato  de Tocoferol, Fragancia y Antioxidantes que protegen la piel  de  los radicales libres. Su fórmula ligera es tan suave que se aplica sin esfuerzo. Es una base perfecta  para la crema Aloe Balancing Cream, de la línea Sonya.', 'Aplica  por la mañana y  en  la noche después del Refreshing Toner. Bombea  unas 3 veces sobre la yema de tus  dedos, frótalos y luego aplica a tu  cara, cuello y otras áreas donde lo necesites.', '', 'Gel de Sábila Barbadensis (Gel de Sábila Estabilizada), Ciclometicona, Agua, Polímero Entrecruzado de Dimeticona, Dimeticona, Glicerina, Glicol Butileno, Polisobuteno Hidrogenado, Extracto de Hoja Camellia Sinensis (Té Blanco), Extracto de Corteza de Mimosa Tenuiflora, Acetato de Tocoferil, Poliacrilamida, Isoparafina C13-14, Laureth-7, Fosfato Ascorbil de Sodio, Hexanodiol 1,2, Glicol Caprilil, Tropolone, Fragancia.', '');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla forever.productos_forever
DROP TABLE IF EXISTS `productos_forever`;
CREATE TABLE IF NOT EXISTS `productos_forever` (
  `idPrd` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(150) COLLATE utf8_bin NOT NULL,
  `detalles` varchar(250) COLLATE utf8_bin NOT NULL,
  `marca_id` int(11) NOT NULL DEFAULT 0,
  `categoria_id` int(11) NOT NULL DEFAULT 0,
  `sub_categoria_id` int(11) NOT NULL DEFAULT 0,
  `codigo` char(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bar_code` char(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `linea` varchar(250) COLLATE utf8_bin NOT NULL,
  `sub_linea` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `familia_id` int(11) NOT NULL,
  `precio_costo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_publico` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `compra` char(50) COLLATE utf8_bin NOT NULL,
  `venta` char(50) COLLATE utf8_bin NOT NULL,
  `stock` varchar(100) COLLATE utf8_bin NOT NULL,
  `stock_minimo` char(50) COLLATE utf8_bin NOT NULL,
  `stock_maximo` char(50) COLLATE utf8_bin NOT NULL,
  `estado` enum('Disponible','Agotado','Pronto') COLLATE utf8_bin DEFAULT 'Pronto',
  `visible` enum('Disponible','No disponible') COLLATE utf8_bin DEFAULT 'Disponible',
  `unidad_medida` char(50) COLLATE utf8_bin NOT NULL,
  `peso` char(50) COLLATE utf8_bin NOT NULL,
  `volumen` char(50) COLLATE utf8_bin NOT NULL,
  `medidas` char(50) COLLATE utf8_bin NOT NULL,
  `modelo` char(50) COLLATE utf8_bin NOT NULL,
  `garantia` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT '',
  `condiciones` char(50) COLLATE utf8_bin NOT NULL,
  `contenido` char(50) COLLATE utf8_bin NOT NULL,
  `referencia_1` varchar(250) COLLATE utf8_bin NOT NULL,
  `referencia_2` varchar(250) COLLATE utf8_bin NOT NULL,
  `referencia_3` varchar(250) COLLATE utf8_bin NOT NULL,
  `referencia_4` varchar(250) COLLATE utf8_bin NOT NULL,
  `imagen_producto` varchar(250) COLLATE utf8_bin NOT NULL,
  `user_id` char(50) COLLATE utf8_bin DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPrd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.productos_forever: ~0 rows (aproximadamente)
DELETE FROM `productos_forever`;
/*!40000 ALTER TABLE `productos_forever` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_forever` ENABLE KEYS */;

-- Volcando estructura para tabla forever.salida_almacen
DROP TABLE IF EXISTS `salida_almacen`;
CREATE TABLE IF NOT EXISTS `salida_almacen` (
  `idSAlm` int(11) NOT NULL AUTO_INCREMENT,
  `nro_salida` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `doc_ref` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `almacen` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tipo_movimiento` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSAlm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.salida_almacen: ~0 rows (aproximadamente)
DELETE FROM `salida_almacen`;
/*!40000 ALTER TABLE `salida_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida_almacen` ENABLE KEYS */;

-- Volcando estructura para tabla forever.sub_categorias
DROP TABLE IF EXISTS `sub_categorias`;
CREATE TABLE IF NOT EXISTS `sub_categorias` (
  `idSubc` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorias` int(11) NOT NULL,
  `nombre_categoria` varchar(50) COLLATE utf8_bin NOT NULL,
  `img_sub_categoria` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idSubc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.sub_categorias: ~0 rows (aproximadamente)
DELETE FROM `sub_categorias`;
/*!40000 ALTER TABLE `sub_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_categorias` ENABLE KEYS */;

-- Volcando estructura para tabla forever.sub_grupos
DROP TABLE IF EXISTS `sub_grupos`;
CREATE TABLE IF NOT EXISTS `sub_grupos` (
  `idSug` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `nombre_sub_grupo` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idSug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.sub_grupos: ~4 rows (aproximadamente)
DELETE FROM `sub_grupos`;
/*!40000 ALTER TABLE `sub_grupos` DISABLE KEYS */;
INSERT INTO `sub_grupos` (`idSug`, `grupo_id`, `nombre_sub_grupo`) VALUES
	(1, 1, 'Control de peso'),
	(2, 1, 'Jugos de sabila'),
	(3, 1, 'Productos de la colmena'),
	(4, 1, 'Nutrientes');
/*!40000 ALTER TABLE `sub_grupos` ENABLE KEYS */;

-- Volcando estructura para tabla forever.table_config
DROP TABLE IF EXISTS `table_config`;
CREATE TABLE IF NOT EXISTS `table_config` (
  `tcon_Id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`tcon_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla forever.table_config: ~1 rows (aproximadamente)
DELETE FROM `table_config`;
/*!40000 ALTER TABLE `table_config` DISABLE KEYS */;
INSERT INTO `table_config` (`tcon_Id`, `table_name`) VALUES
	(1, 'categorias,cliente_contacto,clientes,descuentos,entrada_almacen,familias,grupos,img_productos,marcas,productos,productos_forever,salida_almacen,sub_categorias,sub_grupos');
/*!40000 ALTER TABLE `table_config` ENABLE KEYS */;

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

-- Volcando datos para la tabla forever.table_queries: ~21 rows (aproximadamente)
DELETE FROM `table_queries`;
/*!40000 ALTER TABLE `table_queries` DISABLE KEYS */;
INSERT INTO `table_queries` (`tque_Id`, `name_table`, `col_name`, `col_type`, `input_type`, `joins`, `j_table`, `j_id`, `j_value`, `j_as`, `query`, `jvpos`) VALUES
	(1, 'productos', 'codigo', 'char', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'productos', 'unidad', 'char', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'productos', 'capacidad', 'char', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'productos', 'grupo', 'int', 3, 'LEFT JOIN', 'grupos', 'idGrp', 'nombre_grupo', NULL, NULL, NULL),
	(5, 'productos', 'sub_grupo', 'int', 3, 'LEFT JOIN', 'sub_grupos', 'idSug', 'nombre_sub_grupo', NULL, NULL, NULL),
	(6, 'productos', 'producto', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'productos', 'puntos', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'productos', 'gerente', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'productos', 'asistente_gerente', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'productos', 'supevisor', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'productos', 'asistente_supervisor', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'productos', 'cliente_novus', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'productos', 'precio_publico', 'double', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'productos', 'descripcion', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'productos', 'detalle', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'productos', 'uso_sugerido', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'productos', 'contenido', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'productos', 'ingredientes', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'productos', 'imagen', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'sub_grupos', 'grupo_id', 'int', 3, 'LEFT JOIN', 'grupos', 'idGrp', 'nombre_grupo', NULL, NULL, NULL),
	(21, 'sub_grupos', 'nombre_sub_grupo', 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `table_queries` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
