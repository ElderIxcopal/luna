<?php
require_once('../../login/comprobarweb.php');
include("../../conectarbbdd.php");

// Variables para almacenar los valores actuales de los campos
$codigoTrabajador = '';
$nombre1 = '';
$nombre2 = '';

$idRegistroEditar = isset($_GET["idRegistroEditar"]) ? $_GET['idRegistroEditar'] : null;

// Verificar si se ha pasado un ID de registro en la URL
if ($idRegistroEditar !== null) {
    // Realizar la consulta para obtener los datos de búsqueda
    $queryBuscar = "SELECT * FROM empleados WHERE id = ?";
    
    // Utilizar una consulta preparada para evitar la inyección SQL
    if ($stmt = $conn->prepare($queryBuscar)) {
        $stmt->bind_param("i", $idRegistroEditar);
        $stmt->execute();
        $resultBuscar = $stmt->get_result();
        
        if ($resultBuscar->num_rows > 0) {
            $row = $resultBuscar->fetch_assoc();
            
            // Almacenar los valores actuales de los campos y pasar al formulario 
            // o bien pasar $row directo al formulario y no asignar valor aqui
            $codigoTrabajador = $row['codigoTrabajador'];

        }
        
        $stmt->close();
    }
}

// ...

if (isset($_POST["actualizar"])) {
    // Obtener los valores actualizados del formulario
    $codigoTrabajador = $_POST['codigoTrabajador'] ?? "";
    $nombre1 = $_POST['nombre1'] ?? "";
    $nombre2 = $_POST['nombre2'] ?? "";
    $nombre3 = $_POST['nombre3'] ?? "";
    $apellido1 = $_POST['apellido1'] ?? "";
    $apellido2 = $_POST['apellido2'] ?? "";
    $apellidoCasada = $_POST['apellidoCasada'] ?? "";
    $bonoLey = $_POST['bonoLey'] ?? "";
    $cantidadHijos = $_POST['cantidadHijos'] ?? "";
    $cantidadVivenCasa = $_POST['cantidadVivenCasa'] ?? "";
    $contactoEmergencia = $_POST['contactoEmergencia'] ?? "";
    $costo1s_id = $_POST['costo1s_id'] ?? "";
    $costo2s_id = $_POST['costo2s_id'] ?? "";
    $costo3s_id = $_POST['costo3s_id'] ?? "";
    $costo4s_id = $_POST['costo4s_id'] ?? "";
    $departamentos_id = $_POST['departamentos_id'] ?? "";
    $direccionEmergencia = $_POST['direccionEmergencia'] ?? "";
    $direccionTrabajador = $_POST['direccionTrabajador'] ?? "";
    $documentoIdentificacion = $_POST['documentoIdentificacion'] ?? "";
    $establecimientos_id = $_POST['establecimientos_id'] ?? "";
    $estadoNomina = $_POST['estadoNomina'] ?? "";
    $estadoCivil_id = $_POST['estadoCivil_id'] ?? "";
    $estados_id = $_POST['estados_id'] ?? "";
    $estudios_id = $_POST['estudios_id'] ?? "";
    $fechaIngreso = $_POST['fechaIngreso'] ?? "";
    $fechaNacimiento = $_POST['fechaNacimiento'] ?? "";
    $idiomas_id = $_POST['idiomas_id'] ?? "";
    $jefes_id = $_POST['jefes_id'] ?? "";
    $jornadaTrabajo = $_POST['jornadaTrabajo'] ?? "";
    $montoIndemnizacion = $_POST['montoIndemnizacion'] ?? "";
    $municipios_id = $_POST['municipios_id'] ?? "";
    $nacionalidades_id = $_POST['nacionalidades_id'] ?? "";
    $nit = $_POST['nit'] ?? "";
    $nombreDepartamentoDPI = $_POST['nombreDepartamentoDPI'] ?? "";
    $nombreDepartamentoTrabajador = $_POST['nombreDepartamentoTrabajador'] ?? "";
    $nombreEstudio = $_POST['nombreEstudio'] ?? "";
    $nombreMunicipioDpi = $_POST['nombreMunicipioDpi'] ?? "";
    $nombreMunicipioTrabajador = $_POST['nombreMunicipioTrabajador'] ?? "";
    $nombrePuesto = $_POST['nombrePuesto'] ?? "";
    $notaExamenContable = $_POST['notaExamenContable'] ?? "";
    $notaExamenExcel = $_POST['notaExamenExcel'] ?? "";
    $notaExamenGeneral = $_POST['notaExamenGeneral'] ?? "";
    $notaExamenPsicometrico = $_POST['notaExamenPsicometrico'] ?? "";
    $numeroIgss = $_POST['numeroIgss'] ?? "";
    $numeroIrtra = $_POST['numeroIrtra'] ?? "";
    $numeroLicencia = $_POST['numeroLicencia'] ?? "";
    $ocupaciones_id = $_POST['ocupaciones_id'] ?? "";
    $otrosEstudios = $_POST['otrosEstudios'] ?? "";
    $ascendencia = $_POST['ascendencia'] ?? "";
    $puestos_id = $_POST['puestos_id'] ?? "";
    $salarioBase = $_POST['salarioBase'] ?? "";
    $sexo = $_POST['sexo'] ?? "";
    $tarjetaManipulacion = $_POST['tarjetaManipulacion'] ?? "";
    $tarjetaPulmones = $_POST['tarjetaPulmones'] ?? "";
    $tarjetaSalud = $_POST['tarjetaSalud'] ?? "";
    $telefono = $_POST['telefono'] ?? "";
    $telefonoEmergencia = $_POST['telefonoEmergencia'] ?? "";
    $temporalidadContrato = $_POST['temporalidadContrato'] ?? "";
    $tieneCapa = $_POST['tieneCapa'] ?? "";
    $tieneCasco = $_POST['tieneCasco'] ?? "";
    $tieneChalecoArnes = $_POST['tieneChalecoArnes'] ?? "";
    $tieneCodera = $_POST['tieneCodera'] ?? "";
    $tieneContratoAMT = $_POST['tieneContratoAMT'] ?? "";
    $tieneConvenioConfidencialidad = $_POST['tieneConvenioConfidencialidad'] ?? "";
    $tieneEquipo = $_POST['tieneEquipo'] ?? "";
    $tieneExamenContable = $_POST['tieneExamenContable'] ?? "";
    $tieneExamenExcel = $_POST['tieneExamenExcel'] ?? "";
    $tieneExamenGeneral = $_POST['tieneExamenGeneral'] ?? "";
    $tieneExamenPsicometrico = $_POST['tieneExamenPsicometrico'] ?? "";
    $tieneExtintor = $_POST['tieneExtintor'] ?? "";
    $tieneImpermeable = $_POST['tieneImpermeable'] ?? "";
    $tieneInduccion = $_POST['tieneInduccion'] ?? "";
    $tienePapeleriaCompleta = $_POST['tienePapeleriaCompleta'] ?? "";
    $tieneRaven = $_POST['tieneRaven'] ?? "";
    $tieneRodillera = $_POST['tieneRodillera'] ?? "";
    $tieneSolicitud = $_POST['tieneSolicitud'] ?? "";
    $tieneUniforme = $_POST['tieneUniforme'] ?? "";
    $tipoContrato = $_POST['tipoContrato'] ?? "";
    $discapacidad_id = $_POST['discapacidad_id'] ?? "";
    $tipoIdentificacion = $_POST['tipoIdentificacion'] ?? "";
    $tipoLicencia = $_POST['tipoLicencia'] ?? "";
    $ultimoGradoAprobado = $_POST['ultimoGradoAprobado'] ?? "";
    $vencimientoIgss = $_POST['vencimientoIgss'] ?? "";
    $vencimientoIrtra = $_POST['vencimientoIrtra'] ?? "";
    $vencimientoLicencia = $_POST['vencimientoLicencia'] ?? "";
    $vencimientoManipulacion = $_POST['vencimientoManipulacion'] ?? "";
    $vencimientoPulmones = $_POST['vencimientoPulmones'] ?? "";
    $vencimientoTarjetaSalud = $_POST['vencimientoTarjetaSalud'] ?? "";
    $regiones_id = $_POST['regiones_id'] ?? "";
    $zonaTrabajador = $_POST['zonaTrabajador'] ?? "";


    // Obtener el ID del formulario
    $idRegistroEditar = $_POST['idRegistroEditar'];

    // Construir la consulta SQL de actualización
    $queryUpdate = "UPDATE empleados SET 
    codigoTrabajador = '$codigoTrabajador', 
    nombre1 = '$nombre1', 
    nombre2 = '$nombre2',
    apellido1 = '$apellido1',
    apellido2 = '$apellido2',
    nombre3 = '$nombre3',
    apellidoCasada = '$apellidoCasada',
    bonoLey = '$bonoLey',
    cantidadHijos = '$cantidadHijos',
    cantidadVivenCasa = '$cantidadVivenCasa',
    contactoEmergencia = '$contactoEmergencia',
    costo1s_id = '$costo1s_id',
    costo2s_id = '$costo2s_id',
    costo3s_id = '$costo3s_id',
    costo4s_id = '$costo4s_id',
    departamentos_id = '$departamentos_id',
    direccionEmergencia = '$direccionEmergencia',
    direccionTrabajador = '$direccionTrabajador',
    documentoIdentificacion = '$documentoIdentificacion',
    establecimientos_id = '$establecimientos_id',
    estadoNomina = '$estadoNomina',
    estadoCivil_id = '$estadoCivil_id',
    estados_id = '$estados_id',
    estudios_id = '$estudios_id',
    fechaIngreso = '$fechaIngreso',
    fechaNacimiento = '$fechaNacimiento',
    idiomas_id = '$idiomas_id',
    jefes_id = '$jefes_id',
    jornadaTrabajo = '$jornadaTrabajo',
    montoIndemnizacion = '$montoIndemnizacion',
    municipios_id = '$municipios_id',
    nacionalidades_id = '$nacionalidades_id',
    nit = '$nit',
    nombreDepartamentoDPI = '$nombreDepartamentoDPI',
    nombreDepartamentoTrabajador = '$nombreDepartamentoTrabajador',
    nombreEstudio = '$nombreEstudio',
    nombreMunicipioDpi = '$nombreMunicipioDpi',
    nombreMunicipioTrabajador = '$nombreMunicipioTrabajador',
    nombrePuesto = '$nombrePuesto',
    notaExamenContable = '$notaExamenContable',
    notaExamenExcel = '$notaExamenExcel',
    notaExamenGeneral = '$notaExamenGeneral',
    notaExamenPsicometrico = '$notaExamenPsicometrico',
    numeroIgss = '$numeroIgss',
    numeroIrtra = '$numeroIrtra',
    numeroLicencia = '$numeroLicencia',
    ocupaciones_id = '$ocupaciones_id',
    otrosEstudios = '$otrosEstudios',
    ascendencia = '$ascendencia',
    puestos_id = '$puestos_id',
    salarioBase = '$salarioBase',
    sexo = '$sexo',
    tarjetaManipulacion = '$tarjetaManipulacion',
    tarjetaPulmones = '$tarjetaPulmones',
    tarjetaSalud = '$tarjetaSalud',
    telefono = '$telefono',
    telefonoEmergencia = '$telefonoEmergencia',
    temporalidadContrato = '$temporalidadContrato',
    tieneCapa = '$tieneCapa',
    tieneCasco = '$tieneCasco',
    tieneChalecoArnes = '$tieneChalecoArnes',
    tieneCodera = '$tieneCodera',
    tieneContratoAMT = '$tieneContratoAMT',
    tieneConvenioConfidencialidad = '$tieneConvenioConfidencialidad',
    tieneEquipo = '$tieneEquipo',
    tieneExamenContable = '$tieneExamenContable',
    tieneExamenExcel = '$tieneExamenExcel',
    tieneExamenGeneral = '$tieneExamenGeneral',
    tieneExamenPsicometrico = '$tieneExamenPsicometrico',
    tieneExtintor = '$tieneExtintor',
    tieneImpermeable = '$tieneImpermeable',
    tieneInduccion = '$tieneInduccion',
    tienePapeleriaCompleta = '$tienePapeleriaCompleta',
    tieneRaven = '$tieneRaven',
    tieneRodillera = '$tieneRodillera',
    tieneSolicitud = '$tieneSolicitud',
    tieneUniforme = '$tieneUniforme',
    tipoContrato = '$tipoContrato',
    discapacidad_id = '$discapacidad_id',
    tipoIdentificacion = '$tipoIdentificacion',
    tipoLicencia = '$tipoLicencia',
    ultimoGradoAprobado = '$ultimoGradoAprobado',
    vencimientoIgss = '$vencimientoIgss',
    vencimientoIrtra = '$vencimientoIrtra',
    vencimientoLicencia = '$vencimientoLicencia',
    vencimientoManipulacion = '$vencimientoManipulacion',
    vencimientoPulmones = '$vencimientoPulmones',
    vencimientoTarjetaSalud = '$vencimientoTarjetaSalud',
    regiones_id = '$regiones_id',
    zonaTrabajador = '$zonaTrabajador'
    
    WHERE id = $idRegistroEditar";

    // Mostrar la consulta SQL por pantalla
    echo '<h3>Consulta SQL completa:</h3>';
    echo '<p>' . $queryUpdate . '</p>';

    // Ejecutar la consulta de actualización
    $resultUpdate = $conn->query($queryUpdate);

    if ($resultUpdate) {
        echo '<center><img src="../../imagenes/errorok.png"></center>';
        // Resto del código después de la actualización exitosa
    } else {
        echo '<center><img src="../../imagenes/error1.png"></center>';
        echo 'Error al actualizar la base de datos: ' . $conn->error;
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
                    <a class="nav-link active" data-toggle="tab" href="#hoja1Editar">Personales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja2Editar">Contrato</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja3Editar">Contabilidad</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#hoja4Editar">Medicos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja5Editar">Identidad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja6Editar">Estudios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja7Editar">Contacto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja8Editar">Propiedades</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#hoja9Editar">Otros</a>
                </li>

                <!-- Agrega más pestañas de edición aquí -->
            </ul>

            <!-- Contenido del formulario -->
            <div class="tab-content">
                <!-- Pestaña 1: Personales -->
                <div class="tab-pane fade show active" id="hoja1Editar">
                    <div class="form-group row">
                        <label for="codigoTrabajador" class="col-sm-3 col-form-label">Código del Trabajador:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="codigoTrabajador" name="codigoTrabajador" value="<?= $row['codigoTrabajador']; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombre1" class="col-sm-3 col-form-label">Primer Nombre:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nombre1" name="nombre1" value="<?= $row['nombre1']; ?>" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombre2" class="col-sm-3 col-form-label">Segundo Nombre:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nombre2" name="nombre2" value="<?= $row['nombre2']; ?>" required>
                        </div>
                    </div>
                
                    <div class="form-group row">
                        <label for="nombre3" class="col-sm-3 col-form-label">Tercer Nombre:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nombre3" name="nombre3" value="<?=$row['nombre3']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="apellido1" class="col-sm-3 col-form-label">Primer Apellido:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="apellido1" name="apellido1" value="<?=$row['apellido1']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="apellido2" class="col-sm-3 col-form-label">Segundo Apellido:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="apellido2" name="apellido2" value="<?=$row['apellido2']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="apellidoCasada" class="col-sm-3 col-form-label">Apellido de Casada:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="apellidoCasada" name="apellidoCasada" value="<?=$row['apellidoCasada']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="sexo" class="col-sm-3 col-form-label">Sexo:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="sexo" name="sexo">
                                <option value="HOMBRE" <?php if($row['sexo'] === 'HOMBRE') echo 'selected'; ?>>HOMBRE</option>
                                <option value="MUJER" <?php if($row['sexo'] === 'MUJER') echo 'selected'; ?>>MUJER</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fechaNacimiento" class="col-sm-3 col-form-label">Fecha de Nacimiento:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" value="<?=$row['fechaNacimiento']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="estadoCivil_id" class="col-sm-3 col-form-label">Estado Civil:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="estadoCivil_id" name="estadoCivil_id">
                                <option value="1" <?php if($row['estadoCivil_id'] === '1') echo 'selected'; ?>>SOLTERO(A)</option>
                                <option value="2" <?php if($row['estadoCivil_id'] === '2') echo 'selected'; ?>>CASADO(A)</option>
                                <option value="3" <?php if($row['estadoCivil_id'] === '3') echo 'selected'; ?>>UNIDO(A)</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cantidadHijos" class="col-sm-3 col-form-label">Cantidad de Hijos:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="cantidadHijos" name="cantidadHijos" value="<?=$row['cantidadHijos']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cantidadVivenCasa" class="col-sm-3 col-form-label">Cantidad que Viven en Casa:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="cantidadVivenCasa" name="cantidadVivenCasa" value="<?=$row['cantidadVivenCasa']?>">
                        </div>
                    </div>
                    <!-- Completa los campos restantes de hoja1Editar -->
                </div>
                <!-- Pestaña 2: Contrato -->
                <div class="tab-pane fade" id="hoja2Editar">
                    <div class="form-group row">
                        <label for="salarioBase" class="col-sm-3 col-form-label">Salario Base:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="salarioBase" name="salarioBase" value="<?=$row['salarioBase']?>" required>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="bonoLey" class="col-sm-3 col-form-label">Bono Ley:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="bonoLey" name="bonoLey" value="<?=$row['bonoLey']?>" required>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="estadoNomina" class="col-sm-3 col-form-label">Estado Nomina:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="estadoNomina" name="estadoNomina" value="<?=$row['estadoNomina']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="estados_id" class="col-sm-3 col-form-label">ID de Estado:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="estados_id" name="estados_id" required>
                                <?php
                                // Consulta para obtener el estado seleccionado actualmente
                                $currentEstadoId = $row['estados_id'];
                                $queryCurrentEstado = "SELECT estado2 FROM estados WHERE id = '$currentEstadoId'";
                                $resultCurrentEstado = mysqli_query($conn, $queryCurrentEstado);
                                $currentEstadoRow = mysqli_fetch_assoc($resultCurrentEstado);

                                // Mostrar la opción seleccionada
                                if ($currentEstadoRow) {
                                    echo '<option value="' . $currentEstadoId . '" selected>' . $currentEstadoRow['estado2'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un estado</option>';
                                }

                                // Consulta para obtener todos los estados (excepto el actualmente seleccionado)
                                $queryEstados = "SELECT id, estado2 FROM estados WHERE id != '$currentEstadoId'";
                                $resultEstados = mysqli_query($conn, $queryEstados);

                                // Mostrar las demás opciones
                                while ($estadoRow = mysqli_fetch_assoc($resultEstados)) {
                                    echo '<option value="' . $estadoRow['id'] . '">' . $estadoRow['estado2'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="puestos_id" class="col-sm-3 col-form-label">ID de Puesto:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="puestos_id" name="puestos_id" required>
                                <?php
                                // Consulta para obtener el puesto seleccionado actualmente
                                $currentPuestoId = $row['puestos_id'];
                                $queryCurrentPuesto = "SELECT nombrePuesto1 FROM puestos WHERE id = '$currentPuestoId'";
                                $resultCurrentPuesto = mysqli_query($conn, $queryCurrentPuesto);
                                $currentPuestoRow = mysqli_fetch_assoc($resultCurrentPuesto);

                                // Mostrar la opción seleccionada
                                if ($currentPuestoRow) {
                                    echo '<option value="' . $currentPuestoId . '" selected>' . $currentPuestoRow['nombrePuesto1'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un puesto</option>';
                                }

                                // Consulta para obtener todos los puestos (excepto el actualmente seleccionado)
                                $queryPuestos = "SELECT id, nombrePuesto1 FROM puestos WHERE id != '$currentPuestoId'";
                                $resultPuestos = mysqli_query($conn, $queryPuestos);

                                // Mostrar las demás opciones
                                while ($puestoRow = mysqli_fetch_assoc($resultPuestos)) {
                                    echo '<option value="' . $puestoRow['id'] . '">' . $puestoRow['nombrePuesto1'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="jefes_id" class="col-sm-3 col-form-label">Jefe:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="jefes_id" name="jefes_id" required>
                                <?php
                                // Consulta para obtener el jefe seleccionado actualmente
                                $currentJefeId = $row['jefes_id'];
                                $queryCurrentJefe = "SELECT nombreJefe FROM jefes WHERE id = '$currentJefeId'";
                                $resultCurrentJefe = mysqli_query($conn, $queryCurrentJefe);
                                $currentJefeRow = mysqli_fetch_assoc($resultCurrentJefe);

                                // Mostrar la opción seleccionada
                                if ($currentJefeRow) {
                                    echo '<option value="' . $currentJefeId . '" selected>' . $currentJefeRow['nombreJefe'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un jefe</option>';
                                }

                                // Consulta para obtener todos los jefes (excepto el actualmente seleccionado)
                                $queryJefes = "SELECT id, nombreJefe FROM jefes WHERE id != '$currentJefeId'";
                                $resultJefes = mysqli_query($conn, $queryJefes);

                                // Mostrar las demás opciones
                                while ($jefeRow = mysqli_fetch_assoc($resultJefes)) {
                                    echo '<option value="' . $jefeRow['id'] . '">' . $jefeRow['nombreJefe'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="fechaIngreso" class="col-sm-3 col-form-label">Fecha de Ingreso:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="fechaIngreso" name="fechaIngreso" value="<?=$row['fechaIngreso']?>" required>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tipoContrato" class="col-sm-3 col-form-label">Tipo de Contrato:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="tipoContrato" name="tipoContrato" required>
                                <option value="VERBAL" <?=($row['tipoContrato'] === 'VERBAL') ? 'selected' : ''?>>VERBAL</option>
                                <option value="ESCRITO" <?=($row['tipoContrato'] === 'ESCRITO') ? 'selected' : ''?>>ESCRITO</option>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="temporalidadContrato" class="col-sm-3 col-form-label">Temporalidad de Contrato:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="temporalidadContrato" name="temporalidadContrato" required>
                                <option value="INDEFINIDO" <?=($row['temporalidadContrato'] === 'INDEFINIDO') ? 'selected' : ''?>>INDEFINIDO</option>
                                <option value="DEFINIDO" <?=($row['temporalidadContrato'] === 'DEFINIDO') ? 'selected' : ''?>>DEFINIDO</option>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="jornadaTrabajo" class="col-sm-3 col-form-label">Jornada de Trabajo:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="jornadaTrabajo" name="jornadaTrabajo" required>
                                <option value="DIURNA" <?=($row['jornadaTrabajo'] === 'DIURNA') ? 'selected' : ''?>>DIURNA</option>
                                <option value="MIXTA" <?=($row['jornadaTrabajo'] === 'MIXTA') ? 'selected' : ''?>>MIXTA</option>
                                <option value="NOCTURA" <?=($row['jornadaTrabajo'] === 'NOCTURA') ? 'selected' : ''?>>NOCTURA</option>
                                <option value="NO ESTA SUJETO A JORNADA" <?=($row['jornadaTrabajo'] === 'NO ESTA SUJETO A JORNADA') ? 'selected' : ''?>>NO ESTA SUJETO A JORNADA</option>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ocupaciones_id" class="col-sm-3 col-form-label">Ocupación:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="ocupaciones_id" name="ocupaciones_id" required>
                                <?php
                                // Consulta para obtener la ocupación seleccionada actualmente
                                $currentOcupacionId = $row['ocupaciones_id'];
                                $queryCurrentOcupacion = "SELECT nombreOcupacion FROM ocupaciones WHERE id = '$currentOcupacionId'";
                                $resultCurrentOcupacion = mysqli_query($conn, $queryCurrentOcupacion);
                                $currentOcupacionRow = mysqli_fetch_assoc($resultCurrentOcupacion);

                                // Mostrar la opción seleccionada
                                if ($currentOcupacionRow) {
                                    echo '<option value="' . $currentOcupacionId . '" selected>' . $currentOcupacionRow['nombreOcupacion'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona una ocupación</option>';
                                }

                                // Consulta para obtener todas las ocupaciones (excepto la actualmente seleccionada)
                                $queryOcupaciones = "SELECT id, nombreOcupacion FROM ocupaciones WHERE id != '$currentOcupacionId'";
                                $resultOcupaciones = mysqli_query($conn, $queryOcupaciones);

                                // Mostrar las demás opciones
                                while ($ocupacionRow = mysqli_fetch_assoc($resultOcupaciones)) {
                                    echo '<option value="' . $ocupacionRow['id'] . '">' . $ocupacionRow['nombreOcupacion'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="montoIndemnizacion" class="col-sm-3 col-form-label">Monto de Indemnización:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="montoIndemnizacion" name="montoIndemnizacion" value="<?=$row['montoIndemnizacion']?>" required>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="hoja3Editar">
                    <!-- Código para el 1 campo -->
                    <div class="form-group row">
                        <label for="regiones_id" class="col-sm-3 col-form-label">Región:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="regiones_id" name="regiones_id">
                                <?php
                                // Consulta para obtener la región seleccionada actualmente
                                $currentRegionId = $row['regiones_id'];
                                $queryCurrentRegion = "SELECT nombreRegion FROM regiones WHERE id = '$currentRegionId'";
                                $resultCurrentRegion = mysqli_query($conn, $queryCurrentRegion);
                                $currentRegionRow = mysqli_fetch_assoc($resultCurrentRegion);

                                // Mostrar la opción seleccionada
                                if ($currentRegionRow) {
                                    echo '<option value="' . $currentRegionId . '" selected>' . $currentRegionRow['nombreRegion'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona una región</option>';
                                }

                                // Consulta para obtener todas las regiones (excepto la actualmente seleccionada)
                                $queryRegiones = "SELECT id, nombreRegion FROM regiones WHERE id != '$currentRegionId'";
                                $resultRegiones = mysqli_query($conn, $queryRegiones);

                                // Mostrar las demás opciones
                                while ($regionesRow = mysqli_fetch_assoc($resultRegiones)) {
                                    echo '<option value="' . $regionesRow['id'] . '">' . $regionesRow['nombreRegion'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
    
                    <!-- Código para el 2 campo -->
                    <div class="form-group row">
                        <label for="establecimientos_id" class="col-sm-3 col-form-label">Establecimiento:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="establecimientos_id" name="establecimientos_id">
                                <?php
                                // Consulta para obtener el establecimiento seleccionado actualmente
                                $currentEstablecimientoId = $row['establecimientos_id'];
                                $queryCurrentEstablecimiento = "SELECT nombreEstablecimiento FROM establecimientos WHERE id = '$currentEstablecimientoId'";
                                $resultCurrentEstablecimiento = mysqli_query($conn, $queryCurrentEstablecimiento);
                                $currentEstablecimientoRow = mysqli_fetch_assoc($resultCurrentEstablecimiento);

                                // Mostrar la opción seleccionada
                                if ($currentEstablecimientoRow) {
                                    echo '<option value="' . $currentEstablecimientoId . '" selected>' . $currentEstablecimientoRow['nombreEstablecimiento'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un establecimiento</option>';
                                }

                                // Consulta para obtener todos los establecimientos (excepto el actualmente seleccionado)
                                $queryEstablecimientos = "SELECT id, nombreEstablecimiento FROM establecimientos WHERE id != '$currentEstablecimientoId'";
                                $resultEstablecimientos = mysqli_query($conn, $queryEstablecimientos);

                                // Mostrar las demás opciones
                                while ($establecimientosRow = mysqli_fetch_assoc($resultEstablecimientos)) {
                                    echo '<option value="' . $establecimientosRow['id'] . '">' . $establecimientosRow['nombreEstablecimiento'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>


                    <!-- Código para el 3 campo -->
                    <div class="form-group row">
                        <label for="costo1s_id" class="col-sm-3 col-form-label">Costo 1:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="costo1s_id" name="costo1s_id">
                                <?php
                                // Consulta para obtener el costo1 seleccionado actualmente
                                $currentCosto1Id = $row['costo1s_id'];
                                $queryCurrentCosto1 = "SELECT nombreCosto1 FROM costo1s WHERE id = '$currentCosto1Id'";
                                $resultCurrentCosto1 = mysqli_query($conn, $queryCurrentCosto1);
                                $currentCosto1Row = mysqli_fetch_assoc($resultCurrentCosto1);

                                // Mostrar la opción seleccionada
                                if ($currentCosto1Row) {
                                    echo '<option value="' . $currentCosto1Id . '" selected>' . $currentCosto1Row['nombreCosto1'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un costo1</option>';
                                }

                                // Consulta para obtener todos los costos1 (excepto el actualmente seleccionado)
                                $queryCostos1 = "SELECT id, nombreCosto1 FROM costo1s WHERE id != '$currentCosto1Id'";
                                $resultCostos1 = mysqli_query($conn, $queryCostos1);

                                // Mostrar las demás opciones
                                while ($costo1sRow = mysqli_fetch_assoc($resultCostos1)) {
                                    echo '<option value="' . $costo1sRow['id'] . '">' . $costo1sRow['nombreCosto1'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>


                    <!-- Código para el segundo campo -->
                    <div class="form-group row">
                        <label for="costo2s_id" class="col-sm-3 col-form-label">Costo 2:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="costo2s_id" name="costo2s_id">
                                <?php
                                // Consulta para obtener el costo2 seleccionado actualmente
                                $currentCosto2Id = $row['costo2s_id'];
                                $queryCurrentCosto2 = "SELECT nombreCosto2 FROM costo2s WHERE id = '$currentCosto2Id'";
                                $resultCurrentCosto2 = mysqli_query($conn, $queryCurrentCosto2);
                                $currentCosto2Row = mysqli_fetch_assoc($resultCurrentCosto2);

                                // Mostrar la opción seleccionada
                                if ($currentCosto2Row) {
                                    echo '<option value="' . $currentCosto2Id . '" selected>' . $currentCosto2Row['nombreCosto2'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona un costo2</option>';
                                }

                                // Consulta para obtener todos los costos2 (excepto el actualmente seleccionado)
                                $queryCostos2 = "SELECT id, nombreCosto2 FROM costo2s WHERE id != '$currentCosto2Id'";
                                $resultCostos2 = mysqli_query($conn, $queryCostos2);

                                // Mostrar las demás opciones
                                while ($costo2sRow = mysqli_fetch_assoc($resultCostos2)) {
                                    echo '<option value="' . $costo2sRow['id'] . '">' . $costo2sRow['nombreCosto2'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                        <!-- Código para el tercer campo -->
                    <!-- Código para el tercer campo -->
                    <div class="form-group row">
                        <label for="costo3s_id" class="col-sm-3 col-form-label">Costo 3:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="costo3s_id" name="costo3s_id">
                                <?php
                                // Consulta para obtener el costo3 seleccionado actualmente
                                $currentCosto3Id = $row['costo3s_id'];
                                if ($currentCosto3Id) {
                                    $queryCurrentCosto3 = "SELECT nombreCosto3 FROM costo3s WHERE id = '$currentCosto3Id'";
                                    $resultCurrentCosto3 = mysqli_query($conn, $queryCurrentCosto3);
                                    $currentCosto3Row = mysqli_fetch_assoc($resultCurrentCosto3);

                                    // Mostrar la opción seleccionada
                                    if ($currentCosto3Row) {
                                        echo '<option value="' . $currentCosto3Id . '" selected>' . $currentCosto3Row['nombreCosto3'] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">Selecciona un costo3</option>';
                                }

                                // Consulta para obtener todos los costos3 (excepto el actualmente seleccionado)
                                $queryCostos3 = "SELECT id, nombreCosto3 FROM costo3s WHERE id != '$currentCosto3Id'";
                                $resultCostos3 = mysqli_query($conn, $queryCostos3);

                                // Mostrar las demás opciones
                                while ($costo3sRow = mysqli_fetch_assoc($resultCostos3)) {
                                    echo '<option value="' . $costo3sRow['id'] . '">' . $costo3sRow['nombreCosto3'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <!-- Código para el cuarto campo -->
 
                    <div class="form-group row">
                        <label for="costo4s_id" class="col-sm-3 col-form-label">Costo 4:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="costo4s_id" name="costo4s_id">
                                <?php
                                // Consulta para obtener el costo4 seleccionado actualmente
                                $currentCosto4Id = $row['costo4s_id'];
                                if ($currentCosto4Id) {
                                    $queryCurrentCosto4 = "SELECT nombreCosto4 FROM costo4s WHERE id = '$currentCosto4Id'";
                                    $resultCurrentCosto4 = mysqli_query($conn, $queryCurrentCosto4);
                                    $currentCosto4Row = mysqli_fetch_assoc($resultCurrentCosto4);

                                    // Mostrar la opción seleccionada
                                    if ($currentCosto4Row) {
                                        echo '<option value="' . $currentCosto4Id . '" selected>' . $currentCosto4Row['nombreCosto4'] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">Selecciona un costo4</option>';
                                }

                                // Consulta para obtener todos los costos4 (excepto el actualmente seleccionado)
                                $queryCostos4 = "SELECT id, nombreCosto4 FROM costo4s WHERE id != '$currentCosto4Id'";
                                $resultCostos4 = mysqli_query($conn, $queryCostos4);

                                // Mostrar las demás opciones
                                while ($costo4sRow = mysqli_fetch_assoc($resultCostos4)) {
                                    echo '<option value="' . $costo4sRow['id'] . '">' . $costo4sRow['nombreCosto4'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                </div>


                <div class="tab-pane fade" id="hoja4Editar">
                    <!-- Código para el campo de discapacidad -->
                    <div class="form-group row">
                        <label for="discapacidad_id" class="col-sm-3 col-form-label">Discapacidad:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="discapacidad_id" name="discapacidad_id">
                                <?php
                                // Consulta para obtener la discapacidad seleccionada actualmente
                                $currentDiscapacidadId = $row['discapacidad_id'];
                                if ($currentDiscapacidadId) {
                                    $queryCurrentDiscapacidad = "SELECT nombreDiscapacidad FROM discapacidad WHERE id = '$currentDiscapacidadId'";
                                    $resultCurrentDiscapacidad = mysqli_query($conn, $queryCurrentDiscapacidad);
                                    $currentDiscapacidadRow = mysqli_fetch_assoc($resultCurrentDiscapacidad);

                                    // Mostrar la opción seleccionada
                                    if ($currentDiscapacidadRow) {
                                        echo '<option value="' . $currentDiscapacidadId . '" selected>' . $currentDiscapacidadRow['nombreDiscapacidad'] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">Selecciona una discapacidad</option>';
                                }

                                // Consulta para obtener todas las discapacidades (excepto la actualmente seleccionada)
                                $queryDiscapacidades = "SELECT id, nombreDiscapacidad FROM discapacidad WHERE id != '$currentDiscapacidadId'";
                                $resultDiscapacidades = mysqli_query($conn, $queryDiscapacidades);

                                // Mostrar las demás opciones
                                while ($discapacidadRow = mysqli_fetch_assoc($resultDiscapacidades)) {
                                    echo '<option value="' . $discapacidadRow['id'] . '">' . $discapacidadRow['nombreDiscapacidad'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="tarjetaSalud" class="col-sm-3 col-form-label">Tarjeta de Salud:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tarjetaSalud" name="tarjetaSalud" value="<?=$row['tarjetaSalud']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoTarjetaSalud" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Salud:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoTarjetaSalud" name="vencimientoTarjetaSalud" value="<?=$row['vencimientoTarjetaSalud']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <!-- Repite el patrón para los demás campos -->
                    <div class="form-group row">
                        <label for="tarjetaManipulacion" class="col-sm-3 col-form-label">Tarjeta de Manipulación:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tarjetaManipulacion" name="tarjetaManipulacion" value="<?=$row['tarjetaManipulacion']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoManipulacion" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Manipulación:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoManipulacion" name="vencimientoManipulacion" value="<?=$row['vencimientoManipulacion']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tarjetaPulmones" class="col-sm-3 col-form-label">Tarjeta de Pulmones:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tarjetaPulmones" name="tarjetaPulmones" value="<?=$row['tarjetaPulmones']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoPulmones" class="col-sm-3 col-form-label">Vencimiento de Tarjeta de Pulmones:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoPulmones" name="vencimientoPulmones" value="<?=$row['vencimientoPulmones']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="hoja5Editar">
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
                            <input type="text" class="form-control" id="documentoIdentificacion" name="documentoIdentificacion" value="<?=$row['documentoIdentificacion']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="numeroIgss" class="col-sm-3 col-form-label">Número de IGSS:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numeroIgss" name="numeroIgss" value="<?=$row['numeroIgss']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoIgss" class="col-sm-3 col-form-label">Vencimiento de IGSS:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoIgss" name="vencimientoIgss" value="<?=$row['vencimientoIgss']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <!-- Repite el patrón para los demás campos -->
                    <div class="form-group row">
                        <label for="numeroIrtra" class="col-sm-3 col-form-label">Número de IRTRA:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numeroIrtra" name="numeroIrtra" value="<?=$row['numeroIrtra']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoIrtra" class="col-sm-3 col-form-label">Vencimiento de IRTRA:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoIrtra" name="vencimientoIrtra" value="<?=$row['vencimientoIrtra']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nit" class="col-sm-3 col-form-label">NIT:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nit" name="nit" value="<?=$row['nit']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tipoLicencia" class="col-sm-3 col-form-label">Tipo de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tipoLicencia" name="tipoLicencia" value="<?=$row['tipoLicencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="numeroLicencia" class="col-sm-3 col-form-label">Número de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numeroLicencia" name="numeroLicencia" value="<?=$row['numeroLicencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="vencimientoLicencia" class="col-sm-3 col-form-label">Vencimiento de Licencia:</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="vencimientoLicencia" name="vencimientoLicencia" value="<?=$row['vencimientoLicencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                            <!-- Pueblo origen -->
                    <div class="form-group row">
                        <label for="ascendencia_id" class="col-sm-3 col-form-label">Pueblo Origen:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="ascendencia_id" name="ascendencia_id">
                                <?php
                                // Consulta para obtener la ascendencia seleccionada actualmente
                                $currentAscendenciaId = $row['ascendencia_id'];
                                if ($currentAscendenciaId) {
                                    $queryCurrentAscendencia = "SELECT nombreAscendencia FROM ascendencia WHERE id = '$currentAscendenciaId'";
                                    $resultCurrentAscendencia = mysqli_query($conn, $queryCurrentAscendencia);
                                    $currentAscendenciaRow = mysqli_fetch_assoc($resultCurrentAscendencia);

                                    // Mostrar la opción seleccionada
                                    if ($currentAscendenciaRow) {
                                        echo '<option value="' . $currentAscendenciaId . '" selected>' . $currentAscendenciaRow['nombreAscendencia'] . '</option>';
                                    }
                                } else {
                                    echo '<option value="">Selecciona una ascendencia</option>';
                                }

                                // Consulta para obtener todas las ascendencias (excepto la actualmente seleccionada)
                                $queryAscendencia = "SELECT id, nombreAscendencia FROM ascendencia WHERE id != '$currentAscendenciaId'";
                                $resultAscendencia = mysqli_query($conn, $queryAscendencia);

                                // Mostrar las demás opciones
                                while ($ascendenciaRow = mysqli_fetch_assoc($resultAscendencia)) {
                                    echo '<option value="' . $ascendenciaRow['id'] . '">' . $ascendenciaRow['nombreAscendencia'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nacionalidades_id" class="col-sm-3 col-form-label">Nacionalidad:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="nacionalidades_id" name="nacionalidades_id">
                                <?php
                                // Consulta para obtener la nacionalidad seleccionado actualmente
                                $currentNacionalidadId = $row['nacionalidades_id'];
                                $queryCurrentNacionalidad = "SELECT nombreNacionalidad FROM nacionalidades WHERE id = '$currentNacionalidadId'";
                                $resultCurrentNacionalidad = mysqli_query($conn, $queryCurrentNacionalidad);
                                $currentNacionalidadRow = mysqli_fetch_assoc($resultCurrentNacionalidad);

                                // Mostrar la opción seleccionada
                                if ($currentNacionalidadRow) {
                                    echo '<option value="' . $currentNacionalidadId . '" selected>' . $currentNacionalidadRow['nombreNacionalidad'] . '</option>';
                                } else {
                                    echo '<option value="">Selecciona una nacionalidad</option>';
                                }

                                // Consulta para obtener todos las nacionalidades (excepto el actualmente seleccionado)
                                $queryNacionalidad = "SELECT id, nombreNacionalidad FROM nacionalidades WHERE id != '$currentNacionalidadId'";
                                $resultNacionalidad = mysqli_query($conn, $queryNacionalidad);

                                // Mostrar las demás opciones
                                while ($NacionalidadRow = mysqli_fetch_assoc($resultNacionalidad)) {
                                    echo '<option value="' . $NacionalidadRow['id'] . '">' . $NacionalidadRow['nombreNacionalidad'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="hoja6Editar">
                    <div class="form-group row">
                        <label for="estudios_id" class="col-sm-3 col-form-label">ID de Estudios:</label>
                        <div class="col-sm-9">
                        <select class="form-control" id="estudios_id" name="estudios_id">
                            <option value="">Selecciona un estudio</option>
                            <?php
                            $queryEstudios = "SELECT id, nombreEstudio FROM estudios";
                            $resultEstudios = mysqli_query($conn, $queryEstudios);

                            while ($estudioRow = mysqli_fetch_assoc($resultEstudios)) {
                                $selected = ($estudioRow['id'] === $row['estudios_id']) ? 'selected' : '';
                                echo '<option value="' . $estudioRow['id'] . '" ' . $selected . '>' . $estudioRow['nombreEstudio'] . '</option>';
                            }
                            ?>
                        </select>

                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="otrosEstudios" class="col-sm-3 col-form-label">Otros Estudios:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="otrosEstudios" name="otrosEstudios" value="<?=$row['otrosEstudios']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="idiomas_id" class="col-sm-3 col-form-label">ID de Idiomas:</label>
                        <div class="col-sm-9">
                        <select class="form-control" id="idiomas_id" name="idiomas_id">
                            <option value="">Selecciona un idioma</option>
                            <?php
                            $queryIdiomas = "SELECT id, nombreIdioma FROM idiomas";
                            $resultIdiomas = mysqli_query($conn, $queryIdiomas);

                            while ($idiomaRow = mysqli_fetch_assoc($resultIdiomas)) {
                                $selected = ($idiomaRow['id'] === $row['idiomas_id']) ? 'selected' : '';
                                echo '<option value="' . $idiomaRow['id'] . '" ' . $selected . '>' . $idiomaRow['nombreIdioma'] . '</option>';
                            }
                            ?>
                        </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ultimoGradoAprobado" class="col-sm-3 col-form-label">Último Grado Aprobado:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="ultimoGradoAprobado" name="ultimoGradoAprobado" value="<?=$row['ultimoGradoAprobado']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="notaExamenPsicometrico" class="col-sm-3 col-form-label">Nota de Examen Psicométrico:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="notaExamenPsicometrico" name="notaExamenPsicometrico" value="<?=$row['notaExamenPsicometrico']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="notaExamenExcel" class="col-sm-3 col-form-label">Nota de Examen Excel:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="notaExamenExcel" name="notaExamenExcel" value="<?=$row['notaExamenExcel']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="notaExamenContable" class="col-sm-3 col-form-label">Nota de Examen Contable:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="notaExamenContable" name="notaExamenContable" value="<?=$row['notaExamenContable']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="notaExamenGeneral" class="col-sm-3 col-form-label">Nota de Examen General:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="notaExamenGeneral" name="notaExamenGeneral" value="<?=$row['notaExamenGeneral']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <!-- Resto de campos -->
                </div>
                
                <div class="tab-pane fade" id="hoja7Editar">
                    <div class="form-group row">
                        <label for="telefono" class="col-sm-3 col-form-label">Teléfono:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<?=$row['telefono']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="contactoEmergencia" class="col-sm-3 col-form-label">Contacto de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="contactoEmergencia" name="contactoEmergencia" value="<?=$row['contactoEmergencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="telefonoEmergencia" class="col-sm-3 col-form-label">Teléfono de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="telefonoEmergencia" name="telefonoEmergencia" value="<?=$row['telefonoEmergencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="direccionTrabajador" class="col-sm-3 col-form-label">Dirección del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="direccionTrabajador" name="direccionTrabajador" value="<?=$row['direccionTrabajador']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="direccionEmergencia" class="col-sm-3 col-form-label">Dirección de Emergencia:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="direccionEmergencia" name="direccionEmergencia" value="<?=$row['direccionEmergencia']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombreDepartamentoTrabajador" class="col-sm-3 col-form-label">Nombre de Departamento del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nombreDepartamentoTrabajador" name="nombreDepartamentoTrabajador" value="<?=$row['nombreDepartamentoTrabajador']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombreMunicipioTrabajador" class="col-sm-3 col-form-label">Nombre de Municipio del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nombreMunicipioTrabajador" name="nombreMunicipioTrabajador" value="<?=$row['nombreMunicipioTrabajador']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="zonaTrabajador" class="col-sm-3 col-form-label">Zona del Trabajador:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="zonaTrabajador" name="zonaTrabajador" value="<?=$row['zonaTrabajador']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="departamentos_id" class="col-sm-3 col-form-label">ID de Departamento:</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="departamentos_id" name="departamentos_id">
                                <option value="">Selecciona un departamento</option>
                                <?php
                                $queryDepartamentos = "SELECT id, nombreDepartamento FROM departamentos";
                                $resultDepartamentos = mysqli_query($conn, $queryDepartamentos);

                                while ($departamentoRow = mysqli_fetch_assoc($resultDepartamentos)) {
                                    $selected = ($departamentoRow['id'] === $row['departamentos_id']) ? 'selected' : '';
                                    echo '<option value="' . $departamentoRow['id'] . '" ' . $selected . '>' . $departamentoRow['nombreDepartamento'] . '</option>';
                                }
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
                                $queryMunicipios = "SELECT id, nombreMunicipio FROM municipios";
                                $resultMunicipios = mysqli_query($conn, $queryMunicipios);

                                while ($municipioRow = mysqli_fetch_assoc($resultMunicipios)) {
                                    $selected = ($municipioRow['id'] === $row['municipios_id']) ? 'selected' : '';
                                    echo '<option value="' . $municipioRow['id'] . '" ' . $selected . '>' . $municipioRow['nombreMunicipio'] . '</option>';
                                }
                                ?>
                            </select>
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombreMunicipioDpi" class="col-sm-3 col-form-label">Nombre de Municipio DPI:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nombreMunicipioDpi" name="nombreMunicipioDpi" value="<?=$row['nombreMunicipioDpi']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nombreDepartamentoDPI" class="col-sm-3 col-form-label">Nombre de Departamento DPI:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nombreDepartamentoDPI" name="nombreDepartamentoDPI" value="<?=$row['nombreDepartamentoDPI']?>">
                            <div class="invalid-feedback">Este campo es obligatorio.</div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="hoja8Editar">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Solicitud:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneSolicitud_si" name="tieneSolicitud" value="SI"
                                    <?= ($row['tieneSolicitud'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneSolicitud_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneSolicitud_no" name="tieneSolicitud" value="NO"
                                    <?= ($row['tieneSolicitud'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneSolicitud_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Inducción:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneInduccion_si" name="tieneInduccion" value="SI"
                                    <?= ($row['tieneInduccion'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneInduccion_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneInduccion_no" name="tieneInduccion" value="NO"
                                    <?= ($row['tieneInduccion'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneInduccion_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Contrato AMT:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneContratoAMT_si" name="tieneContratoAMT" value="SI"
                                    <?= ($row['tieneContratoAMT'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneContratoAMT_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneContratoAMT_no" name="tieneContratoAMT" value="NO"
                                    <?= ($row['tieneContratoAMT'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneContratoAMT_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Convenio Confidencialidad:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_si" name="tieneConvenioConfidencialidad" value="SI"
                                    <?= ($row['tieneConvenioConfidencialidad'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneConvenioConfidencialidad_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_no" name="tieneConvenioConfidencialidad" value="NO"
                                    <?= ($row['tieneConvenioConfidencialidad'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneConvenioConfidencialidad_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Papelería Completa:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_si" name="tienePapeleriaCompleta" value="SI"
                                    <?= ($row['tienePapeleriaCompleta'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tienePapeleriaCompleta_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_no" name="tienePapeleriaCompleta" value="NO"
                                    <?= ($row['tienePapeleriaCompleta'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tienePapeleriaCompleta_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Contrato AMT:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneContratoAMT_si" name="tieneContratoAMT" value="SI"
                                    <?= ($row['tieneContratoAMT'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneContratoAMT_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneContratoAMT_no" name="tieneContratoAMT" value="NO"
                                    <?= ($row['tieneContratoAMT'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneContratoAMT_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Convenio Confidencialidad:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_si" name="tieneConvenioConfidencialidad" value="SI"
                                    <?= ($row['tieneConvenioConfidencialidad'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneConvenioConfidencialidad_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneConvenioConfidencialidad_no" name="tieneConvenioConfidencialidad" value="NO"
                                    <?= ($row['tieneConvenioConfidencialidad'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneConvenioConfidencialidad_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Papelería Completa:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_si" name="tienePapeleriaCompleta" value="SI"
                                    <?= ($row['tienePapeleriaCompleta'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tienePapeleriaCompleta_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tienePapeleriaCompleta_no" name="tienePapeleriaCompleta" value="NO"
                                    <?= ($row['tienePapeleriaCompleta'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tienePapeleriaCompleta_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Impermeable:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneImpermeable_si" name="tieneImpermeable" value="SI"
                                    <?= ($row['tieneImpermeable'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneImpermeable_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneImpermeable_no" name="tieneImpermeable" value="NO"
                                    <?= ($row['tieneImpermeable'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneImpermeable_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Capa:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCapa_si" name="tieneCapa" value="SI"
                                    <?= ($row['tieneCapa'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCapa_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCapa_no" name="tieneCapa" value="NO"
                                    <?= ($row['tieneCapa'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCapa_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Casco:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCasco_si" name="tieneCasco" value="SI"
                                    <?= ($row['tieneCasco'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCasco_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCasco_no" name="tieneCasco" value="NO"
                                    <?= ($row['tieneCasco'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCasco_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Equipo:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneEquipo_si" name="tieneEquipo" value="SI"
                                    <?= ($row['tieneEquipo'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneEquipo_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneEquipo_no" name="tieneEquipo" value="NO"
                                    <?= ($row['tieneEquipo'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneEquipo_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Uniforme:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneUniforme_si" name="tieneUniforme" value="SI"
                                    <?= ($row['tieneUniforme'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneUniforme_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneUniforme_no" name="tieneUniforme" value="NO"
                                    <?= ($row['tieneUniforme'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneUniforme_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Rodillera:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneRodillera_si" name="tieneRodillera" value="SI"
                                    <?= ($row['tieneRodillera'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneRodillera_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneRodillera_no" name="tieneRodillera" value="NO"
                                    <?= ($row['tieneRodillera'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneRodillera_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Codera:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCodera_si" name="tieneCodera" value="SI"
                                    <?= ($row['tieneCodera'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCodera_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneCodera_no" name="tieneCodera" value="NO"
                                    <?= ($row['tieneCodera'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneCodera_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Chaleco Arnes:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneChalecoArnes_si" name="tieneChalecoArnes" value="SI"
                                    <?= ($row['tieneChalecoArnes'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneChalecoArnes_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneChalecoArnes_no" name="tieneChalecoArnes" value="NO"
                                    <?= ($row['tieneChalecoArnes'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneChalecoArnes_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Extintor:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExtintor_si" name="tieneExtintor" value="SI"
                                    <?= ($row['tieneExtintor'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExtintor_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExtintor_no" name="tieneExtintor" value="NO"
                                    <?= ($row['tieneExtintor'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExtintor_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Raven:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneRaven_si" name="tieneRaven" value="SI"
                                    <?= ($row['tieneRaven'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneRaven_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneRaven_no" name="tieneRaven" value="NO"
                                    <?= ($row['tieneRaven'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneRaven_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Examen Psicométrico:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenPsicometrico_si" name="tieneExamenPsicometrico" value="SI"
                                    <?= ($row['tieneExamenPsicometrico'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenPsicometrico_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenPsicometrico_no" name="tieneExamenPsicometrico" value="NO"
                                    <?= ($row['tieneExamenPsicometrico'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenPsicometrico_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Examen Excel:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenExcel_si" name="tieneExamenExcel" value="SI"
                                    <?= ($row['tieneExamenExcel'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenExcel_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenExcel_no" name="tieneExamenExcel" value="NO"
                                    <?= ($row['tieneExamenExcel'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenExcel_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Examen Contable:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenContable_si" name="tieneExamenContable" value="SI"
                                    <?= ($row['tieneExamenContable'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenContable_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenContable_no" name="tieneExamenContable" value="NO"
                                    <?= ($row['tieneExamenContable'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenContable_no">NO</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiene Examen General:</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenGeneral_si" name="tieneExamenGeneral" value="SI"
                                    <?= ($row['tieneExamenGeneral'] === 'SI') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenGeneral_si">SI</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="tieneExamenGeneral_no" name="tieneExamenGeneral" value="NO"
                                    <?= ($row['tieneExamenGeneral'] === 'NO') ? 'checked' : '' ?>>
                                <label class="form-check-label" for="tieneExamenGeneral_no">NO</label>
                            </div>
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
