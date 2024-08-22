<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Empleados y Nóminas Online</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        .card-header {
            padding: 20px;
        }
        .card {
            padding: 20px;
        }
    </style>
</head>
<body>
    <?php
        require_once('login/comprobarweb.php');
        include("menu/menu.php");

        // Definir la variable $PHP_SELF
        $PHP_SELF = htmlspecialchars($_SERVER['PHP_SELF']);
    ?>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <!-- Imagen del logo en el encabezado -->
                        <img src="img/logo.png" alt="Logo" style="max-width: 200px; height: auto;">
                        <h2 class="mt-2">MOONDOS</h2>
                    </div>
                    <div class="card-body">
                        <form method="post" action="<?php echo $PHP_SELF; ?>">
                            <div class="form-group">
                                <input type="text" class="form-control" id="nombreUsuario" value="<?php echo $_SESSION['SESS_NAME']; ?>" readonly>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
