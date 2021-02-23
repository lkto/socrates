<div class="container">
        <div id="div-tabla">
            <div class="row">
                <div class="col-12">
                    <h2 class="float-left">Registro Servicio</h2>
                <div>
                    <button id="btn-mostrar-formulario-agregar" class="btn btn-outline-success float-right"><i class="fas fa-user-plus "></i></button>
                </div>
            </div>
        </div>

        <div id="listado">
            // style="max-height: 500px; overflow-y:auto;"

        </div>
    </div>
   
        <div id="div-formulario" class="container mt-4" style="max-width:700px; display: none">
            <div class="card">
                <div class="card-header">
                    Agregar persona
                </div>

                <div class="card-body">
                    <form id="formulario" method="post" >
                        <input type="hidden" id="id" name="id" />
                        <div class="form-group row">
                            <label for="nombre" class="col-sm-3 col-form-label">Nombre</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="id_tipo_identificaciones" class="col-sm-3 col-form-label">vigencia</label>
                            <div class="col-sm-9">
                                <select class="form-control " id="vigencia" name="vigencia">
                                    <option value="">(Seleccionar vigencia)</option>
                                    <?php
                                    $sql1 = "SELECT * FROM vigencia ORDER BY fecha_inicial";
                                    $rs1 = mysqli_query($conn, $sql1);
                                    while ($rw1 = mysqli_fetch_assoc($rs1)) {

                                        echo "<option value='$rw1[id]'>$rw1[fecha_inicial]</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="perso" class="col-sm-3 col-form-label">Tipo identificación</label>
                            <div class="col-sm-9">
                                <select class="form-control " id="perso" name="perso">
                                    <option value="">(Seleccionar tipo de identificación)</option>
                                    <?php
                                    $sql1 = "SELECT id, CONCAT_WS('', gp.identifica, ' - ', gp.nombre1, ' ' , gp.nombre2, ' ', gp.apellido1, ' ', gp.apellido2) as nombres
                                    FROM
                            socrates.admin_usuario aus
                            JOIN general.persona gp ON aus.persona_id = gp.id
                            WHERE aus.rol IN (4,5)";
                                    $rs1 = mysqli_query($conn, $sql1);
                                    while ($rw1 = mysqli_fetch_assoc($rs1)) {

                                        echo "<option value='$rw1[id]'>$rw1[nombres]</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        
                        
                    </form>
                    <hr />

                    <div class="form-group row mb-0">
                        <div id="div-pb" class="col-sm-12 text-center" style="display: none">
                            <img src="img/pb.gif" />
                        </div>

                        <div id="div-btn" class="col-sm-12 text-right">
                            <input type="button" class="btn btn-success" id="btn-agregar" value="Guardar">
                            <input type="button" class="btn btn-success" id="btn-modificar" value="Modificar">
                            <input type="button" class="btn btn-secondary" id="btn-regresar" value="Regresar">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


<script>
    function cargar_tabla() {
        $("#listado").html('<div class="text-center"><img src="img/pb.gif"/></div>');
        //$("#listado").load("modulos/administracion/gestion_docentes/acciones2.php");

        $("#listado").load(page_root + 'listar');
    }

    function modificar(id) {
        
        $("#btn-agregar").hide(); 
        $("#btn-modificar").show();
        $("#div-formulario").show();
        //Limpiar el formulario
        $("#formulario").trigger("reset");
        var parametros = "id=" + id;
        $.get("asignar.php", parametros, function(respuesta) {
            var r = jQuery.parseJSON(respuesta);

            $("#div-tabla").hide();
        $("#div-formulario").show();
        $('#id_tipo_identificacion').val(r.tipo);
        $('#identificacion').val(r.identificacion);
        $('#id_municipio').val(r.mun);
            
            
            
            $("#nombre").val(r.nom);
            $("#apellido").val(r.apellido);
            $("#direccion_persona").val(r.direccion_persona);
            $("#telefono").val(r.telefono_persona);


            $("#direccion_servicio").val(r.direccion_servicio);
            $("#contrato").val(r.contrato);
              $('#id').val(r.id_persona);
            
        
            

        });
    }
    function eliminar(id) {

        if (confirm("¿Desea eliminar el registro?")) {
            var p = "id=" + id;
            $.post("eliminar.php", p, function(respuesta) {
                try {
                    var r = jQuery.parseJSON(respuesta);
                    if (r.error == true) {
                        $.notify({
                            message: r.msg
                        }, {
                            type: 'danger',
                            delay: 0
                        });
                    } else {
                        cargar_tabla();
                        $.notify({
                            message: r.msg
                        }, {
                            type: 'success',
                            delay: 0
                        });
                    }
                } catch (error) {
                    $.notify({
                        message: error + "<br/></br>" + respuesta
                    }, {
                        type: 'danger',
                        delay: 0
                    });
                }
            });
        }
    }

    cargar_tabla();

    $("#btn-mostrar-formulario-agregar").click(function() {
        $("#div-tabla").hide();
        $("#div-formulario").show();

        //Limpiar el formulario
        $("#formulario").trigger("reset");
        $("#btn-agregar").show();
        $("#btn-modificar").hide();

    });

    $("#btn-agregar").click(function() {
            $("#div-pb").show();
            $("#div-btn").hide();
            var parametros = $("#formulario").serialize();
            $.post(page_root + 'agregar', parametros, function(respuesta) {
                $("#div-pb").hide();
                $("#div-btn").show();
                alert(respuesta);
                
            });

        });


    $("#btn-modificar").click(function() {
        if (confirm("¿Desea modificar el registro?")) {
            $.notifyClose();
            $("#div-pb").show();
            $("#div-btn").hide();

            var parametros = $("#formulario").serialize();
            $.post("modificar.php", parametros, function(respuesta) {
                $("#div-pb").hide();
                $("#div-btn").show();


                try {
                    var r = jQuery.parseJSON(respuesta);


                    if (r.error == true) {
                        $.notify({
                            message: r.msg
                        }, {
                            type: 'danger',
                            delay: 0
                        });
                    } else {
                        cargar_tabla();

                        $("#div-tabla").show();
                        $("#div-formulario").hide();


                        $.notify({
                            message: r.msg
                        }, {
                            type: 'success',
                            delay: 0
                        });
                    }
                } catch (error) {
                    $.notify({
                        message: error + "<br/></br>" + respuesta
                    }, {
                        type: 'danger',
                        delay: 0
                    });
                }


            });
        }
    });

    $("#btn-regresar").click(function() {
        $("#div-tabla").show();
        $("#div-formulario").hide();
    });
</script>