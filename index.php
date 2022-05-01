<?php
require_once 'config/conection.php';
require_once 'modules/login.php';
session_start();
echo $_SESSION['idUser'];
// $clave = "AlbertoM30";
// $hash = password_hash($clave, PASSWORD_DEFAULT);
// echo ($hash);

$alerts = array();
if (!empty($_POST)) {
  $email = $mysqli->real_escape_string($_POST['email']);
  $password = $mysqli->real_escape_string($_POST['password']);
  $role = $mysqli->real_escape_string($_POST['role']);


  if (areNullFields($email, $password) == false) {
    $alerts[] = "Debe llenar todos los campos";
  }
  if (isValidEmail($email) == false) {
    $alerts[] = "Email ingresado no es valido";
  }
  if (count($alerts) == 0) {
    
    $alerts[] = login($email, $password, $role);
  } else {
    $alerts[] = "Error del login";
  }
  
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Aprender</title>
  <link rel="stylesheet" href="./styles/start.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <div class="container">

    <div class="main__form">
      <h1 class="text-center text-light pt-4">Bienvenido a Apprender</h1>
      <form class="p-5" role="form" action="<?PHP $_SERVER['PHP_SELF'] ?>" method="POST">

        <div class="mb-3">
          <h4 class=" text-light fw-bold">Como deseas ingresar?</h4>
          <select id="disabledSelect" class="form-select" name="role" required>
            <option value="">Selecciona Tu Perfil</option>
            <option value="1">Estudiante</option>
            <option value="2">Profesor</option>
            <option value="3">Administrador</option>
          </select>
        </div>

        <div class="mb-3">
          <h5 class="fw-bold text-light">Coreo Electronico</h5>
          <input type="email" class="form-control" name="email" id="email" placeholder="Ingresa tu email" required>
        </div>

        <div class="mb-3">
          <h5 class="fw-bold text-light">Contraseña</h5>
          <input type="password" class="form-control" name="password" id="PASSWORD" placeholder="Digita tu contraseña" required>
        </div>

        <p class="text-center mb-3">
          <button type="submit" class="form_button">Submit</button>
        </p>

        <?php
        if (count($alerts) > 0) {
          $background = "danger";
          echo showErrors($alerts, $background);
        }
        ?>

      </form>

    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>