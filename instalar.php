
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Empleados y Nóminas Online</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        /* Agregar reglas de estilo personalizadas */
        .subtitulo {
            font-size: 24px;
            background-color: #cde7f0; /* Color celeste suave */
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header bg-primary text-white text-center">
                    <h2>Primera Instalación: Sistema GTN Nóminas y Empleados</h2>
                </div>
                <div class="card-body">
                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                        <!-- Subtítulo con fuente más pequeña, fondo celeste suave y texto en minúsculas -->
                        <div class="subtitulo">
                            Crear base de datos:
                        </div>
                        <div class="form-group">
                            <label>Escriba el servidor:</label>
                            <input type="text" class="form-control" name="host" value="localhost">
                        </div>
                        <div class="form-group">
                            <label>Escriba el usuario root:</label>
                            <input type="text" class="form-control" name="user" value="root">
                        </div>
                        <div class="form-group">
                            <label>Escriba la contraseña root:</label>
                            <input type="password" class="form-control" name="pass" value="123456">
                        </div>
                        <div class="form-group">
                            <label>Nombre de la BBDD:</label>
                            <input type="text" class="form-control" name="bbdd" value="snoi">
                        </div>
                        <!-- Resto del formulario -->
						<!-- Botón para crear BBDD -->
						<a href="nuevobd.php" class="btn btn-primary">Crear</a>

                        <!-- Subtítulo con fuente más pequeña, fondo celeste suave y texto en minúsculas -->
                        <div class="subtitulo">
                            Crear usuario administrador:
                        </div>
                        <div class="form-group">
                            <label>Nombre de usuario:</label>
                            <input type="text" class="form-control" name="useradmin" value="admin">
                        </div>
                        <div class="form-group">
                            <label>Contraseña:</label>
                            <input type="password" class="form-control" name="passadmin" value="admin">
                        </div>
                        <!-- Resto del formulario -->
						<!-- Botón para crear BBDD -->
						<a href="nuevobd.php" class="btn btn-primary">Crear</a>

                        <!-- Subtítulo con fuente más pequeña, fondo celeste suave y texto en minúsculas -->
                        <div class="subtitulo">
                            Crear empresa:
                        </div>
                        <div class="form-group">
                            <label>Nombre de la empresa:</label>
                            <input type="text" class="form-control" name="nombreemp" value="IXCO, S.A.">
                        </div>
                        <div class="form-group">
                            <label>NIT de la empresa:</label>
                            <input type="text" class="form-control" name="cifemp" value="60603030">
                        </div>
						<div class="form-group">
                            <label>Dirección de la empresa:</label>
                            <input type="text" class="form-control" name="cifemp" value="6av 8calle zona 1 Palacio Nacional, Guatemala, Guatemala.">
                        </div>
                        <!-- Resto del formulario -->
						<!-- Botón para crear BBDD -->
						<a href="nuevobd.php" class="btn btn-primary">Crear</a>

						<!-- Subtítulo con fuente más pequeña, fondo celeste suave y texto en minúsculas -->
                        <div class="subtitulo">
                            Version de PHP instalada:
                        </div>
						<?php
						$version = phpversion();
						if ($version) {
							echo('<div class="subtitulo">' . $version . '</div>');
						} else {
							echo('<div class="subtitulo">No se encuentra instalado PHP en tu servidor </div>');
							exit;
						}
						?>
                        <!-- Resto del formulario -->
						<!-- Botón para crear BBDD -->

                        <input type="submit" class="btn btn-primary" name="botoninst" value="INSTALAR">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
