<script type="text/javascript">
    var grid;
    var f;

    $(document).ready(function(e) {
        grid = $.addGrid("#grid",
                {
                    url: page_root + 'listar',
                    height: 320,
                    dataType: 'json',
                    selectionMode: "single",
                    rowHeaderWidth: 1,
                    idName: "_id",
                    idField: "id",
                    recordPage: 50,
                    cols: [
                        {display: 'NO.', name: '_NUM_', width: 70, align: 'left'},
                        {display: 'DOCUMENTO', name: 'identifica', width: 130, align: 'left'},
                        {display: 'NOMBRE', name: 'nombre', width: 350, align: 'left'},
                        {display: 'ROL', name: 'rol', width: 180, align: 'left'}, 
                        {display: 'ACCIÓN', name: 'btn', width: 130, align: 'left'}
                    ]}
        );
        f = new formulario(true, 750);
        
        $("#persona_nombre").autocompletar2(page_root + "listarPersonas", {
            form: "formulario",
            inputId: "persona_id",
            minLength: 3});        
    });
</script>
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-body">
                           

    <div class="ui-state-active titulo-formulario">
        <div style="text-align:center; font-weight:bold; font-size:12pt"> 
            <span>USUARIOS</span> 
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
                <tr class="ui-widget-header">
                    <th colspan='3'>BUSQUEDA</th>
                </tr>

                <tr>
                    <td class="tdi">Rol</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <select id="brol" name="rol" title="Rol">
                            <?php llenar_combo("SELECT id, nombre FROM admin_rol ORDER BY nombre", true); ?>
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
                            style="width: 10%; margin-left: 90%;margin-top: 10px; margin-bottom: 10px;">
                             <div class="btn-group" role="group" aria-label="Third group">
                             <input type="button" name="accion" value="Agregar" onclick="f.agregar()" class="btn btn-block btn-success accion-agregar"/>
                             </div>
                         </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

   

<!-- FORMULARIO -->




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
            <tr> 
                <td class="tdi">Persona</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="hidden" name="persona_id" id="persona_id" 
                           class="no-modificable" title="Persona">
                    <input type="text" name="persona_nombre" id="persona_nombre" 
                           class="no-modificable" title="Persona">
                </td>            
            </tr>
            <tr>
                <td class="tdi">Rol</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="rol" name="rol" title="Rol">
                        <?php llenar_combo("SELECT id, nombre FROM admin_rol ORDER BY nombre", true); ?>
                    </select>                
                </td>
            </tr>

        </table>

    </form>
     
        
                        </div>
                        <div class="modal-footer">
                           <div class="dlg-acciones">

                            <button type="button" data-dismiss="modal" class="btn btn-danger btn-icon-text" style="margin-left:10px;float:right;">
                            <i class="icon-close"></i>  Cancelar
                            </button>

                             <button type="button" id="btn_aceptar" class="btn btn-success btn-icon-text accion-agregar" style="margin-left:10px;float:right;">
                             <i class="icon-plus"></i> Aceptar
                             </button>

                           </div>
                        </div>
                      </div>
                    </div>
                  </div>


