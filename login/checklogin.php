<?php
// Iniciar una sesión para guardar las cookies
session_start();

// Realizar la conexión a la base de datos
require_once('../conectarbbdd.php');

// Recoger los valores de username y password
$username = $_POST['usuario'];
$password = $_POST['contrasena'];

// Realizar el query (utilizando consulta preparada)
$qry = "SELECT * FROM `usuarios` WHERE `usuario` = ? AND `contrasena` = ?";
$stmt = $conn->prepare($qry);

// Verificar si hubo un error en la preparación de la consulta
if (!$stmt) {
    die("Error en la preparación de la consulta: " . $conn->error);
}

$stmt->bind_param("ss", $username, $password);
$stmt->execute();
$result = $stmt->get_result();

// Comprobar si se ha obtenido algún resultado
if ($result->num_rows == 1) {
    $usuarios = $result->fetch_assoc();

    // Crear la sesión (cookie) para guardar los datos
    session_regenerate_id();

    $_SESSION['SESS_MEMBER_ID'] = $usuarios['id'];
    $_SESSION['SESS_USERNAME'] = $usuarios['usuario'];
    $_SESSION['SESS_PASSWORD'] = $usuarios['contrasena'];
    $_SESSION['SESS_NAME'] = $usuarios['nombreUsuario'];
    $_SESSION['NOTIFICACIONES'] = $usuarios['comentarios'];

    // Cargar permisos del usuario
    $sqlperm = "SELECT * FROM `permisos` WHERE `idUsuario` = ?";
    $stmt_perm = $conn->prepare($sqlperm);
    $stmt_perm->bind_param("i", $usuarios['id']);
    $stmt_perm->execute();
    $resulperm = $stmt_perm->get_result();

    // Crear un array para almacenar los permisos
    $permisosUsuario = array();

    while ($permisoUsuario = $resulperm->fetch_assoc()) {
        // Almacena los permisos en el array
        $permisosUsuario[] = array(
            'tablaPermiso' => $permisoUsuario['tablaPermiso'],
            'rutaPermiso' => $permisoUsuario['rutaPermiso']
        );
    }

    // Almacena los permisos en la sesión
    $_SESSION['PERMISOS'] = $permisosUsuario;

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
