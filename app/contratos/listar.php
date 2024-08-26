<?php
    require_once('../../login/comprobarweb.php');
    include("../../conectarbbdd.php");
    include("../../menu/menu.php");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Contratos</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h4 class="mt-4">Listado de Contratos</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código de Contrato</th>
                    <th>Nombre de Contrato</th>
                    <th>Puestos ID</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $queryListar = "SELECT * FROM contratos";
                    $resultListar = $conn->query($queryListar);

                    if ($resultListar->num_rows > 0) {
                        while ($row = $resultListar->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row['id'] . "</td>";
                            echo "<td>" . $row['codigoContrato'] . "</td>";
                            echo "<td>" . $row['nombreContrato'] . "</td>";
                            echo "<td>" . $row['puestos_id'] . "</td>";
                            echo "<td>";
                            echo "<a href='editar.php?id=" . $row['id'] . "' class='btn btn-warning btn-sm'>Editar</a> ";
                            echo "<a href='exportar.php?id=" . $row['id'] . "' class='btn btn-info btn-sm'>Exportar</a>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>No hay registros de contratos disponibles.</td></tr>";
                    }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
