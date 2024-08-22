<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

// Verificar si se ha enviado una búsqueda
if (isset($_POST["buscar"])) {
    // Array asociativo que mapea los campos de búsqueda con sus valores
    $camposBusqueda = array(
        "costo1" => "buscarCosto1",
        "nombreCosto1" => "buscarNombreCosto1",
        "desde" => "buscarDesde",
        "hasta" => "buscarHasta",
        "comentarios" => "buscarComentarios",
        // Agrega aquí los campos que necesites
    );

    // Crear una consulta SQL dinámica para buscar en cualquier campo
    // Inicializar la variable de consulta
    $queryBuscar = "SELECT * FROM costo1s WHERE ";
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
                    <label for="costo1" class="col-sm-3 col-form-label">Costo 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="costo1" name="costo1" placeholder="Ingrese el costo 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="nombreCosto1" class="col-sm-3 col-form-label">Nombre Costo 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="nombreCosto1" name="nombreCosto1" placeholder="Ingrese el nombre del costo 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="desde" class="col-sm-3 col-form-label">Desde:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="desde" name="desde" placeholder="Ingrese la fecha de inicio">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="hasta" class="col-sm-3 col-form-label">Hasta:</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="hasta" name="hasta" placeholder="Ingrese la fecha de fin">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="comentarios" class="col-sm-3 col-form-label">Comentarios:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="comentarios" name="comentarios" placeholder="Ingrese comentarios">
                    </div>
                </div>

            </div>

                <div class="tab-pane fade" id="hoja2">
                <div class="form-group row">
                    <label for="text1" class="col-sm-3 col-form-label">Texto 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="text1" name="text1" placeholder="Ingrese Texto 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="text2" class="col-sm-3 col-form-label">Texto 2:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="text2" name="text2" placeholder="Ingrese Texto 2">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="text3" class="col-sm-3 col-form-label">Texto 3:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="text3" name="text3" placeholder="Ingrese Texto 3">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="string1" class="col-sm-3 col-form-label">Cadena 1:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="string1" name="string1" placeholder="Ingrese Cadena 1">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="string2" class="col-sm-3 col-form-label">Cadena 2:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="string2" name="string2" placeholder="Ingrese Cadena 2">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="string3" class="col-sm-3 col-form-label">Cadena 3:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="string3" name="string3" placeholder="Ingrese Cadena 3">
                    </div>
                </div>

                <div class="form-group row">
                <label for="enum1" class="col-sm-3 col-form-label">Enum 1:</label>
                <div class="col-sm-6">
                    <select class="form-control" id="enum1" name="enum1">
                        <option value="SI">SI</option>
                        <option value="NO">NO</option>
                    </select>
                    </div>
                </div>
               
                    <div class="form-group row">
                    <label for="enum2" class="col-sm-3 col-form-label">Enum 2:</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="enum2" name="enum2">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="enum3" class="col-sm-3 col-form-label">Enum 3:</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="enum3" name="enum3">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="integer1" class="col-sm-3 col-form-label">Integer 1:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="integer1" name="integer1" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="integer2" class="col-sm-3 col-form-label">Integer 2:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="integer2" name="integer2" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="integer3" class="col-sm-3 col-form-label">Integer 3:</label>
                    <div class="col-sm-6">
                        <input type="number" class="form-control" id="integer3" name="integer3" placeholder="Ingrese un número entero">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="decimal1" class="col-sm-3 col-form-label">Decimal 1:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="decimal1" name="decimal1" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="decimal2" class="col-sm-3 col-form-label">Decimal 2:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="decimal2" name="decimal2" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="decimal3" class="col-sm-3 col-form-label">Decimal 3:</label>
                    <div class="col-sm-6">
                        <input type="number" step="0.01" class="form-control" id="decimal3" name="decimal3" placeholder="Ingrese un número decimal">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="created_at" class="col-sm-3 col-form-label">Creado en:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="created_at" name="created_at" placeholder="Fecha de creación">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="updated_at" class="col-sm-3 col-form-label">Actualizado en:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="updated_at" name="updated_at" placeholder="Fecha de actualización">
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
