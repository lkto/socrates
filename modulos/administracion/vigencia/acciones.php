<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Vigencia extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('fecha_inicial', 'Fecha inicial', array('required' => true, 'date' => true) );
		$v->addRules('fecha_final', 'Fecha final', array('required' => true, 'date' => true) );
		$v->addRules('ano', 'Ano', array('required' => true, 'maxLength' => 255) );

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

        if ($_GET["desde_fecha_inicial"] != "" && $_GET["desde_fecha_inicial"] != "NULL") { 
            $s.= " AND fecha_inicial >= '$_GET[desde_fecha_inicial]' ";
        }
        if ($_GET["hasta_fecha_inicial"] != "" && $_GET["hasta_fecha_inicial"] != "NULL") { 
            $s.= " AND fecha_inicial <= '$_GET[hasta_fecha_inicial]' ";
        }
        if ($_GET["desde_fecha_final"] != "" && $_GET["desde_fecha_final"] != "NULL") { 
            $s.= " AND fecha_final >= '$_GET[desde_fecha_final]' ";
        }
        if ($_GET["hasta_fecha_final"] != "" && $_GET["hasta_fecha_final"] != "NULL") { 
            $s.= " AND fecha_final <= '$_GET[hasta_fecha_final]' ";
        }
        if ($_GET["ano"] != "" && $_GET["ano"] != "NULL") { 
            $s.= " AND ano LIKE '%" . str_replace(" ","%",$_GET['ano']) ."%' ";
        }
        $sql = "SELECT * FROM vigencia WHERE 1=1  $s ORDER BY id ASC ";
        return $sql;
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA


$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Vigencia("vigencia", "id", true);
$f->$accion();
?>