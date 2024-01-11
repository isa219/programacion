<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname = "Pisos";

// Crear conexión
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Verificar la conexión
if (!$conn) {
    die("Conexión fallida: " . mysqli_connect_error());
}
// Recuperar datos del formulario
$id=$_POST['id'];
$titulo =  $_POST['titulo'];
$texto =  $_POST['texto'];
$categoria = $_POST['categoria'];
$fecha = $_POST['fecha'];
$imagen = $_POST['imagen'];

// Preparar y ejecutar la consulta de inserción
$sql = "UPDATE noticias SET titulo='$titulo', texto='$texto', categoria='$categoria', fecha='$fecha', imagen='$imagen' WHERE id='$id'";


if (mysqli_query($conn, $sql)) {
    echo "Piso actualizado con éxito.";
} else {
    echo "Error al actualizar: " . mysqli_error($conn);
}

// Cerrar la conexión
mysqli_close($conn);
?>