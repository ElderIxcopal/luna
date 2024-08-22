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
    $file = $_FILES['file_nacionalidades']['tmp_name'];

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

                if (count($data) >= 5) {
                    $desde_mysql = manejarFechaVacia($data[3]);
                    $hasta_mysql = manejarFechaVacia($data[4]);

                    $_SESSION['import_data'][] = [
                        'codigoNacionalidad' => $data[0],
                        'nombreNacionalidad' => $data[1],
                        'pais' => $data[2],
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

if (isset($_POST['import_nacionalidades'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $codigoNacionalidad = $data['codigoNacionalidad'];
        $nombreNacionalidad = $data['nombreNacionalidad'];
        $pais = $data['pais'];
        $desde = $data['desde'];
        $hasta = $data['hasta'];

        $check_sql = "SELECT COUNT(*) FROM nacionalidades WHERE codigoNacionalidad = '$codigoNacionalidad'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            $sql = "UPDATE nacionalidades SET 
                    nombreNacionalidad = '$nombreNacionalidad', 
                    pais = '$pais', 
                    desde = " . ($desde ? "'$desde'" : "NULL") . ", 
                    hasta = " . ($hasta ? "'$hasta'" : "NULL") . "
                    WHERE codigoNacionalidad = '$codigoNacionalidad'";
        } else {
            $sql = "INSERT INTO nacionalidades (codigoNacionalidad, nombreNacionalidad, pais, desde, hasta) 
                    VALUES ('$codigoNacionalidad', '$nombreNacionalidad', '$pais', " . ($desde ? "'$desde'" : "NULL") . ", " . ($hasta ? "'$hasta'" : "NULL") . ")";
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
    <title>Importar Nacionalidades</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Nacionalidades</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Código de Nacionalidad</th>';
        echo '<th>Nombre de Nacionalidad</th>';
        echo '<th>País</th>';
        echo '<th>Desde</th>';
        echo '<th>Hasta</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['codigoNacionalidad']}</td>";
            echo "<td>{$data['nombreNacionalidad']}</td>";
            echo "<td>{$data['pais']}</td>";
            echo "<td>{$data['desde']}</td>";
            echo "<td>{$data['hasta']}</td>";
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';

        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_nacionalidades" class="btn btn-primary">Importar Nacionalidades</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_nacionalidades">Selecciona un archivo Excel:</label>
                <input type="file" name="file_nacionalidades" class="form-control-file" id="file_nacionalidades">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
