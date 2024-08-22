<?php
require_once('../../login/comprobarweb.php');
require_once('../../vendor/autoload.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include("../../conectarbbdd.php");
include("../../menu/menu.php");

use PhpOffice\PhpSpreadsheet\IOFactory;

function convertirFechaSerialExcelAMySQL($fecha_serial) {
    if (is_numeric($fecha_serial)) {
        $fecha_base = new DateTime('1899-12-30');
        $fecha = $fecha_base->modify('+' . intval($fecha_serial) . ' days');
        return $fecha->format('Y-m-d');
    }
    return null;
}

function manejarFechaVacia($fecha) {
    return !empty($fecha) ? convertirFechaSerialExcelAMySQL($fecha) : null;
}

if (isset($_POST['show_data'])) {
    $file = $_FILES['file_empleados']['tmp_name'];

    if ($file) {
        try {
            $spreadsheet = IOFactory::load($file);
            $worksheet = $spreadsheet->getActiveSheet();

            $_SESSION['import_data'] = [];

            $row_index = 0;
            foreach ($worksheet->getRowIterator() as $row) {
                $row_index++;
                if ($row_index == 1) continue;

                $cellIterator = $row->getCellIterator();
                $cellIterator->setIterateOnlyExistingCells(false);

                $data = [];
                foreach ($cellIterator as $cell) {
                    $data[] = $cell->getValue();
                }

                if (count($data) >= 7) {
                    $fecha_ingreso_mysql = manejarFechaVacia($data[8]);

                    $_SESSION['import_data'][] = [
                        'codigoTrabajador' => $data[0],
                        'nombre1' => $data[1],
                        'nombre2' => $data[2],
                        'nombre3' => $data[3],
                        'apellido1' => $data[4],
                        'apellido2' => $data[5],
                        'apellidoCasada' => $data[6],
                        'nombrePuesto' => $data[7],
                        'fechaIngreso' => $fecha_ingreso_mysql,
                        'salarioBase' => $data[9],
                    ];
                }
            }
        } catch (Exception $e) {
            echo 'Error al cargar el archivo: ' . $e->getMessage();
        }
    } else {
        echo 'Por favor, seleccione un archivo Excel válido.';
    }
}

if (isset($_POST['import_empleados'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $codigoTrabajador = $data['codigoTrabajador'];
        $nombre1 = $data['nombre1'];
        $nombre2 = $data['nombre2'];
        $nombre3 = $data['nombre3'];
        $apellido1 = $data['apellido1'];
        $apellido2 = $data['apellido2'];
        $apellidoCasada = $data['apellidoCasada'];
        $nombrePuesto = $data['nombrePuesto'];
        $fechaIngreso = $data['fechaIngreso'];
        $salarioBase = $data['salarioBase'];
       
        // Verifica si el empleado ya existe en la base de datos
        $check_sql = "SELECT COUNT(*) FROM empleados WHERE codigoTrabajador = '$codigoTrabajador'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            $sql = "UPDATE empleados SET 
                nombre1 = '$nombre1',
                nombre2 = '$nombre2',
                nombre3 = '$nombre3',
                apellido1 = '$apellido1',
                apellido2 = '$apellido2',
                apellidoCasada = '$apellidoCasada',
                nombrePuesto = '$nombrePuesto',
                fechaIngreso = " . ($fechaIngreso ? "'$fechaIngreso'" : "NULL") . ",
                salarioBase = '$salarioBase'
                WHERE codigoTrabajador = '$codigoTrabajador'";
        } else {
            $sql = "INSERT INTO empleados (
                codigoTrabajador,
                nombre1,
                nombre2,
                nombre3,
                apellido1,
                apellido2,
                apellidoCasada,
                nombrePuesto,
                fechaIngreso,
                salarioBase
            ) VALUES (
                '$codigoTrabajador', 
                '$nombre1',
                '$nombre2',
                '$nombre3',
                '$apellido1',
                '$apellido2',
                '$apellidoCasada',
                '$nombrePuesto',
                " . ($fechaIngreso ? "'$fechaIngreso'" : "NULL") . ",
                '$salarioBase'
            )";
        }

        $result = mysqli_query($conn, $sql);

        if (!$result) {
            $success = false;
            $error_message = mysqli_error($conn);
            break;
        }
    }

    if ($success) {
        echo '<div class="alert alert-success" role="alert">';
        echo 'Datos guardados correctamente.';
        echo '</div>';
    } else {
        echo '<div class="alert alert-danger" role="alert">';
        echo 'Error al insertar datos en la base de datos: ' . $error_message;
        echo '</div>';
    }

    unset($_SESSION['import_data']);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Importar Empleados</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Empleados</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Código de Trabajador</th>';
        echo '<th>Primer Nombre</th>';
        echo '<th>Segundo Nombre</th>';
        echo '<th>Tercer Nombre</th>';
        echo '<th>Primer Apellido</th>';
        echo '<th>Segundo Apellido</th>';
        echo '<th>Apellido de Casada</th>';
        echo '<th>Nombre del Puesto</th>';
        echo '<th>Fecha de Ingreso</th>';
        echo '<th>Salario Base</th>';
       
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['codigoTrabajador']}</td>";
            echo "<td>{$data['nombre1']}</td>";
            echo "<td>{$data['nombre2']}</td>";
            echo "<td>{$data['nombre3']}</td>";
            echo "<td>{$data['apellido1']}</td>";
            echo "<td>{$data['apellido2']}</td>";
            echo "<td>{$data['apellidoCasada']}</td>";
            echo "<td>{$data['nombrePuesto']}</td>";
            echo "<td>{$data['fechaIngreso']}</td>";
            echo "<td>{$data['salarioBase']}</td>";
            
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';
        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_empleados" class="btn btn-primary">Importar Empleados</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_empleados">Selecciona un archivo Excel:</label>
                <input type="file" name="file_empleados" class="form-control-file" id="file_empleados">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
