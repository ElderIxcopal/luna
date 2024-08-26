<?php
    // Inicia el búfer de salida para evitar errores de encabezado
    ob_start();

    // Verifica si se ha solicitado la exportación
    if (isset($_GET['export'])) {
        try {
            include("../../conectarbbdd.php"); // Asegúrate de que la conexión esté aquí

            // Construir la consulta SQL
            $query = "SELECT * FROM discapacidad";
            $result = $conn->query($query);

            // Verifica si la consulta devolvió resultados
            if ($result) {
                // Preparar el archivo CSV para la descarga
                header('Content-Type: text/csv');
                header('Content-Disposition: attachment;filename="listado_disciplinas.csv"');

                $output = fopen('php://output', 'w');

                // Escribir la cabecera del CSV
                fputcsv($output, ['ID', 'Código de Discapacidad', 'Nombre de Discapacidad']);

                // Escribir los datos en el CSV
                while ($row = $result->fetch_assoc()) {
                    fputcsv($output, [$row['id'], $row['codigoDiscapacidad'], $row['nombreDiscapacidad']]);
                }

                fclose($output);
            } else {
                echo "Error en la consulta: " . $conn->error;
            }

            exit(); // Asegúrate de que el script termine después de la descarga

        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }

    // Limpia el búfer de salida y continúa con el HTML
    ob_end_clean();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Discapacidad</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h4>Listado de Discapacidad:</h4>

        <!-- Botón para exportar a CSV -->
        <form method="GET" action="">
            <button type="submit" name="export" class="btn btn-success mb-4">Exportar a CSV</button>
        </form>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código de Discapacidad</th>
                    <th>Nombre de Discapacidad</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    include("../../conectarbbdd.php"); // Conexión a la base de datos para listar registros

                    $querySelect = "SELECT * FROM discapacidad";
                    $resultSelect = $conn->query($querySelect);

                    if ($resultSelect->num_rows > 0) {
                        while($row = $resultSelect->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['codigoDiscapacidad']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['nombreDiscapacidad']) . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='3'>No hay registros de discapacidad.</td></tr>";
                    }

                    $conn->close(); // Cierra la conexión a la base de datos
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
