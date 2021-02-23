 <script type="text/javascript">
   
   function ajax_reportrange(inicio,fin) {
       $.ajax({
           url: page_root+'cargar',
           type: 'POST',
           dataType: 'json',
           data: {inicio: inicio,fin:fin},
       })
       .done(function(r) {
           $("#tabla_resumen").html(r.tabla_resumen);
       });
       
   }


 </script>

  
  <div class="container-fluid">

            <div class="row">

                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="card-title mb-3">Usuarios</h6>
                                            <div class="d-flex d-sm-block d-lg-flex align-items-end">
                                                <h2 class="mb-0 mr-2 font-weight-bold">
                                                    <?php echo $db->select_one("SELECT count(*) as total FROM `admin_usuario`"); ?>
                                                </h2>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="avatar avatar-lg">
                                                <div class="avatar-title bg-success-bright text-success rounded-circle">
                                                    <i class="fa fa-users"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <h6 class="card-title mb-3">Roles</h6>
                                            <div class="d-flex d-sm-block d-lg-flex align-items-end">
                                                <h2 class="mb-0 mr-2 font-weight-bold">
                                                    <?php echo $db->select_one("SELECT count(*) as total FROM `admin_rol`"); ?>
                                                </h2>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="avatar avatar-lg">
                                                <div class="avatar-title bg-warning-bright text-warning rounded-circle">
                                                    <i class="fa fa-user"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title d-md-flex align-items-start justify-content-between">
                                        <h6 class="card-title">Detalles</h6>
                                        <div class="reportrange btn btn-outline-light btn-sm mt-3 mt-md-0">
                                            <i class="ti-calendar mr-2"></i>
                                            <span class="text"></span>
                                            <i class="ti-angle-down ml-2"></i>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            COMPORTAMIENTO MENSUAL
                                        </div>

                                        <div class="col-md-6">
                                            COMPORTAMIENTO ROLES
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12" id="tabla_resumen">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Rol</th>
                                                        <th>Usuario</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>data</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                 


                </div>
            </div>
        </div>