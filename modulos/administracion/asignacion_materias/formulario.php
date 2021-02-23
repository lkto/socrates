<script type="text/javascript">
    var grid;
    var f;

    $(document).ready(function(e) {
        grid = $.addGrid("#grid",
                {
                    url: page_root + 'listar',
                    height: 400,
                    dataType: 'json',
                    selectionMode: "single",
                    rowHeaderWidth: 1,
                    idName: "_id",
                    idField: "id",
                    recordPage: 50,
                    cols: [
                        {display: 'NO.', name: '_NUM_', width: 40, align: 'left'},
                        {display: 'DOCENTE', name: 'usuario', width: 400, align: 'left'},
						{display: 'MATERIA', name: 'materia', width: 200, align: 'left'},
						{display: 'PERIODO', name: 'periodo', width: 200, align: 'left'},
                        {display: 'ACCIONES', name: 'btn', width: 130, align: 'left'}
                    ]}
        );
        f = new formulario(true,650);

        $("#persona_nombre").autocompletar2(page_root + "listarPersonas", {
            form: "formulario",
            inputId: "id_persona",
            minLength: 3});
    });
</script>

<!-- FORMULARIO -->

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                
                   <div style="width: 90%;margin:auto">       
                      
                        
                                 <div class="ui-state-active titulo-formulario">
                                     <div style="text-align:center; font-weight:bold; font-size:12pt"> 
                                         <span>ASIGNACION MATERIAS</span> 
                                         <!-- Boton de busqueda -->
                                         <div style="float:right">
                                             <div class="ui-widget-header boton-busqueda">
                                                 <span class="ui-icon ui-icon-search"></span>
                                             </div>
                                         </div>
                                         <!-- Fin boton de busqueda -->
                                     </div>
                                     <div style="clear:both"></div>
                                 </div>

   <form class="div-form-busqueda ui-dialog-content ui-widget-content" id="form-busqueda">
        <div style="width:100%; margin:auto">
            <table style="width:100%">

            <tr>
                <td class="tdi">Materia</td>
                <td class="tdc">:</td>
                <td class="tdd">
                	<select id="bid_materia" name="id_materia" title="Materia">
                    	<?php llenar_combo("SELECT id, nombre FROM materias ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr> 
            <tr>
                <td class="tdi">Periodo</td>
                <td class="tdc">:</td>
                <td class="tdd">
                	<select id="bid_periodo" name="id_periodo" title="Periodo">
                    	<?php llenar_combo("SELECT id, nombre FROM periodos ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr>
            </table>
            <div class="acciones"> 
               <input type="button" value="Buscar"  onclick="f.buscar()" class="btn btn-block btn-primary" style="margin-left:10px;width:80px;float:right"/>
            </div>
        </div>
    </form>

                        
                        <div id="grid" class="grid"></div>  
                
                
                         <div class="btn-toolbar acciones" role="toolbar" aria-label="Toolbar with button groups" 
                            style="width: 20%; margin-left: 90%;margin-top: 10px; margin-bottom: 10px;">
                             <div class="btn-group" role="group" aria-label="Third group">
                             <button type="button" class="btn btn-block btn-success accion-agregar" name="accion" onclick="f.agregar()"  value="Agregar"> <i class="ti-plus"></i> Agregar</button>
                             </div>
                         </div>

                   </div>



                </div>
            </div>
        </div>
    </div>

</div>



<!-- FIN FORMULARIO -->

<!-- MODAL -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
     
          <form id="formulario">
            <table style="width:100%">
               
            <tr style="display:none"> 
                <td class="tdi">Id</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="id" name="id" title="Id" placeholder="Id" maxlength="11" value=""  class="no-modificable"/>
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Docente</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="hidden" name="id_persona" id="id_persona"
                           class="no-modificable" title="Persona">
                    <input type="text" name="persona_nombre" id="persona_nombre"
                           class="no-modificable" title="Persona">
                </td>            
            </tr> 
            <tr>
                <td class="tdi">Materia</td>
                <td class="tdc">:</td>
                <td class="tdd">
                	<select id="id_materia" name="id_materia" title="Materia">
                    	<?php llenar_combo("SELECT id, nombre FROM materias ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr> 
            <tr>
                <td class="tdi">Periodo</td>
                <td class="tdc">:</td>
                <td class="tdd">
                	<select id="id_periodo" name="id_periodo" title="Periodo">
                    	<?php llenar_combo("SELECT id, nombre FROM periodos ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr>
            </table>
          </form>

      </div>

      <div class="modal-footer">
          <div class="dlg-acciones">

             <button type="button" data-dismiss="modal" class="btn btn-danger btn-icon-text" style="margin-left:10px;float:right;">
             <i class="icon-close"></i>  Cancelar</button>             
             <button type="button" id="btn_aceptar" class="btn btn-success btn-icon-text" 
             style="margin-left:10px;float:right;"><i class="icon-plus"></i> Aceptar</button>

          </div>
      </div>


    </div>
  </div>
</div>
<!-- FIN MODAL -->

