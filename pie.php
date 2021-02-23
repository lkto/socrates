
    </div>
</section>

</body>
</html>

  <script type="text/javascript" >

    $(document).ready(function(e) {
        

        <?php
           //Ocultar botones a los que no se tiene permiso
           $sql = "SELECT a.accion, a.requiere_permiso, pa.id AS permiso
           FROM admin_accion a LEFT JOIN admin_permiso_accion pa ON a.id = pa.accion and pa.rol='$_SESSION[usuario_rol]'
           WHERE a.menu = '".MENU."' AND a.requiere_permiso='S'";
             $rs = $db->query($sql);
             while ($rw = $db->fetch_assoc($rs)) {
               if ($rw['permiso'] == ""){ ?>
                 setTimeout(function() { <?php echo '$(".accion-'.$rw['accion'].'").hide();'; ?> }, 300);                 
               <?php }
             }
        ?>

          //Manejar ruta de menú  y menú activo
        <?php
             $rw = $db->select_row("SELECT * FROM admin_menu WHERE menu='".MENU."'");

             $ruta = "";
               if ($rw['padre'] != "") {  
                  $padre = $db->select_row("SELECT * FROM admin_menu WHERE menu='$rw[padre]'");
                  
                  $ruta="<ol class='breadcrumb'><li class='breadcrumb-item'><a href='inicio'>Inicio</a></li><li class='breadcrumb-item'><a href='#'>$padre[nombre]</a></li><li class='breadcrumb-item active' aria-current='page' >$rw[nombre]</li></ol>";           
                  
                  echo '$(".menur").removeClass("active");';
                  echo '$(".menup-'.$rw['menu'].'").addClass("active");';
                  echo '$(".menup-'.$rw['padre'].'").addClass("active");';
                  echo '$("#menu-'.$padre['menu'].'").addClass("open");';
                  echo '$(".menup-'.$padre['padre'].'").addClass("active");';
                  echo '$("#menu-'.$padre['padre'].'").addClass("open");';
               }else{
                  echo '$(".menup-'.$rw['menu'].'").addClass("active");';
               }
        ?> 

          <?php 

          $sql = "SELECT * FROM admin_favoritos WHERE id_menu='$rw[id]' and id_persona='$_SESSION[persona_id]' ";
          $validar = $db->select_row($sql);

          if ($validar) { ?>
             var favorito = '  <a href="#" class="add-star mr-3" onclick="agregar_favorito(<?php echo $rw[id] ?>)" data-toggle="tooltip" data-placement="right" title=""   data-original-title="Agregar a enlaces favoritos o más usados"><i class="fa fa-star font-size-16 text-success" id="menu_<?php echo $rw[id] ?>"></i>';
          <?php }else{ ?>
               var favorito = '  <a href="#" class="add-star mr-3" onclick="agregar_favorito(<?php echo $rw[id] ?>)" data-toggle="tooltip" data-placement="right" title=""   data-original-title="Agregar a enlaces favoritos o más usados"><i class="fa fa-star font-size-16" id="menu_<?php echo $rw[id] ?>"></i>';
           <?php } ?>
           
           
            $("#titulo_ubicacion_frm").html(favorito+" <?php echo $rw[nombre] ?></a>");
            $("#ruta_global").html("<?php echo $ruta ?>");
            $("input[type='text']").addClass("form-control");
            $("input[type='date']").addClass("form-control");
            $("input[type='number']").addClass("form-control");
            $("input[type='email']").addClass("form-control");
            $("input[type='tel']").addClass("form-control");
            $("select").addClass("form-control");
            $("textarea").addClass("form-control");
            $("table").addClass("table table-hover");
             <?php if (count($_SESSION['menu_padre_hijos'][$padre[menu]])>0) { ?>
                  $("#hidden_menu").show();
             <?php } ?>
             setTimeout(function() { $('[data-toggle="tooltip"]').tooltip({ container: 'body' }); }, 1000);
        });


    </script>


</body>
</html>