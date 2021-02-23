<!-- FORMULARIO -->

<?php 
function fill_brand($conn)  
 {  
      $output = '';  
      $sql = "SELECT id, CONCAT_WS('', fecha_final, ' - ' ,fecha_final) as name FROM vigencia";  
      $result = mysqli_query($conn, $sql);  
      while($row = mysqli_fetch_array($result))  
      {  
           $output .= '<option value="'.$row["id"].'">'.$row["name"].'</option>';  
      }  
      return $output;  
 }  


 function fill_product($conn)  
 {  
      $output = '';
      $date = new DateTime('now');
      $year = $date->format('Y');
      $userId = $_SESSION['persona_id'];

      $sqlPeriodo = "
                SELECT
                    *
                FROM
                    periodos
                WHERE
                    periodos.nombre = $year
      ";

      $resultPeriodo = mysqli_query($conn, $sqlPeriodo);
      if($resultPeriodo->num_rows > 0){
          $row = mysqli_fetch_array($resultPeriodo);
          $periodo = $row['id'];
          $sql = "SELECT
                    m.*
               FROM
                    materias m
               INNER JOIN asignacion_materias am
               WHERE
                am.id_materia = m.id
                AND am.id_periodo = $periodo
                AND am.id_persona = $userId";

          $result = mysqli_query($conn, $sql);
          if($result->num_rows > 0){
              while($row = mysqli_fetch_array($result))
              {
                  $output .= '<div class="col-md-3" onclick="showRutaAcademica('.$row["id"].')" style="cursor: pointer;">';
                  $output .= '<div style="border:1px solid #ccc; padding:20px; margin-bottom:20px;">'.$row["nombre"].'';
                  $output .=     '</div>';
                  $output .=     '</div>';
              }
          }else{
              $output .= '<div class="col-md-3">';
              $output .= '<p>No hay un periodo academico activo para el año actual</p>';
              $output .= '</div>';
          }

      }else{
          $output .= '<div class="col-md-3">';
          $output .= '<p>No hay un periodo academico activo para el año actual</p>';
          $output .= '</div>';
      }
      return $output;  
 }  
 ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                   <div style="width: 90%;margin:auto">
                     <div class="ui-state-active titulo-formulario">
                         <div style="text-align:center; font-weight:bold; font-size:12pt">
                             <span>RUTA ACADEMICA</span>
                             <!-- Boton de busqueda -->
                             <div style="float:right">
                                 <div class="ui-widget-headerff boton-busquedass">
                                     <span class="ui-iconvv ui-icon-searchdd"></span>
                                  </div>
                             </div>
                             <!-- Fin boton de busqueda -->
                         </div>
                         <div style="clear:both"></div>
                     </div>
                      <form class="div-form-busquedas ui-dialog-content ui-widget-content" id="form-busquedas">
                            <div style="width:100%; margin:auto">
                                <h3>Seleccione una materia</h3>
                                <div class="row" id="show_product">
                                          <?php echo fill_product($conn);?>
                                </div>
                            </div>
                      </form>
                      <div id="content_ruta_academica" class="grid"></div>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>  
  function showRutaAcademica(idMateria) {

      window.location.href = 'ruta-academica-list?materia='+idMateria;
  }
 </script> 