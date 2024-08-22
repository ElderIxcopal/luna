<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boleta de Pago</title>
    <!-- Incluye tus archivos locales de Bootstrap desde las rutas correctas -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <style>
        /* Estilo personalizado para la línea continua */
        .signature-line {
            width: 80%;
            margin: 0 auto;
            border: 2px solid #000; /* Color y grosor de la línea */
        }
        /* Estilo para el borde exterior */
        .outer-border {
            border: 4px solid #000; /* Color y grosor del borde exterior */
            padding: 20px; /* Espacio dentro del borde exterior */
        }
        /* Estilo para el card de "Total a Pagar" */
        .total-card {
            border: 2px solid #000; /* Borde del card de "Total a Pagar" */
            padding: 3px; /* Espacio dentro del card */
            width: 100%; /* Ocupar todo el ancho de la página */
        }
    </style>
</head>
<body>
    <div class="container mt-5 outer-border">
        <div class="row">
            <div class="col-md-6">
                <div class="card d-flex flex-fill">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Ingresos</h2>
                    </div>
                    <div class="card-body" style="max-height: 300px; overflow-y: auto;">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Sueldo Ordinario</td>
                                    <td>2,500.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Sueldo Extraordinario</td>
                                    <td>1,000.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Comisiones sobre Ventas</td>
                                    <td>2,500.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Bonificaciones Legales</td>
                                    <td>1,200.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Bonificaciones Incentivos</td>
                                    <td>800.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Viáticos</td>
                                    <td>500.00 Q.</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card d-flex flex-fill">
                    <div class="card-header bg-danger text-white text-center">
                        <h2>Egresos</h2>
                    </div>
                    <div class="card-body" style="max-height: 300px; overflow-y: auto;">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Descuentos IGSS</td>
                                    <td>500.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Retenciones IVA</td>
                                    <td>200.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Retenciones ISR</td>
                                    <td>1,000.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Descuentos por Compras</td>
                                    <td>300.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Anticipos sobre Sueldos</td>
                                    <td>400.00 Q.</td>
                                </tr>
                                <tr>
                                    <td>Anticipos sobre Sueldos</td>
                                    <td>400.00 Q.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card total-card">
                    <div class="card-body text-center">
                        <p>Total a Pagar: <strong>7,800.00 Q.</strong></p>
                        <p>Nombre del Empleado: <strong>Juan Pérez</strong></p>
                        <p>&nbsp;</p>
                        <hr class="signature-line">
                        <p>Firma de Recibido</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
