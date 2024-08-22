<?php
require_once('../../login/comprobarweb.php');
require_once('../../vendor/autoload.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include("../../conectarbbdd.php");
include("../../menu/menu.php");

use PhpOffice\PhpSpreadsheet\IOFactory;

function convertirFechaSerialExcelAMySQL($fecha_serial) {
    if (is_numeric($fecha_serial)) {
        $fecha_base = new DateTime('1899-12-30');
        $fecha = $fecha_base->modify('+' . intval($fecha_serial) . ' days');
        return $fecha->format('Y-m-d');
    }
    return null;
}

function manejarFechaVacia($fecha) {
    return !empty($fecha) ? convertirFechaSerialExcelAMySQL($fecha) : null;
}

if (isset($_POST['show_data'])) {
    $file = $_FILES['file_empleados']['tmp_name'];

    if ($file) {
        try {
            $spreadsheet = IOFactory::load($file);
            $worksheet = $spreadsheet->getActiveSheet();

            $_SESSION['import_data'] = [];

            $row_index = 0;
            foreach ($worksheet->getRowIterator() as $row) {
                $row_index++;
                if ($row_index == 1) continue;

                $cellIterator = $row->getCellIterator();
                $cellIterator->setIterateOnlyExistingCells(false);

                $data = [];
                foreach ($cellIterator as $cell) {
                    $data[] = $cell->getValue();
                }

                if (count($data) >= 8) {
                    $fecha_ingreso_mysql = manejarFechaVacia($data[8]);
                    $fecha_retiro_mysql = manejarFechaVacia($data[12]);
                    $fecha_nacimiento_mysql = manejarFechaVacia($data[37]);
                    $vencimiento_licencia_mysql = manejarFechaVacia($data[40]);
                    $vencimiento_igss_mysql = manejarFechaVacia($data[43]);
                    $vencimiento_irtra_mysql = manejarFechaVacia($data[45]);
                    $vencimiento_tarjeta_salud_mysql = manejarFechaVacia($data[63]);
                    $vencimiento_tarjeta_manipulacion_mysql = manejarFechaVacia($data[65]);
                    $vencimiento_tarjeta_pulmones_mysql = manejarFechaVacia($data[67]);

                    $_SESSION['import_data'][] = [
                        'codigoTrabajador' => $data[0],
                        'nombre1' => $data[1],
                        'nombre2' => $data[2],
                        'nombre3' => $data[3],
                        'apellido1' => $data[4],
                        'apellido2' => $data[5],
                        'apellidoCasada' => $data[6],
                        'nombrePuesto' => $data[7],
                        'fechaIngreso' => $fecha_ingreso_mysql,
                        'salarioBase' => $data[9],
                        'bonoLey' => $data[10],
                        'estadoNomina' => $data[11],
                        'fechaRetiro' => $fecha_retiro_mysql,
                        'estados_id' => $data[13],
                        'montoIndemnizacion' => $data[14],
                        'jefes_id' => $data[15],
                        'puestos_id' => $data[16],
                        'costo1s_id' => $data[17],
                        'costo2s_id' => $data[18],
                        'costo3s_id' => $data[19],
                        'costo4s_id' => $data[20],
                        'zonas_id' => $data[21],
                        'nacionalidades_id' => $data[22],
                        'municipios_id' => $data[23],
                        'departamentos_id' => $data[24],
                        'establecimientos_id' => $data[25],
                        'ocupaciones_id' => $data[26],
                        'idiomas_id' => $data[27],
                        'sexo' => $data[28],
                        'tipoContrato' => $data[29],
                        'temporalidadContrato' => $data[30],
                        'jornadaTrabajo' => $data[31],
                        'tipoDiscapacidad' => $data[32],
                        'tipoIdentificacion' => $data[33],
                        'documentoIdentificacion' => $data[34],
                        'nombreMunicipioDpi' => $data[35],
                        'nombreDepartamentoDPI' => $data[36],
                        'fechaNacimiento' => $fecha_nacimiento_mysql,
                        'tipoLicencia' => $data[38],
                        'numeroLicencia' => $data[39],
                        'vencimientoLicencia' => $vencimiento_licencia_mysql,
                        'nit' => $data[41],
                        'numeroIgss' => $data[42],
                        'vencimientoIgss' => $vencimiento_igss_mysql,
                        'numeroIrtra' => $data[44],
                        'vencimientoIrtra' => $vencimiento_irtra_mysql,
                        'direccionTrabajador' => $data[46],
                        'nombreDepartamentoTrabajador' => $data[47],
                        'nombreMunicipioTrabajador' => $data[48],
                        'zonaTrabajador' => $data[49],
                        'cantidadVivenCasa' => $data[50],
                        'telefono' => $data[51],
                        'estadoCivil_id' => $data[52],
                        'puebloOrigen' => $data[53],
                        'cantidadHijos' => $data[54],
                        'ultimoGradoAprobado' => $data[55],
                        'estudios_id' => $data[56],
                        'nombreEstudio' => $data[57],
                        'otrosEstudios' => $data[58],
                        'contactoEmergencia' => $data[59],
                        'direccionEmergencia' => $data[60],
                        'telefonoEmergencia' => $data[61],
                        'tarjetaSalud' => $data[62],
                        'vencimientoTarjetaSalud' => $vencimiento_tarjeta_salud_mysql,
                        'tarjetaManipulacion' => $data[64],
                        'vencimientoManipulacion' => $vencimiento_tarjeta_manipulacion_mysql,
                        'tarjetaPulmones' => $data[66],
                        'vencimientoPulmones' => $vencimiento_tarjeta_pulmones_mysql,
                        'tieneSolicitud' => $data[68],
                        'tieneInduccion' => $data[69],
                        'tieneContratoAMT' => $data[70],
                        'tieneConvenioConfidencialidad' => $data[71],
                        'tienePapeleriaCompleta' => $data[72],
                        'tieneEquipo' => $data[73],
                        'tieneUniforme' => $data[74],
                        'tieneCasco' => $data[75],
                        'tieneImpermeable' => $data[76],
                        'tieneCapa' => $data[77],
                        'tieneRodillera' => $data[78],
                        'tieneCodera' => $data[79],
                        'tieneChalecoArnes' => $data[80],
                        'tieneExtintor' => $data[81],
                        'tieneRaven' => $data[82],
                        'tieneExamenPsicometrico' => $data[83],
                        'tieneExamenExcel' => $data[84],
                        'tieneExamenContable' => $data[85],
                        'tieneExamenGeneral' => $data[86],
                        'notaExamenPsicometrico' => $data[87],
                        'notaExamenExcel' => $data[88],
                        'notaExamenContable' => $data[89],
                        'notaExamenGeneral' => $data[90],
                        'correo' => $data[91],
                        'experiencias' => $data[92],
                        'text3' => $data[93],
                        'tipoPago' => $data[94],
                        'banco' => $data[95],
                        'grupoCuenta' => $data[96],
                        'enum1' => $data[97],
                        'aPrueba' => $data[98],
                        'enum3' => $data[99],
                        'integer1' => $data[100],
                        'integer2' => $data[101],
                        'integer3' => $data[102],
                        'decimal1' => $data[103],
                        'decimal2' => $data[104],
                        'decimal3' => $data[105],
                    ];
                }
            }
        } catch (Exception $e) {
            echo 'Error al cargar el archivo: ' . $e->getMessage();
        }
    } else {
        echo 'Por favor, seleccione un archivo Excel válido.';
    }
}

if (isset($_POST['import_empleados'])) {
    $importData = $_SESSION['import_data'] ?? [];
    $success = true;

    foreach ($importData as $data) {
        $codigoTrabajador = $data['codigoTrabajador'];
        $nombre1 = $data['nombre1'];
        $nombre2 = $data['nombre2'];
        $nombre3 = $data['nombre3'];
        $apellido1 = $data['apellido1'];
        $apellido2 = $data['apellido2'];
        $apellidoCasada = $data['apellidoCasada'];
        $nombrePuesto = $data['nombrePuesto'];
        $fechaIngreso = $data['fechaIngreso'];
        $salarioBase=$data['salarioBase'];
        $bonoLey=$data['bonoLey'];
        $estadoNomina=$data['estadoNomina'];
        $fechaRetiro=$data['fechaRetiro'];
        $estados_id=$data['estados_id'];
        $montoIndemnizacion=$data['montoIndemnizacion'];
        $jefes_id=$data['jefes_id'];
        $puestos_id=$data['puestos_id'];
        $costo1s_id=$data['costo1s_id'];
        $costo2s_id=$data['costo2s_id'];
        $costo3s_id=$data['costo3s_id'];
        $costo4s_id=$data['costo4s_id'];
        $zonas_id=$data['zonas_id'];
        $nacionalidades_id=$data['nacionalidades_id'];
        $municipios_id=$data['municipios_id'];
        $departamentos_id=$data['departamentos_id'];
        $establecimientos_id=$data['establecimientos_id'];
        $ocupaciones_id=$data['ocupaciones_id'];
        $idiomas_id=$data['idiomas_id'];
        $sexo=$data['sexo'];
        $tipoContrato=$data['tipoContrato'];
        $temporalidadContrato=$data['temporalidadContrato'];
        $jornadaTrabajo=$data['jornadaTrabajo'];
        $tipoDiscapacidad=$data['tipoDiscapacidad'];
        $tipoIdentificacion=$data['tipoIdentificacion'];
        $documentoIdentificacion=$data['documentoIdentificacion'];
        $nombreMunicipioDpi=$data['nombreMunicipioDpi'];
        $nombreDepartamentoDPI=$data['nombreDepartamentoDPI'];
        $fechaNacimiento=$data['fechaNacimiento'];
        $tipoLicencia=$data['tipoLicencia'];
        $numeroLicencia=$data['numeroLicencia'];
        $vencimientoLicencia=$data['vencimientoLicencia'];
        $nit=$data['nit'];
        $numeroIgss=$data['numeroIgss'];
        $vencimientoIgss=$data['vencimientoIgss'];
        $numeroIrtra=$data['numeroIrtra'];
        $vencimientoIrtra=$data['vencimientoIrtra'];
        $direccionTrabajador=$data['direccionTrabajador'];
        $nombreDepartamentoTrabajador=$data['nombreDepartamentoTrabajador'];
        $nombreMunicipioTrabajador=$data['nombreMunicipioTrabajador'];
        $zonaTrabajador=$data['zonaTrabajador'];
        $cantidadVivenCasa=$data['cantidadVivenCasa'];
        $telefono=$data['telefono'];
        $estadoCivil_id=$data['estadoCivil_id'];
        $puebloOrigen=$data['puebloOrigen'];
        $cantidadHijos=$data['cantidadHijos'];
        $ultimoGradoAprobado=$data['ultimoGradoAprobado'];
        $estudios_id=$data['estudios_id'];
        $nombreEstudio=$data['nombreEstudio'];
        $otrosEstudios=$data['otrosEstudios'];
        $contactoEmergencia=$data['contactoEmergencia'];
        $direccionEmergencia=$data['direccionEmergencia'];
        $telefonoEmergencia=$data['telefonoEmergencia'];
        $tarjetaSalud=$data['tarjetaSalud'];
        $vencimientoTarjetaSalud=$data['vencimientoTarjetaSalud'];
        $tarjetaManipulacion=$data['tarjetaManipulacion'];
        $vencimientoManipulacion=$data['vencimientoManipulacion'];
        $tarjetaPulmones=$data['tarjetaPulmones'];
        $vencimientoPulmones=$data['vencimientoPulmones'];
        $tieneSolicitud=$data['tieneSolicitud'];
        $tieneInduccion=$data['tieneInduccion'];
        $tieneContratoAMT=$data['tieneContratoAMT'];
        $tieneConvenioConfidencialidad=$data['tieneConvenioConfidencialidad'];
        $tienePapeleriaCompleta=$data['tienePapeleriaCompleta'];
        $tieneEquipo=$data['tieneEquipo'];
        $tieneUniforme=$data['tieneUniforme'];
        $tieneCasco=$data['tieneCasco'];
        $tieneImpermeable=$data['tieneImpermeable'];
        $tieneCapa=$data['tieneCapa'];
        $tieneRodillera=$data['tieneRodillera'];
        $tieneCodera=$data['tieneCodera'];
        $tieneChalecoArnes=$data['tieneChalecoArnes'];
        $tieneExtintor=$data['tieneExtintor'];
        $tieneRaven=$data['tieneRaven'];
        $tieneExamenPsicometrico=$data['tieneExamenPsicometrico'];
        $tieneExamenExcel=$data['tieneExamenExcel'];
        $tieneExamenContable=$data['tieneExamenContable'];
        $tieneExamenGeneral=$data['tieneExamenGeneral'];
        $notaExamenPsicometrico=$data['notaExamenPsicometrico'];
        $notaExamenExcel=$data['notaExamenExcel'];
        $notaExamenContable=$data['notaExamenContable'];
        $notaExamenGeneral=$data['notaExamenGeneral'];
        $correo=$data['correo'];
        $experiencias=$data['experiencias'];
        $text3=$data['text3'];
        $tipoPago=$data['tipoPago'];
        $banco=$data['banco'];
        $grupoCuenta=$data['grupoCuenta'];
        $enum1=$data['enum1'];
        $aPrueba=$data['aPrueba'];
        $enum3=$data['enum3'];
        $integer1=$data['integer1'];
        $integer2=$data['integer2'];
        $integer3=$data['integer3'];
        $decimal1=$data['decimal1'];
        $decimal2=$data['decimal2'];
        $decimal3=$data['decimal3'];

        // Verifica si el empleado ya existe en la base de datos
        $check_sql = "SELECT COUNT(*) FROM empleados WHERE codigoTrabajador = '$codigoTrabajador'";
        $check_result = mysqli_query($conn, $check_sql);
        $exists = mysqli_fetch_array($check_result)[0] > 0;

        if ($exists) {
            $sql = "UPDATE empleados SET 
            nombre1 = '$nombre1',
            nombre2 = '$nombre2',
            nombre3 = '$nombre3',
            apellido1 = '$apellido1',
            apellido2 = '$apellido2',
            apellidoCasada = '$apellidoCasada',
            nombrePuesto = '$nombrePuesto',
            fechaIngreso = " . ($fechaIngreso ? "'$fechaIngreso'" : "NULL") . ",
            salarioBase='$salarioBase',
            bonoLey='$bonoLey',
            estadoNomina='$estadoNomina',
            fechaRetiro = " . ($fechaRetiro ? "'$fechaRetiro'" : "NULL") . ",
            estados_id='$estados_id',
            montoIndemnizacion='$montoIndemnizacion',
            jefes_id='$jefes_id',
            puestos_id='$puestos_id',
            costo1s_id='$costo1s_id',
            costo2s_id='$costo2s_id',
            costo3s_id='$costo3s_id',
            costo4s_id='$costo4s_id',
            zonas_id='$zonas_id',
            nacionalidades_id='$nacionalidades_id',
            municipios_id='$municipios_id',
            departamentos_id='$departamentos_id',
            establecimientos_id='$establecimientos_id',
            ocupaciones_id='$ocupaciones_id',
            idiomas_id='$idiomas_id',
            sexo='$sexo',
            tipoContrato='$tipoContrato',
            temporalidadContrato='$temporalidadContrato',
            jornadaTrabajo='$jornadaTrabajo',
            tipoDiscapacidad='$tipoDiscapacidad',
            tipoIdentificacion='$tipoIdentificacion',
            documentoIdentificacion='$documentoIdentificacion',
            nombreMunicipioDpi='$nombreMunicipioDpi',
            nombreDepartamentoDPI='$nombreDepartamentoDPI',
            fechaNacimiento = " . ($fechaNacimiento ? "'$fechaNacimiento'" : "NULL") . ",
            tipoLicencia='$tipoLicencia',
            numeroLicencia='$numeroLicencia',
            vencimientoLicencia = " . ($vencimientoLicencia ? "'$vencimientoLicencia'" : "NULL") . ",
            nit='$nit',
            numeroIgss='$numeroIgss',
            vencimientoIgss = " . ($vencimientoIgss ? "'$vencimientoIgss'" : "NULL") . ",
            numeroIrtra='$numeroIrtra',
            vencimientoIrtra = " . ($vencimientoIrtra ? "'$vencimientoIrtra'" : "NULL") . ",
            direccionTrabajador='$direccionTrabajador',
            nombreDepartamentoTrabajador='$nombreDepartamentoTrabajador',
            nombreMunicipioTrabajador='$nombreMunicipioTrabajador',
            zonaTrabajador='$zonaTrabajador',
            cantidadVivenCasa='$cantidadVivenCasa',
            telefono='$telefono',
            estadoCivil_id='$estadoCivil_id',
            puebloOrigen='$puebloOrigen',
            cantidadHijos='$cantidadHijos',
            ultimoGradoAprobado='$ultimoGradoAprobado',
            estudios_id='$estudios_id',
            nombreEstudio='$nombreEstudio',
            otrosEstudios='$otrosEstudios',
            contactoEmergencia='$contactoEmergencia',
            direccionEmergencia='$direccionEmergencia',
            telefonoEmergencia='$telefonoEmergencia',
            tarjetaSalud='$tarjetaSalud',
            vencimientoTarjetaSalud = " . ($vencimientoTarjetaSalud ? "'$vencimientoTarjetaSalud'" : "NULL") . ",
            tarjetaManipulacion='$tarjetaManipulacion',
            vencimientoManipulacion = " . ($vencimientoManipulacion ? "'$vencimientoManipulacion'" : "NULL") . ",
            tarjetaPulmones='$tarjetaPulmones',
            vencimientoPulmones = " . ($vencimientoPulmones ? "'$vencimientoPulmones'" : "NULL") . ",
            tieneSolicitud='$tieneSolicitud',
            tieneInduccion='$tieneInduccion',
            tieneContratoAMT='$tieneContratoAMT',
            tieneConvenioConfidencialidad='$tieneConvenioConfidencialidad',
            tienePapeleriaCompleta='$tienePapeleriaCompleta',
            tieneEquipo='$tieneEquipo',
            tieneUniforme='$tieneUniforme',
            tieneCasco='$tieneCasco',
            tieneImpermeable='$tieneImpermeable',
            tieneCapa='$tieneCapa',
            tieneRodillera='$tieneRodillera',
            tieneCodera='$tieneCodera',
            tieneChalecoArnes='$tieneChalecoArnes',
            tieneExtintor='$tieneExtintor',
            tieneRaven='$tieneRaven',
            tieneExamenPsicometrico='$tieneExamenPsicometrico',
            tieneExamenExcel='$tieneExamenExcel',
            tieneExamenContable='$tieneExamenContable',
            tieneExamenGeneral='$tieneExamenGeneral',
            notaExamenPsicometrico='$notaExamenPsicometrico',
            notaExamenExcel='$notaExamenExcel',
            notaExamenContable='$notaExamenContable',
            notaExamenGeneral='$notaExamenGeneral',
            correo='$correo',
            experiencias='$experiencias',
            text3='$text3',
            tipoPago='$tipoPago',
            banco='$banco',
            grupoCuenta='$grupoCuenta',
            enum1='$enum1',
            aPrueba='$aPrueba',
            enum3='$enum3',
            integer1='$integer1',
            integer2='$integer2',
            integer3='$integer3',
            decimal1='$decimal1',
            decimal2='$decimal2',

                    decimal3='$decimal3'

                    WHERE codigoTrabajador = '$codigoTrabajador'";
        } else {
            $sql = "INSERT INTO empleados (
                    codigoTrabajador,
                    nombre1,
                    nombre2,
                    nombre3,
                    apellido1,
                    apellido2,
                    apellidoCasada,
                    nombrePuesto,
                    fechaIngreso,
                    salarioBase,
                    bonoLey,
                    estadoNomina,
                    fechaRetiro,
                    estados_id,
                    montoIndemnizacion,
                    jefes_id,
                    puestos_id,
                    costo1s_id,
                    costo2s_id,
                    costo3s_id,
                    costo4s_id,
                    zonas_id,
                    nacionalidades_id,
                    municipios_id,
                    departamentos_id,
                    establecimientos_id,
                    ocupaciones_id,
                    idiomas_id,
                    sexo,
                    tipoContrato,
                    temporalidadContrato,
                    jornadaTrabajo,
                    tipoDiscapacidad,
                    tipoIdentificacion,
                    documentoIdentificacion,
                    nombreMunicipioDpi,
                    nombreDepartamentoDPI,
                    fechaNacimiento,
                    tipoLicencia,
                    numeroLicencia,
                    vencimientoLicencia,
                    nit,
                    numeroIgss,
                    vencimientoIgss,
                    numeroIrtra,
                    vencimientoIrtra,
                    direccionTrabajador,
                    nombreDepartamentoTrabajador,
                    nombreMunicipioTrabajador,
                    zonaTrabajador,
                    cantidadVivenCasa,
                    telefono,
                    estadoCivil_id,
                    puebloOrigen,
                    cantidadHijos,
                    ultimoGradoAprobado,
                    estudios_id,
                    nombreEstudio,
                    otrosEstudios,
                    contactoEmergencia,
                    direccionEmergencia,
                    telefonoEmergencia,
                    tarjetaSalud,
                    vencimientoTarjetaSalud,
                    tarjetaManipulacion,
                    vencimientoManipulacion,
                    tarjetaPulmones,
                    vencimientoPulmones,
                    tieneSolicitud,
                    tieneInduccion,
                    tieneContratoAMT,
                    tieneConvenioConfidencialidad,
                    tienePapeleriaCompleta,
                    tieneEquipo,
                    tieneUniforme,
                    tieneCasco,
                    tieneImpermeable,
                    tieneCapa,
                    tieneRodillera,
                    tieneCodera,
                    tieneChalecoArnes,
                    tieneExtintor,
                    tieneRaven,
                    tieneExamenPsicometrico,
                    tieneExamenExcel,
                    tieneExamenContable,
                    tieneExamenGeneral,
                    notaExamenPsicometrico,
                    notaExamenExcel,
                    notaExamenContable,
                    notaExamenGeneral,
                    correo,
                    experiencias,
                    text3,
                    tipoPago,
                    banco,
                    grupoCuenta,
                    enum1,
                    aPrueba,
                    enum3,
                    integer1,
                    integer2,
                    integer3,
                    decimal1,
                    decimal2,
                    decimal3
                    ) 
                    VALUES (
                    '$codigoTrabajador', 
                    '$nombre1',
                    '$nombre2',
                    '$nombre3',
                    '$apellido1',
                    '$apellido2',
                    '$apellidoCasada',
                    '$nombrePuesto',
                    " . ($fechaIngreso ? "'$fechaIngreso'" : "NULL") . ",
                    '$salarioBase',
                    '$bonoLey',
                    '$estadoNomina',
                    " . ($fechaRetiro ? "'$fechaRetiro'" : "NULL") . ",
                    '$estados_id',
                    '$montoIndemnizacion',
                    '$jefes_id',
                    '$puestos_id',
                    '$costo1s_id',
                    '$costo2s_id',
                    '$costo3s_id',
                    '$costo4s_id',
                    '$zonas_id',
                    '$nacionalidades_id',
                    '$municipios_id',
                    '$departamentos_id',
                    '$establecimientos_id',
                    '$ocupaciones_id',
                    '$idiomas_id',
                    '$sexo',
                    '$tipoContrato',
                    '$temporalidadContrato',
                    '$jornadaTrabajo',
                    '$tipoDiscapacidad',
                    '$tipoIdentificacion',
                    '$documentoIdentificacion',
                    '$nombreMunicipioDpi',
                    '$nombreDepartamentoDPI',
                    " . ($fechaNacimiento ? "'$fechaNacimiento'" : "NULL") . ",
                    '$tipoLicencia',
                    '$numeroLicencia',
                    " . ($vencimientoLicencia ? "'$vencimientoLicencia'" : "NULL") . ",
                    '$nit',
                    '$numeroIgss',
                    " . ($vencimientoIgss ? "'$vencimientoIgss'" : "NULL") . ",
                    '$numeroIrtra',
                    " . ($vencimientoIrtra ? "'$vencimientoIrtra'" : "NULL") . ",
                    '$direccionTrabajador',
                    '$nombreDepartamentoTrabajador',
                    '$nombreMunicipioTrabajador',
                    '$zonaTrabajador',
                    '$cantidadVivenCasa',
                    '$telefono',
                    '$estadoCivil_id',
                    '$puebloOrigen',
                    '$cantidadHijos',
                    '$ultimoGradoAprobado',
                    '$estudios_id',
                    '$nombreEstudio',
                    '$otrosEstudios',
                    '$contactoEmergencia',
                    '$direccionEmergencia',
                    '$telefonoEmergencia',
                    '$tarjetaSalud',
                    " . ($vencimientoTarjetaSalud ? "'$vencimientoTarjetaSalud'" : "NULL") . ",
                    '$tarjetaManipulacion',
                    " . ($vencimientoManipulacion ? "'$vencimientoManipulacion'" : "NULL") . ",
                    '$tarjetaPulmones',
                    " . ($vencimientoPulmones ? "'$vencimientoPulmones'" : "NULL") . ",
                    '$tieneSolicitud',
                    '$tieneInduccion',
                    '$tieneContratoAMT',
                    '$tieneConvenioConfidencialidad',
                    '$tienePapeleriaCompleta',
                    '$tieneEquipo',
                    '$tieneUniforme',
                    '$tieneCasco',
                    '$tieneImpermeable',
                    '$tieneCapa',
                    '$tieneRodillera',
                    '$tieneCodera',
                    '$tieneChalecoArnes',
                    '$tieneExtintor',
                    '$tieneRaven',
                    '$tieneExamenPsicometrico',
                    '$tieneExamenExcel',
                    '$tieneExamenContable',
                    '$tieneExamenGeneral',
                    '$notaExamenPsicometrico',
                    '$notaExamenExcel',
                    '$notaExamenContable',
                    '$notaExamenGeneral',
                    '$correo',
                    '$experiencias',
                    '$text3',
                    '$tipoPago',
                    '$banco',
                    '$grupoCuenta',
                    '$enum1',
                    '$aPrueba',
                    '$enum3',
                    '$integer1',
                    '$integer2',
                    '$integer3',
                    '$decimal1',
                    '$decimal2',
                    '$decimal3'
                    )";
        }

        $result = mysqli_query($conn, $sql);

        if (!$result) {
            $success = false;
        }
    }

    if ($success) {
        echo '<div class="alert alert-success" role="alert">';
        echo 'Datos guardados correctamente.';
        echo '</div>';
    } else {
        echo '<div class="alert alert-danger" role="alert">';
        echo 'Error al insertar datos en la base de datos: ' . mysqli_error($conn);
        echo '</div>';
    }

    unset($_SESSION['import_data']);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Importar Empleados</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h2>Tabla de Empleados</h2>

    <?php
    if (isset($_SESSION['import_data']) && !empty($_SESSION['import_data'])) {
        echo '<table class="table table-striped">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Código de Trabajador</th>';
        echo '<th>Primer Nombre</th>';
        echo '<th>Segundo Nombre</th>';
        echo '<th>Tercer Nombre</th>';
        echo '<th>Primer Apellido</th>';
        echo '<th>Segundo Apellido</th>';
        echo '<th>Apellido de Casada</th>';
        echo '<th>Nombre del Puesto</th>';
        echo '<th>Fecha de Ingreso</th>';
        echo '<th>Salario Base</th>';
        echo '<th>Bono de Ley</th>';
        echo '<th>Estado 1</th>';
        echo '<th>Fecha de Retiro</th>';
        echo '<th>Estados ID</th>';
        echo '<th>Monto de Indemnización</th>';
        echo '<th>Jefes ID</th>';
        echo '<th>Puestos ID</th>';
        echo '<th>Costo1s ID</th>';
        echo '<th>Costo2s ID</th>';
        echo '<th>Costo3s ID</th>';
        echo '<th>Costo4s ID</th>';
        echo '<th>Zonas ID</th>';
        echo '<th>Nacionalidades ID</th>';
        echo '<th>Municipios ID</th>';
        echo '<th>Departamentos ID</th>';
        echo '<th>Establecimientos ID</th>';
        echo '<th>Ocupaciones ID</th>';
        echo '<th>Idiomas ID</th>';
        echo '<th>Sexo</th>';
        echo '<th>Tipo de Contrato</th>';
        echo '<th>Temporalidad del Contrato</th>';
        echo '<th>Jornada de Trabajo</th>';
        echo '<th>Tipo de Discapacidad</th>';
        echo '<th>Tipo de Identificación</th>';
        echo '<th>Documento de Identificación</th>';
        echo '<th>Nombre del Municipio (DPI)</th>';
        echo '<th>Nombre del Departamento (DPI)</th>';
        echo '<th>Fecha de Nacimiento</th>';
        echo '<th>Tipo de Licencia</th>';
        echo '<th>Número de Licencia</th>';
        echo '<th>Vencimiento de Licencia</th>';
        echo '<th>NIT</th>';
        echo '<th>Número IGSS</th>';
        echo '<th>Vencimiento IGSS</th>';
        echo '<th>Número IRTRA</th>';
        echo '<th>Vencimiento IRTRA</th>';
        echo '<th>Dirección del Trabajador</th>';
        echo '<th>Nombre del Departamento del Trabajador</th>';
        echo '<th>Nombre del Municipio del Trabajador</th>';
        echo '<th>Zona del Trabajador</th>';
        echo '<th>Cantidad que Viven en Casa</th>';
        echo '<th>Teléfono</th>';
        echo '<th>Estado Civil</th>';
        echo '<th>Pueblo de Origen</th>';
        echo '<th>Cantidad de Hijos</th>';
        echo '<th>Último Grado Aprobado</th>';
        echo '<th>Estudios ID</th>';
        echo '<th>Nombre del Estudio</th>';
        echo '<th>Otros Estudios</th>';
        echo '<th>Contacto de Emergencia</th>';
        echo '<th>Dirección de Emergencia</th>';
        echo '<th>Teléfono de Emergencia</th>';
        echo '<th>Tarjeta de Salud</th>';
        echo '<th>Vencimiento de Tarjeta de Salud</th>';
        echo '<th>Tarjeta de Manipulación</th>';
        echo '<th>Vencimiento de Tarjeta de Manipulación</th>';
        echo '<th>Tarjeta de Pulmones</th>';
        echo '<th>Vencimiento de Tarjeta de Pulmones</th>';
        echo '<th>Tiene Solicitud</th>';
        echo '<th>Tiene Inducción</th>';
        echo '<th>Tiene Contrato AMT</th>';
        echo '<th>Tiene Convenio de Confidencialidad</th>';
        echo '<th>Tiene Papelería Completa</th>';
        echo '<th>Tiene Equipo</th>';
        echo '<th>Tiene Uniforme</th>';
        echo '<th>Tiene Casco</th>';
        echo '<th>Tiene Impermeable</th>';
        echo '<th>Tiene Capa</th>';
        echo '<th>Tiene Rodillera</th>';
        echo '<th>Tiene Codera</th>';
        echo '<th>Tiene Chaleco Arnes</th>';
        echo '<th>Tiene Extintor</th>';
        echo '<th>Tiene Raven</th>';
        echo '<th>Tiene Examen Psicométrico</th>';
        echo '<th>Tiene Examen de Excel</th>';
        echo '<th>Tiene Examen Contable</th>';
        echo '<th>Tiene Examen General</th>';
        echo '<th>Nota del Examen Psicométrico</th>';
        echo '<th>Nota del Examen de Excel</th>';
        echo '<th>Nota del Examen Contable</th>';
        echo '<th>Nota del Examen General</th>';
        echo '<th>Correo</th>';
        echo '<th>Experiencias</th>';
        echo '<th>Texto 3</th>';
        echo '<th>Tipo de Pago</th>';
        echo '<th>Banco</th>';
        echo '<th>Grupo de Cuenta</th>';
        echo '<th>Código de Estado Civil</th>';
        echo '<th>A Prueba</th>';
        echo '<th>Enum 3</th>';
        echo '<th>Entero 1</th>';
        echo '<th>Entero 2</th>';
        echo '<th>Entero 3</th>';
        echo '<th>Decimal 1</th>';
        echo '<th>Decimal 2</th>';
        echo '<th>Decimal 3</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        

        foreach ($_SESSION['import_data'] as $data) {
            echo '<tr>';
            echo "<td>{$data['codigoTrabajador']}</td>";
            echo "<td>{$data['nombre1']}</td>";
            echo "<td>{$data['nombre2']}</td>";
            echo "<td>{$data['nombre3']}</td>";
            echo "<td>{$data['apellido1']}</td>";
            echo "<td>{$data['apellido2']}</td>";
            echo "<td>{$data['apellidoCasada']}</td>";
            echo "<td>{$data['nombrePuesto']}</td>";
            echo "<td>{$data['fechaIngreso']}</td>";
            echo "<td>{$data['salarioBase']}</td>";
            echo "<td>{$data['bonoLey']}</td>";
            echo "<td>{$data['estadoNomina']}</td>";
            echo "<td>{$data['fechaRetiro']}</td>";
            echo "<td>{$data['estados_id']}</td>";
            echo "<td>{$data['montoIndemnizacion']}</td>";
            echo "<td>{$data['jefes_id']}</td>";
            echo "<td>{$data['puestos_id']}</td>";
            echo "<td>{$data['costo1s_id']}</td>";
            echo "<td>{$data['costo2s_id']}</td>";
            echo "<td>{$data['costo3s_id']}</td>";
            echo "<td>{$data['costo4s_id']}</td>";
            echo "<td>{$data['zonas_id']}</td>";
            echo "<td>{$data['nacionalidades_id']}</td>";
            echo "<td>{$data['municipios_id']}</td>";
            echo "<td>{$data['departamentos_id']}</td>";
            echo "<td>{$data['establecimientos_id']}</td>";
            echo "<td>{$data['ocupaciones_id']}</td>";
            echo "<td>{$data['idiomas_id']}</td>";
            echo "<td>{$data['sexo']}</td>";
            echo "<td>{$data['tipoContrato']}</td>";
            echo "<td>{$data['temporalidadContrato']}</td>";
            echo "<td>{$data['jornadaTrabajo']}</td>";
            echo "<td>{$data['tipoDiscapacidad']}</td>";
            echo "<td>{$data['tipoIdentificacion']}</td>";
            echo "<td>{$data['documentoIdentificacion']}</td>";
            echo "<td>{$data['nombreMunicipioDpi']}</td>";
            echo "<td>{$data['nombreDepartamentoDPI']}</td>";
            echo "<td>{$data['fechaNacimiento']}</td>";
            echo "<td>{$data['tipoLicencia']}</td>";
            echo "<td>{$data['numeroLicencia']}</td>";
            echo "<td>{$data['vencimientoLicencia']}</td>";
            echo "<td>{$data['nit']}</td>";
            echo "<td>{$data['numeroIgss']}</td>";
            echo "<td>{$data['vencimientoIgss']}</td>";
            echo "<td>{$data['numeroIrtra']}</td>";
            echo "<td>{$data['vencimientoIrtra']}</td>";
            echo "<td>{$data['direccionTrabajador']}</td>";
            echo "<td>{$data['nombreDepartamentoTrabajador']}</td>";
            echo "<td>{$data['nombreMunicipioTrabajador']}</td>";
            echo "<td>{$data['zonaTrabajador']}</td>";
            echo "<td>{$data['cantidadVivenCasa']}</td>";
            echo "<td>{$data['telefono']}</td>";
            echo "<td>{$data['estadoCivil_id']}</td>";
            echo "<td>{$data['puebloOrigen']}</td>";
            echo "<td>{$data['cantidadHijos']}</td>";
            echo "<td>{$data['ultimoGradoAprobado']}</td>";
            echo "<td>{$data['estudios_id']}</td>";
            echo "<td>{$data['nombreEstudio']}</td>";
            echo "<td>{$data['otrosEstudios']}</td>";
            echo "<td>{$data['contactoEmergencia']}</td>";
            echo "<td>{$data['direccionEmergencia']}</td>";
            echo "<td>{$data['telefonoEmergencia']}</td>";
            echo "<td>{$data['tarjetaSalud']}</td>";
            echo "<td>{$data['vencimientoTarjetaSalud']}</td>";
            echo "<td>{$data['tarjetaManipulacion']}</td>";
            echo "<td>{$data['vencimientoManipulacion']}</td>";
            echo "<td>{$data['tarjetaPulmones']}</td>";
            echo "<td>{$data['vencimientoPulmones']}</td>";
            echo "<td>{$data['tieneSolicitud']}</td>";
            echo "<td>{$data['tieneInduccion']}</td>";
            echo "<td>{$data['tieneContratoAMT']}</td>";
            echo "<td>{$data['tieneConvenioConfidencialidad']}</td>";
            echo "<td>{$data['tienePapeleriaCompleta']}</td>";
            echo "<td>{$data['tieneEquipo']}</td>";
            echo "<td>{$data['tieneUniforme']}</td>";
            echo "<td>{$data['tieneCasco']}</td>";
            echo "<td>{$data['tieneImpermeable']}</td>";
            echo "<td>{$data['tieneCapa']}</td>";
            echo "<td>{$data['tieneRodillera']}</td>";
            echo "<td>{$data['tieneCodera']}</td>";
            echo "<td>{$data['tieneChalecoArnes']}</td>";
            echo "<td>{$data['tieneExtintor']}</td>";
            echo "<td>{$data['tieneRaven']}</td>";
            echo "<td>{$data['tieneExamenPsicometrico']}</td>";
            echo "<td>{$data['tieneExamenExcel']}</td>";
            echo "<td>{$data['tieneExamenContable']}</td>";
            echo "<td>{$data['tieneExamenGeneral']}</td>";
            echo "<td>{$data['notaExamenPsicometrico']}</td>";
            echo "<td>{$data['notaExamenExcel']}</td>";
            echo "<td>{$data['notaExamenContable']}</td>";
            echo "<td>{$data['notaExamenGeneral']}</td>";
            echo "<td>{$data['correo']}</td>";
            echo "<td>{$data['experiencias']}</td>";
            echo "<td>{$data['text3']}</td>";
            echo "<td>{$data['tipoPago']}</td>";
            echo "<td>{$data['banco']}</td>";
            echo "<td>{$data['grupoCuenta']}</td>";
            echo "<td>{$data['enum1']}</td>";
            echo "<td>{$data['aPrueba']}</td>";
            echo "<td>{$data['enum3']}</td>";
            echo "<td>{$data['integer1']}</td>";
            echo "<td>{$data['integer2']}</td>";
            echo "<td>{$data['integer3']}</td>";
            echo "<td>{$data['decimal1']}</td>";
            echo "<td>{$data['decimal2']}</td>";
            echo "<td>{$data['decimal3']}</td>";
            echo '</tr>';
        }
        

        echo '</tbody>';
        echo '</table>';
        ?>
        <form method="POST" enctype="multipart/form-data">
            <button type="submit" name="import_empleados" class="btn btn-primary">Importar Empleados</button>
        </form>
        <?php
    } else {
        ?>
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file_empleados">Selecciona un archivo Excel:</label>
                <input type="file" name="file_empleados" class="form-control-file" id="file_empleados">
            </div>
            <button type="submit" name="show_data" class="btn btn-info">Mostrar Información</button>
        </form>
        <?php
    }
    ?>
</div>

</body>
</html>
