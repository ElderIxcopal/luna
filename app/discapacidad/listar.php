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
    <title>Listado de Discapacidades</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h4>Listado de Discapacidades:</h4>
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
                        echo "<tr><td colspan='3'>No hay registros de discapacidades.</td></tr>";
                    }
                    $conn->close(); // Cierra la conexión a la base de datos
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
