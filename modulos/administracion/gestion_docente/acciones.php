<?php
require_once("php/formulario_basico_docentes.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Persona extends formulario_basico_docentes {


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
//        $v->addRules('estado', 'Estado', array('required' => false) );
/*      $v->addRules('fecha', 'Fecha', array('required' => true) );
*/      $v->addRules('foto', 'Foto', array('maxLength' => 100) );
        $v->addRules('firma', 'Firma', array('maxLength' => 100) );
//        $v->addRules('tipo_user', 'Tipo user', array('required' => false) );
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



    function listar_dato() {
        $sql = $this->getSQL();

        $result['total'] = $this->db->count_rows($sql);

        $offset = ($_GET['page'] - 1) * $_GET['recordpage'];
        $limit = $_GET['recordpage'];

        $rs = $this->db->select_limit($sql, $limit, $offset);
        $result['rows'] = array();
        $num = $offset + 1;
        while ($rw = $this->db->fetch_assoc($rs)) {
            $rw['_NUM_'] = $num++;
            $rw['id'] = encriptar_id($rw['id'],TOKEN);
            $rw['btn']=$this->get_btn($rw['id']);
            $result['rows'][] = $rw;
        }
        //$result['rows'] = $this->db->fetch_all($rs);
        echo json_encode($result);
    }
    function getSQL() {
        $s="";

        $_SESSION['maestro']= [1,4,5,6];
        $roles = [1,4,5,6];


        if ($_GET["user"] != "" && $_GET["user"] != "NULL") { 
            $s.= " AND user LIKE '%" . str_replace(" ","%",$_GET['user']) ."%' ";
        }
        if ($_GET["identifica"] != "" && $_GET["identifica"] != "NULL") { 
            $s.= " AND identifica LIKE '%" . str_replace(" ","%",$_GET['identifica']) ."%' ";
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
                FROM
                    general.persona p,
                    socrates.admin_usuario u,
                    socrates.admin_rol r
                WHERE
                    u.rol IN (1,4,5,6)
                AND u.persona_id = p.id
                AND u.rol = r.id $s
                ORDER BY
                    id ASC ";
        return $sql;


        /*$sql = "SELECT * FROM persona WHERE 1=1  $s ORDER BY id ASC ";
        return $sql;*/
    }

    function agregar_datos() {
        validar();
        echo "hhshsh";
    }

    // function aceptar() {
    //     $this->validar();
    //     $datos = $_POST;
        
    //     $tabla="general.persona";
    //     $sql1 = "SELECT
    //             p.*   
    //             FROM $tabla p, general.admin_usuario u, general.admin_rol r
    //             WHERE  u.rol in (5) AND u.persona_id=p.id AND u.rol = r.id";
    //     //$d = $this->db->select_row($sql1);
    //     // if ($d['id'] <> $_SESSION['persona_id']) {
    //     //       $result=array();
    //     //       $result["error"] = true;
    //     //       $result["msg"] = "El documento a modificar ya esta registrado."; 
    //     //       echo json_encode($result);
    //     //       exit();
    //     // } 

    //     $this->db->insert($tabla,$datos,array('id'=>$_SESSION['persona_id']));
    //     $last_id = $db->LAST_INSERT_ID();
    //     //PONER CODIGO AQUI
    //     $_POST['_fecha'] = date('Y-m-d H:i:s');
    //     $fechas = $_POST['_fecha'];
    //     $_POST['_usuario'] = $_SESSION['usuario'];
    //     $usuarios = $_POST['_usuario'];

    //     $db->query("INSERT INTO general.admin_usuario (`persona_id`, `rol`, `_usuario`, `_fecha`) 
    //         VALUES ('$last_id', '5', '$usuarios', '$fechas') ");
        
    //     $result=array();
    //     $result["error"] = false;
    //     $result["msg"] = "PONER AQUI."; 
    //     echo json_encode($result);
    // }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA

/*$_POST['_usuario'] = $_SESSION['usuario'];
$_POST['rol'] = $_SESSION['maestro'];
$_POST['_fecha'] = date('Y-m-d H:i:s');*/

$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Persona("general.persona", "id", true);
$f->$accion();
?>