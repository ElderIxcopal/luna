<?php
require_once('../../login/comprobarweb.php');
require_once('../../vendor/autoload.php');

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

if (isset($_POST['show_data'])) {
    $file = $_FILES['file_costo1s']['tmp_name'];

    if ($file) {
        try {
            $spreadsheet = IOFactory::load($file);
            $worksheet = $spreadsheet->getActiveSheet();

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
                        'costo1' => $data[0],
                        'nombreCosto1' => $data[1],
                        'c1' => $data[2],
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

if (isset($_POST['import_costo1s'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $costo1 = $data['costo1'];
        $nombreCosto1 = $data['nombreCosto1'];
        $c1 = $data['c1'];
        $desde = $data['desde'];
        $hasta = $data['hasta'];

        // Verifica si el registro ya existe en la base de datos
        $check_sql = "SELECT COUNT(*) FROM costo1s WHERE costo1 = '$costo1'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            // Actualiza el registro existente
            $sql = "UPDATE costo1s SET 
                    nombreCosto1 = '$nombreCosto1', 
                    c1 = '$c1', 
                    desde = " . ($desde ? "'$desde'" : "NULL") . ", 
                    hasta = " . ($hasta ? "'$hasta'" : "NULL") . "
                    WHERE costo1 = '$costo1'";
        } else {
            // Inserta un nuevo registro
            $sql = "INSERT INTO costo1s (costo1, nombreCosto1, c1, desde, hasta) 
                    VALUES ('$costo1', '$nombreCosto1', '$c1', " . ($desde ? "'$desde'" : "NULL") . ", " . ($hasta ? "'$hasta'" : "NULL") . ")";
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
    <title>Importar Costo1s</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Costo1s</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Costo 1</th>';
        echo '<th>Nombre Costo 1</th>';
        echo '<th>C1</th>';
        echo '<th>Desde</th>';
        echo '<th>Hasta</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['costo1']}</td>";
            echo "<td>{$data['nombreCosto1']}</td>";
            echo "<td>{$data['c1']}</td>";
            echo "<td>{$data['desde']}</td>";
            echo "<td>{$data['hasta']}</td>";
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';

        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_costo1s" class="btn btn-primary">Importar Costo1s</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_costo1s">Selecciona un archivo Excel:</label>
                <input type="file" name="file_costo1s" class="form-control-file" id="file_costo1s">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
