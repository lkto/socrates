<script type="text/javascript">

    
    function todos_los_roles() {
     if ($( "#rol_g").is( ":checked" )) { 
             $( ".rol_hijos").prop( "checked", true );
        }else{
             $( ".rol_hijos").prop( "checked", false );
        }
    }


    function set_ruta(argument) {
       var tabla = $("#tabla").val();      
        var padre = $("#menu_principal").val();
        if (padre==="") {
            $("#ruta").val("modulos/" + tabla);
        }else{
            $("#ruta").val("modulos/"+padre+'/'+tabla);
        }
    }

    function generar() {
        $.post(page_root + "generar", $("#f").values(), function(data) {
            try {
                var r = jQuery.parseJSON(data);
                alert(r.msg);
                if (r.error == false) {
                    //document.getElementById("f").reset();

                }
            } catch (ex) {
                alert(data);
            }
        });
    }

    function verificar() {

        $.post(page_root + "verificar", $("#f").values(), function(data) {
            $("#div-verificar").html(data);
        });

    }

    function seleccionar_tipo_acceso(v) {
        if (v == 7) {
            $("#div-roles").show();
        } else {
            $("#div-roles").hide();
        }

    }
</script>


        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">ASISTENTE DE CREACIÓN DE FORMULARIO LIBRE</h5>

                             <form id="f" class="ui-dialog-content ui-widget-content" style="padding: 10px">

        <div id="f1">
            <table style="width: 100%" class="table table-hover"> 

                <tr class='ui-widget-header'>
                    <th colspan="3">CONFIGURACIÓN</th>
                </tr>

                <tr>
                    <td class="tdi">Menú Padre</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <select id="menu_principal" name="menu_principal"  onchange="set_ruta()">
                            <?php
                            llenar_combo("SELECT menu, nombre FROM admin_menu WHERE ruta IS NULL ORDER BY nombre", true);
                            ?>
                        </select>
                    </td>  
                </tr>                


                <tr>
                    <td class="tdi">URL</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <input type="text" name="menu" id="menu" value=""  placeholder="Ingrese url sin espacio" onblur="verificar()"/>
                    </td>  
                </tr>    


                <tr>
                    <td class="tdi">Titulo Menú</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <input type="text" name="titulo_menu" id="titulo_menu" placeholder="Nombre del elemento en el menú" value=""/>
                    </td>  
                </tr>    

                <tr>
                    <td class="tdi">Titulo Formulario</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <input type="text" name="titulo_formulario" id="titulo" value=""/>
                    </td>  
                </tr>

                <tr>
                    <td class="tdi">Tipo de Acceso</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <select id="tipo_acceso" name="tipo_acceso" onchange="seleccionar_tipo_acceso(this.value);">
                            <?php
                            llenar_combo("SELECT codigo, descripcion FROM admin_acceso ", false, '7');
                            ?>
                        </select>
                    </td>  
                </tr>

                <tr>
                    <td class="tdi">Ruta</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <input type="text" name="ruta" id="ruta" value="" onblur="verificar()"/>
                    </td>  
                </tr>

                 <tr>
                    <td class="tdi">Descripción</td>
                    <td class="tdc">:</td>
                    <td class="tdd">
                        <textarea name="descripcion_menu" id="descripcion_menu" style="min-height: 100px">Permite...</textarea>
                    </td>  
                </tr>


            </table>
        </div>

        <div id="div-verificar">

        </div>

        <div id="div-roles" >
            <table style="width: 100%"> 
                <tr class='ui-widget-header'>
                    <th colspan="2"><input type='checkbox' id='rol_g' checked='checked' onchange="todos_los_roles()" />  AGREGAR PERMISOS PARA LOS SIGUIENTES ROLES</th>
                </tr>
            </table>
            <div style="overflow: auto; max-height: 120px">
                <table style="width: 100%"> 
                    <?php
                    $sql = "SELECT * FROM admin_rol ORDER BY nombre";
                    $rs = $db->query($sql);
                    while ($rw = $db->fetch_assoc($rs)) {
                        echo "<tr>";
                        echo "<td style='width:20px'>";
                        echo "<input class='rol_hijos' type='checkbox' name='rol[{$rw[id]}]' id='rol_{$rw[id]}' checked='checked' value='S' />";
                        echo "</td>";
                        echo "<td>";
                        echo "<label for='rol_{$rw[id]}'>$rw[nombre]</label>";
                        echo "</td>";
                        echo "</tr>";
                    }
                    ?>

                </table>
            </div>
        </div>



        <table style="width: 100%; border-collapse: collapse"> 
            <tr class='ui-widget-header'>
                <th style="text-align: left; width: 50px">NO</th>
                <th style="text-align: left">NOMBRE CAMPO</th>
                <th style="text-align: left">TITULO</th>
                <th style="text-align: left">TIPO DE OBJETO</th>
                <th style="text-align: center">OBLIGATORIO</th>
                <th style="text-align: center">LONGITUD</th>
            </tr>
            <?php for ($i = 1; $i <= 10; $i++) { ?>
                <tr>
                    <td><?php echo $i ?></td>
                    <td>
                        <input type="text" name="campo[<?php echo $i ?>]" style="width: 120px"/>
                    </td>

                    <td>
                        <input type="text" name="titulo[<?php echo $i ?>]" style="width: 220px"/>
                    </td>

                    <td>
                        <select name="tipo[<?php echo $i ?>]"  style="width: 120px">
                            <option value="t">Texto</option>
                            <option value="c">Combo</option>
                        </select>
                    </td>

                    <td style="text-align: center">
                        <input type="checkbox" name="obligatorio[<?php echo $i ?>]"  value="S"/>
                    </td>

                    <td style="text-align: center">
                        <input type="text" name="longitud[<?php echo $i ?>]" 
                               style="width: 50px; text-align: center" value="30"/>
                    </td>                

                </tr>           

            <?php } ?>
        </table>        

        <br/><br/>

        <table style="width: 100%; border-collapse: collapse"> 
            <tr class='ui-widget-header'>
                <th style="text-align: left; width: 50px">NO</th>
                <th style="text-align: left">ACCIÓN</th>
                <th style="text-align: left">TIPO</th>
                <th style="text-align: left">DESCRIPCIÓN</th>
            </tr>
            <?php
            for ($i = 1; $i <= 10; $i++) {
                $acc = ($i == 1) ? "Aceptar" : "";
                ?>
                <tr>
                    <td><?php echo $i ?></td>
                    <td>
                        <input type="text" name="accion[<?php echo $i ?>]" 
                               value="<?php echo $acc ?>" style="width: 300px"/>
                    </td>

                    <td>
                        <select name="tipo_accion[<?php echo $i ?>]"  style="width: 200px">
                            <?php llenar_combo("SELECT codigo, codigo FROM  admin_tipo_accion ORDER BY codigo", false, "json") ?>
                        </select>
                    </td>

                    <td>
                        <input type="text" name="descripcion[<?php echo $i ?>]" 
                               value="<?php echo $acc ?>" style="width: 300px"/>
                    </td>

                </tr>           

            <?php } ?>
        </table>          

    </form>

    <div class="acciones" style="margin-top:10px">
        <input type="button" name="accion" value="Limpiar" onclick="$('#f').get(0).reset()" class="btn btn-block btn-warning" style="margin-top:5px;margin-left:10px;width:80px;float:right"/>
        <input type="button" name="accion" value="Generar" onclick="generar()" class="btn btn-block btn-success" style="margin-left:10px;width:80px;float:right"/>
    </div>
 
                        </div>
                    </div>

                </div>
            </div>

        </div>

   


