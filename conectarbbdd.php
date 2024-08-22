<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = 'luna';

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}
?>
