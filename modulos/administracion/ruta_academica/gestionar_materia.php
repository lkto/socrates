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
                                             <div class="ui-widget-headerxxx boton-busquedaxxx">
                                                 <span class="ui-iconxx ui-icon-searchxx"></span>
                                             </div>
                                         </div>
                                         <!-- Fin boton de busqueda -->
                                     </div>
                                     <div style="clear:both"></div>
                                 </div>


 <form name="formulario"  id="form-busquedaxx" class="div-form-busqueda ui-dialog-content ui-widget-content" action=""  method="POST" target="contenido" >

         <div style="width:100%; margin:auto">
            <table style="width:100%">
              <tr> 
                <td class="tdi">Periodo</td>
                <td class="tdc">:</td>
                <td class="tdd">
                <select id="periodo" name="periodo" title="Periodo" placeholder="Nombre" style="width: 100%;" maxlength="50">
                   <?php
                    $s="SELECT id,nombre FROM socrates.periodos ORDER BY nombre";
                    $r=mysqli_query($conn, $s);
                    if(mysqli_num_rows($r) > 0)
                    {
                      while($rw=mysqli_fetch_assoc($r))
                      {
                      echo utf8_encode("<option value='$rw[id]'>$rw[nombre]</option>"); 
                      }
                    }         
                  ?> 
                </select>
              </td>
            </tr>
            </table>
</div>
<!-- <div style="text-align:right; position: relative; top: 5px;">
  <input type="submit"  class="btn-primary" value="Cargar" />
 
</div> -->
</form>
</div>

  
  <div class="row row-sm">
        <div class="col-md-8">

            <div class="card">
                <div class="card-body">

<!-- <iframe id="contenido" name="contenido" style="height:350px;width:100%; top: 60px; border:0px;"></iframe> -->
<form method="POST" target="_self">

<div id="descripcion" name="descripcion">
	<!-- <textarea  style="height:300px;width:99%"></textarea> -->
</div>
<br/>

</form>
   </div>
   </div>
   </div>

   <div class="col-md-4">

            <div class="card">
                <div class="card-body">
                    <h6 class="card-title d-flex justify-content-between align-items-center">
                        Información
                    </h6>
                    <div class="row mb-2">
                        <div class="col-6 text-muted">Materia:</div>
                        <div class="col-md-12">
                      <select id="vigencias" name="vigencias" title="Materia">
                        <?php
                        $sql1 = "SELECT id,nombre FROM socrates.materias ORDER BY nombre";
                        $rs1 = mysqli_query($conn, $sql1);
                        while ($rw1 = mysqli_fetch_assoc($rs1)) {

                            echo "<option value='$rw1[id]'>$rw1[nombre] </option>";
                        }
                        ?>
                      </select> 
                   </div>
                        <div class="col-6" id="contenido" name="contenido"></div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-6 text-muted">Periodo:</div>
                        <div class="col-md-12">
                      <select id="vigencias" name="vigencias" title="Periodo">
                        <?php
                        $sql1 = "SELECT id,nombre FROM socrates.periodos ORDER BY nombre";
                        $rs1 = mysqli_query($conn, $sql1);
                        while ($rw1 = mysqli_fetch_assoc($rs1)) {

                            echo "<option value='$rw1[id]'>$rw1[nombre] </option>";
                        }
                        ?>
                      </select> 
                   </div>
                        <div class="col-6" id="contenido" name="contenido"></div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-6 text-muted">Curso:</div>
                        <div class="col-md-12">
                      <select id="vigencias" name="vigencias" title="Curso">
                        <?php
                        $sql1 = "SELECT id,nombre FROM socrates.cursos ORDER BY nombre";
                        $rs1 = mysqli_query($conn, $sql1);
                        while ($rw1 = mysqli_fetch_assoc($rs1)) {

                            echo "<option value='$rw1[id]'>$rw1[nombre] </option>";
                        }
                        ?>
                      </select> 
                   </div>
                        <div class="col-6" id="contenido" name="contenido"></div>
                    </div>

                    <div name="nombre" id="nombre">
                    	
                    </div>
                    
                </div>
            </div>
    </div>

    </div>

    </div>

  </div>

  </div>

  </div>

  </div>


 <script>  
 $(document).ready(function(){  
      $('#periodo').change(function(){  
           var brand_id = $(this).val();  
           $.ajax({  
                url: page_root + 'lista',  
                method:"POST",  
                data:{brand_id:brand_id},  
                success:function(data){  
                     $('#descripcion').html(data);
                     // $('#nombre').html(data);

                }  
           });  
      });  
 });  
 </script> 