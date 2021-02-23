<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Materias extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('nombre', 'Nombre', array('required' => true, 'maxLength' => 50) );
		$v->addRules('areas', 'Areas', array('required' => true) );
		$v->addRules('curso', 'Curso', array('required' => true) );

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

        if ($_GET["nombre"] != "" && $_GET["nombre"] != "NULL") { 
            $s.= " AND nombre LIKE '%" . str_replace(" ","%",$_GET['nombre']) ."%' ";
        }
        if ($_GET["areas"] != "" && $_GET["areas"] != "NULL") { 
            $s.= " AND areas = '$_GET[areas]'";
        }
        if ($_GET["curso"] != "" && $_GET["curso"] != "NULL") { 
            $s.= " AND curso = '$_GET[curso]'";
        }
//        $sql = "SELECT * FROM materias WHERE 1=1  $s ORDER BY id ASC ";
        $sql = "SELECT
                    m.*,
                    a.nombre as area,
                    c.nombre as curso
                FROM
                    materias m
                INNER JOIN areas a ON a.id = m.areas
                INNER JOIN cursos c ON c.id = m.curso 
                WHERE
                    1 = 1 $s
                ORDER BY
                    m.id ASC ";
        return $sql;
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA


$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Materias("materias", "id", true);
$f->$accion();
?>