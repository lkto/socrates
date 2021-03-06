<!doctype html>
<html class="no-js " lang="es">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="SOCRATES">

<title>:: SOCRATES :: Iniciar Sesión</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Custom Css -->
<link rel="stylesheet" href="<?php echo WEB_ROOT ?>plantilla/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo WEB_ROOT ?>plantilla/assets/css/style.min.css">  


     <script type="text/javascript" >
      const menu = "<?php echo MENU ?>";
      const web_root = "<?php echo WEB_ROOT ?>";
      const page_root = "<?php echo PAGE_ROOT ?>";
    </script>


</head>

<body class="theme-blush">

<div class="authentication">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-sm-12">
                <form class="card auth_form" id="formulario"  autocomplete="off">
                    <div class="header">
                        <img class="logo" src="<?php echo WEB_ROOT ?>plantilla/assets/images/logo.png" alt="">
                        <h5>Log in</h5>
                    </div>
                    <div class="body">
                        <div class="input-group mb-3">
                            <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Ingrese Usuario" required autofocus autocomplete="off">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="zmdi zmdi-account-circle"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="clave" id="clave" class="form-control" placeholder="Ingrese Contraseña" required autocomplete="off">
                            <div class="input-group-append">                                
                                <span class="input-group-text"><i class="zmdi zmdi-lock"></i></span>
                            </div>                            
                        </div>

                        <div class="form-group">
                                 <div class="input-group">
                                    <div class="input-group-prepend" style="border: 1px solid #ddd;">
                                    <button class="btn btn-sm btn-outline-primary" type="button" disabled style="background: #fff;padding: 0px"><img src="captcha.php"></button>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese codigo de validación" name="validador" id="validador" maxlength="6" required autocomplete="off">
                                 </div>
                            </div>
                        
                        <button class="btn btn-primary btn-block waves-effect waves-light">Ingresar</button>                     
                    </div>
                </form>
                <div class="copyright text-center">
                    <?php echo VERSION ?>
                </div>
            </div>
            <div class="col-lg-8 col-sm-12">
                <div class="card">
                    <img src="<?php echo WEB_ROOT ?>plantilla/assets/images/signin.svg" alt="Sign In"/>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Jquery Core Js -->
<script src="<?php echo WEB_ROOT ?>plantilla/assets/bundles/libscripts.bundle.js"></script>
<script src="<?php echo WEB_ROOT ?>plantilla/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->


<script src="<?php echo WEB_ROOT ?>js/heaven/rollups/aes.js"></script>
<script type="text/javascript" src="<?php echo WEB_ROOT ?>js/heaven/efectos2.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css" id="theme-styles">
   


</body>
</html>