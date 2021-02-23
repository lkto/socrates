<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Persona extends formulario_basico {


    function validar() {
        $v = new Validation($_POST);
		$v->addRules('user', 'User', array('required' => true, 'maxLength' => 45) );
		$v->addRules('identifica', 'Identifica', array('required' => true, 'maxLength' => 20) );
		$v->addRules('apellido1', 'Apellido1', array('maxLength' => 80) );
		$v->addRules('apellido2', 'Apellido2', array('maxLength' => 80) );
		$v->addRules('nombre1', 'Nombre1', array('maxLength' => 80) );
		$v->addRules('nombre2', 'Nombre2', array('maxLength' => 80) );
		$v->addRules('correo', 'Correo', array('maxLength' => 145) );
		$v->addRules('clave', 'Clave', array('maxLength' => 40) );
		$v->addRules('clave2', 'Clave2', array('maxLength' => 50) );
		$v->addRules('estado', 'Estado', array('required' => true) );
/*		$v->addRules('fecha', 'Fecha', array('required' => true) );
*/		$v->addRules('foto', 'Foto', array('maxLength' => 100) );
		$v->addRules('firma', 'Firma', array('maxLength' => 100) );
		$v->addRules('tipo_user', 'Tipo user', array('required' => true) );
		$v->addRules('sexo_id', 'Sexo id', array('required' => true) );

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

$_SESSION['maestro']=5;


        if ($_GET["user"] != "" && $_GET["user"] != "NULL") { 
            $s.= " AND user LIKE '%" . str_replace(" ","%",$_GET['user']) ."%' ";
        }
        if ($_GET["identifica"] != "" && $_GET["identifica"] != "NULL") { 
            $s.= " AND identifica LIKE '%" . str_replace(" ","%",$_GET['identifica']) ."%' ";
        }
        if ($_GET["tipoide"] != "" && $_GET["tipoide"] != "NULL") { 
            $s.= " AND tipoide = '$_GET[tipoide]'";
        }
        if ($_GET["apellido1"] != "" && $_GET["apellido1"] != "NULL") { 
            $s.= " AND apellido1 LIKE '%" . str_replace(" ","%",$_GET['apellido1']) ."%' ";
        }
        if ($_GET["apellido2"] != "" && $_GET["apellido2"] != "NULL") { 
            $s.= " AND apellido2 LIKE '%" . str_replace(" ","%",$_GET['apellido2']) ."%' ";
        }
        if ($_GET["nombre1"] != "" && $_GET["nombre1"] != "NULL") { 
            $s.= " AND nombre1 LIKE '%" . str_replace(" ","%",$_GET['nombre1']) ."%' ";
        }
        if ($_GET["nombre2"] != "" && $_GET["nombre2"] != "NULL") { 
            $s.= " AND nombre2 LIKE '%" . str_replace(" ","%",$_GET['nombre2']) ."%' ";
        }

         $sql = "SELECT
                p.*   
                FROM general.persona p, admin_usuario u, admin_rol r
                WHERE  u.rol = '$_SESSION[maestro]' AND u.persona_id=p.id AND u.rol = r.id $s ORDER BY id ASC ";
        return $sql;


        /*$sql = "SELECT * FROM persona WHERE 1=1  $s ORDER BY id ASC ";
        return $sql;*/
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA

/*$_POST['_usuario'] = $_SESSION['usuario'];
$_POST['rol'] = $_SESSION['maestro'];
$_POST['_fecha'] = date('Y-m-d H:i:s');*/

$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Persona("persona", "id", true);
$f->$accion();
?>