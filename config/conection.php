<?php
$HOST = "localhost";
$USER = "root";
$PASSWORD = "";
$DATABSE = "apprender";

$mysqli = new mysqli($HOST, $USER, $PASSWORD, $DATABSE,);

if (!$mysqli) {
  echo 'Conexion Fallida', mysqli_connect_error();
} else {
  $select = mysqli_select_db($mysqli, $DATABSE);
}
