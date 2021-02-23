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
                                                {display: 'USUARIO', name: 'user', width: 100, align: 'left'}, 
                        {display: 'IDENTIFICACION', name: 'identifica', width: 100, align: 'left'}, 
                        {display: 'PRIMER APELLIDO', name: 'apellido1', width: 100, align: 'left'}, 
                        {display: 'SEGUNDO APELLIDO', name: 'apellido2', width: 100, align: 'left'}, 
                        {display: 'PRIMER NOMBRE', name: 'nombre1', width: 100, align: 'left'}, 
                        {display: 'SEGUNDO NOMBRE', name: 'nombre2', width: 100, align: 'left'}, 
                        {display: 'ACCIONES', name: 'btn', width: 120, align: 'left'}
                    ]}
        );
        f = new formulario(true,650);
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
                                         <span>GESTION MAESTROS</span> 
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
                <td class="tdi">Usuario</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="buser" name="user" title="Usuario" placeholder="User" maxlength="45" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Identificacion</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bidentifica" name="identifica" title="Identificacion" placeholder="Identificacion" maxlength="20" value="" />
                </td>            
            </tr> 
            
            <tr> 
                <td class="tdi">Primer apellido</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bapellido1" name="apellido1" title="Primer apellido" placeholder="Primer apellido" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Segundo apellido</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bapellido2" name="apellido2" title="Segundo apellido" placeholder="Segundo apellido" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Primer nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bnombre1" name="nombre1" title="Primer nombre" placeholder="Primer nombre" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Segundo nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="bnombre2" name="nombre2" title="Segundo nombre" placeholder="Segundo nombre" maxlength="80" value="" />
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
                             <button type="button" id="esconder" class="btn btn-block btn-success accion-agregar" name="accion" onclick="f.agregar()"  value="Agregar"> <i class="ti-plus"></i> Agregar</button>
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
                <td class="tdi">Usuario</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="user" name="user" title="Usuario" placeholder="Usuario" maxlength="45" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Identificacion</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="identifica" name="identifica" title="Identificacion" placeholder="Identificacion" maxlength="20" value="" />
                </td>            
            </tr> 
            <tr>
                <td class="tdi">Tipo identificacion</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="tipoide" name="tipoide" title="Tipo identificacion">
                        <?php llenar_combo("SELECT id, nombre FROM general.tipo_documento ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr>
            <tr> 
                <td class="tdi">Primer apellido</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="apellido1" name="apellido1" title="Primer apellido" placeholder="Primer apellido" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Segundo apellido</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="apellido2" name="apellido2" title="Segundo apellido" placeholder="Segundo apellido" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Primer nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="nombre1" name="nombre1" title="Primer nombre" placeholder="Primer nombre" maxlength="80" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Segundo nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="nombre2" name="nombre2" title="Segundo nombre" placeholder="Segundo nombre" maxlength="80" value="" />
                </td>            
            </tr>

            <tr>
                <td class="tdi">Sexo</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="sexo_id" name="sexo_id" title="Sexo">
                        <?php llenar_combo("SELECT id, nombre FROM general.sexo ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr>

            <tr> 
                <td class="tdi">Correo</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="correo" name="correo" title="Correo" placeholder="Correo" maxlength="145" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Contraseña</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="clave" name="clave" title="Contraseña" placeholder="Contraseña" maxlength="40" value="" />
                </td>            
            </tr>
            <tr> 
                <td class="tdi">Repetir contraseña</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" id="clave2" name="clave2" title="Repetir contraseña" placeholder="Repetir contraseña" maxlength="50" value="" />
                </td>            
            </tr> 
            <!-- <tr>
                <td class="tdi">Estado</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="estado" name="estado" title="Estado">
                        <?php llenar_combo("SELECT id, nombre FROM general.estado ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr> -->
            <!-- <tr> 
                <td class="tdi">Fecha</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="date" id="fecha" name="fecha" title="Fecha" placeholder="Fecha" maxlength="10" value="" />
                </td>            
            </tr> -->

            
            <!-- <tr> 
                <td class="tdi">Foto</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="file" type="file" name="foto" id="foto" accept="image/*" class="form-control" />
                    <input type="text" id="foto" name="foto" title="Foto" placeholder="Foto" maxlength="100" value="" />
                </td>            
            </tr> -->
            <!-- <tr> 
                <td class="tdi">Firma</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="file" type="file" name="firma" id="firma" accept="image/*" class="form-control" />
                    <input type="text" id="firma" name="firma" title="Firma" placeholder="Firma" maxlength="100" value="" />
                </td>            
            </tr>  -->
            <!-- <tr>
                <td class="tdi">Tipo usuario</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="tipo_user" name="tipo_user" title="Tipo usuario">
                        <?php llenar_combo("SELECT id, nombre FROM general.tipo_usuario ORDER BY nombre",true); ?>
                    </select>                
                </td>
            </tr>  -->
            
            </table>
          </form>

      </div>

      <div class="modal-footer">
          <div class="dlg-acciones">

             <button type="button" data-dismiss="modal" id="cancelas" class="btn btn-danger btn-icon-text" style="margin-left:10px;float:right;">
             <i class="icon-close"></i>  Cancelar</button>             
             <button type="button" id="btn_aceptar" class="btn btn-success btn-icon-text" 
             style="margin-left:10px;float:right;"><i class="icon-plus"></i> Aceptar</button>
          </div>
      </div>


    </div>
  </div>
</div>
<!-- FIN MODAL -->