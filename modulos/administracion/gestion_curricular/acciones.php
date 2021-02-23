<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Gestion_curricular extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('fecha', 'Fecha', array('required' => true, 'date' => true) );
		$v->addRules('descripcion', 'Descripcion', array('required' => true, 'maxLength' => 50) );
		$v->addRules('observacion', 'Observacion', array('required' => true, 'maxLength' => 50) );
		$v->addRules('id_planeacion_curricular', 'Planeacion curricular', array('required' => true) );

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

        if ($_GET["desde_fecha"] != "" && $_GET["desde_fecha"] != "NULL") { 
            $s.= " AND fecha LIKE '%" . str_replace(" ","%",$_GET['desde_fecha']) ."%' ";
        }
        if ($_GET["descripcion"] != "" && $_GET["descripcion"] != "NULL") { 
            $s.= " AND descripcion LIKE '%" . str_replace(" ","%",$_GET['descripcion']) ."%' ";
        }
        $sql = "SELECT * FROM gestion_curricular WHERE 1=1  $s ORDER BY id ASC ";
        return $sql;
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA


$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Gestion_curricular("gestion_curricular", "id", true);
$f->$accion();
?>