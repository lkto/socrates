<style>
    .ck-editor__editable_inline{
        height: 200px !important;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

            <div class="card">
                <div class="card-body">
                    <?php
                        $idMateria = null;
                        if(isset($_GET["materia"])){
                            $idMateria = $_GET["materia"];
                            $date = new DateTime('now');
                            $year = $date->format('Y');
                            $userId = $_SESSION['persona_id'];
                            $sqlPeriodo = "
                                        SELECT
                                            *
                                        FROM
                                            periodos
                                        WHERE
                                            periodos.nombre = $year
                            ";
                            $resultPeriodo = mysqli_query($conn, $sqlPeriodo);
                            if($resultPeriodo->num_rows > 0){
                                $row = mysqli_fetch_array($resultPeriodo);
                                $periodo = $row['id'];
                                $sql = "SELECT
                                            m.*,
                                            am.id as asignacion_materia_id
                                       FROM
                                            materias m
                                       INNER JOIN asignacion_materias am
                                       WHERE
                                        am.id_materia = m.id
                                        AND am.id_periodo = $periodo
                                        AND am.id_persona = $userId
                                        AND m.id = $idMateria";
                                $result = mysqli_query($conn, $sql);
                                if($result->num_rows > 0){
                                    $rowMateria = mysqli_fetch_array($result);
                                    $idArea = $rowMateria['areas'];
                                    $idAsignacionMateria = $rowMateria['asignacion_materia_id'];
                                    $sqlArea = "
                                        SELECT * 
                                        FROM areas
                                        WHERE areas.id = $idArea
                                    ";
                                    $resultArea = mysqli_query($conn, $sqlArea);
                                    $rowArea = mysqli_fetch_array($resultArea);
                                    $idJefeArea = $rowArea['id_persona'];
                                    $sqlJefeArea = "
                                        SELECT p.* 
                                        FROM general.persona p
                                        WHERE p.id = $idJefeArea
                                    ";
                                    $resultPersona = mysqli_query($conn, $sqlJefeArea);
                                    $rowPersona = mysqli_fetch_array($resultPersona);
                                    $idCurso = $rowMateria['curso'];
                                    $sqlCurso = "
                                        SELECT * 
                                        FROM cursos
                                        WHERE cursos.id = $idCurso
                                    ";
                                    $resultCurso = mysqli_query($conn, $sqlCurso);
                                    $rowCurso = mysqli_fetch_array($resultCurso);

                                    $sqlMasterRutaAcademica = "
                                        SELECT mra.* 
                                        FROM master_ruta_academica mra
                                        WHERE mra.id_asignacion_materia = $idAsignacionMateria
                                    ";
                                    $resultMasterRutaAcademica = mysqli_query($conn, $sqlMasterRutaAcademica);
                                    if($resultMasterRutaAcademica->num_rows > 0){
                                        $rowRutaAcademica = mysqli_fetch_array($resultMasterRutaAcademica);
                                    }else{
                                        $fechaActual = $date->format('Y-m-d H:i:s');
                                        $sqlInsertRutaAcademica = "
                                            INSERT INTO master_ruta_academica (id_asignacion_materia,status,observacion,fechar)
                                            VALUES($idAsignacionMateria,'1','', '$fechaActual')
                                        ";
                                        $resultInsert = mysqli_query($conn,$sqlInsertRutaAcademica );
                                        $sqlMasterRutaAcademica = "
                                            SELECT mra.* 
                                            FROM master_ruta_academica mra
                                            WHERE mra.id_asignacion_materia = $idAsignacionMateria
                                        ";
                                        $resultMasterRutaAcademica = mysqli_query($conn, $sqlMasterRutaAcademica);
                                        $rowRutaAcademica = mysqli_fetch_array($resultMasterRutaAcademica);
                                    }
                                    $idMasterRutaAcademica = $rowRutaAcademica['id'];
                                    $sqlRutaAcademicaItems = "
                                        SELECT
                                            ra.*,
                                            pe.nombre as periodo_escolar
                                        FROM
                                            ruta_academica ra
                                        INNER JOIN periodo_escolar pe
                                        WHERE
                                            ra.id_master_ruta_academica = $idMasterRutaAcademica AND
                                            pe.id = ra.id_periodo_escolar
                                        ORDER BY 
                                            ra.id_periodo_escolar ASC
                                    ";
                                    $resultRutaAcademica = mysqli_query($conn, $sqlRutaAcademicaItems);
                                    switch ($rowRutaAcademica['status']){
                                        case 1:
                                            $status = 'Creado';
                                            break;
                                        case 2:
                                            $status = 'Aprovado';
                                            break;
                                        case 3:
                                            $status = 'Rechazado';
                                            break;
                                    }
                                    ?>
                                    <div class="container-fluid row">
                                        <div class="col-md-6">
                                            <h4>Materia : <b><?php echo $rowMateria['nombre'] ?></b></h4>
                                            <h4>Curso : <b><?php echo $rowCurso['nombre'] ?></b></h4>
                                            <h4>Año lectivo : <b><?php echo $year ?></b></h4>
                                        </div>
                                        <div class="col-md-6">
                                            <h4>Area : <b><?php echo $rowArea['nombre'] ?></b></h4>
                                            <h4>Estado : <b><?php echo $status  ?></b></h4>
                                            <h4>Jefe de Area : <b><?php echo $rowPersona['nombre1'] ?> <?php echo $rowPersona['nombre2'] ?> <?php echo $rowPersona['apellido1'] ?> <?php echo $rowPersona['apellido2'] ?></b></h4>
                                        </div>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Third group">
                                        <button type="button" class="btn btn-block btn-success accion-agregar" name="accion"  value="Agregar" onclick="OpenModaCreate()"> <i class="ti-plus"></i> Agregar</button>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">Periodo</th>
                                            <th scope="col">Tema</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                        </thead>
                                        <tbody id="data_table">
                                        <?php
                                            while ($rw1 = mysqli_fetch_assoc($resultRutaAcademica)) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $rw1['periodo_escolar'] ?></td>
                                                    <td><?php echo $rw1['temas'] ?></td>
                                                    <td>
                                                        <ul class="nav align-items-center">
                                                        <?php
                                                        if ($rowRutaAcademica['status'] != 2)
                                                        {
                                                            ?>
                                                                <li class="mr-4 d-sm-inline d-none">
                                                                    <a href="#" title="" data-toggle="tooltip" data-original-title="Editar"  class="accion-modificar" onclick="edit('<?php echo  $rw1['id'] ?>')">
                                                                        <svg viewBox="0 0 24 24" width="24" height="24" stroke="#1565c0" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                                                    </a>
                                                                </li>

                                                                <li class="mr-4 d-sm-inline d-none">
                                                                    <a href="#" title="" data-toggle="tooltip" data-original-title="Eliminar"  class="accion-eliminar" onclick="eliminar('<?php echo  $rw1['id'] ?>')">
                                                                        <svg viewBox="0 0 24 24" width="24" height="24" stroke="#dc0606" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                                                    </a>
                                                                </li>
                                                            <?php
                                                        }
                                                        ?>
                                                            <li class="d-sm-inline d-none ">
                                                                <a href="#" class="accion-mostrar" title="" data-toggle="tooltip" data-original-title="Ver" onclick="show('<?php echo  $rw1['id'] ?>')">
                                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="#00c851" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>

                                                <?php
                                            }
                                        ?>
                                        </tbody>
                                    </table>
                                    <?php
                                }else{
                                    ?>
                                    <div class="alert alert-danger" role="alert">
                                        A ocurrido un error al procesar su solicitud
                                    </div>
                                    <?php
                                }
                            }else{
                                ?>
                                <div class="alert alert-danger" role="alert">
                                    A ocurrido un error al procesar su solicitud
                                </div>
                                <?php
                            }
                        }else{
                    ?>
                            <div class="alert alert-danger" role="alert">
                                A ocurrido un error al procesar su solicitud
                            </div>
                    <?php
                        }
                    ?>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- MODAL -->

<div class="modal fade" id="modalAddItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalTitle"></h5>
            </div>

            <div class="modal-body">
                <div class="alert alert-danger" role="alert" style="display: none" id="alert-error-modal">
                    Debe llenar todos los campos
                </div>
                <form id="formularioRutaAcademica">
                    <input type="hidden" name="master_id_ruta_academica" id="master_id_ruta_academica" value="<?php echo $rowRutaAcademica['id'] ?>" />
                    <input type="hidden" name="id_ruta_academica" id="id_ruta_academica" value="" />
                    <input type="hidden" name="action" id="action" value="" />
                    <table style="width:100%">
                        <tr>
                            <td class="tdi">Tema</td>
                            <td class="tdc">:</td>
                            <td class="tdd">
                                <textarea  id="tema" name="tema" title="Tema" placeholder="Tema" value="" style="height: 200px !important;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdi">Periodo</td>
                            <td class="tdc">:</td>
                            <td class="tdd">
                                <select id="periodo" name="periodo" title="Periodo">
                                    <?php llenar_combo("SELECT id, nombre FROM periodo_escolar ORDER BY id",true); ?>
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
                            style="margin-left:10px;float:right;" onclick="submitForm()"><i class="icon-plus" ></i> Aceptar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- FIN MODAL -->

<script>

    function OpenModaCreate(){
        $('#ModalTitle').html('Agregar ruta academica');
        $('#action').val('crear');
        CKEDITOR.instances['tema'].setReadOnly(false);
        CKEDITOR.instances['tema'].setData('');
        $('#periodo').prop( "disabled", false );
        $('#btn_aceptar').css('display', 'block');
        $('#modalAddItem').modal('show');
    }

    function submitForm(){
        var tema = CKEDITOR.instances['tema'].getData();
        var periodo = $('#periodo').val();
        if(tema == '' || periodo == ''){
            $('#alert-error-modal').css('display', 'block');
        }else{
            $('#alert-error-modal').css('display', 'none');
            $('#periodo').prop( "disabled", false );
            const form = $('#formularioRutaAcademica').serializeArray();
            const data = {
                'form': form,
                'tema': tema.trim()
            }

            $.ajax({
                url:page_root + "operaciones",
                type: "POST",
                dataType: "JSON",
                data: data,
                success: function(data){
                    alert(data.msg)
                    if(!data.error){
                        printTable();
                        $('#modalAddItem').modal('hide');
                    }
                }
            })
        }
    }

    function getData(idRutaAcademica) {
        const data = {
            'id_ruta_academica': idRutaAcademica
        }

        $.ajax({
            url:page_root + "getData",
            type: "POST",
            dataType: "JSON",
            data: data,
            success: function(data){
                if(data.data.length == 0){
                    alert('Ocurrio un error al procesar la solicitud')
                }else{
                    const info = data.data[0];
                    console.log(info)
                    CKEDITOR.instances['tema'].setData(info.temas);
                    $('#periodo').val(info.id_periodo_escolar);
                    $('#id_ruta_academica').val(info.id);
                    $('#modalAddItem').modal('show');
                }
            }
        })
    }

    function show(idRutaAcademica) {
        getData(idRutaAcademica)
        CKEDITOR.instances['tema'].setReadOnly(true);
        $('#periodo').prop( "disabled", true );
        $('#btn_aceptar').css('display', 'none');
        $('#ModalTitle').html('Ruta academica');
    }

    function edit(idRutaAcademica) {
        getData(idRutaAcademica)
        $('#ModalTitle').html('Editar ruta academica');
        $('#action').val('editar');
        CKEDITOR.instances['tema'].setReadOnly(false);
        $('#periodo').prop( "disabled", false );
        $('#btn_aceptar').css('display', 'block');
        $('#modalAddItem').modal('show');
    }

    function eliminar(idRutaAcademica) {
        getData(idRutaAcademica)
        CKEDITOR.instances['tema'].setReadOnly(true);
        $('#periodo').prop( "disabled", true );
        $('#btn_aceptar').css('display', 'block');
        $('#ModalTitle').html('Eliminar');
        $('#action').val('eliminar');
    }

    function printTable(){
        const idMasterRutaAcademica = "<?php echo $rowRutaAcademica['id']; ?>";
        const data = {
            'id_master_ruta_academica': idMasterRutaAcademica
        }

        $.ajax({
            url:page_root + "listar",
            type: "POST",
            dataType: "JSON",
            data: data,
            success: function(data){
                let info = '';
                for (let i = 0; i < data.data.length; i++){
                    const item = data.data[i];
                    info = info + '<tr>';
                    info = info + '<td>' + item.periodo + '</td>';
                    info = info + '<td>' + item.temas + '</td>';
                    info = info + '<td> <ul class="nav align-items-center">';

                    info = info + '<li class="mr-4 d-sm-inline d-none">';
                    info = info + '<a href="#" title="" data-toggle="tooltip" data-original-title="Editar"  class="accion-modificar" onclick="edit('+ item.id +')">';
                    info = info + '<svg viewBox="0 0 24 24" width="24" height="24" stroke="#1565c0" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>';
                    info = info + '</a>';
                    info = info + '</li>';

                    info = info + '<li class="mr-4 d-sm-inline d-none">';
                    info = info + '<a href="#" title="" data-toggle="tooltip" data-original-title="Eliminar"  class="accion-eliminar" onclick="eliminar('+ item.id +')">';
                    info = info + '<svg viewBox="0 0 24 24" width="24" height="24" stroke="#dc0606" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>'
                    info = info + '</a>';
                    info = info + '</li>';

                    info = info + '<li class="d-sm-inline d-none ">';
                    info = info + '<a href="#" class="accion-mostrar" title="" data-toggle="tooltip" data-original-title="Ver" onclick="show('+ item.id +')">';
                    info = info + '<svg viewBox="0 0 24 24" width="24" height="24" stroke="#00c851" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>';
                    info = info + '</a>';
                    info = info + '</li>';

                    info = info + '</ul>';
                    info = info + '</td>';
                    info = info + '</tr>';
                }

                $('#data_table').html(
                    info
                );
            }
        })
    }

    CKEDITOR.replace( 'tema' );
</script>