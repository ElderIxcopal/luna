<?php
    require_once('../../login/comprobarweb.php');
    include("../../menu/menu.php");
    include("../../conectarbbdd.php"); // Conexión a la base de datos para listar registros
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Ascendencias</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h4>Listado de Ascendencias:</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código de Ascendencia</th>
                    <th>Nombre de Ascendencia</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $querySelect = "SELECT * FROM ascendencia";
                    $resultSelect = $conn->query($querySelect);

                    if ($resultSelect->num_rows > 0) {
                        while($row = $resultSelect->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row['id'] . "</td>";
                            echo "<td>" . $row['codigoAscendencia'] . "</td>";
                            echo "<td>" . $row['nombreAscendencia'] . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='3'>No hay registros de ascendencias.</td></tr>";
                    }
                    $conn->close(); // Cierra la conexión a la base de datos
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
