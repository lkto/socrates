<script type="text/javascript">
    function aceptar()
    {
        $.post(page_root + "aceptar", $("#formulario").values(), function(data) {
            var r = jQuery.parseJSON(data);
            if (r.error == true)
            {
                for (ind in r.bad_fields)
                {
                    $("#" + r.bad_fields[ind]).addClass("error");
                }
                alert(r.msg);
            } else
            {
                alert("No hay errores de validación");
            }
        });
    }


    function ver2()
    {
        $.post(page_root + "ver2", $("#formulario").values(), function(data) {
            var r = jQuery.parseJSON(data);
            if (r.error == true)
            {
                for (ind in r.bad_fields)
                {
                    $("#" + r.bad_fields[ind]).addClass("error");
                }
                alert(r.msg);
            } else
            {
                alert("No hay errores de validación");
            }
        });
    }


</script>

<div  style="width:600px; margin:auto; margin-top:20px">
    <form id="formulario" method="post" action="<?php echo PAGE_ROOT . "mostrar" ?>">
        <table style="width:100%">

            <tr  class="ui-state-active" style="height:24px">
                <th colspan="3">Titulo Formulario libre</th>
            </tr>


            <tr> 
                <td class="tdi">Nombre</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" name="nombre" id="nombre"  value="" title="Nombre" maxlength="30"/>
                </td>            
            </tr>

            <tr> 
                <td class="tdi">Nacimiento</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" name="nacimiento" id="nacimiento"  value="" title="Nacimiento" maxlength="30"/>
                </td>            
            </tr>


        </table>

        <div class="error"></div>
        <div class="dlg-acciones">
            <input type="submit" name="accion" value="Mostrar" onclick="mostrar()" class="accion-mostrar" />
        </div>

    </form>
</div>
