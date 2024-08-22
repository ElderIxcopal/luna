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
        <h4>Nuevo Empleado:</h4>
        <form name="fcrearemp" method="post" action="<?=$_SERVER['PHP_SELF']?>" onSubmit="return validar_campos();" class="needs-validation" novalidate>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#hoja1">Personales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja2">Contrato</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja3">Contabilidad</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja4">Medicos</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja5">Identidad</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja6">Estudios</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja7">Contacto</a>
                </li>
				</li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja8">Propiedades</a>
                </li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja9">Otros</a>
                </li>
            </ul>

			<div class="tab-content">
				<div class="tab-pane fade show active" id="hoja1">
					<div class="form-group row">
						<label for="codigoTrabajador" class="col-sm-3 col-form-label">Código:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="codigoTrabajador" name="codigoTrabajador" required>
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombre1" class="col-sm-3 col-form-label">Primer nombre:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombre1" name="nombre1" required>
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombre2" class="col-sm-3 col-form-label">Segundo nombre:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombre2" name="nombre2" required>
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombre3" class="col-sm-3 col-form-label">Tercer nombre:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombre3" name="nombre3">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="apellido1" class="col-sm-3 col-form-label">Primer apellido:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="apellido1" name="apellido1">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="apellido2" class="col-sm-3 col-form-label">Segundo apellido:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="apellido2" name="apellido2">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="apellidoCasada" class="col-sm-3 col-form-label">Apellido de casada:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="apellidoCasada" name="apellidoCasada">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="sexo" class="col-sm-3 col-form-label">Sexo:</label>
						<div class="col-sm-9">
						<select class="form-control" id="sexo" name="sexo">
							<option value="HOMBRE">HOMBRE</option>
							<option value="MUJER">MUJER</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="fechaNacimiento" class="col-sm-3 col-form-label">Fecha de nacimiento:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="estadoCivil" class="col-sm-3 col-form-label">Estado civil:</label>
						<div class="col-sm-9">
						<select class="form-control" id="estadoCivil" name="estadoCivil">
							<option value="SOLTERO(A)">SOLTERO(A)</option>
							<option value="CASADO(A)">CASADO(A)</option>
							<option value="UNIDO(A)">UNIDO(A)</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="cantidadHijos" class="col-sm-3 col-form-label">Cantidad de hijos:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="cantidadHijos" name="cantidadHijos">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="cantidadVivenCasa" class="col-sm-3 col-form-label">Cantidad que viven en casa:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="cantidadVivenCasa" name="cantidadVivenCasa">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
				</div>	

				<div class="tab-pane fade" id="hoja2">
					<div class="form-group row">
						<label for="salarioBase" class="col-sm-3 col-form-label">Salario Base:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="salarioBase" name="salarioBase">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="bonoLey" class="col-sm-3 col-form-label">Bono Ley:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="bonoLey" name="bonoLey">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="estado1" class="col-sm-3 col-form-label">Estado 1:</label>
						<div class="col-sm-9">
						<select class="form-control" id="estado1" name="estado1">
							<option value="ALTA">ALTA</option>
							<option value="BAJA">BAJA</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="estados_id" class="col-sm-3 col-form-label">ID de Estado:</label>
						<div class="col-sm-9">
						<select class="form-control" id="estados_id" name="estados_id">
						<option value="">Selecciona un estado</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla estados
						// Asumiendo que $conn es la conexión a la base de datos

						$queryEstados = "SELECT id, estado2 FROM estados";
						$resultEstados = mysqli_query($conn, $queryEstados);

						while ($row = mysqli_fetch_assoc($resultEstados)) {
							echo '<option value="' . $row['id'] . '">' . $row['estado2'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>


							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="puestos_id" class="col-sm-3 col-form-label">ID de Puesto:</label>
						<div class="col-sm-9">
						<select class="form-control" id="puestos_id" name="puestos_id">
						<option value="">Selecciona un puesto</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla puestos
						// Asumiendo que $conn es la conexión a la base de datos

						$queryPuestos = "SELECT id, codigoPuesto FROM puestos";
						$resultPuestos = mysqli_query($conn, $queryPuestos);

						while ($row = mysqli_fetch_assoc($resultPuestos)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoPuesto'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombrePuesto" class="col-sm-3 col-form-label">Nombre de Puesto:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombrePuesto" name="nombrePuesto">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="jefes_id" class="col-sm-3 col-form-label">ID de Jefe:</label>
						<div class="col-sm-9">
						<select class="form-control" id="jefes_id" name="jefes_id">
						<option value="">Selecciona un jefe</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla jefes
						// Asumiendo que $conn es la conexión a la base de datos

						$queryJefes = "SELECT id, nombreJefe FROM jefes";
						$resultJefes = mysqli_query($conn, $queryJefes);

						while ($row = mysqli_fetch_assoc($resultJefes)) {
							echo '<option value="' . $row['id'] . '">' . $row['nombreJefe'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="fechaIngreso" class="col-sm-3 col-form-label">Fecha de Ingreso:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="fechaIngreso" name="fechaIngreso">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="tipoContrato" class="col-sm-3 col-form-label">Tipo de Contrato:</label>
						<div class="col-sm-9">
						<select class="form-control" id="tipoContrato" name="tipoContrato">
							<option value="VERBAL">VERBAL</option>
							<option value="ESCRITO">ESCRITO</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="temporalidadContrato" class="col-sm-3 col-form-label">Temporalidad de Contrato:</label>
						<div class="col-sm-9">
						<select class="form-control" id="temporalidadContrato" name="temporalidadContrato">
							<option value="INDEFINIDO">INDEFINIDO</option>
							<option value="DEFINIDO">DEFINIDO</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="jornadaTrabajo" class="col-sm-3 col-form-label">Jornada de Trabajo:</label>
						<div class="col-sm-9">
						<select class="form-control" id="jornadaTrabajo" name="jornadaTrabajo">
							<option value="DIURNA">DIURNA</option>
							<option value="MIXTA">MIXTA</option>
							<option value="NOCTURA">NOCTURA</option>
							<option value="NO ESTA SUJETO A JORNADA">NO ESTA SUJETO A JORNADA</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="ocupaciones_id" class="col-sm-3 col-form-label">ID de Ocupación:</label>
						<div class="col-sm-9">
						<select class="form-control" id="ocupaciones_id" name="ocupaciones_id">
						<option value="">Selecciona una ocupación</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla ocupaciones
						// Asumiendo que $conn es la conexión a la base de datos

						$queryOcupaciones = "SELECT id, codigoOcupacion FROM ocupaciones";
						$resultOcupaciones = mysqli_query($conn, $queryOcupaciones);

						while ($row = mysqli_fetch_assoc($resultOcupaciones)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoOcupacion'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="montoIndemnizacion" class="col-sm-3 col-form-label">Monto de Indemnización:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="montoIndemnizacion" name="montoIndemnizacion">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="hoja3">

					<div class="form-group row">
						<label for="zonas_id" class="col-sm-3 col-form-label">ID de Zona:</label>
						<div class="col-sm-9">
						<select class="form-control" id="zonas_id" name="zonas_id">
						<option value="">Selecciona una zona</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla zonas
						// Asumiendo que $conn es la conexión a la base de datos

						$queryZonas = "SELECT id, nombreZona FROM zonas";
						$resultZonas = mysqli_query($conn, $queryZonas);

						while ($row = mysqli_fetch_assoc($resultZonas)) {
							echo '<option value="' . $row['id'] . '">' . $row['nombreZona'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="costo1s_id" class="col-sm-3 col-form-label">ID de Costo 1:</label>
						<div class="col-sm-9">
							<select class="form-control" id="costo1s_id" name="costo1s_id">
								<option value="">Selecciona un costo1</option>
								<?php
								// Conexión a la base de datos y consulta para obtener los datos de costo1s
								// Asumiendo que $conn es la conexión a la base de datos

								$queryCostos1 = "SELECT id, nombreCosto1 FROM costo1s";
								$resultCostos1 = mysqli_query($conn, $queryCostos1);

								while ($row = mysqli_fetch_assoc($resultCostos1)) {
									echo '<option value="' . $row['id'] . '">' . $row['nombreCosto1'] . '</option>';
								}

								// Cierra la conexión a la base de datos hasta el final del formulario
								//mysqli_close($conn);
								?>
							</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="costo2s_id" class="col-sm-3 col-form-label">ID de Costo 2:</label>
						<div class="col-sm-9">
							<select class="form-control" id="costo2s_id" name="costo2s_id">
							<option value="">Selecciona un costo2</option>
							<?php
							// Conexión a la base de datos y consulta para obtener los datos de costo2s
							// Asumiendo que $conn es la conexión a la base de datos

							$queryCostos2 = "SELECT id, nombreCosto2 FROM costo2s";
							$resultCostos2 = mysqli_query($conn, $queryCostos2);

							while ($row = mysqli_fetch_assoc($resultCostos2)) {
								echo '<option value="' . $row['id'] . '">' . $row['nombreCosto2'] . '</option>';
							}

							// Cierra la conexión a la base de datos
							//mysqli_close($conn);
							?>
							</select>



							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="costo3s_id" class="col-sm-3 col-form-label">ID de Costo 3:</label>
						<div class="col-sm-9">
						<select class="form-control" id="costo3s_id" name="costo3s_id">
						<option value="">Selecciona un costo3</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de costo3s
						// Asumiendo que $conn es la conexión a la base de datos

						$queryCostos3 = "SELECT id, nombreCosto3 FROM costo3s";
						$resultCostos3 = mysqli_query($conn, $queryCostos3);

						while ($row = mysqli_fetch_assoc($resultCostos3)) {
							echo '<option value="' . $row['id'] . '">' . $row['nombreCosto3'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="costo4s_id" class="col-sm-3 col-form-label">ID de Costo 4:</label>
						<div class="col-sm-9">
						<select class="form-control" id="costo4s_id" name="costo4s_id">
						<option value="">Selecciona un costo4</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de costo4s
						// Asumiendo que $conn es la conexión a la base de datos

						$queryCostos4 = "SELECT id, nombreCosto4 FROM costo4s";
						$resultCostos4 = mysqli_query($conn, $queryCostos4);

						while ($row = mysqli_fetch_assoc($resultCostos4)) {
							echo '<option value="' . $row['id'] . '">' . $row['nombreCosto4'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
				</div>


					<div class="tab-pane fade" id="hoja4">
						<div class="form-group row">
							<label for="tipoDiscapacidad" class="col-sm-3 col-form-label">Tipo de Discapacidad:</label>
							<div class="col-sm-9">
							<select class="form-control" id="tipoDiscapacidad" name="tipoDiscapacidad">
								<option value="NINGUNA">NINGUNA</option>
								<option value="DISCAPACIDAD AUDITIVA">DISCAPACIDAD AUDITIVA</option>
							</select>

								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="tarjetaSalud" class="col-sm-3 col-form-label">Tarjeta de Salud:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="tarjetaSalud" name="tarjetaSalud">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="vencimientoTarjetaSalud" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Salud:</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="vencimientoTarjetaSalud" name="vencimientoTarjetaSalud">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="tarjetaManipulacion" class="col-sm-3 col-form-label">Tarjeta de Manipulación:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="tarjetaManipulacion" name="tarjetaManipulacion">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="vencimientoManipulacion" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Manipulación:</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="vencimientoManipulacion" name="vencimientoManipulacion">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="tarjetaPulmones" class="col-sm-3 col-form-label">Tarjeta de Pulmones:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="tarjetaPulmones" name="tarjetaPulmones">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="vencimientoPulmones" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Pulmones:</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="vencimientoPulmones" name="vencimientoPulmones">
								<div class="invalid-feedback">Este campo es obligatorio.</div>
							</div>
						</div>
					</div>

				<div class="tab-pane fade" id="hoja5">
					<div class="form-group row">
						<label for="tipoIdentificacion" class="col-sm-3 col-form-label">Tipo de Identificación:</label>
						<div class="col-sm-9">
						<select class="form-control" id="tipoIdentificacion" name="tipoIdentificacion">
							<option value="DPI">DPI</option>
							<option value="CERTIFICADO DE NACIMIENTO">CERTIFICADO DE NACIMIENTO</option>
							<option value="PASAPORTE">PASAPORTE</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="documentoIdentificacion" class="col-sm-3 col-form-label">Documento de Identificación:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="documentoIdentificacion" name="documentoIdentificacion">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="numeroIgss" class="col-sm-3 col-form-label">Número de IGSS:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="numeroIgss" name="numeroIgss">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="vencimientoIgss" class="col-sm-3 col-form-label">Vencimiento de IGSS:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="vencimientoIgss" name="vencimientoIgss">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="numeroIrtra" class="col-sm-3 col-form-label">Número de IRTRA:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="numeroIrtra" name="numeroIrtra">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="vencimientoIrtra" class="col-sm-3 col-form-label">Vencimiento de IRTRA:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="vencimientoIrtra" name="vencimientoIrtra">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nit" class="col-sm-3 col-form-label">NIT:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nit" name="nit">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="tipoLicencia" class="col-sm-3 col-form-label">Tipo de Licencia:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="tipoLicencia" name="tipoLicencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="numeroLicencia" class="col-sm-3 col-form-label">Número de Licencia:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="numeroLicencia" name="numeroLicencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="vencimientoLicencia" class="col-sm-3 col-form-label">Vencimiento de Licencia:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="vencimientoLicencia" name="vencimientoLicencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="puebloOrigen" class="col-sm-3 col-form-label">Pueblo de Origen:</label>
						<div class="col-sm-9">
						<select class="form-control" id="puebloOrigen" name="puebloOrigen">
							<option value="MAYA">MAYA</option>
							<option value="GARIFUNA">GARIFUNA</option>
							<option value="XINKA">XINKA</option>
							<option value="AFRODESCENDIENTE / CREOLE / AFROMESTIZO">AFRODESCENDIENTE / CREOLE / AFROMESTIZO</option>
							<option value="LADINO">LADINO</option>
							<option value="EXTRANJERO">EXTRANJERO</option>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nacionalidades_id" class="col-sm-3 col-form-label">ID Nacionalidad:</label>
						<div class="col-sm-9">
						<select class="form-control" id="nacionalidades_id" name="nacionalidades_id">
						<option value="">Selecciona una nacionalidad</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla nacionalidades
						// Asumiendo que $conn es la conexión a la base de datos

						$queryNacionalidades = "SELECT id, codigoNacionalidad FROM nacionalidades";
						$resultNacionalidades = mysqli_query($conn, $queryNacionalidades);

						while ($row = mysqli_fetch_assoc($resultNacionalidades)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoNacionalidad'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>

				</div>


				<div class="tab-pane fade" id="hoja6">
					<div class="form-group row">
						<label for="estudios_id" class="col-sm-3 col-form-label">ID de Estudios:</label>
						<div class="col-sm-9">
						<select class="form-control" id="estudios_id" name="estudios_id">
						<option value="">Selecciona un estudio</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla estudios
						// Asumiendo que $conn es la conexión a la base de datos

						$queryEstudios = "SELECT id, codigoEstudio FROM estudios";
						$resultEstudios = mysqli_query($conn, $queryEstudios);

						while ($row = mysqli_fetch_assoc($resultEstudios)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoEstudio'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombreEstudio" class="col-sm-3 col-form-label">Nombre del Estudio:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombreEstudio" name="nombreEstudio">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="otrosEstudios" class="col-sm-3 col-form-label">Otros Estudios:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="otrosEstudios" name="otrosEstudios">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="idiomas_id" class="col-sm-3 col-form-label">ID de Idiomas:</label>
						<div class="col-sm-9">
						<select class="form-control" id="idiomas_id" name="idiomas_id">
						<option value="">Selecciona un idioma</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla idiomas
						// Asumiendo que $conn es la conexión a la base de datos

						$queryIdiomas = "SELECT id, nombreIdioma FROM idiomas";
						$resultIdiomas = mysqli_query($conn, $queryIdiomas);

						while ($row = mysqli_fetch_assoc($resultIdiomas)) {
							echo '<option value="' . $row['id'] . '">' . $row['nombreIdioma'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="ultimoGradoAprobado" class="col-sm-3 col-form-label">Último Grado Aprobado:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="ultimoGradoAprobado" name="ultimoGradoAprobado">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="notaExamenPsicometrico" class="col-sm-3 col-form-label">Nota de Examen Psicométrico:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="notaExamenPsicometrico" name="notaExamenPsicometrico">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="notaExamenExcel" class="col-sm-3 col-form-label">Nota de Examen Excel:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="notaExamenExcel" name="notaExamenExcel">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="notaExamenContable" class="col-sm-3 col-form-label">Nota de Examen Contable:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="notaExamenContable" name="notaExamenContable">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="notaExamenGeneral" class="col-sm-3 col-form-label">Nota de Examen General:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="notaExamenGeneral" name="notaExamenGeneral">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<!-- Resto de campos -->
				</div>


				<div class="tab-pane fade" id="hoja7">
					<div class="form-group row">
						<label for="telefono" class="col-sm-3 col-form-label">Teléfono:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="telefono" name="telefono">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="contactoEmergencia" class="col-sm-3 col-form-label">Contacto de Emergencia:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="contactoEmergencia" name="contactoEmergencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="telefonoEmergencia" class="col-sm-3 col-form-label">Teléfono de Emergencia:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="telefonoEmergencia" name="telefonoEmergencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label for="direccionTrabajador" class="col-sm-3 col-form-label">Dirección del Trabajador:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="direccionTrabajador" name="direccionTrabajador">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="direccionEmergencia" class="col-sm-3 col-form-label">Dirección de Emergencia:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="direccionEmergencia" name="direccionEmergencia">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombreDepartamentoTrabajador" class="col-sm-3 col-form-label">Nombre de Departamento del Trabajador:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombreDepartamentoTrabajador" name="nombreDepartamentoTrabajador">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombreMunicipioTrabajador" class="col-sm-3 col-form-label">Nombre de Municipio del Trabajador:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombreMunicipioTrabajador" name="nombreMunicipioTrabajador">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="zonaTrabajador" class="col-sm-3 col-form-label">Zona del Trabajador:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="zonaTrabajador" name="zonaTrabajador">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="departamentos_id" class="col-sm-3 col-form-label">ID de Departamento:</label>
						<div class="col-sm-9">
						<select class="form-control" id="departamentos_id" name="departamentos_id">
						<option value="">Selecciona un departamento</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla departamentos
						// Asumiendo que $conn es la conexión a la base de datos

						$queryDepartamentos = "SELECT id, codigoDepartamento FROM departamentos";
						$resultDepartamentos = mysqli_query($conn, $queryDepartamentos);

						while ($row = mysqli_fetch_assoc($resultDepartamentos)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoDepartamento'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="municipios_id" class="col-sm-3 col-form-label">ID de Municipio:</label>
						<div class="col-sm-9">
						<select class="form-control" id="municipios_id" name="municipios_id">
						<option value="">Selecciona un municipio</option>
						<?php
						// Conexión a la base de datos y consulta para obtener los datos de la tabla municipios
						// Asumiendo que $conn es la conexión a la base de datos

						$queryMunicipios = "SELECT id, codigoMunicipio FROM municipios";
						$resultMunicipios = mysqli_query($conn, $queryMunicipios);

						while ($row = mysqli_fetch_assoc($resultMunicipios)) {
							echo '<option value="' . $row['id'] . '">' . $row['codigoMunicipio'] . '</option>';
						}

						// Cierra la conexión a la base de datos
						//mysqli_close($conn);
						?>
						</select>

							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombreMunicipioDpi" class="col-sm-3 col-form-label">Nombre de Municipio DPI:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombreMunicipioDpi" name="nombreMunicipioDpi">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombreDepartamentoDPI" class="col-sm-3 col-form-label">Nombre de Departamento DPI:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nombreDepartamentoDPI" name="nombreDepartamentoDPI">
							<div class="invalid-feedback">Este campo es obligatorio.</div>
						</div>
					</div>
				</div>


				<div class="tab-pane fade" id="hoja8">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Solicitud:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneSolicitud_si" name="tieneSolicitud" value="SI">
								<label class="form-check-label" for="tieneSolicitud_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneSolicitud_no" name="tieneSolicitud" value="NO">
								<label class="form-check-label" for="tieneSolicitud_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Inducción:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneInduccion_si" name="tieneInduccion" value="SI">
								<label class="form-check-label" for="tieneInduccion_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneInduccion_no" name="tieneInduccion" value="NO">
								<label class="form-check-label" for="tieneInduccion_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Contrato AMT:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneContratoAMT_si" name="tieneContratoAMT" value="SI">
								<label class="form-check-label" for="tieneContratoAMT_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneContratoAMT_no" name="tieneContratoAMT" value="NO">
								<label class="form-check-label" for="tieneContratoAMT_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Convenio Confidencialidad:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_si" name="tieneConvenioConfidencialidad" value="SI">
								<label class="form-check-label" for="tieneConvenioConfidencialidad_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_no" name="tieneConvenioConfidencialidad" value="NO">
								<label class="form-check-label" for="tieneConvenioConfidencialidad_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Papelería Completa:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_si" name="tienePapeleriaCompleta" value="SI">
								<label class="form-check-label" for="tienePapeleriaCompleta_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_no" name="tienePapeleriaCompleta" value="NO">
								<label class="form-check-label" for="tienePapeleriaCompleta_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Equipo:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneEquipo_si" name="tieneEquipo" value="SI">
								<label class="form-check-label" for="tieneEquipo_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneEquipo_no" name="tieneEquipo" value="NO">
								<label class="form-check-label" for="tieneEquipo_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Uniforme:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneUniforme_si" name="tieneUniforme" value="SI">
								<label class="form-check-label" for="tieneUniforme_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneUniforme_no" name="tieneUniforme" value="NO">
								<label class="form-check-label" for="tieneUniforme_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Casco:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCasco_si" name="tieneCasco" value="SI">
								<label class="form-check-label" for="tieneCasco_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCasco_no" name="tieneCasco" value="NO">
								<label class="form-check-label" for="tieneCasco_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Impermeable:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneImpermeable_si" name="tieneImpermeable" value="SI">
								<label class="form-check-label" for="tieneImpermeable_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneImpermeable_no" name="tieneImpermeable" value="NO">
								<label class="form-check-label" for="tieneImpermeable_no">NO</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Capa:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCapa_si" name="tieneCapa" value="SI">
								<label class="form-check-label" for="tieneCapa_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCapa_no" name="tieneCapa" value="NO">
								<label class="form-check-label" for="tieneCapa_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Rodillera::</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneRodillera_si" name="tieneRodillera" value="SI">
								<label class="form-check-label" for="tieneRodillera_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneRodillera_no" name="tieneRodillera" value="NO">
								<label class="form-check-label" for="tieneRodillera_no">NO</label>
							</div>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Codera:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCodera_si" name="tieneCodera" value="SI">
								<label class="form-check-label" for="tieneCodera_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneCodera_no" name="tieneCodera" value="NO">
								<label class="form-check-label" for="tieneCodera_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Chaleco Arnes:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneChalecoArnes_si" name="tieneChalecoArnes" value="SI">
								<label class="form-check-label" for="tieneChalecoArnes_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneChalecoArnes_no" name="tieneChalecoArnes" value="NO">
								<label class="form-check-label" for="tieneChalecoArnes_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Extintor::</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExtintor_si" name="tieneExtintor" value="SI">
								<label class="form-check-label" for="tieneExtintor_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExtintor_no" name="tieneExtintor" value="NO">
								<label class="form-check-label" for="tieneExtintor_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Raven:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneRaven_si" name="tieneRaven" value="SI">
								<label class="form-check-label" for="tieneRaven_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneRaven_no" name="tieneRaven" value="NO">
								<label class="form-check-label" for="tieneRaven_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Examen Psicométrico:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenPsicometrico_si" name="tieneExamenPsicometrico" value="SI">
								<label class="form-check-label" for="tieneExamenPsicometrico_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenPsicometrico_no" name="tieneExamenPsicometrico" value="NO">
								<label class="form-check-label" for="tieneExamenPsicometrico_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Examen Excel:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenExcel_si" name="tieneExamenExcel" value="SI">
								<label class="form-check-label" for="tieneExamenExcel_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenExcel_no" name="tieneExamenExcel" value="NO">
								<label class="form-check-label" for="tieneExamenExcel_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Examen Contable:</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenContable_si" name="tieneExamenContable" value="SI">
								<label class="form-check-label" for="tieneExamenContable_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenContable_no" name="tieneExamenContable" value="NO">
								<label class="form-check-label" for="tieneExamenContable_no">NO</label>
							</div>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tiene Examen General</label>
						<div class="col-sm-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenGeneral_si" name="tieneExamenGeneral" value="SI">
								<label class="form-check-label" for="tieneExamenGeneral_si">SI</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="tieneExamenGeneral_no" name="tieneExamenGeneral" value="NO">
								<label class="form-check-label" for="tieneExamenGeneral_no">NO</label>
							</div>
						</div>
					</div>

					<!-- ... Campos posteriores ... -->
				</div>
            </div>
            
            <br>
            <input type="submit" name="nuevoTrabajador" value="Crear Nuevo Empleado" class="btn btn-primary">
        </form>
    </div>

    <?php 
        if(isset($_POST["nuevoTrabajador"])) {
            // Realizar la inserción en la base de datos utilizando las variables
            include("../../conectarbbdd.php"); // Asegúrate de tener la conexión a la base de datos

			$codigoTrabajador = $_POST['codigoTrabajador'];
			$nombre1 = $_POST['nombre1'];
			$nombre2 = $_POST['nombre2'];
			$nombre3 = $_POST['nombre3'];
			$apellido1 = $_POST['apellido1'];
			$apellido2 = $_POST['apellido2'];
			$apellidoCasada = $_POST['apellidoCasada'];
			$nombrePuesto = $_POST['nombrePuesto'];
			$fechaIngreso = $_POST['fechaIngreso'];
			$salarioBase = $_POST['salarioBase'];
			$bonoLey = $_POST['bonoLey'];
			$estado1 = $_POST['estado1'];
			$estados_id = $_POST['estados_id'];
			$montoIndemnizacion = $_POST['montoIndemnizacion'];
			$jefes_id = $_POST['jefes_id'];
			$puestos_id = $_POST['puestos_id'];
			$costo1s_id = $_POST['costo1s_id'];
			$costo2s_id = $_POST['costo2s_id'];
			$costo3s_id = $_POST['costo3s_id'];
			$costo4s_id = $_POST['costo4s_id'];
			$zonas_id = $_POST['zonas_id'];
			$nacionalidades_id = $_POST['nacionalidades_id'];
			$municipios_id = $_POST['municipios_id'];
			$departamentos_id = $_POST['departamentos_id'];
			$establecimientos_id = $_POST['establecimientos_id'];
			$ocupaciones_id = $_POST['ocupaciones_id'];
			$idiomas_id = $_POST['idiomas_id'];
			$sexo = $_POST['sexo'];
			$tipoContrato = $_POST['tipoContrato'];
			$temporalidadContrato = $_POST['temporalidadContrato'];
			$jornadaTrabajo = $_POST['jornadaTrabajo'];
			$tipoDiscapacidad = $_POST['tipoDiscapacidad'];
			$tipoIdentificacion = $_POST['tipoIdentificacion'];
			$documentoIdentificacion = $_POST['documentoIdentificacion'];
			$nombreMunicipioDpi = $_POST['nombreMunicipioDpi'];
			$nombreDepartamentoDPI = $_POST['nombreDepartamentoDPI'];
			$fechaNacimiento = $_POST['fechaNacimiento'];
			$tipoLicencia = $_POST['tipoLicencia'];
			$numeroLicencia = $_POST['numeroLicencia'];
			$vencimientoLicencia = $_POST['vencimientoLicencia'];
			$nit = $_POST['nit'];
			$numeroIgss = $_POST['numeroIgss'];
			$vencimientoIgss = $_POST['vencimientoIgss'];
			$numeroIrtra = $_POST['numeroIrtra'];
			$vencimientoIrtra = $_POST['vencimientoIrtra'];
			$direccionTrabajador = $_POST['direccionTrabajador'];
			$nombreDepartamentoTrabajador = $_POST['nombreDepartamentoTrabajador'];
			$nombreMunicipioTrabajador = $_POST['nombreMunicipioTrabajador'];
			$zonaTrabajador = $_POST['zonaTrabajador'];
			$cantidadVivenCasa = $_POST['cantidadVivenCasa'];
			$telefono = $_POST['telefono'];
			$estadoCivil = $_POST['estadoCivil'];
			$puebloOrigen = $_POST['puebloOrigen'];
			$cantidadHijos = $_POST['cantidadHijos'];
			$ultimoGradoAprobado = $_POST['ultimoGradoAprobado'];
			$estudios_id = $_POST['estudios_id'];
			$nombreEstudio = $_POST['nombreEstudio'];
			$otrosEstudios = $_POST['otrosEstudios'];
			$contactoEmergencia = $_POST['contactoEmergencia'];
			$direccionEmergencia = $_POST['direccionEmergencia'];
			$telefonoEmergencia = $_POST['telefonoEmergencia'];
			$tarjetaSalud = $_POST['tarjetaSalud'];
			$vencimientoTarjetaSalud = $_POST['vencimientoTarjetaSalud'];
			$tarjetaManipulacion = $_POST['tarjetaManipulacion'];
			$vencimientoManipulacion = $_POST['vencimientoManipulacion'];
			$tarjetaPulmones = $_POST['tarjetaPulmones'];
			$vencimientoPulmones = $_POST['vencimientoPulmones'];
			$tieneSolicitud = $_POST['tieneSolicitud'];
			$tieneInduccion = $_POST['tieneInduccion'];
			$tieneContratoAMT = $_POST['tieneContratoAMT'];
			$tieneConvenioConfidencialidad = $_POST['tieneConvenioConfidencialidad'];
			$tienePapeleriaCompleta = $_POST['tienePapeleriaCompleta'];
			$tieneEquipo = $_POST['tieneEquipo'];
			$tieneUniforme = $_POST['tieneUniforme'];
			$tieneCasco = $_POST['tieneCasco'];
			$tieneImpermeable = $_POST['tieneImpermeable'];
			$tieneCapa = $_POST['tieneCapa'];
			$tieneRodillera = $_POST['tieneRodillera'];
			$tieneCodera = $_POST['tieneCodera'];
			$tieneChalecoArnes = $_POST['tieneChalecoArnes'];
			$tieneExtintor = $_POST['tieneExtintor'];
			$tieneRaven = $_POST['tieneRaven'];
			$tieneExamenPsicometrico = $_POST['tieneExamenPsicometrico'];
			$tieneExamenExcel = $_POST['tieneExamenExcel'];
			$tieneExamenContable = $_POST['tieneExamenContable'];
			$tieneExamenGeneral = $_POST['tieneExamenGeneral'];
			$notaExamenPsicometrico = $_POST['notaExamenPsicometrico'];
			$notaExamenExcel = $_POST['notaExamenExcel'];
			$notaExamenContable = $_POST['notaExamenContable'];
			$notaExamenGeneral = $_POST['notaExamenGeneral'];

            $queryInsert = "INSERT INTO empleados (
				codigoTrabajador, nombre1, nombre2, nombre3, apellido1, apellido2, apellidoCasada, nombrePuesto, fechaIngreso, salarioBase,
				bonoLey, estado1, estados_id, montoIndemnizacion, jefes_id, puestos_id, costo1s_id, costo2s_id, costo3s_id, costo4s_id,
				zonas_id, nacionalidades_id, municipios_id, departamentos_id, establecimientos_id, ocupaciones_id, idiomas_id, sexo, tipoContrato,
				temporalidadContrato, jornadaTrabajo, tipoDiscapacidad, tipoIdentificacion, documentoIdentificacion, nombreMunicipioDpi, nombreDepartamentoDPI,
				fechaNacimiento, tipoLicencia, numeroLicencia, vencimientoLicencia, nit, numeroIgss, vencimientoIgss, numeroIrtra, vencimientoIrtra,
				direccionTrabajador, nombreDepartamentoTrabajador, nombreMunicipioTrabajador, zonaTrabajador, cantidadVivenCasa, telefono,
				estadoCivil, puebloOrigen, cantidadHijos, ultimoGradoAprobado, estudios_id, nombreEstudio, otrosEstudios, contactoEmergencia,
				direccionEmergencia, telefonoEmergencia, tarjetaSalud, vencimientoTarjetaSalud, tarjetaManipulacion, vencimientoManipulacion,
				tarjetaPulmones, vencimientoPulmones, tieneSolicitud, tieneInduccion, tieneContratoAMT, tieneConvenioConfidencialidad,
				tienePapeleriaCompleta, tieneEquipo, tieneUniforme, tieneCasco, tieneImpermeable, tieneCapa, tieneRodillera, tieneCodera,
				tieneChalecoArnes, tieneExtintor, tieneRaven, tieneExamenPsicometrico, tieneExamenExcel, tieneExamenContable, tieneExamenGeneral,
				notaExamenPsicometrico, notaExamenExcel, notaExamenContable, notaExamenGeneral
			) VALUES (
				'$codigoTrabajador', '$nombre1', '$nombre2', '$nombre3', '$apellido1', '$apellido2', '$apellidoCasada', '$nombrePuesto', '$fechaIngreso',
				'$salarioBase', '$bonoLey', '$estado1', '$estados_id', '$montoIndemnizacion', '$jefes_id', '$puestos_id', '$costo1s_id', '$costo2s_id',
				'$costo3s_id', '$costo4s_id', '$zonas_id', '$nacionalidades_id', '$municipios_id', '$departamentos_id', '$establecimientos_id',
				'$ocupaciones_id', '$idiomas_id', '$sexo', '$tipoContrato', '$temporalidadContrato', '$jornadaTrabajo', '$tipoDiscapacidad',
				'$tipoIdentificacion', '$documentoIdentificacion', '$nombreMunicipioDpi', '$nombreDepartamentoDPI', '$fechaNacimiento', '$tipoLicencia',
				'$numeroLicencia', '$vencimientoLicencia', '$nit', '$numeroIgss', '$vencimientoIgss', '$numeroIrtra', '$vencimientoIrtra', '$direccionTrabajador',
				'$nombreDepartamentoTrabajador', '$nombreMunicipioTrabajador', '$zonaTrabajador', '$cantidadVivenCasa', '$telefono', '$estadoCivil',
				'$puebloOrigen', '$cantidadHijos', '$ultimoGradoAprobado', '$estudios_id', '$nombreEstudio', '$otrosEstudios', '$contactoEmergencia',
				'$direccionEmergencia', '$telefonoEmergencia', '$tarjetaSalud', '$vencimientoTarjetaSalud', '$tarjetaManipulacion', '$vencimientoManipulacion',
				'$tarjetaPulmones', '$vencimientoPulmones', '$tieneSolicitud', '$tieneInduccion', '$tieneContratoAMT', '$tieneConvenioConfidencialidad',
				'$tienePapeleriaCompleta', '$tieneEquipo', '$tieneUniforme', '$tieneCasco', '$tieneImpermeable', '$tieneCapa', '$tieneRodillera',
				'$tieneCodera', '$tieneChalecoArnes', '$tieneExtintor', '$tieneRaven', '$tieneExamenPsicometrico', '$tieneExamenExcel', '$tieneExamenContable',
				'$tieneExamenGeneral', '$notaExamenPsicometrico', '$notaExamenExcel', '$notaExamenContable', '$notaExamenGeneral'
			)";

						
            $resultInsert = $conn->query($queryInsert);

			if ($resultInsert) {
				echo('<center>Registro creado exitosamente!</center>');
				// Resto del código después de la inserción exitosa
			} else {
				echo('<center>No se ha podido crear un nuevo registro.</center>');
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
