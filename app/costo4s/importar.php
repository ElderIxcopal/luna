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
    $file = $_FILES['file_costo4s']['tmp_name'];

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

                if (count($data) >= 5) { // Asegúrate de que haya al menos 5 columnas
                    $desde_mysql = manejarFechaVacia($data[3]);
                    $hasta_mysql = manejarFechaVacia($data[4]);

                    $_SESSION['import_data'][] = [
                        'costo4' => $data[0],
                        'nombreCosto4' => $data[1],
                        'c4' => $data[2],
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

// Verifica si se ha enviado el formulario para importar los datos
if (isset($_POST['import_costo4s'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $costo4 = $data['costo4'];
        $nombreCosto4 = $data['nombreCosto4'];
        $c4 = $data['c4'];
        $desde = $data['desde'];
        $hasta = $data['hasta'];

        // Verifica si el registro ya existe en la base de datos
        $check_sql = "SELECT COUNT(*) FROM costo4s WHERE costo4 = '$costo4'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            // Actualiza los datos del registro existente
            $sql = "UPDATE costo4s SET 
                    nombreCosto4 = '$nombreCosto4', 
                    c4 = '$c4', 
                    desde = " . ($desde ? "'$desde'" : "NULL") . ", 
                    hasta = " . ($hasta ? "'$hasta'" : "NULL") . "
                    WHERE costo4 = '$costo4'";
        } else {
            // Inserta un nuevo registro
            $sql = "INSERT INTO costo4s (costo4, nombreCosto4, c4, desde, hasta) 
                    VALUES ('$costo4', '$nombreCosto4', '$c4', " . ($desde ? "'$desde'" : "NULL") . ", " . ($hasta ? "'$hasta'" : "NULL") . ")";
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
    <title>Importar Costo4s</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Costo4s</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Costo4</th>';
        echo '<th>Nombre Costo4</th>';
        echo '<th>C4</th>';
        echo '<th>Desde</th>';
        echo '<th>Hasta</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['costo4']}</td>";
            echo "<td>{$data['nombreCosto4']}</td>";
            echo "<td>{$data['c4']}</td>";
            echo "<td>{$data['desde']}</td>";
            echo "<td>{$data['hasta']}</td>";
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';

        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_costo4s" class="btn btn-primary">Importar Costo4s</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_costo4s">Selecciona un archivo Excel:</label>
                <input type="file" name="file_costo4s" class="form-control-file" id="file_costo4s">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
