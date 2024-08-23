<?php
    require_once('../../login/comprobarweb.php');
    include("../../menu/menu.php");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Nueva Ascendencia</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <br>
    <div class="container">
        <h4>Nueva Ascendencia:</h4>
        <form name="fcrearascendencia" method="post" action="nuevo.php" onSubmit="return validar_campos();" class="needs-validation" novalidate>
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

        <?php 
            if(isset($_POST["guardarAscendencia"])) {
                include("../../conectarbbdd.php"); // Conexión a la base de datos

                $codigoAscendencia = $_POST['codigoAscendencia'];
                $nombreAscendencia = $_POST['nombreAscendencia'];

                $queryInsert = "INSERT INTO ascendencia (codigoAscendencia, nombreAscendencia) VALUES ('$codigoAscendencia', '$nombreAscendencia')";
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
