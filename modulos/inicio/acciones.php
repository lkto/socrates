<?php
class Formulario extends Base {
    
   function set_token()
    {
        $hash = strtotime(date('Y-m-d H:m:s'))*27;
        $r['error'] = false;
        $r['data'] = md5($hash);
        echo json_encode($r);
    }

    function agregar_favorito()
    {
    	
    	$insertar = array();
    	$insertar['id_persona'] = $_SESSION['persona_id'];
    	$insertar['id_menu'] = $_POST['id'];
        
        $sql = "SELECT * FROM admin_favoritos WHERE id_menu='$insertar[id_menu]' and id_persona='$insertar[id_persona]' ";
        $validar = $this->db->select_row($sql);
        if ($validar) {
        	$this->db->query("DELETE FROM admin_favoritos WHERE id='$validar[id]' ");
        	$error = true;
            $msg = "Menú Eliminado de Favoritos";
        }else{
        	$this->db->insert('admin_favoritos',$insertar);
        	$error = false;
        	$msg = "Menú Agregado a Favoritos";
        }

			$r['error'] =$error;
			$r['msg'] = $msg;
			echo json_encode($r);
    	
    }
}
//$_POST = array_map("strtoupper", $_POST); //CONVERTIR TODO EN MAYUSCULA
// FABIO PROBANDO EDICION WEB.
$accion = ACCION;
$f = new Formulario();
$f->$accion();
?>                            
                                                    
                        