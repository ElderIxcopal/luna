<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

$idRegistroEditar = isset($_GET["idRegistroEditar"]) ? $_GET['idRegistroEditar'] : null;

if ($idRegistroEditar !== null) {
    // Realizar la consulta para obtener los datos de búsqueda
    $queryBuscar = "SELECT * FROM estudios WHERE id = ?";
    
    // Utilizar una consulta preparada para evitar la inyección SQL
    if ($stmt = $conn->prepare($queryBuscar)) {
        $stmt->bind_param("i", $idRegistroEditar);
        $stmt->execute();
        $resultBuscar = $stmt->get_result();
        
        if ($resultBuscar->num_rows > 0) {
            $row = $resultBuscar->fetch_assoc();
            // Almacenar los valores actuales de los campos y pasar al formulario
            $codigoEstudio = $row['codigoEstudio'];
            $nombreEstudio = $row['nombreEstudio'];
            $desde = $row['desde'];
            $hasta = $row['hasta'];
            $comentarios = $row['comentarios'];
            $text1 = $row['text1'];
            $text2 = $row['text2'];
            $text3 = $row['text3'];
            $string1 = $row['string1'];
            $string2 = $row['string2'];
            $string3 = $row['string3'];
            $enum1 = $row['enum1'];
            $enum2 = $row['enum2'];
            $enum3 = $row['enum3'];
            $integer1 = $row['integer1'];
            $integer2 = $row['integer2'];
            $integer3 = $row['integer3'];
            $decimal1 = $row['decimal1'];
            $decimal2 = $row['decimal2'];
            $decimal3 = $row['decimal3'];
            $created_at = $row['created_at'];
            $updated_at = $row['updated_at'];           
            // Continúa con los demás campos
        }
        
        
        $stmt->close();
    }
}

if (isset($_POST["actualizar"])) {
    // Obtener el ID del formulario
    $idRegistroEditar = $_POST['idRegistroEditar'];

    // Obtener los valores actualizados del formulario
    $codigoEstudio = $_POST['codigoEstudio'];
    $nombreEstudio = $_POST['nombreEstudio'];
    $desde = $_POST['desde'];
    $hasta = $_POST['hasta'];
    $comentarios = $_POST['comentarios'];
    $text1 = $_POST['text1'];
    $text2 = $_POST['text2'];
    $text3 = $_POST['text3'];
    $string1 = $_POST['string1'];
    $string2 = $_POST['string2'];
    $string3 = $_POST['string3'];
    $enum1 = $_POST['enum1'];
    $enum2 = $_POST['enum2'];
    $enum3 = $_POST['enum3'];
    $integer1 = $_POST['integer1'];
    $integer2 = $_POST['integer2'];
    $integer3 = $_POST['integer3'];
    $decimal1 = $_POST['decimal1'];
    $decimal2 = $_POST['decimal2'];
    $decimal3 = $_POST['decimal3'];
    $created_at = $_POST['created_at'];
    $updated_at = $_POST['updated_at'];



    // Continúa con los demás campos

    // Construir la consulta SQL de actualización utilizando consultas preparadas
    $queryUpdate = "UPDATE estudios SET 
    codigoEstudio = ?,
    nombreEstudio = ?,
    desde = ?,
    hasta = ?,
    comentarios = ?,
    text1 = ?,
    text2 = ? ,
    text3 = ? ,
    string1 = ? ,
    string2 = ? ,
    string3 = ? ,
    enum1 = ? ,
    enum2 = ? ,
    enum3 = ? ,
    integer1 = ? ,
    integer2 = ? ,
    integer3 = ? ,
    decimal1 = ? ,
    decimal2 = ? ,
    decimal3 = ? ,
    created_at = ? ,
    updated_at = ? 
    WHERE id = ?";

// Preparar la consulta
if ($stmt = $conn->prepare($queryUpdate)) {
    // Vincular los parámetros
    $stmt->bind_param("ssssssssssssssssssssssi", 
        $codigoEstudio, 
        $nombreEstudio, 
        $desde, 
        $hasta, 
        $comentarios, 
        $text1,  
        $text2,	
        $text3,	
        $string1, 
        $string2, 
        $string3, 
        $enum1, 
        $enum2, 
        $enum3, 
        $integer1, 
        $integer2, 
        $integer3, 
        $decimal1, 
        $decimal2, 
        $decimal3, 
        $created_at, 
        $updated_at, 
        $idRegistroEditar
    );
        

        // Ejecutar la consulta
        if ($stmt->execute()) {
            echo '<center><img src="../../imagenes/errorok.png"></center>';
            // Resto del código después de la actualización exitosa
        } else {
            echo '<center><img src="../../imagenes/error1.png"></center>';
            echo 'Error al actualizar la base de datos: ' . $conn->error;
        }

        // Cerrar la consulta
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sistema de Empleados y Nóminas Online - Editar</title>
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
            <h4>Editar:</h4>
            <!-- Formulario de edición con múltiples pestañas -->
            <form name="feditar" method="post" action="<?=$_SERVER['PHP_SELF']?>" class="needs-validation" novalidate>
                <input type="hidden" name="idRegistroEditar" value="<?php echo $idRegistroEditar; ?>">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#hoja1Editar">General</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#hoja2Editar">Otros</a>
                    </li>
                    <!-- Agrega más pestañas de edición aquí -->
                </ul>

                <!-- Contenido del formulario -->
                <div class="tab-content">
                    <!-- Pestaña 1: Personales -->
                    <div class="tab-pane fade show active" id="hoja1Editar">
                    <div class="form-group row">
                        <label for="codigoEstudio" class="col-sm-3 col-form-label">Código de Estudio:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="codigoEstudio" name="codigoEstudio" value="<?= isset($codigoEstudio) ? $codigoEstudio : ''; ?>" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nombreEstudio" class="col-sm-3 col-form-label">Nombre de Estudio:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nombreEstudio" name="nombreEstudio" value="<?= isset($nombreEstudio) ? $nombreEstudio : ''; ?>" required>
                        </div>
                    </div>


                        <div class="form-group row">
                            <label for="desde" class="col-sm-3 col-form-label">Desde:</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" id="desde" name="desde" value="<?= isset($desde) ? $desde : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="hasta" class="col-sm-3 col-form-label">Hasta:</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" id="hasta" name="hasta" value="<?= isset($hasta) ? $hasta : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="comentarios" class="col-sm-3 col-form-label">Comentarios:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="comentarios" name="comentarios" value="<?= isset($comentarios) ? $comentarios : ''; ?>" required>
                            </div>
                        </div>
                        <!-- Completa los campos restantes de hoja1Editar -->
                    </div>
                    <!-- Pestaña 2: Contrato -->
                    <div class="tab-pane fade" id="hoja2Editar">
                        <div class="form-group row">
                            <label for="text1" class="col-sm-3 col-form-label">Texto 1:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="text1" name="text1" value="<?= isset($text1) ? $text1 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="text2" class="col-sm-3 col-form-label">Texto 2:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="text2" name="text2" value="<?= isset($text2) ? $text2 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="text3" class="col-sm-3 col-form-label">Texto 3:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="text3" name="text3" value="<?= isset($text3) ? $text3 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="string1" class="col-sm-3 col-form-label">Cadena 1:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="string1" name="string1" value="<?= isset($string1) ? $string1 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="string2" class="col-sm-3 col-form-label">Cadena 2:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="string2" name="string2" value="<?= isset($string2) ? $string2 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="string3" class="col-sm-3 col-form-label">Cadena 3:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="string3" name="string3" value="<?= isset($string3) ? $string3 : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="enum1" class="col-sm-3 col-form-label">Enum 1:</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="enum1" name="enum1">
                                    <option value="SI" <?= (isset($_POST['enum1']) && $_POST['enum1'] == 'SI') ? 'selected' : ''; ?>>SI</option>
                                    <option value="NO" <?= (isset($_POST['enum1']) && $_POST['enum1'] == 'NO') ? 'selected' : ''; ?>>NO</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="enum2" class="col-sm-3 col-form-label">Enum 2:</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="enum2" name="enum2">
                                    <option value="SI" <?= (isset($_POST['enum2']) && $_POST['enum2'] == 'SI') ? 'selected' : ''; ?>>SI</option>
                                    <option value="NO" <?= (isset($_POST['enum2']) && $_POST['enum2'] == 'NO') ? 'selected' : ''; ?>>NO</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="enum3" class="col-sm-3 col-form-label">Enum 3:</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="enum3" name="enum3">
                                    <option value="SI" <?= (isset($_POST['enum3']) && $_POST['enum3'] == 'SI') ? 'selected' : ''; ?>>SI</option>
                                    <option value="NO" <?= (isset($_POST['enum3']) && $_POST['enum3'] == 'NO') ? 'selected' : ''; ?>>NO</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="integer1" class="col-sm-3 col-form-label">Integer 1:</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" id="integer1" name="integer1" value="<?= isset($_POST['integer1']) ? $_POST['integer1'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="integer2" class="col-sm-3 col-form-label">Integer 2:</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" id="integer2" name="integer2" value="<?= isset($_POST['integer2']) ? $_POST['integer2'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="integer3" class="col-sm-3 col-form-label">Integer 3:</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" id="integer3" name="integer3" value="<?= isset($_POST['integer3']) ? $_POST['integer3'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="decimal1" class="col-sm-3 col-form-label">Decimal 1:</label>
                            <div class="col-sm-6">
                                <input type="number" step="0.01" class="form-control" id="decimal1" name="decimal1" value="<?= isset($_POST['decimal1']) ? $_POST['decimal1'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="decimal2" class="col-sm-3 col-form-label">Decimal 2:</label>
                            <div class="col-sm-6">
                                <input type="number" step="0.01" class="form-control" id="decimal2" name="decimal2" value="<?= isset($_POST['decimal2']) ? $_POST['decimal2'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="decimal3" class="col-sm-3 col-form-label">Decimal 3:</label>
                            <div class="col-sm-6">
                                <input type="number" step="0.01" class="form-control" id="decimal3" name="decimal3" value="<?= isset($_POST['decimal3']) ? $_POST['decimal3'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="created_at" class="col-sm-3 col-form-label">Creado en:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="created_at" name="created_at" value="<?= isset($_POST['created_at']) ? $_POST['created_at'] : ''; ?>" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="updated_at" class="col-sm-3 col-form-label">Actualizado en:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="updated_at" name="updated_at" value="<?= isset($_POST['updated_at']) ? $_POST['updated_at'] : ''; ?>" required>
                            </div>
                        </div>
                
                    </div>
                </div>
                <!-- Botón de actualización -->
                <div class="col-sm-3">
                    <button type="submit" name="actualizar" class="btn btn-primary" formnovalidate>Actualizar</button>
                </div>
            </form>
            
        </div>
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
    </body>
</html>
