<?php
// Incluir el archivo de conexión a la base de datos al principio
include("../../conectarbbdd.php");

// Verificar si se ha enviado el formulario
if (isset($_POST['generar_nomina'])) {
    // Recoger los datos del formulario
    $periodo = $_POST['periodo'];

    // Ejecutar la consulta SQL para insertar en la tabla "nominas"
    $sql = "INSERT INTO nominas (
            periodo,
            costo1,
            costo2,
            costo3,
            costo4,
            aPrueba,
            nombreJefe,
            nombreRegion,
            nombreCosto,
            codigoTrabajador,
            nombre1,
            nombre2,
            nombre3,
            apellido1,
            apellido2,
            nombrePuesto1,
            nombrePuesto2,
            tipoPago,
            banco,
            grupoCuenta,
            diasTrabajados,
            diasAusencia,
            horasParciales,
            fechaBaja,
            estado1,
            baseMensual,
            baseQuincenal,
            baseSemanal,
            baseComisiones,
            comisionesVentas,
            cantidadCongeladores,
            comisionesCongeladores,
            totalComisiones,
            totalOrdinario,
            cantidadHorasSimples,
            importeHorasSimples,
            cantidadHorasDobles,
            importeHorasDobles,
            totalHorasExtras,
            vacaciones,
            afectoIGSS,
            bonoLey,
            bonoCongeladores,
            bonoCumplimiento,
            bonoRetornos,
            otrosBonos,
            nombreBono,
            totalBonificaciones,
            devolucionISR,
            Reintegros,
            totalIngresos,
            IGSSlaboral,
            ISRañoAnterior,
            ISRactual,
            anticipoSalario,
            prestamoGYT,
            prestamoBantrab,
            uniformes,
            descuentoInventarios,
            embargos,
            boletoOrnato,
            tarjetaSalud,
            bazares,
            ventaProducto,
            otrosDescuentos,
            nombreDescuento,
            totalDescuentos,
            totalEgresos,
            liquidoPagar
        )
        SELECT
            '$periodo',
            T1.costo1,
            T2.costo2,
            T3.costo3,
            T4.costo4,
            T0.aPrueba,
            T6.nombreJefe,
            T8.nombreRegion,
            T3.nombreCosto3,
            T0.codigoTrabajador,
            T0.nombre1,
            T0.nombre2,
            T0.nombre3,
            T0.apellido1,
            T0.apellido2,
            T7.nombrePuesto1,
            T7.nombrePuesto2,
            T0.tipoPago,
            T0.banco,
            T0.grupoCuenta,
            T16.diasTrabajados,
            T16.diasAusencia,
            T16.horasParciales,
            T0.fechaRetiro,
            T0.estado1,
            T0.salarioBase, -- Base Mensual
            (T0.salarioBase/T18.diasPeriodo*T16.diasTrabajados), -- Base Quincenal
            0, -- baseSemanal
            0, -- baseComisiones
            T16.comisionesVentas,
            T16.cantidadCongeladores,
            T16.comisionesCongeladores,
            (T16.comisionesVentas+T16.comisionesCongeladores), -- Total Comisiones
            (T0.salarioBase/T18.diasPeriodo*T16.diasTrabajados)+(T16.comisionesVentas+T16.comisionesCongeladores), -- Total ordinario
            T16.cantidadHorasSimples,
            T16.importeHorasSimples,
            T16.cantidadHorasDobles,
            T16.importeHorasDobles,
            (T16.importeHorasSimples+T16.importeHorasDobles),-- Total horas extras
            T16.vacaciones,
            (T0.salarioBase/T18.diasPeriodo*T16.diasTrabajados)+(T16.comisionesVentas+T16.comisionesCongeladores)
            +(T16.importeHorasSimples+T16.importeHorasDobles), -- Afecto al IGSS
            (T0.bonoLey/T18.diasPeriodo*T16.diasTrabajados), -- Bono ley
            T16.bonoCongeladores,
            T16.bonoCumplimiento,
            T16.bonoRetornos,
            T16.otrosBonos,
            'nombreBono',
            (T16.bonoCongeladores + T16.bonoCumplimiento+T16.bonoRetornos+T16.otrosBonos), -- Total bonificaciones
            T16.devolucionISR, -- devolucionISR,
            T16.reintegros, -- reintegros,
            (T0.salarioBase/T18.diasPeriodo*T16.diasTrabajados)+(T16.comisionesVentas+T16.comisionesCongeladores)
            +(T16.importeHorasSimples+T16.importeHorasDobles)+(T16.bonoCongeladores + T16.bonoCumplimiento+T16.bonoRetornos+T16.otrosBonos)
            +T16.devolucionISR+T16.reintegros, -- Total ingresos
            ((T0.salarioBase/T18.diasPeriodo*T16.diasTrabajados)+T16.comisionesVentas+T16.comisionesCongeladores
            +T16.importeHorasSimples+T16.importeHorasDobles)*0.0483, -- IGSSlaboral,

            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS ISRañoAnterior,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS ISRactual,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS anticipoSalario,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS prestamoGYT,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS prestamoBantrab,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS uniformes,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS descuentoInventarios,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS embargos,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS boletoOrnato,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS tarjetaSalud,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS bazares,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS ventaProducto,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS otrosDescuentos,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS nombreDescuento,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS totalDescuentos,
            (SELECT CASE
                WHEN T17.hasta >= '$periodo' THEN T17.cuotaQuincenal
                ELSE 0
            END) AS totalEgresos,
            0 --  liquidoPagar
        FROM empleados T0
        INNER JOIN costo1s T1 ON T0.costo1s_id = T1.id
        INNER JOIN costo2s T2 ON T0.costo2s_id = T2.id
        INNER JOIN costo3s T3 ON T0.costo3s_id = T3.id
        INNER JOIN costo4s T4 ON T0.costo4s_id = T4.id
        INNER JOIN estados T5 ON T0.estados_id = T5.id
        INNER JOIN jefes T6 ON T0.jefes_id = T6.id
        INNER JOIN puestos T7 ON T0.puestos_id = T7.id
        INNER JOIN zonas T8 ON T0.zonas_id = T8.id
        INNER JOIN nacionalidades T9 ON T0.nacionalidades_id = T9.id
        INNER JOIN municipios T10 ON T0.municipios_id = T10.id
        INNER JOIN departamentos T11 ON T0.departamentos_id = T11.id
        INNER JOIN establecimientos T12 ON T0.establecimientos_id = T12.id
        INNER JOIN ocupaciones T13 ON T0.ocupaciones_id = T13.id
        INNER JOIN idiomas T14 ON T0.idiomas_id = T14.id
        INNER JOIN estudios T15 ON T0.estudios_id = T15.id
        INNER JOIN sueldos T16 ON T0.id = T16.empleados_id
        INNER JOIN descuentos T17 ON T0.id = T17.empleados_id
        INNER JOIN periodos T18 ON T16.periodos_id = T18.id

        
        WHERE 
        T18.periodo = '$periodo' AND 
        T0.estado1 = 'ALTA'";

        // Muestra la consulta SQL en pantalla
       // echo "<h2>Consulta SQL:</h2>";
        //echo "<pre>" . htmlentities($sql) . "</pre>";


        if ($conn->query($sql) === TRUE) {
            echo "Datos insertados con éxito.";
        
            // Ahora, vamos a mostrar los resultados de la consulta SQL
            // Definir la consulta SQL para seleccionar los datos recién insertados
            $sql_select = "SELECT * FROM nominas WHERE periodo = '$periodo'";
        
            // Ejecutar la consulta SQL
            $result = $conn->query($sql_select);
        
            if ($result->num_rows > 0) {
                // Imprimir una tabla HTML para mostrar los resultados
                echo "<h2>Resultados de la Consulta:</h2>";
                echo "<table class='table table-bordered' style='table-layout: auto;'>
                        <thead>
                            <tr>
                            <th style='white-space: nowrap; overflow: hidden;'>ID</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Período</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Costo 1</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Costo 2</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Costo 3</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Costo 4</th>
                            <th style='white-space: nowrap; overflow: hidden;'>A Prueba</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre Jefe</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre Región</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre Costo</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Código Trabajador</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre 1</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre 2</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre 3</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Apellido 1</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Apellido 2</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre Puesto 1</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre Puesto 2</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Tipo de Pago</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Banco</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Grupo de Cuenta</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Días Trabajados</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Días de Ausencia</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Horas Parciales</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Fecha de Baja</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Estado</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Base Mensual</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Base Quincenal</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Base Semanal</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Base de Comisiones</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Comisiones de Ventas</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Cantidad de Congeladores</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Comisiones de Congeladores</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Comisiones</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total Ordinario</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Cantidad de Horas Simples</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Importe de Horas Simples</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Cantidad de Horas Dobles</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Importe de Horas Dobles</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Horas Extras</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Vacaciones</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Afecto al IGSS</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Bono Ley</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Bono Congeladores</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Bono Cumplimiento</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Bono Retornos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Otros Bonos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre del Bono</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Bonificaciones</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Devolución de ISR</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Reintegros</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Ingresos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>IGSS Laboral</th>
                            <th style='white-space: nowrap; overflow: hidden;'>ISR Año Anterior</th>
                            <th style='white-space: nowrap; overflow: hidden;'>ISR Actual</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Anticipo de Salario</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Prestamo GYT</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Prestamo Bantrab</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Uniformes</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Descuento de Inventarios</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Embargos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Boleto de Ornato</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Tarjeta de Salud</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Bazares</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Venta de Producto</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Otros Descuentos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Nombre del Descuento</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Descuentos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Total de Egresos</th>
                            <th style='white-space: nowrap; overflow: hidden;'>Líquido a Pagar</th>
                            </tr>
                        </thead>
                        <tbody>";
        
                // Iterar a través de los resultados y mostrar cada fila
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["id"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["periodo"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["costo1"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["costo2"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["costo3"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["costo4"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["aPrueba"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombreJefe"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombreRegion"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombreCosto"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["codigoTrabajador"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombre1"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombre2"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombre3"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["apellido1"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["apellido2"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombrePuesto1"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombrePuesto2"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["tipoPago"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["banco"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["grupoCuenta"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["diasTrabajados"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["diasAusencia"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["horasParciales"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["fechaBaja"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["estado1"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["baseMensual"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["baseQuincenal"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["baseSemanal"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["baseComisiones"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["comisionesVentas"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["cantidadCongeladores"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["comisionesCongeladores"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalComisiones"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalOrdinario"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["cantidadHorasSimples"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["importeHorasSimples"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["cantidadHorasDobles"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["importeHorasDobles"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalHorasExtras"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["vacaciones"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["afectoIGSS"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["bonoLey"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["bonoCongeladores"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["bonoCumplimiento"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["bonoRetornos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["otrosBonos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombreBono"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalBonificaciones"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["devolucionISR"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["Reintegros"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalIngresos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["IGSSlaboral"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["ISRañoAnterior"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["ISRactual"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["anticipoSalario"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["prestamoGYT"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["prestamoBantrab"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["uniformes"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["descuentoInventarios"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["embargos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["boletoOrnato"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["tarjetaSalud"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["bazares"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["ventaProducto"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["otrosDescuentos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["nombreDescuento"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalDescuentos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["totalEgresos"] . "</td>
                            <td style='white-space: nowrap; overflow: hidden;'>" . $row["liquidoPagar"] . "</td>
                        </tr>";
                }
        
                echo "</tbody></table>";
            } else {
                echo "No se encontraron resultados.";
            }
        } else {
            echo "Error al insertar datos: " . $conn->error;
        }

    // Cerrar la conexión
    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generar Nómina</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <form method="POST" action="pagos.php" class="card-body">
                        <div class="card-header bg-primary text-white text-center">
                            <h2>Generar Nómina</h2>
                        </div>
                        <div class="form-group row">
                            <label for="periodo" class="col-sm-3 col-form-label">Periodos:</label>
                            <div class="col-sm-9">
                            <select class="form-control" id="periodo" name="periodo">
                                <option value="">Selecciona un periodo</option>
                                <?php
                                $queryPeriodos = "SELECT id, periodo FROM periodos";
                                $resultPeriodos = mysqli_query($conn, $queryPeriodos);

                                while ($row = mysqli_fetch_assoc($resultPeriodos)) {
                                    echo '<option value="' . $row['periodo'] . '">' . $row['periodo'] . '</option>';
                                }

                                // Cierra la conexión a la base de datos
                                mysqli_close($conn);
                                ?>
                            </select>


                                <div class="invalid-feedback">Este campo es obligatorio.</div>
                            </div>
                        </div>
                        <!-- Otros campos de entrada aquí si es necesario -->

                        <div class="text-center">
                            <input type="hidden" name="generar_nomina" value="1">
                            <button type="submit" class="btn btn-primary">Generar Nómina</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
