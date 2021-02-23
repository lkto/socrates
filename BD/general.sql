/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : general

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-02-23 13:57:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_acceso
-- ----------------------------
DROP TABLE IF EXISTS `admin_acceso`;
CREATE TABLE `admin_acceso` (
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_acceso
-- ----------------------------
INSERT INTO `admin_acceso` VALUES ('1', 'Publico - Todos (Sin loguear y logueados)');
INSERT INTO `admin_acceso` VALUES ('2', 'Solo usuarios sin loguear');
INSERT INTO `admin_acceso` VALUES ('3', 'Solo usuarios logueados');
INSERT INTO `admin_acceso` VALUES ('4', 'Prueba');
INSERT INTO `admin_acceso` VALUES ('5', 'Sistema');
INSERT INTO `admin_acceso` VALUES ('6', 'Administrativos');
INSERT INTO `admin_acceso` VALUES ('7', 'Asignación por roles');
INSERT INTO `admin_acceso` VALUES ('8', 'Prohibido');

-- ----------------------------
-- Table structure for admin_accion
-- ----------------------------
DROP TABLE IF EXISTS `admin_accion`;
CREATE TABLE `admin_accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) NOT NULL,
  `accion` varchar(60) NOT NULL,
  `tipo_accion` varchar(50) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `descripcion` blob NOT NULL,
  `requiere_permiso` char(1) NOT NULL DEFAULT 'S',
  `fechar` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_accion_pkey` (`id`),
  UNIQUE KEY `menu_accion_cod_menu_nombre_acc` (`menu`,`accion`) USING BTREE,
  KEY `admin_menu_accion_fk1_idx` (`menu`),
  KEY `admin_menu_accion_fk2_idx` (`tipo_accion`),
  CONSTRAINT `admin_menu_accion_fk1` FOREIGN KEY (`menu`) REFERENCES `admin_menu` (`menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_menu_accion_fk2` FOREIGN KEY (`tipo_accion`) REFERENCES `admin_tipo_accion` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3487 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_accion
-- ----------------------------
INSERT INTO `admin_accion` VALUES ('1', 'inicio', 'ver', 'pagina', 'inicio.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2', 'cerrar-sesion', 'cerrarSesion', 'json', 'cerrar_sesion.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3', 'iniciar-sesion', 'ver', 'pagina', 'iniciar_sesion.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('4', 'iniciar-sesion', 'iniciar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1133', 'roles', 'agregar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1134', 'roles', 'asignar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1135', 'roles', 'eliminar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1136', 'roles', 'listar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1137', 'roles', 'modificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1138', 'roles', 'ver', 'pagina', 'index.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1139', 'permisos-por-rol', 'cargar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1140', 'permisos-por-rol', 'guardar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1141', 'permisos-por-rol', 'ver', 'pagina', 'index.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1182', 'cambiar-clave', 'ver', 'pagina', 'index.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1183', 'cambiar-clave', 'cambiar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1403', 'crear-formulario-crud', 'ver', 'pagina', 'formulario.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1405', 'crear-formulario-crud', 'cargarInfoFormulario', 'html', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1406', 'crear-formulario-crud', 'generar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1407', 'crear-formulario-crud', 'verificar', 'html', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1640', 'crear-formulario-libre', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1641', 'crear-formulario-libre', 'generar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1642', 'crear-formulario-libre', 'verificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1793', 'crear-reporte', 'ver', 'pagina', 'formulario.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1794', 'crear-reporte', 'generar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1795', 'crear-reporte', 'verificar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1796', 'crear-reporte', 'cargarCampos', 'html', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1797', 'crear-reporte', 'vistaPrevia', 'descarga', 'vista_previa.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1855', 'usuarios', 'agregar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1856', 'usuarios', 'modificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1857', 'usuarios', 'eliminar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1858', 'usuarios', 'listar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1859', 'usuarios', 'asignar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1860', 'usuarios', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1861', 'usuarios', 'listarPersonas', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1862', 'gestion-de-acciones', 'agregar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1863', 'gestion-de-acciones', 'modificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1864', 'gestion-de-acciones', 'eliminar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1865', 'gestion-de-acciones', 'listar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1866', 'gestion-de-acciones', 'asignar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1867', 'gestion-de-acciones', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1868', 'cerrar-sesion', 'd', 'html', 'd', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1870', 'cambiar-clave', 'f', 'html', 'f', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1873', 'cambiar-clave', 'ff', 'html', 'f', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1910', 'gestion-menu', 'agregar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1911', 'gestion-menu', 'modificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1912', 'gestion-menu', 'eliminar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1913', 'gestion-menu', 'listar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1914', 'gestion-menu', 'asignar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('1915', 'gestion-menu', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2009', 'perfil', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2010', 'perfil', 'aceptar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2413', 'perfil', 'cambiar_clave', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2414', 'perfil', 'cambiar_foto', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('2821', 'perfil', 'cambiar_firma', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3372', 'perfil-persona', 'agregar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3373', 'perfil-persona', 'modificar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3374', 'perfil-persona', 'eliminar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3375', 'perfil-persona', 'listar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3376', 'perfil-persona', 'asignar', 'json', 'acciones.php', '', 'N', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3377', 'perfil-persona', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3405', 'cambiar-clave-usuario', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3406', 'cambiar-clave-usuario', 'aceptar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3407', 'cambiar-clave-usuario', 'listarPersonas', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3408', 'importar-usuarios', 'ver', 'pagina', 'formulario.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3409', 'importar-usuarios', 'aceptar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3410', 'importar-usuarios', 'listar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3411', 'importar-usuarios', 'validar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3412', 'importar-usuarios', 'ingresar', 'json', 'acciones.php', '', 'S', '2020-09-22 12:18:19');
INSERT INTO `admin_accion` VALUES ('3437', 'inicio', 'set_token', 'json', 'acciones.php', 0x30, 'N', '2020-06-06 18:47:41');
INSERT INTO `admin_accion` VALUES ('3438', 'iniciar-sesion', 'set_login', 'json', 'acciones.php', '', 'N', '2020-06-06 20:50:38');
INSERT INTO `admin_accion` VALUES ('3439', 'estado', 'agregar', 'json', 'acciones.php', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:16');
INSERT INTO `admin_accion` VALUES ('3440', 'estado', 'modificar', 'json', 'acciones.php', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:16');
INSERT INTO `admin_accion` VALUES ('3441', 'estado', 'eliminar', 'json', 'acciones.php', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:16');
INSERT INTO `admin_accion` VALUES ('3442', 'estado', 'listar', 'json', 'acciones.php', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, 'N', '2020-09-22 12:30:16');
INSERT INTO `admin_accion` VALUES ('3443', 'estado', 'asignar', 'json', 'acciones.php', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, 'N', '2020-09-22 12:30:16');
INSERT INTO `admin_accion` VALUES ('3444', 'estado', 'ver', 'pagina', 'formulario.php', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, 'S', '2020-09-22 12:30:17');
INSERT INTO `admin_accion` VALUES ('3445', 'sexo', 'agregar', 'json', 'acciones.php', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:53');
INSERT INTO `admin_accion` VALUES ('3446', 'sexo', 'modificar', 'json', 'acciones.php', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:53');
INSERT INTO `admin_accion` VALUES ('3447', 'sexo', 'eliminar', 'json', 'acciones.php', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:30:54');
INSERT INTO `admin_accion` VALUES ('3448', 'sexo', 'listar', 'json', 'acciones.php', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, 'N', '2020-09-22 12:30:54');
INSERT INTO `admin_accion` VALUES ('3449', 'sexo', 'asignar', 'json', 'acciones.php', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, 'N', '2020-09-22 12:30:54');
INSERT INTO `admin_accion` VALUES ('3450', 'sexo', 'ver', 'pagina', 'formulario.php', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, 'S', '2020-09-22 12:30:54');
INSERT INTO `admin_accion` VALUES ('3451', 'tipo-documento', 'agregar', 'json', 'acciones.php', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:31:23');
INSERT INTO `admin_accion` VALUES ('3452', 'tipo-documento', 'modificar', 'json', 'acciones.php', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:31:23');
INSERT INTO `admin_accion` VALUES ('3453', 'tipo-documento', 'eliminar', 'json', 'acciones.php', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:31:23');
INSERT INTO `admin_accion` VALUES ('3454', 'tipo-documento', 'listar', 'json', 'acciones.php', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, 'N', '2020-09-22 12:31:23');
INSERT INTO `admin_accion` VALUES ('3455', 'tipo-documento', 'asignar', 'json', 'acciones.php', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, 'N', '2020-09-22 12:31:24');
INSERT INTO `admin_accion` VALUES ('3456', 'tipo-documento', 'ver', 'pagina', 'formulario.php', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, 'S', '2020-09-22 12:31:24');
INSERT INTO `admin_accion` VALUES ('3469', 'persona', 'agregar', 'json', 'acciones.php', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:42:25');
INSERT INTO `admin_accion` VALUES ('3470', 'persona', 'modificar', 'json', 'acciones.php', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:42:25');
INSERT INTO `admin_accion` VALUES ('3471', 'persona', 'eliminar', 'json', 'acciones.php', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, 'S', '2020-09-22 12:42:25');
INSERT INTO `admin_accion` VALUES ('3472', 'persona', 'listar', 'json', 'acciones.php', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, 'N', '2020-09-22 12:42:25');
INSERT INTO `admin_accion` VALUES ('3473', 'persona', 'asignar', 'json', 'acciones.php', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, 'N', '2020-09-22 12:42:25');
INSERT INTO `admin_accion` VALUES ('3474', 'persona', 'ver', 'pagina', 'formulario.php', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, 'S', '2020-09-22 12:42:25');

-- ----------------------------
-- Table structure for admin_favoritos
-- ----------------------------
DROP TABLE IF EXISTS `admin_favoritos`;
CREATE TABLE `admin_favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_persona`,`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_favoritos
-- ----------------------------

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `menu` varchar(145) NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `accion` varchar(145) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `mensaje` varchar(245) NOT NULL,
  `fechar` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:19:04');
INSERT INTO `admin_log` VALUES ('2', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:19:06');
INSERT INTO `admin_log` VALUES ('3', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:19:23');
INSERT INTO `admin_log` VALUES ('4', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:19:26');
INSERT INTO `admin_log` VALUES ('5', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:20:00');
INSERT INTO `admin_log` VALUES ('6', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:20:04');
INSERT INTO `admin_log` VALUES ('7', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:20:13');
INSERT INTO `admin_log` VALUES ('8', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:20:16');
INSERT INTO `admin_log` VALUES ('9', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:20:20');
INSERT INTO `admin_log` VALUES ('10', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:20:31');
INSERT INTO `admin_log` VALUES ('11', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:20:34');
INSERT INTO `admin_log` VALUES ('12', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:20:36');
INSERT INTO `admin_log` VALUES ('13', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:20:40');
INSERT INTO `admin_log` VALUES ('14', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:20:42');
INSERT INTO `admin_log` VALUES ('15', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:20:48');
INSERT INTO `admin_log` VALUES ('16', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:20:54');
INSERT INTO `admin_log` VALUES ('17', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:20:59');
INSERT INTO `admin_log` VALUES ('18', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:21:05');
INSERT INTO `admin_log` VALUES ('19', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:21:14');
INSERT INTO `admin_log` VALUES ('20', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:21:23');
INSERT INTO `admin_log` VALUES ('21', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:21:36');
INSERT INTO `admin_log` VALUES ('22', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:21:38');
INSERT INTO `admin_log` VALUES ('23', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:23:24');
INSERT INTO `admin_log` VALUES ('24', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:23:40');
INSERT INTO `admin_log` VALUES ('25', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:24:14');
INSERT INTO `admin_log` VALUES ('26', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:25:17');
INSERT INTO `admin_log` VALUES ('27', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2020-09-22 12:26:00');
INSERT INTO `admin_log` VALUES ('28', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2020-09-22 12:26:03');
INSERT INTO `admin_log` VALUES ('29', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2020-09-22 12:26:17');
INSERT INTO `admin_log` VALUES ('30', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2020-09-22 12:26:21');
INSERT INTO `admin_log` VALUES ('31', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-09-22 12:26:32');
INSERT INTO `admin_log` VALUES ('32', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2020-09-22 12:26:40');
INSERT INTO `admin_log` VALUES ('33', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:26:58');
INSERT INTO `admin_log` VALUES ('34', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:02');
INSERT INTO `admin_log` VALUES ('35', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:07');
INSERT INTO `admin_log` VALUES ('36', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:10');
INSERT INTO `admin_log` VALUES ('37', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:18');
INSERT INTO `admin_log` VALUES ('38', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:27:24');
INSERT INTO `admin_log` VALUES ('39', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:27');
INSERT INTO `admin_log` VALUES ('40', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:30');
INSERT INTO `admin_log` VALUES ('41', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:33');
INSERT INTO `admin_log` VALUES ('42', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:38');
INSERT INTO `admin_log` VALUES ('43', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:41');
INSERT INTO `admin_log` VALUES ('44', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:46');
INSERT INTO `admin_log` VALUES ('45', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:27:50');
INSERT INTO `admin_log` VALUES ('46', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:27:54');
INSERT INTO `admin_log` VALUES ('47', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:28:00');
INSERT INTO `admin_log` VALUES ('48', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:28:05');
INSERT INTO `admin_log` VALUES ('49', '1', 'tipo-documento', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:29:10');
INSERT INTO `admin_log` VALUES ('50', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-09-22 12:29:56');
INSERT INTO `admin_log` VALUES ('51', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-09-22 12:29:57');
INSERT INTO `admin_log` VALUES ('52', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:30:16');
INSERT INTO `admin_log` VALUES ('53', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-09-22 12:30:21');
INSERT INTO `admin_log` VALUES ('54', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-09-22 12:30:21');
INSERT INTO `admin_log` VALUES ('55', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:30:53');
INSERT INTO `admin_log` VALUES ('56', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-09-22 12:31:09');
INSERT INTO `admin_log` VALUES ('57', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-09-22 12:31:09');
INSERT INTO `admin_log` VALUES ('58', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:31:23');
INSERT INTO `admin_log` VALUES ('59', '1', 'estado', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:31:34');
INSERT INTO `admin_log` VALUES ('60', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:31:39');
INSERT INTO `admin_log` VALUES ('61', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:31:45');
INSERT INTO `admin_log` VALUES ('62', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:31:53');
INSERT INTO `admin_log` VALUES ('63', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-09-22 12:31:56');
INSERT INTO `admin_log` VALUES ('64', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:31:58');
INSERT INTO `admin_log` VALUES ('65', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-09-22 12:32:01');
INSERT INTO `admin_log` VALUES ('66', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:32:03');
INSERT INTO `admin_log` VALUES ('67', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-09-22 12:32:05');
INSERT INTO `admin_log` VALUES ('68', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:32:06');
INSERT INTO `admin_log` VALUES ('69', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-09-22 12:32:09');
INSERT INTO `admin_log` VALUES ('70', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:32:11');
INSERT INTO `admin_log` VALUES ('71', '1', 'sexo', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:32:18');
INSERT INTO `admin_log` VALUES ('72', '1', 'tipo-documento', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:32:23');
INSERT INTO `admin_log` VALUES ('73', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:34:15');
INSERT INTO `admin_log` VALUES ('74', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:34:19');
INSERT INTO `admin_log` VALUES ('75', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:34:28');
INSERT INTO `admin_log` VALUES ('76', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:34:31');
INSERT INTO `admin_log` VALUES ('77', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:34:57');
INSERT INTO `admin_log` VALUES ('78', '1', 'reportes', '404.php', null, '2', 'Vinculo no valido !!!', '2020-09-22 12:36:32');
INSERT INTO `admin_log` VALUES ('79', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-09-22 12:36:45');
INSERT INTO `admin_log` VALUES ('80', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-09-22 12:36:45');
INSERT INTO `admin_log` VALUES ('81', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-09-22 12:37:17');
INSERT INTO `admin_log` VALUES ('82', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:40:28');
INSERT INTO `admin_log` VALUES ('83', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:40:44');
INSERT INTO `admin_log` VALUES ('84', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:40:51');
INSERT INTO `admin_log` VALUES ('85', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-09-22 12:42:24');
INSERT INTO `admin_log` VALUES ('86', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:42:30');
INSERT INTO `admin_log` VALUES ('87', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:45:06');
INSERT INTO `admin_log` VALUES ('88', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:45:19');
INSERT INTO `admin_log` VALUES ('89', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:45:38');
INSERT INTO `admin_log` VALUES ('90', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:45:48');
INSERT INTO `admin_log` VALUES ('91', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:45:51');
INSERT INTO `admin_log` VALUES ('92', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 12:46:36');
INSERT INTO `admin_log` VALUES ('93', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:46:40');
INSERT INTO `admin_log` VALUES ('94', '1', 'persona', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 12:47:01');
INSERT INTO `admin_log` VALUES ('95', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:47:04');
INSERT INTO `admin_log` VALUES ('96', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 12:47:06');
INSERT INTO `admin_log` VALUES ('97', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 14:58:09');
INSERT INTO `admin_log` VALUES ('98', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 14:58:11');
INSERT INTO `admin_log` VALUES ('99', '1', 'persona', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 14:58:18');
INSERT INTO `admin_log` VALUES ('100', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:04:31');
INSERT INTO `admin_log` VALUES ('101', '1', 'cambiar-clave-usuario', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-09-22 16:07:21');
INSERT INTO `admin_log` VALUES ('102', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:08:06');
INSERT INTO `admin_log` VALUES ('103', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:08:10');
INSERT INTO `admin_log` VALUES ('104', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 16:08:12');
INSERT INTO `admin_log` VALUES ('105', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 16:08:19');
INSERT INTO `admin_log` VALUES ('106', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:08:22');
INSERT INTO `admin_log` VALUES ('107', '1', 'buscar', '404.php', null, '2', 'Vinculo no valido !!!', '2020-09-22 16:13:39');
INSERT INTO `admin_log` VALUES ('108', '1', 'buscar', '404.php', null, '2', 'Vinculo no valido !!!', '2020-09-22 16:14:18');
INSERT INTO `admin_log` VALUES ('109', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:14:25');
INSERT INTO `admin_log` VALUES ('110', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:14:30');
INSERT INTO `admin_log` VALUES ('111', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:14:36');
INSERT INTO `admin_log` VALUES ('112', '1', 'reportes', '404.php', null, '2', 'Vinculo no valido !!!', '2020-09-22 16:15:12');
INSERT INTO `admin_log` VALUES ('113', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:15:19');
INSERT INTO `admin_log` VALUES ('114', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:15:25');
INSERT INTO `admin_log` VALUES ('115', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-22 16:15:27');
INSERT INTO `admin_log` VALUES ('116', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2020-09-22 16:15:34');
INSERT INTO `admin_log` VALUES ('117', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-22 16:15:37');
INSERT INTO `admin_log` VALUES ('118', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:25:57');
INSERT INTO `admin_log` VALUES ('119', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:28:15');
INSERT INTO `admin_log` VALUES ('120', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:28:25');
INSERT INTO `admin_log` VALUES ('121', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:34:26');
INSERT INTO `admin_log` VALUES ('122', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:36:32');
INSERT INTO `admin_log` VALUES ('123', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-09-22 16:38:01');
INSERT INTO `admin_log` VALUES ('124', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-09-22 19:07:14');
INSERT INTO `admin_log` VALUES ('125', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-23 18:22:36');
INSERT INTO `admin_log` VALUES ('126', '1', 'persona', 'descarga.php', 'asignar', '1', 'EXITO', '2020-09-23 18:24:00');
INSERT INTO `admin_log` VALUES ('127', '1', 'persona', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-29 18:11:07');
INSERT INTO `admin_log` VALUES ('128', '1', 'estado', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-29 18:11:18');
INSERT INTO `admin_log` VALUES ('129', '1', 'sexo', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-29 18:11:26');
INSERT INTO `admin_log` VALUES ('130', '1', 'tipo-documento', 'descarga.php', 'listar', '1', 'EXITO', '2020-09-29 18:11:46');
INSERT INTO `admin_log` VALUES ('131', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-11-06 20:56:04');
INSERT INTO `admin_log` VALUES ('132', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-11-06 21:00:36');
INSERT INTO `admin_log` VALUES ('133', '1', 'importar-usuarios', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-11-06 21:02:28');
INSERT INTO `admin_log` VALUES ('134', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 22:51:27');
INSERT INTO `admin_log` VALUES ('135', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 22:51:27');
INSERT INTO `admin_log` VALUES ('136', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 22:52:52');
INSERT INTO `admin_log` VALUES ('137', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 22:53:47');
INSERT INTO `admin_log` VALUES ('138', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 22:53:48');
INSERT INTO `admin_log` VALUES ('139', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 22:55:13');
INSERT INTO `admin_log` VALUES ('140', '1', 'gestion_maestro', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 22:57:57');
INSERT INTO `admin_log` VALUES ('141', '1', 'gestion_maestro', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 22:59:44');
INSERT INTO `admin_log` VALUES ('142', '1', 'gestion_maestro', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:03:08');
INSERT INTO `admin_log` VALUES ('143', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:03:57');
INSERT INTO `admin_log` VALUES ('144', '1', 'roles', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 23:04:36');
INSERT INTO `admin_log` VALUES ('145', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:05:24');
INSERT INTO `admin_log` VALUES ('146', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-12-28 23:06:05');
INSERT INTO `admin_log` VALUES ('147', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:06:28');
INSERT INTO `admin_log` VALUES ('148', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:06:39');
INSERT INTO `admin_log` VALUES ('149', '1', 'gestion_maestro', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:09:44');
INSERT INTO `admin_log` VALUES ('150', '1', 'gestion_maestro', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:09:58');
INSERT INTO `admin_log` VALUES ('151', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:14:04');
INSERT INTO `admin_log` VALUES ('152', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 23:14:16');
INSERT INTO `admin_log` VALUES ('153', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 23:14:16');
INSERT INTO `admin_log` VALUES ('154', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 23:15:47');
INSERT INTO `admin_log` VALUES ('155', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 23:16:38');
INSERT INTO `admin_log` VALUES ('156', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 23:18:31');
INSERT INTO `admin_log` VALUES ('157', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 23:18:43');
INSERT INTO `admin_log` VALUES ('158', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:20:21');
INSERT INTO `admin_log` VALUES ('159', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:21:00');
INSERT INTO `admin_log` VALUES ('160', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:21:05');
INSERT INTO `admin_log` VALUES ('161', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:21:09');
INSERT INTO `admin_log` VALUES ('162', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:21:15');
INSERT INTO `admin_log` VALUES ('163', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 23:21:26');
INSERT INTO `admin_log` VALUES ('164', '1', 'areas', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-28 23:42:51');
INSERT INTO `admin_log` VALUES ('165', '1', 'perfil', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-12-28 23:43:08');
INSERT INTO `admin_log` VALUES ('166', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 20:48:16');
INSERT INTO `admin_log` VALUES ('167', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 20:54:56');
INSERT INTO `admin_log` VALUES ('168', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 20:59:26');
INSERT INTO `admin_log` VALUES ('169', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:01:39');
INSERT INTO `admin_log` VALUES ('170', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:02:17');
INSERT INTO `admin_log` VALUES ('171', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:02:42');
INSERT INTO `admin_log` VALUES ('172', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:07:23');
INSERT INTO `admin_log` VALUES ('173', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:09:16');
INSERT INTO `admin_log` VALUES ('174', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:10:49');
INSERT INTO `admin_log` VALUES ('175', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:11:32');
INSERT INTO `admin_log` VALUES ('176', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:12:03');
INSERT INTO `admin_log` VALUES ('177', '1', 'vigencia', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-29 21:14:16');
INSERT INTO `admin_log` VALUES ('178', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:14:20');
INSERT INTO `admin_log` VALUES ('179', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:17:01');
INSERT INTO `admin_log` VALUES ('180', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:17:06');
INSERT INTO `admin_log` VALUES ('181', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:17:31');
INSERT INTO `admin_log` VALUES ('182', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:18:29');
INSERT INTO `admin_log` VALUES ('183', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:18:33');
INSERT INTO `admin_log` VALUES ('184', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:19:59');
INSERT INTO `admin_log` VALUES ('185', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:20:07');
INSERT INTO `admin_log` VALUES ('186', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:22:45');
INSERT INTO `admin_log` VALUES ('187', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:24:34');
INSERT INTO `admin_log` VALUES ('188', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:25:05');
INSERT INTO `admin_log` VALUES ('189', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:25:27');
INSERT INTO `admin_log` VALUES ('190', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:25:32');
INSERT INTO `admin_log` VALUES ('191', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:30:18');
INSERT INTO `admin_log` VALUES ('192', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:30:31');
INSERT INTO `admin_log` VALUES ('193', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:32:14');
INSERT INTO `admin_log` VALUES ('194', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:35:22');
INSERT INTO `admin_log` VALUES ('195', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:35:28');
INSERT INTO `admin_log` VALUES ('196', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:38:12');
INSERT INTO `admin_log` VALUES ('197', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:38:16');
INSERT INTO `admin_log` VALUES ('198', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 21:41:39');
INSERT INTO `admin_log` VALUES ('199', '1', 'gestion-maestros', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-29 21:43:27');
INSERT INTO `admin_log` VALUES ('200', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 21:43:42');
INSERT INTO `admin_log` VALUES ('201', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:02:29');
INSERT INTO `admin_log` VALUES ('202', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:02:36');
INSERT INTO `admin_log` VALUES ('203', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:04:06');
INSERT INTO `admin_log` VALUES ('204', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 22:04:12');
INSERT INTO `admin_log` VALUES ('205', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:18:02');
INSERT INTO `admin_log` VALUES ('206', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:18:37');
INSERT INTO `admin_log` VALUES ('207', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:18:52');
INSERT INTO `admin_log` VALUES ('208', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:19:13');
INSERT INTO `admin_log` VALUES ('209', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:20:16');
INSERT INTO `admin_log` VALUES ('210', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 22:20:25');
INSERT INTO `admin_log` VALUES ('211', '1', 'gestion-maestros', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-29 22:21:52');
INSERT INTO `admin_log` VALUES ('212', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:22:42');
INSERT INTO `admin_log` VALUES ('213', '1', 'gestion-maestros', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-29 22:23:42');
INSERT INTO `admin_log` VALUES ('214', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:31:32');
INSERT INTO `admin_log` VALUES ('215', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:31:58');
INSERT INTO `admin_log` VALUES ('216', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:32:01');
INSERT INTO `admin_log` VALUES ('217', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:32:45');
INSERT INTO `admin_log` VALUES ('218', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:33:49');
INSERT INTO `admin_log` VALUES ('219', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:53:27');
INSERT INTO `admin_log` VALUES ('220', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:54:16');
INSERT INTO `admin_log` VALUES ('221', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:55:16');
INSERT INTO `admin_log` VALUES ('222', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:55:47');
INSERT INTO `admin_log` VALUES ('223', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:56:44');
INSERT INTO `admin_log` VALUES ('224', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:57:31');
INSERT INTO `admin_log` VALUES ('225', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:58:59');
INSERT INTO `admin_log` VALUES ('226', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 22:59:33');
INSERT INTO `admin_log` VALUES ('227', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:00:09');
INSERT INTO `admin_log` VALUES ('228', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:01:22');
INSERT INTO `admin_log` VALUES ('229', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:02:01');
INSERT INTO `admin_log` VALUES ('230', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:03:30');
INSERT INTO `admin_log` VALUES ('231', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:03:59');
INSERT INTO `admin_log` VALUES ('232', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:06:44');
INSERT INTO `admin_log` VALUES ('233', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:07:08');
INSERT INTO `admin_log` VALUES ('234', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:08:47');
INSERT INTO `admin_log` VALUES ('235', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:08:54');
INSERT INTO `admin_log` VALUES ('236', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 23:09:11');
INSERT INTO `admin_log` VALUES ('237', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:02:41');
INSERT INTO `admin_log` VALUES ('238', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-12-30 00:02:51');
INSERT INTO `admin_log` VALUES ('239', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-12-30 00:02:52');
INSERT INTO `admin_log` VALUES ('240', '1', 'usuarios', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 00:03:02');
INSERT INTO `admin_log` VALUES ('241', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:34:32');
INSERT INTO `admin_log` VALUES ('242', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:34:36');
INSERT INTO `admin_log` VALUES ('243', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:35:10');
INSERT INTO `admin_log` VALUES ('244', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:35:14');
INSERT INTO `admin_log` VALUES ('245', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:35:34');
INSERT INTO `admin_log` VALUES ('246', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:35:58');
INSERT INTO `admin_log` VALUES ('247', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:36:09');
INSERT INTO `admin_log` VALUES ('248', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:39:19');
INSERT INTO `admin_log` VALUES ('249', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 00:39:30');
INSERT INTO `admin_log` VALUES ('250', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:39:50');
INSERT INTO `admin_log` VALUES ('251', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:40:01');
INSERT INTO `admin_log` VALUES ('252', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:43:27');
INSERT INTO `admin_log` VALUES ('253', '1', 'gestion-maestros', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 00:43:56');
INSERT INTO `admin_log` VALUES ('254', '1', 'gestion-maestros', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 00:44:11');
INSERT INTO `admin_log` VALUES ('255', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:44:31');
INSERT INTO `admin_log` VALUES ('256', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:51:51');
INSERT INTO `admin_log` VALUES ('257', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:52:12');
INSERT INTO `admin_log` VALUES ('258', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:52:45');
INSERT INTO `admin_log` VALUES ('259', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:54:28');
INSERT INTO `admin_log` VALUES ('260', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:54:54');
INSERT INTO `admin_log` VALUES ('261', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 00:55:39');
INSERT INTO `admin_log` VALUES ('262', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:04:44');
INSERT INTO `admin_log` VALUES ('263', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:05:24');
INSERT INTO `admin_log` VALUES ('264', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:05:48');
INSERT INTO `admin_log` VALUES ('265', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:06:17');
INSERT INTO `admin_log` VALUES ('266', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:06:24');
INSERT INTO `admin_log` VALUES ('267', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:08:01');
INSERT INTO `admin_log` VALUES ('268', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:08:15');
INSERT INTO `admin_log` VALUES ('269', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:08:20');
INSERT INTO `admin_log` VALUES ('270', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:08:53');
INSERT INTO `admin_log` VALUES ('271', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:08:58');
INSERT INTO `admin_log` VALUES ('272', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:10:31');
INSERT INTO `admin_log` VALUES ('273', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:10:41');
INSERT INTO `admin_log` VALUES ('274', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:10:46');
INSERT INTO `admin_log` VALUES ('275', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:14:29');
INSERT INTO `admin_log` VALUES ('276', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:14:33');
INSERT INTO `admin_log` VALUES ('277', '1', 'gestion-maestros', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 01:14:41');
INSERT INTO `admin_log` VALUES ('278', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 01:15:48');
INSERT INTO `admin_log` VALUES ('279', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-12-30 01:16:56');
INSERT INTO `admin_log` VALUES ('280', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:25:03');
INSERT INTO `admin_log` VALUES ('281', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-31 00:02:21');
INSERT INTO `admin_log` VALUES ('282', '1', 'gestion-maestros', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 00:02:28');
INSERT INTO `admin_log` VALUES ('283', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 00:03:29');
INSERT INTO `admin_log` VALUES ('284', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 00:04:54');
INSERT INTO `admin_log` VALUES ('285', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-31 00:05:06');
INSERT INTO `admin_log` VALUES ('286', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 00:05:12');
INSERT INTO `admin_log` VALUES ('287', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 00:05:32');
INSERT INTO `admin_log` VALUES ('288', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-31 00:05:37');
INSERT INTO `admin_log` VALUES ('289', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 00:05:47');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) NOT NULL,
  `padre` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `accion` varchar(60) DEFAULT 'ver',
  `orden` smallint(6) NOT NULL DEFAULT 0,
  `visible` char(1) NOT NULL DEFAULT 'S',
  `acceso` char(1) DEFAULT '1',
  `target` varchar(49) DEFAULT NULL,
  `icono` varchar(200) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`menu`),
  KEY `admin_menu_fk2_idx` (`acceso`),
  KEY `admin_menu_fk3_idx` (`padre`),
  CONSTRAINT `admin_menu_fk2` FOREIGN KEY (`acceso`) REFERENCES `admin_acceso` (`codigo`),
  CONSTRAINT `admin_menu_fk3` FOREIGN KEY (`padre`) REFERENCES `admin_menu` (`menu`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', 'inicio', null, 'Inicio', 'modulos/inicio', 'ver', '-100', 'S', '3', null, 'ti-home', '');
INSERT INTO `admin_menu` VALUES ('2', 'iniciar-sesion', null, 'Iniciar sesión', 'modulos/sesion', 'ver', '200', 'S', '2', null, 'glyphicon glyphicon-log-in', '');
INSERT INTO `admin_menu` VALUES ('31', 'administracion', 'plantilla', 'Administración', null, 'ver', '100', 'S', '7', null, 'link-icon  icon-options', '');
INSERT INTO `admin_menu` VALUES ('32', 'roles', 'administracion', 'Roles', 'modulos/admin/roles', 'ver', '1', 'S', '7', null, 'glyphicon glyphicon-random', '');
INSERT INTO `admin_menu` VALUES ('33', 'permisos-por-rol', 'administracion', 'Permisos por rol', 'modulos/admin/permisos_rol', 'ver', '1', 'S', '7', null, 'glyphicon glyphicon-ok', '');
INSERT INTO `admin_menu` VALUES ('35', 'slider', 'administracion', 'Slider (imagenes)', 'modulos/admin/slider', 'ver', '1', 'S', '8', null, null, '');
INSERT INTO `admin_menu` VALUES ('36', 'cambiar-clave', null, 'Cambiar clave', 'modulos/admin/cambiar_clave', 'ver', '999', 'S', '4', null, null, '');
INSERT INTO `admin_menu` VALUES ('45', 'cerrar-sesion', null, 'Cerrar sesión', 'modulos/sesion', 'cerrarSesion', '1000', 'N', '3', null, 'glyphicon glyphicon-log-out', '');
INSERT INTO `admin_menu` VALUES ('300', 'asistente', 'plantilla', 'Asistente', null, 'ver', '99', 'S', '7', null, 'link-icon  icon-pencil', '');
INSERT INTO `admin_menu` VALUES ('301', 'crear-formulario-crud', 'asistente', 'Crear formulario (CRUD)', 'modulos/asistente/formulario_crud', 'ver', '1', 'S', '7', null, null, '');
INSERT INTO `admin_menu` VALUES ('302', 'crear-formulario-libre', 'asistente', 'Crear formulario libre', 'modulos/asistente/formulario_libre', 'ver', '2', 'S', '1', null, null, '');
INSERT INTO `admin_menu` VALUES ('306', 'crear-reporte', 'asistente', 'Crear reporte', 'modulos/asistente/reporte', 'ver', '3', 'S', '1', null, null, '');
INSERT INTO `admin_menu` VALUES ('330', 'usuarios', 'administracion', 'Usuarios', 'modulos/admin/usuarios', 'ver', '1', 'S', '7', null, 'glyphicon glyphicon-user', '');
INSERT INTO `admin_menu` VALUES ('331', 'gestion-de-acciones', 'asistente', 'Gestión de acciones', 'modulos/asistente/gestion_acciones', 'ver', '5', 'S', '7', null, null, '');
INSERT INTO `admin_menu` VALUES ('344', 'gestion-menu', 'asistente', 'Gestion de Menu', 'modulos/asistente/gestion_menu', 'ver', '1', 'S', '7', null, null, '');
INSERT INTO `admin_menu` VALUES ('391', 'perfil', null, 'Perfil', 'modulos/perfil_usuario', 'ver', '1', 'N', '3', null, null, '');
INSERT INTO `admin_menu` VALUES ('393', 'configuracion', null, 'Configuracion', null, 'ver', '1', 'S', '7', null, 'ti-settings', '');
INSERT INTO `admin_menu` VALUES ('665', 'reportes', null, 'Reportes', null, 'ver', '12', 'N', '8', null, 'ti-printer', null);
INSERT INTO `admin_menu` VALUES ('670', 'plantilla', null, 'Plantilla', null, 'ver', '999', 'S', '7', null, 'ti-pencil-alt', '');
INSERT INTO `admin_menu` VALUES ('713', 'perfil-persona', null, 'Perfil persona', 'modulos/configuracion/perfil_persona', 'ver', '1', 'N', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('718', 'cambiar-clave-usuario', 'gestion-usuarios', 'Restaurar clave usuario', 'modulos/admin/restaurar_clave', 'ver', '8', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('719', 'importar-usuarios', 'gestion-usuarios', 'Importar usuarios', 'modulos/importar_usuarios', 'ver', '5', 'S', '7', null, 'ti-upload', null);
INSERT INTO `admin_menu` VALUES ('724', 'gestion-usuarios', null, 'Gestión Usuarios', null, 'ver', '5', 'S', '7', null, 'ti-user', null);
INSERT INTO `admin_menu` VALUES ('725', 'estado', 'configuracion', 'Estado', 'modulos/configuracion/estado', 'ver', '1', 'S', '7', null, null, 'Permite gestionar el estado de ingreso de los usuarios.');
INSERT INTO `admin_menu` VALUES ('726', 'sexo', 'configuracion', 'Sexo', 'modulos/configuracion/sexo', 'ver', '1', 'S', '7', null, null, 'Permite gestionar el listado de sexos del usuarios.');
INSERT INTO `admin_menu` VALUES ('727', 'tipo-documento', 'configuracion', 'Tipo documento', 'modulos/configuracion/tipo_documento', 'ver', '1', 'S', '7', null, null, 'Permite gestionar el listado de tipos de documentos');
INSERT INTO `admin_menu` VALUES ('730', 'persona', 'gestion-usuarios', 'Usuarios', 'modulos/gestion_usuarios/persona', 'ver', '1', 'S', '7', null, null, 'Permite gestionar el listado de usuarios de la entidad.');

-- ----------------------------
-- Table structure for admin_permiso_accion
-- ----------------------------
DROP TABLE IF EXISTS `admin_permiso_accion`;
CREATE TABLE `admin_permiso_accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` int(11) NOT NULL,
  `accion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permiso_accion_fk1_idx` (`rol`),
  KEY `admin_permiso_accion_fk2_idx` (`accion`),
  CONSTRAINT `admin_permiso_accion_fk1` FOREIGN KEY (`rol`) REFERENCES `admin_rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_permiso_accion_fk2` FOREIGN KEY (`accion`) REFERENCES `admin_accion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11899 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_permiso_accion
-- ----------------------------
INSERT INTO `admin_permiso_accion` VALUES ('8652', '1', '1864');
INSERT INTO `admin_permiso_accion` VALUES ('8653', '1', '1863');
INSERT INTO `admin_permiso_accion` VALUES ('8654', '1', '1867');
INSERT INTO `admin_permiso_accion` VALUES ('8655', '1', '1133');
INSERT INTO `admin_permiso_accion` VALUES ('8656', '1', '1135');
INSERT INTO `admin_permiso_accion` VALUES ('8657', '1', '1137');
INSERT INTO `admin_permiso_accion` VALUES ('8658', '1', '1139');
INSERT INTO `admin_permiso_accion` VALUES ('8659', '1', '1140');
INSERT INTO `admin_permiso_accion` VALUES ('8660', '1', '1855');
INSERT INTO `admin_permiso_accion` VALUES ('8661', '1', '1857');
INSERT INTO `admin_permiso_accion` VALUES ('8662', '1', '1856');
INSERT INTO `admin_permiso_accion` VALUES ('8663', '1', '1860');
INSERT INTO `admin_permiso_accion` VALUES ('11438', '1', '3372');
INSERT INTO `admin_permiso_accion` VALUES ('11439', '1', '3373');
INSERT INTO `admin_permiso_accion` VALUES ('11440', '1', '3374');
INSERT INTO `admin_permiso_accion` VALUES ('11441', '1', '3375');
INSERT INTO `admin_permiso_accion` VALUES ('11442', '1', '3376');
INSERT INTO `admin_permiso_accion` VALUES ('11443', '1', '3377');
INSERT INTO `admin_permiso_accion` VALUES ('11655', '1', '3408');
INSERT INTO `admin_permiso_accion` VALUES ('11656', '1', '3409');
INSERT INTO `admin_permiso_accion` VALUES ('11657', '1', '3410');
INSERT INTO `admin_permiso_accion` VALUES ('11658', '1', '3411');
INSERT INTO `admin_permiso_accion` VALUES ('11659', '1', '3412');
INSERT INTO `admin_permiso_accion` VALUES ('11737', '4', '3372');
INSERT INTO `admin_permiso_accion` VALUES ('11738', '4', '3374');
INSERT INTO `admin_permiso_accion` VALUES ('11739', '4', '3373');
INSERT INTO `admin_permiso_accion` VALUES ('11740', '4', '3377');
INSERT INTO `admin_permiso_accion` VALUES ('11757', '4', '3409');
INSERT INTO `admin_permiso_accion` VALUES ('11758', '4', '3412');
INSERT INTO `admin_permiso_accion` VALUES ('11759', '4', '3410');
INSERT INTO `admin_permiso_accion` VALUES ('11760', '4', '3411');
INSERT INTO `admin_permiso_accion` VALUES ('11761', '4', '3408');
INSERT INTO `admin_permiso_accion` VALUES ('11762', '4', '1910');
INSERT INTO `admin_permiso_accion` VALUES ('11763', '4', '1912');
INSERT INTO `admin_permiso_accion` VALUES ('11764', '4', '1911');
INSERT INTO `admin_permiso_accion` VALUES ('11765', '4', '1915');
INSERT INTO `admin_permiso_accion` VALUES ('11766', '4', '1864');
INSERT INTO `admin_permiso_accion` VALUES ('11767', '4', '1863');
INSERT INTO `admin_permiso_accion` VALUES ('11768', '4', '1867');
INSERT INTO `admin_permiso_accion` VALUES ('11769', '4', '1133');
INSERT INTO `admin_permiso_accion` VALUES ('11770', '4', '1135');
INSERT INTO `admin_permiso_accion` VALUES ('11771', '4', '1137');
INSERT INTO `admin_permiso_accion` VALUES ('11772', '4', '1139');
INSERT INTO `admin_permiso_accion` VALUES ('11773', '4', '1140');
INSERT INTO `admin_permiso_accion` VALUES ('11774', '4', '1855');
INSERT INTO `admin_permiso_accion` VALUES ('11775', '4', '1857');
INSERT INTO `admin_permiso_accion` VALUES ('11776', '4', '1856');
INSERT INTO `admin_permiso_accion` VALUES ('11777', '4', '1860');
INSERT INTO `admin_permiso_accion` VALUES ('11778', '4', '3406');
INSERT INTO `admin_permiso_accion` VALUES ('11779', '4', '3407');
INSERT INTO `admin_permiso_accion` VALUES ('11780', '4', '3405');
INSERT INTO `admin_permiso_accion` VALUES ('11781', '1', '3439');
INSERT INTO `admin_permiso_accion` VALUES ('11782', '1', '3440');
INSERT INTO `admin_permiso_accion` VALUES ('11783', '1', '3441');
INSERT INTO `admin_permiso_accion` VALUES ('11784', '1', '3442');
INSERT INTO `admin_permiso_accion` VALUES ('11785', '1', '3443');
INSERT INTO `admin_permiso_accion` VALUES ('11786', '1', '3444');
INSERT INTO `admin_permiso_accion` VALUES ('11788', '4', '3439');
INSERT INTO `admin_permiso_accion` VALUES ('11789', '4', '3440');
INSERT INTO `admin_permiso_accion` VALUES ('11790', '4', '3441');
INSERT INTO `admin_permiso_accion` VALUES ('11791', '4', '3442');
INSERT INTO `admin_permiso_accion` VALUES ('11792', '4', '3443');
INSERT INTO `admin_permiso_accion` VALUES ('11793', '4', '3444');
INSERT INTO `admin_permiso_accion` VALUES ('11795', '1', '3445');
INSERT INTO `admin_permiso_accion` VALUES ('11796', '1', '3446');
INSERT INTO `admin_permiso_accion` VALUES ('11797', '1', '3447');
INSERT INTO `admin_permiso_accion` VALUES ('11798', '1', '3448');
INSERT INTO `admin_permiso_accion` VALUES ('11799', '1', '3449');
INSERT INTO `admin_permiso_accion` VALUES ('11800', '1', '3450');
INSERT INTO `admin_permiso_accion` VALUES ('11802', '4', '3445');
INSERT INTO `admin_permiso_accion` VALUES ('11803', '4', '3446');
INSERT INTO `admin_permiso_accion` VALUES ('11804', '4', '3447');
INSERT INTO `admin_permiso_accion` VALUES ('11805', '4', '3448');
INSERT INTO `admin_permiso_accion` VALUES ('11806', '4', '3449');
INSERT INTO `admin_permiso_accion` VALUES ('11807', '4', '3450');
INSERT INTO `admin_permiso_accion` VALUES ('11809', '1', '3451');
INSERT INTO `admin_permiso_accion` VALUES ('11810', '1', '3452');
INSERT INTO `admin_permiso_accion` VALUES ('11811', '1', '3453');
INSERT INTO `admin_permiso_accion` VALUES ('11812', '1', '3454');
INSERT INTO `admin_permiso_accion` VALUES ('11813', '1', '3455');
INSERT INTO `admin_permiso_accion` VALUES ('11814', '1', '3456');
INSERT INTO `admin_permiso_accion` VALUES ('11816', '4', '3451');
INSERT INTO `admin_permiso_accion` VALUES ('11817', '4', '3452');
INSERT INTO `admin_permiso_accion` VALUES ('11818', '4', '3453');
INSERT INTO `admin_permiso_accion` VALUES ('11819', '4', '3454');
INSERT INTO `admin_permiso_accion` VALUES ('11820', '4', '3455');
INSERT INTO `admin_permiso_accion` VALUES ('11821', '4', '3456');
INSERT INTO `admin_permiso_accion` VALUES ('11851', '1', '3469');
INSERT INTO `admin_permiso_accion` VALUES ('11852', '1', '3470');
INSERT INTO `admin_permiso_accion` VALUES ('11853', '1', '3471');
INSERT INTO `admin_permiso_accion` VALUES ('11854', '1', '3472');
INSERT INTO `admin_permiso_accion` VALUES ('11855', '1', '3473');
INSERT INTO `admin_permiso_accion` VALUES ('11856', '1', '3474');
INSERT INTO `admin_permiso_accion` VALUES ('11858', '4', '3469');
INSERT INTO `admin_permiso_accion` VALUES ('11859', '4', '3470');
INSERT INTO `admin_permiso_accion` VALUES ('11860', '4', '3471');
INSERT INTO `admin_permiso_accion` VALUES ('11861', '4', '3472');
INSERT INTO `admin_permiso_accion` VALUES ('11862', '4', '3473');
INSERT INTO `admin_permiso_accion` VALUES ('11863', '4', '3474');

-- ----------------------------
-- Table structure for admin_permiso_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permiso_menu`;
CREATE TABLE `admin_permiso_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`rol`,`menu`),
  KEY `admin_menu_rol_fk2_idx` (`menu`)
) ENGINE=InnoDB AUTO_INCREMENT=3430 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_permiso_menu
-- ----------------------------
INSERT INTO `admin_permiso_menu` VALUES ('2420', '1', 'actividades');
INSERT INTO `admin_permiso_menu` VALUES ('2223', '1', 'administracion');
INSERT INTO `admin_permiso_menu` VALUES ('2219', '1', 'asistente');
INSERT INTO `admin_permiso_menu` VALUES ('3089', '1', 'barrios');
INSERT INTO `admin_permiso_menu` VALUES ('2412', '1', 'categorias');
INSERT INTO `admin_permiso_menu` VALUES ('3091', '1', 'centros-poblados');
INSERT INTO `admin_permiso_menu` VALUES ('2204', '1', 'configuracion');
INSERT INTO `admin_permiso_menu` VALUES ('3388', '1', 'contratos');
INSERT INTO `admin_permiso_menu` VALUES ('2590', '1', 'crear-evento');
INSERT INTO `admin_permiso_menu` VALUES ('2220', '1', 'crear-formulario-crud');
INSERT INTO `admin_permiso_menu` VALUES ('2580', '1', 'crear-grupo');
INSERT INTO `admin_permiso_menu` VALUES ('2592', '1', 'crear-reunion');
INSERT INTO `admin_permiso_menu` VALUES ('2584', '1', 'crear-subgrupo');
INSERT INTO `admin_permiso_menu` VALUES ('3307', '1', 'dependencia');
INSERT INTO `admin_permiso_menu` VALUES ('2582', '1', 'editar-usuarios-grupo');
INSERT INTO `admin_permiso_menu` VALUES ('2586', '1', 'editar-usuarios-subgrupo');
INSERT INTO `admin_permiso_menu` VALUES ('3299', '1', 'entrega-de-materiales');
INSERT INTO `admin_permiso_menu` VALUES ('2588', '1', 'enviar_correo');
INSERT INTO `admin_permiso_menu` VALUES ('2355', '1', 'estado');
INSERT INTO `admin_permiso_menu` VALUES ('2343', '1', 'funciones-moviles');
INSERT INTO `admin_permiso_menu` VALUES ('2222', '1', 'gestion-de-acciones');
INSERT INTO `admin_permiso_menu` VALUES ('3109', '1', 'gestion-grupos');
INSERT INTO `admin_permiso_menu` VALUES ('3427', '1', 'gestion-maestros');
INSERT INTO `admin_permiso_menu` VALUES ('2221', '1', 'gestion-menu');
INSERT INTO `admin_permiso_menu` VALUES ('2418', '1', 'gestion-necesidades');
INSERT INTO `admin_permiso_menu` VALUES ('3113', '1', 'gestion-subgrupos');
INSERT INTO `admin_permiso_menu` VALUES ('3425', '1', 'gestion_maestro');
INSERT INTO `admin_permiso_menu` VALUES ('3311', '1', 'grupo');
INSERT INTO `admin_permiso_menu` VALUES ('3103', '1', 'grupos');
INSERT INTO `admin_permiso_menu` VALUES ('2410', '1', 'importador-general');
INSERT INTO `admin_permiso_menu` VALUES ('3382', '1', 'importar-usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('3017', '1', 'listado-asistencia');
INSERT INTO `admin_permiso_menu` VALUES ('2876', '1', 'listado-compromiso');
INSERT INTO `admin_permiso_menu` VALUES ('2600', '1', 'listado-egresos');
INSERT INTO `admin_permiso_menu` VALUES ('2598', '1', 'listado-ingresos');
INSERT INTO `admin_permiso_menu` VALUES ('2870', '1', 'listado-necesidad-comunidad');
INSERT INTO `admin_permiso_menu` VALUES ('2708', '1', 'listado-obsequios');
INSERT INTO `admin_permiso_menu` VALUES ('2400', '1', 'listado-requerimiento');
INSERT INTO `admin_permiso_menu` VALUES ('2416', '1', 'listado-usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('2353', '1', 'nivel-escolaridad');
INSERT INTO `admin_permiso_menu` VALUES ('3289', '1', 'obsequios');
INSERT INTO `admin_permiso_menu` VALUES ('3101', '1', 'ocupaciones');
INSERT INTO `admin_permiso_menu` VALUES ('3319', '1', 'oficina');
INSERT INTO `admin_permiso_menu` VALUES ('3313', '1', 'perfil-persona');
INSERT INTO `admin_permiso_menu` VALUES ('2225', '1', 'permisos-por-rol');
INSERT INTO `admin_permiso_menu` VALUES ('3321', '1', 'persona');
INSERT INTO `admin_permiso_menu` VALUES ('3301', '1', 'personas-obsequios');
INSERT INTO `admin_permiso_menu` VALUES ('2357', '1', 'prioridad');
INSERT INTO `admin_permiso_menu` VALUES ('2874', '1', 'registrar-compromiso');
INSERT INTO `admin_permiso_menu` VALUES ('3269', '1', 'registrar-donacion-interna');
INSERT INTO `admin_permiso_menu` VALUES ('3273', '1', 'registrar-donacion-persona-juridica');
INSERT INTO `admin_permiso_menu` VALUES ('3271', '1', 'registrar-donacion-persona-natural');
INSERT INTO `admin_permiso_menu` VALUES ('3287', '1', 'registrar-egresos-persona-juridica');
INSERT INTO `admin_permiso_menu` VALUES ('3285', '1', 'registrar-egresos-persona-natural');
INSERT INTO `admin_permiso_menu` VALUES ('3283', '1', 'registrar-egresos-usuarios-internos');
INSERT INTO `admin_permiso_menu` VALUES ('3275', '1', 'registrar-ingreso-persona-juridica');
INSERT INTO `admin_permiso_menu` VALUES ('3277', '1', 'registrar-ingreso-persona-natural');
INSERT INTO `admin_permiso_menu` VALUES ('3279', '1', 'registrar-ingreso-usuarios-internos');
INSERT INTO `admin_permiso_menu` VALUES ('2868', '1', 'registrar-necesidad-comunidad');
INSERT INTO `admin_permiso_menu` VALUES ('2398', '1', 'registrar-requerimiento');
INSERT INTO `admin_permiso_menu` VALUES ('3099', '1', 'registro-votantes');
INSERT INTO `admin_permiso_menu` VALUES ('2572', '1', 'relacionar-colaboradores');
INSERT INTO `admin_permiso_menu` VALUES ('2574', '1', 'relacionar-coordinadores');
INSERT INTO `admin_permiso_menu` VALUES ('2576', '1', 'relacionar-dirigentes');
INSERT INTO `admin_permiso_menu` VALUES ('2578', '1', 'relacionar-empleados');
INSERT INTO `admin_permiso_menu` VALUES ('2224', '1', 'roles');
INSERT INTO `admin_permiso_menu` VALUES ('2878', '1', 'seguimiento-compromiso');
INSERT INTO `admin_permiso_menu` VALUES ('2872', '1', 'seguimiento-necesidad-comunidad');
INSERT INTO `admin_permiso_menu` VALUES ('2886', '1', 'sexo');
INSERT INTO `admin_permiso_menu` VALUES ('2888', '1', 'si-no');
INSERT INTO `admin_permiso_menu` VALUES ('3111', '1', 'subgrupos');
INSERT INTO `admin_permiso_menu` VALUES ('3087', '1', 'tipo-candidato');
INSERT INTO `admin_permiso_menu` VALUES ('2347', '1', 'tipo-documento');
INSERT INTO `admin_permiso_menu` VALUES ('2359', '1', 'tipo-donacion');
INSERT INTO `admin_permiso_menu` VALUES ('3085', '1', 'tipo-grupo');
INSERT INTO `admin_permiso_menu` VALUES ('3293', '1', 'tipo-obsequios');
INSERT INTO `admin_permiso_menu` VALUES ('2226', '1', 'usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('3097', '1', 'votara-por_nosotros');
INSERT INTO `admin_permiso_menu` VALUES ('3408', '4', 'administracion');
INSERT INTO `admin_permiso_menu` VALUES ('3404', '4', 'asistente');
INSERT INTO `admin_permiso_menu` VALUES ('3412', '4', 'cambiar-clave-usuario');
INSERT INTO `admin_permiso_menu` VALUES ('3390', '4', 'configuracion');
INSERT INTO `admin_permiso_menu` VALUES ('3398', '4', 'contratos');
INSERT INTO `admin_permiso_menu` VALUES ('3405', '4', 'crear-formulario-crud');
INSERT INTO `admin_permiso_menu` VALUES ('3396', '4', 'dependencia');
INSERT INTO `admin_permiso_menu` VALUES ('3393', '4', 'estado');
INSERT INTO `admin_permiso_menu` VALUES ('3407', '4', 'gestion-de-acciones');
INSERT INTO `admin_permiso_menu` VALUES ('3429', '4', 'gestion-maestros');
INSERT INTO `admin_permiso_menu` VALUES ('3406', '4', 'gestion-menu');
INSERT INTO `admin_permiso_menu` VALUES ('3401', '4', 'gestion-usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('3426', '4', 'gestion_maestro');
INSERT INTO `admin_permiso_menu` VALUES ('3394', '4', 'grupo');
INSERT INTO `admin_permiso_menu` VALUES ('3400', '4', 'importar-usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('3397', '4', 'oficina');
INSERT INTO `admin_permiso_menu` VALUES ('3395', '4', 'perfil-persona');
INSERT INTO `admin_permiso_menu` VALUES ('3410', '4', 'permisos-por-rol');
INSERT INTO `admin_permiso_menu` VALUES ('3399', '4', 'persona');
INSERT INTO `admin_permiso_menu` VALUES ('3403', '4', 'plantilla');
INSERT INTO `admin_permiso_menu` VALUES ('3402', '4', 'reportes');
INSERT INTO `admin_permiso_menu` VALUES ('3409', '4', 'roles');
INSERT INTO `admin_permiso_menu` VALUES ('3391', '4', 'sexo');
INSERT INTO `admin_permiso_menu` VALUES ('3392', '4', 'tipo-documento');
INSERT INTO `admin_permiso_menu` VALUES ('3411', '4', 'usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('3428', '5', 'gestion-maestros');

-- ----------------------------
-- Table structure for admin_psesion
-- ----------------------------
DROP TABLE IF EXISTS `admin_psesion`;
CREATE TABLE `admin_psesion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(45) NOT NULL,
  `old_session_id` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) NOT NULL,
  `refer` varchar(500) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `inico` datetime NOT NULL,
  `fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_psesion
-- ----------------------------
INSERT INTO `admin_psesion` VALUES ('15', 'ooe7t2ofafsii3csugf8muq4g3', '68dljgfik6lsli1o38haa7u32t', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/HEAVEN/', '::1', '2018-10-23 17:18:12', '2018-10-23 19:04:49');
INSERT INTO `admin_psesion` VALUES ('16', 'nf7e7qn8allmdufvqsfc2ospb8', 'ooe7t2ofafsii3csugf8muq4g3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/perfil', '::1', '2018-10-23 19:04:49', '2018-10-23 19:05:42');
INSERT INTO `admin_psesion` VALUES ('17', 'lot81gpqnovle0emqkbb3unqa5', 'nf7e7qn8allmdufvqsfc2ospb8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/', '::1', '2018-10-23 19:05:42', '2018-10-23 19:33:04');
INSERT INTO `admin_psesion` VALUES ('18', 'fo3a79u1r8u3r3qtadjfgfabg4', 'lot81gpqnovle0emqkbb3unqa5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/inicio', '::1', '2018-10-23 19:33:04', '2018-10-24 09:52:51');
INSERT INTO `admin_psesion` VALUES ('19', 's2jpppgbcl2ehmilj3rsiiqkac', 'fo3a79u1r8u3r3qtadjfgfabg4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/inicio', '::1', '2018-10-24 09:52:51', '2018-10-24 15:00:02');
INSERT INTO `admin_psesion` VALUES ('20', 't7600ifllbarmd1b51feq7284d', 's2jpppgbcl2ehmilj3rsiiqkac', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/inicio', '::1', '2018-10-24 15:00:02', '2018-10-29 17:11:55');
INSERT INTO `admin_psesion` VALUES ('21', 'f76ruci47c8tqe0p7p8sf0k00m', 'fb2k0t4du8oev06vobqimn8hrc', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/general/', '::1', '2018-10-29 17:27:49', '2019-11-18 14:44:08');
INSERT INTO `admin_psesion` VALUES ('22', 'r4g9aucurorenq055e2p16tle4', 'f76ruci47c8tqe0p7p8sf0k00m', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/', '::1', '2018-10-29 17:29:18', '2018-10-29 17:29:18');
INSERT INTO `admin_psesion` VALUES ('23', 'vmpk157ubo8malon2qmn3jptii', '4ed0kkk939uscr0l2jo416o7mm', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'http://localhost/GENERAL/persona', '::1', '2018-10-31 17:29:01', '2019-11-29 11:59:52');
INSERT INTO `admin_psesion` VALUES ('24', '1ov2u9ruta4qb4rktbcrvpg01e', 'm5l8n4u9qkvhc4cqebof059og3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 'http://localhost/general/perfil', '::1', '2018-11-22 14:21:58', '2019-12-12 11:11:32');
INSERT INTO `admin_psesion` VALUES ('25', 'dhnekef4vn2rre9jvril677nql', 'hm408qfgq9ktf5bonji658s0qs', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', 'http://localhost/GENERAL/importar-usuarios', '::1', '2018-11-26 18:57:00', '2018-11-26 18:57:00');
INSERT INTO `admin_psesion` VALUES ('26', 'l9j9fekm426djuhak9pa0k49i5', 'bg3hu96epc7dh6tlq7o8g7atq2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', 'http://localhost/general/', '::1', '2019-02-15 15:23:02', '2019-02-15 15:23:02');
INSERT INTO `admin_psesion` VALUES ('27', 'r13noeuq8vaeoca86c49vkj560', 'tjqu1nmqohon8sqk7vieibgphe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', 'http://localhost/general/', '::1', '2019-02-15 15:25:44', '2019-12-20 11:15:48');
INSERT INTO `admin_psesion` VALUES ('28', 'pobom1gvcorf403fhjm0m790f1', 'bq1cagcj64qu0a6iv9lkvarib4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 'http://localhost/GENERAL/', '::1', '2019-03-19 10:42:15', '2019-03-19 10:42:15');
INSERT INTO `admin_psesion` VALUES ('29', 's0nvgpp054pnoj58bjbeu8a0o7', 'b5q11s2u8trrnhl9evo7ec2tt3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 'http://ct.anla.gov.co/general/persona', '172.16.17.72', '2019-11-06 15:49:33', '2019-11-06 15:49:34');
INSERT INTO `admin_psesion` VALUES ('30', 'kr2km8adiektqa4eqclbt944i5', '9mm6l731f3m6950r5su7e8khb6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'http://ct.anla.gov.co/general/persona', '172.16.15.103', '2019-12-26 14:58:09', '2019-12-26 15:06:43');
INSERT INTO `admin_psesion` VALUES ('31', 'me9htqrfqlirbfjqmbl2a9hljq', 'me9htqrfqlirbfjqmbl2a9hljq', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'http://localhost/general/importar-usuarios', '::1', '2020-09-23 10:02:52', '2020-09-23 18:24:15');
INSERT INTO `admin_psesion` VALUES ('32', 'me9htqrfqlirbfjqmbl2a9hljq', 'me9htqrfqlirbfjqmbl2a9hljq', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'http://localhost/general/', '::1', '2020-09-29 18:10:48', '2020-09-29 18:11:46');
INSERT INTO `admin_psesion` VALUES ('33', 'tgtevu12fmslbvfulh2cnakf4g', 'tgtevu12fmslbvfulh2cnakf4g', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'http://localhost/general/', '::1', '2020-11-06 20:54:53', '2020-11-06 21:02:28');
INSERT INTO `admin_psesion` VALUES ('34', 'ivnc4v4c28d75b68rnc64vi92a', 'ivnc4v4c28d75b68rnc64vi92a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/gestion-de-acciones', '::1', '2020-12-28 22:51:07', '2020-12-28 23:43:08');
INSERT INTO `admin_psesion` VALUES ('35', 'arbtibaec21fsc57hhjl44m41v', 'arbtibaec21fsc57hhjl44m41v', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/gestion-maestros', '::1', '2020-12-30 00:02:39', '2020-12-30 01:16:56');
INSERT INTO `admin_psesion` VALUES ('36', 'fjvc41tu4amkbnb4s4lc949cso', 'fjvc41tu4amkbnb4s4lc949cso', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/editor-codigos', '::1', '2020-12-31 00:02:21', '2020-12-31 00:05:58');

-- ----------------------------
-- Table structure for admin_rol
-- ----------------------------
DROP TABLE IF EXISTS `admin_rol`;
CREATE TABLE `admin_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `_usuario` varchar(45) DEFAULT NULL,
  `_fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_rol
-- ----------------------------
INSERT INTO `admin_rol` VALUES ('1', 'ADMINISTRADOR', '99999', '2014-06-01 13:54:29');
INSERT INTO `admin_rol` VALUES ('4', 'SUPER ADMIN', '1077461284', '2017-01-03 19:02:36');
INSERT INTO `admin_rol` VALUES ('5', 'MAESTRO', '1077461284', '2020-12-28 23:04:36');

-- ----------------------------
-- Table structure for admin_sesion
-- ----------------------------
DROP TABLE IF EXISTS `admin_sesion`;
CREATE TABLE `admin_sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) NOT NULL,
  `session_id` varchar(45) NOT NULL,
  `refer` varchar(500) NOT NULL,
  `user_agent` varchar(500) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `salida` char(1) NOT NULL,
  `jaz` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `index2` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_sesion
-- ----------------------------
INSERT INTO `admin_sesion` VALUES ('19', '1077461284', '68dljgfik6lsli1o38haa7u32t', 'http://localhost/HEAVEN/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-23 17:18:02', '2018-10-23 17:18:02', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('20', '1077461284', 'ooe7t2ofafsii3csugf8muq4g3', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-23 17:21:15', '2018-10-23 17:21:15', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('21', '1077461284', 'nf7e7qn8allmdufvqsfc2ospb8', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-23 19:04:57', '2018-10-23 19:04:57', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('22', '1077461284', 'lot81gpqnovle0emqkbb3unqa5', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-23 19:24:36', '2018-10-23 19:24:36', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('23', '1077461284', 'fo3a79u1r8u3r3qtadjfgfabg4', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-24 08:29:10', '2018-10-24 08:29:10', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('24', '1077461284', 'emr9cm6vkhv6ca02v0hdg6hb0l', 'http://localhost/GENERAL/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '::1', '2018-10-24 08:31:16', '2018-10-24 08:31:16', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('25', '1077461284', 's2jpppgbcl2ehmilj3rsiiqkac', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-24 09:53:01', '2018-10-24 09:53:01', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('26', '1077461284', 't7600ifllbarmd1b51feq7284d', 'http://localhost/base_plantilla/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-29 17:08:26', '2018-10-29 17:08:26', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('27', '1077461284', 'fb2k0t4du8oev06vobqimn8hrc', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-29 17:27:44', '2018-10-29 17:27:44', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('28', '1077461284', 'f76ruci47c8tqe0p7p8sf0k00m', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '2018-10-29 17:29:15', '2018-10-29 17:29:15', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('29', '1077461284', 'hm4l30s42cn7qifknqfr6a6jmj', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '::1', '2018-11-30 17:03:26', '2018-11-30 17:03:26', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('30', '1077461284', '0quu4svn7kc76fi076g0elvm0f', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-14 09:27:49', '2019-01-14 09:27:49', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('31', '1077461284', '7e7l6g6dta5q4a3m4l9qiv1t2q', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-02-14 12:17:58', '2019-02-14 12:17:58', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('32', '1077461284', 'tjqu1nmqohon8sqk7vieibgphe', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '::1', '2019-02-15 15:20:52', '2019-02-15 15:20:52', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('33', '1077461284', 'r13noeuq8vaeoca86c49vkj560', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '::1', '2019-02-15 16:23:51', '2019-02-15 16:23:51', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('34', '1077461284', 'rn7nq18i1uupd4bb3rqiojui3u', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '::1', '2019-03-18 09:37:57', '2019-03-18 09:37:57', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('35', '1077461284', 'bq1cagcj64qu0a6iv9lkvarib4', 'http://localhost/GENERAL/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '::1', '2019-03-19 10:41:43', '2019-03-19 10:41:43', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('36', '1077461284', 'jpu5o1t5mpq0fmmjibvgskp916', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '172.16.13.91', '2019-03-28 07:42:58', '2019-03-28 07:42:58', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('37', '1077461284', '4ve5q6km76783n2kcha4j2lfo0', 'http://ct.anla.gov.co/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '172.16.13.130', '2019-10-03 16:46:58', '2019-10-03 16:46:58', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('38', '1077461284', 'hbf445r3aoa59ts2vvcgrhqiq3', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.13.130', '2019-10-24 14:11:42', '2019-10-24 14:11:42', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('39', '1077461284', '0ja3vne4006fqqsa2qeniijca2', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.18.99', '2019-10-24 14:56:28', '2019-10-24 14:56:28', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('40', '1077461284', '8g2rf28pjvopcp1dc83280nj06', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.13.130', '2019-10-24 15:39:49', '2019-10-24 15:39:49', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('41', '1077461284', 'j5gmjd5drnhku4mq4hdivplp34', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.13.130', '2019-10-28 08:52:32', '2019-10-28 08:52:32', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('42', '1077461284', 'nhv72hkhslbhjrv5annhbl3da1', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.19.127', '2019-10-30 15:51:23', '2019-10-30 15:51:23', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('43', '1077461284', '8fi7ihvar4p574qlaikfb8lo50', 'http://ct.anla.gov.co/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36', '172.16.19.193', '2019-11-01 12:02:16', '2019-11-01 12:02:16', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('44', '1077461284', 'b5q11s2u8trrnhl9evo7ec2tt3', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', '172.16.17.72', '2019-11-06 15:48:32', '2019-11-06 15:48:32', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('45', '1077461284', 'ebicmolenmu92tmr9locp3et64', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '172.16.13.130', '2019-11-12 17:44:02', '2019-11-12 17:44:02', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('46', '1077461284', 'emvpng53h0lq3f7sp13jfnudf1', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '172.16.17.57', '2019-11-14 08:48:47', '2019-11-14 08:48:47', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('47', '1077461284', '1v4lcuhl7i1om7a5hahu762ec6', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '172.16.13.130', '2019-11-14 10:44:50', '2019-11-14 10:44:50', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('48', '1077461284', 'eovlhfp4pm1757e7d8dhspgdm3', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '172.16.13.130', '2019-11-20 14:39:29', '2019-11-20 14:39:29', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('49', '1077461284', '2jnd7ge012674i2bn3btqhh640', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '181.57.248.245', '2019-11-27 15:23:31', '2019-11-27 15:23:31', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('50', '1077461284', 'ra654u4i3i45ohp01vhu9v5a86', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '181.57.248.245', '2019-12-06 17:36:05', '2019-12-06 17:36:05', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('51', '1077461284', 'lll0vgcmmbnfhnt794qltn1ej6', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.4.26', '2019-12-19 08:09:27', '2019-12-19 08:09:27', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('52', '1077461284', '9mm6l731f3m6950r5su7e8khb6', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.15.103', '2019-12-26 14:55:37', '2019-12-26 14:55:37', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('53', '1077461284', 'jid52o04pruh26b3n4lh5c29s7', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.13.130', '2019-12-27 16:12:11', '2019-12-27 16:12:11', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('54', '1077461284', 'me9htqrfqlirbfjqmbl2a9hljq', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', '::1', '2020-09-22 12:18:36', '2020-09-22 12:18:36', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('55', '1077461284', 'me9htqrfqlirbfjqmbl2a9hljq', 'http://localhost/general/importar-usuarios', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', '::1', '2020-09-23 10:02:52', '2020-09-23 10:02:52', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('56', '1077461284', 'me9htqrfqlirbfjqmbl2a9hljq', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', '::1', '2020-09-29 18:10:48', '2020-09-29 18:10:48', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('57', '1077461284', 'tgtevu12fmslbvfulh2cnakf4g', 'http://localhost/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '::1', '2020-11-06 20:54:52', '2020-11-06 20:54:52', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('58', '1077461284', 'ivnc4v4c28d75b68rnc64vi92a', 'http://localhost/SOCRATES/gestion-de-acciones', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-28 22:51:07', '2020-12-28 22:51:07', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('59', '1077461284', 'arbtibaec21fsc57hhjl44m41v', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-29 20:47:54', '2020-12-29 20:47:54', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('60', '1077461284', 'arbtibaec21fsc57hhjl44m41v', 'http://localhost/SOCRATES/gestion-maestros', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-30 00:02:39', '2020-12-30 00:02:39', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('61', '1077461284', 'fjvc41tu4amkbnb4s4lc949cso', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-30 16:24:55', '2020-12-30 16:24:55', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('62', '1077461284', 'fjvc41tu4amkbnb4s4lc949cso', 'http://localhost/SOCRATES/editor-codigos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-31 00:02:21', '2020-12-31 00:02:21', 'N', '1');

-- ----------------------------
-- Table structure for admin_sesion_denegada
-- ----------------------------
DROP TABLE IF EXISTS `admin_sesion_denegada`;
CREATE TABLE `admin_sesion_denegada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_sesion_denegada
-- ----------------------------
INSERT INTO `admin_sesion_denegada` VALUES ('3', '1212', '2018-10-23 19:05:48', 'lot81gpqnovle0emqkbb3unqa5', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('4', '111', '2018-10-23 19:06:23', 'lot81gpqnovle0emqkbb3unqa5', 'http://localhost/GENERAL/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('5', 'JSANCHEZ', '2019-12-26 15:06:03', 'kr2km8adiektqa4eqclbt944i5', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.15.103', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('6', 'JSANCHEZ', '2019-12-26 15:06:15', 'kr2km8adiektqa4eqclbt944i5', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.15.103', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('7', 'JSANCHEZ', '2019-12-26 15:06:28', 'kr2km8adiektqa4eqclbt944i5', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.15.103', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('8', 'JSANCHEZ', '2019-12-26 15:06:43', 'kr2km8adiektqa4eqclbt944i5', 'http://ct.anla.gov.co/general/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '172.16.15.103', '1');

-- ----------------------------
-- Table structure for admin_tipo_accion
-- ----------------------------
DROP TABLE IF EXISTS `admin_tipo_accion`;
CREATE TABLE `admin_tipo_accion` (
  `codigo` varchar(50) NOT NULL,
  `archivo` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_tipo_accion
-- ----------------------------
INSERT INTO `admin_tipo_accion` VALUES ('descarga', 'descarga.php');
INSERT INTO `admin_tipo_accion` VALUES ('html', 'descarga.php');
INSERT INTO `admin_tipo_accion` VALUES ('json', 'descarga.php');
INSERT INTO `admin_tipo_accion` VALUES ('pagina', 'pagina.php');
INSERT INTO `admin_tipo_accion` VALUES ('texto', 'descarga.php');

-- ----------------------------
-- Table structure for admin_tipo_denegacion
-- ----------------------------
DROP TABLE IF EXISTS `admin_tipo_denegacion`;
CREATE TABLE `admin_tipo_denegacion` (
  `codigo` char(1) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_tipo_denegacion
-- ----------------------------
INSERT INTO `admin_tipo_denegacion` VALUES ('1', 'Usuario o clave incorrecta');
INSERT INTO `admin_tipo_denegacion` VALUES ('2', 'No tiene rol para este aplicativo');
INSERT INTO `admin_tipo_denegacion` VALUES ('3', 'Ya habia iniciado sesión previamente');
INSERT INTO `admin_tipo_denegacion` VALUES ('4', 'Error de validación');
INSERT INTO `admin_tipo_denegacion` VALUES ('5', 'Error al crear la sesion en la base de datos');

-- ----------------------------
-- Table structure for admin_usuario
-- ----------------------------
DROP TABLE IF EXISTS `admin_usuario`;
CREATE TABLE `admin_usuario` (
  `persona_id` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  `_usuario` varchar(15) NOT NULL,
  `_fecha` datetime NOT NULL,
  PRIMARY KEY (`persona_id`),
  KEY `admin_usuario_fk1_idx` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_usuario
-- ----------------------------
INSERT INTO `admin_usuario` VALUES ('1', '4', '1077461284', '2017-01-14 16:06:13');
INSERT INTO `admin_usuario` VALUES ('804', '5', '1077461284', '2020-12-30 00:03:02');
INSERT INTO `admin_usuario` VALUES ('813', '5', '1077461284', '2020-12-31 20:05:31');
INSERT INTO `admin_usuario` VALUES ('814', '5', '1077461284', '2020-12-31 21:19:08');
INSERT INTO `admin_usuario` VALUES ('823', '5', '1077461284', '2020-12-31 22:46:44');

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'PERMITIDO');
INSERT INTO `estado` VALUES ('2', 'NO PERMITIDO');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `identifica` varchar(20) NOT NULL,
  `tipoide` int(11) DEFAULT NULL,
  `apellido1` varchar(80) DEFAULT NULL,
  `apellido2` varchar(80) DEFAULT NULL,
  `nombre1` varchar(80) DEFAULT NULL,
  `nombre2` varchar(80) DEFAULT NULL,
  `correo` varchar(145) DEFAULT NULL,
  `clave` varchar(40) DEFAULT NULL,
  `clave2` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `foto` varchar(100) DEFAULT 'img/user-icon.png',
  `firma` varchar(100) DEFAULT NULL,
  `tipo_user` int(11) DEFAULT 1,
  `sexo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sexo_id`),
  UNIQUE KEY `identifica_uniq` (`identifica`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `correo` (`correo`),
  KEY `tipoide` (`tipoide`),
  KEY `estado` (`estado`),
  KEY `fk_persona_sexo1_idx` (`sexo_id`),
  KEY `tipo_user` (`tipo_user`),
  KEY `id` (`id`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`tipoide`) REFERENCES `tipo_documento` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`tipo_user`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=826 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1', 'EBEJARANO', '1077461284', '1', 'BEJARANO', 'MOSQUERA', 'JESSON', 'EMBER', 'f.garcia@animalesbog.gov', 'ca053d9b298f5290bd3d5f3e07242592', null, '1', '2021-02-02 20:22:26', '/PAI_IDPYBA/fotos_perfil/archivo2020-09-141600109799.png', 'firmas/archivo2017-04-201492720823.png', '1', '1');
INSERT INTO `persona` VALUES ('2', 'ADMIN', '931217', '1', 'ADMIN', null, 'ADMIN', 'ADMIN', 'INGENIERO.FABIO.GARCIA@GMAIL.COM', 'ca053d9b298f5290bd3d5f3e07242592', null, '2', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('562', 'P.ACOSTA', '1032440398', '1', 'ANDREA', 'PAOLA', 'ACOSTA', 'VARGAS', 'P.ACOSTA@ANIMALESBOG.GOV.CO', 'AC5419BD315C9BF389E2F720BEA012A1', 'AC5419BD315C9BF389E2F720BEA012A1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('563', 'S.ALVAREZ', '52905130', '1', 'SONIA', 'MILENA', 'ALVAREZ', 'REINO', 'S.ALVAREZ@ANIMALESBOG.GOV.CO', '2E7E60B3C8A87FB4D6C961C8ABA10977', '2E7E60B3C8A87FB4D6C961C8ABA10977', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('564', 'COMUNICACIONES', '52539634', '1', 'CLAUDIA', 'LILIANA', 'AVENDAÑO', 'CIFUENTES', 'COMUNICACIONES@ANIMALESBOG.GOV.CO', 'B153EBCC95F83BF946212852EBA3B5CA', 'B153EBCC95F83BF946212852EBA3B5CA', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('565', 'J.BAUTIZTA', '1010199927', '1', 'LADY', 'JULIETH', 'BAUTIZTA', 'PARDO', 'J.BAUTIZTA@ANIMALESBOG.GOV.CO', '328E4967021212AB84402F1C6C868040', '328E4967021212AB84402F1C6C868040', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('566', 'Y.CASTRO', '1031127850', '1', 'YULY', 'PATRICIA', 'CASTRO', 'BELTRAN', 'Y.CASTRO@ANIMALESBOG,GOV.CO', '6DA7E03F13B91118DC04094AB1B20AB7', '6DA7E03F13B91118DC04094AB1B20AB7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('567', 'E.DELARUE', '1024545719', '1', 'RUE', 'CRUZ ERIKA', 'DE', 'LA', 'E.DELARUE@ANIMALESBOG.GOV.CO', 'FF75204D29F130F6062855930F6D767B', 'FF75204D29F130F6062855930F6D767B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('568', 'J.ESCOBAR', '80737341', '1', 'JIMMY', 'ALEJANDRO', 'ESCOBAR', 'CASTRO', 'J.ESCOBAR@ANIMALESBOG.GOV.CO', '21ABBFC3C695DE2D343F62F83AEB10B4', '21ABBFC3C695DE2D343F62F83AEB10B4', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('569', 'A.ESTRADA', '30272391', '1', 'ESTRADA', 'ADRIANA', 'ESTRADA', null, 'A.ESTRADA@ANIMALESBOG.GOV.CO', '9C33453A42260D5AEE9A2E1B8EEBAFA5', '9C33453A42260D5AEE9A2E1B8EEBAFA5', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('570', 'P.FORERO', '51796895', '1', 'NELLY', 'PATRICIA', 'FORERO', 'ESQUIVEL', 'P.FORERO@ANIMALESBOG.GOV.CO', '41F0FAB2D40A45798ADADF253DA0085B', '41F0FAB2D40A45798ADADF253DA0085B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('571', 'CONTROLINTERNO', '52053287', '1', 'CLAUDIA', 'PATRICIA', 'GUERRERO', 'CHAPARRO', 'CONTROLINTERNO@ANIMALESBOG.GOV.CO', '0ED92A962495A566D1FBDC65AC210504', '0ED92A962495A566D1FBDC65AC210504', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('572', 'ANIMALESSILVESTRES', '53120892', '1', 'JOHANNA', 'DEL PILAR', 'IZQUIERDO', 'PAEZ', 'ANIMALESSILVESTRES@ANIMALESBOG.GOV.CO', '42E9479D5B4D863808112ACA5B3F23C1', '42E9479D5B4D863808112ACA5B3F23C1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('573', 'A.JIMENEZ', '1019010308', '1', 'FAJARDO', 'MARIA  ANGELICA', 'JIMENEZ', null, 'A.JIMENEZ@ANIMALESBOG.GOV.CO', '8545574735AF61D87D9651E0126A3BFF', '8545574735AF61D87D9651E0126A3BFF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('574', 'I.JOYA', '1024504026', '1', 'INGRID', 'FAISULY JASLEIDY', 'JOYA', 'GALVIS', 'I.JOYA@ANIMALESBOG.GOV.CO', '379CB50697D412CBEE407C75C8E53D04', '379CB50697D412CBEE407C75C8E53D04', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('575', 'TESORERIA', '52427628', '1', 'MABEL', 'ROCIO', 'LAVERDE', 'ROJAS', 'TESORERIA@ANIMALESBOG.GOV.CO', '1910B96C94A584AC1C4750D4CFE34E7C', '1910B96C94A584AC1C4750D4CFE34E7C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('576', 'ARCHIVO', '1030575106', '1', 'PIÑEROS', 'ANDREY  MAURICIO', 'LOPEZ', null, 'ARCHIVO@ANIMALESBOG.GOV.CO', 'B974A22CB8750B91C4C64BCF423A22EE', 'B974A22CB8750B91C4C64BCF423A22EE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('577', 'L.CARREÑO', '7164566', '1', 'LUIS', 'ALBERTO', 'CARREÑO', 'BUITRAGO', 'L.CARREÑO@ANIMALESBOG.GOV.CO', '2C309D1A6054B2E27DE036F4078C9303', '2C309D1A6054B2E27DE036F4078C9303', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('578', 'TALENTOHUMANO', '79968718', '1', 'IVAN', 'DARIO', 'MALAVER', 'RODRIGUEZ', 'TALENTOHUMANO@ANIMALESBOG.GOV.CO', '2A7C5665023CBC727A069A64E2122F3F', '2A7C5665023CBC727A069A64E2122F3F', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('579', 'EDUCACION', '52294565', '1', 'HINCAPIE', 'ANDREA', 'MILLAN', null, 'EDUCACION@ANIMALESBOG.GOV.CO', '1E18CABF1F4D9DBF4D0DF3C505CCA947', '1E18CABF1F4D9DBF4D0DF3C505CCA947', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('580', 'D.MORA', '52968152', '1', 'DIANA', 'MARIA', 'MORA', 'RAMIREZ', 'D.MORA@ANIMALESBOG.GOV.CO', '55307BCC9B9FB676A4851F71F26F058B', '55307BCC9B9FB676A4851F71F26F058B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('581', 'J.MORALES', '35531158', '1', 'LEYDY', 'JOHANA', 'MORALES', 'CARVAJAL', 'J.MORALES@ANIMALESBOG.GOV.CO', 'B3BE10D1AB8C90E6E0F6D3869AD70D30', 'B3BE10D1AB8C90E6E0F6D3869AD70D30', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('582', 'CONTRATOS', '1096194882', '1', 'CINDY', 'JOHANA', 'NAVARRO', 'PABUENA', 'CONTRATOS@ANIMALESBOG.GOV.CO', 'A4A011E61786F421F1221105AECDA258', 'A4A011E61786F421F1221105AECDA258', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('583', 'J.OLMOS', '80169690', '1', 'JUAN', 'PABLO', 'OLMOS', 'CASTRO', 'J.OLMOS@ANIMALESBOG.GOV.CO', 'CC52ABAA8744A148DBC848DD880B7882', 'CC52ABAA8744A148DBC848DD880B7882', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('584', 'JURIDICA', '1024496913', '1', 'ADRIANA', 'VANESSA', 'PAEZ', 'MATALLANA', 'JURIDICA@ANIMALESBOG.GOV.CO', 'D19150DE14671EF2491FD8DEFE703888', 'D19150DE14671EF2491FD8DEFE703888', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('585', 'CULTURACIUDADANA', '52700824', '1', 'OSORIO', 'NATALIA', 'PARRA', null, 'CULTURACIUDADANA@ANIMALESBOG.GOV.CO', '1C74F8C7765A95D71FE869D19F6EDE60', '1C74F8C7765A95D71FE869D19F6EDE60', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('586', 'J.PATAQUIVA', '1136882598', '1', 'JORGE', 'ALBERTO', 'PATAQUIVA', 'AMARIS', 'J.PATAQUIVA@ANIMALESBOG.GOV.CO', 'A154137EEF3EA896255C20D86243E30B', 'A154137EEF3EA896255C20D86243E30B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('587', 'CULTURAYCONOCIMIENTO', '39705928', '1', 'MARTHA', 'CECILIA', 'PEÑA', 'SANCHEZ', 'CULTURAYCONOCIMIENTO@ANIMALESBOG.GOV.CO', 'F4D7FB4E7873EBB4C56F9EA684F09441', 'F4D7FB4E7873EBB4C56F9EA684F09441', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('588', 'FINANCIERA', '11791963', '1', 'MANUEL', 'ANTONIO', 'RENTERIA', 'CUESTA', 'FINANCIERA@ANIMALESBOG.GOV.CO', 'CF471F6F7142D3FDF4736EA002D95CCB', 'CF471F6F7142D3FDF4736EA002D95CCB', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('589', 'J.SANABRIA', '79496118', '1', 'JUAN', 'CARLOS', 'SANABRIA', 'MEDINA', 'J.SANABRIA@ANIMALESBOG.GOV.CO', '022A2297179ECDB39FF19AE07981C9DB', '022A2297179ECDB39FF19AE07981C9DB', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('590', 'REGULACION', '1014214680', '1', 'LEIDY', 'PAOLA', 'SANCHEZ', 'CUADROS', 'REGULACION@ANIMALESBOG.GOV.CO', '567AD846341A3995F273C3F41A7AB012', '567AD846341A3995F273C3F41A7AB012', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('591', 'J.TARQUINO', '1015412283', '1', 'JULIAN', 'ALBERTO', 'TARQUINO', 'PEÑUELA', 'J.TARQUINO@ANIMALESBOG.GOV.CO', 'A1D532F998BDDEA56826E3DF549BED42', 'A1D532F998BDDEA56826E3DF549BED42', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('592', 'C.TAUTIVA', '1026576959', '1', 'JULIA', 'CATALINA', 'TAUTIVA', 'GARZON', 'C.TAUTIVA@ANIMALESBOG.GOV.CO', 'C44564E36C666E33017E209CAFEDF993', 'C44564E36C666E33017E209CAFEDF993', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('593', 'I.TORRES', '52236471', '1', 'INGRID', 'ELIZABETH', 'TORRES', 'RODRIGUEZ', 'I.TORRES@ANIMALESBOG.GOV.CO', '172B2F2984EC8511BEA6056AFAAEFF18', '172B2F2984EC8511BEA6056AFAAEFF18', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('594', 'Y.VILLEGAS', '52427271', '1', 'CARO', 'YOHANNA  DEL PILAR', 'VILLEGAS', null, 'Y.VILLEGAS@ANIMALESBOG.GOV.CO', '4EFDBAC1816F9BFA8A8D86F1F1EF3C2F', '4EFDBAC1816F9BFA8A8D86F1F1EF3C2F', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('595', 'V.VILLEGAS', '38362236', '1', 'VIVIAN', 'VANESSA', 'VILLEGAS', 'ABADIA', 'V.VILLEGAS@ANIMALESBOG.GOV.CO', 'FAB799FB3ED7013C8264174E69BB98BC', 'FAB799FB3ED7013C8264174E69BB98BC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('596', 'SUBDIRECCIONFAUNA', '19496438', '1', 'FERNANDO', 'ANTONIO', 'MENDIGAÑA', 'PAEZ', 'SUBDIRECCIONFAUNA@ANIMALESBOG.GOV.CO', '09ED49B7844623E3516CFE9BC115944C', '09ED49B7844623E3516CFE9BC115944C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('597', 'ROBERS1826', '74327059', '1', 'BLANCO', 'HERNANDEZ', 'LUIS', 'ROBERTO', 'ROBERS1826@HOTMAIL.COM', '329B271FA71980302A9C96CE67E7EA56', '329B271FA71980302A9C96CE67E7EA56', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('598', 'J.CASTANEDA', '52855462', '1', 'CASTAÑEDA', 'CASTAÑEDA', 'JUDDY', 'MARITHZA', 'J.CASTANEDA@ANIMALESBOG.GOV.CO', '6A60EC2CE0087733391E60C64E05A546', '6A60EC2CE0087733391E60C64E05A546', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('599', 'W.GUERRERO', '1012321683', '1', 'GUERRERO', 'CABALLERO', 'WILLIAM', 'ANDRES', 'W.GUERRERO@ANIMALESBOG.GOV.CO', '879466843AC790D7A63997525E4527BF', '879466843AC790D7A63997525E4527BF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('600', 'DORISMAREVALO', '41741707', '1', 'AREVALO', 'DE RODRIGUEZ', 'DORIS', 'MAGALY', 'DORISMAREVALO@HOTMAIL.COM', 'A070918D2AFF08D9C6D9D0E4113ABA3A', 'A070918D2AFF08D9C6D9D0E4113ABA3A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('601', 'S.RICO', '1012405224', '1', 'RICO', 'CASTIBLANCO', 'SERGIO', 'NICOLAS', 'S.RICO@ANIMALESBOG.GOV.CO', 'AF88E7B5A4C0258FF280A41C36CDCD4B', 'AF88E7B5A4C0258FF280A41C36CDCD4B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('602', 'PAOCASTROMORENO', '1015409442', '1', 'CASTRO', 'MORENO', 'JENNIFFER', 'PAOLA', 'PAOCASTROMORENO@GMAIL.COM', '1D39FF65A4A364BCF25A10CE122470B7', '1D39FF65A4A364BCF25A10CE122470B7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('603', 'A.LOPEZ', '53084559', '1', 'LOPEZ', 'MORA', 'ANGELICA', 'MARIA', 'A.LOPEZ@ANIMALESBOG.GOV.CO', 'D1AFDC4FD19959346A528A47ED0C3D19', 'D1AFDC4FD19959346A528A47ED0C3D19', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('604', 'D.FRAILE', '52519111', '1', 'FRAILE', 'LOPEZ', 'DIANA', 'CAROLINA', 'D.FRAILE@ANIMALESBOG.GOV.CO', 'EB409DEC7796237927B19F10E70A8D1C', 'EB409DEC7796237927B19F10E70A8D1C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('605', 'P.CAMPOS', '79939604', '1', 'CAMPOS', 'GONZALEZ', 'PEDRO', 'NEL', 'P.CAMPOS@ANIMALESBOG.GOV.CO', 'A76F19DA8DB3D782173D9B6BEA89642A', 'A76F19DA8DB3D782173D9B6BEA89642A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('606', 'M.SALAZAR', '11205058', '1', 'SALAZAR', 'SANCHEZ', 'MICHEL', 'ARMANDO', 'M.SALAZAR@ANIMALESBOG.GOV.CO', 'E17E9987746DACA5D4F70C74EE45A2B3', 'E17E9987746DACA5D4F70C74EE45A2B3', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('608', 'H.RINCON', '79898591', '1', 'RINCON', 'TORRES', 'HENRY', 'FERNANDO', 'H.RINCON@ANIMALESBOG.GOV.CO', '6D2D9E84967ADFDB47FA5F643FE93BEE', '6D2D9E84967ADFDB47FA5F643FE93BEE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('609', 'POLITICAS', '1010174817', '1', 'RODRIGUEZ', 'NIÑO', 'LEIDY', 'YOHANA', 'POLITICAS@ANIMALESBOG.GOV.CO', '3E56230750BA3ADA7DE0A1B3FD0828A8', '3E56230750BA3ADA7DE0A1B3FD0828A8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('610', 'DAVID.GAMEZ00', '1012319248', '1', 'GÁMEZ', 'GARCÍA', 'CHRISTIAN', 'DAVID', 'DAVID.GAMEZ00@GMAIL.COM', '3428B8B84F8F19E28A0935AEB098841A', '3428B8B84F8F19E28A0935AEB098841A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('611', 'ATENCION.CIUDADANO1', '1056954144', '1', 'YANETH', 'ATARA', 'SANDRA', null, 'ATENCION.CIUDADANO1@ANIMALESBOG.GOV.CO', '3C0CDF5BB1C48C6C4381A131DCD7C38E', '3C0CDF5BB1C48C6C4381A131DCD7C38E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('612', 'L.CASTELLANOS', '1030631256', '1', 'CASTELLANOS', 'ALDANA', 'LAURA', 'CAMILA', 'L.CASTELLANOS@ANIMALESBOG.GOV.CO', 'AF713B331CB1CFB49DCE85990004EF56', 'AF713B331CB1CFB49DCE85990004EF56', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('613', 'X.CASTRO', '53006842', '1', 'CASTRO', 'PINTO', 'XIMENA', 'ANDREA', 'X.CASTRO@ANIMALESBOG.GOV.CO', 'B3158CA6F804717E3507216C56823632', 'B3158CA6F804717E3507216C56823632', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('614', 'N.DUARTE', '1032413599', '1', 'DUARTE', 'CAMARGO', 'NATHALIA', null, 'N.DUARTE@ANIMALESBOG.GOV.CO', 'DE2BE288CD840949B3E94F4CCDB5DC18', 'DE2BE288CD840949B3E94F4CCDB5DC18', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('615', 'J.CRISTANCHO', '1020768684', '1', 'CRISTANCHO', 'ROJAS', 'JUAN', 'DIEGO', 'J.CRISTANCHO@ANIMALESBOG.GOV.CO', '8AB1E0007420E6D0FE57BBA24C06BE29', '8AB1E0007420E6D0FE57BBA24C06BE29', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('616', 'PRENSAITALIA', '39788446', '1', 'USECHE', 'DELGADO', 'ITALIA', null, 'PRENSAITALIA@GMAIL.COM', '3B28BE82D6E30DA92FBF230D978BA714', '3B28BE82D6E30DA92FBF230D978BA714', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('617', 'J.ROJAS', '1032473100', '1', 'ROJAS', 'BERNAL', 'JUAN', 'SEBASTIAN', 'J.ROJAS@ANIMALESBOG.GOV.CO', '899CC9F24D3974372901FA7DC927A4CC', '899CC9F24D3974372901FA7DC927A4CC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('618', 'EDUARDORINCONHIGUERA', '1071162197', '1', 'RINCON', 'HIGUERA', 'EDUARDO', null, 'EDUARDORINCONHIGUERA@GMAIL.COM', '16314B0A5370DB3913EA8455962BAE0E', '16314B0A5370DB3913EA8455962BAE0E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('619', 'R.JIMENEZ', '80111372', '1', 'JIMENEZ', 'CARDENAS', 'RICARDO', 'ELIAS', 'R.JIMENEZ@ANIMALESBOG.GOV.CO', '92D693C084E556CC628F8D7917740C96', '92D693C084E556CC628F8D7917740C96', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('620', 'MANUMARIA2903', '1032497001', '1', 'MARTINEZ', 'OSORIO', 'MANUELA', 'MARIA', 'MANUMARIA2903@GMAIL.COM', '20B7818447224633356BDC4862958F1B', '20B7818447224633356BDC4862958F1B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('621', 'CHARLIEZONA6', '1016092265', '1', 'MORALES', 'ROJAS', 'CARLOS', 'DAVID', 'CHARLIEZONA6@GMAIL.COM', '0F4F74BF51115FC679290CC03A796ED9', '0F4F74BF51115FC679290CC03A796ED9', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('622', 'ECOVIVIR', '52371744', '1', 'VIVIANA', 'BAQUERO', 'MONICA', null, 'ECOVIVIR@HOTMAIL.COM', 'F58266107625801DD2072FAE55A36F9F', 'F58266107625801DD2072FAE55A36F9F', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('623', 'C.TENJO', '1100957610', '1', 'TENJO', 'LEÓN', 'CATALINA', null, 'C.TENJO@ANIMALESBOG.GOV.CO', 'FE726AA4B422D5F1D44F82B3B94B3B51', 'FE726AA4B422D5F1D44F82B3B94B3B51', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('624', 'OJZAMBRANOC', '80765614', '1', 'ZAMBRANO', 'CRUZ', 'OSCAR', 'JAVIER', 'OJZAMBRANOC@GMAIL.COM', '9F377CE4B9109E57D95A005F0AF729AA', '9F377CE4B9109E57D95A005F0AF729AA', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('625', 'CAMILA.OCHOA.LEON', '1019123222', '1', 'OCHOA', 'LEÓN', 'CAMILA', 'MARÍA', 'CAMILA.OCHOA.LEON@GMAIL.COM', '39DC51B468F1047E143837A93D059530', '39DC51B468F1047E143837A93D059530', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('626', 'Y.GARAVITO', '64748269', '1', 'GARAVITO', 'GAIBAO', 'YARLEDIS', 'MARIA', 'Y.GARAVITO@ANIMALESBOG.GOV.CO', 'E6B8FA34BBD012AA4AFB1A45ABFBB63D', 'E6B8FA34BBD012AA4AFB1A45ABFBB63D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('627', 'MARIADELPILARCRUZVALENCIA', '52739392', '1', 'PILAR', 'CRUZ VALENCIA', 'MARIA', 'DEL', 'MARIADELPILARCRUZVALENCIA@GMAIL.COM', '3ACD5455C05B7A2ED0B29C11FE8EE486', '3ACD5455C05B7A2ED0B29C11FE8EE486', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('628', 'D.MANRIQUE', '1075255079', '1', 'MANRIQUE', 'MONJE', 'DANIEL', 'ANIBAL', 'D.MANRIQUE@ANIMALESBOG.GOV.CO', 'F4B1160E1DB0C922B75257CE385D531C', 'F4B1160E1DB0C922B75257CE385D531C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('629', 'XXX', '1014280098', '1', 'MORENO', 'CASTILLO', 'KEVIN', null, 'XXX@GMAIL.COM', '472BFD0ACD0AA096401894D826748CEA', '472BFD0ACD0AA096401894D826748CEA', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('630', 'D.MONROY', '52414418', '1', 'MONROY', 'MARIN', 'DIANA', 'ROCÍO', 'D.MONROY@ANIMALESBOG.GOV.CO', 'F1B341BC4BDAFC9EEB08E6DA8FF1A036', 'F1B341BC4BDAFC9EEB08E6DA8FF1A036', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('631', 'M.CANO', '79470164', '1', 'CANO', 'SILVA', 'MAURICIO', null, 'M.CANO@ANIMALESBOG.GOV.CO', '32C92B309795BDA6E695A8FCC7F622EE', '32C92B309795BDA6E695A8FCC7F622EE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('632', 'CUIDADOANIMAL', '1016004490', '1', 'GONZALEZ', 'LEAL', 'MAURICIO', null, 'CUIDADOANIMAL@ANIMALESBOG.GOV.CO', '172C2F648B45F70C2D4B20E360A2C88D', '172C2F648B45F70C2D4B20E360A2C88D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('633', 'CONTROLINTERNO2', '51619121', '1', 'SALCEDO', 'SALAZAR', 'BLANCA', 'LILIA', 'CONTROLINTERNO2@ANIMALESBOG.GOV.CO', 'F105635A626EF6A00FEF133E66E9D5DE', 'F105635A626EF6A00FEF133E66E9D5DE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('634', 'TASHIANAJV', '53105586', '1', 'JIMENEZ', 'VILLEGAS', 'TATIANA', null, 'TASHIANAJV@GMAIL.COM', '9F134C4BA7871F46324463C28C56FC57', '9F134C4BA7871F46324463C28C56FC57', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('635', 'DFELIPESANCHEZ.MV', '1015407652', '1', 'SANCHEZ', 'ARCILA', 'DIEGO', 'FELIPE', 'DFELIPESANCHEZ.MV@GMAIL.COM', 'EE30E980D5000639E3B5D210A480DF41', 'EE30E980D5000639E3B5D210A480DF41', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('636', 'RIOSMEDINAANAMARIA', '1016062133', '1', 'RIOS', 'MEDINA', 'ANA', 'MARIA', 'RIOSMEDINAANAMARIA@GMAIL.COM', 'B180F9D3121C5C4CA370FFC8BDFEDB78', 'B180F9D3121C5C4CA370FFC8BDFEDB78', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('637', 'MVZVEROOV', '1010213395', '1', 'ORTIZ', 'VARELA', 'VERONICA', 'SUSANA', 'MVZVEROOV@OUTLOOK.ES', 'B835567FD712B3E3712D71DAF459A855', 'B835567FD712B3E3712D71DAF459A855', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('638', 'JUANCARPULIDO', '79716755', '1', 'PULIDO', 'REATIGA', 'JUAN', 'CARLOS', 'JUANCARPULIDO@YAHOO.COM', 'CADDC4DE19FDF607A2701C0882F3D937', 'CADDC4DE19FDF607A2701C0882F3D937', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('639', 'NOHMORENO', '1018462454', '1', 'MORENO', 'HERNANDEZ', 'NOHELIA', 'FERNANDA', 'NOHMORENO@UDCA.EDU.CO', '699BC5383DE12447D936F6DC9CDD444D', '699BC5383DE12447D936F6DC9CDD444D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('640', 'LINATARAZONA54', '1070970724', '1', 'TARAZONA', 'PULIDO', 'LINA', 'MARIA', 'LINATARAZONA54@GMAIL.COM', '6E51AAEB6F7D2017B8AC84AD1D7AE010', '6E51AAEB6F7D2017B8AC84AD1D7AE010', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('641', 'CECHEVERRI07', '1030591510', '1', 'ECHEVERRI', 'RUBIANO', 'CAMILA', null, 'CECHEVERRI07@UNISALLE.EDU.CO', '2305684F93E5C4E007DD8C75C15469D1', '2305684F93E5C4E007DD8C75C15469D1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('642', 'LAHUUFER', '1023954879', '1', 'CUEVAS', 'AVILAN', 'LAURA', 'FERNANDA', 'LAHUUFER@GMAIL.COM', 'CCC474F7F1CA4D8F9482227AE55DF5AF', 'CCC474F7F1CA4D8F9482227AE55DF5AF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('643', 'STIVEN.FORERO', '80865422', '1', 'FORERO', 'ROJAS', 'LEONEL', 'STIVEN', 'STIVEN.FORERO@GMAIL.COM', 'F8172328229615D57204E534FBE02526', 'F8172328229615D57204E534FBE02526', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('644', 'NATAVARGASS09', '1030681495', '1', 'VARGAS', 'SANCHEZ', 'NATALIA', 'CAROLINA', 'NATAVARGASS09@GMAIL.COM', '8191EEA161AEF5264BC390418682BCB1', '8191EEA161AEF5264BC390418682BCB1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('645', 'NATISMELO96', '1032493766', '1', 'MELO', 'JUNCO', 'NATALI', null, 'NATISMELO96@GMAIL.COM', '65A3EB3AE56ED3C34C829BC3B3A4D871', '65A3EB3AE56ED3C34C829BC3B3A4D871', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('646', 'ARENITADEMAR28', '52821642', '1', 'JANETH', 'IMBACUAL', 'SANDRA', null, 'ARENITADEMAR28@GMAIL.COM', '4241686523630CC7873D643088FA984C', '4241686523630CC7873D643088FA984C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('647', 'CORREAFW1013', '1012426785', '1', 'CORREA', 'FIGUEROA', 'WILMER', null, 'CORREAFW1013@HOTMAIL.COM', '038979D67A6FC6FC99D30F609788AF65', '038979D67A6FC6FC99D30F609788AF65', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('648', 'YESIKARO1990', '1012368783', '1', 'OSORIO', 'PINZON', 'YESICA', 'CAROLINA', 'YESIKARO1990@GMAIL.COM', 'B25AA2D0ECF9436124157B86E232266A', 'B25AA2D0ECF9436124157B86E232266A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('649', 'GUILLERMOBARRETOMV', '79744265', '1', 'BARRETO', 'BARRERA', 'GUILLERMO', null, 'GUILLERMOBARRETOMV@GMAIL.COM', '647D40E003E76DB193E296646EB3E7D8', '647D40E003E76DB193E296646EB3E7D8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('650', 'MAURICIO.ALAGUNA', '79843742', '1', 'ALAGUNA', 'CRUZ', 'JUAN', 'MAURICIO', 'MAURICIO.ALAGUNA@GMAIL.COM', '2FA670E776247A4E0C7AC9E6D1B391E9', '2FA670E776247A4E0C7AC9E6D1B391E9', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('651', 'JOSAAVEDRA31', '7183627', '1', 'SAAVEDRA', 'MOJICA', 'JONNY', 'MANUEL', 'JOSAAVEDRA31@HOTMAIL.COM', '619249AA5691DB519A74658B66530426', '619249AA5691DB519A74658B66530426', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('652', 'SNARANJOMONJE', '1015432546', '1', 'NARANJO', 'MONJE', 'SANTIAGO', 'GUILLERMO', 'SNARANJOMONJE@GMAIL.COM', 'BED422D9AA13CBEDFF723782EB67B322', 'BED422D9AA13CBEDFF723782EB67B322', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('653', 'VANEVELANDIA6', '1019106805', '1', 'VELANDIA', 'TORRES', 'LUZ', 'VANESSA', 'VANEVELANDIA6@GMAIL.COM', '1B151156BFF35850C68DB8444C11C8E3', '1B151156BFF35850C68DB8444C11C8E3', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('654', 'ESTERILIZACIONES', '52283159', '1', 'DIAZ', 'MARTINEZ', 'EDITH', 'JOHANNA', 'ESTERILIZACIONES@PROTECCIONANIMALBOGOTA.GOV.CO', '77B4107D6DE9A2E5D2F5C6CAABF22801', '77B4107D6DE9A2E5D2F5C6CAABF22801', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('655', 'LAURISMVZ', '39744939', '1', 'CONTRERAS', 'VALDERRAMA', 'LAURA', 'ELIZABETH', 'LAURISMVZ@YAHOO.ES', '8F33BD42ACE720FF754D87A8173C5915', '8F33BD42ACE720FF754D87A8173C5915', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('656', 'TACHETESAMA6', '1015999812', '1', 'MARTINEZ', 'CAMACHO', 'INGRID', 'CAROLINA', 'TACHETESAMA6@GMAIL.COM', '1B61121CF9EE89720652CAEBCFE04F8C', '1B61121CF9EE89720652CAEBCFE04F8C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('657', 'MEVARGASM', '79886569', '1', 'VARGAS', 'MADRID', 'MAURICIO', 'EDUARDO', 'MEVARGASM@GMAIL.COM', 'E8EC22F113837F79786802E0F7781CBE', 'E8EC22F113837F79786802E0F7781CBE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('658', 'PROTECCIONANIMALUNETE', '79151401', '1', 'GARAVITO', 'RIVERA', 'NORMAN', 'EDGAR', 'PROTECCIONANIMALUNETE@GMAIL.COM', 'CB0B9363E15A26B37BBF658F360D07C1', 'CB0B9363E15A26B37BBF658F360D07C1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('659', 'DISCIPLINARIOS', '1100955198', '1', 'ROJAS', 'VASQUEZ', 'ERIKA', 'FERNANDA', 'DISCIPLINARIOS@ANIMALESBOG.GOV.CO', '5E768A6640F2F2721D5200EDD2070940', '5E768A6640F2F2721D5200EDD2070940', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('660', 'N.CASTILLO', '1018426224', '1', 'CASTILLO', 'VERGAÑO', 'NATHALY', null, 'N.CASTILLO@ANIMALESBOG.GOV.CO', '8E79E166D1B4DCE544A6A3655339E940', '8E79E166D1B4DCE544A6A3655339E940', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('661', 'ALMACEN', '80213480', '1', 'ARIZA', 'GOMEZ', 'FREDY', 'ERNESTO', 'ALMACEN@ANIMALESBOG.GOV.CO', '2769E3ADA3913FC404C127F62B7199FE', '2769E3ADA3913FC404C127F62B7199FE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('662', 'J.PULIDO', '79963866', '1', 'PULIDO', 'REY', 'JOHAN', 'JAVIER', 'J.PULIDO@ANIMALESBOG.GOV.CO', 'EA742ADF0EAC4A3A6D3F523EE18D743E', 'EA742ADF0EAC4A3A6D3F523EE18D743E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('663', 'D.JAIMES', '1233694361', '1', 'JAIMES', 'MARTINEZ', 'DAVID', 'ARTURO', 'D.JAIMES@ANIMALESBOG.GOV.CO', '7B3AC426DA0D71D91E905BEB7BF14620', '7B3AC426DA0D71D91E905BEB7BF14620', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('664', 'APOYOALMACEN', '80175978', '1', 'BELTRAN', 'LOZANO', 'YEISON', 'LEONARDO', 'APOYOALMACEN@ANIMALESBOG.GOV.CO', '8F7E5BEFD33CF36611427B9DD1AFE2F8', '8F7E5BEFD33CF36611427B9DD1AFE2F8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('666', 'M.GARZON', '1022971946', '1', 'GARZON', 'RAMIREZ', 'MONICA', 'LIZETH', 'M.GARZON@ANIMALESBOG.GOV.CO', 'AE2E35FF1AA60A55DC938920618E91A5', 'AE2E35FF1AA60A55DC938920618E91A5', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('667', 'I.TABACO', '52704170', '1', 'TABACO', 'QUEMBA', 'MARIA', 'ISABELA', 'I.TABACO@ANIMALESBOG.GOV.CO', '079D6AF86867ABF7C13F7C8BAD93E053', '079D6AF86867ABF7C13F7C8BAD93E053', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('668', 'PAULAMENDOZA.ALVARADO', '1136886379', '1', 'MENDOZA', 'ALVARADO', 'PAULA', 'ANDREA', 'PAULAMENDOZA.ALVARADO@GMAIL.COM', '06C1DE23E6405645EA63C2BA1FA8F12B', '06C1DE23E6405645EA63C2BA1FA8F12B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('669', 'A.QUINTERO', '1090372377', '1', 'QUINTERO', 'GALVIS', 'ANA', 'LIZETH', 'A.QUINTERO@ANIMALESBOG.GOV.CO', 'A438CE93C10024503745812B6C172E1D', 'A438CE93C10024503745812B6C172E1D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('670', 'VICTORORTEGAVETERINARIO', '79913714', '1', 'ORTEGA', 'VASQUEZ', 'VICTOR', 'MANUEL', 'VICTORORTEGAVETERINARIO@GMAIL.COM', 'E47845623BCF73338EBBFEC78B40B9C7', 'E47845623BCF73338EBBFEC78B40B9C7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('671', 'CORRESPONDENCIAJURIDICA', '53075884', '1', 'MONTOYA', 'SANCHEZ', 'YEIMY', 'YULIANA', 'CORRESPONDENCIAJURIDICA@ANIMALESBOG.GOV.CO', 'EB741256EA0347BB04199C12E7C37C3A', 'EB741256EA0347BB04199C12E7C37C3A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('672', 'LAURAC.RODRIGUEZ', '1032401540', '1', 'RODRIGUEZ', 'RIOS', 'LAURA', 'CATHERINE', 'LAURAC.RODRIGUEZ@GMAIL.COM', '738CC2AA24C020ACB547956BB38D0AF7', '738CC2AA24C020ACB547956BB38D0AF7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('673', 'RICARVEL.06', '80427688', '1', 'VELÁSQUEZ', 'CRISTANCHO', 'RICARDO', null, 'RICARVEL.06@GMAIL.COM', '28A10D192BA567C96696004FDBEBE028', '28A10D192BA567C96696004FDBEBE028', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('674', 'MIGUELANGEL11A', '1022968258', '1', 'POVEDA', 'RAMIREZ', 'MIGUEL', 'ANGEL', 'MIGUELANGEL11A@HOTMAIL.COM', '50E1E419AD894682B1126370D6ACAB9E', '50E1E419AD894682B1126370D6ACAB9E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('675', 'GNRR85', '1020759633', '1', 'GAMBA', 'CORREDOR', 'FERNANDO', null, 'GNRR85@GMAIL.COM', '7497C12B53EE4436976C207D63212C71', '7497C12B53EE4436976C207D63212C71', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('676', 'BRIGADASMEDICAS', '21148296', '1', 'AREVALO', 'BARRERO', 'MAGDA', 'CONSTANZA', 'BRIGADASMEDICAS@ANIMALESBOG.GOV.CO', '4E42F9110B7146785B1AAD0F6698B572', '4E42F9110B7146785B1AAD0F6698B572', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('677', 'EDVETERINARIO89', '1070598970', '1', 'RAMIREZ', 'OLIVEROS', 'EDWARD', 'IVAN', 'EDVETERINARIO89@GMAIL.COM', 'C234E0528167C256251EB56D67309B2B', 'C234E0528167C256251EB56D67309B2B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('678', 'MIGUELACEVEDOROMERO', '74348035', '1', 'ACEVEDO', 'ROMERO', 'MIGUEL', 'FREIDY', 'MIGUELACEVEDOROMERO@GMAIL.COM', '9C5D1B4FE4BBBBD64FC13E91BBD6A7A7', '9C5D1B4FE4BBBBD64FC13E91BBD6A7A7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('679', 'DIAESCOBAR19', '1030557810', '1', 'ALEJANDRA', 'ESCOBAR', 'DIANA', null, 'DIAESCOBAR19@GMAIL.COM', '5E65FD441C08400339C5844E23A3A3BC', '5E65FD441C08400339C5844E23A3A3BC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('680', 'EMERGENCIAS', '52484934', '1', 'CRUZ', 'ALVAREZ', 'YENNY', 'PATRICIA', 'EMERGENCIAS@ANIMALESBOG.GOV.CO', '19F9B153735D529EC1C74665A3E54E45', '19F9B153735D529EC1C74665A3E54E45', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('681', 'CRISTIANGORDILLO1', '1020751940', '1', 'GORDILLO', 'JOJOA', 'CHRISTIAN', 'CAMILO', 'CRISTIANGORDILLO1@GMAIL.COM', 'C15B180F1C0154E0F54094E643D7ADFC', 'C15B180F1C0154E0F54094E643D7ADFC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('682', 'C.ANGULO', '80083339', '1', 'ANGULO', 'HERRERA', 'CHRISTIAN', 'YERED', 'C.ANGULO@ANIMALESBOG.GOV.CO', '78E63B796D6EBE0E184E4ECCB0CCFD25', '78E63B796D6EBE0E184E4ECCB0CCFD25', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('683', 'TUTO3434', '80513231', '1', 'PINILLA', 'VALBUENA', 'GUSTAVO', null, 'TUTO3434@HOTMAIL.COM', '32ED9A28D6AB1B5ACCA479B1C01EB30E', '32ED9A28D6AB1B5ACCA479B1C01EB30E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('684', 'Y.MORENO', '1024497566', '1', 'MORENO', 'RAMÍREZ', 'YENY', 'ROCIO', 'Y.MORENO@ANIMALESBOG.GOV.CO', 'BE598F8D4F597A5FD1ED6F3DB51D9977', 'BE598F8D4F597A5FD1ED6F3DB51D9977', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('685', 'DEFENSAJUDICIAL', '57447148', '1', 'LARA', 'BAQUERO', 'MYRIAM', 'JOSEFINA', 'DEFENSAJUDICIAL@ANIMALESBOG.GOV.CO', '1D74C9AA1B1A6A1DC3BBF40A323E38B0', '1D74C9AA1B1A6A1DC3BBF40A323E38B0', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('686', 'M.ZUICA', '52428245', '1', 'ZUICA', 'MONZON', 'MARTHA', 'PATRICIA', 'M.ZUICA@ANIMALESBOG.GOV.CO', '866C08E132D782281A2444855EE77B34', '866C08E132D782281A2444855EE77B34', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('687', 'K.MOLANO', '1015419806', '1', 'MOLANO', 'MARTINEZ', 'KADIR', 'ENRIQUE', 'K.MOLANO@ANIMALESBOG.GOV.CO', '918F2C1F577EDE6283A8F62C1C0D2218', '918F2C1F577EDE6283A8F62C1C0D2218', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('688', 'C.CASAS', '1015398653', '1', 'CASAS', 'GOMEZ', 'CATALINA', null, 'C.CASAS@ANIMALESBOG.GOV.CO', '22B1955B20B9D39541B5CC116A6B70CE', '22B1955B20B9D39541B5CC116A6B70CE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('689', 'ASIS.COMUNICACIONES', '1031161169', '1', 'ROMERO', 'BERNAL', 'YARMAILE', 'BALESSKA', 'ASIS.COMUNICACIONES@ANIMALESBOG.GOV.CO', 'AD3701E3CD5A144BF7A35DC008C82417', 'AD3701E3CD5A144BF7A35DC008C82417', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('690', 'CUSTODIA', '80201080', '1', 'MONTOYA', 'ARIAS', 'VICTOR', 'ALEJANDRO', 'CUSTODIA@ANIMALESBOG.GOV.CO', 'E70EBB401F6285A8B7BB5480B377DF29', 'E70EBB401F6285A8B7BB5480B377DF29', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('691', 'GINEBRA205', '52785713', '1', 'GARZON', 'CALDERON', 'ADRIANA', 'PAOLA', 'GINEBRA205@HOTMAIL.COM', 'DA4A2CC432FE58865BC5F3F03FFC53BC', 'DA4A2CC432FE58865BC5F3F03FFC53BC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('692', 'L.RODRIGUEZ', '52971135', '1', 'RODRIGUEZ', 'GONZALEZ', 'LUISA', 'FERNANDA', 'L.RODRIGUEZ@ANIMALESBOG.GOV.CO', 'C413EB67255CBE98088753EEEAD96048', 'C413EB67255CBE98088753EEEAD96048', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('693', 'DAYANAAPONTE0508', '53084113', '1', 'APONTE', 'MELO', 'DAYANA', 'LIZETH', 'DAYANAAPONTE0508@GMAIL.COM', '217CAC3CBC803EEAFC3059E55A168953', '217CAC3CBC803EEAFC3059E55A168953', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('694', 'N.ROJAS', '1016032489', '1', 'ROJAS', 'DIAZ', 'NATALY', 'YOLANDA', 'N.ROJAS@ANIMALESBOG.GOV.CO', '6AE61AEBFA78C49F8D2759CB98A28828', '6AE61AEBFA78C49F8D2759CB98A28828', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('695', 'CAROLINA.ALAGUNA.CRUZ', '52883499', '1', 'ALAGUANA', 'CRUZ', 'CAROLINA', null, 'CAROLINA.ALAGUNA.CRUZ@GMAIL.COM', '0BDAB918B3864E24E0C906DA6F5FB41C', '0BDAB918B3864E24E0C906DA6F5FB41C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('696', 'JOSENICOLASDAZA', '80871601', '1', 'DAZA', 'GOMEZ', 'JOSE', 'NICOLAS', 'JOSENICOLASDAZA@GMAIL.COM', 'E646F5EC981640D1513370925402601A', 'E646F5EC981640D1513370925402601A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('697', 'ATENCIONALCIUDADANO', '52827342', '1', 'RONCANCIO', 'LEON', 'JULIETH', 'NATALIA', 'ATENCIONALCIUDADANO@ANIMALESBOG.GOV.CO', '40851248F5EC71218442EC8BAA8F3F39', '40851248F5EC71218442EC8BAA8F3F39', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('698', 'V.LAICECA', '79996628', '1', 'LAICECA', 'GUARACA', 'VALDOMIRO', null, 'V.LAICECA@ANIMALESBOG.GOV.CO', 'D480E404EA014D56DBC861E95424ACF3', 'D480E404EA014D56DBC861E95424ACF3', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('699', 'GCARRASCALGUERRERO', '1015457709', '1', 'CARRASCAL', 'GUERRERO', 'GINETTE', 'ELIANA', 'GCARRASCALGUERRERO@GMAIL.COM', '7D7416D788C9EE10A8F97F21B3270894', '7D7416D788C9EE10A8F97F21B3270894', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('700', 'MPRT97740', '52360228', '1', 'RIVEROS', 'TRIANA', 'MERLY', 'PATRICIA', 'MPRT97740@OUTLOOK.COM', '3E466485059E6193617F0FFE7E8D2B33', '3E466485059E6193617F0FFE7E8D2B33', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('701', 'ANDREAPS01', '53011556', '1', 'PILAR', 'PEÑARANDA SILVA', 'ANDREA', 'DEL', 'ANDREAPS01@YAHOO.COM', '05C4DF08D41406EE4C0FD5944ABE9038', '05C4DF08D41406EE4C0FD5944ABE9038', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('702', 'MONIRODRIGUEZR81', '52882560', '1', 'RODRIGUEZ', 'RODRIGUEZ', 'MONICA', 'LENIDT', 'MONIRODRIGUEZR81@GMAIL.COM', 'C942095430AD103B554C64437FD0B4DE', 'C942095430AD103B554C64437FD0B4DE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('703', 'R.CRUZ', '80226190', '1', 'CRUZ', 'ARIAS', 'RICHARD', 'OSWALDO', 'R.CRUZ@ANIMALESBOG.GOV.CO', '03E6A84C7C93563961EA50DDE0863369', '03E6A84C7C93563961EA50DDE0863369', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('704', 'VIVBURITICAP', '52353165', '1', 'BURITICA', 'PELAEZ', 'VIVIANA', null, 'VIVBURITICAP@GMAIL.COM', 'F7719E56A9D5EBB349FD9380D69F981A', 'F7719E56A9D5EBB349FD9380D69F981A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('705', 'KAMMUSB', '80543366', '1', 'BUITRAGO', 'ESPINDOLA', 'OSCAR', 'JAVIER', 'KAMMUSB@HOTMAIL.COM', '6CF297C81DEE86C2A4D2B828D15F5483', '6CF297C81DEE86C2A4D2B828D15F5483', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('706', 'M.NARVAEZ', '1075276987', '1', 'NARVAEZ', 'QUINTERO', 'MARTHA', 'LORENA', 'M.NARVAEZ@ANIMALESBOG.GOV.CO', '537CDA4A8E1A692B03748EDF4BECBBD6', '537CDA4A8E1A692B03748EDF4BECBBD6', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('707', 'CLAUDIA.MARTINEZ1321', '51965138', '1', 'MARTINEZ', 'FIGUEROA', 'CLAUDIA', 'PATRICIA', 'CLAUDIA.MARTINEZ1321@GMAIL.COM', 'A85DD708D37D71C0F130DC0440DF25FF', 'A85DD708D37D71C0F130DC0440DF25FF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('708', 'TOBIAS13_93', '1020780573', '1', 'PLAZA', 'TOVAR', 'DIEGO', 'TOBIAS', 'TOBIAS13_93@HOTMAIL.COM', '851ABCEB09F37B97E620625DE0982BE7', '851ABCEB09F37B97E620625DE0982BE7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('709', 'ALEXA_MVZ', '52822388', '1', 'BARAHONA', 'MENDEZ', 'EMMA', 'ALEXANDRA', 'ALEXA_MVZ@YAHOO.CPM', 'FE420EF721C6BEF94F23E35E590B87C8', 'FE420EF721C6BEF94F23E35E590B87C8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('710', 'ALEJAPADILLA21', '1013589390', '1', 'PADILLA', 'CASTILLO', 'JENNY', 'ALEJANDRA', 'ALEJAPADILLA21@HOTMAIL.COM', '33FC95F84613F5FD14099469815A2C73', '33FC95F84613F5FD14099469815A2C73', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('711', 'KAROLJOAN_1965', '1014240783', '1', 'GUTIERREZ', 'MORALES', 'KAROL', 'JOAN', 'KAROLJOAN_1965@HOTMAIL.COM', '8058DCD8AEF9006542B8ACFB491FF660', '8058DCD8AEF9006542B8ACFB491FF660', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('712', 'MAICOLX333', '1031142664', '1', 'BARON', 'MORENO', 'MICHAEL', 'ALEXANDER', 'MAICOLX333@HOTMAIL.COM', '3E4A6986001879F81F36B972953ADF05', '3E4A6986001879F81F36B972953ADF05', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('713', 'L.GARCIA', '1057710521', '1', 'GARCIA', 'MARTINEZ', 'LIZETH', 'ANDREA', 'L.GARCIA@ANIMALESBOG.GOV.CO', '9208FFF83EAA1880D6061062FC2C051D', '9208FFF83EAA1880D6061062FC2C051D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('714', 'M.LATORRE', '1013639673', '1', 'LATORRE', 'MARTINEZ', 'MAVERICK', 'SEBASTIAN', 'M.LATORRE@ANIMALESBOG.GOV.CO', 'B74000A8C405BB344D91AEE68DFA7D87', 'B74000A8C405BB344D91AEE68DFA7D87', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('715', 'MAGUILLONGARCIA', '1014255219', '1', 'AGUILLON', 'GARCIA', 'MARIA', 'CAMILA', 'MAGUILLONGARCIA@GMAIL.COM', 'EBC180DCC0152D1D019D6A9F5C4E7854', 'EBC180DCC0152D1D019D6A9F5C4E7854', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('716', 'JENIFERMEDINA', '1030615842', '1', 'MEDINA', 'VALBUENA', 'JENNYFER', 'LORENA', 'JENIFERMEDINA@HOTMAIL.COM', '0C836D8CC08164763040F3F565E43CC6', '0C836D8CC08164763040F3F565E43CC6', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('717', 'STEFANYHIGUERAFERNANDEZ', '1073238481', '1', 'HIGUERA', 'FERNANDEZ', 'STEFANY', 'YUSED', 'STEFANYHIGUERAFERNANDEZ@GMAIL.COM', 'E27ED157BE14DF5E9C04D0EB27C53E23', 'E27ED157BE14DF5E9C04D0EB27C53E23', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('718', 'D.PASCAGAZA', '1016035069', '1', 'PASCAGAZA', 'CALERO', 'DEISI', 'JOHANA', 'D.PASCAGAZA@ANIMALESBOG.GOV.CO', 'A46169B170AAE3355659D158BCA836A9', 'A46169B170AAE3355659D158BCA836A9', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('719', 'APINZONCANI', '1012449006', '1', 'PINZÓN', 'CAÑIZALES', 'ANYELA', 'CAMILA', 'APINZONCANI@UNIMINUTO.EDU.CO', '3E5C194C375297DA2F969C6B468D7C46', '3E5C194C375297DA2F969C6B468D7C46', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('720', 'ANDREACONTRERASR20', '1013643471', '1', 'PAOLA', 'CONTRERAS', 'ANDREA', null, 'ANDREACONTRERASR20@GMAIL.COM', 'A43B95DEBA70F47CC16570E8C8C3B815', 'A43B95DEBA70F47CC16570E8C8C3B815', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('721', 'ELIANASILVAMARTINEZ', '1007497027', '1', 'SILVA', 'MARTINEZ', 'ELIANA', null, 'ELIANASILVAMARTINEZ@OUTLOOK.COM', '6967C2EDF118696BB3DA130DB1923581', '6967C2EDF118696BB3DA130DB1923581', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('722', 'ANDROMEDA1013', '1032397940', '1', 'LOPEZ', 'ALVAREZ', 'JULIE', 'MARIANA', 'ANDROMEDA1013@HOTMAIL.COM', '82D6554859446D0227AAD108A8C99E40', '82D6554859446D0227AAD108A8C99E40', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('723', 'L.JACQUELINE.GONZ', '53160314', '1', 'GONZALEZ', 'MACHUCA', 'LAURA', 'JACQUELINE', 'L.JACQUELINE.GONZ@GMAIL.COM', 'DBD7AB4EAEB7207B9503CC3DFCAB01C0', 'DBD7AB4EAEB7207B9503CC3DFCAB01C0', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('724', 'MARISOLGUEVARA', '52229514', '1', 'GUEVARA', 'ROMERO', 'MARYSOL', null, 'MARISOLGUEVARA@HOTMAIL.COM', '151ABA58E7BFD8C2479BF7D98B4CDFA9', '151ABA58E7BFD8C2479BF7D98B4CDFA9', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('725', 'ANDRES.SEGURA2016', '1016015427', '1', 'SEGURA', 'MARTINEZ', 'ANDRES', null, 'ANDRES.SEGURA2016@GMAIL.COM', '933036CA4C67F1FC9FF694D40D529126', '933036CA4C67F1FC9FF694D40D529126', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('726', '1485JPGM', '53107780', '1', 'GUTIERREZ', 'MARIN', 'JOHANNA', 'PATRICIA', '1485JPGM@GMAIL.COM', '4E70C22E64D0EDDD7C6779D0D6444F2D', '4E70C22E64D0EDDD7C6779D0D6444F2D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('727', 'DIAZJUANDIEGO2907', '1020838994', '1', 'DIAZ', 'GALEANO', 'JUAN', 'DIEGO', 'DIAZJUANDIEGO2907@HOTMAIL.COM', '45E7497BD218C20F335AC690346D1C00', '45E7497BD218C20F335AC690346D1C00', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('728', 'YEGT1976', '52264330', '1', 'GAMBOA', 'TORRES', 'YOLANDA', 'EMILSE', 'YEGT1976@GMAIL.COM', 'C3FF0BA185E4F468EFC9C9966AF01D4D', 'C3FF0BA185E4F468EFC9C9966AF01D4D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('729', 'L.RAMIREZ', '1020717375', '1', 'RAMIREZ', 'ALVAREZ', 'LILIANA', 'ANGELICA', 'L.RAMIREZ@ANIMALESBOG.GOV.CO', '16CA6CB0495393836435749C224E51DD', '16CA6CB0495393836435749C224E51DD', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('730', 'J.CASTIBLANCO', '80026294', '1', 'CASTIBLANCO', 'MOLANO', 'JOHN', 'ALEXANDER', 'J.CASTIBLANCO@ANIMALESBOG.GOV.CO', '4C35DE423674684DB9DC1EC55C4FD05D', '4C35DE423674684DB9DC1EC55C4FD05D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('731', 'C.CABRERA', '52186866', '1', 'CABRERA', 'LAITON', 'CLAUDIA', 'PATRICIA', 'C.CABRERA@ANIMALESBOG.GOV.CO', 'D6955DE28AAF32BA473EC8875FF6ADF4', 'D6955DE28AAF32BA473EC8875FF6ADF4', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('732', 'F.AGUIRRE', '79558256', '1', 'AGUIRRE', 'PANCHE', 'FERNANDO', null, 'F.AGUIRRE@ANIMALESBOG.GOV.CO', 'ECB59FA31E33F32577D34896C36701D8', 'ECB59FA31E33F32577D34896C36701D8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('733', 'DAFFYDM', '79939311', '1', 'ENCISO', 'GONZALEZ', 'DAVID', 'SANTIAGO', 'DAFFYDM@HOTMAIL.COM', '32480F998A6D2D83E82881D318709D1C', '32480F998A6D2D83E82881D318709D1C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('734', 'J.CARDONA', '80231302', '1', 'CARDONA', 'CARDENAS', 'JUAN', 'FELIPE', 'J.CARDONA@ANIMALESBOG.GOV.CO', 'CB6E99CDC2E1A9D2ED3E5DDB58FDF62B', 'CB6E99CDC2E1A9D2ED3E5DDB58FDF62B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('735', 'D.OLARTE', '1022376238', '1', 'OLARTE', 'GUAYABO', 'DIANA', 'MARCELA', 'D.OLARTE@ANIMALESBOG.GOV.CO', 'E62E539A80D350E4CE604A49086ABF84', 'E62E539A80D350E4CE604A49086ABF84', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('736', 'RENEALEJANDROVH', '79406860', '1', 'VELANDIA', 'HEREDIA', 'RENE', 'ALEJANDRO', 'RENEALEJANDROVH@GMAIL.COM', '9F3C732A3E22FE300C948BA9B2FF75EB', '9F3C732A3E22FE300C948BA9B2FF75EB', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('737', 'RODRIGO.G.FLORIAN', '1057576876', '1', 'GONZALEZ', 'FLORIAN', 'RODRIGO', null, 'RODRIGO.G.FLORIAN@GMAIL.COM', 'FFA76A342C08D9B182E6445C6666517F', 'FFA76A342C08D9B182E6445C6666517F', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('738', 'M.RUIZ', '52705572', '1', 'RUIZ', 'CÁRDENAS', 'MÓNICA', 'LILIANA', 'M.RUIZ@ANIMALESBOG.GOV.CO', '99234812A14B91CFDFB1EEE653DE1F40', '99234812A14B91CFDFB1EEE653DE1F40', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('739', 'O.NAVARRO', '79797685', '1', 'NAVARRO', 'MANRIQUE', 'OSCAR', 'ANDRES', 'O.NAVARRO@ANIMALESBOG.GOV.CO', 'E8F104D36D875755FAF3635937D07C27', 'E8F104D36D875755FAF3635937D07C27', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('740', 'M.PLAZAS', '1014190262', '1', 'PLAZAS', 'TORRES', 'MARCELA', null, 'M.PLAZAS@ANIMALESBOG.GOV.CO', 'FB95B74EAF49019FBF0B859A6CF82DCB', 'FB95B74EAF49019FBF0B859A6CF82DCB', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('741', 'LOGISTICA', '1010244969', '1', 'PEÑUELA', 'MOLINA', 'WILMER', 'ALBERTO', 'LOGISTICA@ANIMALESBOG.GOV.CO', '84037B6C0A85B0003BA3F5AD78DBF5AB', '84037B6C0A85B0003BA3F5AD78DBF5AB', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('742', 'GONZALEZ_JESSIKA', '1014209896', '1', 'GONZALEZ', 'ACOSTA', 'JESSIKA', 'PAOLA', 'GONZALEZ_JESSIKA@HOTMAIL.COM', '9D2BDF279B8B8A7A20CFDF0A70FD646A', '9D2BDF279B8B8A7A20CFDF0A70FD646A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('743', 'OCJI.PABLO', '1018462621', '1', 'OCAMPO', 'JIMENEZ', 'PABLO', null, 'OCJI.PABLO@GMAIL.COM', '033677FDDFA351F64EC4FA001AC4B7A3', '033677FDDFA351F64EC4FA001AC4B7A3', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('744', 'SANDRAMEDINA66', '53071415', '1', 'PILAR', 'MEDINA VANEGAS', 'SANDRA', 'DEL', 'SANDRAMEDINA66@GMAIL.COM', '123F44453705153FA24F69CDD097F8D2', '123F44453705153FA24F69CDD097F8D2', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('745', 'AMIDALA189', '1032430362', '1', 'BETANCOURT', 'GONZALEZ', 'MARIA', 'ANGELICA', 'AMIDALA189@MSN.COM', '086520378A29BC00746A59FB8A94A1B1', '086520378A29BC00746A59FB8A94A1B1', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('746', 'APOYOUNIDAD', '39657985', '1', 'PINZON', 'ZAMUDIO', 'CONSTANZA', null, 'APOYOUNIDAD@ANIMALESBOG.GOV.CO', '2FAF1B92CA0805F4A67AC2FA5AA95191', '2FAF1B92CA0805F4A67AC2FA5AA95191', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('747', 'OFERIT_2H', '1019078996', '1', 'ZAMORA', 'ROMERO', 'ANDRES', 'FELIPE', 'OFERIT_2H@HOTMAIL.COM', '7F7393872669352081198A4825C8FDED', '7F7393872669352081198A4825C8FDED', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('748', 'CARLOS.AMARTINEZ', '1032474961', '1', 'MARTINEZ', 'SICACHA', 'CARLOS', 'AUGUSTO', 'CARLOS.AMARTINEZ@UDCA.EDU.CO', '7E040B7AA17C407F24F4F81FFF744302', '7E040B7AA17C407F24F4F81FFF744302', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('749', 'DANIELESCOBARMV25', '1070706541', '1', 'ESCOBAR', 'CASTRO', 'DANIEL', 'LEONARDO', 'DANIELESCOBARMV25@OUTLOOK.COM', '8D957E31AC327B431F13465575017C08', '8D957E31AC327B431F13465575017C08', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('750', 'J.MENDEZ', '53893014', '1', 'MENDEZ', 'BERNAL', 'JENIFFER', 'ADRIANA', 'J.MENDEZ@ANIMALESBOG.GOV.CO', '76C872725514450409AE00261C5A5377', '76C872725514450409AE00261C5A5377', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('751', 'M.RIVERA', '35493527', '1', 'RIVERA', 'CARDENAS', 'MARGARITA', null, 'M.RIVERA@ANIMALESBOG.GOV.CO', '6ACA20DA95411A1057B14B3C3BC64F32', '6ACA20DA95411A1057B14B3C3BC64F32', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('752', 'JESSIEMG1988', '1022345181', '1', 'GONZALEZ', 'MURCIA', 'YESICA', 'MARCELA', 'JESSIEMG1988@GMAIL.COM', 'A75D4FDC8B4BE4C01C5A6E241953C482', 'A75D4FDC8B4BE4C01C5A6E241953C482', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('753', 'YAMIRBRAVO72', '93293199', '1', null, 'BRAVO', 'YAMIR', null, 'YAMIRBRAVO72@HOTMAIL.COM', '5129851666966476A4C0595C149BC49E', '5129851666966476A4C0595C149BC49E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('754', 'LAMATSU_1946', '1031132969', '1', 'SANCHEZ', 'PULIDO', 'VIVIANA', 'CAROLINA', 'LAMATSU_1946@HOTMAIL.COM', 'F6DB62234B6478DCDC0C02C09330C426', 'F6DB62234B6478DCDC0C02C09330C426', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('755', 'NAKAJIMA_RYU1512', '80152989', '1', 'YEPES', 'SANTOS', 'MIGUEL', 'ANTONIO', 'NAKAJIMA_RYU1512@HOTMAIL.COM', '34299A6F0A65130891AC2F59073683E5', '34299A6F0A65130891AC2F59073683E5', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('756', 'LIMA58513', '1013607399', '1', 'CIFUENTES', 'GUZMAN', 'LINA', 'MARIA', 'LIMA58513@GMAIL.COM', 'A9E5B5A310B9FD1D66DF785A232AF37F', 'A9E5B5A310B9FD1D66DF785A232AF37F', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('757', 'EDWREYVA', '79861608', '1', 'REYES', 'VANEGAS', 'EDWIN', null, 'EDWREYVA@GMAIL.COM', '661030262313E8BDD2A1473C291110CA', '661030262313E8BDD2A1473C291110CA', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('758', 'CRUZE79', '79879916', '1', 'CRUZ', 'BAYONA', 'EDWIN', 'GIOVANNY', 'CRUZE79@HOTMAIL.COM', '7455369D4662B75B6368CB7CD00B8F0A', '7455369D4662B75B6368CB7CD00B8F0A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('759', 'NATALIALADINO3', '1010233076', '1', 'LADINO', 'GRANADOS', 'DINARI', 'NATALIA', 'NATALIALADINO3@GMAIL.COM', 'BB90568E67A460DB8678EC7177310174', 'BB90568E67A460DB8678EC7177310174', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('760', 'VJONATHAN0224', '80856844', '1', 'VILLALOBOS', 'LOPEZ', 'JONATHAN', null, 'VJONATHAN0224@HOTMAIL.COM', '8F1F80AF9BA2BF4C36C986CD9E23C3B0', '8F1F80AF9BA2BF4C36C986CD9E23C3B0', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('761', 'JOHAN-MORENO1', '1019018596', '1', 'MORENO', 'VELASQUEZ', 'JOHAN', 'SEBASTIAN', 'JOHAN-MORENO1@HOTMAIL.COM', 'FB15E152A83DB0C8A8A8D14057F0E475', 'FB15E152A83DB0C8A8A8D14057F0E475', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('762', 'M.VILLEGAS', '1022354295', '1', 'VILLEGAS', 'HOLGUIN', 'MARIA', 'ISABEL', 'M.VILLEGAS@ANIMALESBOG.GOV.CO', '0F7E9BD7948178FC93104ABA412F98B6', '0F7E9BD7948178FC93104ABA412F98B6', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('763', 'PATICOVET13', '52239196', '1', 'MARTINEZ', 'GUTIERREZ', 'ROSA', 'PATRICIA', 'PATICOVET13@GMAIL.COM', '5E0590C12F5157C396D4E4AF14018148', '5E0590C12F5157C396D4E4AF14018148', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('764', 'MISABEL1923', '35318520', '1', 'MORA', 'BERMUDEZ', 'MARTHA', 'ISABEL', 'MISABEL1923@GMAIL.COM', 'D01BCDF7E8C0D948A4F9E4739353B044', 'D01BCDF7E8C0D948A4F9E4739353B044', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('765', 'LILIBALLESTEROS2.7', '1049605467', '1', 'BALLESTEROS', 'CHAPARRO', 'LILIANA', 'PATRICIA', 'LILIBALLESTEROS2.7@HOTMAIL.COM', '5D618387D7EC7BB87982128926F81194', '5D618387D7EC7BB87982128926F81194', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('766', 'COMBA52', '52998015', '1', 'COMBARIZA', 'AMÓRTEGUI', 'NATHALIA', null, 'COMBA52@MSN.COM', 'B7951C05765A6F7F6CB6D0BC01301778', 'B7951C05765A6F7F6CB6D0BC01301778', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('767', 'A.MONGE', '52818253', '1', 'MONGE', 'ROMERO', 'AMERICA', 'YADIRA', 'A.MONGE@ANIMALESBOG.GOV.CO', 'EBB65705BB21E64391B93F2CC0907754', 'EBB65705BB21E64391B93F2CC0907754', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('768', 'C.VELASQUEZ', '52910135', '1', 'VELASQUEZ', 'PEÑAS', 'CATALINA', 'MARIA', 'C.VELASQUEZ@ANIMALESBOG.GOV.CO', 'CB210761A338C4689FD35FD20BCCF0D9', 'CB210761A338C4689FD35FD20BCCF0D9', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('769', 'LEVIROMVZ-24', '1114813970', '1', 'ROJAS', 'MARTINEZ', 'LEIDY', 'VIVIANA', 'LEVIROMVZ-24@HOTMAIL.COM', '6541EC5D17970BF7B3C8DC179D3AA139', '6541EC5D17970BF7B3C8DC179D3AA139', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('770', 'NICOLAS_ZM', '1020740050', '1', 'ZAMBRANO', 'MORENO', 'NICOLAS', null, 'NICOLAS_ZM@MSN.COM', '060DED65A5CCA15D5CECBB8F12F2FF5C', '060DED65A5CCA15D5CECBB8F12F2FF5C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('771', 'COOPNALPROGRESO', '52272639', '1', 'VALENTIN', 'GUEVARA', 'JACQUELINE', null, 'COOPNALPROGRESO@HOTMAIL.COM', 'A9595505BBF16CD9631664165D7194D6', 'A9595505BBF16CD9631664165D7194D6', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('772', 'LERMALER', '80778130', '1', 'LERMA', 'MOSCOSO', 'FAUSTO', 'ALEJANDRO', 'LERMALER@HOTMAIL.COM', 'C1A7D9FC765D976C8F6599DDD7C2143E', 'C1A7D9FC765D976C8F6599DDD7C2143E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('773', 'OMAR4715', '79739567', '1', 'ROMERO', 'AGUIRRE', 'OMAR', 'HUMBERTO', 'OMAR4715@HOTMAIL.COM', '6C3040C7261501EB22F87711C90E24C8', '6C3040C7261501EB22F87711C90E24C8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('774', 'VANEEDUQUE797', '1010173486', '1', 'DUQUE', 'BAENA', 'VANESSA', null, 'VANEEDUQUE797@HOTMAIL.COM', 'A259C74632F0D1C9EA30D3188F64BCBF', 'A259C74632F0D1C9EA30D3188F64BCBF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('775', 'YANBRA23', '1026563864', '1', 'CASTRO', 'TORRES', 'MIGUEL', 'BRIAN', 'YANBRA23@HOTMAIL.COM', '86418677618D0311C04E936ABD88C8DE', '86418677618D0311C04E936ABD88C8DE', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('776', 'NAMAGOS94', '1032465295', '1', 'GONZALEZ', 'OSPINA', 'NATALIA', 'MARCELA', 'NAMAGOS94@HOTMAIL.COM', '36F4C6E61E77812B40742483B6C7E62E', '36F4C6E61E77812B40742483B6C7E62E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('777', 'ANDREABENASA', '1020810754', '1', 'BENAVIDES', 'SANCHEZ', 'JHOHANNA', 'ANDREA', 'ANDREABENASA@GMAIL.COM', '9D786C334A1DD746EC5F86B361051E7A', '9D786C334A1DD746EC5F86B361051E7A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('778', 'JRFA_17', '1015400300', '1', 'FLOREZ', 'ARIZA', 'JOSE', 'RICARDO', 'JRFA_17@HOTMAIL.COM', '6D1DEFF02AF023F4FAEAC3EB71339ABC', '6D1DEFF02AF023F4FAEAC3EB71339ABC', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('779', 'SEBAS_1948', '1014208456', '1', 'MONTAÑO', 'PINZON', 'SEBASTIAN', 'DANIEL', 'SEBAS_1948@HOTMAIL.COM', '2A86ED97DD053EB7B5001B9DB670043B', '2A86ED97DD053EB7B5001B9DB670043B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('780', 'KARITOCASTRO150', '52835811', '1', 'CASTRO', 'CASTILLO', 'LILIANA', 'CAROLINA', 'KARITOCASTRO150@HOTMAIL.COM', '465E5BFB51285C3ED4D73A56B8C7EC26', '465E5BFB51285C3ED4D73A56B8C7EC26', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('781', 'D.LAVERDE', '28540797', '1', 'LAVERDE', 'GARCIA', 'DIANA', 'MARLEY', 'D.LAVERDE@ANIMALESBOG.GOV.CO', 'BD087EFA38C35AB5A0E5EEDC3E8B9CE4', 'BD087EFA38C35AB5A0E5EEDC3E8B9CE4', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('782', 'NICOLASCAMARGOPUENTES', '1013633678', '1', 'CAMARGO', 'PUENTES', 'NICOLAS', null, 'NICOLASCAMARGOPUENTES@HOTMAIL.COM', 'C735A3F7A2C3716282F33B88C1065149', 'C735A3F7A2C3716282F33B88C1065149', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('783', 'YIRADARVI', '1020800998', '1', 'ARDILA', 'VILLARRAGA', 'YIRA', 'DAMARIS', 'YIRADARVI@HOTMAIL.COM', '3B103EB34F130497BD0CB5A6E37C7621', '3B103EB34F130497BD0CB5A6E37C7621', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('784', 'MAFEPG1982', '52966041', '1', 'PELAEZ', 'GOMEZ', 'MARIA', 'FERNANDA', 'MAFEPG1982@HOTMAIL.COM', '37C1A8D5CEE69A56CE2AE6ADE06441D7', '37C1A8D5CEE69A56CE2AE6ADE06441D7', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('785', 'MAIAOCAMPO', '1030541685', '1', 'PILAR', 'OCAMPO CASTAÑEDA', 'MARIA', 'DEL', 'MAIAOCAMPO@GMAIL.COM', 'D0B94CEDF32CDE3D26D1F15410DF4F6D', 'D0B94CEDF32CDE3D26D1F15410DF4F6D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('786', 'JHONYPAULBOLANOS', '12181714', '1', 'BOLAÑOS', 'FLOR', 'JHONY', 'PAUL', 'JHONYPAULBOLANOS@GMAIL.COM', '64C18AEF46F5392128176B0FA604FE52', '64C18AEF46F5392128176B0FA604FE52', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('787', 'CRISTANCHOS', '53073823', '1', 'CRISTANCHO', 'SANCHEZ', 'SONIA', 'VIVIANA', 'CRISTANCHOS@GMAIL.COM', '938683E843A0B8D5A77E0437CEFD77C8', '938683E843A0B8D5A77E0437CEFD77C8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('788', 'ADMONUNIDAD', '80160455', '1', 'SALAZAR', 'SARMIENTO', 'FABIAN', 'ALEXANDER', 'ADMONUNIDAD@ANIMALESBOG.GOV.CO', '941B8E2C55BE0AF069791FDA9782669B', '941B8E2C55BE0AF069791FDA9782669B', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('789', 'ALMACENUNIDAD', '51801095', '1', 'RODRIGUEZ', 'RINCON', 'MARTHA', 'LUCIA', 'ALMACENUNIDAD@ANIMALESBOG.GOV.CO', '66FC95BC8F06318163970FC6B32F8063', '66FC95BC8F06318163970FC6B32F8063', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('790', 'GESTION.AMBIENTAL', '1026289462', '1', 'TABARES', 'SEGOVIA', 'LIZ', 'VALENTINA', 'GESTION.AMBIENTAL@ANIMALESBOG.GOV.CO', '5DABE697EBEC7DD2E89B97B97D47E91E', '5DABE697EBEC7DD2E89B97B97D47E91E', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('791', 'J.MORENO', '1136885707', '1', 'MORENO', 'SABOGAL', 'JOHN', 'SEBASTIAN', 'J.MORENO@ANIMALESBOG.GOV.CO', '721E5D0E6021CB854DD3331098E3BED3', '721E5D0E6021CB854DD3331098E3BED3', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('792', 'M.JIMENEZ', '52382386', '1', 'JIMENEZ', 'ARANGO', 'MONICA', 'MILENA', 'M.JIMENEZ@ANIMALESBOG.GOV.CO', '275D1E2127A15B0E0E2A0F09C924467D', '275D1E2127A15B0E0E2A0F09C924467D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('793', 'L.FERNANDEZ', '1019132591', '1', 'FERNANDEZ', 'CAICEDO', 'LAURA', null, 'L.FERNANDEZ@ANIMALESBOG.GOV.CO', '5A5393DAC3D66DE78D17EBBAB98F7A5C', '5A5393DAC3D66DE78D17EBBAB98F7A5C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('794', 'L.CASTILLO', '52518354', '1', 'CASTILLO', 'GARCIA', 'LUZ', 'JOHANA', 'L.CASTILLO@ANIMALESBOG.GOV.CO', '0CA1A89FD584D16DAC64B75C0FBD845A', '0CA1A89FD584D16DAC64B75C0FBD845A', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('795', 'R.MENJUREN', '51741190', '1', 'MENJUREN', 'PIRAGAUTA', 'ROSA', 'IMELDA', 'R.MENJUREN@ANIMALESBOG.GOV.CO', '339BBF62E6A56353DB7BAA349A976ADD', '339BBF62E6A56353DB7BAA349A976ADD', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('796', 'DANIEL.PEREZCAS97', '1018492289', '1', 'PEREZ', 'CASTELLANOS', 'DANIEL', 'ALBERTO', 'DANIEL.PEREZCAS97@GMAIL.COM', '5D5F3030DE054D5D23E291A1A8F953F4', '5D5F3030DE054D5D23E291A1A8F953F4', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('797', 'L.MORENO', '1014247154', '1', 'MORENO', 'VARGAS', 'LAURA', 'MARCELA', 'L.MORENO@ANIMALESBOG.GOV.CO', '7396FDBFEA11A0C8260132BDBD06545C', '7396FDBFEA11A0C8260132BDBD06545C', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('798', 'WEBMASTER', '5829056', '1', 'TRIBIN', 'PEREA', 'JUAN', 'CARLOS', 'WEBMASTER@ANIMALESBOG.GOV.CO', '1C9D0928A0041A3B6B51ED82733FE512', '1C9D0928A0041A3B6B51ED82733FE512', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('799', 'JOHNCIFU', '80125481', '1', 'CIFUENTES', 'GUZMAN', 'JHON', 'FREDY', 'JOHNCIFU@GMAIL.COM', 'F8A5D97B4398F12470AB4106E1C04A9D', 'F8A5D97B4398F12470AB4106E1C04A9D', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('800', 'DCAROLINMN', '1015404297', '1', 'MARTIN', 'NIÑO', 'DIANA', 'CAROLINA', 'DCAROLINMN@GMAIL.COM', '9DE375985A684AB75EC14FF6827803BF', '9DE375985A684AB75EC14FF6827803BF', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('801', 'SISTEMASINFORMACION', '79694150', '1', 'BERNAL', 'PEDRAZA', 'GUILLERMO', 'ADOLFO', 'SISTEMASINFORMACION@ANIMALESBOG.GOV.CO', 'FCD7A4759BF38B0F6B3872EAFCFB47C8', 'FCD7A4759BF38B0F6B3872EAFCFB47C8', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('802', 'N.DEVIA', '52226110', '1', 'DEVIA', 'CRIOLLO', 'NURY', 'DOLORES', 'N.DEVIA@ANIMALESBOG.GOV.CO', '491EBC85B4DDB0B09481A0DEFB6CF0A2', '491EBC85B4DDB0B09481A0DEFB6CF0A2', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('803', 'J.PEREZ', '1031123888', '1', 'PEREZ', 'CONTRERAS / ALMA SOLUCIONES INTEGRALES', 'JOSE', 'ALFONSO', 'J.PEREZ@ANIMALESBOG.GOV.CO', 'CE4D8C4ED334139B450933C7692C0B07', 'CE4D8C4ED334139B450933C7692C0B07', '1', '2020-11-14 18:06:11', 'img/user-icon.png', null, '1', '1');
INSERT INTO `persona` VALUES ('804', 'josecarlos', '1234567', '1', 'moreno', 'gutierres', 'carlos', 'jose', 'carlos@hotmail.com', '1234567', '1234567', '1', '2020-12-29 21:43:27', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('809', 'josecarlos11', '123456700', '1', 'e', 'r', 'trtyty', 'yr5', 'carlos11@hotmail.com', '12345670', '12345670', '1', '2020-12-30 21:35:08', 'img/user-icon.png', null, '2', '3');
INSERT INTO `persona` VALUES ('810', 'josecarlos1133', '123456733', '1', 'moreno', 'Hernandez', 'Luisrtt', 'jose', 'carlostgg@hotmail.com', '1234567', '1234567', '1', '2020-12-30 21:40:03', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('811', 'josecarlos12II', '1234567999', null, null, null, null, null, null, null, null, '1', '2020-12-31 00:27:28', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('812', 'josecarlos12122', '123456711', '1', 'robledo', 'mena', 'andres', 'stiven', 'carlos12we@hotmail.com', '1234567', '1234567', '1', '2020-12-31 19:55:01', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('813', 'josecarlos12wr', '1234567456', '1', 'moreno', 'lkjg', 'fds', 'fh', 'carlos11fddff@hotmail.com', '1234567', '1234567', '1', '2020-12-31 20:05:31', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('814', 'josecarlos1244', '123456745', '1', 'moreno', '', 'migul', '', '', '1234567', '1234567', '1', '2020-12-31 21:19:08', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('823', 'josecarlos12dgdd', '12345674544', '1', 'moreno', '', 'fg', '', 'carlostggd@hotmail.com', '1234567', '1234567', '1', '2020-12-31 22:46:44', 'img/user-icon.png', null, '2', '1');
INSERT INTO `persona` VALUES ('825', 'BORIS', '10001111', '1', 'Barboza', 'Barboza', 'Boris', 'Alfredo', 'babc.ingeniero@gmail.com ', 'Test123', 'Test123', '1', '2021-02-11 19:37:20', 'img/user-icon.png', null, '1', '1');

-- ----------------------------
-- Table structure for sexo
-- ----------------------------
DROP TABLE IF EXISTS `sexo`;
CREATE TABLE `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sexo
-- ----------------------------
INSERT INTO `sexo` VALUES ('1', 'Masculino');
INSERT INTO `sexo` VALUES ('2', 'Femenino');
INSERT INTO `sexo` VALUES ('3', 'NA');
INSERT INTO `sexo` VALUES ('4', 'rf');
INSERT INTO `sexo` VALUES ('5', 'r');
INSERT INTO `sexo` VALUES ('6', 're');

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES ('1', 'CEDULA');
INSERT INTO `tipo_documento` VALUES ('2', 'NIT');

-- ----------------------------
-- Table structure for tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_usuario
-- ----------------------------
INSERT INTO `tipo_usuario` VALUES ('1', 'Contratista');
INSERT INTO `tipo_usuario` VALUES ('2', 'Planta');
