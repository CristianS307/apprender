<?php

function areNullFields($EMAIL, $PASSWORD)
{
  if (strlen(trim($EMAIL)) < 1 || strlen(trim($PASSWORD)) < 1) {
    return false;
  } else {
    return true;
  }
}

function isValidEmail($EMAIL)
{
  if (filter_var($EMAIL, FILTER_VALIDATE_EMAIL)) {
    return true;
  } else {
    return false;
  }
}

function setSessionValue($ID, $ROLE)
{
  $_SESSION['idUser'] = $ID;
  $_SESSION['role'] = $ROLE;
  header("Location: http://localhost/apprender/app/home/");
}

function showErrors($ERRORS, $BACKGROUND)
{
  $color = $BACKGROUND;
  echo '<ul class="alert alert-' . $color . '" style="list-style: none;"';
  foreach ($ERRORS as $error) {
    echo '<h6>' . $error . '</h6>';
  }
  echo '</ul> ';
}


function login($EMAIL, $PASS_LOGIN, $ROLE)
{

  global $mysqli;
  $stmt = $mysqli->prepare("SELECT `numDoc` ,`perfil`, `clave` FROM `tblusuario`  WHERE `correo` = ? LIMIT 1");
  $stmt->bind_param("s", $EMAIL);
  $stmt->execute();
  $stmt->store_result();
  
  $rows = $stmt->num_rows;
  if ($rows > 0) {  
    $stmt->bind_result($numDoc, $perfil, $clave);
    $stmt->fetch();
    if ($ROLE == $perfil) {
      $validatePassword = password_verify($PASS_LOGIN, $clave);
      if ($validatePassword) {
        session_start();
        setSessionValue($numDoc, $perfil);
      } else {
        $alerts = " La contrasena es incorrecta ";
      }
    } else {
      $alerts = " El perfil no corresponde a este usuario ";
    }
  } else {
    $alerts = " El usuario o email no existe";
  }

  return $alerts;
}
