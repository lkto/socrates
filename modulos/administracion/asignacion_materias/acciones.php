<?php
require_once("php/formulario_basico.php");
//require_once("php/formulario_basicoSQLSERVER.php");
class Asignacion_materias extends formulario_basico {

    function validar() {
        $v = new Validation($_POST);
		$v->addRules('id_persona', 'Usuario', array('required' => true, 'integer' => true, 'maxLength' => 11) );
		$v->addRules('id_materia', 'Materia', array('required' => true) );
		$v->addRules('id_periodo', 'Periodo', array('required' => true) );

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

//        if ($_GET["desde_id_persona"] != "" && $_GET["desde_id_persona"] != "NULL") {
//            $s.= " AND id_persona >= '$_GET[desde_id_persona]' ";
//        }
//        if ($_GET["hasta_id_persona"] != "" && $_GET["hasta_id_persona"] != "NULL") {
//            $s.= " AND id_persona <= '$_GET[hasta_id_persona]' ";
//        }
        if ($_GET["id_materia"] != "" && $_GET["id_materia"] != "NULL") { 
            $s.= " AND id_materia = '$_GET[id_materia]'";
        }
        if ($_GET["id_periodo"] != "" && $_GET["id_periodo"] != "NULL") { 
            $s.= " AND id_periodo = '$_GET[id_periodo]'";
        }
//        $sql = "SELECT * FROM asignacion_materias WHERE 1=1  $s ORDER BY id ASC ";
        $sql = "SELECT
                am.*, 
                p.nombre AS periodo,
                CONCAT(
                    gp.nombre1,
                    ' ',
                    gp.nombre2,
                    ' ',
                    gp.apellido1,
                    ' ',
                    gp.apellido2
                ) AS usuario,
                m.nombre as materia
            FROM
                asignacion_materias am
            INNER JOIN materias m ON m.id = am.id_materia
            INNER JOIN periodos p ON p.id = am.id_periodo
            INNER JOIN general.persona gp ON gp.id = am.id_persona
            WHERE
                1 = 1
                $s
            ORDER BY
                am.id ASC ";
        return $sql;
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


$_POST['id']= desencriptar_id($_POST['id'],TOKEN);
$_GET['id']= desencriptar_id($_GET['id'],TOKEN);
unset($_POST['persona_nombre']);

$accion = ACCION;
$f = new Asignacion_materias("asignacion_materias", "id", true);
$f->$accion();
?>