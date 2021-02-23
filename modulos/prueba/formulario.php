<script type="text/javascript">
function ver() {
    $(".cargar").css({"display":"none","font-size":"100"});
    $(".acciones").css({"display":"block","font-size":"100"});
}


$(function(){
    
    $(".cargar").css({"display":"none","font-size":"100"});  
    $("#formulario").submit(function(){
        $.ajax({
                url:page_root + "aceptar",
                type: "POST",
                dataType: "JSON",
                data: $("#formulario").serialize(),
        beforeSend: function(){
                $(".cargar").css({"display":"block","font-size":"100"});
                $(".acciones").css({"display":"none","font-size":"100"});
            },
        success: function(data){            
            var r = data;
            if (r.error == true)
            {
                for (ind in r.bad_fields)
                {
                    $("#" + r.bad_fields[ind]).addClass("error");
                }
                msg($(".respuesta"),r.msg,"error");
                ver();
            } else
            {
                msg($(".respuesta"),r.msg,"exito");
                ver();
            }
        },
        error: function(msg) {
               msg($(".respuesta"),"Erro desconocido.","error");
               ver();
            }
        });
        return false;
    })

 })


</script>

<div class="col-md-12 grid-margin stretch-card">
              <div class="card position-relative">
                <div class="card-body">



    <form id="formulario" method="POST" class="form-horizontal" style="margin:auto;width:95%">
    <div class="box-body">
        <table style="width:100%">
 

            <tr> 
                <td class="tdi">xxx</td>
                <td class="tdc">:</td>
                <td class="tdd">
                    <input type="text" name="xxx" id="xxx"  value="" title="xxx" placeholder="xxx" maxlength="30" required/>
                </td>            
            </tr>


    </table>

    <div class="error"></div>
    <div class="cargar" style="float:right;">  <img src="img/loader.gif" class="img-responsive"></div>
    <div class="box-footer">
		<button type="submit" name="accion" value="Aceptar" class="btn btn-success btn-icon-text accion-Aceptar" style="float:right;"><i class="icon-check"></i> Aceptar</button>

    </div>
    </div>
    <div class="respuesta" style="margin-top:0px"><i class="textomsg"></i></div>
</form>




                </div>
              </div>
            </div>