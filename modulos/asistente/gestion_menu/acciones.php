<?php
require_once("php/formulario_basico.php");
class Admin_menu extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('menu', 'Menu', array('required' => true, 'maxLength' => 100) );
		$v->addRules('nombre', 'Nombre', array('required' => true, 'maxLength' => 50) );
		$v->addRules('ruta', 'Ruta', array('maxLength' => 100) );
		$v->addRules('accion', 'Accion', array('maxLength' => 60) );
		$v->addRules('orden', 'Orden', array('required' => true, 'maxLength' => 6) );
		$v->addRules('visible', 'Visible', array('required' => true, 'maxLength' => 1) );
		$v->addRules('target', 'Target', array('maxLength' => 49) );
		$v->addRules('icono', 'Icono', array('maxLength' => 200) );

        $result = $v->validate();

        if ($result['messages'] == "") {//No hay errores de validacion
            return true;
        } else { //Errores de validación
            $r['error'] = true;
            $r['msg'] = $result['messages'];
            $r['bad_fields'] = $result['bad_fields'];
            $r['errors'] = $result['errors'];
            echo json_encode($r);
            exit(0);
        }
        return true;
    }

    function getSQL() {
        $s="";

        if ($_GET["menu"] != "" && $_GET["menu"] != "NULL") { 
            $s.= " AND menu LIKE '%" . str_replace(" ","%",$_GET['menu']) ."%' ";
        }
        if ($_GET["padre"] != "" && $_GET["padre"] != "NULL") { 
            $s.= " AND padre = '$_GET[padre]'";
        }
        if ($_GET["nombre"] != "" && $_GET["nombre"] != "NULL") { 
            $s.= " AND nombre LIKE '%" . str_replace(" ","%",$_GET['nombre']) ."%' ";
        }

        $sql = "SELECT * FROM admin_menu WHERE 1 $s  ORDER BY padre,orden";
        return $sql;
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA
$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Admin_menu("admin_menu", "id", true);
$f->$accion();
?>