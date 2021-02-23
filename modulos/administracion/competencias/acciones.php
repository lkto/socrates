<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Competencias extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('descripcion', 'Descripcion', array('required' => true, 'maxLength' => 50) );

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

        if ($_GET["descripcion"] != "" && $_GET["descripcion"] != "NULL") { 
            $s.= " AND descripcion LIKE '%" . str_replace(" ","%",$_GET['descripcion']) ."%' ";
        }
        $sql = "SELECT * FROM competencias WHERE 1=1  $s ORDER BY id ASC ";
        return $sql;
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA


$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Competencias("competencias", "id", true);
$f->$accion();
?>