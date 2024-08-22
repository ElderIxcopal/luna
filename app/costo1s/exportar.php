<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exportar: Búsqueda de Empleados</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <form method="POST" action="">
        <div class="form-group">
            <label for="campoBusqueda">Selecciona el campo de búsqueda:</label>
            <select class="form-control" id="campoBusqueda" name="campoBusqueda">
                <option value="codigoTrabajador">Código de Trabajador</option>
                <option value="nombre1">Nombre</option>
                <option value="apellido1">Apellido</option>
                <!-- Agrega más opciones para otros campos -->
            </select>
        </div>

        <!-- Inputs para diferentes campos de búsqueda (inicialmente ocultos) -->
        <div class="form-group">
            <label for="valorBusqueda">Ingrese el criterio de búsqueda:</label>
            <input type="text" class="form-control" id="valorBusqueda" name="valorBusqueda" placeholder="Ingrese el criterio">
        </div>

        <button type="submit" name="buscar" class="btn btn-primary mt-2">Buscar</button>
    </form>

    <?php
    if (isset($_POST['buscar'])) {
        // Recoge los datos del formulario de búsqueda
        $campoBusqueda = $_POST['campoBusqueda'];
        $valorBusqueda = $_POST['valorBusqueda'];

        // Incluir el archivo de conexión
        include("../../conectarbbdd.php");

        // Construir la consulta SQL
        $query = "SELECT * FROM `empleados` WHERE `$campoBusqueda` LIKE '%$valorBusqueda%'";

        // Realizar la consulta a la base de datos
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            echo "<table class='table table-striped mt-4'>";
            echo "<thead class='thead-light'>";
            echo "<tr><th>Código</th><th>Nombre</th><th>Apellido</th></tr>";
            echo "</thead>";
            echo "<tbody>";

            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['codigoTrabajador'] . "</td>";
                echo "<td>" . $row['nombre1'] . "</td>";
                echo "<td>" . $row['apellido1'] . "</td>";
                echo "</tr>";
            }

            echo "</tbody>";
            echo "</table>";

            // Agregar el botón de exportar a Excel
            echo '<form method="GET" action="">';
            echo '<input type="hidden" name="campoBusqueda" value="' . $campoBusqueda . '">';
            echo '<input type="hidden" name="valorBusqueda" value="' . $valorBusqueda . '">';
            echo '<button type="submit" name="exportar" class="btn btn-success mt-2">Exportar a Excel</button>';
            echo '</form>';
        } else {
            echo ("<div class='alert alert-warning mt-4'>
                <img src='imagenes/cuidado.png'> No se encontraron resultados.
            </div>");
        }

        // Cerrar la conexión
        mysqli_close($conn);
    }

    if (isset($_GET['exportar'])) {
        // Recoge los datos del formulario de búsqueda
        $campoBusqueda = $_GET['campoBusqueda'];
        $valorBusqueda = $_GET['valorBusqueda'];

        // Incluir el archivo de conexión
        include("../../conectarbbdd.php");

        // Construir la consulta SQL
        $query = "SELECT * FROM `empleados` WHERE `$campoBusqueda` LIKE '%$valorBusqueda%'";

        // Realizar la consulta a la base de datos
        $result = mysqli_query($conn, $query);

        header("Content-Type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=\"ResultadosEmpleados.xls\"");

        if (mysqli_num_rows($result) > 0) {
            echo "<table>";
            echo "<tr><th>Código</th><th>Nombre</th><th>Apellido</th></tr>";

            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['codigoTrabajador'] . "</td>";
                echo "<td>" . $row['nombre1'] . "</td>";
                echo "<td>" . $row['apellido1'] . "</td>";
                echo "</tr>";
            }

            echo "</table>";
        }

        // Cerrar la conexión
        mysqli_close($conn);
    }
    ?>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
</body>
</html>
