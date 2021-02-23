<?php
require_once("php/formulario_basico.php");
class Admin_usuario extends formulario_basico {
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

    function validar() {
        $v = new Validation($_POST);
        $v->addRule("persona_id", "required", true, "Persona");
        $v->addRule("rol", "required", true, "Rol");
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
        $s = "";

        if ($_GET["rol"] != "" && $_GET["rol"] != "NULL") {
            $s.= " AND rol = '$_GET[rol]'";
        }
 
        if ($_GET["nombre"] != "" && $_GET["nombre"] != "NULL") {
            $t = str_replace(" ", "%", $_GET['nombre']);
            $sql_extra = " WHERE CONCAT_WS(' ', p.nombre1,p.apellido1,p.apellido2) LIKE '%$t%' ";
        } 

        $sql = "SELECT
                    u.persona_id,
                    p.id,
                    p.identifica,
                    CONCAT_WS(' ', p.nombre1,p.apellido1,p.apellido2) AS nombre,
                    r.nombre as rol
                FROM admin_usuario u, admin_rol r,  general.persona p
                WHERE 
                        u.rol = r.id AND
                        u.persona_id=p.id
                        $s
                ORDER BY nombre ";
        return $sql;
    }
    
    function listarPersonas() {
        $q = str_replace(" ", "%", $_GET['q']);
        $q = strtoupper($q);

        $sql = "SELECT id, CONCAT_WS('',nombre1,' ',apellido1,' ',apellido2, ' [',identifica,']') as text 
                    FROM  general.persona
                    WHERE  CONCAT_WS('',nombre1,' ',apellido1,' ',apellido2, ' [',identifica,']') LIKE '%$q%'
                    ORDER BY nombre1
                    LIMIT 100";
        echo $this->db->select_json($sql);
    }
}

//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA
$_POST['_usuario'] = $_SESSION['usuario'];
$_POST['_fecha'] = date('Y-m-d H:i:s');



unset($_POST['persona_nombre']);

$accion = ACCION;
$f = new Admin_usuario("admin_usuario", "persona_id", false);
$f->$accion();
?>