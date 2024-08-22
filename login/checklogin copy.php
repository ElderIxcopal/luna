<?php
// Iniciar una sesión para guardar las cookies
session_start();

// Realizar la conexión a la base de datos
require_once('../conectarbbdd.php');

// Recoger los valores de username y password
$username = $_POST['correo'];
$password = $_POST['contrasena'];

// Realizar el query (utilizando consulta preparada)
$qry = "SELECT * FROM `usuarios` WHERE `correo` = ? AND `contrasena` = ?";
$stmt = $conn->prepare($qry);
$stmt->bind_param("ss", $username, $password);
$stmt->execute();
$result = $stmt->get_result();

// Comprobar si se ha obtenido algún resultado
if ($result->num_rows == 1) {
    $usuarios = $result->fetch_assoc();

    // Crear la sesión (cookie) para guardar los datos
    session_regenerate_id();

    $_SESSION['SESS_MEMBER_ID'] = $usuarios['id'];
    $_SESSION['SESS_USERNAME'] = $usuarios['correo'];
    $_SESSION['SESS_PASSWORD'] = $usuarios['contrasena'];
    $_SESSION['SESS_NAME'] = $usuarios['nombreU'];
    $_SESSION['NOTIFICACIONES'] = $usuarios['comentarios'];

    // Cargar todos los tipos de permisos
    $options2 = array();
    $sqltipoperm = "SELECT * FROM `permisos`";
    $resultipo = $conn->query($sqltipoperm);

    while ($tpermiso = $resultipo->fetch_assoc()) {
        $options2[] = $tpermiso['tablaPermiso'];
        $_SESSION[$tpermiso['tipoPermiso']] = 0;
    }

    // Cargar permisos del usuario
    $sqlperm = "SELECT * FROM `permisos` WHERE `idUsuarios` = ?";
    $stmt_perm = $conn->prepare($sqlperm);
    $stmt_perm->bind_param("i", $usuarios['id']);
    $stmt_perm->execute();
    $resulperm = $stmt_perm->get_result();

    while ($usuarios = $resulperm->fetch_assoc()) {
        $_SESSION[$options2[$usuarios['tipoPermiso'] - 1]] = 1;
    }

    // Finalizar la sesión de creación de cookies
    session_write_close();

    // Si se ha iniciado sesión correctamente, redirigir a la página index
    header("location: ../index.php");
    exit();
} else {
    // Si el inicio de sesión falla, redirigir de nuevo a la página de inicio de sesión
    header("location: login.php");
    exit();
}
?>
