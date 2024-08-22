<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

// Verificar si se ha enviado una búsqueda
if (isset($_POST["buscar"])) {
    // Array asociativo que mapea los campos de búsqueda con sus valores
    $camposBusqueda = array(
        "codigoTrabajador" => "buscarCodigoTrabajador",
        "apellido1" => "buscarApellido1",
        "apellido2" => "buscarApellido2",
        "nombre1" => "buscarNombre1",
        "nombre2" => "buscarNombre2",
        "nombre3" => "buscarNombre3",
        "nombrePuesto" => "buscarNombrePuesto",
        "apellidoCasada" => "buscarApellidoCasada",
        // Agrega aquí los campos que necesites
    );

    // Crear una consulta SQL dinámica para buscar en cualquier campo
    // Inicializar la variable de consulta
    $queryBuscar = "SELECT * FROM empleados WHERE ";
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
                        <label for="buscarCodigoTrabajador" class="col-sm-3 col-form-label">Código del Trabajador:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarCodigoTrabajador" name="buscarCodigoTrabajador" placeholder="Ingrese el código del trabajador">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarNombre1" class="col-sm-3 col-form-label">Nombre1 del Trabajador:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarNombre1" name="buscarNombre1" placeholder="Ingrese el nombre1 del trabajador">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarNombre2" class="col-sm-3 col-form-label">Nombre2 del Trabajador:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarNombre2" name="buscarNombre2" placeholder="Ingrese el nombre2 del trabajador">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarNombre3" class="col-sm-3 col-form-label">Tercer Nombre:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarNombre3" name="buscarNombre3" placeholder="Ingrese el tercer nombre">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarApellido1" class="col-sm-3 col-form-label">Primer Apellido:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarApellido1" name="buscarApellido1" placeholder="Ingrese el primer apellido">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarApellido2" class="col-sm-3 col-form-label">Segundo Apellido:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarApellido2" name="buscarApellido2" placeholder="Ingrese el segundo apellido">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarApellidoCasada" class="col-sm-3 col-form-label">Apellido de Casada:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarApellidoCasada" name="buscarApellidoCasada" placeholder="Ingrese el apellido de casada">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarSexo" class="col-sm-3 col-form-label">Sexo:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="buscarSexo" name="buscarSexo">
                                <option value="HOMBRE">HOMBRE</option>
                                <option value="MUJER">MUJER</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarFechaNacimiento" class="col-sm-3 col-form-label">Fecha de Nacimiento:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="buscarFechaNacimiento" name="buscarFechaNacimiento" placeholder="Ingrese la fecha de nacimiento">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarEstadoCivil" class="col-sm-3 col-form-label">Estado Civil:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="buscarEstadoCivil" name="buscarEstadoCivil" placeholder="Ingrese estado civil">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCantidadHijos" class="col-sm-3 col-form-label">Cantidad de Hijos:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarCantidadHijos" name="buscarCantidadHijos" placeholder="Ingrese la cantidad de hijos">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCantidadVivenCasa" class="col-sm-3 col-form-label">Cantidad que Viven en Casa:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="buscarCantidadVivenCasa" name="buscarCantidadVivenCasa" placeholder="Ingrese la cantidad que vive en casa">
                        </div>
                    </div>

                    <!-- Completa los campos restantes de hoja1Editar -->
                </div>

                <div class="tab-pane fade" id="hoja2">
                    <div class="form-group row">
                        <label for="buscarSalarioBase" class="col-sm-3 col-form-label">Salario Base:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarSalarioBase" name="buscarSalarioBase" placeholder="Ingrese el salario base">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarBonoLey" class="col-sm-3 col-form-label">Bono Ley:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarBonoLey" name="buscarBonoLey" placeholder="Ingrese el bono de ley">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarEstado1" class="col-sm-3 col-form-label">Estado 1:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarEstado1" name="buscarEstado1" placeholder="Ingrese el estado 1">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarEstadosId" class="col-sm-3 col-form-label">ID de Estado:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarEstadosId" name="buscarEstadosId" placeholder="Ingrese el ID de estado">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarPuestosId" class="col-sm-3 col-form-label">ID de Puesto:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarPuestosId" name="buscarPuestosId" placeholder="Ingrese el ID de puesto">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarNombrePuesto" class="col-sm-3 col-form-label">Nombre de Puesto:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNombrePuesto" name="buscarNombrePuesto" placeholder="Ingrese el nombre de puesto">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarJefesId" class="col-sm-3 col-form-label">ID de Jefe:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarJefesId" name="buscarJefesId" placeholder="Ingrese el ID de jefe">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarFechaIngreso" class="col-sm-3 col-form-label">Fecha de Ingreso:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarFechaIngreso" name="buscarFechaIngreso">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarTipoContrato" class="col-sm-3 col-form-label">Tipo de Contrato:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTipoContrato" name="buscarTipoContrato" placeholder="Ingrese el tipo de contrato">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarTemporalidadContrato" class="col-sm-3 col-form-label">Temporalidad de Contrato:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTemporalidadContrato" name="buscarTemporalidadContrato" placeholder="Ingrese la temporalidad del contrato">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarJornadaTrabajo" class="col-sm-3 col-form-label">Jornada de Trabajo:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarJornadaTrabajo" name="buscarJornadaTrabajo" placeholder="Ingrese la jornada de trabajo">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarOcupacionesId" class="col-sm-3 col-form-label">ID de Ocupación:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarOcupacionesId" name="buscarOcupacionesId" placeholder="Ingrese el ID de ocupación">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarMontoIndemnizacion" class="col-sm-3 col-form-label">Monto de Indemnización:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarMontoIndemnizacion" name="buscarMontoIndemnizacion" placeholder="Ingrese el monto de indemnización">
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja3">
                    <div class="form-group row">
                        <label for="buscarZonasId" class="col-sm-3 col-form-label">ID de Zona:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarZonasId" name="buscarZonasId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarEstablecimientosId" class="col-sm-3 col-form-label">ID de Zona:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarEstablecimientosId" name="buscarEstablecimientosId">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCosto1sId" class="col-sm-3 col-form-label">ID de Costo 1:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarCosto1sId" name="buscarCosto1sId">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCosto2sId" class="col-sm-3 col-form-label">ID de Costo 2:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarCosto2sId" name="buscarCosto2sId">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCosto3sId" class="col-sm-3 col-form-label">ID de Costo 3:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarCosto3sId" name="buscarCosto3sId">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="buscarCosto4sId" class="col-sm-3 col-form-label">ID de Costo 4:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarCosto4sId" name="buscarCosto4sId">
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja4">
                    <div class="form-group row">
                        <label for="buscarTipoDiscapacidad" class="col-sm-3 col-form-label">Tipo de Discapacidad:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTipoDiscapacidad" name="buscarTipoDiscapacidad">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="campoBuscar" class="col-sm-3 col-form-label">Tarjeta de Salud:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="campoBuscar" name="campoBuscar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarTarjetaSalud" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Salud:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarTarjetaSalud" name="buscarTarjetaSalud">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarTarjetaManipulacion" class="col-sm-3 col-form-label">Tarjeta de Manipulación:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTarjetaManipulacion" name="buscarTarjetaManipulacion">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarVencimientoManipulacion" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Manipulación:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarVencimientoManipulacion" name="buscarVencimientoManipulacion">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarTarjetaPulmones" class="col-sm-3 col-form-label">Tarjeta de Pulmones:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTarjetaPulmones" name="buscarTarjetaPulmones">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarVencimientoPulmones" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Pulmones:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarVencimientoPulmones" name="buscarVencimientoPulmones">
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja5">
                    <div class="form-group row">
                        <label for="buscarTipoIdentificacion" class="col-sm-3 col-form-label">Tipo de Identificación:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTipoIdentificacion" name="buscarTipoIdentificacion">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarDocumentoIdentificacion" class="col-sm-3 col-form-label">Documento de Identificación:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarDocumentoIdentificacion" name="buscarDocumentoIdentificacion">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNumeroIgss" class="col-sm-3 col-form-label">Número de IGSS:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNumeroIgss" name="buscarNumeroIgss">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarVencimientoIgss" class="col-sm-3 col-form-label">Vencimiento de IGSS:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarVencimientoIgss" name="buscarVencimientoIgss">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNumeroIrtra" class="col-sm-3 col-form-label">Número de IRTRA:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNumeroIrtra" name="buscarNumeroIrtra">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarVencimientoIrtra" class="col-sm-3 col-form-label">Vencimiento de IRTRA:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarVencimientoIrtra" name="buscarVencimientoIrtra">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNit" class="col-sm-3 col-form-label">NIT:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNit" name="buscarNit">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarTipoLicencia" class="col-sm-3 col-form-label">Tipo de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTipoLicencia" name="buscarTipoLicencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNumeroLicencia" class="col-sm-3 col-form-label">Número de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNumeroLicencia" name="buscarNumeroLicencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarVencimientoLicencia" class="col-sm-3 col-form-label">Vencimiento de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="buscarVencimientoLicencia" name="buscarVencimientoLicencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarPuebloOrigen" class="col-sm-3 col-form-label">Pueblo de Origen:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarPuebloOrigen" name="buscarPuebloOrigen">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNacionalidadesId" class="col-sm-3 col-form-label">ID Nacionalidad:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNacionalidadesId" name="buscarNacionalidadesId">
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja6">
                    <div class="form-group row">
                        <label for="buscarEstudiosId" class="col-sm-3 col-form-label">ID de Estudios:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarEstudiosId" name="buscarEstudiosId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNombreEstudio" class="col-sm-3 col-form-label">Nombre del Estudio:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNombreEstudio" name="buscarNombreEstudio">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarOtrosEstudios" class="col-sm-3 col-form-label">Otros Estudios:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarOtrosEstudios" name="buscarOtrosEstudios">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarIdiomasId" class="col-sm-3 col-form-label">ID de Idiomas:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarIdiomasId" name="buscarIdiomasId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarUltimoGradoAprobado" class="col-sm-3 col-form-label">Último Grado Aprobado:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarUltimoGradoAprobado" name="buscarUltimoGradoAprobado">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNotaExamenPsicometrico" class="col-sm-3 col-form-label">Nota de Examen Psicométrico:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNotaExamenPsicometrico" name="buscarNotaExamenPsicometrico">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNotaExamenExcel" class="col-sm-3 col-form-label">Nota de Examen Excel:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNotaExamenExcel" name="buscarNotaExamenExcel">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNotaExamenContable" class="col-sm-3 col-form-label">Nota de Examen Contable:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNotaExamenContable" name="buscarNotaExamenContable">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNotaExamenGeneral" class="col-sm-3 col-form-label">Nota de Examen General:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNotaExamenGeneral" name="buscarNotaExamenGeneral">
                        </div>
                    </div>

                    <!-- Resto de campos -->
                </div>
                
                <div class="tab-pane fade" id="hoja7">
                    <div class="form-group row">
                        <label for="buscarTelefono" class="col-sm-3 col-form-label">Teléfono:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTelefono" name="buscarTelefono">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarContactoEmergencia" class="col-sm-3 col-form-label">Contacto de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarContactoEmergencia" name="buscarContactoEmergencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarTelefonoEmergencia" class="col-sm-3 col-form-label">Teléfono de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarTelefonoEmergencia" name="buscarTelefonoEmergencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarDireccionTrabajador" class="col-sm-3 col-form-label">Dirección del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarDireccionTrabajador" name="buscarDireccionTrabajador">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarDireccionEmergencia" class="col-sm-3 col-form-label">Dirección de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarDireccionEmergencia" name="buscarDireccionEmergencia">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNombreDepartamentoTrabajador" class="col-sm-3 col-form-label">Nombre de Departamento del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNombreDepartamentoTrabajador" name="buscarNombreDepartamentoTrabajador">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNombreMunicipioTrabajador" class="col-sm-3 col-form-label">Nombre de Municipio del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNombreMunicipioTrabajador" name="buscarNombreMunicipioTrabajador">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarZonaTrabajador" class="col-sm-3 col-form-label">Zona del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarZonaTrabajador" name="buscarZonaTrabajador">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarDepartamentosId" class="col-sm-3 col-form-label">ID de Departamento:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarDepartamentosId" name="buscarDepartamentosId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarMunicipiosId" class="col-sm-3 col-form-label">ID de Municipio:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarMunicipiosId" name="buscarMunicipiosId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNombreMunicipioDpi" class="col-sm-3 col-form-label">Nombre de Municipio DPI:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="-buscarNombreMunicipioDpi" name="buscarNombreMunicipioDpi">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="buscarNombreDepartamentoDPI" class="col-sm-3 col-form-label">Nombre de Departamento DPI:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="buscarNombreDepartamentoDPI" name="buscarNombreDepartamentoDPI">
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja8">
                    

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
