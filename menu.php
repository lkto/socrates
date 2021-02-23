<?php
//$t1= microtime(true); 
$menu = NULL;
$acceso = "'" . implode("','", $_SESSION['acceso_menu']) . "'";
$sql = "SELECT 
                m.*,
                (SELECT COUNT(*) FROM admin_menu WHERE padre=m.menu) as hijos,
                (SELECT 'S'FROM admin_permiso_menu p, admin_usuario u 
                        WHERE u.rol=p.rol AND p.menu=m.menu AND u.persona_id='$_SESSION[persona_id]') as disponible
        FROM admin_menu m
        WHERE m.visible='S' AND m.acceso IN ($acceso)
        ORDER BY m.orden,m.nombre";

$menu = $db->select_all($sql);
?>
<?php
    generarMenu("");
?>


<?php




function generarMenu($padre) {
    global $menu;
    if ($padre != "")
        echo "<ul  class='ml-menu'>";
     
      foreach ($menu as $rw) {
        if ($rw['padre'] == $padre) {
            if ($rw['hijos'] == 0) {
                $href = WEB_ROOT . $rw['menu'];
            }else{
                $href = "#";
            }


            if ($rw['acceso'] == "7" && $rw['disponible'] != "S") {
                $class = "no-disponible";
            }else if($rw['nombre']!='Cerrar sesión'){
                //$class = "disponible";

                 $color_i = "";
                 if ($rw['hijos'] > 0){
                  
                  echo '<li class="menur menup-'.$rw[menu].'"><a href="javascript:void(0);" class="menu-toggle"><i class="'.$rw[icono].'"></i><span>'.$rw[nombre].'</span></a>';
                 
                 }else{
                

                  echo '<li class="menur menup-'.$rw[menu].'"><a href="'.$href.'" target="'.$rw[target].'"">
                  <i class="'.$rw[icono].'"></i><span>'.$rw[nombre].'</span></a>';
                 }
           
            echo "</a> ";

              /** INICO SIGUIENTE NIVEL * */
              if ($rw['hijos'] > 0){
                generarMenu($rw['menu']);               
              }
              // FIN SIGUIENTE NIVEL
              
              echo "</li>";
            }

        }
    }


    if ($padre != "")
        echo "</ul>";
}

?>