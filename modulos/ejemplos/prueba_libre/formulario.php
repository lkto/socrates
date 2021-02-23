<script type="text/javascript">
  
$(function(){
    $("#formulario").submit(function(){
        var data = encriptar_form("formulario",TOKEN_GLOBAL);
        $.ajax({
                url:page_root + "aceptar",
                type: "POST",
                dataType: "JSON",
                data: data,
        beforeSend: function(xhr){
               xhr.setRequestHeader("Authorization",TOKEN_GLOBAL); 
               msg_cargando(true);
            },
        success: function(data){            
            var r = data;
            if (r.error == true)
            {
                for (ind in r.bad_fields)
                {
                    $("#" + r.bad_fields[ind]).addClass("error");
                }
                msg_cargando(false);
                msg($(".respuesta"),r.msg,"error");
                document.getElementById("formulario").reset();
            } else
            {
                msg_cargando(false);
                msg($(".respuesta"),r.msg,"exito");
            }
        },
        error: function(msg) {
               msg_cargando(false);
               msg($(".respuesta"),"Erro desconocido.","error");
            }
        });
        return false;
    })

 })

</script>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">

            <div class="card">
                <div class="card-body">
                    <form id="formulario" method="POST" class="form-horizontal" style="margin:auto;width:95%">

                          <table style="width:100%">                          
                             
            <tr> 
                <td class="tdi">a</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" encrypt="true" name="a" id="a"  value="" title="a" placeholder="a" maxlength="30" required/>
                </td>            
            </tr>

            <tr> 
                <td class="tdi">b</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <select id="b" name="b" title="b" required encrypt="true">
                        <?php
                        llenar_combo_encrypt("PONER_SQL_AQUI", true);
                        ?>
                    </select>
                </td>            
            </tr>                        
                            
                          
                          </table>
                          
                          <div class="cargando_libre"></div>
                          <div class="box-footer acciones" id="libre_acciones">
                             		<button type="submit" name="accion" value="Aceptar" class="btn btn-success btn-icon-text accion-Aceptar" style="float:right;"><i class="icon-check"></i> Aceptar</button>

                          </div>
                          <div class="respuesta" style="margin-top:70px"><i class="textomsg"></i></div>

                    </form>
                </div>
            </div>

        </div>
    </div>

</div>