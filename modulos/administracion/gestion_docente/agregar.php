<?php

//require_once("conexion.php");

$user = $_POST['user'];
$tipoide = $_POST['tipoide'];
$identifica = $_POST['identifica'];
$apellido1 = $_POST['apellido1'];
$apellido2 = $_POST['apellido2'];
$nombre1 = $_POST['nombre1'];
$nombre2 = $_POST['nombre2'];
$correo = $_POST['correo'];
$clave = $_POST['clave'];
$clave2 = $_POST['clave2'];
$estado = $_POST['estado'];
$tipo_user = $_POST['tipo_user'];
$sexo_id = $_POST['sexo_id'];
$rol = 5;

$usuarios = $_SESSION['usuario'];
$fecha = date('Y-m-d H:i:s');


$errores = "";
$respuesta = [];

if ($user == "") {
    $errores .= "El campo 'Usuario' es obligatorio \n";
}

if ($tipoide == "") {
    $errores .= "El campo 'Tipo identificacion' es obligatorio \n";
}

if ($identifica == "") {
    $errores .= "El campo 'Identificacion' es obligatorio \n";
}

// if ($apellido1 == "") {
//     $errores .= "<li>El campo 'Primer apellido' es obligatorio</li>";
// }

// if ($apellido2 == "") {
//     $errores .= "<li>El campo 'Segundo apellido' es obligatorio</li>";
// }

// if ($nombre1 == "") {
//     $errores .= "<li>El campo 'Primer nombre' es obligatorio</li>";
// }

// if ($nombre2 == "") {
//     $errores .= "<li>El campo 'Segundo nombre' es obligatorio</li>";
// }

// if ($correo == "") {
//     $errores .= "<li>El campo 'Correo' es obligatorio</li>";
// }

// if ($clave == "") {
//     $errores .= "<li>El campo 'Contraseña' es obligatorio</li>";
// }

// if ($clave2 == "") {
//     $errores .= "<li>El campo 'Repetir contraseña' es obligatorio</li>";
// }

if ($estado == "") {
    $errores .= "El campo 'Estado' es obligatorio \n";
}

if ($tipo_user == "") {
    $errores .= "El campo 'Tipo usuario' es obligatorio \n";
}

if ($sexo_id == "") {
    $errores .= "El campo 'Sexo' es obligatorio \n";
}



if ($errores != "") {
    $respuesta['error'] = true;
    $respuesta['msg'] = $errores;
    echo json_encode($respuesta);
    exit(0);
}

$sql="INSERT INTO general.persona (user, tipoide, identifica, apellido1, apellido2, nombre1, nombre2, correo, clave, clave2, estado, tipo_user, sexo_id) 
VALUES
('$user','$tipoide','$identifica', '$apellido1','$apellido2','$nombre1', '$nombre2','$correo','$clave', '$clave2','$estado','$tipo_user','$sexo_id') ";
if (mysqli_query($conn, $sql)) {
    $last_id = mysqli_insert_id($conn);
    $id_persona=$last_id;


    $sql1="INSERT INTO general.admin_usuario(persona_id,rol,_usuario,_fecha) VALUES('$id_persona','$rol','$usuarios','$fecha')";
mysqli_query($conn, $sql1);
}



                          


$respuesta = [];
if (mysqli_error($conn) == "") {
    $respuesta['error'] = false;
    $respuesta['msg'] = "Registro guardado con éxito.";
} else {
    $respuesta['error'] = true;
    $respuesta['msg'] = mysqli_error($conn);
}
echo json_encode($respuesta);