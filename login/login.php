<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso al Sistema</title>
    <!-- Utiliza tus archivos locales de Bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <form method="post" action="checklogin.php" id="login" class="card-body">
                        <div class="card-header bg-primary text-white text-center">
                            <h2>MOONDOS</h2>
                        </div>
                        <div class="form-group">
                            <label for="usuario">Nombre de Usuario:</label>
                            <input name="usuario" id="usuario" type="text" maxlength="15" class="form-control" placeholder="Nombre de Usuario" autofocus required>
                        </div>
                        <div class="form-group">
                            <label for="contrasena">Contraseña:</label>
                            <input name="contrasena" id="contrasena" type="password" maxlength="30" class="form-control" placeholder="Contraseña" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" id="submit" name="logarse" class="btn btn-primary">Entrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
