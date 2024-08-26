<?php
    require_once('../../login/comprobarweb.php');
    include("../../menu/menu.php");
    include("../../conectarbbdd.php"); // Conexión a la base de datos para listar registros

    // Inicializar variables
    $searchQuery = '';
    $searchTerm = '';

    // Verifica si se ha enviado el formulario de búsqueda
    if (isset($_POST['search'])) {
        $searchTerm = $conn->real_escape_string($_POST['searchTerm']);
        $searchQuery = "WHERE codigoAscendencia LIKE '%$searchTerm%' OR nombreAscendencia LIKE '%$searchTerm%'";
    }

    // Actualizar la ascendencia si se envía el formulario de edición
    if (isset($_POST["guardarCambios"])) {
        $id = $_POST['id'];
        $codigoAscendencia = $_POST['codigoAscendencia'];
        $nombreAscendencia = $_POST['nombreAscendencia'];

        // Consulta para actualizar los datos de la ascendencia
        $queryUpdate = "UPDATE ascendencia SET codigoAscendencia = '$codigoAscendencia', nombreAscendencia = '$nombreAscendencia' WHERE id = '$id'";
        $resultUpdate = $conn->query($queryUpdate);

        if ($resultUpdate) {
            echo('<center> <img src="../../imagenes/errorok.png"> Registro actualizado con éxito. </center>');
        } else {
            echo('<center> <img src="../../imagenes/error1.png"> Error al actualizar el registro. </center>');
        }
    }
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
        
        <!-- Formulario de búsqueda -->
        <form method="POST" action="">
            <div class="form-group">
                <label for="searchTerm">Buscar por Código o Nombre:</label>
                <input type="text" class="form-control" id="searchTerm" name="searchTerm" placeholder="Ingrese código o nombre" value="<?php echo htmlspecialchars($searchTerm); ?>">
            </div>
            <button type="submit" name="search" class="btn btn-primary mt-2">Buscar</button>
        </form>

        <!-- Mostrar los resultados de la búsqueda -->
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código de Ascendencia</th>
                    <th>Nombre de Ascendencia</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    // Construir la consulta SQL con el filtro de búsqueda
                    $querySelect = "SELECT * FROM ascendencia $searchQuery";
                    $resultSelect = $conn->query($querySelect);

                    if ($resultSelect->num_rows > 0) {
                        while($row = $resultSelect->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['codigoAscendencia']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['nombreAscendencia']) . "</td>";
                            echo "<td>";
                            echo "<form method='post' action='' class='form-inline'>";
                            echo "<input type='hidden' name='id' value='" . htmlspecialchars($row['id']) . "'>";
                            echo "<input type='text' name='codigoAscendencia' value='" . htmlspecialchars($row['codigoAscendencia']) . "' class='form-control mb-2 mr-sm-2'>";
                            echo "<input type='text' name='nombreAscendencia' value='" . htmlspecialchars($row['nombreAscendencia']) . "' class='form-control mb-2 mr-sm-2'>";
                            echo "<button type='submit' name='guardarCambios' class='btn btn-success mb-2'>Guardar</button>";
                            echo "</form>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>No hay registros de ascendencias.</td></tr>";
                    }
                    $conn->close(); // Cierra la conexión a la base de datos
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
