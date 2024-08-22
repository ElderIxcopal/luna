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
		include("../../conectarbbdd.php"); // Agrega archivo de conexion para listar campos de otras tablas
    ?>

    <br>
    <div class="container">
        <h4>Nuevo Establecimiento:</h4>
        <form name="fcrearemp" method="post" action="<?=$_SERVER['PHP_SELF']?>" onSubmit="return validar_campos();" class="needs-validation" novalidate>
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
                <label for="codigoEstablecimiento" class="col-sm-3 col-form-label">Código del Establecimiento:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="codigoEstablecimiento" name="codigoEstablecimiento" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>


                <div class="form-group row">
                <label for="nombreEstablecimiento" class="col-sm-3 col-form-label">Nombre del Establecimiento:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="nombreEstablecimiento" name="nombreEstablecimiento" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>


                        <div class="form-group row">
                <label for="desde" class="col-sm-3 col-form-label">Desde:</label>
                <div class="col-sm-9">
                    <input type="date" class="form-control" id="desde" name="desde" required>
                    <div class="invalid-feedback">Este campo es obligatorio.</div>
                </div>
            </div>


				<div class="form-group row">
				<label for="hasta" class="col-sm-3 col-form-label">Hasta:</label>
				<div class="col-sm-9">
					<input type="date" class="form-control" id="hasta" name="hasta" required>
					<div class="invalid-feedback">Este campo es obligatorio.</div>
				</div>
			    </div>
                <div class="form-group row">
                <label for="comentarios" class="col-sm-3 col-form-label">Comentarios:</label>
                 <div class="col-sm-9">
                <input type="text" class="form-control" id="comentarios" name="comentarios">
                <div class="invalid-feedback">Este campo es obligatorio.</div>
                 </div>
            </div>
			
		</div>	

			<div class="tab-pane fade" id="hoja2">
                <div class="form-group row">
                <div class="form-group row">
                    <label for="text1" class="col-sm-3 col-form-label">Text 1:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="text1" name="text1">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="text2" class="col-sm-3 col-form-label">Text 2:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="text2" name="text2">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="text3" class="col-sm-3 col-form-label">Text 3:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="text3" name="text3">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Repite la estructura para los campos restantes -->

                <div class="form-group row">
                    <label for="string1" class="col-sm-3 col-form-label">String 1:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="string1" name="string1">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="string2" class="col-sm-3 col-form-label">String 2:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="string2" name="string2">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="string3" class="col-sm-3 col-form-label">String 3:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="string3" name="string3">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Enum 1 -->
                <div class="form-group row">
                    <label for="enum1" class="col-sm-3 col-form-label">Enum 1:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="enum1" name="enum1">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>


                <!-- Enum 2 -->
                <div class="form-group row">
                    <label for="enum2" class="col-sm-3 col-form-label">Enum 2:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="enum2" name="enum2">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Enum 3 -->
                <div class="form-group row">
                    <label for="enum3" class="col-sm-3 col-form-label">Enum 3:</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="enum3" name="enum3">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>


                <!-- Integer 1 -->
                <div class="form-group row">
                    <label for="integer1" class="col-sm-3 col-form-label">Integer 1:</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="integer1" name="integer1">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Integer 2 -->
                <div class="form-group row">
                    <label for="integer2" class="col-sm-3 col-form-label">Integer 2:</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="integer2" name="integer2">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Integer 3 -->
                <div class="form-group row">
                    <label for="integer3" class="col-sm-3 col-form-label">Integer 3:</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="integer3" name="integer3">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>


                <!-- Decimal 1 -->
                <div class="form-group row">
                    <label for="decimal1" class="col-sm-3 col-form-label">Decimal 1:</label>
                    <div class="col-sm-9">
                        <input type="number" step="0.01" class="form-control" id="decimal1" name="decimal1">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Decimal 2 -->
                <div class="form-group row">
                    <label for="decimal2" class="col-sm-3 col-form-label">Decimal 2:</label>
                    <div class="col-sm-9">
                        <input type="number" step="0.01" class="form-control" id="decimal2" name="decimal2">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <!-- Decimal 3 -->
                <div class="form-group row">
                    <label for="decimal3" class="col-sm-3 col-form-label">Decimal 3:</label>
                    <div class="col-sm-9">
                        <input type="number" step="0.01" class="form-control" id="decimal3" name="decimal3">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>


                <div class="form-group row">
                    <label for="created_at" class="col-sm-3 col-form-label">Created At:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="created_at" name="created_at">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="updated_at" class="col-sm-3 col-form-label">Updated At:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="updated_at" name="updated_at">
                        <div class="invalid-feedback">Este campo es obligatorio.</div>
                    </div>
                </div>
					
				</div>

				</div>
            </div>
            
            <br>
            <input type="submit" name="gordeemp" value="Crear Nuevo Registro" class="btn btn-primary">
        </form>
    </div>

    <?php 
        if(isset($_POST["gordeemp"])) {
            // Realizar la inserción en la base de datos utilizando las variables
            include("../../conectarbbdd.php"); // Asegúrate de tener la conexión a la base de datos

			$codigoEstablecimiento = $_POST['codigoEstablecimiento'];
            $nombreEstablecimiento = $_POST['nombreEstablecimiento'];
            $desde = $_POST['desde'];  // Actualizado desde 'Alternativo'
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

            $queryInsert = "INSERT INTO establecimientos (
                codigoEstablecimiento, nombreEstablecimiento, desde, hasta, comentarios,
                text1, text2, text3, string1, string2, string3,
                enum1, enum2, enum3, integer1, integer2, integer3,
                decimal1, decimal2, decimal3, created_at, updated_at
            ) VALUES (
                '$codigoEstablecimiento', '$nombreEstablecimiento', '$desde', '$hasta', '$comentarios',
                '$text1', '$text2', '$text3', '$string1', '$string2', '$string3',
                '$enum1', '$enum2', '$enum3', '$integer1', '$integer2', '$integer3',
                '$decimal1', '$decimal2', '$decimal3', '$created_at', '$updated_at'
            )";



            


						
            $resultInsert = $conn->query($queryInsert);

            if ($resultInsert) {
                echo('<center> <img src="../../imagenes/errorok.png"> </center>');
                // Resto del código después de la inserción exitosa
            } else {
                echo('<center> <img src="../../imagenes/error1.png"> </center>');
            }

            $conn->close(); // Cierra la conexión a la base de datos
        }
    ?> 

    <script>
        $(document).ready(function() {
            // Inicializar las pestañas
            $('.nav-tabs a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
                mostrarCampos();
            });

            // Mostrar los campos correspondientes a la pestaña activa
            function mostrarCampos() {
                var pestañaActiva = $('.nav-tabs .active').attr('href');
                $('.tab-pane').removeClass('show active'); // Ocultar todos los campos
                $(pestañaActiva).addClass('show active'); // Mostrar el campo de la pestaña activa
            }

            // Llamar a mostrarCampos() al cargar la página para asegurarse de que esté sincronizado
            mostrarCampos();
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
