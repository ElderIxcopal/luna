<?php
    require_once('../../login/comprobarweb.php');
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
        include("../../conectarbbdd.php"); // Conexión a la base de datos para listar registros
    ?>

    <br>
    <div class="container">
        <h4>Nueva Ascendencia:</h4>
        <form name="fcrearascendencia" method="post" action="<?=$_SERVER['PHP_SELF']?>" onSubmit="return validar_campos();" class="needs-validation" novalidate>
            <div class="form-group row">
                <label for="codigoAscendencia" class="col-sm-3 col-form-label">Código de Ascendencia:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="codigoAscendencia" name="codigoAscendencia" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <div class="form-group row">
                <label for="nombreAscendencia" class="col-sm-3 col-form-label">Nombre de Ascendencia:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="nombreAscendencia" name="nombreAscendencia" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <br>
            <input type="submit" name="guardarAscendencia" value="Crear Nueva Ascendencia" class="btn btn-primary">
        </form>

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
                ?>
            </tbody>
        </table>
    </div>

    <?php 
        if(isset($_POST["guardarAscendencia"])) {
            // Realizar la inserción en la base de datos utilizando las variables
            include("../../conectarbbdd.php"); // Asegúrate de tener la conexión a la base de datos

            $codigoAscendencia = $_POST['codigoAscendencia'];
            $nombreAscendencia = $_POST['nombreAscendencia'];

            $queryInsert = "INSERT INTO ascendencia (codigoAscendencia, nombreAscendencia) VALUES ('$codigoAscendencia', '$nombreAscendencia')";
            $resultInsert = $conn->query($queryInsert);

            if ($resultInsert) {
                echo('<center> <img src="../../imagenes/errorok.png"> Registro creado con éxito. </center>');
               // header("Refresh:0"); // Refrescar la página para mostrar los registros actualizados
            } else {
                echo('<center> <img src="../../imagenes/error1.png"> Error al crear el registro. </center>');
            }

            $conn->close(); // Cierra la conexión a la base de datos
        }
    ?> 

    <script>
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
