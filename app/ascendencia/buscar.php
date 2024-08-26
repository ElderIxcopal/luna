<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

// Inicializar variable de resultados
$resultBuscar = false;

// Verificar si se ha enviado una búsqueda
if (isset($_POST["buscar"])) {
    // Array asociativo que mapea los campos de búsqueda con sus valores
    $camposBusqueda = array(
        "codigoAscendencia" => "buscarCodigoAscendencia",
        "nombreAscendencia" => "buscarNombreAscendencia",
        // Agrega aquí otros campos si es necesario
    );

    // Crear una consulta SQL dinámica para buscar en cualquier campo
    // Inicializar la variable de consulta
    $queryBuscar = "SELECT * FROM ascendencia WHERE ";
    $condiciones = array();

    // Recorre el array de campos de búsqueda
    foreach ($camposBusqueda as $campo => $nombreCampo) {
        // Verifica si se ha enviado un valor para el campo
        if (isset($_POST[$nombreCampo]) && !empty($_POST[$nombreCampo])) {
            // Agrega la condición para ese campo a la consulta
            $condiciones[] = "$campo LIKE '%" . $_POST[$nombreCampo] . "%'";
        }
    }

    // Comprueba si hay al menos una condición
    if (!empty($condiciones)) {
        // Combina las condiciones usando "AND"
        $queryBuscar .= implode(" AND ", $condiciones);

        // Muestra la consulta SQL (solo para depuración)
        // echo "Consulta SQL: $queryBuscar";

        // Ejecuta la consulta
        $resultBuscar = $conn->query($queryBuscar);
    }
}

// Verificar si se ha enviado una actualización
if (isset($_POST["actualizar"])) {
    $id = $_POST['id'];
    $codigoAscendencia = $_POST['codigoAscendencia'];
    $nombreAscendencia = $_POST['nombreAscendencia'];

    $queryActualizar = "UPDATE ascendencia SET 
        codigoAscendencia = '$codigoAscendencia', 
        nombreAscendencia = '$nombreAscendencia' 
        WHERE id = $id";

    if ($conn->query($queryActualizar) === TRUE) {
        echo "Registro actualizado correctamente";
    } else {
        echo "Error al actualizar el registro: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Empleados y Nóminas Online</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <?php
        include("../../menu/menu.php");
    ?>

    <br>
    <div class="container">
        <h4>Buscar:</h4>
        <form name="fbuscar" method="post" action="buscar.php" class="needs-validation" novalidate>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#hoja1">General</a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade show active" id="hoja1">
                    <div class="form-group row">
                        <label for="buscarCodigoAscendencia" class="col-sm-3 col-form-label">Código Ascendencia:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarCodigoAscendencia" name="buscarCodigoAscendencia" placeholder="Ingrese el código de ascendencia">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarNombreAscendencia" class="col-sm-3 col-form-label">Nombre Ascendencia:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarNombreAscendencia" name="buscarNombreAscendencia" placeholder="Ingrese el nombre de ascendencia">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <?php if ($resultBuscar && $resultBuscar->num_rows > 0): ?>
            <h4>Resultados de la búsqueda:</h4>
            <form method="post" action="buscar.php">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Código Ascendencia</th>
                            <th>Nombre Ascendencia</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $resultBuscar->fetch_assoc()): ?>
                            <tr>
                                <td><input type="text" name="codigoAscendencia" value="<?php echo $row['codigoAscendencia']; ?>" class="form-control"></td>
                                <td><input type="text" name="nombreAscendencia" value="<?php echo $row['nombreAscendencia']; ?>" class="form-control"></td>
                                <td>
                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                    <button type="submit" name="actualizar" class="btn btn-success">Actualizar</button>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </form>
        <?php endif; ?>
    </div>

    <script>
        $(document).ready(function() {
            $('.nav-tabs a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });

        function validar_campos() {
            var forms = document.getElementsByClassName('needs-validation');
            var valid = true;

            Array.prototype.filter.call(forms, function(form) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                    valid = false;
                }
                form.classList.add('was-validated');
            });

            return valid;
        }
    </script>

</body>
</html>
