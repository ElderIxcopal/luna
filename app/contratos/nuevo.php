<?php
    require_once('../../login/comprobarweb.php');
    include("../../menu/menu.php");
    include("../../conectarbbdd.php"); // Conexión a la base de datos

    // Verifica si se ha enviado el formulario para crear un nuevo contrato
    if (isset($_POST["guardarContrato"])) {
        $codigoContrato = $_POST['codigoContrato'];
        $nombreContrato = $_POST['nombreContrato'];
        $puestos_id = $_POST['puestos_id'];

        // Consulta para insertar un nuevo contrato
        $queryInsert = "INSERT INTO contratos (codigoContrato, nombreContrato, puestos_id) VALUES ('$codigoContrato', '$nombreContrato', '$puestos_id')";
        $resultInsert = $conn->query($queryInsert);

        if ($resultInsert) {
            echo('<center> <img src="../../imagenes/errorok.png"> Registro creado con éxito. </center>');
        } else {
            echo('<center> <img src="../../imagenes/error1.png"> Error al crear el registro. </center>');
        }

        $conn->close(); // Cierra la conexión a la base de datos
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Nuevo Contrato</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h4 class="mt-4">Nuevo Contrato:</h4>
        <form name="fcrearContrato" method="post" action="nuevo.php" onSubmit="return validar_campos();" class="needs-validation" novalidate>
            <div class="form-group row">
                <label for="codigoContrato" class="col-sm-3 col-form-label">Código de Contrato:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="codigoContrato" name="codigoContrato" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <div class="form-group row">
                <label for="nombreContrato" class="col-sm-3 col-form-label">Nombre de Contrato:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="nombreContrato" name="nombreContrato" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <div class="form-group row">
                <label for="puestos_id" class="col-sm-3 col-form-label">Puestos ID:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="puestos_id" name="puestos_id" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>
            <br>
            <input type="submit" name="guardarContrato" value="Crear Nuevo Contrato" class="btn btn-primary">
        </form>

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
    </div>
</body>
</html>
