-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-11-2020 a las 19:55:02
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `socrates`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_acceso`
--

DROP TABLE IF EXISTS `admin_acceso`;
CREATE TABLE IF NOT EXISTS `admin_acceso` (
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_acceso`
--

INSERT INTO `admin_acceso` (`codigo`, `descripcion`) VALUES
('1', 'Publico - Todos (Sin loguear y logueados)'),
('2', 'Solo usuarios sin loguear'),
('3', 'Solo usuarios logueados'),
('4', 'Estudiantes'),
('5', 'Docentes'),
('6', 'Administrativos'),
('7', 'Asignación por roles'),
('8', 'Prohibido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_accion`
--

DROP TABLE IF EXISTS `admin_accion`;
CREATE TABLE IF NOT EXISTS `admin_accion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) NOT NULL,
  `accion` varchar(60) NOT NULL,
  `tipo_accion` varchar(50) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `requiere_permiso` char(1) NOT NULL DEFAULT 'S',
  `descripcion` blob,
  `fechar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_accion_pkey` (`id`),
  UNIQUE KEY `menu_accion_cod_menu_nombre_acc` (`menu`,`accion`) USING BTREE,
  KEY `admin_menu_accion_fk1_idx` (`menu`),
  KEY `admin_menu_accion_fk2_idx` (`tipo_accion`)
) ENGINE=InnoDB AUTO_INCREMENT=4252 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_accion`
--

INSERT INTO `admin_accion` (`id`, `menu`, `accion`, `tipo_accion`, `archivo`, `requiere_permiso`, `descripcion`, `fechar`) VALUES
(1, 'inicio', 'ver', 'pagina', 'inicio.php', 'N', 0x30, '2020-06-06 18:47:41'),
(2, 'cerrar-sesion', 'cerrarSesion', 'json', 'cerrar_sesion.php', 'S', 0x30, '2020-06-06 18:47:41'),
(3, 'iniciar-sesion', 'ver', 'pagina', 'iniciar_sesion.php', 'N', 0x30, '2020-06-06 18:47:41'),
(4, 'iniciar-sesion', 'iniciar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1133, 'roles', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1134, 'roles', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1135, 'roles', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1136, 'roles', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1137, 'roles', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1138, 'roles', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1139, 'permisos-por-rol', 'cargar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1140, 'permisos-por-rol', 'guardar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1141, 'permisos-por-rol', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1182, 'cambiar-clave', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1183, 'cambiar-clave', 'cambiar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1403, 'crear-formulario-crud', 'ver', 'pagina', 'formulario.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1405, 'crear-formulario-crud', 'cargarInfoFormulario', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1406, 'crear-formulario-crud', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1407, 'crear-formulario-crud', 'verificar', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1640, 'crear-formulario-libre', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1641, 'crear-formulario-libre', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1642, 'crear-formulario-libre', 'verificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1793, 'crear-reporte', 'ver', 'pagina', 'formulario.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1794, 'crear-reporte', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1795, 'crear-reporte', 'verificar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1796, 'crear-reporte', 'cargarCampos', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1797, 'crear-reporte', 'vistaPrevia', 'descarga', 'vista_previa.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1855, 'usuarios', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1856, 'usuarios', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1857, 'usuarios', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1858, 'usuarios', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1859, 'usuarios', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1860, 'usuarios', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1861, 'usuarios', 'listarPersonas', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1862, 'gestion-de-acciones', 'agregar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1863, 'gestion-de-acciones', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1864, 'gestion-de-acciones', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1865, 'gestion-de-acciones', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1866, 'gestion-de-acciones', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1867, 'gestion-de-acciones', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1868, 'cerrar-sesion', 'd', 'html', 'd', 'N', 0x30, '2020-06-06 18:47:41'),
(1870, 'cambiar-clave', 'f', 'html', 'f', 'N', 0x30, '2020-06-06 18:47:41'),
(1873, 'cambiar-clave', 'ff', 'html', 'f', 'N', 0x30, '2020-06-06 18:47:41'),
(1910, 'gestion-menu', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1911, 'gestion-menu', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1912, 'gestion-menu', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(1913, 'gestion-menu', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1914, 'gestion-menu', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(1915, 'gestion-menu', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(2009, 'perfil', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(2010, 'perfil', 'aceptar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(2413, 'perfil', 'cambiar_clave', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(2414, 'perfil', 'cambiar_foto', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(2821, 'perfil', 'cambiar_firma', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(2949, 'inicio', 'set_token', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 18:47:41'),
(3036, 'buscar', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 18:47:41'),
(3037, 'buscar', 'aceptar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 18:47:41'),
(4178, 'iniciar-sesion', 'set_login', 'json', 'acciones.php', 'S', NULL, '2020-06-06 20:50:38'),
(4206, 'usabilidad-sistema', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-13 01:18:38'),
(4207, 'usabilidad-sistema', 'cargar', 'json', 'acciones.php', 'S', 0x5065726d6974656361726761726c61696e666f726d6163696e696e696369616c64656c617669737461, '2020-06-13 01:18:38'),
(4208, 'usabilidad-sistema', 'ver_detalles_usuario', 'json', 'acciones.php', 'S', 0x5065726d697465766572656c646574616c6c6573646575736162696c69646164706f727573756172696f, '2020-06-13 01:18:38'),
(4209, 'editor-codigos', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-13 01:22:42'),
(4210, 'editor-codigos', 'listar_archivos', 'json', 'acciones.php', 'S', 0x5065726d6974656c69737461726c6f736172636869766f7364656c6f736d64756c6f7364656c73697374656d61, '2020-06-13 01:22:42'),
(4211, 'editor-codigos', 'guardar', 'json', 'acciones.php', 'S', 0x5065726d697465677561726461726c61696e666f726d6163696e71756573656564697461, '2020-06-13 01:22:42'),
(4212, 'editor-codigos', 'obtener', 'json', 'acciones.php', 'S', 0x5065726d6974656f6274656e6572656c636f6e74656e69646f64656c6172636869766f717565736564657361656469746172, '2020-06-13 01:22:42'),
(4213, 'inicio', 'agregar_favorito', 'json', 'acciones.php', 'N', NULL, '2020-06-16 01:58:26'),
(4214, 'ejemplos-alerts', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:03:01'),
(4215, 'ejemplos-alerts', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:03:01'),
(4216, 'ejemplos-accordion', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:03:31'),
(4217, 'ejemplos-accordion', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:03:31'),
(4218, 'ejemplos-buttons', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:04:10'),
(4219, 'ejemplos-buttons', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:04:10'),
(4220, 'ejemplos-dropdown', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:04:36'),
(4221, 'ejemplos-dropdown', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:04:36'),
(4222, 'ejemplos-modal', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:05:31'),
(4223, 'ejemplos-modal', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:05:31'),
(4224, 'ejemplos-tab', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:06:16'),
(4225, 'ejemplos-tab', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:06:16'),
(4226, 'ejemplos-popovers', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:06:42'),
(4227, 'ejemplos-popovers', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:06:42'),
(4228, 'ejemplos-tooltip', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:07:08'),
(4229, 'ejemplos-tooltip', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:07:08'),
(4230, 'ejemplos-tablas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:39:26'),
(4231, 'ejemplos-tablas', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:39:26'),
(4232, 'ejemplos-datatables', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:40:29'),
(4233, 'ejemplos-datatables', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:40:29'),
(4236, 'ejemplos-tablas-responsivas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-06-16 20:45:34'),
(4237, 'ejemplos-tablas-responsivas', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 20:45:34'),
(4244, 'si-no', 'agregar', 'json', 'acciones.php', 'S', 0x5065726d697465206167726567617220726567697374726f7320656e206c612062617365206465206461746f73, '2020-11-14 19:52:27'),
(4245, 'si-no', 'modificar', 'json', 'acciones.php', 'S', 0x5065726d697465206d6f6469666963617220726567697374726f7320656e206c612062617365206465206461746f73, '2020-11-14 19:52:27'),
(4246, 'si-no', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726d69746520656c696d696e617220726567697374726f7320656e206c612062617365206465206461746f73, '2020-11-14 19:52:27'),
(4247, 'si-no', 'listar', 'json', 'acciones.php', 'N', 0x5065726d6974652063617267617220656c2047524944206465736465206c612062617365206465206461746f73, '2020-11-14 19:52:27'),
(4248, 'si-no', 'asignar', 'json', 'acciones.php', 'N', 0x5065726d697465206f6274656e6572207920666f726d6174656172206c617320636f6e73756c7461732061206c612062617365206465206461746f73, '2020-11-14 19:52:27'),
(4249, 'si-no', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-11-14 19:52:27'),
(4250, 'pruebas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726d69746520636172676172206c612076697374612064656c20666f726d756c6172696f20284d564329, '2020-11-14 19:53:38'),
(4251, 'pruebas', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-11-14 19:53:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_favoritos`
--

DROP TABLE IF EXISTS `admin_favoritos`;
CREATE TABLE IF NOT EXISTS `admin_favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_menu` int NOT NULL,
  PRIMARY KEY (`id`,`id_persona`,`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_favoritos`
--

INSERT INTO `admin_favoritos` (`id`, `id_persona`, `id_menu`) VALUES
(5, 1, 1),
(7, 1, 449);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `menu` varchar(145) NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `accion` varchar(145) DEFAULT NULL,
  `tipo` int NOT NULL,
  `mensaje` varchar(245) NOT NULL,
  `fechar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_log`
--

INSERT INTO `admin_log` (`id`, `id_persona`, `menu`, `archivo`, `accion`, `tipo`, `mensaje`, `fechar`) VALUES
(1, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:35:09'),
(2, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:35:11'),
(3, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:36:16'),
(4, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:36:18'),
(5, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:36:43'),
(6, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:36:45'),
(7, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:38:32'),
(8, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:38:34'),
(9, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:39:29'),
(10, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:39:31'),
(11, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:39:48'),
(12, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:39:50'),
(13, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:41:29'),
(14, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:41:32'),
(15, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:42:02'),
(16, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:42:04'),
(17, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:42:19'),
(18, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:42:21'),
(19, 1, 'editor-codigos', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:42:31'),
(20, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:42:33'),
(21, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-15 01:51:06'),
(22, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-15 01:51:07'),
(23, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:53:00'),
(24, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:53:02'),
(25, 1, 'gestion-menu', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:53:06'),
(26, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:53:07'),
(27, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 01:53:07'),
(28, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 01:53:08'),
(29, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-06-16 01:53:16'),
(30, 1, 'gestion-menu', 'descarga.php', 'eliminar', 1, 'EXITO', '2020-06-16 01:53:19'),
(31, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-06-16 01:53:26'),
(32, 1, 'gestion-menu', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:53:47'),
(33, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:53:48'),
(34, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 01:53:48'),
(35, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:53:56'),
(36, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:53:57'),
(37, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:58:02'),
(38, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:58:03'),
(39, 1, 'inicio', '404.php', NULL, 2, 'Vinculo no valido !!!', '2020-06-16 01:58:04'),
(40, 1, 'gestion-de-acciones', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:58:11'),
(41, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:58:13'),
(42, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 01:58:13'),
(43, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 01:58:18'),
(44, 1, 'gestion-de-acciones', 'descarga.php', 'agregar', 1, 'EXITO', '2020-06-16 01:58:26'),
(45, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 01:58:30'),
(46, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 01:58:30'),
(47, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 01:58:36'),
(48, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:09:29'),
(49, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:09:31'),
(50, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:09:32'),
(51, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:09:45'),
(52, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:09:46'),
(53, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:09:48'),
(54, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:09:51'),
(55, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:11:48'),
(56, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:11:50'),
(57, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:12:49'),
(58, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:12:51'),
(59, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:12:55'),
(60, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:13:14'),
(61, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:13:16'),
(62, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:13:17'),
(63, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:13:20'),
(64, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:15:00'),
(65, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:15:01'),
(66, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:15:19'),
(67, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:15:20'),
(68, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:15:22'),
(69, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:15:26'),
(70, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:15:26'),
(71, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:15:28'),
(72, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:19:09'),
(73, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:19:10'),
(74, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 02:19:12'),
(75, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:19:13'),
(76, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:19:14'),
(77, 1, 'inicio', 'pagina.php', 'ver', 1, 'EXITO', '2020-06-16 02:20:20'),
(78, 1, 'inicio', 'descarga.php', 'set_token', 1, 'EXITO', '2020-06-16 02:20:21'),
(104, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 02:27:41'),
(105, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 20:00:48'),
(106, 1, 'gestion-menu', 'descarga.php', 'agregar', 1, 'EXITO', '2020-06-16 20:01:28'),
(107, 1, 'permisos-por-rol', 'descarga.php', 'cargar', 1, 'EXITO', '2020-06-16 20:01:35'),
(108, 1, 'permisos-por-rol', 'descarga.php', 'guardar', 1, 'EXITO', '2020-06-16 20:01:40'),
(109, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:02:18'),
(110, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:02:41'),
(111, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:02:45'),
(112, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:02:56'),
(113, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:03:01'),
(114, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:03:21'),
(115, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:03:27'),
(116, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:03:31'),
(117, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:03:57'),
(118, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:04:02'),
(119, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:04:10'),
(120, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:04:33'),
(121, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:04:34'),
(122, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:04:36'),
(123, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:05:19'),
(124, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:05:21'),
(125, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:05:31'),
(126, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:06:14'),
(127, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:06:15'),
(128, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:06:16'),
(129, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:06:38'),
(130, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:06:40'),
(131, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:06:42'),
(132, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:07:04'),
(133, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:07:05'),
(134, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:07:08'),
(135, 1, 'si-no', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 20:16:39'),
(136, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 20:24:15'),
(137, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:38:45'),
(138, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:39:00'),
(139, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:39:26'),
(140, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:40:20'),
(141, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:40:27'),
(142, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:40:29'),
(143, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:40:54'),
(144, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-06-16 20:41:02'),
(145, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:41:11'),
(146, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-06-16 20:45:34'),
(147, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-16 21:02:44'),
(148, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 22:50:21'),
(149, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 22:50:27'),
(150, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 22:50:32'),
(151, 1, 'inicio', 'descarga.php', 'agregar_favorito', 1, 'EXITO', '2020-06-16 22:50:33'),
(152, 1, 'usabilidad-sistema', 'descarga.php', 'cargar', 1, 'EXITO', '2020-06-17 14:59:38'),
(153, 1, 'usabilidad-sistema', 'descarga.php', 'cargar', 1, 'EXITO', '2020-06-17 15:02:02'),
(154, 1, 'editor-codigos', 'descarga.php', 'guardar', 1, 'EXITO', '2020-06-17 15:20:21'),
(155, 1, 'editor-codigos', 'descarga.php', 'guardar', 1, 'EXITO', '2020-06-17 22:44:50'),
(156, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-06-17 22:45:22'),
(157, 1, 'cerrar-sesion', 'descarga.php', 'cerrarSesion', 1, 'EXITO', '2020-06-17 22:45:48'),
(158, 1, 'cerrar-sesion', 'descarga.php', 'cerrarSesion', 1, 'EXITO', '2020-11-14 18:54:41'),
(159, 1, 'inicio2', '404.php', NULL, 2, 'Vinculo no valido !!!', '2020-11-14 18:59:37'),
(160, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:19:14'),
(161, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:20:09'),
(162, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:20:22'),
(163, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:24:13'),
(164, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:25:43'),
(165, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:27:31'),
(166, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:28:02'),
(167, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:31:13'),
(168, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:33:52'),
(169, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:34:11'),
(170, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:35:24'),
(171, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:36:21'),
(172, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:36:36'),
(173, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:36:44'),
(174, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:36:50'),
(175, 1, 'gestion-menu', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:36:55'),
(176, 1, 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', 1, 'EXITO', '2020-11-14 19:37:15'),
(177, 1, 'crear-formulario-crud', 'descarga.php', 'verificar', 1, 'EXITO', '2020-11-14 19:37:15'),
(178, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:37:44'),
(179, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:40:49'),
(180, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:41:45'),
(181, 1, 'gestion-de-acciones', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:41:56'),
(182, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:42:16'),
(183, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:43:14'),
(184, 1, 'gestion-menu', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:43:43'),
(185, 1, 'permisos-por-rol', 'descarga.php', 'cargar', 1, 'EXITO', '2020-11-14 19:44:02'),
(186, 1, 'roles', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:44:10'),
(187, 1, 'roles', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:45:02'),
(188, 1, 'si-no', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:45:10'),
(189, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:45:22'),
(190, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:46:05'),
(191, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:47:05'),
(192, 1, 'roles', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:47:20'),
(193, 1, 'roles', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:47:26'),
(194, 1, 'roles', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:47:28'),
(195, 1, 'roles', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:47:31'),
(196, 1, 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', 1, 'EXITO', '2020-11-14 19:50:03'),
(197, 1, 'crear-formulario-crud', 'descarga.php', 'verificar', 1, 'EXITO', '2020-11-14 19:50:03'),
(198, 1, 'crear-formulario-crud', 'descarga.php', 'generar', 1, 'EXITO', '2020-11-14 19:50:19'),
(199, 1, 'si-no', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:50:27'),
(200, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:51:13'),
(201, 1, 'crear-formulario-crud', 'descarga.php', 'generar', 1, 'EXITO', '2020-11-14 19:52:27'),
(202, 1, 'si-no', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:52:33'),
(203, 1, 'si-no', 'descarga.php', 'agregar', 1, 'EXITO', '2020-11-14 19:52:46'),
(204, 1, 'si-no', 'descarga.php', 'asignar', 1, 'EXITO', '2020-11-14 19:52:50'),
(205, 1, 'si-no', 'descarga.php', 'eliminar', 1, 'EXITO', '2020-11-14 19:52:52'),
(206, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-11-14 19:53:08'),
(207, 1, 'crear-formulario-libre', 'descarga.php', 'verificar', 1, 'EXITO', '2020-11-14 19:53:29'),
(208, 1, 'crear-formulario-libre', 'descarga.php', 'generar', 1, 'EXITO', '2020-11-14 19:53:38'),
(209, 1, 'usuarios', 'descarga.php', 'listar', 1, 'EXITO', '2020-11-14 19:53:44'),
(210, 1, 'cerrar-sesion', 'descarga.php', 'cerrarSesion', 1, 'EXITO', '2020-11-14 19:54:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) NOT NULL,
  `padre` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `accion` varchar(60) DEFAULT 'ver',
  `orden` smallint NOT NULL DEFAULT '0',
  `visible` char(1) NOT NULL DEFAULT 'S',
  `acceso` char(1) DEFAULT '1',
  `target` varchar(49) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `icono` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`menu`),
  KEY `admin_menu_fk2_idx` (`acceso`),
  KEY `admin_menu_fk3_idx` (`padre`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `menu`, `padre`, `nombre`, `ruta`, `accion`, `orden`, `visible`, `acceso`, `target`, `descripcion`, `icono`) VALUES
(1, 'inicio', NULL, 'Inicio', 'modulos/inicio', 'ver', -100, 'S', '3', NULL, '', 'ti-home menu-icon'),
(2, 'iniciar-sesion', NULL, 'Iniciar sesión', 'modulos/sesion', 'ver', 200, 'S', '2', NULL, '', ''),
(31, 'administracion', NULL, 'Administración', NULL, 'ver', 100, 'S', '7', NULL, '', 'ti-lock menu-icon'),
(32, 'roles', 'administracion', 'Roles', 'modulos/admin/roles', 'ver', 1, 'S', '7', NULL, '', ''),
(33, 'permisos-por-rol', 'administracion', 'Permisos por rol', 'modulos/admin/permisos_rol', 'ver', 1, 'S', '7', NULL, '', NULL),
(35, 'slider', 'administracion', 'Slider (imagenes)', 'modulos/admin/slider', 'ver', 1, 'S', '8', NULL, '', NULL),
(36, 'cambiar-clave', NULL, 'Cambiar clave', 'modulos/admin/cambiar_clave', 'ver', 999, 'S', '4', NULL, '', NULL),
(45, 'cerrar-sesion', NULL, 'Cerrar sesión', 'modulos/sesion', 'cerrarSesion', 1000, 'N', '3', NULL, '', NULL),
(300, 'asistente', NULL, 'Asistente', NULL, 'ver', 99, 'S', '7', NULL, '', 'ti-pencil-alt menu-icon'),
(301, 'crear-formulario-crud', 'asistente', 'Crear formulario (CRUD)', 'modulos/asistente/formulario_crud', 'ver', 1, 'S', '7', NULL, '', NULL),
(302, 'crear-formulario-libre', 'asistente', 'Crear formulario libre', 'modulos/asistente/formulario_libre', 'ver', 2, 'S', '7', NULL, '', NULL),
(306, 'crear-reporte', 'asistente', 'Crear reporte', 'modulos/asistente/reporte', 'ver', 3, 'S', '7', NULL, '', NULL),
(330, 'usuarios', 'administracion', 'Usuarios', 'modulos/admin/usuarios', 'ver', 1, 'S', '7', NULL, '', ''),
(331, 'gestion-de-acciones', 'asistente', 'Gestión de acciones', 'modulos/asistente/gestion_acciones', 'ver', 5, 'S', '7', NULL, '', NULL),
(344, 'gestion-menu', 'asistente', 'Gestión de Menú', 'modulos/asistente/gestion_menu', 'ver', 1, 'S', '7', NULL, '', NULL),
(391, 'perfil', NULL, 'Perfil', 'modulos/perfil_usuario', 'ver', 2, 'N', '3', NULL, '', NULL),
(437, 'buscar', NULL, 'Buscar', 'modulos/buscar', 'ver', 2, 'N', '3', NULL, '', NULL),
(448, 'usabilidad-sistema', 'administracion', 'Usabilidad Del Sistema', 'modulos/administracion/usabilidad_sistema', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(449, 'editor-codigos', 'asistente', 'Editor De Códigos', 'modulos/asistente/editor_codigos', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(450, 'ejemplos-codigos', 'asistente', 'Ejemplos', NULL, NULL, 12, 'S', '7', NULL, NULL, NULL),
(451, 'ejemplos-alerts', 'ejemplos-codigos', 'Alerts', 'modulos/asistente/ejemplos_codigos/alerts', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(452, 'ejemplos-accordion', 'ejemplos-codigos', 'Accordion', 'modulos/asistente/ejemplos_codigos/accordion', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(453, 'ejemplos-buttons', 'ejemplos-codigos', 'Buttons', 'modulos/asistente/ejemplos_codigos/buttons', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(454, 'ejemplos-dropdown', 'ejemplos-codigos', 'Dropdown', 'modulos/asistente/ejemplos_codigos/dropdown', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(455, 'ejemplos-modal', 'ejemplos-codigos', 'Modal', 'modulos/asistente/ejemplos_codigos/modal', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(456, 'ejemplos-tab', 'ejemplos-codigos', 'Tab', 'modulos/asistente/ejemplos_codigos/tab', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(457, 'ejemplos-popovers', 'ejemplos-codigos', 'Popovers', 'modulos/asistente/ejemplos_codigos/popovers', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(458, 'ejemplos-tooltip', 'ejemplos-codigos', 'Tooltip', 'modulos/asistente/ejemplos_codigos/tooltip', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(459, 'ejemplos-tablas', 'ejemplos-codigos', 'Tablas', 'modulos/asistente/ejemplos_codigos/tablas', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(460, 'ejemplos-datatables', 'ejemplos-codigos', 'DataTables', 'modulos/asistente/ejemplos_codigos/datatables', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(462, 'ejemplos-tablas-responsivas', 'ejemplos-codigos', 'Tablas Responsivas', 'modulos/asistente/ejemplos_codigos/tablas_responsivas', 'ver', 1, 'S', '7', NULL, NULL, NULL),
(464, 'si-no', 'administracion', 'Si no', 'modulos/administracion/si_no', 'ver', 1, 'S', '7', NULL, 'Permite gestionar los si y no del sistema', NULL),
(465, 'pruebas', 'administracion', 'pruebas libre', 'modulos/ejemplos/prueba_libre', 'ver', 1, 'S', '7', NULL, 'Permite...', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_permiso_accion`
--

DROP TABLE IF EXISTS `admin_permiso_accion`;
CREATE TABLE IF NOT EXISTS `admin_permiso_accion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` int NOT NULL,
  `accion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permiso_accion_fk1_idx` (`rol`),
  KEY `admin_permiso_accion_fk2_idx` (`accion`)
) ENGINE=InnoDB AUTO_INCREMENT=42308 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_permiso_accion`
--

INSERT INTO `admin_permiso_accion` (`id`, `rol`, `accion`) VALUES
(42211, 4, 1910),
(42212, 4, 1912),
(42213, 4, 1911),
(42214, 4, 1915),
(42215, 4, 4211),
(42216, 4, 4210),
(42217, 4, 4212),
(42218, 4, 4209),
(42219, 4, 1640),
(42220, 4, 1642),
(42221, 4, 1864),
(42222, 4, 1863),
(42223, 4, 1867),
(42224, 4, 1133),
(42225, 4, 1135),
(42226, 4, 1137),
(42227, 4, 1139),
(42228, 4, 1140),
(42229, 4, 1855),
(42230, 4, 1857),
(42231, 4, 1856),
(42232, 4, 1860),
(42236, 4, 4207),
(42237, 4, 4206),
(42238, 4, 4208),
(42239, 4, 4214),
(42240, 4, 4215),
(42242, 4, 4216),
(42243, 4, 4217),
(42245, 4, 4218),
(42246, 4, 4219),
(42248, 4, 4220),
(42249, 4, 4221),
(42251, 4, 4222),
(42252, 4, 4223),
(42254, 4, 4224),
(42255, 4, 4225),
(42257, 4, 4226),
(42258, 4, 4227),
(42260, 4, 4228),
(42261, 4, 4229),
(42263, 4, 4230),
(42264, 4, 4231),
(42266, 4, 4232),
(42267, 4, 4233),
(42272, 4, 4236),
(42273, 4, 4237),
(42288, 1, 4244),
(42289, 1, 4245),
(42290, 1, 4246),
(42291, 1, 4247),
(42292, 1, 4248),
(42293, 1, 4249),
(42295, 4, 4244),
(42296, 4, 4245),
(42297, 4, 4246),
(42298, 4, 4247),
(42299, 4, 4248),
(42300, 4, 4249),
(42302, 1, 4250),
(42303, 1, 4251),
(42305, 4, 4250),
(42306, 4, 4251);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_permiso_menu`
--

DROP TABLE IF EXISTS `admin_permiso_menu`;
CREATE TABLE IF NOT EXISTS `admin_permiso_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` int NOT NULL,
  `menu` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`rol`,`menu`),
  KEY `admin_menu_rol_fk2_idx` (`menu`)
) ENGINE=InnoDB AUTO_INCREMENT=11678 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_permiso_menu`
--

INSERT INTO `admin_permiso_menu` (`id`, `rol`, `menu`) VALUES
(11676, 1, 'pruebas'),
(11674, 1, 'si-no'),
(11654, 4, 'administracion'),
(11646, 4, 'asistente'),
(11647, 4, 'crear-formulario-crud'),
(11650, 4, 'crear-formulario-libre'),
(11651, 4, 'crear-reporte'),
(11649, 4, 'editor-codigos'),
(11661, 4, 'ejemplos-accordion'),
(11660, 4, 'ejemplos-alerts'),
(11662, 4, 'ejemplos-buttons'),
(11653, 4, 'ejemplos-codigos'),
(11669, 4, 'ejemplos-datatables'),
(11663, 4, 'ejemplos-dropdown'),
(11664, 4, 'ejemplos-modal'),
(11666, 4, 'ejemplos-popovers'),
(11665, 4, 'ejemplos-tab'),
(11668, 4, 'ejemplos-tablas'),
(11671, 4, 'ejemplos-tablas-responsivas'),
(11667, 4, 'ejemplos-tooltip'),
(11652, 4, 'gestion-de-acciones'),
(11648, 4, 'gestion-menu'),
(11656, 4, 'permisos-por-rol'),
(11677, 4, 'pruebas'),
(11655, 4, 'roles'),
(11675, 4, 'si-no'),
(11659, 4, 'usabilidad-sistema'),
(11657, 4, 'usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_psesion`
--

DROP TABLE IF EXISTS `admin_psesion`;
CREATE TABLE IF NOT EXISTS `admin_psesion` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_id` varchar(45) NOT NULL,
  `old_session_id` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) NOT NULL,
  `refer` varchar(500) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `inico` datetime NOT NULL,
  `fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_psesion`
--

INSERT INTO `admin_psesion` (`id`, `session_id`, `old_session_id`, `user_agent`, `refer`, `ip`, `inico`, `fin`) VALUES
(1, '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/inicio', '::1', '2020-06-11 08:21:56', '2020-06-11 15:05:13'),
(2, '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/editor-codigos', '::1', '2020-06-13 18:02:46', '2020-06-13 22:42:54'),
(3, '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/crear-formulario-crud', '::1', '2020-06-14 09:06:02', '2020-06-14 09:07:19'),
(4, '3kd7veclnq3lufkq30cgfgi3du', '3kd7veclnq3lufkq30cgfgi3du', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/gestion-menu', '::1', '2020-06-16 14:56:41', '2020-06-16 22:07:47'),
(5, '3kd7veclnq3lufkq30cgfgi3du', '3kd7veclnq3lufkq30cgfgi3du', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/usabilidad-sistema', '::1', '2020-06-17 09:34:42', '2020-06-17 12:10:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_rol`
--

DROP TABLE IF EXISTS `admin_rol`;
CREATE TABLE IF NOT EXISTS `admin_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `_usuario` varchar(45) DEFAULT NULL,
  `_fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_rol`
--

INSERT INTO `admin_rol` (`id`, `nombre`, `_usuario`, `_fecha`) VALUES
(1, 'ADMINISTRADOR', '99999', '2014-06-01 13:54:29'),
(4, 'SUPER ADMIN', '1077461284', '2020-06-11 11:17:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_sesion`
--

DROP TABLE IF EXISTS `admin_sesion`;
CREATE TABLE IF NOT EXISTS `admin_sesion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) NOT NULL,
  `session_id` varchar(45) NOT NULL,
  `refer` varchar(500) NOT NULL,
  `user_agent` varchar(500) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `salida` char(1) NOT NULL,
  `jaz` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index2` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_sesion`
--

INSERT INTO `admin_sesion` (`id`, `usuario`, `session_id`, `refer`, `user_agent`, `ip`, `inicio`, `fin`, `salida`, `jaz`) VALUES
(1, '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 20:40:07', '2020-06-06 20:40:07', 'N', 2),
(2, '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 21:16:09', '2020-06-06 21:16:09', 'N', 2),
(3, '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/HEAVEN5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 21:47:35', '2020-06-06 21:47:35', 'N', 2),
(4, '1077461284', '7fonttq2jf6e898ve7rntv3rt2', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 10:23:02', '2020-06-09 10:23:02', 'N', 4),
(5, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/lia/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 14:31:22', '2020-06-09 14:31:22', 'N', 5),
(6, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 14:32:17', '2020-06-09 14:32:17', 'N', 3),
(7, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 10:18:37', '2020-06-10 10:18:37', 'N', 2),
(8, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 11:29:30', '2020-06-10 11:29:30', 'N', 5),
(9, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 21:56:29', '2020-06-10 21:56:29', 'N', 2),
(10, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 22:30:03', '2020-06-10 22:30:03', 'N', 3),
(11, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/inicio', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 08:21:56', '2020-06-11 08:21:56', 'N', 3),
(12, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 15:05:52', '2020-06-11 15:05:52', 'N', 3),
(13, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 19:06:43', '2020-06-11 19:06:43', 'N', 1),
(14, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 21:07:31', '2020-06-11 21:07:31', 'N', 5),
(15, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 21:08:53', '2020-06-11 21:08:53', 'N', 2),
(16, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-12 20:15:25', '2020-06-12 20:15:25', 'N', 5),
(17, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/editor-codigos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-13 18:02:46', '2020-06-13 18:02:46', 'N', 5),
(18, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/crear-formulario-crud', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 09:06:01', '2020-06-14 09:06:01', 'N', 3),
(19, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 19:56:45', '2020-06-14 19:56:45', 'N', 2),
(20, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 20:28:56', '2020-06-14 20:28:56', 'N', 3),
(21, '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 20:29:20', '2020-06-14 20:29:20', 'N', 3),
(22, '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-15 20:53:00', '2020-06-15 20:53:00', 'N', 4),
(23, '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/gestion-menu', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-16 14:56:40', '2020-06-16 14:56:40', 'N', 4),
(24, '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/usabilidad-sistema', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-17 09:34:42', '2020-06-17 09:34:42', 'N', 2),
(25, '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-17 17:44:06', '2020-06-17 17:44:06', 'N', 4),
(26, '1077461284', 'vsk7ldah5ho4re5hk014t8bplr', 'http://localhost/lia2/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '::1', '2020-08-19 19:00:05', '2020-08-19 19:00:05', 'N', 1),
(27, '1077461284', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '2020-11-14 13:40:54', '2020-11-14 13:40:54', 'N', 2),
(28, '1077461284', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '2020-11-14 13:58:57', '2020-11-14 13:58:57', 'N', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_sesion_denegada`
--

DROP TABLE IF EXISTS `admin_sesion_denegada`;
CREATE TABLE IF NOT EXISTS `admin_sesion_denegada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `session_id` varchar(45) NOT NULL,
  `refer` varchar(45) NOT NULL,
  `user_agent` varchar(500) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`usuario`),
  KEY `admin_sesion_denegada_fk1_idx` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_sesion_denegada`
--

INSERT INTO `admin_sesion_denegada` (`id`, `usuario`, `fecha`, `session_id`, `refer`, `user_agent`, `ip`, `tipo`) VALUES
(1, 'dad', '2020-06-06 16:39:34', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/?usuario=dad&clave=d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4'),
(2, 'dad', '2020-06-06 20:29:55', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4'),
(3, 'dad', '2020-06-06 20:30:06', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4'),
(4, 'ada', '2020-06-09 14:28:42', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/lia/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4'),
(5, 'DAD', '2020-06-09 14:31:32', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4'),
(6, 'dad', '2020-06-09 14:31:53', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4'),
(7, '1077416284', '2020-06-11 21:07:18', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '1'),
(8, '1077416284', '2020-06-12 20:15:14', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '1'),
(9, 'ada', '2020-11-14 13:24:16', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(10, 'dad', '2020-11-14 13:36:02', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(11, 'dad', '2020-11-14 13:36:06', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(12, 'dad', '2020-11-14 13:36:27', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(13, 'dad', '2020-11-14 13:36:32', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(14, 'dad', '2020-11-14 13:38:19', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(15, 'dad', '2020-11-14 13:38:32', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4'),
(16, 'FGARCIA', '2020-11-14 13:40:10', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_tipo_accion`
--

DROP TABLE IF EXISTS `admin_tipo_accion`;
CREATE TABLE IF NOT EXISTS `admin_tipo_accion` (
  `codigo` varchar(50) NOT NULL,
  `archivo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_tipo_accion`
--

INSERT INTO `admin_tipo_accion` (`codigo`, `archivo`) VALUES
('descarga', 'descarga.php'),
('html', 'descarga.php'),
('json', 'descarga.php'),
('pagina', 'pagina.php'),
('texto', 'descarga.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_tipo_denegacion`
--

DROP TABLE IF EXISTS `admin_tipo_denegacion`;
CREATE TABLE IF NOT EXISTS `admin_tipo_denegacion` (
  `codigo` char(1) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_tipo_denegacion`
--

INSERT INTO `admin_tipo_denegacion` (`codigo`, `nombre`) VALUES
('1', 'Usuario o clave incorrecta'),
('2', 'No tiene rol para este aplicativo'),
('3', 'Ya habia iniciado sesión previamente'),
('4', 'Error de validación'),
('5', 'Error al crear la sesion en la base de datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_usuario`
--

DROP TABLE IF EXISTS `admin_usuario`;
CREATE TABLE IF NOT EXISTS `admin_usuario` (
  `persona_id` int NOT NULL,
  `rol` int NOT NULL,
  `_usuario` varchar(15) NOT NULL,
  `_fecha` datetime NOT NULL,
  PRIMARY KEY (`persona_id`),
  KEY `admin_usuario_fk1_idx` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_usuario`
--

INSERT INTO `admin_usuario` (`persona_id`, `rol`, `_usuario`, `_fecha`) VALUES
(1, 4, '1077461284', '2017-01-14 16:06:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_no`
--

DROP TABLE IF EXISTS `si_no`;
CREATE TABLE IF NOT EXISTS `si_no` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `si_no`
--

INSERT INTO `si_no` (`id`, `nombre`) VALUES
(1, 'SI'),
(2, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visible`
--

DROP TABLE IF EXISTS `visible`;
CREATE TABLE IF NOT EXISTS `visible` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(125) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `visible`
--

INSERT INTO `visible` (`id`, `nombre`) VALUES
(1, 'SI'),
(2, 'NO');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin_accion`
--
ALTER TABLE `admin_accion`
  ADD CONSTRAINT `admin_menu_accion_fk1` FOREIGN KEY (`menu`) REFERENCES `admin_menu` (`menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_menu_accion_fk2` FOREIGN KEY (`tipo_accion`) REFERENCES `admin_tipo_accion` (`codigo`);

--
-- Filtros para la tabla `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD CONSTRAINT `admin_menu_fk2` FOREIGN KEY (`acceso`) REFERENCES `admin_acceso` (`codigo`),
  ADD CONSTRAINT `admin_menu_fk3` FOREIGN KEY (`padre`) REFERENCES `admin_menu` (`menu`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `admin_permiso_accion`
--
ALTER TABLE `admin_permiso_accion`
  ADD CONSTRAINT `admin_permiso_accion_fk1` FOREIGN KEY (`rol`) REFERENCES `admin_rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_permiso_accion_fk2` FOREIGN KEY (`accion`) REFERENCES `admin_accion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `admin_permiso_menu`
--
ALTER TABLE `admin_permiso_menu`
  ADD CONSTRAINT `admin_menu_rol_fk1` FOREIGN KEY (`menu`) REFERENCES `admin_menu` (`menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_permiso_menu_fk2` FOREIGN KEY (`rol`) REFERENCES `admin_rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `admin_sesion_denegada`
--
ALTER TABLE `admin_sesion_denegada`
  ADD CONSTRAINT `admin_sesion_denegada_fk1` FOREIGN KEY (`tipo`) REFERENCES `admin_tipo_denegacion` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
