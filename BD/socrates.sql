/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : socrates

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-02-23 13:58:06
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
INSERT INTO `admin_acceso` VALUES ('4', 'Estudiantes');
INSERT INTO `admin_acceso` VALUES ('5', 'Docentes');
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
  `requiere_permiso` char(1) NOT NULL DEFAULT 'S',
  `descripcion` blob DEFAULT NULL,
  `fechar` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_accion_pkey` (`id`),
  UNIQUE KEY `menu_accion_cod_menu_nombre_acc` (`menu`,`accion`) USING BTREE,
  KEY `admin_menu_accion_fk1_idx` (`menu`),
  KEY `admin_menu_accion_fk2_idx` (`tipo_accion`),
  CONSTRAINT `admin_menu_accion_fk1` FOREIGN KEY (`menu`) REFERENCES `admin_menu` (`menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_menu_accion_fk2` FOREIGN KEY (`tipo_accion`) REFERENCES `admin_tipo_accion` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4417 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_accion
-- ----------------------------
INSERT INTO `admin_accion` VALUES ('1', 'inicio', 'ver', 'pagina', 'inicio.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2', 'cerrar-sesion', 'cerrarSesion', 'json', 'cerrar_sesion.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('3', 'iniciar-sesion', 'ver', 'pagina', 'iniciar_sesion.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('4', 'iniciar-sesion', 'iniciar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1133', 'roles', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1134', 'roles', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1135', 'roles', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1136', 'roles', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1137', 'roles', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1138', 'roles', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1139', 'permisos-por-rol', 'cargar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1140', 'permisos-por-rol', 'guardar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1141', 'permisos-por-rol', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1182', 'cambiar-clave', 'ver', 'pagina', 'index.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1183', 'cambiar-clave', 'cambiar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1403', 'crear-formulario-crud', 'ver', 'pagina', 'formulario.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1405', 'crear-formulario-crud', 'cargarInfoFormulario', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1406', 'crear-formulario-crud', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1407', 'crear-formulario-crud', 'verificar', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1640', 'crear-formulario-libre', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1641', 'crear-formulario-libre', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1642', 'crear-formulario-libre', 'verificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1793', 'crear-reporte', 'ver', 'pagina', 'formulario.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1794', 'crear-reporte', 'generar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1795', 'crear-reporte', 'verificar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1796', 'crear-reporte', 'cargarCampos', 'html', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1797', 'crear-reporte', 'vistaPrevia', 'descarga', 'vista_previa.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1855', 'usuarios', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1856', 'usuarios', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1857', 'usuarios', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1858', 'usuarios', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1859', 'usuarios', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1860', 'usuarios', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1861', 'usuarios', 'listarPersonas', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1862', 'gestion-de-acciones', 'agregar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1863', 'gestion-de-acciones', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1864', 'gestion-de-acciones', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1865', 'gestion-de-acciones', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1866', 'gestion-de-acciones', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1867', 'gestion-de-acciones', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1868', 'cerrar-sesion', 'd', 'html', 'd', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1870', 'cambiar-clave', 'f', 'html', 'f', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1873', 'cambiar-clave', 'ff', 'html', 'f', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1910', 'gestion-menu', 'agregar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1911', 'gestion-menu', 'modificar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1912', 'gestion-menu', 'eliminar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1913', 'gestion-menu', 'listar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1914', 'gestion-menu', 'asignar', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('1915', 'gestion-menu', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2009', 'perfil', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2010', 'perfil', 'aceptar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2413', 'perfil', 'cambiar_clave', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2414', 'perfil', 'cambiar_foto', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2821', 'perfil', 'cambiar_firma', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('2949', 'inicio', 'set_token', 'json', 'acciones.php', 'N', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('3036', 'buscar', 'ver', 'pagina', 'formulario.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('3037', 'buscar', 'aceptar', 'json', 'acciones.php', 'S', 0x30, '2020-06-06 08:47:41');
INSERT INTO `admin_accion` VALUES ('4178', 'iniciar-sesion', 'set_login', 'json', 'acciones.php', 'S', null, '2020-06-06 10:50:38');
INSERT INTO `admin_accion` VALUES ('4206', 'usabilidad-sistema', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-12 15:18:38');
INSERT INTO `admin_accion` VALUES ('4207', 'usabilidad-sistema', 'cargar', 'json', 'acciones.php', 'S', 0x5065726D6974656361726761726C61696E666F726D6163696E696E696369616C64656C617669737461, '2020-06-12 15:18:38');
INSERT INTO `admin_accion` VALUES ('4208', 'usabilidad-sistema', 'ver_detalles_usuario', 'json', 'acciones.php', 'S', 0x5065726D697465766572656C646574616C6C6573646575736162696C69646164706F727573756172696F, '2020-06-12 15:18:38');
INSERT INTO `admin_accion` VALUES ('4209', 'editor-codigos', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-12 15:22:42');
INSERT INTO `admin_accion` VALUES ('4210', 'editor-codigos', 'listar_archivos', 'json', 'acciones.php', 'S', 0x5065726D6974656C69737461726C6F736172636869766F7364656C6F736D64756C6F7364656C73697374656D61, '2020-06-12 15:22:42');
INSERT INTO `admin_accion` VALUES ('4211', 'editor-codigos', 'guardar', 'json', 'acciones.php', 'S', 0x5065726D697465677561726461726C61696E666F726D6163696E71756573656564697461, '2020-06-12 15:22:42');
INSERT INTO `admin_accion` VALUES ('4212', 'editor-codigos', 'obtener', 'json', 'acciones.php', 'S', 0x5065726D6974656F6274656E6572656C636F6E74656E69646F64656C6172636869766F717565736564657361656469746172, '2020-06-12 15:22:42');
INSERT INTO `admin_accion` VALUES ('4213', 'inicio', 'agregar_favorito', 'json', 'acciones.php', 'N', null, '2020-06-15 15:58:26');
INSERT INTO `admin_accion` VALUES ('4214', 'ejemplos-alerts', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:03:01');
INSERT INTO `admin_accion` VALUES ('4215', 'ejemplos-alerts', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:03:01');
INSERT INTO `admin_accion` VALUES ('4216', 'ejemplos-accordion', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:03:31');
INSERT INTO `admin_accion` VALUES ('4217', 'ejemplos-accordion', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:03:31');
INSERT INTO `admin_accion` VALUES ('4218', 'ejemplos-buttons', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:04:10');
INSERT INTO `admin_accion` VALUES ('4219', 'ejemplos-buttons', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:04:10');
INSERT INTO `admin_accion` VALUES ('4220', 'ejemplos-dropdown', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:04:36');
INSERT INTO `admin_accion` VALUES ('4221', 'ejemplos-dropdown', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:04:36');
INSERT INTO `admin_accion` VALUES ('4222', 'ejemplos-modal', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:05:31');
INSERT INTO `admin_accion` VALUES ('4223', 'ejemplos-modal', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:05:31');
INSERT INTO `admin_accion` VALUES ('4224', 'ejemplos-tab', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:06:16');
INSERT INTO `admin_accion` VALUES ('4225', 'ejemplos-tab', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:06:16');
INSERT INTO `admin_accion` VALUES ('4226', 'ejemplos-popovers', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:06:42');
INSERT INTO `admin_accion` VALUES ('4227', 'ejemplos-popovers', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:06:42');
INSERT INTO `admin_accion` VALUES ('4228', 'ejemplos-tooltip', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:07:08');
INSERT INTO `admin_accion` VALUES ('4229', 'ejemplos-tooltip', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:07:08');
INSERT INTO `admin_accion` VALUES ('4230', 'ejemplos-tablas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:39:26');
INSERT INTO `admin_accion` VALUES ('4231', 'ejemplos-tablas', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:39:26');
INSERT INTO `admin_accion` VALUES ('4232', 'ejemplos-datatables', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:40:29');
INSERT INTO `admin_accion` VALUES ('4233', 'ejemplos-datatables', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:40:29');
INSERT INTO `admin_accion` VALUES ('4236', 'ejemplos-tablas-responsivas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-06-16 10:45:34');
INSERT INTO `admin_accion` VALUES ('4237', 'ejemplos-tablas-responsivas', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2020-06-16 10:45:34');
INSERT INTO `admin_accion` VALUES ('4282', 'gestion_docente', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4283', 'gestion_docente', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4284', 'gestion_docente', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4285', 'gestion_docente', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4286', 'gestion_docente', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4287', 'gestion_docente', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2020-12-30 11:29:32');
INSERT INTO `admin_accion` VALUES ('4331', 'ruta-academica', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4332', 'ruta-academica', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4333', 'ruta-academica', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4334', 'ruta-academica', 'lista', 'json', 'lista.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4335', 'ruta-academica', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4336', 'ruta-academica', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-01-02 15:42:43');
INSERT INTO `admin_accion` VALUES ('4337', 'ruta-academica', 'llenar_combo', 'json', 'llenar.php', 'N', null, '2021-01-04 11:05:46');
INSERT INTO `admin_accion` VALUES ('4338', 'ruta-academica', 'gestion_materia', 'pagina', 'gestionar_materia.php', 'N', null, '2021-01-04 13:14:13');
INSERT INTO `admin_accion` VALUES ('4339', 'gestion-curricular', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4340', 'gestion-curricular', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4341', 'gestion-curricular', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4342', 'gestion-curricular', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4343', 'gestion-curricular', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4344', 'gestion-curricular', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-01-04 17:51:27');
INSERT INTO `admin_accion` VALUES ('4353', 'gestion-academica', 'ver', 'pagina', 'formulario.php', 'S', null, '2021-02-02 15:19:06');
INSERT INTO `admin_accion` VALUES ('4354', 'ruta-academica-list', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-02 15:32:50');
INSERT INTO `admin_accion` VALUES ('4355', 'ruta-academica-list', 'aceptar', 'json', 'acciones.php', 'S', 0x41636570746172, '2021-02-02 15:32:50');
INSERT INTO `admin_accion` VALUES ('4356', 'ruta-academica', 'crear', 'json', 'acciones.php', 'N', null, '2021-02-05 09:21:45');
INSERT INTO `admin_accion` VALUES ('4357', 'ruta-academica-list', 'operaciones', 'json', 'acciones.php', 'S', null, '2021-02-05 12:54:45');
INSERT INTO `admin_accion` VALUES ('4358', 'ruta-academica-list', 'listar', 'json', 'acciones.php', 'S', null, '2021-02-07 04:28:00');
INSERT INTO `admin_accion` VALUES ('4359', 'ruta-academica-list', 'getData', 'json', 'acciones.php', 'S', null, '2021-02-07 05:17:23');
INSERT INTO `admin_accion` VALUES ('4360', 'areas', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4361', 'areas', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4362', 'areas', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4363', 'areas', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4364', 'areas', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4365', 'areas', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:25:51');
INSERT INTO `admin_accion` VALUES ('4372', 'competencias', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4373', 'competencias', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4374', 'competencias', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4375', 'competencias', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4376', 'competencias', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4377', 'competencias', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:28:00');
INSERT INTO `admin_accion` VALUES ('4378', 'cursos', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4379', 'cursos', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4380', 'cursos', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4381', 'cursos', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4382', 'cursos', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4383', 'cursos', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:28:32');
INSERT INTO `admin_accion` VALUES ('4384', 'materias', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4385', 'materias', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4386', 'materias', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4387', 'materias', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4388', 'materias', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4389', 'materias', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:29:17');
INSERT INTO `admin_accion` VALUES ('4390', 'periodos', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4391', 'periodos', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4392', 'periodos', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4393', 'periodos', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4394', 'periodos', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4395', 'periodos', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:31:04');
INSERT INTO `admin_accion` VALUES ('4396', 'periodo-escolar', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4397', 'periodo-escolar', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4398', 'periodo-escolar', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4399', 'periodo-escolar', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4400', 'periodo-escolar', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4401', 'periodo-escolar', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:31:21');
INSERT INTO `admin_accion` VALUES ('4402', 'vigencia', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:57');
INSERT INTO `admin_accion` VALUES ('4403', 'vigencia', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:57');
INSERT INTO `admin_accion` VALUES ('4404', 'vigencia', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:31:58');
INSERT INTO `admin_accion` VALUES ('4405', 'vigencia', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:31:58');
INSERT INTO `admin_accion` VALUES ('4406', 'vigencia', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:31:58');
INSERT INTO `admin_accion` VALUES ('4407', 'vigencia', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:31:58');
INSERT INTO `admin_accion` VALUES ('4408', 'asignacion-materias', 'agregar', 'json', 'acciones.php', 'S', 0x5065726D697465206167726567617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4409', 'asignacion-materias', 'modificar', 'json', 'acciones.php', 'S', 0x5065726D697465206D6F6469666963617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4410', 'asignacion-materias', 'eliminar', 'json', 'acciones.php', 'S', 0x5065726D69746520656C696D696E617220726567697374726F7320656E206C612062617365206465206461746F73, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4411', 'asignacion-materias', 'listar', 'json', 'acciones.php', 'N', 0x5065726D6974652063617267617220656C2047524944206465736465206C612062617365206465206461746F73, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4412', 'asignacion-materias', 'asignar', 'json', 'acciones.php', 'N', 0x5065726D697465206F6274656E6572207920666F726D6174656172206C617320636F6E73756C7461732061206C612062617365206465206461746F73, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4413', 'asignacion-materias', 'ver', 'pagina', 'formulario.php', 'S', 0x5065726D69746520636172676172206C612076697374612064656C20666F726D756C6172696F20284D564329, '2021-02-09 09:33:32');
INSERT INTO `admin_accion` VALUES ('4415', 'areas', 'listarPersonas', 'json', 'acciones.php', 'S', null, '2021-02-09 09:53:40');
INSERT INTO `admin_accion` VALUES ('4416', 'asignacion-materias', 'listarPersonas', 'json', 'acciones.php', 'S', null, '2021-02-12 15:46:33');

-- ----------------------------
-- Table structure for admin_favoritos
-- ----------------------------
DROP TABLE IF EXISTS `admin_favoritos`;
CREATE TABLE `admin_favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_persona`,`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_favoritos
-- ----------------------------
INSERT INTO `admin_favoritos` VALUES ('5', '1', '1');
INSERT INTO `admin_favoritos` VALUES ('7', '1', '449');

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
) ENGINE=InnoDB AUTO_INCREMENT=2726 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:35:09');
INSERT INTO `admin_log` VALUES ('2', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:35:11');
INSERT INTO `admin_log` VALUES ('3', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:36:16');
INSERT INTO `admin_log` VALUES ('4', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:36:18');
INSERT INTO `admin_log` VALUES ('5', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:36:43');
INSERT INTO `admin_log` VALUES ('6', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:36:45');
INSERT INTO `admin_log` VALUES ('7', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:38:32');
INSERT INTO `admin_log` VALUES ('8', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:38:34');
INSERT INTO `admin_log` VALUES ('9', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:39:29');
INSERT INTO `admin_log` VALUES ('10', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:39:31');
INSERT INTO `admin_log` VALUES ('11', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:39:48');
INSERT INTO `admin_log` VALUES ('12', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:39:50');
INSERT INTO `admin_log` VALUES ('13', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:41:29');
INSERT INTO `admin_log` VALUES ('14', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:41:32');
INSERT INTO `admin_log` VALUES ('15', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:42:02');
INSERT INTO `admin_log` VALUES ('16', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:42:04');
INSERT INTO `admin_log` VALUES ('17', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:42:19');
INSERT INTO `admin_log` VALUES ('18', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:42:21');
INSERT INTO `admin_log` VALUES ('19', '1', 'editor-codigos', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:42:31');
INSERT INTO `admin_log` VALUES ('20', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:42:33');
INSERT INTO `admin_log` VALUES ('21', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-14 15:51:06');
INSERT INTO `admin_log` VALUES ('22', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-14 15:51:07');
INSERT INTO `admin_log` VALUES ('23', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:53:00');
INSERT INTO `admin_log` VALUES ('24', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:53:02');
INSERT INTO `admin_log` VALUES ('25', '1', 'gestion-menu', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:53:06');
INSERT INTO `admin_log` VALUES ('26', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:53:07');
INSERT INTO `admin_log` VALUES ('27', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 15:53:07');
INSERT INTO `admin_log` VALUES ('28', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 15:53:08');
INSERT INTO `admin_log` VALUES ('29', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-06-15 15:53:16');
INSERT INTO `admin_log` VALUES ('30', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-06-15 15:53:19');
INSERT INTO `admin_log` VALUES ('31', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-06-15 15:53:26');
INSERT INTO `admin_log` VALUES ('32', '1', 'gestion-menu', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:53:47');
INSERT INTO `admin_log` VALUES ('33', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:53:48');
INSERT INTO `admin_log` VALUES ('34', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 15:53:48');
INSERT INTO `admin_log` VALUES ('35', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:53:56');
INSERT INTO `admin_log` VALUES ('36', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:53:57');
INSERT INTO `admin_log` VALUES ('37', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:58:02');
INSERT INTO `admin_log` VALUES ('38', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:58:03');
INSERT INTO `admin_log` VALUES ('39', '1', 'inicio', '404.php', null, '2', 'Vinculo no valido !!!', '2020-06-15 15:58:04');
INSERT INTO `admin_log` VALUES ('40', '1', 'gestion-de-acciones', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:58:11');
INSERT INTO `admin_log` VALUES ('41', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:58:13');
INSERT INTO `admin_log` VALUES ('42', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 15:58:13');
INSERT INTO `admin_log` VALUES ('43', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 15:58:18');
INSERT INTO `admin_log` VALUES ('44', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2020-06-15 15:58:26');
INSERT INTO `admin_log` VALUES ('45', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 15:58:30');
INSERT INTO `admin_log` VALUES ('46', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 15:58:30');
INSERT INTO `admin_log` VALUES ('47', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 15:58:36');
INSERT INTO `admin_log` VALUES ('48', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:09:29');
INSERT INTO `admin_log` VALUES ('49', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:09:31');
INSERT INTO `admin_log` VALUES ('50', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:09:32');
INSERT INTO `admin_log` VALUES ('51', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:09:45');
INSERT INTO `admin_log` VALUES ('52', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:09:46');
INSERT INTO `admin_log` VALUES ('53', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:09:48');
INSERT INTO `admin_log` VALUES ('54', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:09:51');
INSERT INTO `admin_log` VALUES ('55', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:11:48');
INSERT INTO `admin_log` VALUES ('56', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:11:50');
INSERT INTO `admin_log` VALUES ('57', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:12:49');
INSERT INTO `admin_log` VALUES ('58', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:12:51');
INSERT INTO `admin_log` VALUES ('59', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:12:55');
INSERT INTO `admin_log` VALUES ('60', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:13:14');
INSERT INTO `admin_log` VALUES ('61', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:13:16');
INSERT INTO `admin_log` VALUES ('62', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:13:17');
INSERT INTO `admin_log` VALUES ('63', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:13:20');
INSERT INTO `admin_log` VALUES ('64', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:15:00');
INSERT INTO `admin_log` VALUES ('65', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:15:01');
INSERT INTO `admin_log` VALUES ('66', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:15:19');
INSERT INTO `admin_log` VALUES ('67', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:15:20');
INSERT INTO `admin_log` VALUES ('68', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:15:22');
INSERT INTO `admin_log` VALUES ('69', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:15:26');
INSERT INTO `admin_log` VALUES ('70', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:15:26');
INSERT INTO `admin_log` VALUES ('71', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:15:28');
INSERT INTO `admin_log` VALUES ('72', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:19:09');
INSERT INTO `admin_log` VALUES ('73', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:19:10');
INSERT INTO `admin_log` VALUES ('74', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-15 16:19:12');
INSERT INTO `admin_log` VALUES ('75', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:19:13');
INSERT INTO `admin_log` VALUES ('76', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:19:14');
INSERT INTO `admin_log` VALUES ('77', '1', 'inicio', 'pagina.php', 'ver', '1', 'EXITO', '2020-06-15 16:20:20');
INSERT INTO `admin_log` VALUES ('78', '1', 'inicio', 'descarga.php', 'set_token', '1', 'EXITO', '2020-06-15 16:20:21');
INSERT INTO `admin_log` VALUES ('104', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-15 16:27:41');
INSERT INTO `admin_log` VALUES ('105', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-16 10:00:48');
INSERT INTO `admin_log` VALUES ('106', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2020-06-16 10:01:28');
INSERT INTO `admin_log` VALUES ('107', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-06-16 10:01:35');
INSERT INTO `admin_log` VALUES ('108', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2020-06-16 10:01:40');
INSERT INTO `admin_log` VALUES ('109', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:02:18');
INSERT INTO `admin_log` VALUES ('110', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:02:41');
INSERT INTO `admin_log` VALUES ('111', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:02:45');
INSERT INTO `admin_log` VALUES ('112', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:02:56');
INSERT INTO `admin_log` VALUES ('113', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:03:01');
INSERT INTO `admin_log` VALUES ('114', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:03:21');
INSERT INTO `admin_log` VALUES ('115', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:03:27');
INSERT INTO `admin_log` VALUES ('116', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:03:31');
INSERT INTO `admin_log` VALUES ('117', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:03:57');
INSERT INTO `admin_log` VALUES ('118', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:04:02');
INSERT INTO `admin_log` VALUES ('119', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:04:10');
INSERT INTO `admin_log` VALUES ('120', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:04:33');
INSERT INTO `admin_log` VALUES ('121', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:04:34');
INSERT INTO `admin_log` VALUES ('122', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:04:36');
INSERT INTO `admin_log` VALUES ('123', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:05:19');
INSERT INTO `admin_log` VALUES ('124', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:05:21');
INSERT INTO `admin_log` VALUES ('125', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:05:31');
INSERT INTO `admin_log` VALUES ('126', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:06:14');
INSERT INTO `admin_log` VALUES ('127', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:06:15');
INSERT INTO `admin_log` VALUES ('128', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:06:16');
INSERT INTO `admin_log` VALUES ('129', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:06:38');
INSERT INTO `admin_log` VALUES ('130', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:06:40');
INSERT INTO `admin_log` VALUES ('131', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:06:42');
INSERT INTO `admin_log` VALUES ('132', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:07:04');
INSERT INTO `admin_log` VALUES ('133', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:07:05');
INSERT INTO `admin_log` VALUES ('134', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:07:08');
INSERT INTO `admin_log` VALUES ('135', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-16 10:16:39');
INSERT INTO `admin_log` VALUES ('136', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-16 10:24:15');
INSERT INTO `admin_log` VALUES ('137', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:38:45');
INSERT INTO `admin_log` VALUES ('138', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:39:00');
INSERT INTO `admin_log` VALUES ('139', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:39:26');
INSERT INTO `admin_log` VALUES ('140', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:40:20');
INSERT INTO `admin_log` VALUES ('141', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:40:27');
INSERT INTO `admin_log` VALUES ('142', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:40:29');
INSERT INTO `admin_log` VALUES ('143', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:40:54');
INSERT INTO `admin_log` VALUES ('144', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-06-16 10:41:02');
INSERT INTO `admin_log` VALUES ('145', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:41:11');
INSERT INTO `admin_log` VALUES ('146', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-06-16 10:45:34');
INSERT INTO `admin_log` VALUES ('147', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-16 11:02:44');
INSERT INTO `admin_log` VALUES ('148', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-16 12:50:21');
INSERT INTO `admin_log` VALUES ('149', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-16 12:50:27');
INSERT INTO `admin_log` VALUES ('150', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-16 12:50:32');
INSERT INTO `admin_log` VALUES ('151', '1', 'inicio', 'descarga.php', 'agregar_favorito', '1', 'EXITO', '2020-06-16 12:50:33');
INSERT INTO `admin_log` VALUES ('152', '1', 'usabilidad-sistema', 'descarga.php', 'cargar', '1', 'EXITO', '2020-06-17 04:59:38');
INSERT INTO `admin_log` VALUES ('153', '1', 'usabilidad-sistema', 'descarga.php', 'cargar', '1', 'EXITO', '2020-06-17 05:02:02');
INSERT INTO `admin_log` VALUES ('154', '1', 'editor-codigos', 'descarga.php', 'guardar', '1', 'EXITO', '2020-06-17 05:20:21');
INSERT INTO `admin_log` VALUES ('155', '1', 'editor-codigos', 'descarga.php', 'guardar', '1', 'EXITO', '2020-06-17 12:44:50');
INSERT INTO `admin_log` VALUES ('156', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-06-17 12:45:22');
INSERT INTO `admin_log` VALUES ('157', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-06-17 12:45:48');
INSERT INTO `admin_log` VALUES ('158', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-11-14 08:54:41');
INSERT INTO `admin_log` VALUES ('159', '1', 'inicio2', '404.php', null, '2', 'Vinculo no valido !!!', '2020-11-14 08:59:37');
INSERT INTO `admin_log` VALUES ('160', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:19:14');
INSERT INTO `admin_log` VALUES ('161', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:20:09');
INSERT INTO `admin_log` VALUES ('162', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:20:22');
INSERT INTO `admin_log` VALUES ('163', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:24:13');
INSERT INTO `admin_log` VALUES ('164', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:25:43');
INSERT INTO `admin_log` VALUES ('165', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:27:31');
INSERT INTO `admin_log` VALUES ('166', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:28:02');
INSERT INTO `admin_log` VALUES ('167', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:31:13');
INSERT INTO `admin_log` VALUES ('168', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:33:52');
INSERT INTO `admin_log` VALUES ('169', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:34:11');
INSERT INTO `admin_log` VALUES ('170', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:35:24');
INSERT INTO `admin_log` VALUES ('171', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:36:21');
INSERT INTO `admin_log` VALUES ('172', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:36:36');
INSERT INTO `admin_log` VALUES ('173', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:36:44');
INSERT INTO `admin_log` VALUES ('174', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:36:50');
INSERT INTO `admin_log` VALUES ('175', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:36:55');
INSERT INTO `admin_log` VALUES ('176', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-11-14 09:37:15');
INSERT INTO `admin_log` VALUES ('177', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-11-14 09:37:15');
INSERT INTO `admin_log` VALUES ('178', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:37:44');
INSERT INTO `admin_log` VALUES ('179', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:40:49');
INSERT INTO `admin_log` VALUES ('180', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:41:45');
INSERT INTO `admin_log` VALUES ('181', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:41:56');
INSERT INTO `admin_log` VALUES ('182', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:42:16');
INSERT INTO `admin_log` VALUES ('183', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:43:14');
INSERT INTO `admin_log` VALUES ('184', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:43:43');
INSERT INTO `admin_log` VALUES ('185', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-11-14 09:44:02');
INSERT INTO `admin_log` VALUES ('186', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:44:10');
INSERT INTO `admin_log` VALUES ('187', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:45:02');
INSERT INTO `admin_log` VALUES ('188', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:45:10');
INSERT INTO `admin_log` VALUES ('189', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:45:22');
INSERT INTO `admin_log` VALUES ('190', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:46:05');
INSERT INTO `admin_log` VALUES ('191', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:47:05');
INSERT INTO `admin_log` VALUES ('192', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:47:20');
INSERT INTO `admin_log` VALUES ('193', '1', 'roles', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:47:26');
INSERT INTO `admin_log` VALUES ('194', '1', 'roles', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:47:28');
INSERT INTO `admin_log` VALUES ('195', '1', 'roles', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:47:31');
INSERT INTO `admin_log` VALUES ('196', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-11-14 09:50:03');
INSERT INTO `admin_log` VALUES ('197', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-11-14 09:50:03');
INSERT INTO `admin_log` VALUES ('198', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-11-14 09:50:19');
INSERT INTO `admin_log` VALUES ('199', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:50:27');
INSERT INTO `admin_log` VALUES ('200', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:51:13');
INSERT INTO `admin_log` VALUES ('201', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-11-14 09:52:27');
INSERT INTO `admin_log` VALUES ('202', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:52:33');
INSERT INTO `admin_log` VALUES ('203', '1', 'si-no', 'descarga.php', 'agregar', '1', 'EXITO', '2020-11-14 09:52:46');
INSERT INTO `admin_log` VALUES ('204', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 09:52:50');
INSERT INTO `admin_log` VALUES ('205', '1', 'si-no', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-11-14 09:52:52');
INSERT INTO `admin_log` VALUES ('206', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-11-14 09:53:08');
INSERT INTO `admin_log` VALUES ('207', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2020-11-14 09:53:29');
INSERT INTO `admin_log` VALUES ('208', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2020-11-14 09:53:38');
INSERT INTO `admin_log` VALUES ('209', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 09:53:44');
INSERT INTO `admin_log` VALUES ('210', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-11-14 09:54:49');
INSERT INTO `admin_log` VALUES ('211', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 13:07:01');
INSERT INTO `admin_log` VALUES ('212', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 13:08:39');
INSERT INTO `admin_log` VALUES ('213', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 13:08:42');
INSERT INTO `admin_log` VALUES ('214', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:08:55');
INSERT INTO `admin_log` VALUES ('215', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:08:56');
INSERT INTO `admin_log` VALUES ('216', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:08:56');
INSERT INTO `admin_log` VALUES ('217', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:09:10');
INSERT INTO `admin_log` VALUES ('218', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:09:11');
INSERT INTO `admin_log` VALUES ('219', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:09:12');
INSERT INTO `admin_log` VALUES ('220', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:09:13');
INSERT INTO `admin_log` VALUES ('221', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-11-14 13:09:13');
INSERT INTO `admin_log` VALUES ('222', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 13:11:36');
INSERT INTO `admin_log` VALUES ('223', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-11-14 13:12:12');
INSERT INTO `admin_log` VALUES ('224', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-11-14 13:18:00');
INSERT INTO `admin_log` VALUES ('225', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-11-16 14:49:09');
INSERT INTO `admin_log` VALUES ('226', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2020-12-16 12:54:24');
INSERT INTO `admin_log` VALUES ('227', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 05:34:18');
INSERT INTO `admin_log` VALUES ('228', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 05:34:18');
INSERT INTO `admin_log` VALUES ('229', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 05:34:35');
INSERT INTO `admin_log` VALUES ('230', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 05:34:48');
INSERT INTO `admin_log` VALUES ('231', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 05:34:49');
INSERT INTO `admin_log` VALUES ('232', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 05:35:21');
INSERT INTO `admin_log` VALUES ('233', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 05:35:36');
INSERT INTO `admin_log` VALUES ('234', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 05:42:56');
INSERT INTO `admin_log` VALUES ('235', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 05:43:52');
INSERT INTO `admin_log` VALUES ('236', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 05:47:15');
INSERT INTO `admin_log` VALUES ('237', '1', 'roles', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 05:47:35');
INSERT INTO `admin_log` VALUES ('238', '1', 'roles', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 05:47:42');
INSERT INTO `admin_log` VALUES ('239', '1', 'roles', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 05:47:48');
INSERT INTO `admin_log` VALUES ('240', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 06:02:21');
INSERT INTO `admin_log` VALUES ('241', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 06:04:51');
INSERT INTO `admin_log` VALUES ('242', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 06:05:34');
INSERT INTO `admin_log` VALUES ('243', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 06:05:40');
INSERT INTO `admin_log` VALUES ('244', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 06:05:44');
INSERT INTO `admin_log` VALUES ('245', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 06:06:32');
INSERT INTO `admin_log` VALUES ('246', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 06:16:34');
INSERT INTO `admin_log` VALUES ('247', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 07:01:40');
INSERT INTO `admin_log` VALUES ('248', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 07:01:40');
INSERT INTO `admin_log` VALUES ('249', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:03:21');
INSERT INTO `admin_log` VALUES ('250', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:03:27');
INSERT INTO `admin_log` VALUES ('251', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:03:43');
INSERT INTO `admin_log` VALUES ('252', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:04:12');
INSERT INTO `admin_log` VALUES ('253', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:04:21');
INSERT INTO `admin_log` VALUES ('254', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:04:29');
INSERT INTO `admin_log` VALUES ('255', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 07:08:59');
INSERT INTO `admin_log` VALUES ('256', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:09:07');
INSERT INTO `admin_log` VALUES ('257', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:22:53');
INSERT INTO `admin_log` VALUES ('258', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:22:56');
INSERT INTO `admin_log` VALUES ('259', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:23:40');
INSERT INTO `admin_log` VALUES ('260', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:23:44');
INSERT INTO `admin_log` VALUES ('261', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:23:59');
INSERT INTO `admin_log` VALUES ('262', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:24:33');
INSERT INTO `admin_log` VALUES ('263', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:24:36');
INSERT INTO `admin_log` VALUES ('264', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:34:28');
INSERT INTO `admin_log` VALUES ('265', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:39:43');
INSERT INTO `admin_log` VALUES ('266', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:40:31');
INSERT INTO `admin_log` VALUES ('267', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:40:36');
INSERT INTO `admin_log` VALUES ('268', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:40:38');
INSERT INTO `admin_log` VALUES ('269', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:40:42');
INSERT INTO `admin_log` VALUES ('270', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:40:49');
INSERT INTO `admin_log` VALUES ('271', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 07:40:57');
INSERT INTO `admin_log` VALUES ('272', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:41:04');
INSERT INTO `admin_log` VALUES ('273', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:41:06');
INSERT INTO `admin_log` VALUES ('274', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 07:41:16');
INSERT INTO `admin_log` VALUES ('275', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:41:22');
INSERT INTO `admin_log` VALUES ('276', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:42:06');
INSERT INTO `admin_log` VALUES ('277', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:42:09');
INSERT INTO `admin_log` VALUES ('278', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:42:13');
INSERT INTO `admin_log` VALUES ('279', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:42:42');
INSERT INTO `admin_log` VALUES ('280', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:42:45');
INSERT INTO `admin_log` VALUES ('281', '1', 'si-no', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 07:42:56');
INSERT INTO `admin_log` VALUES ('282', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:42:59');
INSERT INTO `admin_log` VALUES ('283', '1', 'si-no', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 07:43:04');
INSERT INTO `admin_log` VALUES ('284', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:44:20');
INSERT INTO `admin_log` VALUES ('285', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-12-28 07:45:52');
INSERT INTO `admin_log` VALUES ('286', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:46:29');
INSERT INTO `admin_log` VALUES ('287', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:46:54');
INSERT INTO `admin_log` VALUES ('288', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:47:01');
INSERT INTO `admin_log` VALUES ('289', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:47:05');
INSERT INTO `admin_log` VALUES ('290', '1', 'si-no', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-28 07:47:08');
INSERT INTO `admin_log` VALUES ('291', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:49:08');
INSERT INTO `admin_log` VALUES ('292', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:49:12');
INSERT INTO `admin_log` VALUES ('293', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 07:49:29');
INSERT INTO `admin_log` VALUES ('294', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 07:49:43');
INSERT INTO `admin_log` VALUES ('295', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 07:49:47');
INSERT INTO `admin_log` VALUES ('296', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:02:12');
INSERT INTO `admin_log` VALUES ('297', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:02:48');
INSERT INTO `admin_log` VALUES ('298', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:05:13');
INSERT INTO `admin_log` VALUES ('299', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 08:05:15');
INSERT INTO `admin_log` VALUES ('300', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:18:18');
INSERT INTO `admin_log` VALUES ('301', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:18:45');
INSERT INTO `admin_log` VALUES ('302', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:19:36');
INSERT INTO `admin_log` VALUES ('303', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 08:24:10');
INSERT INTO `admin_log` VALUES ('304', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 08:25:19');
INSERT INTO `admin_log` VALUES ('305', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 08:25:49');
INSERT INTO `admin_log` VALUES ('306', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 08:27:14');
INSERT INTO `admin_log` VALUES ('307', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:27:38');
INSERT INTO `admin_log` VALUES ('308', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:27:46');
INSERT INTO `admin_log` VALUES ('309', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 08:28:27');
INSERT INTO `admin_log` VALUES ('310', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 08:28:27');
INSERT INTO `admin_log` VALUES ('311', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 08:28:41');
INSERT INTO `admin_log` VALUES ('312', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 08:31:06');
INSERT INTO `admin_log` VALUES ('313', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:31:23');
INSERT INTO `admin_log` VALUES ('314', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:56:25');
INSERT INTO `admin_log` VALUES ('315', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:56:53');
INSERT INTO `admin_log` VALUES ('316', '1', 'vigencia', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 08:57:07');
INSERT INTO `admin_log` VALUES ('317', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:57:14');
INSERT INTO `admin_log` VALUES ('318', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 08:57:55');
INSERT INTO `admin_log` VALUES ('319', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 08:57:55');
INSERT INTO `admin_log` VALUES ('320', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 08:59:32');
INSERT INTO `admin_log` VALUES ('321', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:00:35');
INSERT INTO `admin_log` VALUES ('322', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:00:39');
INSERT INTO `admin_log` VALUES ('323', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:03:00');
INSERT INTO `admin_log` VALUES ('324', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:03:36');
INSERT INTO `admin_log` VALUES ('325', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:03:44');
INSERT INTO `admin_log` VALUES ('326', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:05:51');
INSERT INTO `admin_log` VALUES ('327', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:05:53');
INSERT INTO `admin_log` VALUES ('328', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:11:24');
INSERT INTO `admin_log` VALUES ('329', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:12:49');
INSERT INTO `admin_log` VALUES ('330', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:13:23');
INSERT INTO `admin_log` VALUES ('331', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:14:41');
INSERT INTO `admin_log` VALUES ('332', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:15:32');
INSERT INTO `admin_log` VALUES ('333', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:18:37');
INSERT INTO `admin_log` VALUES ('334', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:19:13');
INSERT INTO `admin_log` VALUES ('335', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:19:32');
INSERT INTO `admin_log` VALUES ('336', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:21:08');
INSERT INTO `admin_log` VALUES ('337', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:21:22');
INSERT INTO `admin_log` VALUES ('338', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:21:45');
INSERT INTO `admin_log` VALUES ('339', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:22:23');
INSERT INTO `admin_log` VALUES ('340', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:22:28');
INSERT INTO `admin_log` VALUES ('341', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:23:01');
INSERT INTO `admin_log` VALUES ('342', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:23:12');
INSERT INTO `admin_log` VALUES ('343', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:23:24');
INSERT INTO `admin_log` VALUES ('344', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:26:03');
INSERT INTO `admin_log` VALUES ('345', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:26:14');
INSERT INTO `admin_log` VALUES ('346', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:16');
INSERT INTO `admin_log` VALUES ('347', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:20');
INSERT INTO `admin_log` VALUES ('348', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:31');
INSERT INTO `admin_log` VALUES ('349', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:34');
INSERT INTO `admin_log` VALUES ('350', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:35');
INSERT INTO `admin_log` VALUES ('351', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:37');
INSERT INTO `admin_log` VALUES ('352', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:38');
INSERT INTO `admin_log` VALUES ('353', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:39');
INSERT INTO `admin_log` VALUES ('354', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:39');
INSERT INTO `admin_log` VALUES ('355', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:31:40');
INSERT INTO `admin_log` VALUES ('356', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:00');
INSERT INTO `admin_log` VALUES ('357', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:05');
INSERT INTO `admin_log` VALUES ('358', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:08');
INSERT INTO `admin_log` VALUES ('359', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:11');
INSERT INTO `admin_log` VALUES ('360', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:14');
INSERT INTO `admin_log` VALUES ('361', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:21');
INSERT INTO `admin_log` VALUES ('362', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:39');
INSERT INTO `admin_log` VALUES ('363', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:32:48');
INSERT INTO `admin_log` VALUES ('364', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:34:42');
INSERT INTO `admin_log` VALUES ('365', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:34:59');
INSERT INTO `admin_log` VALUES ('366', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:05');
INSERT INTO `admin_log` VALUES ('367', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:13');
INSERT INTO `admin_log` VALUES ('368', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:26');
INSERT INTO `admin_log` VALUES ('369', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:41');
INSERT INTO `admin_log` VALUES ('370', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:48');
INSERT INTO `admin_log` VALUES ('371', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:35:55');
INSERT INTO `admin_log` VALUES ('372', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:36:31');
INSERT INTO `admin_log` VALUES ('373', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 09:36:39');
INSERT INTO `admin_log` VALUES ('374', '1', 'vigencia', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 09:36:56');
INSERT INTO `admin_log` VALUES ('375', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 09:37:31');
INSERT INTO `admin_log` VALUES ('376', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:37:41');
INSERT INTO `admin_log` VALUES ('377', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:37:54');
INSERT INTO `admin_log` VALUES ('378', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:38:06');
INSERT INTO `admin_log` VALUES ('379', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 09:38:29');
INSERT INTO `admin_log` VALUES ('380', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 09:38:29');
INSERT INTO `admin_log` VALUES ('381', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 09:38:40');
INSERT INTO `admin_log` VALUES ('382', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 09:38:55');
INSERT INTO `admin_log` VALUES ('383', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:39:19');
INSERT INTO `admin_log` VALUES ('384', '1', 'periodos', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:39:40');
INSERT INTO `admin_log` VALUES ('385', '1', 'periodos', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:39:58');
INSERT INTO `admin_log` VALUES ('386', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:40:08');
INSERT INTO `admin_log` VALUES ('387', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:40:16');
INSERT INTO `admin_log` VALUES ('388', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 09:42:03');
INSERT INTO `admin_log` VALUES ('389', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 09:42:03');
INSERT INTO `admin_log` VALUES ('390', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 09:42:40');
INSERT INTO `admin_log` VALUES ('391', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 09:44:23');
INSERT INTO `admin_log` VALUES ('392', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:45:12');
INSERT INTO `admin_log` VALUES ('393', '1', 'cursos', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:45:19');
INSERT INTO `admin_log` VALUES ('394', '1', 'cursos', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:45:28');
INSERT INTO `admin_log` VALUES ('395', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:45:36');
INSERT INTO `admin_log` VALUES ('396', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 09:45:39');
INSERT INTO `admin_log` VALUES ('397', '1', 'cursos', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 09:45:45');
INSERT INTO `admin_log` VALUES ('398', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 09:46:12');
INSERT INTO `admin_log` VALUES ('399', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 09:46:12');
INSERT INTO `admin_log` VALUES ('400', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-28 09:46:21');
INSERT INTO `admin_log` VALUES ('401', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:46:32');
INSERT INTO `admin_log` VALUES ('402', '1', 'competencias', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:46:38');
INSERT INTO `admin_log` VALUES ('403', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:50:00');
INSERT INTO `admin_log` VALUES ('404', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:51:11');
INSERT INTO `admin_log` VALUES ('405', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:51:54');
INSERT INTO `admin_log` VALUES ('406', '1', 'competencias', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 09:52:06');
INSERT INTO `admin_log` VALUES ('407', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:56:24');
INSERT INTO `admin_log` VALUES ('408', '1', 'competencias', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:56:34');
INSERT INTO `admin_log` VALUES ('409', '1', 'competencias', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 09:56:51');
INSERT INTO `admin_log` VALUES ('410', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:57:24');
INSERT INTO `admin_log` VALUES ('411', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 09:58:09');
INSERT INTO `admin_log` VALUES ('412', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:02:17');
INSERT INTO `admin_log` VALUES ('413', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:02:22');
INSERT INTO `admin_log` VALUES ('414', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:02:31');
INSERT INTO `admin_log` VALUES ('415', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:07:24');
INSERT INTO `admin_log` VALUES ('416', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:07:30');
INSERT INTO `admin_log` VALUES ('417', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:07:53');
INSERT INTO `admin_log` VALUES ('418', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:07:58');
INSERT INTO `admin_log` VALUES ('419', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:08:01');
INSERT INTO `admin_log` VALUES ('420', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:10:46');
INSERT INTO `admin_log` VALUES ('421', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:13:04');
INSERT INTO `admin_log` VALUES ('422', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:13:05');
INSERT INTO `admin_log` VALUES ('423', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:13:13');
INSERT INTO `admin_log` VALUES ('424', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:13:44');
INSERT INTO `admin_log` VALUES ('425', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:13:46');
INSERT INTO `admin_log` VALUES ('426', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:14:37');
INSERT INTO `admin_log` VALUES ('427', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:14:38');
INSERT INTO `admin_log` VALUES ('428', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:15:29');
INSERT INTO `admin_log` VALUES ('429', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:15:40');
INSERT INTO `admin_log` VALUES ('430', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:16:35');
INSERT INTO `admin_log` VALUES ('431', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:17:29');
INSERT INTO `admin_log` VALUES ('432', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:17:37');
INSERT INTO `admin_log` VALUES ('433', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:17:42');
INSERT INTO `admin_log` VALUES ('434', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:17:49');
INSERT INTO `admin_log` VALUES ('435', '1', 'areas', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-28 10:17:53');
INSERT INTO `admin_log` VALUES ('436', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:17:58');
INSERT INTO `admin_log` VALUES ('437', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:18:02');
INSERT INTO `admin_log` VALUES ('438', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:19:24');
INSERT INTO `admin_log` VALUES ('439', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:19:30');
INSERT INTO `admin_log` VALUES ('440', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:19:32');
INSERT INTO `admin_log` VALUES ('441', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:22:06');
INSERT INTO `admin_log` VALUES ('442', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:22:11');
INSERT INTO `admin_log` VALUES ('443', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:22:16');
INSERT INTO `admin_log` VALUES ('444', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:22:23');
INSERT INTO `admin_log` VALUES ('445', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:23:22');
INSERT INTO `admin_log` VALUES ('446', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:23:33');
INSERT INTO `admin_log` VALUES ('447', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:24:05');
INSERT INTO `admin_log` VALUES ('448', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 10:24:28');
INSERT INTO `admin_log` VALUES ('449', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:25:32');
INSERT INTO `admin_log` VALUES ('450', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:25:36');
INSERT INTO `admin_log` VALUES ('451', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:25:42');
INSERT INTO `admin_log` VALUES ('452', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:25:46');
INSERT INTO `admin_log` VALUES ('453', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:31:36');
INSERT INTO `admin_log` VALUES ('454', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:31:39');
INSERT INTO `admin_log` VALUES ('455', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 10:31:50');
INSERT INTO `admin_log` VALUES ('456', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:31:55');
INSERT INTO `admin_log` VALUES ('457', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:31:57');
INSERT INTO `admin_log` VALUES ('458', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 10:33:11');
INSERT INTO `admin_log` VALUES ('459', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2020-12-28 10:33:28');
INSERT INTO `admin_log` VALUES ('460', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:33:55');
INSERT INTO `admin_log` VALUES ('461', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 10:39:15');
INSERT INTO `admin_log` VALUES ('462', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:20:13');
INSERT INTO `admin_log` VALUES ('463', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:20:20');
INSERT INTO `admin_log` VALUES ('464', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:20:51');
INSERT INTO `admin_log` VALUES ('465', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:21:54');
INSERT INTO `admin_log` VALUES ('466', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:49:47');
INSERT INTO `admin_log` VALUES ('467', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:49:53');
INSERT INTO `admin_log` VALUES ('468', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:49:55');
INSERT INTO `admin_log` VALUES ('469', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:50:57');
INSERT INTO `admin_log` VALUES ('470', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:51:42');
INSERT INTO `admin_log` VALUES ('471', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:51:45');
INSERT INTO `admin_log` VALUES ('472', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:52:01');
INSERT INTO `admin_log` VALUES ('473', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:52:05');
INSERT INTO `admin_log` VALUES ('474', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:52:09');
INSERT INTO `admin_log` VALUES ('475', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:52:13');
INSERT INTO `admin_log` VALUES ('476', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:52:21');
INSERT INTO `admin_log` VALUES ('477', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:52:44');
INSERT INTO `admin_log` VALUES ('478', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 13:52:54');
INSERT INTO `admin_log` VALUES ('479', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:53:01');
INSERT INTO `admin_log` VALUES ('480', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:53:11');
INSERT INTO `admin_log` VALUES ('481', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:53:17');
INSERT INTO `admin_log` VALUES ('482', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:53:45');
INSERT INTO `admin_log` VALUES ('483', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:53:50');
INSERT INTO `admin_log` VALUES ('484', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:55:44');
INSERT INTO `admin_log` VALUES ('485', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:55:49');
INSERT INTO `admin_log` VALUES ('486', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:55:55');
INSERT INTO `admin_log` VALUES ('487', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:56:29');
INSERT INTO `admin_log` VALUES ('488', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:56:57');
INSERT INTO `admin_log` VALUES ('489', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:56:59');
INSERT INTO `admin_log` VALUES ('490', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:57:10');
INSERT INTO `admin_log` VALUES ('491', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 13:57:19');
INSERT INTO `admin_log` VALUES ('492', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 13:57:39');
INSERT INTO `admin_log` VALUES ('493', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 13:57:59');
INSERT INTO `admin_log` VALUES ('494', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 14:01:38');
INSERT INTO `admin_log` VALUES ('495', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:01:50');
INSERT INTO `admin_log` VALUES ('496', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 14:01:57');
INSERT INTO `admin_log` VALUES ('497', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:02:37');
INSERT INTO `admin_log` VALUES ('498', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:02:53');
INSERT INTO `admin_log` VALUES ('499', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:03:01');
INSERT INTO `admin_log` VALUES ('500', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:03:04');
INSERT INTO `admin_log` VALUES ('501', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:03:26');
INSERT INTO `admin_log` VALUES ('502', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:03:36');
INSERT INTO `admin_log` VALUES ('503', '1', 'roles', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:03:41');
INSERT INTO `admin_log` VALUES ('504', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2020-12-28 14:03:56');
INSERT INTO `admin_log` VALUES ('505', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:04:04');
INSERT INTO `admin_log` VALUES ('506', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:04:15');
INSERT INTO `admin_log` VALUES ('507', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:04:18');
INSERT INTO `admin_log` VALUES ('508', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:04:22');
INSERT INTO `admin_log` VALUES ('509', '1', 'competencias', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:04:24');
INSERT INTO `admin_log` VALUES ('510', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:04:30');
INSERT INTO `admin_log` VALUES ('511', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:04:33');
INSERT INTO `admin_log` VALUES ('512', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:04:51');
INSERT INTO `admin_log` VALUES ('513', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:04:58');
INSERT INTO `admin_log` VALUES ('514', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:16:43');
INSERT INTO `admin_log` VALUES ('515', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:20:59');
INSERT INTO `admin_log` VALUES ('516', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:21:01');
INSERT INTO `admin_log` VALUES ('517', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 14:21:07');
INSERT INTO `admin_log` VALUES ('518', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:24:57');
INSERT INTO `admin_log` VALUES ('519', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:28:37');
INSERT INTO `admin_log` VALUES ('520', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:31:27');
INSERT INTO `admin_log` VALUES ('521', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:31:28');
INSERT INTO `admin_log` VALUES ('522', '1', 'areas', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-28 14:31:34');
INSERT INTO `admin_log` VALUES ('523', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:31:41');
INSERT INTO `admin_log` VALUES ('524', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:31:48');
INSERT INTO `admin_log` VALUES ('525', '1', 'areas', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-28 14:31:53');
INSERT INTO `admin_log` VALUES ('526', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:31:58');
INSERT INTO `admin_log` VALUES ('527', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:33:28');
INSERT INTO `admin_log` VALUES ('528', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:34:04');
INSERT INTO `admin_log` VALUES ('529', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:34:10');
INSERT INTO `admin_log` VALUES ('530', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:39:15');
INSERT INTO `admin_log` VALUES ('531', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:39:17');
INSERT INTO `admin_log` VALUES ('532', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:39:24');
INSERT INTO `admin_log` VALUES ('533', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:39:43');
INSERT INTO `admin_log` VALUES ('534', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:39:45');
INSERT INTO `admin_log` VALUES ('535', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:40:00');
INSERT INTO `admin_log` VALUES ('536', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:40:02');
INSERT INTO `admin_log` VALUES ('537', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:40:25');
INSERT INTO `admin_log` VALUES ('538', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:40:27');
INSERT INTO `admin_log` VALUES ('539', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:40:43');
INSERT INTO `admin_log` VALUES ('540', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:40:45');
INSERT INTO `admin_log` VALUES ('541', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:50:06');
INSERT INTO `admin_log` VALUES ('542', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:50:34');
INSERT INTO `admin_log` VALUES ('543', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:51:38');
INSERT INTO `admin_log` VALUES ('544', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:51:40');
INSERT INTO `admin_log` VALUES ('545', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:52:20');
INSERT INTO `admin_log` VALUES ('546', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:52:31');
INSERT INTO `admin_log` VALUES ('547', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 14:58:51');
INSERT INTO `admin_log` VALUES ('548', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 14:58:54');
INSERT INTO `admin_log` VALUES ('549', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 14:59:01');
INSERT INTO `admin_log` VALUES ('550', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:40:33');
INSERT INTO `admin_log` VALUES ('551', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-28 15:40:43');
INSERT INTO `admin_log` VALUES ('552', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:43:51');
INSERT INTO `admin_log` VALUES ('553', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:43:54');
INSERT INTO `admin_log` VALUES ('554', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:43:58');
INSERT INTO `admin_log` VALUES ('555', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:44:07');
INSERT INTO `admin_log` VALUES ('556', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:44:12');
INSERT INTO `admin_log` VALUES ('557', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:44:18');
INSERT INTO `admin_log` VALUES ('558', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:44:25');
INSERT INTO `admin_log` VALUES ('559', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:44:28');
INSERT INTO `admin_log` VALUES ('560', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 15:44:42');
INSERT INTO `admin_log` VALUES ('561', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 15:44:49');
INSERT INTO `admin_log` VALUES ('562', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:45:00');
INSERT INTO `admin_log` VALUES ('563', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:53:42');
INSERT INTO `admin_log` VALUES ('564', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:53:44');
INSERT INTO `admin_log` VALUES ('565', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 15:53:49');
INSERT INTO `admin_log` VALUES ('566', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:53:54');
INSERT INTO `admin_log` VALUES ('567', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 15:59:40');
INSERT INTO `admin_log` VALUES ('568', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 15:59:42');
INSERT INTO `admin_log` VALUES ('569', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 15:59:47');
INSERT INTO `admin_log` VALUES ('570', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:00:05');
INSERT INTO `admin_log` VALUES ('571', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:00:50');
INSERT INTO `admin_log` VALUES ('572', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:00:51');
INSERT INTO `admin_log` VALUES ('573', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:01:00');
INSERT INTO `admin_log` VALUES ('574', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:01:37');
INSERT INTO `admin_log` VALUES ('575', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:01:48');
INSERT INTO `admin_log` VALUES ('576', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:02:44');
INSERT INTO `admin_log` VALUES ('577', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:02:45');
INSERT INTO `admin_log` VALUES ('578', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:02:50');
INSERT INTO `admin_log` VALUES ('579', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:02:55');
INSERT INTO `admin_log` VALUES ('580', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:03:01');
INSERT INTO `admin_log` VALUES ('581', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:03:09');
INSERT INTO `admin_log` VALUES ('582', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:03:18');
INSERT INTO `admin_log` VALUES ('583', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:03:23');
INSERT INTO `admin_log` VALUES ('584', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:03:32');
INSERT INTO `admin_log` VALUES ('585', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:03:39');
INSERT INTO `admin_log` VALUES ('586', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:03:42');
INSERT INTO `admin_log` VALUES ('587', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:03:49');
INSERT INTO `admin_log` VALUES ('588', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:03:58');
INSERT INTO `admin_log` VALUES ('589', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:04:04');
INSERT INTO `admin_log` VALUES ('590', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:06');
INSERT INTO `admin_log` VALUES ('591', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:10');
INSERT INTO `admin_log` VALUES ('592', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:14');
INSERT INTO `admin_log` VALUES ('593', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:04:19');
INSERT INTO `admin_log` VALUES ('594', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:04:24');
INSERT INTO `admin_log` VALUES ('595', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:26');
INSERT INTO `admin_log` VALUES ('596', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:29');
INSERT INTO `admin_log` VALUES ('597', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:04:56');
INSERT INTO `admin_log` VALUES ('598', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:04:58');
INSERT INTO `admin_log` VALUES ('599', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:05:08');
INSERT INTO `admin_log` VALUES ('600', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:07:24');
INSERT INTO `admin_log` VALUES ('601', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:07:27');
INSERT INTO `admin_log` VALUES ('602', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:07:31');
INSERT INTO `admin_log` VALUES ('603', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:07:35');
INSERT INTO `admin_log` VALUES ('604', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:07:42');
INSERT INTO `admin_log` VALUES ('605', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:07:47');
INSERT INTO `admin_log` VALUES ('606', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:07:54');
INSERT INTO `admin_log` VALUES ('607', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:08:01');
INSERT INTO `admin_log` VALUES ('608', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:24:38');
INSERT INTO `admin_log` VALUES ('609', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:24:47');
INSERT INTO `admin_log` VALUES ('610', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:24:52');
INSERT INTO `admin_log` VALUES ('611', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:24:57');
INSERT INTO `admin_log` VALUES ('612', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:26:03');
INSERT INTO `admin_log` VALUES ('613', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:26:14');
INSERT INTO `admin_log` VALUES ('614', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:26:24');
INSERT INTO `admin_log` VALUES ('615', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:26:33');
INSERT INTO `admin_log` VALUES ('616', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:27:34');
INSERT INTO `admin_log` VALUES ('617', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:27:37');
INSERT INTO `admin_log` VALUES ('618', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:27:42');
INSERT INTO `admin_log` VALUES ('619', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:27:47');
INSERT INTO `admin_log` VALUES ('620', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:45:56');
INSERT INTO `admin_log` VALUES ('621', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2020-12-28 16:46:01');
INSERT INTO `admin_log` VALUES ('622', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 16:46:06');
INSERT INTO `admin_log` VALUES ('623', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:50:24');
INSERT INTO `admin_log` VALUES ('624', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 16:50:28');
INSERT INTO `admin_log` VALUES ('625', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:09:36');
INSERT INTO `admin_log` VALUES ('626', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 17:09:40');
INSERT INTO `admin_log` VALUES ('627', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 17:15:03');
INSERT INTO `admin_log` VALUES ('628', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 17:15:03');
INSERT INTO `admin_log` VALUES ('629', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-28 17:15:10');
INSERT INTO `admin_log` VALUES ('630', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 17:15:10');
INSERT INTO `admin_log` VALUES ('631', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 17:16:12');
INSERT INTO `admin_log` VALUES ('632', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 17:16:39');
INSERT INTO `admin_log` VALUES ('633', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:25');
INSERT INTO `admin_log` VALUES ('634', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:37');
INSERT INTO `admin_log` VALUES ('635', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:45');
INSERT INTO `admin_log` VALUES ('636', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:46');
INSERT INTO `admin_log` VALUES ('637', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:47');
INSERT INTO `admin_log` VALUES ('638', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:47');
INSERT INTO `admin_log` VALUES ('639', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:19:50');
INSERT INTO `admin_log` VALUES ('640', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:20:01');
INSERT INTO `admin_log` VALUES ('641', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:20:05');
INSERT INTO `admin_log` VALUES ('642', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:20:07');
INSERT INTO `admin_log` VALUES ('643', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:22:58');
INSERT INTO `admin_log` VALUES ('644', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:23:22');
INSERT INTO `admin_log` VALUES ('645', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:23:34');
INSERT INTO `admin_log` VALUES ('646', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:25:58');
INSERT INTO `admin_log` VALUES ('647', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:26:21');
INSERT INTO `admin_log` VALUES ('648', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:26:38');
INSERT INTO `admin_log` VALUES ('649', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:27:02');
INSERT INTO `admin_log` VALUES ('650', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:27:21');
INSERT INTO `admin_log` VALUES ('651', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:27:50');
INSERT INTO `admin_log` VALUES ('652', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:28:48');
INSERT INTO `admin_log` VALUES ('653', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:30:59');
INSERT INTO `admin_log` VALUES ('654', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:31:21');
INSERT INTO `admin_log` VALUES ('655', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:31:42');
INSERT INTO `admin_log` VALUES ('656', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:32:21');
INSERT INTO `admin_log` VALUES ('657', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:35:51');
INSERT INTO `admin_log` VALUES ('658', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:36:01');
INSERT INTO `admin_log` VALUES ('659', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:36:02');
INSERT INTO `admin_log` VALUES ('660', '1', 'crear-reporte', 'descarga.php', 'vistaPrevia', '1', 'EXITO', '2020-12-28 17:37:00');
INSERT INTO `admin_log` VALUES ('661', '1', 'crear-reporte', 'descarga.php', 'cargarCampos', '1', 'EXITO', '2020-12-28 17:37:09');
INSERT INTO `admin_log` VALUES ('662', '1', 'crear-reporte', 'descarga.php', 'cargarCampos', '1', 'EXITO', '2020-12-28 17:37:17');
INSERT INTO `admin_log` VALUES ('663', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:45:34');
INSERT INTO `admin_log` VALUES ('664', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-28 17:47:01');
INSERT INTO `admin_log` VALUES ('665', '1', 'crear-reporte', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-28 17:47:50');
INSERT INTO `admin_log` VALUES ('666', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:48:45');
INSERT INTO `admin_log` VALUES ('667', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-28 17:55:59');
INSERT INTO `admin_log` VALUES ('668', '1', 'gestion-maestros', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-29 16:00:34');
INSERT INTO `admin_log` VALUES ('669', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 16:00:44');
INSERT INTO `admin_log` VALUES ('670', '1', 'gestion-maestros', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-29 16:13:31');
INSERT INTO `admin_log` VALUES ('671', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-29 16:13:41');
INSERT INTO `admin_log` VALUES ('672', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-29 16:13:43');
INSERT INTO `admin_log` VALUES ('673', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2020-12-30 11:27:17');
INSERT INTO `admin_log` VALUES ('674', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-30 11:27:17');
INSERT INTO `admin_log` VALUES ('675', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-30 11:27:25');
INSERT INTO `admin_log` VALUES ('676', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-30 11:28:09');
INSERT INTO `admin_log` VALUES ('677', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2020-12-30 11:29:32');
INSERT INTO `admin_log` VALUES ('678', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2020-12-30 11:29:32');
INSERT INTO `admin_log` VALUES ('679', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:29:51');
INSERT INTO `admin_log` VALUES ('680', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:31:30');
INSERT INTO `admin_log` VALUES ('681', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:42:58');
INSERT INTO `admin_log` VALUES ('682', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:50:34');
INSERT INTO `admin_log` VALUES ('683', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:50:39');
INSERT INTO `admin_log` VALUES ('684', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:51:11');
INSERT INTO `admin_log` VALUES ('685', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:52:33');
INSERT INTO `admin_log` VALUES ('686', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:52:44');
INSERT INTO `admin_log` VALUES ('687', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:53:31');
INSERT INTO `admin_log` VALUES ('688', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 11:53:50');
INSERT INTO `admin_log` VALUES ('689', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:56:09');
INSERT INTO `admin_log` VALUES ('690', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 11:56:36');
INSERT INTO `admin_log` VALUES ('691', '1', 'cerrar-sesiones', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 13:19:20');
INSERT INTO `admin_log` VALUES ('692', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 13:26:15');
INSERT INTO `admin_log` VALUES ('693', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 13:26:21');
INSERT INTO `admin_log` VALUES ('694', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 13:26:40');
INSERT INTO `admin_log` VALUES ('695', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 13:27:33');
INSERT INTO `admin_log` VALUES ('696', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 13:43:46');
INSERT INTO `admin_log` VALUES ('697', '1', 'gestion_docentess', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 13:43:55');
INSERT INTO `admin_log` VALUES ('698', '1', 'gestion_docentess', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 13:44:46');
INSERT INTO `admin_log` VALUES ('699', '1', 'gestion_docentess', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 13:46:19');
INSERT INTO `admin_log` VALUES ('700', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:28:00');
INSERT INTO `admin_log` VALUES ('701', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:28:38');
INSERT INTO `admin_log` VALUES ('702', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:28:45');
INSERT INTO `admin_log` VALUES ('703', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:28:51');
INSERT INTO `admin_log` VALUES ('704', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:29:53');
INSERT INTO `admin_log` VALUES ('705', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:29:58');
INSERT INTO `admin_log` VALUES ('706', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:31:17');
INSERT INTO `admin_log` VALUES ('707', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:31:22');
INSERT INTO `admin_log` VALUES ('708', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:34:53');
INSERT INTO `admin_log` VALUES ('709', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:35:49');
INSERT INTO `admin_log` VALUES ('710', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:36:59');
INSERT INTO `admin_log` VALUES ('711', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:37:39');
INSERT INTO `admin_log` VALUES ('712', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:38:01');
INSERT INTO `admin_log` VALUES ('713', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:39:39');
INSERT INTO `admin_log` VALUES ('714', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:40:14');
INSERT INTO `admin_log` VALUES ('715', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:50:38');
INSERT INTO `admin_log` VALUES ('716', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 14:50:53');
INSERT INTO `admin_log` VALUES ('717', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 14:51:16');
INSERT INTO `admin_log` VALUES ('718', '1', 'perfil', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-12-30 15:08:17');
INSERT INTO `admin_log` VALUES ('719', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 15:24:28');
INSERT INTO `admin_log` VALUES ('720', '1', 'si-no', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 15:24:32');
INSERT INTO `admin_log` VALUES ('721', '1', 'si-no', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 15:25:14');
INSERT INTO `admin_log` VALUES ('722', '1', 'si-no', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 15:25:22');
INSERT INTO `admin_log` VALUES ('723', '1', 'perfil', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-12-30 15:33:23');
INSERT INTO `admin_log` VALUES ('724', '1', 'perfil', 'descarga.php', 'aceptar', '1', 'EXITO', '2020-12-30 15:33:57');
INSERT INTO `admin_log` VALUES ('725', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 15:39:26');
INSERT INTO `admin_log` VALUES ('726', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 15:39:30');
INSERT INTO `admin_log` VALUES ('727', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 15:40:45');
INSERT INTO `admin_log` VALUES ('728', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:33:30');
INSERT INTO `admin_log` VALUES ('729', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:34:09');
INSERT INTO `admin_log` VALUES ('730', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:34:27');
INSERT INTO `admin_log` VALUES ('731', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:34:46');
INSERT INTO `admin_log` VALUES ('732', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:34:59');
INSERT INTO `admin_log` VALUES ('733', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:35:08');
INSERT INTO `admin_log` VALUES ('734', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:35:14');
INSERT INTO `admin_log` VALUES ('735', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:38:16');
INSERT INTO `admin_log` VALUES ('736', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:39:23');
INSERT INTO `admin_log` VALUES ('737', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 16:40:03');
INSERT INTO `admin_log` VALUES ('738', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:46:19');
INSERT INTO `admin_log` VALUES ('739', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:47:57');
INSERT INTO `admin_log` VALUES ('740', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 16:56:18');
INSERT INTO `admin_log` VALUES ('741', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 16:56:21');
INSERT INTO `admin_log` VALUES ('742', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 16:56:26');
INSERT INTO `admin_log` VALUES ('743', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:00:30');
INSERT INTO `admin_log` VALUES ('744', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:00:38');
INSERT INTO `admin_log` VALUES ('745', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:01:40');
INSERT INTO `admin_log` VALUES ('746', '1', 'gestion_docente', 'descarga.php', 'listarrr', '1', 'EXITO', '2020-12-30 17:02:56');
INSERT INTO `admin_log` VALUES ('747', '1', 'gestion_docente', 'descarga.php', 'listarrr', '1', 'EXITO', '2020-12-30 17:03:43');
INSERT INTO `admin_log` VALUES ('748', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 17:05:52');
INSERT INTO `admin_log` VALUES ('749', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 17:08:41');
INSERT INTO `admin_log` VALUES ('750', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:10:55');
INSERT INTO `admin_log` VALUES ('751', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:13:00');
INSERT INTO `admin_log` VALUES ('752', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:13:49');
INSERT INTO `admin_log` VALUES ('753', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:43:56');
INSERT INTO `admin_log` VALUES ('754', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:45:22');
INSERT INTO `admin_log` VALUES ('755', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:45:32');
INSERT INTO `admin_log` VALUES ('756', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:46:36');
INSERT INTO `admin_log` VALUES ('757', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:47:08');
INSERT INTO `admin_log` VALUES ('758', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:47:11');
INSERT INTO `admin_log` VALUES ('759', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:48:03');
INSERT INTO `admin_log` VALUES ('760', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:48:13');
INSERT INTO `admin_log` VALUES ('761', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:48:22');
INSERT INTO `admin_log` VALUES ('762', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:50:33');
INSERT INTO `admin_log` VALUES ('763', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 17:50:40');
INSERT INTO `admin_log` VALUES ('764', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:58:14');
INSERT INTO `admin_log` VALUES ('765', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 17:58:26');
INSERT INTO `admin_log` VALUES ('766', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 17:59:51');
INSERT INTO `admin_log` VALUES ('767', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 17:59:54');
INSERT INTO `admin_log` VALUES ('768', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 17:59:59');
INSERT INTO `admin_log` VALUES ('769', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:12:33');
INSERT INTO `admin_log` VALUES ('770', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:12:38');
INSERT INTO `admin_log` VALUES ('771', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:14:06');
INSERT INTO `admin_log` VALUES ('772', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:17:28');
INSERT INTO `admin_log` VALUES ('773', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:18:06');
INSERT INTO `admin_log` VALUES ('774', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:19:57');
INSERT INTO `admin_log` VALUES ('775', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:20:18');
INSERT INTO `admin_log` VALUES ('776', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:21:45');
INSERT INTO `admin_log` VALUES ('777', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:21:53');
INSERT INTO `admin_log` VALUES ('778', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:21:57');
INSERT INTO `admin_log` VALUES ('779', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:22:11');
INSERT INTO `admin_log` VALUES ('780', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:30:48');
INSERT INTO `admin_log` VALUES ('781', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:34:11');
INSERT INTO `admin_log` VALUES ('782', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:34:17');
INSERT INTO `admin_log` VALUES ('783', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:34:23');
INSERT INTO `admin_log` VALUES ('784', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:34:30');
INSERT INTO `admin_log` VALUES ('785', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:35:54');
INSERT INTO `admin_log` VALUES ('786', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 18:35:56');
INSERT INTO `admin_log` VALUES ('787', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:37:24');
INSERT INTO `admin_log` VALUES ('788', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:37:32');
INSERT INTO `admin_log` VALUES ('789', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:38:27');
INSERT INTO `admin_log` VALUES ('790', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 18:38:30');
INSERT INTO `admin_log` VALUES ('791', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 18:38:47');
INSERT INTO `admin_log` VALUES ('792', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:41:10');
INSERT INTO `admin_log` VALUES ('793', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:41:19');
INSERT INTO `admin_log` VALUES ('794', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:41:57');
INSERT INTO `admin_log` VALUES ('795', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:42:05');
INSERT INTO `admin_log` VALUES ('796', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:42:58');
INSERT INTO `admin_log` VALUES ('797', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:43:04');
INSERT INTO `admin_log` VALUES ('798', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:43:38');
INSERT INTO `admin_log` VALUES ('799', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 18:43:44');
INSERT INTO `admin_log` VALUES ('800', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:47:00');
INSERT INTO `admin_log` VALUES ('801', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:47:06');
INSERT INTO `admin_log` VALUES ('802', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:48:31');
INSERT INTO `admin_log` VALUES ('803', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:48:37');
INSERT INTO `admin_log` VALUES ('804', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:48:44');
INSERT INTO `admin_log` VALUES ('805', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:48:53');
INSERT INTO `admin_log` VALUES ('806', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:49:15');
INSERT INTO `admin_log` VALUES ('807', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 18:50:17');
INSERT INTO `admin_log` VALUES ('808', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 18:52:01');
INSERT INTO `admin_log` VALUES ('809', '1', 'persona', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:06:46');
INSERT INTO `admin_log` VALUES ('810', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:06:56');
INSERT INTO `admin_log` VALUES ('811', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 19:07:12');
INSERT INTO `admin_log` VALUES ('812', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:07:21');
INSERT INTO `admin_log` VALUES ('813', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:07:26');
INSERT INTO `admin_log` VALUES ('814', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:07:36');
INSERT INTO `admin_log` VALUES ('815', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:08:37');
INSERT INTO `admin_log` VALUES ('816', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:09:00');
INSERT INTO `admin_log` VALUES ('817', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2020-12-30 19:09:11');
INSERT INTO `admin_log` VALUES ('818', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:09:36');
INSERT INTO `admin_log` VALUES ('819', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:09:40');
INSERT INTO `admin_log` VALUES ('820', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:09:43');
INSERT INTO `admin_log` VALUES ('821', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:14:28');
INSERT INTO `admin_log` VALUES ('822', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:15:21');
INSERT INTO `admin_log` VALUES ('823', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:15:27');
INSERT INTO `admin_log` VALUES ('824', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:15:32');
INSERT INTO `admin_log` VALUES ('825', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:15:39');
INSERT INTO `admin_log` VALUES ('826', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:17:29');
INSERT INTO `admin_log` VALUES ('827', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:17:33');
INSERT INTO `admin_log` VALUES ('828', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:18:34');
INSERT INTO `admin_log` VALUES ('829', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:18:38');
INSERT INTO `admin_log` VALUES ('830', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:19:12');
INSERT INTO `admin_log` VALUES ('831', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:19:16');
INSERT INTO `admin_log` VALUES ('832', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:20:02');
INSERT INTO `admin_log` VALUES ('833', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:20:06');
INSERT INTO `admin_log` VALUES ('834', '1', 'gestion_docente', 'descarga.php', 'listar_dato', '1', 'EXITO', '2020-12-30 19:26:47');
INSERT INTO `admin_log` VALUES ('835', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 19:26:53');
INSERT INTO `admin_log` VALUES ('836', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-30 19:27:28');
INSERT INTO `admin_log` VALUES ('837', '1', 'gestion_docente', '404.php', null, '2', 'Vinculo no valido !!!', '2020-12-30 19:36:34');
INSERT INTO `admin_log` VALUES ('838', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:37:14');
INSERT INTO `admin_log` VALUES ('839', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:38:12');
INSERT INTO `admin_log` VALUES ('840', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:38:16');
INSERT INTO `admin_log` VALUES ('841', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:38:36');
INSERT INTO `admin_log` VALUES ('842', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:49:45');
INSERT INTO `admin_log` VALUES ('843', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-30 19:54:16');
INSERT INTO `admin_log` VALUES ('844', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-30 19:54:19');
INSERT INTO `admin_log` VALUES ('845', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:06:03');
INSERT INTO `admin_log` VALUES ('846', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:23:34');
INSERT INTO `admin_log` VALUES ('847', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:23:36');
INSERT INTO `admin_log` VALUES ('848', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:47:36');
INSERT INTO `admin_log` VALUES ('849', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:48:16');
INSERT INTO `admin_log` VALUES ('850', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:48:30');
INSERT INTO `admin_log` VALUES ('851', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:51:46');
INSERT INTO `admin_log` VALUES ('852', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:52:42');
INSERT INTO `admin_log` VALUES ('853', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:54:17');
INSERT INTO `admin_log` VALUES ('854', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:55:40');
INSERT INTO `admin_log` VALUES ('855', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:57:30');
INSERT INTO `admin_log` VALUES ('856', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 07:57:40');
INSERT INTO `admin_log` VALUES ('857', '1', 'gestion_docente', 'descarga.php', 'listar2', '1', 'EXITO', '2020-12-31 07:59:27');
INSERT INTO `admin_log` VALUES ('858', '1', 'gestion_docente', 'descarga.php', 'listar2', '1', 'EXITO', '2020-12-31 07:59:53');
INSERT INTO `admin_log` VALUES ('859', '1', 'gestion_docente', 'descarga.php', 'listar2', '1', 'EXITO', '2020-12-31 08:05:09');
INSERT INTO `admin_log` VALUES ('860', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:06:37');
INSERT INTO `admin_log` VALUES ('861', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:06:50');
INSERT INTO `admin_log` VALUES ('862', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:08:39');
INSERT INTO `admin_log` VALUES ('863', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:09:09');
INSERT INTO `admin_log` VALUES ('864', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:13:41');
INSERT INTO `admin_log` VALUES ('865', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:14:14');
INSERT INTO `admin_log` VALUES ('866', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:17:23');
INSERT INTO `admin_log` VALUES ('867', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:25:22');
INSERT INTO `admin_log` VALUES ('868', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:25:47');
INSERT INTO `admin_log` VALUES ('869', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:25:54');
INSERT INTO `admin_log` VALUES ('870', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:27:07');
INSERT INTO `admin_log` VALUES ('871', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:27:29');
INSERT INTO `admin_log` VALUES ('872', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:45:15');
INSERT INTO `admin_log` VALUES ('873', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:51:29');
INSERT INTO `admin_log` VALUES ('874', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 08:51:58');
INSERT INTO `admin_log` VALUES ('875', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:54:05');
INSERT INTO `admin_log` VALUES ('876', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 08:54:17');
INSERT INTO `admin_log` VALUES ('877', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:58:03');
INSERT INTO `admin_log` VALUES ('878', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 08:58:15');
INSERT INTO `admin_log` VALUES ('879', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 08:59:58');
INSERT INTO `admin_log` VALUES ('880', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:00:06');
INSERT INTO `admin_log` VALUES ('881', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:00:59');
INSERT INTO `admin_log` VALUES ('882', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:01:05');
INSERT INTO `admin_log` VALUES ('883', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:01:11');
INSERT INTO `admin_log` VALUES ('884', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:01:19');
INSERT INTO `admin_log` VALUES ('885', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:04:08');
INSERT INTO `admin_log` VALUES ('886', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:04:18');
INSERT INTO `admin_log` VALUES ('887', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:04:27');
INSERT INTO `admin_log` VALUES ('888', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:08:19');
INSERT INTO `admin_log` VALUES ('889', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:14:01');
INSERT INTO `admin_log` VALUES ('890', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:18:50');
INSERT INTO `admin_log` VALUES ('891', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:18:56');
INSERT INTO `admin_log` VALUES ('892', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:24:58');
INSERT INTO `admin_log` VALUES ('893', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:25:51');
INSERT INTO `admin_log` VALUES ('894', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:25:56');
INSERT INTO `admin_log` VALUES ('895', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:31:46');
INSERT INTO `admin_log` VALUES ('896', '1', 'areas', 'descarga.php', 'agrega', '1', 'EXITO', '2020-12-31 09:32:01');
INSERT INTO `admin_log` VALUES ('897', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:32:11');
INSERT INTO `admin_log` VALUES ('898', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 09:34:12');
INSERT INTO `admin_log` VALUES ('899', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 09:34:16');
INSERT INTO `admin_log` VALUES ('900', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 09:34:27');
INSERT INTO `admin_log` VALUES ('901', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 09:34:56');
INSERT INTO `admin_log` VALUES ('902', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 09:35:20');
INSERT INTO `admin_log` VALUES ('903', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:38:23');
INSERT INTO `admin_log` VALUES ('904', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:44:30');
INSERT INTO `admin_log` VALUES ('905', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 09:45:38');
INSERT INTO `admin_log` VALUES ('906', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 09:45:44');
INSERT INTO `admin_log` VALUES ('907', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:12:06');
INSERT INTO `admin_log` VALUES ('908', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:16:28');
INSERT INTO `admin_log` VALUES ('909', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:16:37');
INSERT INTO `admin_log` VALUES ('910', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:16:52');
INSERT INTO `admin_log` VALUES ('911', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:16:58');
INSERT INTO `admin_log` VALUES ('912', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:16:59');
INSERT INTO `admin_log` VALUES ('913', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:17:06');
INSERT INTO `admin_log` VALUES ('914', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:17:44');
INSERT INTO `admin_log` VALUES ('915', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:17:51');
INSERT INTO `admin_log` VALUES ('916', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:17:52');
INSERT INTO `admin_log` VALUES ('917', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:17:58');
INSERT INTO `admin_log` VALUES ('918', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:18:08');
INSERT INTO `admin_log` VALUES ('919', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:18:14');
INSERT INTO `admin_log` VALUES ('920', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:18:16');
INSERT INTO `admin_log` VALUES ('921', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:18:19');
INSERT INTO `admin_log` VALUES ('922', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:18:23');
INSERT INTO `admin_log` VALUES ('923', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:18:25');
INSERT INTO `admin_log` VALUES ('924', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:18:30');
INSERT INTO `admin_log` VALUES ('925', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:18:36');
INSERT INTO `admin_log` VALUES ('926', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:18:40');
INSERT INTO `admin_log` VALUES ('927', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:18:59');
INSERT INTO `admin_log` VALUES ('928', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:19:01');
INSERT INTO `admin_log` VALUES ('929', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:22:34');
INSERT INTO `admin_log` VALUES ('930', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:22:38');
INSERT INTO `admin_log` VALUES ('931', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 14:22:49');
INSERT INTO `admin_log` VALUES ('932', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:22:55');
INSERT INTO `admin_log` VALUES ('933', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:23:38');
INSERT INTO `admin_log` VALUES ('934', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:24:53');
INSERT INTO `admin_log` VALUES ('935', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:24:56');
INSERT INTO `admin_log` VALUES ('936', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 14:24:58');
INSERT INTO `admin_log` VALUES ('937', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:49:54');
INSERT INTO `admin_log` VALUES ('938', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 14:51:05');
INSERT INTO `admin_log` VALUES ('939', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:51:16');
INSERT INTO `admin_log` VALUES ('940', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 14:53:36');
INSERT INTO `admin_log` VALUES ('941', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 14:54:33');
INSERT INTO `admin_log` VALUES ('942', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 14:55:00');
INSERT INTO `admin_log` VALUES ('943', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:04:51');
INSERT INTO `admin_log` VALUES ('944', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:05:31');
INSERT INTO `admin_log` VALUES ('945', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:05:36');
INSERT INTO `admin_log` VALUES ('946', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:06:44');
INSERT INTO `admin_log` VALUES ('947', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:07:13');
INSERT INTO `admin_log` VALUES ('948', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:07:20');
INSERT INTO `admin_log` VALUES ('949', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:07:26');
INSERT INTO `admin_log` VALUES ('950', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:12:13');
INSERT INTO `admin_log` VALUES ('951', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:12:14');
INSERT INTO `admin_log` VALUES ('952', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:13:09');
INSERT INTO `admin_log` VALUES ('953', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:13:21');
INSERT INTO `admin_log` VALUES ('954', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:13:30');
INSERT INTO `admin_log` VALUES ('955', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:15:07');
INSERT INTO `admin_log` VALUES ('956', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:15:09');
INSERT INTO `admin_log` VALUES ('957', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:15:16');
INSERT INTO `admin_log` VALUES ('958', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:15:24');
INSERT INTO `admin_log` VALUES ('959', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:15:29');
INSERT INTO `admin_log` VALUES ('960', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:15:33');
INSERT INTO `admin_log` VALUES ('961', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:15:40');
INSERT INTO `admin_log` VALUES ('962', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:15:44');
INSERT INTO `admin_log` VALUES ('963', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:15:55');
INSERT INTO `admin_log` VALUES ('964', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:18:56');
INSERT INTO `admin_log` VALUES ('965', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:19:01');
INSERT INTO `admin_log` VALUES ('966', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:19:08');
INSERT INTO `admin_log` VALUES ('967', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:19:10');
INSERT INTO `admin_log` VALUES ('968', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:20:13');
INSERT INTO `admin_log` VALUES ('969', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:20:15');
INSERT INTO `admin_log` VALUES ('970', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:20:22');
INSERT INTO `admin_log` VALUES ('971', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:22:21');
INSERT INTO `admin_log` VALUES ('972', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:22:35');
INSERT INTO `admin_log` VALUES ('973', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:32:37');
INSERT INTO `admin_log` VALUES ('974', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:34:08');
INSERT INTO `admin_log` VALUES ('975', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:34:20');
INSERT INTO `admin_log` VALUES ('976', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:34:32');
INSERT INTO `admin_log` VALUES ('977', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:34:34');
INSERT INTO `admin_log` VALUES ('978', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:34:45');
INSERT INTO `admin_log` VALUES ('979', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 15:39:11');
INSERT INTO `admin_log` VALUES ('980', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:48:10');
INSERT INTO `admin_log` VALUES ('981', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:48:16');
INSERT INTO `admin_log` VALUES ('982', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:48:25');
INSERT INTO `admin_log` VALUES ('983', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:48:33');
INSERT INTO `admin_log` VALUES ('984', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:51:15');
INSERT INTO `admin_log` VALUES ('985', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:51:20');
INSERT INTO `admin_log` VALUES ('986', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 15:59:11');
INSERT INTO `admin_log` VALUES ('987', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 15:59:20');
INSERT INTO `admin_log` VALUES ('988', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:00:40');
INSERT INTO `admin_log` VALUES ('989', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:00:44');
INSERT INTO `admin_log` VALUES ('990', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:01:29');
INSERT INTO `admin_log` VALUES ('991', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:01:33');
INSERT INTO `admin_log` VALUES ('992', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:11:18');
INSERT INTO `admin_log` VALUES ('993', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:22');
INSERT INTO `admin_log` VALUES ('994', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:27');
INSERT INTO `admin_log` VALUES ('995', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:27');
INSERT INTO `admin_log` VALUES ('996', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:28');
INSERT INTO `admin_log` VALUES ('997', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:28');
INSERT INTO `admin_log` VALUES ('998', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:28');
INSERT INTO `admin_log` VALUES ('999', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:28');
INSERT INTO `admin_log` VALUES ('1000', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:29');
INSERT INTO `admin_log` VALUES ('1001', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:29');
INSERT INTO `admin_log` VALUES ('1002', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:29');
INSERT INTO `admin_log` VALUES ('1003', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:29');
INSERT INTO `admin_log` VALUES ('1004', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:29');
INSERT INTO `admin_log` VALUES ('1005', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:11:30');
INSERT INTO `admin_log` VALUES ('1006', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:17:13');
INSERT INTO `admin_log` VALUES ('1007', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:17:59');
INSERT INTO `admin_log` VALUES ('1008', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:19:08');
INSERT INTO `admin_log` VALUES ('1009', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:19:11');
INSERT INTO `admin_log` VALUES ('1010', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:20:28');
INSERT INTO `admin_log` VALUES ('1011', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:23:04');
INSERT INTO `admin_log` VALUES ('1012', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:23:09');
INSERT INTO `admin_log` VALUES ('1013', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:23:13');
INSERT INTO `admin_log` VALUES ('1014', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:23:15');
INSERT INTO `admin_log` VALUES ('1015', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:23:28');
INSERT INTO `admin_log` VALUES ('1016', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:23:31');
INSERT INTO `admin_log` VALUES ('1017', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:23:36');
INSERT INTO `admin_log` VALUES ('1018', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:23:43');
INSERT INTO `admin_log` VALUES ('1019', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:24:47');
INSERT INTO `admin_log` VALUES ('1020', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:24:49');
INSERT INTO `admin_log` VALUES ('1021', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:24:54');
INSERT INTO `admin_log` VALUES ('1022', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:25:02');
INSERT INTO `admin_log` VALUES ('1023', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:26:08');
INSERT INTO `admin_log` VALUES ('1024', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:38:30');
INSERT INTO `admin_log` VALUES ('1025', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:38:35');
INSERT INTO `admin_log` VALUES ('1026', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:40:00');
INSERT INTO `admin_log` VALUES ('1027', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 16:40:04');
INSERT INTO `admin_log` VALUES ('1028', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:40:29');
INSERT INTO `admin_log` VALUES ('1029', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:41:14');
INSERT INTO `admin_log` VALUES ('1030', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 16:41:23');
INSERT INTO `admin_log` VALUES ('1031', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 16:41:27');
INSERT INTO `admin_log` VALUES ('1032', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:11:04');
INSERT INTO `admin_log` VALUES ('1033', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:11:20');
INSERT INTO `admin_log` VALUES ('1034', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:11:51');
INSERT INTO `admin_log` VALUES ('1035', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:12:41');
INSERT INTO `admin_log` VALUES ('1036', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:13:14');
INSERT INTO `admin_log` VALUES ('1037', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:13:19');
INSERT INTO `admin_log` VALUES ('1038', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2020-12-31 17:13:32');
INSERT INTO `admin_log` VALUES ('1039', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:13:40');
INSERT INTO `admin_log` VALUES ('1040', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:33:11');
INSERT INTO `admin_log` VALUES ('1041', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:33:27');
INSERT INTO `admin_log` VALUES ('1042', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:34:06');
INSERT INTO `admin_log` VALUES ('1043', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:34:12');
INSERT INTO `admin_log` VALUES ('1044', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:35:36');
INSERT INTO `admin_log` VALUES ('1045', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:35:43');
INSERT INTO `admin_log` VALUES ('1046', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:36:29');
INSERT INTO `admin_log` VALUES ('1047', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:36:40');
INSERT INTO `admin_log` VALUES ('1048', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:39:56');
INSERT INTO `admin_log` VALUES ('1049', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:09');
INSERT INTO `admin_log` VALUES ('1050', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:10');
INSERT INTO `admin_log` VALUES ('1051', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:11');
INSERT INTO `admin_log` VALUES ('1052', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:15');
INSERT INTO `admin_log` VALUES ('1053', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:16');
INSERT INTO `admin_log` VALUES ('1054', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:40:25');
INSERT INTO `admin_log` VALUES ('1055', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:40:46');
INSERT INTO `admin_log` VALUES ('1056', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:41:28');
INSERT INTO `admin_log` VALUES ('1057', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:41:44');
INSERT INTO `admin_log` VALUES ('1058', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:42:02');
INSERT INTO `admin_log` VALUES ('1059', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:42:14');
INSERT INTO `admin_log` VALUES ('1060', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:43:42');
INSERT INTO `admin_log` VALUES ('1061', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:43:54');
INSERT INTO `admin_log` VALUES ('1062', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:44:12');
INSERT INTO `admin_log` VALUES ('1063', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:44:32');
INSERT INTO `admin_log` VALUES ('1064', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:44:43');
INSERT INTO `admin_log` VALUES ('1065', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:44:52');
INSERT INTO `admin_log` VALUES ('1066', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:45:23');
INSERT INTO `admin_log` VALUES ('1067', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:46:11');
INSERT INTO `admin_log` VALUES ('1068', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:46:20');
INSERT INTO `admin_log` VALUES ('1069', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:46:34');
INSERT INTO `admin_log` VALUES ('1070', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2020-12-31 17:46:44');
INSERT INTO `admin_log` VALUES ('1071', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:46:48');
INSERT INTO `admin_log` VALUES ('1072', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2020-12-31 17:47:00');
INSERT INTO `admin_log` VALUES ('1073', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:20:48');
INSERT INTO `admin_log` VALUES ('1074', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 09:22:54');
INSERT INTO `admin_log` VALUES ('1075', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:22:58');
INSERT INTO `admin_log` VALUES ('1076', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 09:23:26');
INSERT INTO `admin_log` VALUES ('1077', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:23:37');
INSERT INTO `admin_log` VALUES ('1078', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 09:23:42');
INSERT INTO `admin_log` VALUES ('1079', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 09:23:48');
INSERT INTO `admin_log` VALUES ('1080', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 09:23:52');
INSERT INTO `admin_log` VALUES ('1081', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:23:56');
INSERT INTO `admin_log` VALUES ('1082', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:24:38');
INSERT INTO `admin_log` VALUES ('1083', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 09:25:27');
INSERT INTO `admin_log` VALUES ('1084', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:31:13');
INSERT INTO `admin_log` VALUES ('1085', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:31:18');
INSERT INTO `admin_log` VALUES ('1086', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:31:47');
INSERT INTO `admin_log` VALUES ('1087', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:31:52');
INSERT INTO `admin_log` VALUES ('1088', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 11:32:01');
INSERT INTO `admin_log` VALUES ('1089', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 11:32:15');
INSERT INTO `admin_log` VALUES ('1090', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 11:32:15');
INSERT INTO `admin_log` VALUES ('1091', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 11:33:07');
INSERT INTO `admin_log` VALUES ('1092', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:33:15');
INSERT INTO `admin_log` VALUES ('1093', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:33:18');
INSERT INTO `admin_log` VALUES ('1094', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:33:40');
INSERT INTO `admin_log` VALUES ('1095', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:34:01');
INSERT INTO `admin_log` VALUES ('1096', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:34:14');
INSERT INTO `admin_log` VALUES ('1097', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 11:34:19');
INSERT INTO `admin_log` VALUES ('1098', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:44:13');
INSERT INTO `admin_log` VALUES ('1099', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 11:44:24');
INSERT INTO `admin_log` VALUES ('1100', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 11:44:24');
INSERT INTO `admin_log` VALUES ('1101', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 11:44:45');
INSERT INTO `admin_log` VALUES ('1102', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:45:00');
INSERT INTO `admin_log` VALUES ('1103', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:45:02');
INSERT INTO `admin_log` VALUES ('1104', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:47:49');
INSERT INTO `admin_log` VALUES ('1105', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:54:36');
INSERT INTO `admin_log` VALUES ('1106', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:54:40');
INSERT INTO `admin_log` VALUES ('1107', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:54:45');
INSERT INTO `admin_log` VALUES ('1108', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:54:55');
INSERT INTO `admin_log` VALUES ('1109', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2021-01-02 11:55:05');
INSERT INTO `admin_log` VALUES ('1110', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:55:10');
INSERT INTO `admin_log` VALUES ('1111', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 11:55:12');
INSERT INTO `admin_log` VALUES ('1112', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:55:41');
INSERT INTO `admin_log` VALUES ('1113', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 11:55:51');
INSERT INTO `admin_log` VALUES ('1114', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:00:17');
INSERT INTO `admin_log` VALUES ('1115', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:03:41');
INSERT INTO `admin_log` VALUES ('1116', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:09:15');
INSERT INTO `admin_log` VALUES ('1117', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:09:20');
INSERT INTO `admin_log` VALUES ('1118', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:11:19');
INSERT INTO `admin_log` VALUES ('1119', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:20');
INSERT INTO `admin_log` VALUES ('1120', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:27');
INSERT INTO `admin_log` VALUES ('1121', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:38');
INSERT INTO `admin_log` VALUES ('1122', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:42');
INSERT INTO `admin_log` VALUES ('1123', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:45');
INSERT INTO `admin_log` VALUES ('1124', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2021-01-02 12:11:52');
INSERT INTO `admin_log` VALUES ('1125', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:11:56');
INSERT INTO `admin_log` VALUES ('1126', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:11:58');
INSERT INTO `admin_log` VALUES ('1127', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:12:10');
INSERT INTO `admin_log` VALUES ('1128', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:13:15');
INSERT INTO `admin_log` VALUES ('1129', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:13:24');
INSERT INTO `admin_log` VALUES ('1130', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 12:16:29');
INSERT INTO `admin_log` VALUES ('1131', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 12:16:29');
INSERT INTO `admin_log` VALUES ('1132', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 12:51:40');
INSERT INTO `admin_log` VALUES ('1133', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 12:51:40');
INSERT INTO `admin_log` VALUES ('1134', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 12:52:06');
INSERT INTO `admin_log` VALUES ('1135', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:52:15');
INSERT INTO `admin_log` VALUES ('1136', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:52:25');
INSERT INTO `admin_log` VALUES ('1137', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:53:43');
INSERT INTO `admin_log` VALUES ('1138', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:53:52');
INSERT INTO `admin_log` VALUES ('1139', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 12:53:58');
INSERT INTO `admin_log` VALUES ('1140', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:54:06');
INSERT INTO `admin_log` VALUES ('1141', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 12:54:37');
INSERT INTO `admin_log` VALUES ('1142', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 12:54:37');
INSERT INTO `admin_log` VALUES ('1143', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 12:55:07');
INSERT INTO `admin_log` VALUES ('1144', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:55:18');
INSERT INTO `admin_log` VALUES ('1145', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:55:26');
INSERT INTO `admin_log` VALUES ('1146', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:55:31');
INSERT INTO `admin_log` VALUES ('1147', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:55:34');
INSERT INTO `admin_log` VALUES ('1148', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:55:48');
INSERT INTO `admin_log` VALUES ('1149', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:57:30');
INSERT INTO `admin_log` VALUES ('1150', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:57:45');
INSERT INTO `admin_log` VALUES ('1151', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:57:52');
INSERT INTO `admin_log` VALUES ('1152', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:57:58');
INSERT INTO `admin_log` VALUES ('1153', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:58:09');
INSERT INTO `admin_log` VALUES ('1154', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:58:23');
INSERT INTO `admin_log` VALUES ('1155', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:58:31');
INSERT INTO `admin_log` VALUES ('1156', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 12:58:43');
INSERT INTO `admin_log` VALUES ('1157', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 12:59:42');
INSERT INTO `admin_log` VALUES ('1158', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:59:43');
INSERT INTO `admin_log` VALUES ('1159', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 12:59:48');
INSERT INTO `admin_log` VALUES ('1160', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 13:00:33');
INSERT INTO `admin_log` VALUES ('1161', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 13:00:33');
INSERT INTO `admin_log` VALUES ('1162', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 13:01:31');
INSERT INTO `admin_log` VALUES ('1163', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:01:41');
INSERT INTO `admin_log` VALUES ('1164', '1', 'asignacion-materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 13:02:09');
INSERT INTO `admin_log` VALUES ('1165', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:02:16');
INSERT INTO `admin_log` VALUES ('1166', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:02:26');
INSERT INTO `admin_log` VALUES ('1167', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:02:58');
INSERT INTO `admin_log` VALUES ('1168', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:03:51');
INSERT INTO `admin_log` VALUES ('1169', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 13:03:56');
INSERT INTO `admin_log` VALUES ('1170', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:04:00');
INSERT INTO `admin_log` VALUES ('1171', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 13:04:30');
INSERT INTO `admin_log` VALUES ('1172', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 13:04:30');
INSERT INTO `admin_log` VALUES ('1173', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 13:05:35');
INSERT INTO `admin_log` VALUES ('1174', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:05:44');
INSERT INTO `admin_log` VALUES ('1175', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:05:50');
INSERT INTO `admin_log` VALUES ('1176', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:05:58');
INSERT INTO `admin_log` VALUES ('1177', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:06:28');
INSERT INTO `admin_log` VALUES ('1178', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:06:40');
INSERT INTO `admin_log` VALUES ('1179', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 13:06:44');
INSERT INTO `admin_log` VALUES ('1180', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 13:06:57');
INSERT INTO `admin_log` VALUES ('1181', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 13:06:58');
INSERT INTO `admin_log` VALUES ('1182', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 13:07:24');
INSERT INTO `admin_log` VALUES ('1183', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:07:35');
INSERT INTO `admin_log` VALUES ('1184', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:19:17');
INSERT INTO `admin_log` VALUES ('1185', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:19:26');
INSERT INTO `admin_log` VALUES ('1186', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:20:12');
INSERT INTO `admin_log` VALUES ('1187', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:21:27');
INSERT INTO `admin_log` VALUES ('1188', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:23:13');
INSERT INTO `admin_log` VALUES ('1189', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:23:23');
INSERT INTO `admin_log` VALUES ('1190', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:23:44');
INSERT INTO `admin_log` VALUES ('1191', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:23:51');
INSERT INTO `admin_log` VALUES ('1192', '1', 'asignacion-materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 13:24:08');
INSERT INTO `admin_log` VALUES ('1193', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:24:18');
INSERT INTO `admin_log` VALUES ('1194', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:24:59');
INSERT INTO `admin_log` VALUES ('1195', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:26:09');
INSERT INTO `admin_log` VALUES ('1196', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:26:11');
INSERT INTO `admin_log` VALUES ('1197', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:26:40');
INSERT INTO `admin_log` VALUES ('1198', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:26:42');
INSERT INTO `admin_log` VALUES ('1199', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:27:40');
INSERT INTO `admin_log` VALUES ('1200', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:27:43');
INSERT INTO `admin_log` VALUES ('1201', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:29:03');
INSERT INTO `admin_log` VALUES ('1202', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:29:07');
INSERT INTO `admin_log` VALUES ('1203', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:30:47');
INSERT INTO `admin_log` VALUES ('1204', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:30:48');
INSERT INTO `admin_log` VALUES ('1205', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:31:17');
INSERT INTO `admin_log` VALUES ('1206', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:31:20');
INSERT INTO `admin_log` VALUES ('1207', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:31:23');
INSERT INTO `admin_log` VALUES ('1208', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:32:00');
INSERT INTO `admin_log` VALUES ('1209', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:32:46');
INSERT INTO `admin_log` VALUES ('1210', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:34:15');
INSERT INTO `admin_log` VALUES ('1211', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:34:20');
INSERT INTO `admin_log` VALUES ('1212', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:34:52');
INSERT INTO `admin_log` VALUES ('1213', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:34:53');
INSERT INTO `admin_log` VALUES ('1214', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:36:20');
INSERT INTO `admin_log` VALUES ('1215', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:36:23');
INSERT INTO `admin_log` VALUES ('1216', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:36:33');
INSERT INTO `admin_log` VALUES ('1217', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:37:12');
INSERT INTO `admin_log` VALUES ('1218', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:37:14');
INSERT INTO `admin_log` VALUES ('1219', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:37:35');
INSERT INTO `admin_log` VALUES ('1220', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:39:11');
INSERT INTO `admin_log` VALUES ('1221', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:41:22');
INSERT INTO `admin_log` VALUES ('1222', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:41:25');
INSERT INTO `admin_log` VALUES ('1223', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:41:29');
INSERT INTO `admin_log` VALUES ('1224', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:41:37');
INSERT INTO `admin_log` VALUES ('1225', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:43:17');
INSERT INTO `admin_log` VALUES ('1226', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:43:19');
INSERT INTO `admin_log` VALUES ('1227', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:43:59');
INSERT INTO `admin_log` VALUES ('1228', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:44:01');
INSERT INTO `admin_log` VALUES ('1229', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:44:48');
INSERT INTO `admin_log` VALUES ('1230', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:44:50');
INSERT INTO `admin_log` VALUES ('1231', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:44:59');
INSERT INTO `admin_log` VALUES ('1232', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:46:09');
INSERT INTO `admin_log` VALUES ('1233', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:46:12');
INSERT INTO `admin_log` VALUES ('1234', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:48:21');
INSERT INTO `admin_log` VALUES ('1235', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:48:23');
INSERT INTO `admin_log` VALUES ('1236', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 13:51:23');
INSERT INTO `admin_log` VALUES ('1237', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:51:30');
INSERT INTO `admin_log` VALUES ('1238', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:51:32');
INSERT INTO `admin_log` VALUES ('1239', '1', 'asignacion-materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 13:51:55');
INSERT INTO `admin_log` VALUES ('1240', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:01');
INSERT INTO `admin_log` VALUES ('1241', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:05');
INSERT INTO `admin_log` VALUES ('1242', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:09');
INSERT INTO `admin_log` VALUES ('1243', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:18');
INSERT INTO `admin_log` VALUES ('1244', '1', 'asignacion-materias', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 13:52:22');
INSERT INTO `admin_log` VALUES ('1245', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:33');
INSERT INTO `admin_log` VALUES ('1246', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:36');
INSERT INTO `admin_log` VALUES ('1247', '1', 'asignacion-materias', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-01-02 13:52:40');
INSERT INTO `admin_log` VALUES ('1248', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:45');
INSERT INTO `admin_log` VALUES ('1249', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 13:52:53');
INSERT INTO `admin_log` VALUES ('1250', '1', 'asignacion-materias', 'descarga.php', 'modificar', '1', 'EXITO', '2021-01-02 13:53:01');
INSERT INTO `admin_log` VALUES ('1251', '1', 'asignacion-materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 15:00:50');
INSERT INTO `admin_log` VALUES ('1252', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:01:03');
INSERT INTO `admin_log` VALUES ('1253', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:01:16');
INSERT INTO `admin_log` VALUES ('1254', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:02:02');
INSERT INTO `admin_log` VALUES ('1255', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:06:29');
INSERT INTO `admin_log` VALUES ('1256', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:06:54');
INSERT INTO `admin_log` VALUES ('1257', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:07:37');
INSERT INTO `admin_log` VALUES ('1258', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:07:46');
INSERT INTO `admin_log` VALUES ('1259', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:14:19');
INSERT INTO `admin_log` VALUES ('1260', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:14:42');
INSERT INTO `admin_log` VALUES ('1261', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:14:50');
INSERT INTO `admin_log` VALUES ('1262', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:14:59');
INSERT INTO `admin_log` VALUES ('1263', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:15:45');
INSERT INTO `admin_log` VALUES ('1264', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 15:16:36');
INSERT INTO `admin_log` VALUES ('1265', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 15:16:36');
INSERT INTO `admin_log` VALUES ('1266', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-02 15:41:47');
INSERT INTO `admin_log` VALUES ('1267', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-02 15:41:47');
INSERT INTO `admin_log` VALUES ('1268', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-02 15:42:43');
INSERT INTO `admin_log` VALUES ('1269', '1', 'ruta-academica', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:43:12');
INSERT INTO `admin_log` VALUES ('1270', '1', 'ruta-academica', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-02 15:43:29');
INSERT INTO `admin_log` VALUES ('1271', '1', 'ruta-academica', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 15:43:34');
INSERT INTO `admin_log` VALUES ('1272', '1', 'ruta-academica', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 15:48:20');
INSERT INTO `admin_log` VALUES ('1273', '1', 'ruta-academica', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 15:48:28');
INSERT INTO `admin_log` VALUES ('1274', '1', 'ruta-academica', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-02 15:48:53');
INSERT INTO `admin_log` VALUES ('1275', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 18:32:15');
INSERT INTO `admin_log` VALUES ('1276', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-02 18:52:32');
INSERT INTO `admin_log` VALUES ('1277', '1', 'page_root%20+%20listar', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:12:49');
INSERT INTO `admin_log` VALUES ('1278', '1', 'page_root%20+%20listar', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:14:24');
INSERT INTO `admin_log` VALUES ('1279', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:38:43');
INSERT INTO `admin_log` VALUES ('1280', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:38:44');
INSERT INTO `admin_log` VALUES ('1281', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:39:49');
INSERT INTO `admin_log` VALUES ('1282', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:39:50');
INSERT INTO `admin_log` VALUES ('1283', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:47:37');
INSERT INTO `admin_log` VALUES ('1284', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:47:38');
INSERT INTO `admin_log` VALUES ('1285', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:48:20');
INSERT INTO `admin_log` VALUES ('1286', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:48:21');
INSERT INTO `admin_log` VALUES ('1287', '1', '0', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 19:49:22');
INSERT INTO `admin_log` VALUES ('1288', '1', '0', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 20:02:24');
INSERT INTO `admin_log` VALUES ('1289', '1', 'gg', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 20:41:58');
INSERT INTO `admin_log` VALUES ('1290', '1', 'page_root%20+%20lista', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 20:44:07');
INSERT INTO `admin_log` VALUES ('1291', '1', '\'lista\'', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 21:02:39');
INSERT INTO `admin_log` VALUES ('1292', '1', '\'lista\'', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-02 21:05:23');
INSERT INTO `admin_log` VALUES ('1293', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:27:53');
INSERT INTO `admin_log` VALUES ('1294', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:31:50');
INSERT INTO `admin_log` VALUES ('1295', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:15');
INSERT INTO `admin_log` VALUES ('1296', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:24');
INSERT INTO `admin_log` VALUES ('1297', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:34');
INSERT INTO `admin_log` VALUES ('1298', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:35');
INSERT INTO `admin_log` VALUES ('1299', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:44');
INSERT INTO `admin_log` VALUES ('1300', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:44');
INSERT INTO `admin_log` VALUES ('1301', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:44');
INSERT INTO `admin_log` VALUES ('1302', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:45');
INSERT INTO `admin_log` VALUES ('1303', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:33:45');
INSERT INTO `admin_log` VALUES ('1304', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:35:10');
INSERT INTO `admin_log` VALUES ('1305', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:35:19');
INSERT INTO `admin_log` VALUES ('1306', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:35:34');
INSERT INTO `admin_log` VALUES ('1307', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:38:51');
INSERT INTO `admin_log` VALUES ('1308', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:39:06');
INSERT INTO `admin_log` VALUES ('1309', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:39:13');
INSERT INTO `admin_log` VALUES ('1310', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:39:20');
INSERT INTO `admin_log` VALUES ('1311', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:39:43');
INSERT INTO `admin_log` VALUES ('1312', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:42:29');
INSERT INTO `admin_log` VALUES ('1313', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:42:35');
INSERT INTO `admin_log` VALUES ('1314', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:43:39');
INSERT INTO `admin_log` VALUES ('1315', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:43:46');
INSERT INTO `admin_log` VALUES ('1316', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:45:53');
INSERT INTO `admin_log` VALUES ('1317', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:45:57');
INSERT INTO `admin_log` VALUES ('1318', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:46:16');
INSERT INTO `admin_log` VALUES ('1319', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:46:20');
INSERT INTO `admin_log` VALUES ('1320', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:56:30');
INSERT INTO `admin_log` VALUES ('1321', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:57:47');
INSERT INTO `admin_log` VALUES ('1322', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:58:06');
INSERT INTO `admin_log` VALUES ('1323', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:58:29');
INSERT INTO `admin_log` VALUES ('1324', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 21:59:01');
INSERT INTO `admin_log` VALUES ('1325', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:00:25');
INSERT INTO `admin_log` VALUES ('1326', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:00:45');
INSERT INTO `admin_log` VALUES ('1327', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:00:55');
INSERT INTO `admin_log` VALUES ('1328', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:05:37');
INSERT INTO `admin_log` VALUES ('1329', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:05:45');
INSERT INTO `admin_log` VALUES ('1330', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:06:00');
INSERT INTO `admin_log` VALUES ('1331', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:06:56');
INSERT INTO `admin_log` VALUES ('1332', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:07:33');
INSERT INTO `admin_log` VALUES ('1333', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-02 22:07:45');
INSERT INTO `admin_log` VALUES ('1334', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:32:14');
INSERT INTO `admin_log` VALUES ('1335', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:33:04');
INSERT INTO `admin_log` VALUES ('1336', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:36:02');
INSERT INTO `admin_log` VALUES ('1337', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:42:52');
INSERT INTO `admin_log` VALUES ('1338', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:43:22');
INSERT INTO `admin_log` VALUES ('1339', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:43:30');
INSERT INTO `admin_log` VALUES ('1340', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:45:11');
INSERT INTO `admin_log` VALUES ('1341', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:46:47');
INSERT INTO `admin_log` VALUES ('1342', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:50:17');
INSERT INTO `admin_log` VALUES ('1343', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:52:32');
INSERT INTO `admin_log` VALUES ('1344', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:54:27');
INSERT INTO `admin_log` VALUES ('1345', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:54:34');
INSERT INTO `admin_log` VALUES ('1346', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:54:48');
INSERT INTO `admin_log` VALUES ('1347', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:55:18');
INSERT INTO `admin_log` VALUES ('1348', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:55:28');
INSERT INTO `admin_log` VALUES ('1349', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:55:37');
INSERT INTO `admin_log` VALUES ('1350', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:55:52');
INSERT INTO `admin_log` VALUES ('1351', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:56:15');
INSERT INTO `admin_log` VALUES ('1352', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:56:18');
INSERT INTO `admin_log` VALUES ('1353', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:56:23');
INSERT INTO `admin_log` VALUES ('1354', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:56:45');
INSERT INTO `admin_log` VALUES ('1355', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 08:57:15');
INSERT INTO `admin_log` VALUES ('1356', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:02:28');
INSERT INTO `admin_log` VALUES ('1357', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:02:37');
INSERT INTO `admin_log` VALUES ('1358', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:04:54');
INSERT INTO `admin_log` VALUES ('1359', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:06:19');
INSERT INTO `admin_log` VALUES ('1360', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:06:59');
INSERT INTO `admin_log` VALUES ('1361', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:07:59');
INSERT INTO `admin_log` VALUES ('1362', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:09:04');
INSERT INTO `admin_log` VALUES ('1363', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:09:19');
INSERT INTO `admin_log` VALUES ('1364', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:10:16');
INSERT INTO `admin_log` VALUES ('1365', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:11:21');
INSERT INTO `admin_log` VALUES ('1366', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:14:54');
INSERT INTO `admin_log` VALUES ('1367', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:15:11');
INSERT INTO `admin_log` VALUES ('1368', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:15:18');
INSERT INTO `admin_log` VALUES ('1369', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:18:05');
INSERT INTO `admin_log` VALUES ('1370', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:18:38');
INSERT INTO `admin_log` VALUES ('1371', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:18:59');
INSERT INTO `admin_log` VALUES ('1372', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:19:26');
INSERT INTO `admin_log` VALUES ('1373', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:38:34');
INSERT INTO `admin_log` VALUES ('1374', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:39:28');
INSERT INTO `admin_log` VALUES ('1375', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:39:46');
INSERT INTO `admin_log` VALUES ('1376', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:39:51');
INSERT INTO `admin_log` VALUES ('1377', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:40:26');
INSERT INTO `admin_log` VALUES ('1378', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:41:44');
INSERT INTO `admin_log` VALUES ('1379', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:44:47');
INSERT INTO `admin_log` VALUES ('1380', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:48:28');
INSERT INTO `admin_log` VALUES ('1381', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:49:06');
INSERT INTO `admin_log` VALUES ('1382', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:49:13');
INSERT INTO `admin_log` VALUES ('1383', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:49:25');
INSERT INTO `admin_log` VALUES ('1384', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:49:34');
INSERT INTO `admin_log` VALUES ('1385', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:50:13');
INSERT INTO `admin_log` VALUES ('1386', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:50:18');
INSERT INTO `admin_log` VALUES ('1387', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:52:51');
INSERT INTO `admin_log` VALUES ('1388', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:52:57');
INSERT INTO `admin_log` VALUES ('1389', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:52:58');
INSERT INTO `admin_log` VALUES ('1390', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:53:06');
INSERT INTO `admin_log` VALUES ('1391', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:53:09');
INSERT INTO `admin_log` VALUES ('1392', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:54:01');
INSERT INTO `admin_log` VALUES ('1393', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:54:51');
INSERT INTO `admin_log` VALUES ('1394', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:55:36');
INSERT INTO `admin_log` VALUES ('1395', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:56:44');
INSERT INTO `admin_log` VALUES ('1396', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 09:56:50');
INSERT INTO `admin_log` VALUES ('1397', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:14:14');
INSERT INTO `admin_log` VALUES ('1398', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:19:35');
INSERT INTO `admin_log` VALUES ('1399', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:20:36');
INSERT INTO `admin_log` VALUES ('1400', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:22:38');
INSERT INTO `admin_log` VALUES ('1401', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:23:28');
INSERT INTO `admin_log` VALUES ('1402', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:28:09');
INSERT INTO `admin_log` VALUES ('1403', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:29:07');
INSERT INTO `admin_log` VALUES ('1404', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:29:13');
INSERT INTO `admin_log` VALUES ('1405', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:30:17');
INSERT INTO `admin_log` VALUES ('1406', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:32:52');
INSERT INTO `admin_log` VALUES ('1407', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 10:36:19');
INSERT INTO `admin_log` VALUES ('1408', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:23:35');
INSERT INTO `admin_log` VALUES ('1409', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:29:45');
INSERT INTO `admin_log` VALUES ('1410', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:34:02');
INSERT INTO `admin_log` VALUES ('1411', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:35:09');
INSERT INTO `admin_log` VALUES ('1412', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:37:08');
INSERT INTO `admin_log` VALUES ('1413', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:38:14');
INSERT INTO `admin_log` VALUES ('1414', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:42:14');
INSERT INTO `admin_log` VALUES ('1415', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:44:05');
INSERT INTO `admin_log` VALUES ('1416', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:45:21');
INSERT INTO `admin_log` VALUES ('1417', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:46:41');
INSERT INTO `admin_log` VALUES ('1418', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:47:24');
INSERT INTO `admin_log` VALUES ('1419', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:48:25');
INSERT INTO `admin_log` VALUES ('1420', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:49:22');
INSERT INTO `admin_log` VALUES ('1421', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:49:30');
INSERT INTO `admin_log` VALUES ('1422', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:50:43');
INSERT INTO `admin_log` VALUES ('1423', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:51:38');
INSERT INTO `admin_log` VALUES ('1424', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:54:36');
INSERT INTO `admin_log` VALUES ('1425', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:54:46');
INSERT INTO `admin_log` VALUES ('1426', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:55:00');
INSERT INTO `admin_log` VALUES ('1427', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:56:15');
INSERT INTO `admin_log` VALUES ('1428', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 11:59:07');
INSERT INTO `admin_log` VALUES ('1429', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:01:54');
INSERT INTO `admin_log` VALUES ('1430', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:03:02');
INSERT INTO `admin_log` VALUES ('1431', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:03:55');
INSERT INTO `admin_log` VALUES ('1432', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:06:02');
INSERT INTO `admin_log` VALUES ('1433', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:06:36');
INSERT INTO `admin_log` VALUES ('1434', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:07:02');
INSERT INTO `admin_log` VALUES ('1435', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:08:05');
INSERT INTO `admin_log` VALUES ('1436', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:09:07');
INSERT INTO `admin_log` VALUES ('1437', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:09:41');
INSERT INTO `admin_log` VALUES ('1438', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:10:37');
INSERT INTO `admin_log` VALUES ('1439', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:10:58');
INSERT INTO `admin_log` VALUES ('1440', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:11:32');
INSERT INTO `admin_log` VALUES ('1441', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:11:56');
INSERT INTO `admin_log` VALUES ('1442', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:12:13');
INSERT INTO `admin_log` VALUES ('1443', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:12:29');
INSERT INTO `admin_log` VALUES ('1444', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:12:50');
INSERT INTO `admin_log` VALUES ('1445', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:15:10');
INSERT INTO `admin_log` VALUES ('1446', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:16:05');
INSERT INTO `admin_log` VALUES ('1447', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:16:43');
INSERT INTO `admin_log` VALUES ('1448', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:17:03');
INSERT INTO `admin_log` VALUES ('1449', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:20:27');
INSERT INTO `admin_log` VALUES ('1450', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:21:07');
INSERT INTO `admin_log` VALUES ('1451', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:22:41');
INSERT INTO `admin_log` VALUES ('1452', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:23:34');
INSERT INTO `admin_log` VALUES ('1453', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:23:46');
INSERT INTO `admin_log` VALUES ('1454', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:24:01');
INSERT INTO `admin_log` VALUES ('1455', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:29:42');
INSERT INTO `admin_log` VALUES ('1456', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:35:16');
INSERT INTO `admin_log` VALUES ('1457', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:37:05');
INSERT INTO `admin_log` VALUES ('1458', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:39:43');
INSERT INTO `admin_log` VALUES ('1459', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:42:16');
INSERT INTO `admin_log` VALUES ('1460', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:42:36');
INSERT INTO `admin_log` VALUES ('1461', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:46:18');
INSERT INTO `admin_log` VALUES ('1462', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:48:49');
INSERT INTO `admin_log` VALUES ('1463', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:49:46');
INSERT INTO `admin_log` VALUES ('1464', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:50:43');
INSERT INTO `admin_log` VALUES ('1465', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:52:37');
INSERT INTO `admin_log` VALUES ('1466', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:55:38');
INSERT INTO `admin_log` VALUES ('1467', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:56:49');
INSERT INTO `admin_log` VALUES ('1468', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 12:58:05');
INSERT INTO `admin_log` VALUES ('1469', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:03:36');
INSERT INTO `admin_log` VALUES ('1470', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:17:31');
INSERT INTO `admin_log` VALUES ('1471', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:17:37');
INSERT INTO `admin_log` VALUES ('1472', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:17:48');
INSERT INTO `admin_log` VALUES ('1473', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:17:54');
INSERT INTO `admin_log` VALUES ('1474', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:18:04');
INSERT INTO `admin_log` VALUES ('1475', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:18:18');
INSERT INTO `admin_log` VALUES ('1476', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:18:27');
INSERT INTO `admin_log` VALUES ('1477', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:19:05');
INSERT INTO `admin_log` VALUES ('1478', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:19:29');
INSERT INTO `admin_log` VALUES ('1479', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:20:23');
INSERT INTO `admin_log` VALUES ('1480', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:20:31');
INSERT INTO `admin_log` VALUES ('1481', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:20:37');
INSERT INTO `admin_log` VALUES ('1482', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:20:49');
INSERT INTO `admin_log` VALUES ('1483', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:20:58');
INSERT INTO `admin_log` VALUES ('1484', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:22:22');
INSERT INTO `admin_log` VALUES ('1485', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:22:37');
INSERT INTO `admin_log` VALUES ('1486', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:23:12');
INSERT INTO `admin_log` VALUES ('1487', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:24:27');
INSERT INTO `admin_log` VALUES ('1488', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:25:15');
INSERT INTO `admin_log` VALUES ('1489', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:25:43');
INSERT INTO `admin_log` VALUES ('1490', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:29:35');
INSERT INTO `admin_log` VALUES ('1491', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:30:41');
INSERT INTO `admin_log` VALUES ('1492', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:39:09');
INSERT INTO `admin_log` VALUES ('1493', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-03 13:39:37');
INSERT INTO `admin_log` VALUES ('1494', '1', 'periodos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-03 13:39:42');
INSERT INTO `admin_log` VALUES ('1495', '1', 'periodos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-03 13:39:47');
INSERT INTO `admin_log` VALUES ('1496', '1', 'periodos', 'descarga.php', 'modificar', '1', 'EXITO', '2021-01-03 13:39:59');
INSERT INTO `admin_log` VALUES ('1497', '1', 'periodos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-03 13:40:04');
INSERT INTO `admin_log` VALUES ('1498', '1', 'periodos', 'descarga.php', 'modificar', '1', 'EXITO', '2021-01-03 13:40:12');
INSERT INTO `admin_log` VALUES ('1499', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:40:23');
INSERT INTO `admin_log` VALUES ('1500', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 13:40:30');
INSERT INTO `admin_log` VALUES ('1501', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:09:18');
INSERT INTO `admin_log` VALUES ('1502', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:10:37');
INSERT INTO `admin_log` VALUES ('1503', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:12:43');
INSERT INTO `admin_log` VALUES ('1504', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:14:29');
INSERT INTO `admin_log` VALUES ('1505', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:14:39');
INSERT INTO `admin_log` VALUES ('1506', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:34:58');
INSERT INTO `admin_log` VALUES ('1507', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:35:45');
INSERT INTO `admin_log` VALUES ('1508', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:37:00');
INSERT INTO `admin_log` VALUES ('1509', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:37:06');
INSERT INTO `admin_log` VALUES ('1510', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:39:14');
INSERT INTO `admin_log` VALUES ('1511', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:40:17');
INSERT INTO `admin_log` VALUES ('1512', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:40:36');
INSERT INTO `admin_log` VALUES ('1513', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:40:46');
INSERT INTO `admin_log` VALUES ('1514', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:40:56');
INSERT INTO `admin_log` VALUES ('1515', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:42:03');
INSERT INTO `admin_log` VALUES ('1516', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 14:46:11');
INSERT INTO `admin_log` VALUES ('1517', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:03:02');
INSERT INTO `admin_log` VALUES ('1518', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:03:08');
INSERT INTO `admin_log` VALUES ('1519', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:04:01');
INSERT INTO `admin_log` VALUES ('1520', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:04:55');
INSERT INTO `admin_log` VALUES ('1521', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:06:29');
INSERT INTO `admin_log` VALUES ('1522', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:06:35');
INSERT INTO `admin_log` VALUES ('1523', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:06:48');
INSERT INTO `admin_log` VALUES ('1524', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:06:55');
INSERT INTO `admin_log` VALUES ('1525', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:07:47');
INSERT INTO `admin_log` VALUES ('1526', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:07:54');
INSERT INTO `admin_log` VALUES ('1527', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:11:22');
INSERT INTO `admin_log` VALUES ('1528', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:11:32');
INSERT INTO `admin_log` VALUES ('1529', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:11:55');
INSERT INTO `admin_log` VALUES ('1530', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:12:01');
INSERT INTO `admin_log` VALUES ('1531', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:12:07');
INSERT INTO `admin_log` VALUES ('1532', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:19:05');
INSERT INTO `admin_log` VALUES ('1533', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:19:12');
INSERT INTO `admin_log` VALUES ('1534', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:23:07');
INSERT INTO `admin_log` VALUES ('1535', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:23:15');
INSERT INTO `admin_log` VALUES ('1536', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:23:42');
INSERT INTO `admin_log` VALUES ('1537', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:23:51');
INSERT INTO `admin_log` VALUES ('1538', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:32:06');
INSERT INTO `admin_log` VALUES ('1539', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:33:44');
INSERT INTO `admin_log` VALUES ('1540', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:36:09');
INSERT INTO `admin_log` VALUES ('1541', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 15:36:16');
INSERT INTO `admin_log` VALUES ('1542', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:00:28');
INSERT INTO `admin_log` VALUES ('1543', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:02:04');
INSERT INTO `admin_log` VALUES ('1544', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:02:21');
INSERT INTO `admin_log` VALUES ('1545', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:15:24');
INSERT INTO `admin_log` VALUES ('1546', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:16:01');
INSERT INTO `admin_log` VALUES ('1547', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:16:26');
INSERT INTO `admin_log` VALUES ('1548', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:18:14');
INSERT INTO `admin_log` VALUES ('1549', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:20:20');
INSERT INTO `admin_log` VALUES ('1550', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:21:44');
INSERT INTO `admin_log` VALUES ('1551', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:35:01');
INSERT INTO `admin_log` VALUES ('1552', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:35:47');
INSERT INTO `admin_log` VALUES ('1553', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:36:04');
INSERT INTO `admin_log` VALUES ('1554', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:37:16');
INSERT INTO `admin_log` VALUES ('1555', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:37:28');
INSERT INTO `admin_log` VALUES ('1556', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:38:35');
INSERT INTO `admin_log` VALUES ('1557', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:43:45');
INSERT INTO `admin_log` VALUES ('1558', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:46:15');
INSERT INTO `admin_log` VALUES ('1559', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:47:03');
INSERT INTO `admin_log` VALUES ('1560', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:48:56');
INSERT INTO `admin_log` VALUES ('1561', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:49:17');
INSERT INTO `admin_log` VALUES ('1562', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:49:27');
INSERT INTO `admin_log` VALUES ('1563', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:50:15');
INSERT INTO `admin_log` VALUES ('1564', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:50:23');
INSERT INTO `admin_log` VALUES ('1565', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:50:32');
INSERT INTO `admin_log` VALUES ('1566', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:54:18');
INSERT INTO `admin_log` VALUES ('1567', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:54:31');
INSERT INTO `admin_log` VALUES ('1568', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:54:46');
INSERT INTO `admin_log` VALUES ('1569', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:55:31');
INSERT INTO `admin_log` VALUES ('1570', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:55:39');
INSERT INTO `admin_log` VALUES ('1571', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:56:18');
INSERT INTO `admin_log` VALUES ('1572', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:57:04');
INSERT INTO `admin_log` VALUES ('1573', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:57:52');
INSERT INTO `admin_log` VALUES ('1574', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 16:58:48');
INSERT INTO `admin_log` VALUES ('1575', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:02:00');
INSERT INTO `admin_log` VALUES ('1576', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:02:28');
INSERT INTO `admin_log` VALUES ('1577', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:02:41');
INSERT INTO `admin_log` VALUES ('1578', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:02:57');
INSERT INTO `admin_log` VALUES ('1579', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:06:24');
INSERT INTO `admin_log` VALUES ('1580', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:08:02');
INSERT INTO `admin_log` VALUES ('1581', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:09:42');
INSERT INTO `admin_log` VALUES ('1582', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:10:39');
INSERT INTO `admin_log` VALUES ('1583', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:14:49');
INSERT INTO `admin_log` VALUES ('1584', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:15:14');
INSERT INTO `admin_log` VALUES ('1585', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:30:27');
INSERT INTO `admin_log` VALUES ('1586', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:30:57');
INSERT INTO `admin_log` VALUES ('1587', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 17:30:57');
INSERT INTO `admin_log` VALUES ('1588', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:15:16');
INSERT INTO `admin_log` VALUES ('1589', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:16:48');
INSERT INTO `admin_log` VALUES ('1590', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:17:26');
INSERT INTO `admin_log` VALUES ('1591', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:17:30');
INSERT INTO `admin_log` VALUES ('1592', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:19:34');
INSERT INTO `admin_log` VALUES ('1593', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:19:39');
INSERT INTO `admin_log` VALUES ('1594', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:24:36');
INSERT INTO `admin_log` VALUES ('1595', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:28:35');
INSERT INTO `admin_log` VALUES ('1596', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:28:58');
INSERT INTO `admin_log` VALUES ('1597', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:30:06');
INSERT INTO `admin_log` VALUES ('1598', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:41:01');
INSERT INTO `admin_log` VALUES ('1599', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:41:56');
INSERT INTO `admin_log` VALUES ('1600', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:48:01');
INSERT INTO `admin_log` VALUES ('1601', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:48:01');
INSERT INTO `admin_log` VALUES ('1602', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:48:20');
INSERT INTO `admin_log` VALUES ('1603', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:48:50');
INSERT INTO `admin_log` VALUES ('1604', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:54:18');
INSERT INTO `admin_log` VALUES ('1605', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:55:03');
INSERT INTO `admin_log` VALUES ('1606', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 18:55:16');
INSERT INTO `admin_log` VALUES ('1607', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:04:51');
INSERT INTO `admin_log` VALUES ('1608', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:05:01');
INSERT INTO `admin_log` VALUES ('1609', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:06:50');
INSERT INTO `admin_log` VALUES ('1610', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:07:41');
INSERT INTO `admin_log` VALUES ('1611', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:08:29');
INSERT INTO `admin_log` VALUES ('1612', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:08:56');
INSERT INTO `admin_log` VALUES ('1613', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:16:35');
INSERT INTO `admin_log` VALUES ('1614', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:23:39');
INSERT INTO `admin_log` VALUES ('1615', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:25:25');
INSERT INTO `admin_log` VALUES ('1616', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:28:58');
INSERT INTO `admin_log` VALUES ('1617', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:30:02');
INSERT INTO `admin_log` VALUES ('1618', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:32:06');
INSERT INTO `admin_log` VALUES ('1619', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:36:10');
INSERT INTO `admin_log` VALUES ('1620', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:37:07');
INSERT INTO `admin_log` VALUES ('1621', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:39:32');
INSERT INTO `admin_log` VALUES ('1622', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:40:13');
INSERT INTO `admin_log` VALUES ('1623', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:41:59');
INSERT INTO `admin_log` VALUES ('1624', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:43:21');
INSERT INTO `admin_log` VALUES ('1625', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:43:32');
INSERT INTO `admin_log` VALUES ('1626', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:44:27');
INSERT INTO `admin_log` VALUES ('1627', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 19:46:22');
INSERT INTO `admin_log` VALUES ('1628', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-03 20:18:52');
INSERT INTO `admin_log` VALUES ('1629', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-03 20:19:53');
INSERT INTO `admin_log` VALUES ('1630', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 09:49:04');
INSERT INTO `admin_log` VALUES ('1631', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:14:47');
INSERT INTO `admin_log` VALUES ('1632', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:14:52');
INSERT INTO `admin_log` VALUES ('1633', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:15:07');
INSERT INTO `admin_log` VALUES ('1634', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:15:09');
INSERT INTO `admin_log` VALUES ('1635', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:15:14');
INSERT INTO `admin_log` VALUES ('1636', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:15:16');
INSERT INTO `admin_log` VALUES ('1637', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:15:30');
INSERT INTO `admin_log` VALUES ('1638', '1', 'competencias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:15:32');
INSERT INTO `admin_log` VALUES ('1639', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:15:40');
INSERT INTO `admin_log` VALUES ('1640', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:15:44');
INSERT INTO `admin_log` VALUES ('1641', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:15:48');
INSERT INTO `admin_log` VALUES ('1642', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:16:08');
INSERT INTO `admin_log` VALUES ('1643', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:16:15');
INSERT INTO `admin_log` VALUES ('1644', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:16:20');
INSERT INTO `admin_log` VALUES ('1645', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:16:39');
INSERT INTO `admin_log` VALUES ('1646', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:16:45');
INSERT INTO `admin_log` VALUES ('1647', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:17:19');
INSERT INTO `admin_log` VALUES ('1648', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:17:21');
INSERT INTO `admin_log` VALUES ('1649', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:17:26');
INSERT INTO `admin_log` VALUES ('1650', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:17:52');
INSERT INTO `admin_log` VALUES ('1651', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:17:55');
INSERT INTO `admin_log` VALUES ('1652', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:18:28');
INSERT INTO `admin_log` VALUES ('1653', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:18:32');
INSERT INTO `admin_log` VALUES ('1654', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:21:52');
INSERT INTO `admin_log` VALUES ('1655', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:22:42');
INSERT INTO `admin_log` VALUES ('1656', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:22:54');
INSERT INTO `admin_log` VALUES ('1657', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:22:58');
INSERT INTO `admin_log` VALUES ('1658', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:23:25');
INSERT INTO `admin_log` VALUES ('1659', '1', 'vigencia', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:23:34');
INSERT INTO `admin_log` VALUES ('1660', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:23:41');
INSERT INTO `admin_log` VALUES ('1661', '1', 'competencias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:23:44');
INSERT INTO `admin_log` VALUES ('1662', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:23:55');
INSERT INTO `admin_log` VALUES ('1663', '1', 'periodos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:23:57');
INSERT INTO `admin_log` VALUES ('1664', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:24:10');
INSERT INTO `admin_log` VALUES ('1665', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 10:24:14');
INSERT INTO `admin_log` VALUES ('1666', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 10:35:35');
INSERT INTO `admin_log` VALUES ('1667', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 12:53:37');
INSERT INTO `admin_log` VALUES ('1668', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 12:54:16');
INSERT INTO `admin_log` VALUES ('1669', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 12:54:24');
INSERT INTO `admin_log` VALUES ('1670', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:56:23');
INSERT INTO `admin_log` VALUES ('1671', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:56:27');
INSERT INTO `admin_log` VALUES ('1672', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:56:29');
INSERT INTO `admin_log` VALUES ('1673', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:56:31');
INSERT INTO `admin_log` VALUES ('1674', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:56:33');
INSERT INTO `admin_log` VALUES ('1675', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:23');
INSERT INTO `admin_log` VALUES ('1676', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:28');
INSERT INTO `admin_log` VALUES ('1677', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:35');
INSERT INTO `admin_log` VALUES ('1678', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:37');
INSERT INTO `admin_log` VALUES ('1679', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:39');
INSERT INTO `admin_log` VALUES ('1680', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:41');
INSERT INTO `admin_log` VALUES ('1681', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:42');
INSERT INTO `admin_log` VALUES ('1682', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:44');
INSERT INTO `admin_log` VALUES ('1683', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:47');
INSERT INTO `admin_log` VALUES ('1684', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:50');
INSERT INTO `admin_log` VALUES ('1685', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:57:52');
INSERT INTO `admin_log` VALUES ('1686', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:26');
INSERT INTO `admin_log` VALUES ('1687', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:29');
INSERT INTO `admin_log` VALUES ('1688', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:31');
INSERT INTO `admin_log` VALUES ('1689', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:38');
INSERT INTO `admin_log` VALUES ('1690', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:43');
INSERT INTO `admin_log` VALUES ('1691', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 12:59:47');
INSERT INTO `admin_log` VALUES ('1692', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:03:54');
INSERT INTO `admin_log` VALUES ('1693', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:03:56');
INSERT INTO `admin_log` VALUES ('1694', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:07');
INSERT INTO `admin_log` VALUES ('1695', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:09');
INSERT INTO `admin_log` VALUES ('1696', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:11');
INSERT INTO `admin_log` VALUES ('1697', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:13');
INSERT INTO `admin_log` VALUES ('1698', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:16');
INSERT INTO `admin_log` VALUES ('1699', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:18');
INSERT INTO `admin_log` VALUES ('1700', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:20');
INSERT INTO `admin_log` VALUES ('1701', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:24');
INSERT INTO `admin_log` VALUES ('1702', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:04:28');
INSERT INTO `admin_log` VALUES ('1703', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:07:44');
INSERT INTO `admin_log` VALUES ('1704', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:07:46');
INSERT INTO `admin_log` VALUES ('1705', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:07:50');
INSERT INTO `admin_log` VALUES ('1706', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:07:52');
INSERT INTO `admin_log` VALUES ('1707', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:07:54');
INSERT INTO `admin_log` VALUES ('1708', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:09:38');
INSERT INTO `admin_log` VALUES ('1709', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:09:40');
INSERT INTO `admin_log` VALUES ('1710', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:09:41');
INSERT INTO `admin_log` VALUES ('1711', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:09:51');
INSERT INTO `admin_log` VALUES ('1712', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:11:12');
INSERT INTO `admin_log` VALUES ('1713', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:17:56');
INSERT INTO `admin_log` VALUES ('1714', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:18:27');
INSERT INTO `admin_log` VALUES ('1715', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:20:31');
INSERT INTO `admin_log` VALUES ('1716', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:22:36');
INSERT INTO `admin_log` VALUES ('1717', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:23:24');
INSERT INTO `admin_log` VALUES ('1718', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:41:45');
INSERT INTO `admin_log` VALUES ('1719', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:42');
INSERT INTO `admin_log` VALUES ('1720', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:44');
INSERT INTO `admin_log` VALUES ('1721', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:46');
INSERT INTO `admin_log` VALUES ('1722', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:48');
INSERT INTO `admin_log` VALUES ('1723', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:51');
INSERT INTO `admin_log` VALUES ('1724', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:53');
INSERT INTO `admin_log` VALUES ('1725', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:55');
INSERT INTO `admin_log` VALUES ('1726', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:57');
INSERT INTO `admin_log` VALUES ('1727', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:54:59');
INSERT INTO `admin_log` VALUES ('1728', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 13:55:13');
INSERT INTO `admin_log` VALUES ('1729', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:57:13');
INSERT INTO `admin_log` VALUES ('1730', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:59:02');
INSERT INTO `admin_log` VALUES ('1731', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 13:59:15');
INSERT INTO `admin_log` VALUES ('1732', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:00:30');
INSERT INTO `admin_log` VALUES ('1733', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:19:22');
INSERT INTO `admin_log` VALUES ('1734', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:19:24');
INSERT INTO `admin_log` VALUES ('1735', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:19:31');
INSERT INTO `admin_log` VALUES ('1736', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:19:34');
INSERT INTO `admin_log` VALUES ('1737', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:19:39');
INSERT INTO `admin_log` VALUES ('1738', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:19:41');
INSERT INTO `admin_log` VALUES ('1739', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:20:14');
INSERT INTO `admin_log` VALUES ('1740', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:21:01');
INSERT INTO `admin_log` VALUES ('1741', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:21:03');
INSERT INTO `admin_log` VALUES ('1742', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:21:06');
INSERT INTO `admin_log` VALUES ('1743', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:21:19');
INSERT INTO `admin_log` VALUES ('1744', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:22:23');
INSERT INTO `admin_log` VALUES ('1745', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:22:28');
INSERT INTO `admin_log` VALUES ('1746', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:22:33');
INSERT INTO `admin_log` VALUES ('1747', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:22:36');
INSERT INTO `admin_log` VALUES ('1748', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:24:07');
INSERT INTO `admin_log` VALUES ('1749', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:24:08');
INSERT INTO `admin_log` VALUES ('1750', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:24:11');
INSERT INTO `admin_log` VALUES ('1751', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:24:53');
INSERT INTO `admin_log` VALUES ('1752', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:24:55');
INSERT INTO `admin_log` VALUES ('1753', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:28:38');
INSERT INTO `admin_log` VALUES ('1754', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:28:41');
INSERT INTO `admin_log` VALUES ('1755', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:28:45');
INSERT INTO `admin_log` VALUES ('1756', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:28:49');
INSERT INTO `admin_log` VALUES ('1757', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:30:34');
INSERT INTO `admin_log` VALUES ('1758', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:30:36');
INSERT INTO `admin_log` VALUES ('1759', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:30:38');
INSERT INTO `admin_log` VALUES ('1760', '1', 'ruta-academica', '404.php', 'gestion_materia', '2', 'Acceso denegado (1) !!!!', '2021-01-04 14:30:38');
INSERT INTO `admin_log` VALUES ('1761', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:30:39');
INSERT INTO `admin_log` VALUES ('1762', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:31:24');
INSERT INTO `admin_log` VALUES ('1763', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:31:25');
INSERT INTO `admin_log` VALUES ('1764', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:31:32');
INSERT INTO `admin_log` VALUES ('1765', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:31:35');
INSERT INTO `admin_log` VALUES ('1766', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:31:41');
INSERT INTO `admin_log` VALUES ('1767', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:31:44');
INSERT INTO `admin_log` VALUES ('1768', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:31:45');
INSERT INTO `admin_log` VALUES ('1769', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:34:11');
INSERT INTO `admin_log` VALUES ('1770', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:34:12');
INSERT INTO `admin_log` VALUES ('1771', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:35:24');
INSERT INTO `admin_log` VALUES ('1772', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:35:25');
INSERT INTO `admin_log` VALUES ('1773', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:36:09');
INSERT INTO `admin_log` VALUES ('1774', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:36:13');
INSERT INTO `admin_log` VALUES ('1775', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:36:13');
INSERT INTO `admin_log` VALUES ('1776', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:36:14');
INSERT INTO `admin_log` VALUES ('1777', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:36:53');
INSERT INTO `admin_log` VALUES ('1778', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:36:54');
INSERT INTO `admin_log` VALUES ('1779', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:37:03');
INSERT INTO `admin_log` VALUES ('1780', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:37:04');
INSERT INTO `admin_log` VALUES ('1781', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 14:37:08');
INSERT INTO `admin_log` VALUES ('1782', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:20');
INSERT INTO `admin_log` VALUES ('1783', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:23');
INSERT INTO `admin_log` VALUES ('1784', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:27');
INSERT INTO `admin_log` VALUES ('1785', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:29');
INSERT INTO `admin_log` VALUES ('1786', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:32');
INSERT INTO `admin_log` VALUES ('1787', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:34');
INSERT INTO `admin_log` VALUES ('1788', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:36');
INSERT INTO `admin_log` VALUES ('1789', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:39:40');
INSERT INTO `admin_log` VALUES ('1790', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:41:36');
INSERT INTO `admin_log` VALUES ('1791', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:41:41');
INSERT INTO `admin_log` VALUES ('1792', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:34');
INSERT INTO `admin_log` VALUES ('1793', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:39');
INSERT INTO `admin_log` VALUES ('1794', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:43');
INSERT INTO `admin_log` VALUES ('1795', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:45');
INSERT INTO `admin_log` VALUES ('1796', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:46');
INSERT INTO `admin_log` VALUES ('1797', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:48');
INSERT INTO `admin_log` VALUES ('1798', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:50');
INSERT INTO `admin_log` VALUES ('1799', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:51');
INSERT INTO `admin_log` VALUES ('1800', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:43:53');
INSERT INTO `admin_log` VALUES ('1801', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:44:02');
INSERT INTO `admin_log` VALUES ('1802', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:44:13');
INSERT INTO `admin_log` VALUES ('1803', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:44:14');
INSERT INTO `admin_log` VALUES ('1804', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:44:49');
INSERT INTO `admin_log` VALUES ('1805', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:44:50');
INSERT INTO `admin_log` VALUES ('1806', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 14:44:56');
INSERT INTO `admin_log` VALUES ('1807', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 14:45:12');
INSERT INTO `admin_log` VALUES ('1808', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:45:14');
INSERT INTO `admin_log` VALUES ('1809', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:45:15');
INSERT INTO `admin_log` VALUES ('1810', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:46:17');
INSERT INTO `admin_log` VALUES ('1811', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:46:18');
INSERT INTO `admin_log` VALUES ('1812', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 14:46:39');
INSERT INTO `admin_log` VALUES ('1813', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 14:46:40');
INSERT INTO `admin_log` VALUES ('1814', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:46:51');
INSERT INTO `admin_log` VALUES ('1815', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:03');
INSERT INTO `admin_log` VALUES ('1816', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:08');
INSERT INTO `admin_log` VALUES ('1817', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:24');
INSERT INTO `admin_log` VALUES ('1818', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:31');
INSERT INTO `admin_log` VALUES ('1819', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:35');
INSERT INTO `admin_log` VALUES ('1820', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:39');
INSERT INTO `admin_log` VALUES ('1821', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 14:47:43');
INSERT INTO `admin_log` VALUES ('1822', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:05:22');
INSERT INTO `admin_log` VALUES ('1823', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:05:23');
INSERT INTO `admin_log` VALUES ('1824', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:05:27');
INSERT INTO `admin_log` VALUES ('1825', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:07:02');
INSERT INTO `admin_log` VALUES ('1826', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:07:03');
INSERT INTO `admin_log` VALUES ('1827', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:07:09');
INSERT INTO `admin_log` VALUES ('1828', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:08:13');
INSERT INTO `admin_log` VALUES ('1829', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:08:35');
INSERT INTO `admin_log` VALUES ('1830', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:12:43');
INSERT INTO `admin_log` VALUES ('1831', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:13:13');
INSERT INTO `admin_log` VALUES ('1832', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:13:27');
INSERT INTO `admin_log` VALUES ('1833', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:13:28');
INSERT INTO `admin_log` VALUES ('1834', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 15:13:31');
INSERT INTO `admin_log` VALUES ('1835', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:37:11');
INSERT INTO `admin_log` VALUES ('1836', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:37:12');
INSERT INTO `admin_log` VALUES ('1837', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:37:55');
INSERT INTO `admin_log` VALUES ('1838', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:37:57');
INSERT INTO `admin_log` VALUES ('1839', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:39:03');
INSERT INTO `admin_log` VALUES ('1840', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:39:04');
INSERT INTO `admin_log` VALUES ('1841', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:42:13');
INSERT INTO `admin_log` VALUES ('1842', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:42:14');
INSERT INTO `admin_log` VALUES ('1843', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:42:20');
INSERT INTO `admin_log` VALUES ('1844', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:42:29');
INSERT INTO `admin_log` VALUES ('1845', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:42:31');
INSERT INTO `admin_log` VALUES ('1846', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:43:32');
INSERT INTO `admin_log` VALUES ('1847', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:43:37');
INSERT INTO `admin_log` VALUES ('1848', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:43:38');
INSERT INTO `admin_log` VALUES ('1849', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:43:40');
INSERT INTO `admin_log` VALUES ('1850', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:45:37');
INSERT INTO `admin_log` VALUES ('1851', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:45:38');
INSERT INTO `admin_log` VALUES ('1852', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:49:00');
INSERT INTO `admin_log` VALUES ('1853', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:49:02');
INSERT INTO `admin_log` VALUES ('1854', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 15:49:28');
INSERT INTO `admin_log` VALUES ('1855', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-01-04 15:49:44');
INSERT INTO `admin_log` VALUES ('1856', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 15:51:46');
INSERT INTO `admin_log` VALUES ('1857', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:51:47');
INSERT INTO `admin_log` VALUES ('1858', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:51:49');
INSERT INTO `admin_log` VALUES ('1859', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 15:52:39');
INSERT INTO `admin_log` VALUES ('1860', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 15:52:41');
INSERT INTO `admin_log` VALUES ('1861', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:08:48');
INSERT INTO `admin_log` VALUES ('1862', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:08:49');
INSERT INTO `admin_log` VALUES ('1863', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:07');
INSERT INTO `admin_log` VALUES ('1864', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:09');
INSERT INTO `admin_log` VALUES ('1865', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:10');
INSERT INTO `admin_log` VALUES ('1866', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:12');
INSERT INTO `admin_log` VALUES ('1867', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:13');
INSERT INTO `admin_log` VALUES ('1868', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:15');
INSERT INTO `admin_log` VALUES ('1869', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 16:09:16');
INSERT INTO `admin_log` VALUES ('1870', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:33:14');
INSERT INTO `admin_log` VALUES ('1871', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:33:16');
INSERT INTO `admin_log` VALUES ('1872', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:33:19');
INSERT INTO `admin_log` VALUES ('1873', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:34:31');
INSERT INTO `admin_log` VALUES ('1874', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:34:32');
INSERT INTO `admin_log` VALUES ('1875', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:34:36');
INSERT INTO `admin_log` VALUES ('1876', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:34:41');
INSERT INTO `admin_log` VALUES ('1877', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:36:48');
INSERT INTO `admin_log` VALUES ('1878', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:36:50');
INSERT INTO `admin_log` VALUES ('1879', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:51:26');
INSERT INTO `admin_log` VALUES ('1880', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:51:28');
INSERT INTO `admin_log` VALUES ('1881', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:51:30');
INSERT INTO `admin_log` VALUES ('1882', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:51:36');
INSERT INTO `admin_log` VALUES ('1883', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:51:38');
INSERT INTO `admin_log` VALUES ('1884', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:51:51');
INSERT INTO `admin_log` VALUES ('1885', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:51:59');
INSERT INTO `admin_log` VALUES ('1886', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:52:06');
INSERT INTO `admin_log` VALUES ('1887', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:52:55');
INSERT INTO `admin_log` VALUES ('1888', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:52:57');
INSERT INTO `admin_log` VALUES ('1889', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:17');
INSERT INTO `admin_log` VALUES ('1890', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:20');
INSERT INTO `admin_log` VALUES ('1891', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:22');
INSERT INTO `admin_log` VALUES ('1892', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:23');
INSERT INTO `admin_log` VALUES ('1893', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:27');
INSERT INTO `admin_log` VALUES ('1894', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:54:28');
INSERT INTO `admin_log` VALUES ('1895', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 16:55:16');
INSERT INTO `admin_log` VALUES ('1896', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 16:55:17');
INSERT INTO `admin_log` VALUES ('1897', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 16:55:21');
INSERT INTO `admin_log` VALUES ('1898', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:04:15');
INSERT INTO `admin_log` VALUES ('1899', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:04:16');
INSERT INTO `admin_log` VALUES ('1900', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:04:19');
INSERT INTO `admin_log` VALUES ('1901', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:18:40');
INSERT INTO `admin_log` VALUES ('1902', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:18:42');
INSERT INTO `admin_log` VALUES ('1903', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:18:44');
INSERT INTO `admin_log` VALUES ('1904', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:18:54');
INSERT INTO `admin_log` VALUES ('1905', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:18:55');
INSERT INTO `admin_log` VALUES ('1906', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:18:58');
INSERT INTO `admin_log` VALUES ('1907', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:19:17');
INSERT INTO `admin_log` VALUES ('1908', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:19:19');
INSERT INTO `admin_log` VALUES ('1909', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:19:20');
INSERT INTO `admin_log` VALUES ('1910', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:20:42');
INSERT INTO `admin_log` VALUES ('1911', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:20:43');
INSERT INTO `admin_log` VALUES ('1912', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:20:45');
INSERT INTO `admin_log` VALUES ('1913', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:20:51');
INSERT INTO `admin_log` VALUES ('1914', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:20:52');
INSERT INTO `admin_log` VALUES ('1915', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:21:37');
INSERT INTO `admin_log` VALUES ('1916', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:21:39');
INSERT INTO `admin_log` VALUES ('1917', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:21:41');
INSERT INTO `admin_log` VALUES ('1918', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:22:59');
INSERT INTO `admin_log` VALUES ('1919', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:23:00');
INSERT INTO `admin_log` VALUES ('1920', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:23:02');
INSERT INTO `admin_log` VALUES ('1921', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:24:57');
INSERT INTO `admin_log` VALUES ('1922', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:24:58');
INSERT INTO `admin_log` VALUES ('1923', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:25:00');
INSERT INTO `admin_log` VALUES ('1924', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:25:20');
INSERT INTO `admin_log` VALUES ('1925', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:25:21');
INSERT INTO `admin_log` VALUES ('1926', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:25:23');
INSERT INTO `admin_log` VALUES ('1927', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:25:29');
INSERT INTO `admin_log` VALUES ('1928', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:25:30');
INSERT INTO `admin_log` VALUES ('1929', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:25:40');
INSERT INTO `admin_log` VALUES ('1930', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:28:07');
INSERT INTO `admin_log` VALUES ('1931', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:28:08');
INSERT INTO `admin_log` VALUES ('1932', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:28:10');
INSERT INTO `admin_log` VALUES ('1933', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:31:07');
INSERT INTO `admin_log` VALUES ('1934', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:31:08');
INSERT INTO `admin_log` VALUES ('1935', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:31:10');
INSERT INTO `admin_log` VALUES ('1936', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:31:15');
INSERT INTO `admin_log` VALUES ('1937', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:32:52');
INSERT INTO `admin_log` VALUES ('1938', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:32:53');
INSERT INTO `admin_log` VALUES ('1939', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:32:55');
INSERT INTO `admin_log` VALUES ('1940', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:34:05');
INSERT INTO `admin_log` VALUES ('1941', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:34:06');
INSERT INTO `admin_log` VALUES ('1942', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:34:07');
INSERT INTO `admin_log` VALUES ('1943', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:35:43');
INSERT INTO `admin_log` VALUES ('1944', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:35:44');
INSERT INTO `admin_log` VALUES ('1945', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:35:46');
INSERT INTO `admin_log` VALUES ('1946', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:36:50');
INSERT INTO `admin_log` VALUES ('1947', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:36:51');
INSERT INTO `admin_log` VALUES ('1948', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:36:53');
INSERT INTO `admin_log` VALUES ('1949', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:37:36');
INSERT INTO `admin_log` VALUES ('1950', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:37:37');
INSERT INTO `admin_log` VALUES ('1951', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:37:39');
INSERT INTO `admin_log` VALUES ('1952', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:45:57');
INSERT INTO `admin_log` VALUES ('1953', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:45:58');
INSERT INTO `admin_log` VALUES ('1954', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:46:03');
INSERT INTO `admin_log` VALUES ('1955', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:46:32');
INSERT INTO `admin_log` VALUES ('1956', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:46:34');
INSERT INTO `admin_log` VALUES ('1957', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:46:49');
INSERT INTO `admin_log` VALUES ('1958', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:47:09');
INSERT INTO `admin_log` VALUES ('1959', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-01-04 17:47:43');
INSERT INTO `admin_log` VALUES ('1960', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-01-04 17:47:43');
INSERT INTO `admin_log` VALUES ('1961', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-01-04 17:51:26');
INSERT INTO `admin_log` VALUES ('1962', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 17:51:57');
INSERT INTO `admin_log` VALUES ('1963', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 17:53:34');
INSERT INTO `admin_log` VALUES ('1964', '1', 'gestion-curricular', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-04 17:53:53');
INSERT INTO `admin_log` VALUES ('1965', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 17:55:12');
INSERT INTO `admin_log` VALUES ('1966', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 17:55:16');
INSERT INTO `admin_log` VALUES ('1967', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:55:21');
INSERT INTO `admin_log` VALUES ('1968', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:55:22');
INSERT INTO `admin_log` VALUES ('1969', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:56:20');
INSERT INTO `admin_log` VALUES ('1970', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:56:21');
INSERT INTO `admin_log` VALUES ('1971', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 17:56:38');
INSERT INTO `admin_log` VALUES ('1972', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-01-04 17:56:40');
INSERT INTO `admin_log` VALUES ('1973', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:56:47');
INSERT INTO `admin_log` VALUES ('1974', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:56:47');
INSERT INTO `admin_log` VALUES ('1975', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 17:58:50');
INSERT INTO `admin_log` VALUES ('1976', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 17:58:51');
INSERT INTO `admin_log` VALUES ('1977', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 17:58:58');
INSERT INTO `admin_log` VALUES ('1978', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:15:40');
INSERT INTO `admin_log` VALUES ('1979', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:15:41');
INSERT INTO `admin_log` VALUES ('1980', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:15:45');
INSERT INTO `admin_log` VALUES ('1981', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:18:30');
INSERT INTO `admin_log` VALUES ('1982', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:18:31');
INSERT INTO `admin_log` VALUES ('1983', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:18:37');
INSERT INTO `admin_log` VALUES ('1984', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:19:42');
INSERT INTO `admin_log` VALUES ('1985', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:19:44');
INSERT INTO `admin_log` VALUES ('1986', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:20:10');
INSERT INTO `admin_log` VALUES ('1987', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:26:32');
INSERT INTO `admin_log` VALUES ('1988', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:26:33');
INSERT INTO `admin_log` VALUES ('1989', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:26:39');
INSERT INTO `admin_log` VALUES ('1990', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:28:34');
INSERT INTO `admin_log` VALUES ('1991', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:28:35');
INSERT INTO `admin_log` VALUES ('1992', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:28:39');
INSERT INTO `admin_log` VALUES ('1993', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:28:49');
INSERT INTO `admin_log` VALUES ('1994', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:29:50');
INSERT INTO `admin_log` VALUES ('1995', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:29:59');
INSERT INTO `admin_log` VALUES ('1996', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:30:00');
INSERT INTO `admin_log` VALUES ('1997', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:30:02');
INSERT INTO `admin_log` VALUES ('1998', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:30:13');
INSERT INTO `admin_log` VALUES ('1999', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:30:31');
INSERT INTO `admin_log` VALUES ('2000', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:30:32');
INSERT INTO `admin_log` VALUES ('2001', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:30:36');
INSERT INTO `admin_log` VALUES ('2002', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:31:22');
INSERT INTO `admin_log` VALUES ('2003', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:31:29');
INSERT INTO `admin_log` VALUES ('2004', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:31:32');
INSERT INTO `admin_log` VALUES ('2005', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:31:34');
INSERT INTO `admin_log` VALUES ('2006', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:31:35');
INSERT INTO `admin_log` VALUES ('2007', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:31:38');
INSERT INTO `admin_log` VALUES ('2008', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:34:02');
INSERT INTO `admin_log` VALUES ('2009', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:34:43');
INSERT INTO `admin_log` VALUES ('2010', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:34:45');
INSERT INTO `admin_log` VALUES ('2011', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:34:47');
INSERT INTO `admin_log` VALUES ('2012', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:34:54');
INSERT INTO `admin_log` VALUES ('2013', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:34:55');
INSERT INTO `admin_log` VALUES ('2014', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:34:59');
INSERT INTO `admin_log` VALUES ('2015', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:35:09');
INSERT INTO `admin_log` VALUES ('2016', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:35:11');
INSERT INTO `admin_log` VALUES ('2017', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:35:19');
INSERT INTO `admin_log` VALUES ('2018', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:36:24');
INSERT INTO `admin_log` VALUES ('2019', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:36:50');
INSERT INTO `admin_log` VALUES ('2020', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:36:51');
INSERT INTO `admin_log` VALUES ('2021', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:36:53');
INSERT INTO `admin_log` VALUES ('2022', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:40:41');
INSERT INTO `admin_log` VALUES ('2023', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:40:43');
INSERT INTO `admin_log` VALUES ('2024', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:43:04');
INSERT INTO `admin_log` VALUES ('2025', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:43:05');
INSERT INTO `admin_log` VALUES ('2026', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:45:15');
INSERT INTO `admin_log` VALUES ('2027', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:45:55');
INSERT INTO `admin_log` VALUES ('2028', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:45:58');
INSERT INTO `admin_log` VALUES ('2029', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:45:59');
INSERT INTO `admin_log` VALUES ('2030', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:46:02');
INSERT INTO `admin_log` VALUES ('2031', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:46:35');
INSERT INTO `admin_log` VALUES ('2032', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:46:38');
INSERT INTO `admin_log` VALUES ('2033', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:47:45');
INSERT INTO `admin_log` VALUES ('2034', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:47:51');
INSERT INTO `admin_log` VALUES ('2035', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:53:21');
INSERT INTO `admin_log` VALUES ('2036', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:53:23');
INSERT INTO `admin_log` VALUES ('2037', '1', 'ruta-academica', 'pagina.php', 'gestion_materia', '1', 'EXITO', '2021-01-04 18:55:57');
INSERT INTO `admin_log` VALUES ('2038', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-01-04 18:55:58');
INSERT INTO `admin_log` VALUES ('2039', '1', 'ruta-academica', 'descarga.php', 'lista', '1', 'EXITO', '2021-01-04 18:56:01');
INSERT INTO `admin_log` VALUES ('2040', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 18:59:40');
INSERT INTO `admin_log` VALUES ('2041', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 18:59:44');
INSERT INTO `admin_log` VALUES ('2042', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:00:38');
INSERT INTO `admin_log` VALUES ('2043', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:00:41');
INSERT INTO `admin_log` VALUES ('2044', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:02:29');
INSERT INTO `admin_log` VALUES ('2045', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:03:17');
INSERT INTO `admin_log` VALUES ('2046', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:03:51');
INSERT INTO `admin_log` VALUES ('2047', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:04:11');
INSERT INTO `admin_log` VALUES ('2048', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:04:20');
INSERT INTO `admin_log` VALUES ('2049', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:09:53');
INSERT INTO `admin_log` VALUES ('2050', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:10:57');
INSERT INTO `admin_log` VALUES ('2051', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:11:23');
INSERT INTO `admin_log` VALUES ('2052', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:12:00');
INSERT INTO `admin_log` VALUES ('2053', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:12:35');
INSERT INTO `admin_log` VALUES ('2054', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:13:57');
INSERT INTO `admin_log` VALUES ('2055', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:14:05');
INSERT INTO `admin_log` VALUES ('2056', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:15:54');
INSERT INTO `admin_log` VALUES ('2057', '1', 'competencias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:15:57');
INSERT INTO `admin_log` VALUES ('2058', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:16:05');
INSERT INTO `admin_log` VALUES ('2059', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:16:07');
INSERT INTO `admin_log` VALUES ('2060', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:16:13');
INSERT INTO `admin_log` VALUES ('2061', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:16:15');
INSERT INTO `admin_log` VALUES ('2062', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:16:18');
INSERT INTO `admin_log` VALUES ('2063', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:16:30');
INSERT INTO `admin_log` VALUES ('2064', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:16:48');
INSERT INTO `admin_log` VALUES ('2065', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:16:57');
INSERT INTO `admin_log` VALUES ('2066', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:18:35');
INSERT INTO `admin_log` VALUES ('2067', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-04 19:22:35');
INSERT INTO `admin_log` VALUES ('2068', '1', 'gestion-curricular', 'descarga.php', 'agregar', '1', 'EXITO', '2021-01-04 19:22:47');
INSERT INTO `admin_log` VALUES ('2069', '1', 'gestion-curricular', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:22:52');
INSERT INTO `admin_log` VALUES ('2070', '1', 'gestion-curricular', 'descarga.php', 'asignar', '1', 'EXITO', '2021-01-04 19:23:08');
INSERT INTO `admin_log` VALUES ('2071', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-05 05:58:20');
INSERT INTO `admin_log` VALUES ('2072', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-05 06:05:34');
INSERT INTO `admin_log` VALUES ('2073', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-01-05 06:07:32');
INSERT INTO `admin_log` VALUES ('2074', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2021-01-05 06:07:55');
INSERT INTO `admin_log` VALUES ('2075', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:46:29');
INSERT INTO `admin_log` VALUES ('2076', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:46:35');
INSERT INTO `admin_log` VALUES ('2077', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:46:39');
INSERT INTO `admin_log` VALUES ('2078', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-02 08:46:44');
INSERT INTO `admin_log` VALUES ('2079', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-02 08:47:36');
INSERT INTO `admin_log` VALUES ('2080', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:47:49');
INSERT INTO `admin_log` VALUES ('2081', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:48:07');
INSERT INTO `admin_log` VALUES ('2082', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:48:13');
INSERT INTO `admin_log` VALUES ('2083', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:48:31');
INSERT INTO `admin_log` VALUES ('2084', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:48:40');
INSERT INTO `admin_log` VALUES ('2085', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:48:45');
INSERT INTO `admin_log` VALUES ('2086', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-02 08:48:54');
INSERT INTO `admin_log` VALUES ('2087', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 08:48:54');
INSERT INTO `admin_log` VALUES ('2088', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-02 08:49:31');
INSERT INTO `admin_log` VALUES ('2089', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:49:45');
INSERT INTO `admin_log` VALUES ('2090', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:50:01');
INSERT INTO `admin_log` VALUES ('2091', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:50:14');
INSERT INTO `admin_log` VALUES ('2092', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:50:18');
INSERT INTO `admin_log` VALUES ('2093', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:50:32');
INSERT INTO `admin_log` VALUES ('2094', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:50:52');
INSERT INTO `admin_log` VALUES ('2095', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:50:57');
INSERT INTO `admin_log` VALUES ('2096', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:51:07');
INSERT INTO `admin_log` VALUES ('2097', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:51:27');
INSERT INTO `admin_log` VALUES ('2098', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:51:34');
INSERT INTO `admin_log` VALUES ('2099', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:51:41');
INSERT INTO `admin_log` VALUES ('2100', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:51:55');
INSERT INTO `admin_log` VALUES ('2101', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:51:59');
INSERT INTO `admin_log` VALUES ('2102', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:52:05');
INSERT INTO `admin_log` VALUES ('2103', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:52:13');
INSERT INTO `admin_log` VALUES ('2104', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 08:52:21');
INSERT INTO `admin_log` VALUES ('2105', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:52:25');
INSERT INTO `admin_log` VALUES ('2106', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:52:33');
INSERT INTO `admin_log` VALUES ('2107', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 08:52:37');
INSERT INTO `admin_log` VALUES ('2108', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:52:44');
INSERT INTO `admin_log` VALUES ('2109', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:52:57');
INSERT INTO `admin_log` VALUES ('2110', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:53:04');
INSERT INTO `admin_log` VALUES ('2111', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:53:16');
INSERT INTO `admin_log` VALUES ('2112', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:53:24');
INSERT INTO `admin_log` VALUES ('2113', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:53:32');
INSERT INTO `admin_log` VALUES ('2114', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:53:40');
INSERT INTO `admin_log` VALUES ('2115', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:53:46');
INSERT INTO `admin_log` VALUES ('2116', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 08:53:52');
INSERT INTO `admin_log` VALUES ('2117', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 08:53:56');
INSERT INTO `admin_log` VALUES ('2118', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 08:54:00');
INSERT INTO `admin_log` VALUES ('2119', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:54:07');
INSERT INTO `admin_log` VALUES ('2120', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:54:16');
INSERT INTO `admin_log` VALUES ('2121', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:54:29');
INSERT INTO `admin_log` VALUES ('2122', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:54:38');
INSERT INTO `admin_log` VALUES ('2123', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 08:54:44');
INSERT INTO `admin_log` VALUES ('2124', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:54:49');
INSERT INTO `admin_log` VALUES ('2125', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:54:56');
INSERT INTO `admin_log` VALUES ('2126', '1', 'ruta-academica', 'descarga.php', 'llenar_combo', '1', 'EXITO', '2021-02-02 08:55:20');
INSERT INTO `admin_log` VALUES ('2127', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 08:56:49');
INSERT INTO `admin_log` VALUES ('2128', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 08:56:57');
INSERT INTO `admin_log` VALUES ('2129', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:25:57');
INSERT INTO `admin_log` VALUES ('2130', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:26:00');
INSERT INTO `admin_log` VALUES ('2131', '1', 'materias', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 09:26:16');
INSERT INTO `admin_log` VALUES ('2132', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:26:20');
INSERT INTO `admin_log` VALUES ('2133', '1', 'materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:26:51');
INSERT INTO `admin_log` VALUES ('2134', '1', 'materias', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 09:26:53');
INSERT INTO `admin_log` VALUES ('2135', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:26:58');
INSERT INTO `admin_log` VALUES ('2136', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:28:12');
INSERT INTO `admin_log` VALUES ('2137', '1', 'gestion-curricular', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:29:04');
INSERT INTO `admin_log` VALUES ('2138', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:29:13');
INSERT INTO `admin_log` VALUES ('2139', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:29:52');
INSERT INTO `admin_log` VALUES ('2140', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:30:02');
INSERT INTO `admin_log` VALUES ('2141', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 09:45:02');
INSERT INTO `admin_log` VALUES ('2142', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 09:45:22');
INSERT INTO `admin_log` VALUES ('2143', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:45:29');
INSERT INTO `admin_log` VALUES ('2144', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:45:33');
INSERT INTO `admin_log` VALUES ('2145', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:45:38');
INSERT INTO `admin_log` VALUES ('2146', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 09:45:48');
INSERT INTO `admin_log` VALUES ('2147', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 09:46:29');
INSERT INTO `admin_log` VALUES ('2148', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-02 09:46:48');
INSERT INTO `admin_log` VALUES ('2149', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:47:04');
INSERT INTO `admin_log` VALUES ('2150', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:47:13');
INSERT INTO `admin_log` VALUES ('2151', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 09:47:39');
INSERT INTO `admin_log` VALUES ('2152', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 09:48:39');
INSERT INTO `admin_log` VALUES ('2153', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 09:48:43');
INSERT INTO `admin_log` VALUES ('2154', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-02 09:48:46');
INSERT INTO `admin_log` VALUES ('2155', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2021-02-02 15:22:41');
INSERT INTO `admin_log` VALUES ('2156', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:23:56');
INSERT INTO `admin_log` VALUES ('2157', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:24:45');
INSERT INTO `admin_log` VALUES ('2158', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:24:54');
INSERT INTO `admin_log` VALUES ('2159', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-02 15:26:11');
INSERT INTO `admin_log` VALUES ('2160', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:26:17');
INSERT INTO `admin_log` VALUES ('2161', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:26:24');
INSERT INTO `admin_log` VALUES ('2162', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 15:26:33');
INSERT INTO `admin_log` VALUES ('2163', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 15:26:43');
INSERT INTO `admin_log` VALUES ('2164', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:26:49');
INSERT INTO `admin_log` VALUES ('2165', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:26:50');
INSERT INTO `admin_log` VALUES ('2166', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:27:55');
INSERT INTO `admin_log` VALUES ('2167', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:28:00');
INSERT INTO `admin_log` VALUES ('2168', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:32');
INSERT INTO `admin_log` VALUES ('2169', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:33');
INSERT INTO `admin_log` VALUES ('2170', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:35');
INSERT INTO `admin_log` VALUES ('2171', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:36');
INSERT INTO `admin_log` VALUES ('2172', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:40');
INSERT INTO `admin_log` VALUES ('2173', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:41');
INSERT INTO `admin_log` VALUES ('2174', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:49');
INSERT INTO `admin_log` VALUES ('2175', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:29:49');
INSERT INTO `admin_log` VALUES ('2176', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:29:55');
INSERT INTO `admin_log` VALUES ('2177', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:30:04');
INSERT INTO `admin_log` VALUES ('2178', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-02 15:30:12');
INSERT INTO `admin_log` VALUES ('2179', '1', 'gestion-menu', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-02 15:31:05');
INSERT INTO `admin_log` VALUES ('2180', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:31:11');
INSERT INTO `admin_log` VALUES ('2181', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-02 15:31:21');
INSERT INTO `admin_log` VALUES ('2182', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-02 15:31:27');
INSERT INTO `admin_log` VALUES ('2183', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:31:34');
INSERT INTO `admin_log` VALUES ('2184', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:31:35');
INSERT INTO `admin_log` VALUES ('2185', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:31:39');
INSERT INTO `admin_log` VALUES ('2186', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:31:45');
INSERT INTO `admin_log` VALUES ('2187', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:32:05');
INSERT INTO `admin_log` VALUES ('2188', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-02 15:32:09');
INSERT INTO `admin_log` VALUES ('2189', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 15:32:23');
INSERT INTO `admin_log` VALUES ('2190', '1', 'crear-formulario-libre', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-02 15:32:41');
INSERT INTO `admin_log` VALUES ('2191', '1', 'crear-formulario-libre', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-02 15:32:50');
INSERT INTO `admin_log` VALUES ('2192', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:32:54');
INSERT INTO `admin_log` VALUES ('2193', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:32:55');
INSERT INTO `admin_log` VALUES ('2194', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:32:58');
INSERT INTO `admin_log` VALUES ('2195', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:32:58');
INSERT INTO `admin_log` VALUES ('2196', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:33:25');
INSERT INTO `admin_log` VALUES ('2197', '1', 'ruta-academica', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:33:26');
INSERT INTO `admin_log` VALUES ('2198', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-02 15:33:41');
INSERT INTO `admin_log` VALUES ('2199', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:33:48');
INSERT INTO `admin_log` VALUES ('2200', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 15:34:39');
INSERT INTO `admin_log` VALUES ('2201', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:35:00');
INSERT INTO `admin_log` VALUES ('2202', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 15:35:07');
INSERT INTO `admin_log` VALUES ('2203', '1', 'test1', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:35:11');
INSERT INTO `admin_log` VALUES ('2204', '1', 'test1', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:35:17');
INSERT INTO `admin_log` VALUES ('2205', '1', 'test1', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:35:18');
INSERT INTO `admin_log` VALUES ('2206', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:35:36');
INSERT INTO `admin_log` VALUES ('2207', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 15:35:55');
INSERT INTO `admin_log` VALUES ('2208', '1', 'test1', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:35:59');
INSERT INTO `admin_log` VALUES ('2209', '1', 'test1', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-02 15:36:00');
INSERT INTO `admin_log` VALUES ('2210', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:36:47');
INSERT INTO `admin_log` VALUES ('2211', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:37:23');
INSERT INTO `admin_log` VALUES ('2212', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 15:37:29');
INSERT INTO `admin_log` VALUES ('2213', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-02 15:41:39');
INSERT INTO `admin_log` VALUES ('2214', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-02 15:41:53');
INSERT INTO `admin_log` VALUES ('2215', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-03 05:08:12');
INSERT INTO `admin_log` VALUES ('2216', '1', 'ruta-academica-list', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-05 09:18:40');
INSERT INTO `admin_log` VALUES ('2217', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 09:19:33');
INSERT INTO `admin_log` VALUES ('2218', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-05 09:19:39');
INSERT INTO `admin_log` VALUES ('2219', '1', 'ruta-academica-list', 'descarga.php', 'aceptar', '1', 'EXITO', '2021-02-05 09:20:08');
INSERT INTO `admin_log` VALUES ('2220', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 09:20:44');
INSERT INTO `admin_log` VALUES ('2221', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-05 09:21:12');
INSERT INTO `admin_log` VALUES ('2222', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-05 09:21:45');
INSERT INTO `admin_log` VALUES ('2223', '1', 'ruta-academica-list', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-05 09:22:12');
INSERT INTO `admin_log` VALUES ('2224', '1', 'ruta-academica-list', 'descarga.php', 'aceptar', '1', 'EXITO', '2021-02-05 09:22:37');
INSERT INTO `admin_log` VALUES ('2225', '1', 'ruta-academica-list', 'descarga.php', 'aceptar', '1', 'EXITO', '2021-02-05 09:23:43');
INSERT INTO `admin_log` VALUES ('2226', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:35:32');
INSERT INTO `admin_log` VALUES ('2227', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:52:35');
INSERT INTO `admin_log` VALUES ('2228', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:53:06');
INSERT INTO `admin_log` VALUES ('2229', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-05 12:53:11');
INSERT INTO `admin_log` VALUES ('2230', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-05 12:53:17');
INSERT INTO `admin_log` VALUES ('2231', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:53:23');
INSERT INTO `admin_log` VALUES ('2232', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:53:43');
INSERT INTO `admin_log` VALUES ('2233', '1', 'gestion-de-acciones', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-05 12:53:56');
INSERT INTO `admin_log` VALUES ('2234', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-05 12:54:37');
INSERT INTO `admin_log` VALUES ('2235', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-05 12:54:45');
INSERT INTO `admin_log` VALUES ('2236', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 12:55:06');
INSERT INTO `admin_log` VALUES ('2237', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-05 12:55:29');
INSERT INTO `admin_log` VALUES ('2238', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-05 12:55:42');
INSERT INTO `admin_log` VALUES ('2239', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-05 12:55:46');
INSERT INTO `admin_log` VALUES ('2240', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-05 12:55:51');
INSERT INTO `admin_log` VALUES ('2241', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-05 12:56:06');
INSERT INTO `admin_log` VALUES ('2242', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-05 12:56:11');
INSERT INTO `admin_log` VALUES ('2243', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-05 12:56:16');
INSERT INTO `admin_log` VALUES ('2244', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 12:56:28');
INSERT INTO `admin_log` VALUES ('2245', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 12:59:07');
INSERT INTO `admin_log` VALUES ('2246', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:00:30');
INSERT INTO `admin_log` VALUES ('2247', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:01:50');
INSERT INTO `admin_log` VALUES ('2248', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:02:21');
INSERT INTO `admin_log` VALUES ('2249', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:06:05');
INSERT INTO `admin_log` VALUES ('2250', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:08:02');
INSERT INTO `admin_log` VALUES ('2251', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:14:39');
INSERT INTO `admin_log` VALUES ('2252', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:15:07');
INSERT INTO `admin_log` VALUES ('2253', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:15:28');
INSERT INTO `admin_log` VALUES ('2254', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:15:52');
INSERT INTO `admin_log` VALUES ('2255', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:24:40');
INSERT INTO `admin_log` VALUES ('2256', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:27:48');
INSERT INTO `admin_log` VALUES ('2257', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:28:56');
INSERT INTO `admin_log` VALUES ('2258', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:30:13');
INSERT INTO `admin_log` VALUES ('2259', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:31:28');
INSERT INTO `admin_log` VALUES ('2260', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-05 13:32:37');
INSERT INTO `admin_log` VALUES ('2261', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 04:26:41');
INSERT INTO `admin_log` VALUES ('2262', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 04:26:52');
INSERT INTO `admin_log` VALUES ('2263', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-07 04:27:55');
INSERT INTO `admin_log` VALUES ('2264', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-07 04:28:00');
INSERT INTO `admin_log` VALUES ('2265', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-07 04:28:20');
INSERT INTO `admin_log` VALUES ('2266', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-07 04:28:30');
INSERT INTO `admin_log` VALUES ('2267', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-07 04:28:36');
INSERT INTO `admin_log` VALUES ('2268', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-07 04:28:41');
INSERT INTO `admin_log` VALUES ('2269', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:42:23');
INSERT INTO `admin_log` VALUES ('2270', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:42:33');
INSERT INTO `admin_log` VALUES ('2271', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:43:11');
INSERT INTO `admin_log` VALUES ('2272', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:44:02');
INSERT INTO `admin_log` VALUES ('2273', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:45:21');
INSERT INTO `admin_log` VALUES ('2274', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:46:14');
INSERT INTO `admin_log` VALUES ('2275', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 04:46:15');
INSERT INTO `admin_log` VALUES ('2276', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 04:47:25');
INSERT INTO `admin_log` VALUES ('2277', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 04:47:27');
INSERT INTO `admin_log` VALUES ('2278', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 05:05:19');
INSERT INTO `admin_log` VALUES ('2279', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 05:05:21');
INSERT INTO `admin_log` VALUES ('2280', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 05:17:06');
INSERT INTO `admin_log` VALUES ('2281', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 05:17:13');
INSERT INTO `admin_log` VALUES ('2282', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-07 05:17:23');
INSERT INTO `admin_log` VALUES ('2283', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-07 05:17:32');
INSERT INTO `admin_log` VALUES ('2284', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-07 05:17:42');
INSERT INTO `admin_log` VALUES ('2285', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-07 05:17:45');
INSERT INTO `admin_log` VALUES ('2286', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-07 05:17:51');
INSERT INTO `admin_log` VALUES ('2287', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-07 05:17:56');
INSERT INTO `admin_log` VALUES ('2288', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:25:50');
INSERT INTO `admin_log` VALUES ('2289', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:30:10');
INSERT INTO `admin_log` VALUES ('2290', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:32:17');
INSERT INTO `admin_log` VALUES ('2291', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:32:36');
INSERT INTO `admin_log` VALUES ('2292', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:32:55');
INSERT INTO `admin_log` VALUES ('2293', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:33:06');
INSERT INTO `admin_log` VALUES ('2294', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:33:47');
INSERT INTO `admin_log` VALUES ('2295', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:33:55');
INSERT INTO `admin_log` VALUES ('2296', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:34:34');
INSERT INTO `admin_log` VALUES ('2297', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:34:38');
INSERT INTO `admin_log` VALUES ('2298', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:34:42');
INSERT INTO `admin_log` VALUES ('2299', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:34:44');
INSERT INTO `admin_log` VALUES ('2300', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:35:24');
INSERT INTO `admin_log` VALUES ('2301', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:35:48');
INSERT INTO `admin_log` VALUES ('2302', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:36:20');
INSERT INTO `admin_log` VALUES ('2303', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:36:40');
INSERT INTO `admin_log` VALUES ('2304', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:36:45');
INSERT INTO `admin_log` VALUES ('2305', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:36:48');
INSERT INTO `admin_log` VALUES ('2306', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:37:23');
INSERT INTO `admin_log` VALUES ('2307', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:40:35');
INSERT INTO `admin_log` VALUES ('2308', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:42:20');
INSERT INTO `admin_log` VALUES ('2309', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:42:34');
INSERT INTO `admin_log` VALUES ('2310', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:42:38');
INSERT INTO `admin_log` VALUES ('2311', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:44:22');
INSERT INTO `admin_log` VALUES ('2312', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 05:44:42');
INSERT INTO `admin_log` VALUES ('2313', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 05:44:43');
INSERT INTO `admin_log` VALUES ('2314', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:44:46');
INSERT INTO `admin_log` VALUES ('2315', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:46:54');
INSERT INTO `admin_log` VALUES ('2316', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:50:27');
INSERT INTO `admin_log` VALUES ('2317', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:51:08');
INSERT INTO `admin_log` VALUES ('2318', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:52:35');
INSERT INTO `admin_log` VALUES ('2319', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 05:53:51');
INSERT INTO `admin_log` VALUES ('2320', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:05:11');
INSERT INTO `admin_log` VALUES ('2321', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:05:15');
INSERT INTO `admin_log` VALUES ('2322', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:05:17');
INSERT INTO `admin_log` VALUES ('2323', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:06:40');
INSERT INTO `admin_log` VALUES ('2324', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:06:45');
INSERT INTO `admin_log` VALUES ('2325', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:06:46');
INSERT INTO `admin_log` VALUES ('2326', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:07:14');
INSERT INTO `admin_log` VALUES ('2327', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:07:16');
INSERT INTO `admin_log` VALUES ('2328', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:07:17');
INSERT INTO `admin_log` VALUES ('2329', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:08:04');
INSERT INTO `admin_log` VALUES ('2330', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:08:06');
INSERT INTO `admin_log` VALUES ('2331', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:08:55');
INSERT INTO `admin_log` VALUES ('2332', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:08:59');
INSERT INTO `admin_log` VALUES ('2333', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:09:35');
INSERT INTO `admin_log` VALUES ('2334', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:09:39');
INSERT INTO `admin_log` VALUES ('2335', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:09:40');
INSERT INTO `admin_log` VALUES ('2336', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:11:44');
INSERT INTO `admin_log` VALUES ('2337', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-07 06:11:46');
INSERT INTO `admin_log` VALUES ('2338', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:17:07');
INSERT INTO `admin_log` VALUES ('2339', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:17:12');
INSERT INTO `admin_log` VALUES ('2340', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:17:13');
INSERT INTO `admin_log` VALUES ('2341', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:18:47');
INSERT INTO `admin_log` VALUES ('2342', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:18:50');
INSERT INTO `admin_log` VALUES ('2343', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:18:51');
INSERT INTO `admin_log` VALUES ('2344', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:19:40');
INSERT INTO `admin_log` VALUES ('2345', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:19:43');
INSERT INTO `admin_log` VALUES ('2346', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:19:44');
INSERT INTO `admin_log` VALUES ('2347', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:20:28');
INSERT INTO `admin_log` VALUES ('2348', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:20:29');
INSERT INTO `admin_log` VALUES ('2349', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:20:33');
INSERT INTO `admin_log` VALUES ('2350', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:20:37');
INSERT INTO `admin_log` VALUES ('2351', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:20:39');
INSERT INTO `admin_log` VALUES ('2352', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:21:23');
INSERT INTO `admin_log` VALUES ('2353', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:21:24');
INSERT INTO `admin_log` VALUES ('2354', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:21:25');
INSERT INTO `admin_log` VALUES ('2355', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:21:28');
INSERT INTO `admin_log` VALUES ('2356', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:24:33');
INSERT INTO `admin_log` VALUES ('2357', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:24:34');
INSERT INTO `admin_log` VALUES ('2358', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:24:36');
INSERT INTO `admin_log` VALUES ('2359', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:26:29');
INSERT INTO `admin_log` VALUES ('2360', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:26:34');
INSERT INTO `admin_log` VALUES ('2361', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:26:37');
INSERT INTO `admin_log` VALUES ('2362', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:27:15');
INSERT INTO `admin_log` VALUES ('2363', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:27:16');
INSERT INTO `admin_log` VALUES ('2364', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:27:18');
INSERT INTO `admin_log` VALUES ('2365', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:27:32');
INSERT INTO `admin_log` VALUES ('2366', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:27:57');
INSERT INTO `admin_log` VALUES ('2367', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:27:58');
INSERT INTO `admin_log` VALUES ('2368', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:28:00');
INSERT INTO `admin_log` VALUES ('2369', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:28:04');
INSERT INTO `admin_log` VALUES ('2370', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:28:05');
INSERT INTO `admin_log` VALUES ('2371', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:28:07');
INSERT INTO `admin_log` VALUES ('2372', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:28:09');
INSERT INTO `admin_log` VALUES ('2373', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:32:06');
INSERT INTO `admin_log` VALUES ('2374', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:32:08');
INSERT INTO `admin_log` VALUES ('2375', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:32:22');
INSERT INTO `admin_log` VALUES ('2376', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:32:26');
INSERT INTO `admin_log` VALUES ('2377', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:32:27');
INSERT INTO `admin_log` VALUES ('2378', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:33:11');
INSERT INTO `admin_log` VALUES ('2379', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:33:20');
INSERT INTO `admin_log` VALUES ('2380', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:34:01');
INSERT INTO `admin_log` VALUES ('2381', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:34:41');
INSERT INTO `admin_log` VALUES ('2382', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:34:43');
INSERT INTO `admin_log` VALUES ('2383', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:35:11');
INSERT INTO `admin_log` VALUES ('2384', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:35:14');
INSERT INTO `admin_log` VALUES ('2385', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:35:35');
INSERT INTO `admin_log` VALUES ('2386', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:36:27');
INSERT INTO `admin_log` VALUES ('2387', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:37:11');
INSERT INTO `admin_log` VALUES ('2388', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:38:42');
INSERT INTO `admin_log` VALUES ('2389', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:39:22');
INSERT INTO `admin_log` VALUES ('2390', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:39:26');
INSERT INTO `admin_log` VALUES ('2391', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:40:00');
INSERT INTO `admin_log` VALUES ('2392', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:40:31');
INSERT INTO `admin_log` VALUES ('2393', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:40:59');
INSERT INTO `admin_log` VALUES ('2394', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:41:24');
INSERT INTO `admin_log` VALUES ('2395', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:41:26');
INSERT INTO `admin_log` VALUES ('2396', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:42:08');
INSERT INTO `admin_log` VALUES ('2397', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:42:42');
INSERT INTO `admin_log` VALUES ('2398', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:43:28');
INSERT INTO `admin_log` VALUES ('2399', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:44:07');
INSERT INTO `admin_log` VALUES ('2400', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:44:19');
INSERT INTO `admin_log` VALUES ('2401', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:44:21');
INSERT INTO `admin_log` VALUES ('2402', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:45:07');
INSERT INTO `admin_log` VALUES ('2403', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:45:08');
INSERT INTO `admin_log` VALUES ('2404', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:46:47');
INSERT INTO `admin_log` VALUES ('2405', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:46:49');
INSERT INTO `admin_log` VALUES ('2406', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:47:09');
INSERT INTO `admin_log` VALUES ('2407', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:47:13');
INSERT INTO `admin_log` VALUES ('2408', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:47:14');
INSERT INTO `admin_log` VALUES ('2409', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:47:55');
INSERT INTO `admin_log` VALUES ('2410', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:47:58');
INSERT INTO `admin_log` VALUES ('2411', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:48:00');
INSERT INTO `admin_log` VALUES ('2412', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 06:48:09');
INSERT INTO `admin_log` VALUES ('2413', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:48:11');
INSERT INTO `admin_log` VALUES ('2414', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:48:12');
INSERT INTO `admin_log` VALUES ('2415', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 06:49:10');
INSERT INTO `admin_log` VALUES ('2416', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 06:49:11');
INSERT INTO `admin_log` VALUES ('2417', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 13:29:33');
INSERT INTO `admin_log` VALUES ('2418', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-07 13:33:50');
INSERT INTO `admin_log` VALUES ('2419', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-07 13:33:52');
INSERT INTO `admin_log` VALUES ('2420', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-07 13:33:53');
INSERT INTO `admin_log` VALUES ('2421', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 12:37:24');
INSERT INTO `admin_log` VALUES ('2422', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 12:38:19');
INSERT INTO `admin_log` VALUES ('2423', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 12:39:22');
INSERT INTO `admin_log` VALUES ('2424', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 12:39:34');
INSERT INTO `admin_log` VALUES ('2425', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:35:06');
INSERT INTO `admin_log` VALUES ('2426', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:35:30');
INSERT INTO `admin_log` VALUES ('2427', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-08 13:35:37');
INSERT INTO `admin_log` VALUES ('2428', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:45:13');
INSERT INTO `admin_log` VALUES ('2429', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:47:26');
INSERT INTO `admin_log` VALUES ('2430', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:47:28');
INSERT INTO `admin_log` VALUES ('2431', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-08 13:47:43');
INSERT INTO `admin_log` VALUES ('2432', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:48:17');
INSERT INTO `admin_log` VALUES ('2433', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:48:18');
INSERT INTO `admin_log` VALUES ('2434', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:49:23');
INSERT INTO `admin_log` VALUES ('2435', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:49:24');
INSERT INTO `admin_log` VALUES ('2436', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:49:55');
INSERT INTO `admin_log` VALUES ('2437', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:49:57');
INSERT INTO `admin_log` VALUES ('2438', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:50:38');
INSERT INTO `admin_log` VALUES ('2439', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:50:40');
INSERT INTO `admin_log` VALUES ('2440', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-08 13:50:51');
INSERT INTO `admin_log` VALUES ('2441', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-08 13:50:54');
INSERT INTO `admin_log` VALUES ('2442', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:50:55');
INSERT INTO `admin_log` VALUES ('2443', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-08 13:51:36');
INSERT INTO `admin_log` VALUES ('2444', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:52:30');
INSERT INTO `admin_log` VALUES ('2445', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:52:41');
INSERT INTO `admin_log` VALUES ('2446', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-08 13:55:57');
INSERT INTO `admin_log` VALUES ('2447', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-08 13:55:59');
INSERT INTO `admin_log` VALUES ('2448', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:21:12');
INSERT INTO `admin_log` VALUES ('2449', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:21:30');
INSERT INTO `admin_log` VALUES ('2450', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:21:34');
INSERT INTO `admin_log` VALUES ('2451', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:21:36');
INSERT INTO `admin_log` VALUES ('2452', '1', 'areas', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:21:38');
INSERT INTO `admin_log` VALUES ('2453', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:21:45');
INSERT INTO `admin_log` VALUES ('2454', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:22:25');
INSERT INTO `admin_log` VALUES ('2455', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:22:37');
INSERT INTO `admin_log` VALUES ('2456', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:22:48');
INSERT INTO `admin_log` VALUES ('2457', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:22:54');
INSERT INTO `admin_log` VALUES ('2458', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:22:56');
INSERT INTO `admin_log` VALUES ('2459', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:01');
INSERT INTO `admin_log` VALUES ('2460', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:03');
INSERT INTO `admin_log` VALUES ('2461', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:09');
INSERT INTO `admin_log` VALUES ('2462', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:11');
INSERT INTO `admin_log` VALUES ('2463', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:16');
INSERT INTO `admin_log` VALUES ('2464', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:18');
INSERT INTO `admin_log` VALUES ('2465', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:20');
INSERT INTO `admin_log` VALUES ('2466', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:23');
INSERT INTO `admin_log` VALUES ('2467', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:27');
INSERT INTO `admin_log` VALUES ('2468', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:29');
INSERT INTO `admin_log` VALUES ('2469', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:34');
INSERT INTO `admin_log` VALUES ('2470', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:36');
INSERT INTO `admin_log` VALUES ('2471', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:39');
INSERT INTO `admin_log` VALUES ('2472', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:42');
INSERT INTO `admin_log` VALUES ('2473', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:23:45');
INSERT INTO `admin_log` VALUES ('2474', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:23:47');
INSERT INTO `admin_log` VALUES ('2475', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:23:52');
INSERT INTO `admin_log` VALUES ('2476', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:24:15');
INSERT INTO `admin_log` VALUES ('2477', '1', 'roles', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:24:25');
INSERT INTO `admin_log` VALUES ('2478', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:24:30');
INSERT INTO `admin_log` VALUES ('2479', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:24:44');
INSERT INTO `admin_log` VALUES ('2480', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:24:44');
INSERT INTO `admin_log` VALUES ('2481', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:25:51');
INSERT INTO `admin_log` VALUES ('2482', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:25:59');
INSERT INTO `admin_log` VALUES ('2483', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:26:39');
INSERT INTO `admin_log` VALUES ('2484', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:26:39');
INSERT INTO `admin_log` VALUES ('2485', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:27:17');
INSERT INTO `admin_log` VALUES ('2486', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:27:22');
INSERT INTO `admin_log` VALUES ('2487', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:27:25');
INSERT INTO `admin_log` VALUES ('2488', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:27:46');
INSERT INTO `admin_log` VALUES ('2489', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:27:46');
INSERT INTO `admin_log` VALUES ('2490', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:28:00');
INSERT INTO `admin_log` VALUES ('2491', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:28:04');
INSERT INTO `admin_log` VALUES ('2492', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:28:06');
INSERT INTO `admin_log` VALUES ('2493', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:28:19');
INSERT INTO `admin_log` VALUES ('2494', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:28:19');
INSERT INTO `admin_log` VALUES ('2495', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:28:32');
INSERT INTO `admin_log` VALUES ('2496', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:28:38');
INSERT INTO `admin_log` VALUES ('2497', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:28:41');
INSERT INTO `admin_log` VALUES ('2498', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:28:55');
INSERT INTO `admin_log` VALUES ('2499', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:28:55');
INSERT INTO `admin_log` VALUES ('2500', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:29:17');
INSERT INTO `admin_log` VALUES ('2501', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:29:22');
INSERT INTO `admin_log` VALUES ('2502', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:29:27');
INSERT INTO `admin_log` VALUES ('2503', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:29:50');
INSERT INTO `admin_log` VALUES ('2504', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:29:59');
INSERT INTO `admin_log` VALUES ('2505', '1', 'areas', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-09 09:30:12');
INSERT INTO `admin_log` VALUES ('2506', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:30:18');
INSERT INTO `admin_log` VALUES ('2507', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:30:33');
INSERT INTO `admin_log` VALUES ('2508', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:30:56');
INSERT INTO `admin_log` VALUES ('2509', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:30:56');
INSERT INTO `admin_log` VALUES ('2510', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:31:04');
INSERT INTO `admin_log` VALUES ('2511', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:31:11');
INSERT INTO `admin_log` VALUES ('2512', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:31:11');
INSERT INTO `admin_log` VALUES ('2513', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:31:21');
INSERT INTO `admin_log` VALUES ('2514', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:31:42');
INSERT INTO `admin_log` VALUES ('2515', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:31:42');
INSERT INTO `admin_log` VALUES ('2516', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:31:57');
INSERT INTO `admin_log` VALUES ('2517', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:32:02');
INSERT INTO `admin_log` VALUES ('2518', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:32:05');
INSERT INTO `admin_log` VALUES ('2519', '1', 'asignacion-materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:32:22');
INSERT INTO `admin_log` VALUES ('2520', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:32:27');
INSERT INTO `admin_log` VALUES ('2521', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:32:29');
INSERT INTO `admin_log` VALUES ('2522', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:32:38');
INSERT INTO `admin_log` VALUES ('2523', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:32:50');
INSERT INTO `admin_log` VALUES ('2524', '1', 'gestion-menu', 'descarga.php', 'eliminar', '1', 'EXITO', '2021-02-09 09:32:52');
INSERT INTO `admin_log` VALUES ('2525', '1', 'crear-formulario-crud', 'descarga.php', 'cargarInfoFormulario', '1', 'EXITO', '2021-02-09 09:33:00');
INSERT INTO `admin_log` VALUES ('2526', '1', 'crear-formulario-crud', 'descarga.php', 'verificar', '1', 'EXITO', '2021-02-09 09:33:00');
INSERT INTO `admin_log` VALUES ('2527', '1', 'crear-formulario-crud', 'descarga.php', 'generar', '1', 'EXITO', '2021-02-09 09:33:32');
INSERT INTO `admin_log` VALUES ('2528', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:33:37');
INSERT INTO `admin_log` VALUES ('2529', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:35:14');
INSERT INTO `admin_log` VALUES ('2530', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:47:53');
INSERT INTO `admin_log` VALUES ('2531', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:48:23');
INSERT INTO `admin_log` VALUES ('2532', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:48:32');
INSERT INTO `admin_log` VALUES ('2533', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-09 09:48:37');
INSERT INTO `admin_log` VALUES ('2534', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:50:51');
INSERT INTO `admin_log` VALUES ('2535', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:52:54');
INSERT INTO `admin_log` VALUES ('2536', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:53:00');
INSERT INTO `admin_log` VALUES ('2537', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:53:16');
INSERT INTO `admin_log` VALUES ('2538', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 09:53:40');
INSERT INTO `admin_log` VALUES ('2539', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:53:45');
INSERT INTO `admin_log` VALUES ('2540', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:55:40');
INSERT INTO `admin_log` VALUES ('2541', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:56:03');
INSERT INTO `admin_log` VALUES ('2542', '1', 'usuarios', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 09:56:09');
INSERT INTO `admin_log` VALUES ('2543', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:57:28');
INSERT INTO `admin_log` VALUES ('2544', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 09:57:36');
INSERT INTO `admin_log` VALUES ('2545', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:57:50');
INSERT INTO `admin_log` VALUES ('2546', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-09 09:57:59');
INSERT INTO `admin_log` VALUES ('2547', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-09 09:58:14');
INSERT INTO `admin_log` VALUES ('2548', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 09:58:17');
INSERT INTO `admin_log` VALUES ('2549', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 09:58:28');
INSERT INTO `admin_log` VALUES ('2550', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 10:05:08');
INSERT INTO `admin_log` VALUES ('2551', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 10:05:24');
INSERT INTO `admin_log` VALUES ('2552', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 10:05:27');
INSERT INTO `admin_log` VALUES ('2553', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 10:05:37');
INSERT INTO `admin_log` VALUES ('2554', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 10:08:02');
INSERT INTO `admin_log` VALUES ('2555', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 10:08:23');
INSERT INTO `admin_log` VALUES ('2556', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 10:08:31');
INSERT INTO `admin_log` VALUES ('2557', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 10:10:04');
INSERT INTO `admin_log` VALUES ('2558', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-09 10:11:08');
INSERT INTO `admin_log` VALUES ('2559', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-09 10:11:14');
INSERT INTO `admin_log` VALUES ('2560', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-09 10:11:16');
INSERT INTO `admin_log` VALUES ('2561', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 08:33:05');
INSERT INTO `admin_log` VALUES ('2562', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 08:33:06');
INSERT INTO `admin_log` VALUES ('2563', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:01:15');
INSERT INTO `admin_log` VALUES ('2564', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:02:06');
INSERT INTO `admin_log` VALUES ('2565', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:03:31');
INSERT INTO `admin_log` VALUES ('2566', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:03:55');
INSERT INTO `admin_log` VALUES ('2567', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:03:58');
INSERT INTO `admin_log` VALUES ('2568', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:02');
INSERT INTO `admin_log` VALUES ('2569', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:10');
INSERT INTO `admin_log` VALUES ('2570', '1', 'gestion_docente', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-11 18:04:11');
INSERT INTO `admin_log` VALUES ('2571', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:14');
INSERT INTO `admin_log` VALUES ('2572', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:17');
INSERT INTO `admin_log` VALUES ('2573', '1', 'roles', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:30');
INSERT INTO `admin_log` VALUES ('2574', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:34');
INSERT INTO `admin_log` VALUES ('2575', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:42');
INSERT INTO `admin_log` VALUES ('2576', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:04:50');
INSERT INTO `admin_log` VALUES ('2577', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:23:38');
INSERT INTO `admin_log` VALUES ('2578', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:23:41');
INSERT INTO `admin_log` VALUES ('2579', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:24:30');
INSERT INTO `admin_log` VALUES ('2580', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:32:23');
INSERT INTO `admin_log` VALUES ('2581', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:32:43');
INSERT INTO `admin_log` VALUES ('2582', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:34:50');
INSERT INTO `admin_log` VALUES ('2583', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:35:06');
INSERT INTO `admin_log` VALUES ('2584', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:57:01');
INSERT INTO `admin_log` VALUES ('2585', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 18:57:35');
INSERT INTO `admin_log` VALUES ('2586', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:04:39');
INSERT INTO `admin_log` VALUES ('2587', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:06:24');
INSERT INTO `admin_log` VALUES ('2588', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-11 19:06:32');
INSERT INTO `admin_log` VALUES ('2589', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:14:25');
INSERT INTO `admin_log` VALUES ('2590', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-11 19:14:38');
INSERT INTO `admin_log` VALUES ('2591', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-11 19:14:40');
INSERT INTO `admin_log` VALUES ('2592', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:16:32');
INSERT INTO `admin_log` VALUES ('2593', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-11 19:16:46');
INSERT INTO `admin_log` VALUES ('2594', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:16:48');
INSERT INTO `admin_log` VALUES ('2595', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:16:53');
INSERT INTO `admin_log` VALUES ('2596', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:17:06');
INSERT INTO `admin_log` VALUES ('2597', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:21:15');
INSERT INTO `admin_log` VALUES ('2598', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:29:15');
INSERT INTO `admin_log` VALUES ('2599', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:29:37');
INSERT INTO `admin_log` VALUES ('2600', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:30:17');
INSERT INTO `admin_log` VALUES ('2601', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:31:16');
INSERT INTO `admin_log` VALUES ('2602', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:31:20');
INSERT INTO `admin_log` VALUES ('2603', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:31:36');
INSERT INTO `admin_log` VALUES ('2604', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:31:53');
INSERT INTO `admin_log` VALUES ('2605', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:31:57');
INSERT INTO `admin_log` VALUES ('2606', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:32:27');
INSERT INTO `admin_log` VALUES ('2607', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:33:41');
INSERT INTO `admin_log` VALUES ('2608', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:33:51');
INSERT INTO `admin_log` VALUES ('2609', '1', 'gestion-de-acciones', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-11 19:33:58');
INSERT INTO `admin_log` VALUES ('2610', '1', 'gestion-de-acciones', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-11 19:34:06');
INSERT INTO `admin_log` VALUES ('2611', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:34:09');
INSERT INTO `admin_log` VALUES ('2612', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:34:15');
INSERT INTO `admin_log` VALUES ('2613', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:34:31');
INSERT INTO `admin_log` VALUES ('2614', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:34:34');
INSERT INTO `admin_log` VALUES ('2615', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:34:36');
INSERT INTO `admin_log` VALUES ('2616', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:36:59');
INSERT INTO `admin_log` VALUES ('2617', '1', 'gestion_docente', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-11 19:37:20');
INSERT INTO `admin_log` VALUES ('2618', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:37:22');
INSERT INTO `admin_log` VALUES ('2619', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:38:04');
INSERT INTO `admin_log` VALUES ('2620', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:38:40');
INSERT INTO `admin_log` VALUES ('2621', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:39:31');
INSERT INTO `admin_log` VALUES ('2622', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-11 19:39:38');
INSERT INTO `admin_log` VALUES ('2623', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:21:57');
INSERT INTO `admin_log` VALUES ('2624', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:22:23');
INSERT INTO `admin_log` VALUES ('2625', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:22:42');
INSERT INTO `admin_log` VALUES ('2626', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:22:53');
INSERT INTO `admin_log` VALUES ('2627', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:23:19');
INSERT INTO `admin_log` VALUES ('2628', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:23:32');
INSERT INTO `admin_log` VALUES ('2629', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:23:33');
INSERT INTO `admin_log` VALUES ('2630', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:23:39');
INSERT INTO `admin_log` VALUES ('2631', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:23:46');
INSERT INTO `admin_log` VALUES ('2632', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:23:56');
INSERT INTO `admin_log` VALUES ('2633', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-12 15:24:00');
INSERT INTO `admin_log` VALUES ('2634', '1', 'usuarios', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-12 15:24:04');
INSERT INTO `admin_log` VALUES ('2635', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:24:09');
INSERT INTO `admin_log` VALUES ('2636', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:24:15');
INSERT INTO `admin_log` VALUES ('2637', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:24:16');
INSERT INTO `admin_log` VALUES ('2638', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:24:18');
INSERT INTO `admin_log` VALUES ('2639', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:24:20');
INSERT INTO `admin_log` VALUES ('2640', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:24:21');
INSERT INTO `admin_log` VALUES ('2641', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:28:16');
INSERT INTO `admin_log` VALUES ('2642', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:28:17');
INSERT INTO `admin_log` VALUES ('2643', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:28:26');
INSERT INTO `admin_log` VALUES ('2644', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:28:34');
INSERT INTO `admin_log` VALUES ('2645', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:28:40');
INSERT INTO `admin_log` VALUES ('2646', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:29:43');
INSERT INTO `admin_log` VALUES ('2647', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:32:59');
INSERT INTO `admin_log` VALUES ('2648', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:33:08');
INSERT INTO `admin_log` VALUES ('2649', '1', 'areas', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-12 15:33:17');
INSERT INTO `admin_log` VALUES ('2650', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:33:25');
INSERT INTO `admin_log` VALUES ('2651', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:33:34');
INSERT INTO `admin_log` VALUES ('2652', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:44:13');
INSERT INTO `admin_log` VALUES ('2653', '1', 'asignacion-materias', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-12 15:44:26');
INSERT INTO `admin_log` VALUES ('2654', '1', 'asignacion-materias', '404.php', null, '2', 'Vinculo no valido !!!', '2021-02-12 15:44:36');
INSERT INTO `admin_log` VALUES ('2655', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:46:06');
INSERT INTO `admin_log` VALUES ('2656', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:46:13');
INSERT INTO `admin_log` VALUES ('2657', '1', 'gestion-de-acciones', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:46:20');
INSERT INTO `admin_log` VALUES ('2658', '1', 'gestion-de-acciones', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-12 15:46:33');
INSERT INTO `admin_log` VALUES ('2659', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-12 15:46:40');
INSERT INTO `admin_log` VALUES ('2660', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-12 15:46:46');
INSERT INTO `admin_log` VALUES ('2661', '1', 'permisos-por-rol', 'descarga.php', 'guardar', '1', 'EXITO', '2021-02-12 15:47:00');
INSERT INTO `admin_log` VALUES ('2662', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-12 15:47:03');
INSERT INTO `admin_log` VALUES ('2663', '1', 'permisos-por-rol', 'descarga.php', 'cargar', '1', 'EXITO', '2021-02-12 15:47:08');
INSERT INTO `admin_log` VALUES ('2664', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:47:17');
INSERT INTO `admin_log` VALUES ('2665', '1', 'asignacion-materias', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-12 15:47:24');
INSERT INTO `admin_log` VALUES ('2666', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:47:39');
INSERT INTO `admin_log` VALUES ('2667', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:47:59');
INSERT INTO `admin_log` VALUES ('2668', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:48:05');
INSERT INTO `admin_log` VALUES ('2669', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:48:09');
INSERT INTO `admin_log` VALUES ('2670', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:48:12');
INSERT INTO `admin_log` VALUES ('2671', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:52:20');
INSERT INTO `admin_log` VALUES ('2672', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:52:31');
INSERT INTO `admin_log` VALUES ('2673', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:52:44');
INSERT INTO `admin_log` VALUES ('2674', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-12 15:52:45');
INSERT INTO `admin_log` VALUES ('2675', '1', 'cursos', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-12 15:52:49');
INSERT INTO `admin_log` VALUES ('2676', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-12 15:52:52');
INSERT INTO `admin_log` VALUES ('2677', '1', 'cursos', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-12 15:52:56');
INSERT INTO `admin_log` VALUES ('2678', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:53:00');
INSERT INTO `admin_log` VALUES ('2679', '1', 'materias', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-12 15:53:16');
INSERT INTO `admin_log` VALUES ('2680', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:53:22');
INSERT INTO `admin_log` VALUES ('2681', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:53:28');
INSERT INTO `admin_log` VALUES ('2682', '1', 'periodo-escolar', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:53:47');
INSERT INTO `admin_log` VALUES ('2683', '1', 'periodo-escolar', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:54:01');
INSERT INTO `admin_log` VALUES ('2684', '1', 'periodos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:54:05');
INSERT INTO `admin_log` VALUES ('2685', '1', 'vigencia', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:54:14');
INSERT INTO `admin_log` VALUES ('2686', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:54:19');
INSERT INTO `admin_log` VALUES ('2687', '1', 'gestion-menu', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-12 15:54:27');
INSERT INTO `admin_log` VALUES ('2688', '1', 'gestion-menu', 'descarga.php', 'modificar', '1', 'EXITO', '2021-02-12 15:54:32');
INSERT INTO `admin_log` VALUES ('2689', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-12 15:54:36');
INSERT INTO `admin_log` VALUES ('2690', '1', 'gestion-menu', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 13:04:58');
INSERT INTO `admin_log` VALUES ('2691', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-14 13:05:52');
INSERT INTO `admin_log` VALUES ('2692', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 13:05:53');
INSERT INTO `admin_log` VALUES ('2693', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-14 13:05:58');
INSERT INTO `admin_log` VALUES ('2694', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 13:06:00');
INSERT INTO `admin_log` VALUES ('2695', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-14 13:06:56');
INSERT INTO `admin_log` VALUES ('2696', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-14 13:08:08');
INSERT INTO `admin_log` VALUES ('2697', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-14 13:08:42');
INSERT INTO `admin_log` VALUES ('2698', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2021-02-14 13:11:32');
INSERT INTO `admin_log` VALUES ('2699', '1', 'cerrar-sesion', 'descarga.php', 'cerrarSesion', '1', 'EXITO', '2021-02-14 18:21:26');
INSERT INTO `admin_log` VALUES ('2700', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:23:09');
INSERT INTO `admin_log` VALUES ('2701', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:25:55');
INSERT INTO `admin_log` VALUES ('2702', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:26:04');
INSERT INTO `admin_log` VALUES ('2703', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:26:08');
INSERT INTO `admin_log` VALUES ('2704', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:26:19');
INSERT INTO `admin_log` VALUES ('2705', '1', 'areas', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:26:20');
INSERT INTO `admin_log` VALUES ('2706', '1', 'areas', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:26:24');
INSERT INTO `admin_log` VALUES ('2707', '1', 'areas', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:26:28');
INSERT INTO `admin_log` VALUES ('2708', '1', 'asignacion-materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:26:35');
INSERT INTO `admin_log` VALUES ('2709', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:26:47');
INSERT INTO `admin_log` VALUES ('2710', '1', 'asignacion-materias', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:26:51');
INSERT INTO `admin_log` VALUES ('2711', '1', 'asignacion-materias', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:26:58');
INSERT INTO `admin_log` VALUES ('2712', '1', 'asignacion-materias', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:27:06');
INSERT INTO `admin_log` VALUES ('2713', '1', 'asignacion-materias', 'descarga.php', 'listarPersonas', '1', 'EXITO', '2021-02-14 18:27:20');
INSERT INTO `admin_log` VALUES ('2714', '1', 'competencias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:29:35');
INSERT INTO `admin_log` VALUES ('2715', '1', 'cursos', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:36:01');
INSERT INTO `admin_log` VALUES ('2716', '1', 'cursos', 'descarga.php', 'agregar', '1', 'EXITO', '2021-02-14 18:38:07');
INSERT INTO `admin_log` VALUES ('2717', '1', 'cursos', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:38:21');
INSERT INTO `admin_log` VALUES ('2718', '1', 'gestion_docente', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:39:25');
INSERT INTO `admin_log` VALUES ('2719', '1', 'materias', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:41:03');
INSERT INTO `admin_log` VALUES ('2720', '1', 'periodo-escolar', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:41:41');
INSERT INTO `admin_log` VALUES ('2721', '1', 'usuarios', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-14 18:46:04');
INSERT INTO `admin_log` VALUES ('2722', '1', 'usuarios', 'descarga.php', 'asignar', '1', 'EXITO', '2021-02-14 18:46:30');
INSERT INTO `admin_log` VALUES ('2723', '1', 'ruta-academica-list', 'descarga.php', 'operaciones', '1', 'EXITO', '2021-02-23 13:12:28');
INSERT INTO `admin_log` VALUES ('2724', '1', 'ruta-academica-list', 'descarga.php', 'listar', '1', 'EXITO', '2021-02-23 13:12:29');
INSERT INTO `admin_log` VALUES ('2725', '1', 'ruta-academica-list', 'descarga.php', 'getData', '1', 'EXITO', '2021-02-23 13:30:06');

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
  `descripcion` varchar(300) DEFAULT NULL,
  `icono` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`menu`),
  KEY `admin_menu_fk2_idx` (`acceso`),
  KEY `admin_menu_fk3_idx` (`padre`),
  CONSTRAINT `admin_menu_fk2` FOREIGN KEY (`acceso`) REFERENCES `admin_acceso` (`codigo`),
  CONSTRAINT `admin_menu_fk3` FOREIGN KEY (`padre`) REFERENCES `admin_menu` (`menu`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', 'inicio', null, 'Inicio', 'modulos/inicio', 'ver', '-100', 'S', '3', null, '', 'ti-home menu-icon');
INSERT INTO `admin_menu` VALUES ('2', 'iniciar-sesion', null, 'Iniciar sesión', 'modulos/sesion', 'ver', '200', 'S', '2', null, '', '');
INSERT INTO `admin_menu` VALUES ('31', 'administracion', null, 'Administración', null, 'ver', '100', 'S', '7', null, '', 'ti-lock menu-icon');
INSERT INTO `admin_menu` VALUES ('32', 'roles', 'administracion', 'Roles', 'modulos/admin/roles', 'ver', '1', 'S', '7', null, '', '');
INSERT INTO `admin_menu` VALUES ('33', 'permisos-por-rol', 'administracion', 'Permisos por rol', 'modulos/admin/permisos_rol', 'ver', '1', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('35', 'slider', 'administracion', 'Slider (imagenes)', 'modulos/admin/slider', 'ver', '1', 'S', '8', null, '', null);
INSERT INTO `admin_menu` VALUES ('36', 'cambiar-clave', null, 'Cambiar clave', 'modulos/admin/cambiar_clave', 'ver', '999', 'S', '4', null, '', null);
INSERT INTO `admin_menu` VALUES ('45', 'cerrar-sesion', null, 'Cerrar sesión', 'modulos/sesion', 'cerrarSesion', '1000', 'N', '3', null, '', null);
INSERT INTO `admin_menu` VALUES ('300', 'asistente', null, 'Asistente', null, 'ver', '99', 'S', '7', null, '', 'ti-pencil-alt menu-icon');
INSERT INTO `admin_menu` VALUES ('301', 'crear-formulario-crud', 'asistente', 'Crear formulario (CRUD)', 'modulos/asistente/formulario_crud', 'ver', '1', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('302', 'crear-formulario-libre', 'asistente', 'Crear formulario libre', 'modulos/asistente/formulario_libre', 'ver', '2', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('306', 'crear-reporte', 'asistente', 'Crear reporte', 'modulos/asistente/reporte', 'ver', '3', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('330', 'usuarios', 'administracion', 'Usuarios', 'modulos/admin/usuarios', 'ver', '1', 'S', '7', null, '', '');
INSERT INTO `admin_menu` VALUES ('331', 'gestion-de-acciones', 'asistente', 'Gestión de acciones', 'modulos/asistente/gestion_acciones', 'ver', '5', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('344', 'gestion-menu', 'asistente', 'Gestión de Menú', 'modulos/asistente/gestion_menu', 'ver', '1', 'S', '7', null, '', null);
INSERT INTO `admin_menu` VALUES ('391', 'perfil', null, 'Perfil', 'modulos/perfil_usuario', 'ver', '2', 'N', '3', null, '', null);
INSERT INTO `admin_menu` VALUES ('437', 'buscar', null, 'Buscar', 'modulos/buscar', 'ver', '2', 'N', '3', null, '', null);
INSERT INTO `admin_menu` VALUES ('448', 'usabilidad-sistema', 'administracion', 'Usabilidad Del Sistema', 'modulos/administracion/usabilidad_sistema', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('449', 'editor-codigos', 'asistente', 'Editor De Códigos', 'modulos/asistente/editor_codigos', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('450', 'ejemplos-codigos', 'asistente', 'Ejemplos', null, null, '12', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('451', 'ejemplos-alerts', 'ejemplos-codigos', 'Alerts', 'modulos/asistente/ejemplos_codigos/alerts', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('452', 'ejemplos-accordion', 'ejemplos-codigos', 'Accordion', 'modulos/asistente/ejemplos_codigos/accordion', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('453', 'ejemplos-buttons', 'ejemplos-codigos', 'Buttons', 'modulos/asistente/ejemplos_codigos/buttons', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('454', 'ejemplos-dropdown', 'ejemplos-codigos', 'Dropdown', 'modulos/asistente/ejemplos_codigos/dropdown', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('455', 'ejemplos-modal', 'ejemplos-codigos', 'Modal', 'modulos/asistente/ejemplos_codigos/modal', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('456', 'ejemplos-tab', 'ejemplos-codigos', 'Tab', 'modulos/asistente/ejemplos_codigos/tab', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('457', 'ejemplos-popovers', 'ejemplos-codigos', 'Popovers', 'modulos/asistente/ejemplos_codigos/popovers', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('458', 'ejemplos-tooltip', 'ejemplos-codigos', 'Tooltip', 'modulos/asistente/ejemplos_codigos/tooltip', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('459', 'ejemplos-tablas', 'ejemplos-codigos', 'Tablas', 'modulos/asistente/ejemplos_codigos/tablas', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('460', 'ejemplos-datatables', 'ejemplos-codigos', 'DataTables', 'modulos/asistente/ejemplos_codigos/datatables', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('462', 'ejemplos-tablas-responsivas', 'ejemplos-codigos', 'Tablas Responsivas', 'modulos/asistente/ejemplos_codigos/tablas_responsivas', 'ver', '1', 'S', '7', null, null, null);
INSERT INTO `admin_menu` VALUES ('471', 'gestion_docente', 'administracion', 'Gestión docentes', 'modulos/administracion/gestion_docente', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('480', 'ruta-academica', 'gestion-academica', 'Ruta academica', 'modulos/administracion/ruta_academica', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('481', 'gestion-curricular', 'gestion-academica', 'Gestion curricular', 'modulos/administracion/gestion_curricular', 'ver', '2', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('482', 'gestion-academica', null, 'Gestion Academica', null, 'ver', '99', 'S', '7', null, null, 'ti-pencil-alt menu-icon');
INSERT INTO `admin_menu` VALUES ('487', 'ruta-academica-list', 'gestion-academica', 'Operaciones', 'modulos/gestion-academica/list', 'ver', '1', 'N', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('488', 'areas', 'administracion', 'Areas', 'modulos/administracion/areas', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('490', 'competencias', 'administracion', 'Competencias', 'modulos/administracion/competencias', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('491', 'cursos', 'administracion', 'Cursos', 'modulos/administracion/cursos', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('492', 'materias', 'administracion', 'Materias', 'modulos/administracion/materias', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('493', 'periodos', 'administracion', 'Periodos', 'modulos/administracion/periodos', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('494', 'periodo-escolar', 'administracion', 'Periodo escolar', 'modulos/administracion/periodo_escolar', 'ver', '1', 'S', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('495', 'vigencia', 'administracion', 'Vigencia', 'modulos/administracion/vigencia', 'ver', '1', 'N', '7', null, 'Permite...', null);
INSERT INTO `admin_menu` VALUES ('496', 'asignacion-materias', 'administracion', 'Asignacion materias', 'modulos/administracion/asignacion_materias', 'ver', '1', 'S', '7', null, 'Permite...', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=43987 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_permiso_accion
-- ----------------------------
INSERT INTO `admin_permiso_accion` VALUES ('43420', '5', '1910');
INSERT INTO `admin_permiso_accion` VALUES ('43421', '5', '1912');
INSERT INTO `admin_permiso_accion` VALUES ('43422', '5', '1911');
INSERT INTO `admin_permiso_accion` VALUES ('43423', '5', '1915');
INSERT INTO `admin_permiso_accion` VALUES ('43424', '5', '4211');
INSERT INTO `admin_permiso_accion` VALUES ('43425', '5', '4210');
INSERT INTO `admin_permiso_accion` VALUES ('43426', '5', '4212');
INSERT INTO `admin_permiso_accion` VALUES ('43427', '5', '4209');
INSERT INTO `admin_permiso_accion` VALUES ('43428', '5', '1640');
INSERT INTO `admin_permiso_accion` VALUES ('43429', '5', '1642');
INSERT INTO `admin_permiso_accion` VALUES ('43430', '5', '1864');
INSERT INTO `admin_permiso_accion` VALUES ('43431', '5', '1863');
INSERT INTO `admin_permiso_accion` VALUES ('43432', '5', '1867');
INSERT INTO `admin_permiso_accion` VALUES ('43433', '5', '4215');
INSERT INTO `admin_permiso_accion` VALUES ('43434', '5', '4214');
INSERT INTO `admin_permiso_accion` VALUES ('43435', '5', '4217');
INSERT INTO `admin_permiso_accion` VALUES ('43436', '5', '4216');
INSERT INTO `admin_permiso_accion` VALUES ('43437', '5', '4219');
INSERT INTO `admin_permiso_accion` VALUES ('43438', '5', '4218');
INSERT INTO `admin_permiso_accion` VALUES ('43439', '5', '4221');
INSERT INTO `admin_permiso_accion` VALUES ('43440', '5', '4220');
INSERT INTO `admin_permiso_accion` VALUES ('43441', '5', '4223');
INSERT INTO `admin_permiso_accion` VALUES ('43442', '5', '4222');
INSERT INTO `admin_permiso_accion` VALUES ('43443', '5', '4225');
INSERT INTO `admin_permiso_accion` VALUES ('43444', '5', '4224');
INSERT INTO `admin_permiso_accion` VALUES ('43445', '5', '4227');
INSERT INTO `admin_permiso_accion` VALUES ('43446', '5', '4226');
INSERT INTO `admin_permiso_accion` VALUES ('43447', '5', '4229');
INSERT INTO `admin_permiso_accion` VALUES ('43448', '5', '4228');
INSERT INTO `admin_permiso_accion` VALUES ('43449', '5', '4231');
INSERT INTO `admin_permiso_accion` VALUES ('43450', '5', '4230');
INSERT INTO `admin_permiso_accion` VALUES ('43451', '5', '4233');
INSERT INTO `admin_permiso_accion` VALUES ('43452', '5', '4232');
INSERT INTO `admin_permiso_accion` VALUES ('43453', '5', '4237');
INSERT INTO `admin_permiso_accion` VALUES ('43454', '5', '4236');
INSERT INTO `admin_permiso_accion` VALUES ('43455', '5', '4331');
INSERT INTO `admin_permiso_accion` VALUES ('43456', '5', '4333');
INSERT INTO `admin_permiso_accion` VALUES ('43457', '5', '4332');
INSERT INTO `admin_permiso_accion` VALUES ('43458', '5', '4336');
INSERT INTO `admin_permiso_accion` VALUES ('43459', '5', '4355');
INSERT INTO `admin_permiso_accion` VALUES ('43460', '5', '4358');
INSERT INTO `admin_permiso_accion` VALUES ('43461', '5', '4357');
INSERT INTO `admin_permiso_accion` VALUES ('43462', '5', '4354');
INSERT INTO `admin_permiso_accion` VALUES ('43463', '5', '4339');
INSERT INTO `admin_permiso_accion` VALUES ('43464', '5', '4341');
INSERT INTO `admin_permiso_accion` VALUES ('43465', '5', '4340');
INSERT INTO `admin_permiso_accion` VALUES ('43466', '5', '4344');
INSERT INTO `admin_permiso_accion` VALUES ('43467', '5', '1133');
INSERT INTO `admin_permiso_accion` VALUES ('43468', '5', '1135');
INSERT INTO `admin_permiso_accion` VALUES ('43469', '5', '1137');
INSERT INTO `admin_permiso_accion` VALUES ('43470', '5', '1139');
INSERT INTO `admin_permiso_accion` VALUES ('43471', '5', '1140');
INSERT INTO `admin_permiso_accion` VALUES ('43472', '5', '1855');
INSERT INTO `admin_permiso_accion` VALUES ('43473', '5', '1857');
INSERT INTO `admin_permiso_accion` VALUES ('43474', '5', '1856');
INSERT INTO `admin_permiso_accion` VALUES ('43475', '5', '1860');
INSERT INTO `admin_permiso_accion` VALUES ('43476', '5', '4207');
INSERT INTO `admin_permiso_accion` VALUES ('43477', '5', '4206');
INSERT INTO `admin_permiso_accion` VALUES ('43478', '5', '4208');
INSERT INTO `admin_permiso_accion` VALUES ('43497', '5', '4282');
INSERT INTO `admin_permiso_accion` VALUES ('43498', '5', '4284');
INSERT INTO `admin_permiso_accion` VALUES ('43499', '5', '4283');
INSERT INTO `admin_permiso_accion` VALUES ('43500', '5', '4287');
INSERT INTO `admin_permiso_accion` VALUES ('43517', '1', '4331');
INSERT INTO `admin_permiso_accion` VALUES ('43518', '1', '4333');
INSERT INTO `admin_permiso_accion` VALUES ('43519', '1', '4332');
INSERT INTO `admin_permiso_accion` VALUES ('43520', '1', '4336');
INSERT INTO `admin_permiso_accion` VALUES ('43521', '1', '4355');
INSERT INTO `admin_permiso_accion` VALUES ('43522', '1', '4359');
INSERT INTO `admin_permiso_accion` VALUES ('43523', '1', '4358');
INSERT INTO `admin_permiso_accion` VALUES ('43524', '1', '4357');
INSERT INTO `admin_permiso_accion` VALUES ('43525', '1', '4354');
INSERT INTO `admin_permiso_accion` VALUES ('43526', '1', '4339');
INSERT INTO `admin_permiso_accion` VALUES ('43527', '1', '4341');
INSERT INTO `admin_permiso_accion` VALUES ('43528', '1', '4340');
INSERT INTO `admin_permiso_accion` VALUES ('43529', '1', '4344');
INSERT INTO `admin_permiso_accion` VALUES ('43548', '1', '4282');
INSERT INTO `admin_permiso_accion` VALUES ('43549', '1', '4284');
INSERT INTO `admin_permiso_accion` VALUES ('43550', '1', '4283');
INSERT INTO `admin_permiso_accion` VALUES ('43551', '1', '4287');
INSERT INTO `admin_permiso_accion` VALUES ('43666', '1', '4360');
INSERT INTO `admin_permiso_accion` VALUES ('43667', '1', '4361');
INSERT INTO `admin_permiso_accion` VALUES ('43668', '1', '4362');
INSERT INTO `admin_permiso_accion` VALUES ('43669', '1', '4363');
INSERT INTO `admin_permiso_accion` VALUES ('43670', '1', '4364');
INSERT INTO `admin_permiso_accion` VALUES ('43671', '1', '4365');
INSERT INTO `admin_permiso_accion` VALUES ('43694', '1', '4372');
INSERT INTO `admin_permiso_accion` VALUES ('43695', '1', '4373');
INSERT INTO `admin_permiso_accion` VALUES ('43696', '1', '4374');
INSERT INTO `admin_permiso_accion` VALUES ('43697', '1', '4375');
INSERT INTO `admin_permiso_accion` VALUES ('43698', '1', '4376');
INSERT INTO `admin_permiso_accion` VALUES ('43699', '1', '4377');
INSERT INTO `admin_permiso_accion` VALUES ('43708', '1', '4378');
INSERT INTO `admin_permiso_accion` VALUES ('43709', '1', '4379');
INSERT INTO `admin_permiso_accion` VALUES ('43710', '1', '4380');
INSERT INTO `admin_permiso_accion` VALUES ('43711', '1', '4381');
INSERT INTO `admin_permiso_accion` VALUES ('43712', '1', '4382');
INSERT INTO `admin_permiso_accion` VALUES ('43713', '1', '4383');
INSERT INTO `admin_permiso_accion` VALUES ('43722', '1', '4384');
INSERT INTO `admin_permiso_accion` VALUES ('43723', '1', '4385');
INSERT INTO `admin_permiso_accion` VALUES ('43724', '1', '4386');
INSERT INTO `admin_permiso_accion` VALUES ('43725', '1', '4387');
INSERT INTO `admin_permiso_accion` VALUES ('43726', '1', '4388');
INSERT INTO `admin_permiso_accion` VALUES ('43727', '1', '4389');
INSERT INTO `admin_permiso_accion` VALUES ('43736', '1', '4390');
INSERT INTO `admin_permiso_accion` VALUES ('43737', '1', '4391');
INSERT INTO `admin_permiso_accion` VALUES ('43738', '1', '4392');
INSERT INTO `admin_permiso_accion` VALUES ('43739', '1', '4393');
INSERT INTO `admin_permiso_accion` VALUES ('43740', '1', '4394');
INSERT INTO `admin_permiso_accion` VALUES ('43741', '1', '4395');
INSERT INTO `admin_permiso_accion` VALUES ('43750', '1', '4396');
INSERT INTO `admin_permiso_accion` VALUES ('43751', '1', '4397');
INSERT INTO `admin_permiso_accion` VALUES ('43752', '1', '4398');
INSERT INTO `admin_permiso_accion` VALUES ('43753', '1', '4399');
INSERT INTO `admin_permiso_accion` VALUES ('43754', '1', '4400');
INSERT INTO `admin_permiso_accion` VALUES ('43755', '1', '4401');
INSERT INTO `admin_permiso_accion` VALUES ('43764', '1', '4402');
INSERT INTO `admin_permiso_accion` VALUES ('43765', '1', '4403');
INSERT INTO `admin_permiso_accion` VALUES ('43766', '1', '4404');
INSERT INTO `admin_permiso_accion` VALUES ('43767', '1', '4405');
INSERT INTO `admin_permiso_accion` VALUES ('43768', '1', '4406');
INSERT INTO `admin_permiso_accion` VALUES ('43769', '1', '4407');
INSERT INTO `admin_permiso_accion` VALUES ('43778', '1', '4408');
INSERT INTO `admin_permiso_accion` VALUES ('43779', '1', '4409');
INSERT INTO `admin_permiso_accion` VALUES ('43780', '1', '4410');
INSERT INTO `admin_permiso_accion` VALUES ('43781', '1', '4411');
INSERT INTO `admin_permiso_accion` VALUES ('43782', '1', '4412');
INSERT INTO `admin_permiso_accion` VALUES ('43783', '1', '4413');
INSERT INTO `admin_permiso_accion` VALUES ('43889', '4', '1910');
INSERT INTO `admin_permiso_accion` VALUES ('43890', '4', '1912');
INSERT INTO `admin_permiso_accion` VALUES ('43891', '4', '1911');
INSERT INTO `admin_permiso_accion` VALUES ('43892', '4', '1915');
INSERT INTO `admin_permiso_accion` VALUES ('43893', '4', '4211');
INSERT INTO `admin_permiso_accion` VALUES ('43894', '4', '4210');
INSERT INTO `admin_permiso_accion` VALUES ('43895', '4', '4212');
INSERT INTO `admin_permiso_accion` VALUES ('43896', '4', '4209');
INSERT INTO `admin_permiso_accion` VALUES ('43897', '4', '1640');
INSERT INTO `admin_permiso_accion` VALUES ('43898', '4', '1642');
INSERT INTO `admin_permiso_accion` VALUES ('43899', '4', '1864');
INSERT INTO `admin_permiso_accion` VALUES ('43900', '4', '1863');
INSERT INTO `admin_permiso_accion` VALUES ('43901', '4', '1867');
INSERT INTO `admin_permiso_accion` VALUES ('43902', '4', '4215');
INSERT INTO `admin_permiso_accion` VALUES ('43903', '4', '4214');
INSERT INTO `admin_permiso_accion` VALUES ('43904', '4', '4217');
INSERT INTO `admin_permiso_accion` VALUES ('43905', '4', '4216');
INSERT INTO `admin_permiso_accion` VALUES ('43906', '4', '4219');
INSERT INTO `admin_permiso_accion` VALUES ('43907', '4', '4218');
INSERT INTO `admin_permiso_accion` VALUES ('43908', '4', '4221');
INSERT INTO `admin_permiso_accion` VALUES ('43909', '4', '4220');
INSERT INTO `admin_permiso_accion` VALUES ('43910', '4', '4223');
INSERT INTO `admin_permiso_accion` VALUES ('43911', '4', '4222');
INSERT INTO `admin_permiso_accion` VALUES ('43912', '4', '4225');
INSERT INTO `admin_permiso_accion` VALUES ('43913', '4', '4224');
INSERT INTO `admin_permiso_accion` VALUES ('43914', '4', '4227');
INSERT INTO `admin_permiso_accion` VALUES ('43915', '4', '4226');
INSERT INTO `admin_permiso_accion` VALUES ('43916', '4', '4229');
INSERT INTO `admin_permiso_accion` VALUES ('43917', '4', '4228');
INSERT INTO `admin_permiso_accion` VALUES ('43918', '4', '4231');
INSERT INTO `admin_permiso_accion` VALUES ('43919', '4', '4230');
INSERT INTO `admin_permiso_accion` VALUES ('43920', '4', '4233');
INSERT INTO `admin_permiso_accion` VALUES ('43921', '4', '4232');
INSERT INTO `admin_permiso_accion` VALUES ('43922', '4', '4237');
INSERT INTO `admin_permiso_accion` VALUES ('43923', '4', '4236');
INSERT INTO `admin_permiso_accion` VALUES ('43924', '4', '4331');
INSERT INTO `admin_permiso_accion` VALUES ('43925', '4', '4333');
INSERT INTO `admin_permiso_accion` VALUES ('43926', '4', '4332');
INSERT INTO `admin_permiso_accion` VALUES ('43927', '4', '4336');
INSERT INTO `admin_permiso_accion` VALUES ('43928', '4', '4355');
INSERT INTO `admin_permiso_accion` VALUES ('43929', '4', '4359');
INSERT INTO `admin_permiso_accion` VALUES ('43930', '4', '4358');
INSERT INTO `admin_permiso_accion` VALUES ('43931', '4', '4357');
INSERT INTO `admin_permiso_accion` VALUES ('43932', '4', '4354');
INSERT INTO `admin_permiso_accion` VALUES ('43933', '4', '4339');
INSERT INTO `admin_permiso_accion` VALUES ('43934', '4', '4341');
INSERT INTO `admin_permiso_accion` VALUES ('43935', '4', '4340');
INSERT INTO `admin_permiso_accion` VALUES ('43936', '4', '4344');
INSERT INTO `admin_permiso_accion` VALUES ('43937', '4', '1133');
INSERT INTO `admin_permiso_accion` VALUES ('43938', '4', '1135');
INSERT INTO `admin_permiso_accion` VALUES ('43939', '4', '1137');
INSERT INTO `admin_permiso_accion` VALUES ('43940', '4', '1139');
INSERT INTO `admin_permiso_accion` VALUES ('43941', '4', '1140');
INSERT INTO `admin_permiso_accion` VALUES ('43942', '4', '1855');
INSERT INTO `admin_permiso_accion` VALUES ('43943', '4', '1857');
INSERT INTO `admin_permiso_accion` VALUES ('43944', '4', '1856');
INSERT INTO `admin_permiso_accion` VALUES ('43945', '4', '1860');
INSERT INTO `admin_permiso_accion` VALUES ('43946', '4', '4207');
INSERT INTO `admin_permiso_accion` VALUES ('43947', '4', '4206');
INSERT INTO `admin_permiso_accion` VALUES ('43948', '4', '4208');
INSERT INTO `admin_permiso_accion` VALUES ('43949', '4', '4282');
INSERT INTO `admin_permiso_accion` VALUES ('43950', '4', '4284');
INSERT INTO `admin_permiso_accion` VALUES ('43951', '4', '4283');
INSERT INTO `admin_permiso_accion` VALUES ('43952', '4', '4287');
INSERT INTO `admin_permiso_accion` VALUES ('43953', '4', '4360');
INSERT INTO `admin_permiso_accion` VALUES ('43954', '4', '4362');
INSERT INTO `admin_permiso_accion` VALUES ('43955', '4', '4415');
INSERT INTO `admin_permiso_accion` VALUES ('43956', '4', '4361');
INSERT INTO `admin_permiso_accion` VALUES ('43957', '4', '4365');
INSERT INTO `admin_permiso_accion` VALUES ('43958', '4', '4372');
INSERT INTO `admin_permiso_accion` VALUES ('43959', '4', '4374');
INSERT INTO `admin_permiso_accion` VALUES ('43960', '4', '4373');
INSERT INTO `admin_permiso_accion` VALUES ('43961', '4', '4377');
INSERT INTO `admin_permiso_accion` VALUES ('43962', '4', '4378');
INSERT INTO `admin_permiso_accion` VALUES ('43963', '4', '4380');
INSERT INTO `admin_permiso_accion` VALUES ('43964', '4', '4379');
INSERT INTO `admin_permiso_accion` VALUES ('43965', '4', '4383');
INSERT INTO `admin_permiso_accion` VALUES ('43966', '4', '4384');
INSERT INTO `admin_permiso_accion` VALUES ('43967', '4', '4386');
INSERT INTO `admin_permiso_accion` VALUES ('43968', '4', '4385');
INSERT INTO `admin_permiso_accion` VALUES ('43969', '4', '4389');
INSERT INTO `admin_permiso_accion` VALUES ('43970', '4', '4390');
INSERT INTO `admin_permiso_accion` VALUES ('43971', '4', '4392');
INSERT INTO `admin_permiso_accion` VALUES ('43972', '4', '4391');
INSERT INTO `admin_permiso_accion` VALUES ('43973', '4', '4395');
INSERT INTO `admin_permiso_accion` VALUES ('43974', '4', '4396');
INSERT INTO `admin_permiso_accion` VALUES ('43975', '4', '4398');
INSERT INTO `admin_permiso_accion` VALUES ('43976', '4', '4397');
INSERT INTO `admin_permiso_accion` VALUES ('43977', '4', '4401');
INSERT INTO `admin_permiso_accion` VALUES ('43978', '4', '4402');
INSERT INTO `admin_permiso_accion` VALUES ('43979', '4', '4404');
INSERT INTO `admin_permiso_accion` VALUES ('43980', '4', '4403');
INSERT INTO `admin_permiso_accion` VALUES ('43981', '4', '4407');
INSERT INTO `admin_permiso_accion` VALUES ('43982', '4', '4408');
INSERT INTO `admin_permiso_accion` VALUES ('43983', '4', '4410');
INSERT INTO `admin_permiso_accion` VALUES ('43984', '4', '4416');
INSERT INTO `admin_permiso_accion` VALUES ('43985', '4', '4409');
INSERT INTO `admin_permiso_accion` VALUES ('43986', '4', '4413');

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
  KEY `admin_menu_rol_fk2_idx` (`menu`),
  CONSTRAINT `admin_menu_rol_fk1` FOREIGN KEY (`menu`) REFERENCES `admin_menu` (`menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_permiso_menu_fk2` FOREIGN KEY (`rol`) REFERENCES `admin_rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12211 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_permiso_menu
-- ----------------------------
INSERT INTO `admin_permiso_menu` VALUES ('12070', '1', 'administracion');
INSERT INTO `admin_permiso_menu` VALUES ('12119', '1', 'areas');
INSERT INTO `admin_permiso_menu` VALUES ('12135', '1', 'asignacion-materias');
INSERT INTO `admin_permiso_menu` VALUES ('12123', '1', 'competencias');
INSERT INTO `admin_permiso_menu` VALUES ('12125', '1', 'cursos');
INSERT INTO `admin_permiso_menu` VALUES ('12066', '1', 'gestion-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12069', '1', 'gestion-curricular');
INSERT INTO `admin_permiso_menu` VALUES ('12076', '1', 'gestion_docente');
INSERT INTO `admin_permiso_menu` VALUES ('12127', '1', 'materias');
INSERT INTO `admin_permiso_menu` VALUES ('12131', '1', 'periodo-escolar');
INSERT INTO `admin_permiso_menu` VALUES ('12129', '1', 'periodos');
INSERT INTO `admin_permiso_menu` VALUES ('12067', '1', 'ruta-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12068', '1', 'ruta-academica-list');
INSERT INTO `admin_permiso_menu` VALUES ('12133', '1', 'vigencia');
INSERT INTO `admin_permiso_menu` VALUES ('12197', '4', 'administracion');
INSERT INTO `admin_permiso_menu` VALUES ('12203', '4', 'areas');
INSERT INTO `admin_permiso_menu` VALUES ('12210', '4', 'asignacion-materias');
INSERT INTO `admin_permiso_menu` VALUES ('12174', '4', 'asistente');
INSERT INTO `admin_permiso_menu` VALUES ('12204', '4', 'competencias');
INSERT INTO `admin_permiso_menu` VALUES ('12175', '4', 'crear-formulario-crud');
INSERT INTO `admin_permiso_menu` VALUES ('12178', '4', 'crear-formulario-libre');
INSERT INTO `admin_permiso_menu` VALUES ('12179', '4', 'crear-reporte');
INSERT INTO `admin_permiso_menu` VALUES ('12205', '4', 'cursos');
INSERT INTO `admin_permiso_menu` VALUES ('12177', '4', 'editor-codigos');
INSERT INTO `admin_permiso_menu` VALUES ('12183', '4', 'ejemplos-accordion');
INSERT INTO `admin_permiso_menu` VALUES ('12182', '4', 'ejemplos-alerts');
INSERT INTO `admin_permiso_menu` VALUES ('12184', '4', 'ejemplos-buttons');
INSERT INTO `admin_permiso_menu` VALUES ('12181', '4', 'ejemplos-codigos');
INSERT INTO `admin_permiso_menu` VALUES ('12191', '4', 'ejemplos-datatables');
INSERT INTO `admin_permiso_menu` VALUES ('12185', '4', 'ejemplos-dropdown');
INSERT INTO `admin_permiso_menu` VALUES ('12186', '4', 'ejemplos-modal');
INSERT INTO `admin_permiso_menu` VALUES ('12188', '4', 'ejemplos-popovers');
INSERT INTO `admin_permiso_menu` VALUES ('12187', '4', 'ejemplos-tab');
INSERT INTO `admin_permiso_menu` VALUES ('12190', '4', 'ejemplos-tablas');
INSERT INTO `admin_permiso_menu` VALUES ('12192', '4', 'ejemplos-tablas-responsivas');
INSERT INTO `admin_permiso_menu` VALUES ('12189', '4', 'ejemplos-tooltip');
INSERT INTO `admin_permiso_menu` VALUES ('12193', '4', 'gestion-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12196', '4', 'gestion-curricular');
INSERT INTO `admin_permiso_menu` VALUES ('12180', '4', 'gestion-de-acciones');
INSERT INTO `admin_permiso_menu` VALUES ('12176', '4', 'gestion-menu');
INSERT INTO `admin_permiso_menu` VALUES ('12202', '4', 'gestion_docente');
INSERT INTO `admin_permiso_menu` VALUES ('12206', '4', 'materias');
INSERT INTO `admin_permiso_menu` VALUES ('12208', '4', 'periodo-escolar');
INSERT INTO `admin_permiso_menu` VALUES ('12207', '4', 'periodos');
INSERT INTO `admin_permiso_menu` VALUES ('12199', '4', 'permisos-por-rol');
INSERT INTO `admin_permiso_menu` VALUES ('12198', '4', 'roles');
INSERT INTO `admin_permiso_menu` VALUES ('12194', '4', 'ruta-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12195', '4', 'ruta-academica-list');
INSERT INTO `admin_permiso_menu` VALUES ('12201', '4', 'usabilidad-sistema');
INSERT INTO `admin_permiso_menu` VALUES ('12200', '4', 'usuarios');
INSERT INTO `admin_permiso_menu` VALUES ('12209', '4', 'vigencia');
INSERT INTO `admin_permiso_menu` VALUES ('12051', '5', 'administracion');
INSERT INTO `admin_permiso_menu` VALUES ('12028', '5', 'asistente');
INSERT INTO `admin_permiso_menu` VALUES ('12029', '5', 'crear-formulario-crud');
INSERT INTO `admin_permiso_menu` VALUES ('12032', '5', 'crear-formulario-libre');
INSERT INTO `admin_permiso_menu` VALUES ('12033', '5', 'crear-reporte');
INSERT INTO `admin_permiso_menu` VALUES ('12031', '5', 'editor-codigos');
INSERT INTO `admin_permiso_menu` VALUES ('12037', '5', 'ejemplos-accordion');
INSERT INTO `admin_permiso_menu` VALUES ('12036', '5', 'ejemplos-alerts');
INSERT INTO `admin_permiso_menu` VALUES ('12038', '5', 'ejemplos-buttons');
INSERT INTO `admin_permiso_menu` VALUES ('12035', '5', 'ejemplos-codigos');
INSERT INTO `admin_permiso_menu` VALUES ('12045', '5', 'ejemplos-datatables');
INSERT INTO `admin_permiso_menu` VALUES ('12039', '5', 'ejemplos-dropdown');
INSERT INTO `admin_permiso_menu` VALUES ('12040', '5', 'ejemplos-modal');
INSERT INTO `admin_permiso_menu` VALUES ('12042', '5', 'ejemplos-popovers');
INSERT INTO `admin_permiso_menu` VALUES ('12041', '5', 'ejemplos-tab');
INSERT INTO `admin_permiso_menu` VALUES ('12044', '5', 'ejemplos-tablas');
INSERT INTO `admin_permiso_menu` VALUES ('12046', '5', 'ejemplos-tablas-responsivas');
INSERT INTO `admin_permiso_menu` VALUES ('12043', '5', 'ejemplos-tooltip');
INSERT INTO `admin_permiso_menu` VALUES ('12047', '5', 'gestion-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12050', '5', 'gestion-curricular');
INSERT INTO `admin_permiso_menu` VALUES ('12034', '5', 'gestion-de-acciones');
INSERT INTO `admin_permiso_menu` VALUES ('12030', '5', 'gestion-menu');
INSERT INTO `admin_permiso_menu` VALUES ('12061', '5', 'gestion_docente');
INSERT INTO `admin_permiso_menu` VALUES ('12053', '5', 'permisos-por-rol');
INSERT INTO `admin_permiso_menu` VALUES ('12052', '5', 'roles');
INSERT INTO `admin_permiso_menu` VALUES ('12048', '5', 'ruta-academica');
INSERT INTO `admin_permiso_menu` VALUES ('12049', '5', 'ruta-academica-list');
INSERT INTO `admin_permiso_menu` VALUES ('12055', '5', 'usabilidad-sistema');
INSERT INTO `admin_permiso_menu` VALUES ('12054', '5', 'usuarios');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_psesion
-- ----------------------------
INSERT INTO `admin_psesion` VALUES ('1', '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/inicio', '::1', '2020-06-11 08:21:56', '2020-06-11 15:05:13');
INSERT INTO `admin_psesion` VALUES ('2', '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/editor-codigos', '::1', '2020-06-13 18:02:46', '2020-06-13 22:42:54');
INSERT INTO `admin_psesion` VALUES ('3', '6kr38f1qritko3u4hdr0kvkaom', '6kr38f1qritko3u4hdr0kvkaom', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/crear-formulario-crud', '::1', '2020-06-14 09:06:02', '2020-06-14 09:07:19');
INSERT INTO `admin_psesion` VALUES ('4', '3kd7veclnq3lufkq30cgfgi3du', '3kd7veclnq3lufkq30cgfgi3du', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/gestion-menu', '::1', '2020-06-16 14:56:41', '2020-06-16 22:07:47');
INSERT INTO `admin_psesion` VALUES ('5', '3kd7veclnq3lufkq30cgfgi3du', '3kd7veclnq3lufkq30cgfgi3du', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'http://localhost/LIA/usabilidad-sistema', '::1', '2020-06-17 09:34:42', '2020-06-17 12:10:51');
INSERT INTO `admin_psesion` VALUES ('6', '6uhd1msv3f2pad8ep4juud1gmh', '6uhd1msv3f2pad8ep4juud1gmh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 'http://localhost/SOCRATES/usuarios', '::1', '2020-11-16 19:48:37', '2020-11-16 19:49:09');
INSERT INTO `admin_psesion` VALUES ('7', '6uhd1msv3f2pad8ep4juud1gmh', '6uhd1msv3f2pad8ep4juud1gmh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 'http://localhost/SOCRATES/', '::1', '2020-11-19 17:21:22', '2020-11-19 17:21:22');
INSERT INTO `admin_psesion` VALUES ('8', '6uhd1msv3f2pad8ep4juud1gmh', '6uhd1msv3f2pad8ep4juud1gmh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', 'http://localhost/SOCRATES/', '::1', '2020-11-20 08:16:51', '2020-11-20 08:16:52');
INSERT INTO `admin_psesion` VALUES ('9', '6uhd1msv3f2pad8ep4juud1gmh', '6uhd1msv3f2pad8ep4juud1gmh', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/', '::1', '2020-12-16 17:53:33', '2020-12-16 17:54:24');
INSERT INTO `admin_psesion` VALUES ('10', 'arbtibaec21fsc57hhjl44m41v', 'arbtibaec21fsc57hhjl44m41v', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/importar-usuarios', '::1', '2020-12-29 21:00:34', '2020-12-29 21:13:43');
INSERT INTO `admin_psesion` VALUES ('11', 'fjvc41tu4amkbnb4s4lc949cso', 'fjvc41tu4amkbnb4s4lc949cso', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/gestion-maestros', '::1', '2020-12-30 16:26:46', '2020-12-30 23:52:01');
INSERT INTO `admin_psesion` VALUES ('12', 'fjvc41tu4amkbnb4s4lc949cso', 'fjvc41tu4amkbnb4s4lc949cso', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/gestion-menu', '::1', '2020-12-31 00:06:46', '2020-12-31 00:54:19');
INSERT INTO `admin_psesion` VALUES ('13', 'fthk6inr0crms57cjb8trj1ppf', 'fthk6inr0crms57cjb8trj1ppf', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284', 'http://socrates.edu.co/', '::1', '2021-01-02 14:20:29', '2021-01-02 14:25:27');
INSERT INTO `admin_psesion` VALUES ('14', 'lpgragpbof3ejun1hloiqkvt10', 'lpgragpbof3ejun1hloiqkvt10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/areas', '::1', '2021-01-03 00:00:13', '2021-01-03 03:07:45');
INSERT INTO `admin_psesion` VALUES ('15', '9kcqlj8mqogv2vsffq5lbqaafe', '9kcqlj8mqogv2vsffq5lbqaafe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/perfil', '::1', '2021-01-04 00:04:46', '2021-01-04 01:21:03');
INSERT INTO `admin_psesion` VALUES ('16', '3fap37dhhglcvji2nms9p18t38', '3fap37dhhglcvji2nms9p18t38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'http://localhost/SOCRATES/ruta-academica/gestion_materia', '::1', '2021-01-05 00:00:37', '2021-01-05 00:23:08');
INSERT INTO `admin_psesion` VALUES ('17', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', 'http://socrates.edu.test/ruta-academica', '::1', '2021-02-03 08:15:35', '2021-02-03 15:00:32');
INSERT INTO `admin_psesion` VALUES ('18', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/ruta-academica', '::1', '2021-02-05 13:26:55', '2021-02-05 18:33:18');
INSERT INTO `admin_psesion` VALUES ('19', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/ruta-academica-list?materia=1', '::1', '2021-02-06 15:00:23', '2021-02-06 15:00:24');
INSERT INTO `admin_psesion` VALUES ('20', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/', '::1', '2021-02-07 09:25:49', '2021-02-07 18:33:56');
INSERT INTO `admin_psesion` VALUES ('21', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/ruta-academica-list?materia=1', '::1', '2021-02-08 17:22:49', '2021-02-08 18:56:27');
INSERT INTO `admin_psesion` VALUES ('22', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/ruta-academica', '::1', '2021-02-09 09:03:30', '2021-02-09 10:11:16');
INSERT INTO `admin_psesion` VALUES ('23', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 'http://socrates.edu.test/usuarios', '::1', '2021-02-11 08:33:02', '2021-02-11 19:40:01');
INSERT INTO `admin_psesion` VALUES ('24', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'http://socrates.edu.test/ruta-academica-list?materia=5', '::1', '2021-02-12 15:19:42', '2021-02-12 15:54:36');
INSERT INTO `admin_psesion` VALUES ('25', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'http://socrates.edu.test/vigencia', '::1', '2021-02-14 13:04:55', '2021-02-14 13:11:32');
INSERT INTO `admin_psesion` VALUES ('26', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'http://socrates.edu.test/usuarios', '::1', '2021-02-15 14:14:42', '2021-02-15 14:14:52');
INSERT INTO `admin_psesion` VALUES ('27', 'nh9aelbhldhlbbdse2k8s1gbl0', 'nh9aelbhldhlbbdse2k8s1gbl0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'http://socrates.edu.test/', '::1', '2021-02-23 12:57:30', '2021-02-23 13:32:50');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_rol
-- ----------------------------
INSERT INTO `admin_rol` VALUES ('1', 'ADMINISTRADOR', '99999', '2014-06-01 13:54:29');
INSERT INTO `admin_rol` VALUES ('4', 'SUPER ADMIN', '1077461284', '2020-06-11 11:17:02');
INSERT INTO `admin_rol` VALUES ('5', 'JEFE DE AREA', '1077461284', '2020-12-28 10:47:49');
INSERT INTO `admin_rol` VALUES ('6', 'DOCENTE', '1077461284', '2021-02-09 09:24:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_sesion
-- ----------------------------
INSERT INTO `admin_sesion` VALUES ('1', '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 20:40:07', '2020-06-06 20:40:07', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('2', '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 21:16:09', '2020-06-06 21:16:09', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('3', '1077461284', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/HEAVEN5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '2020-06-06 21:47:35', '2020-06-06 21:47:35', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('4', '1077461284', '7fonttq2jf6e898ve7rntv3rt2', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 10:23:02', '2020-06-09 10:23:02', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('5', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/lia/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 14:31:22', '2020-06-09 14:31:22', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('6', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-09 14:32:17', '2020-06-09 14:32:17', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('7', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 10:18:37', '2020-06-10 10:18:37', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('8', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 11:29:30', '2020-06-10 11:29:30', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('9', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 21:56:29', '2020-06-10 21:56:29', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('10', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-10 22:30:03', '2020-06-10 22:30:03', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('11', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/inicio', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 08:21:56', '2020-06-11 08:21:56', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('12', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 15:05:52', '2020-06-11 15:05:52', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('13', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 19:06:43', '2020-06-11 19:06:43', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('14', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 21:07:31', '2020-06-11 21:07:31', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('15', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-11 21:08:53', '2020-06-11 21:08:53', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('16', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-12 20:15:25', '2020-06-12 20:15:25', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('17', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/editor-codigos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-13 18:02:46', '2020-06-13 18:02:46', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('18', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/crear-formulario-crud', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 09:06:01', '2020-06-14 09:06:01', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('19', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 19:56:45', '2020-06-14 19:56:45', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('20', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 20:28:56', '2020-06-14 20:28:56', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('21', '1077461284', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-14 20:29:20', '2020-06-14 20:29:20', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('22', '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-15 20:53:00', '2020-06-15 20:53:00', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('23', '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/gestion-menu', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-16 14:56:40', '2020-06-16 14:56:40', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('24', '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/usabilidad-sistema', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-17 09:34:42', '2020-06-17 09:34:42', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('25', '1077461284', '3kd7veclnq3lufkq30cgfgi3du', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '2020-06-17 17:44:06', '2020-06-17 17:44:06', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('26', '1077461284', 'vsk7ldah5ho4re5hk014t8bplr', 'http://localhost/lia2/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '::1', '2020-08-19 19:00:05', '2020-08-19 19:00:05', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('27', '1077461284', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '2020-11-14 13:40:54', '2020-11-14 13:40:54', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('28', '1077461284', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '2020-11-14 13:58:57', '2020-11-14 13:58:57', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('29', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '::1', '2020-11-14 18:06:51', '2020-11-14 18:06:51', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('30', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/usuarios', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '::1', '2020-11-16 19:48:37', '2020-11-16 19:48:37', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('31', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '::1', '2020-11-16 20:03:15', '2020-11-16 20:03:15', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('32', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '::1', '2020-11-19 17:21:22', '2020-11-19 17:21:22', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('33', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '::1', '2020-11-20 08:16:51', '2020-11-20 08:16:51', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('34', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-16 17:53:33', '2020-12-16 17:53:33', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('35', '1077461284', '6uhd1msv3f2pad8ep4juud1gmh', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-16 17:59:41', '2020-12-16 17:59:41', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('36', '1077461284', 'fthk6inr0crms57cjb8trj1ppf', 'http://socrates.edu.co/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284', '::1', '2020-12-28 08:36:24', '2020-12-28 08:36:24', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('37', '1077461284', '6achds8q6a363c3sfadiqg9agi', 'http://localhost/SOCRATES/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-28 12:00:19', '2020-12-28 12:00:19', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('38', '1077461284', 'ivnc4v4c28d75b68rnc64vi92a', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-28 18:20:01', '2020-12-28 18:20:01', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('39', '1077461284', 'arbtibaec21fsc57hhjl44m41v', 'http://localhost/SOCRATES/importar-usuarios', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-29 21:00:34', '2020-12-29 21:00:34', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('40', '1077461284', 'fjvc41tu4amkbnb4s4lc949cso', 'http://localhost/SOCRATES/gestion-maestros', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-30 16:26:46', '2020-12-30 16:26:46', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('41', '1077461284', 'fjvc41tu4amkbnb4s4lc949cso', 'http://localhost/SOCRATES/gestion-menu', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-31 00:06:46', '2020-12-31 00:06:46', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('42', '1077461284', '92svkvhel8vo1e1pvsk3nil67s', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-31 12:05:54', '2020-12-31 12:05:54', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('43', '1077461284', 'tdbtehpl5uc67b8isqlk2tu35m', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2020-12-31 19:11:54', '2020-12-31 19:11:54', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('44', '1077461284', 'fthk6inr0crms57cjb8trj1ppf', 'http://socrates.edu.co/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284', '::1', '2021-01-02 14:20:29', '2021-01-02 14:20:29', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('45', '1077461284', 'lpgragpbof3ejun1hloiqkvt10', 'http://localhost/SOCRATES/areas', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-03 00:00:13', '2021-01-03 00:00:13', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('46', '1077461284', '9kcqlj8mqogv2vsffq5lbqaafe', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-03 13:32:00', '2021-01-03 13:32:00', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('47', '1077461284', '9kcqlj8mqogv2vsffq5lbqaafe', 'http://localhost/SOCRATES/perfil', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-04 00:04:46', '2021-01-04 00:04:46', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('48', '1077461284', '3fap37dhhglcvji2nms9p18t38', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-04 14:41:29', '2021-01-04 14:41:29', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('49', '1077461284', '3fap37dhhglcvji2nms9p18t38', 'http://localhost/SOCRATES/ruta-academica/gestion_materia', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-05 00:00:37', '2021-01-05 00:00:37', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('50', '1077461284', '8tigvbofroofr1arit0nhflf7l', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '2021-01-05 10:58:11', '2021-01-05 10:58:11', 'N', '4');
INSERT INTO `admin_sesion` VALUES ('51', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', '::1', '2021-02-02 13:46:19', '2021-02-02 13:46:19', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('52', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', '::1', '2021-02-02 20:22:52', '2021-02-02 20:22:52', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('53', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', '::1', '2021-02-03 08:15:35', '2021-02-03 08:15:35', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('54', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-05 13:26:55', '2021-02-05 13:26:55', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('55', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica-list?materia=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-06 15:00:23', '2021-02-06 15:00:23', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('56', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-07 09:25:49', '2021-02-07 09:25:49', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('57', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica-list?materia=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-08 17:22:49', '2021-02-08 17:22:49', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('58', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-09 09:03:30', '2021-02-09 09:03:30', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('59', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/usuarios', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '::1', '2021-02-11 08:33:02', '2021-02-11 08:33:02', 'N', '3');
INSERT INTO `admin_sesion` VALUES ('60', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/ruta-academica-list?materia=5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '::1', '2021-02-12 15:19:42', '2021-02-12 15:19:42', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('61', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/vigencia', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '::1', '2021-02-14 13:04:55', '2021-02-14 13:04:55', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('62', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '::1', '2021-02-14 18:18:58', '2021-02-14 18:18:58', 'N', '5');
INSERT INTO `admin_sesion` VALUES ('63', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '::1', '2021-02-14 18:22:12', '2021-02-14 18:22:12', 'N', '2');
INSERT INTO `admin_sesion` VALUES ('64', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/usuarios', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '::1', '2021-02-15 14:14:42', '2021-02-15 14:14:42', 'N', '1');
INSERT INTO `admin_sesion` VALUES ('65', '1077461284', 'nh9aelbhldhlbbdse2k8s1gbl0', 'http://socrates.edu.test/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '::1', '2021-02-23 12:57:30', '2021-02-23 12:57:30', 'N', '3');

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
  KEY `admin_sesion_denegada_fk1_idx` (`tipo`),
  CONSTRAINT `admin_sesion_denegada_fk1` FOREIGN KEY (`tipo`) REFERENCES `admin_tipo_denegacion` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_sesion_denegada
-- ----------------------------
INSERT INTO `admin_sesion_denegada` VALUES ('1', 'dad', '2020-06-06 16:39:34', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/?usuario=dad&clave=d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('2', 'dad', '2020-06-06 20:29:55', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('3', 'dad', '2020-06-06 20:30:06', 'ob7au592jj6n1gsu0e4ofnvg8l', 'http://localhost/heaven5/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('4', 'ada', '2020-06-09 14:28:42', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/lia/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('5', 'DAD', '2020-06-09 14:31:32', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('6', 'dad', '2020-06-09 14:31:53', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('7', '1077416284', '2020-06-11 21:07:18', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('8', '1077416284', '2020-06-12 20:15:14', '6kr38f1qritko3u4hdr0kvkaom', 'http://localhost/LIA/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', '::1', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('9', 'ada', '2020-11-14 13:24:16', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('10', 'dad', '2020-11-14 13:36:02', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('11', 'dad', '2020-11-14 13:36:06', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('12', 'dad', '2020-11-14 13:36:27', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('13', 'dad', '2020-11-14 13:36:32', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('14', 'dad', '2020-11-14 13:38:19', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('15', 'dad', '2020-11-14 13:38:32', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '4');
INSERT INTO `admin_sesion_denegada` VALUES ('16', 'FGARCIA', '2020-11-14 13:40:10', 'j232va6tni8lhoqk0dr313o73p', 'http://localhost/socrates/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '::1', '1');
INSERT INTO `admin_sesion_denegada` VALUES ('17', 'DEINERMW', '2020-12-28 18:19:41', 'ivnc4v4c28d75b68rnc64vi92a', 'http://localhost/SOCRATES/iniciar-sesion', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '::1', '1');

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
  `_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`persona_id`),
  KEY `admin_usuario_fk1_idx` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_usuario
-- ----------------------------
INSERT INTO `admin_usuario` VALUES ('1', '4', '1077461284', '2017-01-14 16:06:13');
INSERT INTO `admin_usuario` VALUES ('825', '5', '1077461284', '2021-02-12 15:24:04');

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES ('2', 'Matematicas de 6to', '1');
INSERT INTO `areas` VALUES ('13', 'Ciencias Naturales', '825');

-- ----------------------------
-- Table structure for asignacion_materias
-- ----------------------------
DROP TABLE IF EXISTS `asignacion_materias`;
CREATE TABLE `asignacion_materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materia` (`id_materia`),
  KEY `id_periodo` (`id_periodo`),
  KEY `persona_asignacionmaterias` (`id_persona`),
  CONSTRAINT `fk_materia` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asignacion_materias
-- ----------------------------
INSERT INTO `asignacion_materias` VALUES ('7', '1', '5', '1');

-- ----------------------------
-- Table structure for competencias
-- ----------------------------
DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of competencias
-- ----------------------------
INSERT INTO `competencias` VALUES ('1', 'kjlkl');
INSERT INTO `competencias` VALUES ('2', 'lmhf');
INSERT INTO `competencias` VALUES ('3', 'jjjhhhhhhhhggggggggggggggggggggggggggggggggggggggg');

-- ----------------------------
-- Table structure for cursos
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cursos
-- ----------------------------
INSERT INTO `cursos` VALUES ('1', '6');
INSERT INTO `cursos` VALUES ('2', '7');
INSERT INTO `cursos` VALUES ('3', '101');

-- ----------------------------
-- Table structure for gestion_curricular
-- ----------------------------
DROP TABLE IF EXISTS `gestion_curricular`;
CREATE TABLE `gestion_curricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `observacion` varchar(50) NOT NULL,
  `id_planeacion_curricular` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_planeacion_curricular` (`id_planeacion_curricular`),
  CONSTRAINT `fk_planeacion_curricular` FOREIGN KEY (`id_planeacion_curricular`) REFERENCES `planeacion_curricular` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gestion_curricular
-- ----------------------------

-- ----------------------------
-- Table structure for log_ruta_academica
-- ----------------------------
DROP TABLE IF EXISTS `log_ruta_academica`;
CREATE TABLE `log_ruta_academica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temas` text NOT NULL,
  `id_master_ruta_academica` int(11) NOT NULL,
  `id_periodo_escolar` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_master_ruta_academica` (`id_master_ruta_academica`,`id_periodo_escolar`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of log_ruta_academica
-- ----------------------------
INSERT INTO `log_ruta_academica` VALUES ('13', '<p>test</p>', '5', '1', '2021-02-07 06:47:58');
INSERT INTO `log_ruta_academica` VALUES ('14', '<p>test 1</p>', '5', '1', '2021-02-07 06:48:11');
INSERT INTO `log_ruta_academica` VALUES ('15', '<p>test1</p>', '5', '1', '2021-02-07 13:33:52');
INSERT INTO `log_ruta_academica` VALUES ('16', '<p>Suma de fraccionarios</p>', '5', '1', '2021-02-08 13:48:17');
INSERT INTO `log_ruta_academica` VALUES ('17', '<p>Logaritmos</p>\\n\\n<p>Raiz cuadrada</p>\\n\\n<p>Suma de enteros y decimales</p>', '5', '3', '2021-02-08 13:50:54');

-- ----------------------------
-- Table structure for master_ruta_academica
-- ----------------------------
DROP TABLE IF EXISTS `master_ruta_academica`;
CREATE TABLE `master_ruta_academica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_asignacion_materia` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `fechar` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_ruta_academica
-- ----------------------------
INSERT INTO `master_ruta_academica` VALUES ('6', '7', '1', '', '2021-02-09 09:33:45');

-- ----------------------------
-- Table structure for materias
-- ----------------------------
DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `areas` int(11) NOT NULL,
  `curso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areas` (`areas`),
  KEY `curso` (`curso`),
  CONSTRAINT `fk_area` FOREIGN KEY (`areas`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_curso` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of materias
-- ----------------------------
INSERT INTO `materias` VALUES ('5', 'Aritmetica', '2', '1');
INSERT INTO `materias` VALUES ('6', 'Biologia', '13', '1');

-- ----------------------------
-- Table structure for periodos
-- ----------------------------
DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodos
-- ----------------------------
INSERT INTO `periodos` VALUES ('1', '2021');
INSERT INTO `periodos` VALUES ('2', '2022');

-- ----------------------------
-- Table structure for periodo_escolar
-- ----------------------------
DROP TABLE IF EXISTS `periodo_escolar`;
CREATE TABLE `periodo_escolar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodo_escolar
-- ----------------------------
INSERT INTO `periodo_escolar` VALUES ('1', 'Primer Periodo');
INSERT INTO `periodo_escolar` VALUES ('2', 'Segundo Periodo');
INSERT INTO `periodo_escolar` VALUES ('3', 'Tercer Periodo');
INSERT INTO `periodo_escolar` VALUES ('4', 'Cuarto Periodo');

-- ----------------------------
-- Table structure for planeacion_curricular
-- ----------------------------
DROP TABLE IF EXISTS `planeacion_curricular`;
CREATE TABLE `planeacion_curricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ruta_academica` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ruta_academica` (`id_ruta_academica`),
  CONSTRAINT `fk_ruta_academica` FOREIGN KEY (`id_ruta_academica`) REFERENCES `ruta_academica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planeacion_curricular
-- ----------------------------

-- ----------------------------
-- Table structure for planeacion_curricular_competencias
-- ----------------------------
DROP TABLE IF EXISTS `planeacion_curricular_competencias`;
CREATE TABLE `planeacion_curricular_competencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `id_competencia` int(11) NOT NULL,
  `id_planeacion_curricular` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_competencia` (`id_competencia`,`id_planeacion_curricular`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planeacion_curricular_competencias
-- ----------------------------

-- ----------------------------
-- Table structure for planeación_curricular_competencias_logros
-- ----------------------------
DROP TABLE IF EXISTS `planeación_curricular_competencias_logros`;
CREATE TABLE `planeación_curricular_competencias_logros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `id_planeacion_curicular_competencia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of planeación_curricular_competencias_logros
-- ----------------------------

-- ----------------------------
-- Table structure for ruta_academica
-- ----------------------------
DROP TABLE IF EXISTS `ruta_academica`;
CREATE TABLE `ruta_academica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temas` text NOT NULL,
  `id_master_ruta_academica` int(11) NOT NULL,
  `id_periodo_escolar` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master_ruta_academica` (`id_master_ruta_academica`,`id_periodo_escolar`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ruta_academica
-- ----------------------------
INSERT INTO `ruta_academica` VALUES ('29', '<p>hghjhgjhg</p>', '6', '1');

-- ----------------------------
-- Table structure for si_no
-- ----------------------------
DROP TABLE IF EXISTS `si_no`;
CREATE TABLE `si_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of si_no
-- ----------------------------
INSERT INTO `si_no` VALUES ('1', 'SI');
INSERT INTO `si_no` VALUES ('2', 'NO');
INSERT INTO `si_no` VALUES ('5', 'f');

-- ----------------------------
-- Table structure for vigencia
-- ----------------------------
DROP TABLE IF EXISTS `vigencia`;
CREATE TABLE `vigencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `ano` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vigencia
-- ----------------------------
INSERT INTO `vigencia` VALUES ('1', '2020-12-23', '2021-01-22', '2021');
INSERT INTO `vigencia` VALUES ('2', '2020-12-16', '2021-01-02', '2020');

-- ----------------------------
-- Table structure for visible
-- ----------------------------
DROP TABLE IF EXISTS `visible`;
CREATE TABLE `visible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(125) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visible
-- ----------------------------
INSERT INTO `visible` VALUES ('1', 'SI');
INSERT INTO `visible` VALUES ('2', 'NO');
