<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

// Verificar si se ha enviado una búsqueda
if (isset($_POST["buscar"])) {
    // Array asociativo que mapea los campos de búsqueda con sus valores
    $camposBusqueda = array(
        "nombreIdioma" => "buscarNombreIdioma",
        "desde" => "buscarDesde",
        "hasta" => "buscarHasta",
        "comentarios" => "buscarComentarios",
        "text1" => "buscarText1",
        // Agrega aquí los campos que necesites
    );

    // Crear una consulta SQL dinámica para buscar en cualquier campo
    // Inicializar la variable de consulta
    $queryBuscar = "SELECT * FROM idiomas WHERE ";
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
        echo "Consulta SQL: $queryBuscar";

        // Ejecuta la consulta
        $resultBuscar = $conn->query($queryBuscar);

        if ($resultBuscar && $resultBuscar->num_rows > 0) {
            // Recorre los resultados de la consulta
            while ($row = $resultBuscar->fetch_assoc()) {
                // Redirigir al usuario al formulario de edición utilizando el ID como identificador único
                header("Location: editar.php?idRegistroEditar=" . $row['id']);
                exit; // Finalizar el script para evitar que el formulario de búsqueda se muestre
            }
        }
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
        <!-- Formulario de búsqueda con múltiples pestañas -->
        <form name="fbuscar" method="post" action="buscar.php" class="needs-validation" novalidate>
            <input type="hidden" name="idRegistroEditar" value="">
            <ul class="nav nav-tabs">
            <li class="nav-item">
                 <a class="nav-link active" data-toggle="tab" href="#hoja1">General</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja2">Otros</a>
                </li>
            </ul>

            <div class="tab-content">
            <div class="tab-pane fade show active" id="hoja1">
            <div class="form-group row">
                <label for="buscarNombreIdioma" class="col-sm-3 col-form-label">Nombre del Idioma:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="buscarNombreIdioma" name="buscarNombreIdioma" placeholder="Ingrese el Nombre del Idioma">
                </div>
            </div>



                <div class="form-group row">
                    <label for="buscardesde" class="col-sm-3 col-form-label">Desde:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="buscardesde" name="buscardesde" placeholder="Ingrese la fecha de inicio">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarhasta" class="col-sm-3 col-form-label">Hasta:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="buscarhasta" name="buscarhasta" placeholder="Ingrese la fecha de fin">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarcomentarios" class="col-sm-3 col-form-label">Comentarios:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarcomentarios" name="buscarcomentarios" placeholder="Ingrese comentarios">
                    </div>
                </div>

            </div>

                <div class="tab-pane fade" id="hoja2">
                <div class="form-group row">
                    <label for="buscartext1" class="col-sm-3 col-form-label">Texto 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscartext1" name="buscartext1" placeholder="Ingrese Texto 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscartext2" class="col-sm-3 col-form-label">Texto 2:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscartext2" name="buscartext2" placeholder="Ingrese Texto 2">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscartext3" class="col-sm-3 col-form-label">Texto 3:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscartext3" name="buscartext3" placeholder="Ingrese Texto 3">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarstring1" class="col-sm-3 col-form-label">Cadena 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarstring1" name="buscarstring1" placeholder="Ingrese Cadena 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarstring2" class="col-sm-3 col-form-label">Cadena 2:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarstring2" name="buscarstring2" placeholder="Ingrese Cadena 2">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarstring3" class="col-sm-3 col-form-label">Cadena 3:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarstring3" name="buscarstring3" placeholder="Ingrese Cadena 3">
                    </div>
                </div>

                <div class="form-group row">
                <label for="buscarenum1" class="col-sm-3 col-form-label">Enum 1:</label>
                <div class="col-sm-6">
                    <select class="form-control" id="buscarenum1" name="buscarenum1">
                        <option value="SI">SI</option>
                        <option value="NO">NO</option>
                    </select>
                    </div>
                </div>
               
                    <div class="form-group row">
                    <label for="buscarenum2" class="col-sm-3 col-form-label">Enum 2:</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="buscarenum2" name="buscarenum2">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarenum3" class="col-sm-3 col-form-label">Enum 3:</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="buscarenum3" name="buscarenum3">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarinteger1" class="col-sm-3 col-form-label">Integer 1:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="buscarinteger1" name="buscarinteger1" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarinteger2" class="col-sm-3 col-form-label">Integer 2:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="buscarinteger2" name="buscarinteger2" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarinteger3" class="col-sm-3 col-form-label">Integer 3:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="buscarinteger3" name="buscarinteger3" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscardecimal1" class="col-sm-3 col-form-label">Decimal 1:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="buscardecimal1" name="buscardecimal1" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscardecimal2" class="col-sm-3 col-form-label">Decimal 2:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="buscardecimal2" name="buscardecimal2" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscardecimal3" class="col-sm-3 col-form-label">Decimal 3:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="buscardecimal3" name="buscardecimal3" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarcreated_at" class="col-sm-3 col-form-label">Creado en:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarcreated_at" name="buscarcreated_at" placeholder="Fecha de creación">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="buscarupdated_at" class="col-sm-3 col-form-label">Actualizado en:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="buscarupdated_at" name="buscarupdated_at" placeholder="Fecha de actualización">
                    </div>
                </div>

            </div>

            <!-- Este es el boton buscar-->
            <div class="col-sm-3">
                <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <script>
            $(document).ready(function() {
                // Inicializar las pestañas
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

    </div>
</body>
</html>
