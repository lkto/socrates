<?php

//require_once("conexion.php");

$id_vigencia = $_POST['id_vigencia'];
$id_persona = $_POST['id_persona'];
$nombre = $_POST['nombre'];



$errores = "";
$respuesta = [];

if ($id_vigencia == "") {
    $errores .= "El campo 'id_vigencia' es obligatorio";
}

if ($id_persona == "") {
    $errores .= "<li>El campo 'id_persona' es obligatorio</li>";
}

if ($nombre == "") {
    $errores .= "<li>El campo 'Nombre' es obligatorio</li>";
}



if ($errores != "") {
    $respuesta['error'] = true;
    $respuesta['msg'] = $errores;
    echo json_encode($respuesta);
    exit(0);
}

$sql="INSERT INTO areas (nombre, id_vigencia, id_persona) 
VALUES
('$nombre','$id_vigencia','$id_persona') ";
/*if (mysqli_query($conn, $sql)) {
    $last_id = mysqli_insert_id($conn);
    $id_persona=$last_id;


    $sql1="INSERT INTO areas(id_persona,direccion_servicio,contrato,id_municipio) VALUES('$id_persona','$direccion_servicio','$contrato','$id_municipio')";*/
mysqli_query($conn, $sql);
//}



                          


$respuesta = [];
if (mysqli_error($conn) == "") {
    $respuesta['error'] = false;
    $respuesta['msg'] = "Registro guardado con éxito.";
} else {
    $respuesta['error'] = true;
    $respuesta['msg'] = mysqli_error($conn);
}
echo json_encode($respuesta);