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
                        {display: 'NO.', name: '_NUM_', width: 40, align: 'left'},
                        {display: 'MENU', name: 'menu', width: 160, align: 'left'}, 
                        {display: 'PADRE', name: 'padre', width: 160, align: 'left'}, 
                        {display: 'NOMBRE', name: 'nombre', width: 160, align: 'left'}, 
                        {display: 'ORDEN', name: 'orden', width: 80, align: 'left'}, 
                        {display: 'ACCIÓN', name: 'btn', width: 130, align: 'left'}
                    ]}
        );
        f = new formulario(true,850);
        setTimeout(function() { $('[data-toggle="tooltip"]').tooltip({ container: 'body' }); }, 1000);
         
    });
</script>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                
                   <div style="width: 90%;margin:auto">       
                      
    <div class="ui-state-active titulo-formulario">
        <div style="text-align:center; font-weight:bold; font-size:12pt"> 
            <span>ADMIN MENU</span> 
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
                <td class="tdi">Menu</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bmenu" name="menu" title="Menu" maxlength="100" value="" />
                </td>            
            </tr> 
            <tr>
                <td class="tdi">Padre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="bpadre" name="padre" title="Padre">
                        <?php llenar_combo("SELECT menu, menu FROM admin_menu ORDER BY menu",true); ?>
                    </select>                
                </td>
            </tr>
            <tr> 
                <td class="tdi">Nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bnombre" name="nombre" title="Nombre" maxlength="50" value="" />
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

</div>





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
                    <input type="text" id="id" name="id" title="Id" maxlength="11" value=""  class="no-modificable"/>
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Menu</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="menu" name="menu" title="Menu" maxlength="100" value="" />
                </td>            
            </tr> 
            <tr>
                <td class="tdi">Padre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="padre" name="padre" title="Padre">
                        <?php llenar_combo("SELECT menu, menu FROM admin_menu ORDER BY menu",true); ?>
                    </select>                
                </td>
            </tr>
            <tr> 
                <td class="tdi">Nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="nombre" name="nombre" title="Nombre" maxlength="50" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Ruta</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="ruta" name="ruta" title="Ruta" maxlength="100" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Accion</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="accion" name="accion" title="Accion" maxlength="60" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Orden</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="orden" name="orden" title="Orden" maxlength="6" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Visible</td>
                <td class="tdc">:</td>
                <td class="tdd">
                     <select id="visible" name="visible" title="Visible">
                        <option></option>
                        <option value="S">Si</option>
                        <option value="N">No</option>
                    </select>
                </td>            
            </tr> 
            <tr>
                <td class="tdi">Acceso</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="acceso" name="acceso" title="Acceso">
                        <?php llenar_combo("SELECT codigo, descripcion FROM admin_acceso ORDER BY descripcion",true); ?>
                    </select>                
                </td>
            </tr>
            <tr> 
                <td class="tdi">Target</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="target" name="target" title="Target" maxlength="49" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Icono</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="icono" name="icono" title="Icono" maxlength="200" value="" />
                </td>            
            </tr>

            
            <tr> 
                <td class="tdi">Descripción</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <textarea name="descripcion" id="descripcion"></textarea>
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