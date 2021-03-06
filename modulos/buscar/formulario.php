<?php 
$menu_b = NULL;
$acceso_b = "'" . implode("','", $_SESSION['acceso_menu']) . "'";
$_POST['buscar'] = trim($_POST['buscar']);
$q = trim(str_replace(" ","%",$_POST['buscar']));
$sql_b = "SELECT m.*,
         (SELECT COUNT(*) FROM admin_menu WHERE padre=m.menu) as hijos,
         (SELECT 'S'FROM admin_permiso_menu p, admin_usuario u 
         WHERE u.rol=p.rol AND p.menu=m.menu AND u.persona_id='$_SESSION[persona_id]') as disponible
         FROM admin_menu m
         WHERE m.nombre LIKE '%$q%' and m.visible='S' AND m.acceso IN ($acceso)
         ORDER BY m.orden,m.nombre";
$menu_b = $db->select_all($sql_b);
//$sql_permiso = get_sql_tipo_corriente_id_permiso('ex.tipo_corriente_id');
?>
<div class="row">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    
                    <div class="col-12">
                      <form action="buscar" method="post">
                        <div class="form-group d-flex">
                          <input type="text" class="form-control" name="buscar" id="buscar" value="<?php echo $_POST['buscar'] ?>" placeholder="Ingrese texto que desea buscar...">
                          <button type="submit" class="btn btn-primary ml-3">Buscar</button>
                        </div>
                      </form>
                    </div>
                    <div class="col-12 mb-5">
                      <h2>Resultado de la búsqueda de <u class="ml-2">"<?php echo $_POST['buscar'] ?>"</u></h2>
                    </div>
          
          <div class="col-12 col-lg-12" style="margin-bottom: 10px">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Menú</h4>
                  <p class="card-description">
                    Resultados encontrados en los accesos del menú.
                  </p>
                  <div class="row">
                    <?php foreach ($menu_b as $rw) { 
                         $icono = $rw['icono'];
                         if (!$icono) {
                           $icono = "ti-check ";
                         }
                         if ($rw['acceso'] == "7" && $rw['disponible'] != "S") {}
                         else if($rw['hijos']==0){
                            $q = strtoupper($q);
                            $rw['nombre'] = validar_tildes($rw['nombre']);
                      ?>
                      
                        <div class="card rounded border col-md-5" style="margin:5px">
                          <div class="card-body p-3">
                            <div class="media">
                              <i class="<?php echo $icono; ?> icon-sm align-self-center mr-3"> <?php echo str_replace($q, "<b><u>$q</u></b>", (trim($rw['nombre']))); ?></i>
                              <div class="media-body">
                                <h6 class="mb-1"></h6>
                                <p class="mb-0 text-muted">
                                  <a href="<?php echo WEB_ROOT . $rw['menu']; ?>" title="" target="_blank">  Acceder...  </a>
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>


                    <?php } } ?>
                  </div>
                </div>
              </div>
            </div>
                  </div>
                </div>
              </div>
            </div>
          </div>