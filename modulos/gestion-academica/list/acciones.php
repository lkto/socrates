<?php
class Formulario extends Base {
    function validar_token()
    {
        $hash = $_SERVER['HTTP_AUTHORIZATION'];
       
        if ($hash) {//No hay errores de validacion
             $_POST=desencriptar_post($_POST,$hash);
        }else { //Errores de validación
            $r['error'] = true;
            $r['msg'] = 'Error en TOKEN';
            echo json_encode($r);
            exit(0);
        }
        return true;
    }
    function validar() {
        
        $v = new Validation($_POST);
    
    
    
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

/* Aceptar */
   function aceptar() {
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO

       

       $result=array();
       $result["error"] = false;
       $result["msg"] = "PONER MENSAJE A ENVIAR AQUI."; 
       echo json_encode($result);
   }

   function operaciones() {
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO
       $tema = trim($_POST['tema']);
       $masterIdRutaAcademica = $_POST['form'][0]['value'];
       $idRutaAcademica = $_POST['form'][1]['value'];
       $accion = $_POST['form'][2]['value'];
       $idPeriodo = $_POST['form'][4]['value'];
       $error = false;
       $msg = '';
       $data = null;

       if($accion == 'crear'){
           $sqlExistRegister = "
            SELECT
                ra.*
            FROM
                ruta_academica ra
            WHERE
                ra.id_master_ruta_academica = $masterIdRutaAcademica
            AND ra.id_periodo_escolar = $idPeriodo
           ";
           $existRegister = json_decode($db->select_json($sqlExistRegister));

           if( is_array($existRegister) and count($existRegister) > 0){
               $error = true;
               $msg = 'Ya existe un registro para el periodo seleccionado';
           } else {
               $insert = array(
                   'temas' => $tema,
                   'id_master_ruta_academica' => $masterIdRutaAcademica,
                   'id_periodo_escolar' => $idPeriodo
               );
               $this->db->insert('ruta_academica',$insert);
               $error = false;
               $msg = 'Datos guardados con exito';
           }
       }elseif ($accion == 'editar'){

           $sql = "
                SELECT
                    ra.*
                FROM
                    ruta_academica ra
                WHERE
                    ra.id = $idRutaAcademica
               ";

           $data_actual =json_decode($db->select_json($sql));
           $actual = $data_actual[0];
           $sqlEditar = "
            UPDATE ruta_academica
            SET id_periodo_escolar = $idPeriodo,
             temas = '$tema'
            WHERE
                id = $idRutaAcademica
           ";
            $db->query($sqlEditar);
            $date = new DateTime('now');
            $todayFormat = $date->format('Y-m-d H:i:s');
           $insertLog = array(
               'temas' => $actual->temas,
               'id_master_ruta_academica' => $actual->id_master_ruta_academica,
               'id_periodo_escolar' => $actual->id_periodo_escolar,
               'fecha' => $todayFormat
           );

           $this->db->insert('log_ruta_academica',$insertLog);
           $error = false;
           $msg = 'Datos modificados con exito';
       }elseif ($accion == 'eliminar'){
           $date = new DateTime('now');
           $todayFormat = $date->format('Y-m-d H:i:s');
            $sqlEliminar = "DELETE
                FROM
                    ruta_academica
                WHERE
                    id = $idRutaAcademica
             ";
           $db->query($sqlEliminar);
           $insertLogDelete = array(
               'temas' => $tema,
               'id_master_ruta_academica' => $masterIdRutaAcademica,
               'id_periodo_escolar' => $idPeriodo,
               'fecha' => $todayFormat
           );
           $this->db->insert('log_ruta_academica',$insertLogDelete);
           $error = false;
           $msg = 'Datos Eliminados con exito';
       }

       $result=array();
       $result["error"] = $error;
       $result["msg"] = $msg;
       echo json_encode($result);
   }

   function listar(){
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO
        $idMasterRutaAcademica = $_POST['id_master_ruta_academica'];
        $sql = "SELECT
                    ra.*, pe.nombre AS periodo
                FROM
                    ruta_academica ra
                INNER JOIN periodo_escolar pe ON pe.id = ra.id_periodo_escolar
                WHERE
                    ra.id_master_ruta_academica = $idMasterRutaAcademica
                ORDER BY
                    pe.id
	    ";

      $result=array();
      $data = json_decode($db->select_json($sql));
      if(is_array($data) and count($data) > 0){
          $result["data"] = $data;
      }else{
          $result["data"] = [];
      }
       $result["error"] = false;
       echo json_encode($result);
   }

   function getData(){
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO
       $idRutaAcademica = $_POST['id_ruta_academica'];
       $sql = "
        SELECT
            ra.*
        FROM
            ruta_academica ra
        WHERE
            ra.id = $idRutaAcademica
       ";
       $data = json_decode($db->select_json($sql));
       if(is_array($data) and count($data) > 0){
           $result["data"] = $data;
       }else{
           $result["data"] = [];
       }
       $result["error"] = false;
       echo json_encode($result);
   }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA
 
$accion = ACCION;
$f = new Formulario();
$f->$accion();
?>