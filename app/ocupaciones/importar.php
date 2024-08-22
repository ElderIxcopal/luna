<?php
require_once('../../login/comprobarweb.php');
require_once('../../vendor/autoload.php');

// Inicia sesión si aún no está iniciada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include("../../conectarbbdd.php");
include("../../menu/menu.php");

use PhpOffice\PhpSpreadsheet\IOFactory;

// Función para convertir el número serial de fecha de Excel a formato MySQL
function convertirFechaSerialExcelAMySQL($fecha_serial) {
    if (is_numeric($fecha_serial)) {
        $fecha_base = new DateTime('1899-12-30');
        $fecha = $fecha_base->modify('+' . intval($fecha_serial) . ' days');
        return $fecha->format('Y-m-d');
    }
    return null; // Devuelve null si el valor no es numérico
}

// Función para manejar fechas vacías
function manejarFechaVacia($fecha) {
    return !empty($fecha) ? convertirFechaSerialExcelAMySQL($fecha) : null;
}

// Verifica si se ha enviado el formulario para mostrar los datos
if (isset($_POST['show_data'])) {
    $file = $_FILES['file_ocupaciones']['tmp_name'];

    if ($file) {
        try {
            $spreadsheet = IOFactory::load($file);
            $worksheet = $spreadsheet->getActiveSheet();

            // Almacena temporalmente los datos en la variable de sesión
            $_SESSION['import_data'] = [];

            $row_index = 0;
            foreach ($worksheet->getRowIterator() as $row) {
                $row_index++;
                if ($row_index == 1) continue; // Omite la primera fila (encabezados)

                $cellIterator = $row->getCellIterator();
                $cellIterator->setIterateOnlyExistingCells(false);

                $data = [];
                foreach ($cellIterator as $cell) {
                    $data[] = $cell->getValue();
                }

                if (count($data) >= 4) { // Asegúrate de que haya al menos 4 columnas
                    $desde_mysql = manejarFechaVacia($data[2]);
                    $hasta_mysql = manejarFechaVacia($data[3]);

                    $_SESSION['import_data'][] = [
                        'codigoOcupacion' => $data[0],
                        'nombreOcupacion' => $data[1],
                        'desde' => $desde_mysql,
                        'hasta' => $hasta_mysql,
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

// Verifica si se ha enviado el formulario para importar las ocupaciones
if (isset($_POST['import_ocupaciones'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $codigoOcupacion = mysqli_real_escape_string($conn, $data['codigoOcupacion']);
        $nombreOcupacion = mysqli_real_escape_string($conn, $data['nombreOcupacion']);
        $desde = $data['desde'] ? "'" . mysqli_real_escape_string($conn, $data['desde']) . "'" : "NULL";
        $hasta = $data['hasta'] ? "'" . mysqli_real_escape_string($conn, $data['hasta']) . "'" : "NULL";

        // Verifica si la ocupación ya existe en la base de datos
        $check_sql = "SELECT COUNT(*) FROM ocupaciones WHERE codigoOcupacion = '$codigoOcupacion'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            // Actualiza los datos de la ocupación existente
            $sql = "UPDATE ocupaciones SET 
                    nombreOcupacion = '$nombreOcupacion', 
                    desde = $desde, 
                    hasta = $hasta 
                    WHERE codigoOcupacion = '$codigoOcupacion'";
        } else {
            // Inserta una nueva ocupación
            $sql = "INSERT INTO ocupaciones (codigoOcupacion, nombreOcupacion, desde, hasta) 
                    VALUES ('$codigoOcupacion', '$nombreOcupacion', $desde, $hasta)";
        }

        $result = mysqli_query($conn, $sql);

        if (!$result) {
            $success = false;
        }
    }

    if ($success) {
        echo '<div class="alert alert-success" role="alert">';
        echo 'Datos guardados correctamente.';
        echo '</div>';
    } else {
        echo '<div class="alert alert-danger" role="alert">';
        echo 'Error al insertar datos en la base de datos: ' . mysqli_error($conn);
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
    <title>Importar Ocupaciones</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Ocupaciones</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Código de Ocupación</th>';
        echo '<th>Nombre de Ocupación</th>';
        echo '<th>Desde</th>';
        echo '<th>Hasta</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['codigoOcupacion']}</td>";
            echo "<td>{$data['nombreOcupacion']}</td>";
            echo "<td>{$data['desde']}</td>";
            echo "<td>{$data['hasta']}</td>";
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';

        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_ocupaciones" class="btn btn-primary">Importar Ocupaciones</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_ocupaciones">Selecciona un archivo Excel:</label>
                <input type="file" name="file_ocupaciones" class="form-control-file" id="file_ocupaciones">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
