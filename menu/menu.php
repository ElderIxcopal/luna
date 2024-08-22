<?php

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['SESS_MEMBER_ID'])) {
    header("location: login.php");
    exit();
}

$base_url = '/luna/app/';

$menuItems = [
    'Crear' => [
        'Centro de Costo 1' => 'costo1s/nuevo.php',
        'Centro de Costo 2' => 'costo2s/nuevo.php',
        'Centro de Costo 3' => 'costo3s/nuevo.php',
        'Centro de Costo 4' => 'costo4s/nuevo.php',
        'Departamentos de Guatemala' => 'departamentos/nuevo.php',
        'Descansos' => 'descansos/nuevo.php',
        'Descuentos' => 'descuentos/nuevo.php',
        'Empleados' => 'empleados/nuevo.php',
        'Establecimientos SAT' => 'establecimientos/nuevo.php',
        'Estados Alta-Baja' => 'estados/nuevo.php',
        'Estudios' => 'estudios/nuevo.php',
        'Idiomas' => 'idiomas/nuevo.php',
        'Jefes' => 'jefes/nuevo.php',
        'Municipios de Guatemala' => 'municipios/nuevo.php',
        'Nacionalidades' => 'nacionalidades/nuevo.php',
        'Nominas' => 'nominas/nuevo.php',
        'Ocupaciones' => 'ocupaciones/nuevo.php',
        'Puestos' => 'puestos/nuevo.php',
        'Sueldos' => 'sueldos/nuevo.php',
        'Tipos de Descuentos' => 'tipos/nuevo.php',
        'Zonas Regiones o Territorios' => 'zonas/nuevo.php',

        // Agrega más opciones aquí
    ],
    'Buscar' => [
        'Centro de Costo 1' => 'costo1s/buscar.php',
        'Centro de Costo 2' => 'costo2s/buscar.php',
        'Centro de Costo 3' => 'costo3s/buscar.php',
        'Centro de Costo 4' => 'costo4s/buscar.php',
        'Departamentos de Guatemala' => 'departamentos/buscar.php',
        'Descansos' => 'descansos/buscar.php',
        'Descuentos' => 'descuentos/buscar.php',
        'Empleados' => 'empleados/buscar.php',
        'Establecimientos SAT' => 'establecimientos/buscar.php',
        'Estados Alta-Baja' => 'estados/buscar.php',
        'Estudios' => 'estudios/buscar.php',
        'Idiomas' => 'idiomas/buscar.php',
        'Jefes' => 'jefes/buscar.php',
        'Municipios de Guatemala' => 'municipios/buscar.php',
        'Nacionalidades' => 'nacionalidades/buscar.php',
        'Nominas' => 'nominas/buscar.php',
        'Ocupaciones' => 'ocupaciones/buscar.php',
        'Puestos' => 'puestos/buscar.php',
        'Sueldos' => 'sueldos/buscar.php',
        'Tipos de Descuentos' => 'tipos/buscar.php',
        'Zonas Regiones o Territorios' => 'zonas/buscar.php',

        // Agrega más opciones aquí
    ],
    'Importar' => [
        'Centro de Costo 1' => 'costo1s/importar.php',
        'Centro de Costo 2' => 'costo2s/importar.php',
        'Centro de Costo 3' => 'costo3s/importar.php',
        'Centro de Costo 4' => 'costo4s/importar.php',
        'Departamentos de Guatemala' => 'departamentos/importar.php',
        'Descansos' => 'descansos/importar.php',
        'Descuentos' => 'descuentos/importar.php',
        'Empleados' => 'empleados/importar.php',
        'Establecimientos SAT' => 'establecimientos/importar.php',
        'Estados Alta-Baja' => 'estados/importar.php',
        'Estudios' => 'estudios/importar.php',
        'Idiomas' => 'idiomas/importar.php',
        'Jefes' => 'jefes/importar.php',
        'Municipios de Guatemala' => 'municipios/importar.php',
        'Nacionalidades' => 'nacionalidades/importar.php',
        'Nominas' => 'nominas/importar.php',
        'Ocupaciones' => 'ocupaciones/importar.php',
        'Puestos' => 'puestos/importar.php',
        'Sueldos' => 'sueldos/importar.php',
        'Tipos de Descuentos' => 'tipos/importar.php',
        'Zonas Regiones o Territorios' => 'zonas/importar.php',
        // Agrega más opciones aquí
    ],

    'Exportar' => [
        'Centro de Costo 1' => 'costo1s/exportar.php',
        'Centro de Costo 2' => 'costo2s/exportar.php',
        'Centro de Costo 3' => 'costo3s/exportar.php',
        'Centro de Costo 4' => 'costo4s/exportar.php',
        'Departamentos de Guatemala' => 'departamentos/exportar.php',
        'Descansos' => 'descansos/exportar.php',
        'Descuentos' => 'descuentos/exportar.php',
        'Empleados' => 'empleados/exportar.php',
        'Establecimientos SAT' => 'establecimientos/exportar.php',
        'Estados Alta-Baja' => 'estados/exportar.php',
        'Estudios' => 'estudios/exportar.php',
        'Idiomas' => 'idiomas/exportar.php',
        'Jefes' => 'jefes/exportar.php',
        'Municipios de Guatemala' => 'municipios/exportar.php',
        'Nacionalidades' => 'nacionalidades/exportar.php',
        'Nominas' => 'nominas/exportar.php',
        'Ocupaciones' => 'ocupaciones/exportar.php',
        'Puestos' => 'puestos/exportar.php',
        'Sueldos' => 'sueldos/exportar.php',
        'Tipos de Descuentos' => 'tipos/exportar.php',
        'Zonas Regiones o Territorios' => 'zonas/exportar.php',
    ],
    'Reportes' => [
        'Centro de Costo 1' => 'costo1s/reportes.php',
        'Centro de Costo 2' => 'costo2s/reportes.php',
        'Centro de Costo 3' => 'costo3s/reportes.php',
        'Centro de Costo 4' => 'costo4s/reportes.php',
        'Departamentos de Guatemala' => 'departamentos/reportes.php',
        'Descansos' => 'descansos/reportes.php',
        'Descuentos' => 'descuentos/reportes.php',
        'Empleados' => 'empleados/exportar.php',
        'Establecimientos SAT' => 'establecimientos/reportes.php',
        'Estados Alta-Baja' => 'estados/reportes.php',
        'Estudios' => 'estudios/reportes.php',
        'Idiomas' => 'idiomas/reportes.php',
        'Jefes' => 'jefes/reportes.php',
        'Municipios de Guatemala' => 'municipios/reportes.php',
        'Nacionalidades' => 'nacionalidades/reportes.php',
        'Nominas' => 'nominas/reportes.php',
        'Ocupaciones' => 'ocupaciones/reportes.php',
        'Puestos' => 'puestos/reportes.php',
        'Sueldos' => 'sueldos/reportes.php',
        'Tipos de Descuentos' => 'tipos/reportes.php',
        'Zonas Regiones o Territorios' => 'zonas/reportes.php',
    ],
    'Operaciones' => [
        'Generar Pagos' => 'nominas/pagos.php',
    ],
    'Preferencias' => [
        'Cambiar Password' => $base_url . 'index.php',
        'Salir' => '../login/logout.php',
    ],
    // Agrega más categorías y opciones aquí
];

function tienePermiso($permisosUsuario, $rutaPermiso) {
    foreach ($permisosUsuario as $permiso) {
        if ($permiso['rutaPermiso'] == $rutaPermiso) {
            return true;
        }
    }
    return false;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Adaptado a Bootstrap</title>
    <!-- Agrega los enlaces a tus archivos CSS locales de Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <?php
                foreach ($menuItems as $label => $submenu) {
                    echo '<li class="nav-item dropdown">';
                    echo '<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . $label . '</a>';
                    echo '<ul class="dropdown-menu" aria-labelledby="navbarDropdown">';
                    foreach ($submenu as $itemLabel => $itemUrl) {
                        if (tienePermiso($_SESSION['PERMISOS'], $itemUrl)) {
                            echo '<li><a class="dropdown-item" href="' . $base_url . $itemUrl . '">' . $itemLabel . '</a></li>';
                        }
                    }
                    echo '</ul></li>';
                }
                ?>
            </ul>
        </div>
    </nav>

    <!-- Agrega los enlaces a tus archivos JS locales de Bootstrap -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
