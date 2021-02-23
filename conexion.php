<?php
$servidor = "127.0.0.1";
$usuario = "root";
$clave = "";
$basedato = "socrates";
$puerto = "3306";
$conn = mysqli_connect($servidor, $usuario, $clave, $basedato, $puerto);
$conn-> set_charset("utf8");