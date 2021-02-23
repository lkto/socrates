<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Areas extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('nombre', 'Nombre', array('required' => true, 'maxLength' => 50) );
//		$v->addRules('id_vigencia', 'Vigencia', array('required' => true) );
//		$v->addRules('persona_nombre', 'Persona', array('required' => false) );
		$v->addRules('id_persona', 'Usuario', array('required' => true, 'integer' => true, 'maxLength' => 11) );

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
//        if ($_GET["id_vigencia"] != "" && $_GET["id_vigencia"] != "NULL") {
//            $s.= " AND id_vigencia = '$_GET[id_vigencia]'";
//        }
//        if ($_GET["desde_id_persona"] != "" && $_GET["desde_id_persona"] != "NULL") {
//            $s.= " AND id_persona >= '$_GET[desde_id_persona]' ";
//        }
//        if ($_GET["hasta_id_persona"] != "" && $_GET["hasta_id_persona"] != "NULL") {
//            $s.= " AND id_persona <= '$_GET[hasta_id_persona]' ";
//        }
//        $sql = "SELECT * FROM areas WHERE 1=1  $s ORDER BY id ASC ";
        $sql = "SELECT
                a.*,
                CONCAT(
                    p.apellido1,
                    ' ',
                    p.apellido2,
                    ' ',
                    p.nombre1,
                    ' ',
                    p.nombre2
                ) AS persona
            FROM
                areas a,
                general.persona p
            WHERE

            p.id = a.id_persona 
            $s ORDER BY id ASC ";
        return $sql;
    }

    function asignar() {
        $_GET['id']=desencriptar_id($_GET['id']);
        $sql = "SELECT u.persona_id,
                    u.rol,
                    CONCAT_WS('',p.nombre1,' ',p.nombre2,' ',p.apellido1,' ',
                    p.apellido2, ' [',p.identifica,']') as persona_nombre
                FROM admin_usuario u, general.persona p
                WHERE p.id = u.persona_id AND u.persona_id='$_GET[id]'";
        $rw = $this->db->select_row($sql);
        echo json_encode($rw);
    }

    function listarPersonas() {
        $q = str_replace(" ", "%", $_GET['q']);
        $q = strtoupper($q);

        $sql = "SELECT
                general.persona.id as id,
                CONCAT_WS(
                    '',
                    nombre1,
                    ' ',
                    apellido1,
                    ' ',
                    apellido2,
                    ' [',
                    identifica,
                    ']'
                ) AS text
            FROM
                general.persona,
                socrates.admin_usuario au
            WHERE
                CONCAT_WS(
                    '',
                    nombre1,
                    ' ',
                    apellido1,
                    ' ',
                    apellido2,
                    ' [',
                    identifica,
                    ']'
                ) LIKE '%$q%' AND
                  au.persona_id = general.persona.id AND
                  au.rol in(1,4,5)
            ORDER BY
                nombre1
            LIMIT 100";
//        echo $sql;
        echo $this->db->select_json($sql);
    }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA

unset($_POST['persona_nombre']);
$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);


$accion = ACCION;
$f = new Areas("areas", "id", true);
$f->$accion();
?>