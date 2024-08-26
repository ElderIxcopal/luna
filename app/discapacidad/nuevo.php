<?php
    require_once('../../login/comprobarweb.php');
    include("../../menu/menu.php");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Nueva Discapacidad</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h4>Nueva Discapacidad:</h4>
        <form name="fcreardiscapacidad" method="post" action="nuevo.php" onSubmit="return validar_campos();" class="needs-validation" novalidate>
            <div class="form-group row">
                <label for="codigoDiscapacidad" class="col-sm-3 col-form-label">Código de Discapacidad:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="codigoDiscapacidad" name="codigoDiscapacidad" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <div class="form-group row">
                <label for="nombreDiscapacidad" class="col-sm-3 col-form-label">Nombre de Discapacidad:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="nombreDiscapacidad" name="nombreDiscapacidad" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <br>
            <input type="submit" name="guardarDiscapacidad" value="Crear Nueva Discapacidad" class="btn btn-primary">
        </form>

        <?php 
            if(isset($_POST["guardarDiscapacidad"])) {
                include("../../conectarbbdd.php"); // Conexión a la base de datos

                $codigoDiscapacidad = $_POST['codigoDiscapacidad'];
                $nombreDiscapacidad = $_POST['nombreDiscapacidad'];

                $queryInsert = "INSERT INTO discapacidad (codigoDiscapacidad, nombreDiscapacidad) VALUES ('$codigoDiscapacidad', '$nombreDiscapacidad')";
                $resultInsert = $conn->query($queryInsert);

                if ($resultInsert) {
                    echo('<center> <img src="../../imagenes/errorok.png"> Registro creado con éxito. </center>');
                } else {
                    echo('<center> <img src="../../imagenes/error1.png"> Error al crear el registro. </center>');
                }

                $conn->close(); // Cierra la conexión a la base de datos
            }
        ?> 
    </div>

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
