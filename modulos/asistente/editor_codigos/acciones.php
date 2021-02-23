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

/* Permite listar los archivos de los módulos del sistema */
   function listar_archivos() {
       $this->validar();
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO


       //PONER CODIGO AQUI ATT : FABIO GARCIA :D
                          
       $result=array();
       $result["error"] = false;
       $result["msg"] = "PONER MENSAJE A ENVIAR AQUI."; 
       echo json_encode($result);
   }
/* Permite guardar la información que se edita */
   function guardar() {
       $this->validar();
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO

       $t1 = $_POST['html'];
       $t1 = str_replace('\r\n',PHP_EOL, $t1);
       $t1 = str_replace('\"','"', $t1);
       $t1 = str_replace("\'","'", $t1);
       $t1 = str_replace('\r\n\r\n',PHP_EOL, $t1);
       $t1 = preg_replace("/[\r\n|\n|\r]+/", PHP_EOL, $t1);


       $file1 = $_POST['url'];
       $file1 = str_replace("//", "/", $file1);
       file_put_contents($file1, $t1);
       chmod($file1, 0777);
                          
       $result=array();
       $result["error"] = false;
       $result["msg"] = "Cambio realizado con exito!"; 
       echo json_encode($result);
   }
   
/* Permite obtener el contenido del archivo que se desa editar */
   function obtener() {
       $this->validar();
       $db = $this->db; // HOMOLOGAR CODIGO EXTERNO
       $t2 = file_get_contents($_POST['url']);
                          
       $result=array();
       $result["error"] = false;
       $result["html"] = $t2; 
       echo json_encode($result);
   }

}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA
 
$accion = ACCION;
$f = new Formulario();
$f->$accion();
?>