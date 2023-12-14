<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname = "Pisos";

// Crear conexión
$conn = mysqli_connect($servername, $username, $password, $dbname)
or  die("Conexión fallida: " . mysqli_connect_error());
}

// Recuperar el ID del formulario
$id = $_POST['id'];

// Preparar y ejecutar la consulta de eliminación
$sql = "DELETE FROM noticias WHERE id = '$id'";

if (mysqli_query($conn, $sql)) {
    echo "Piso eliminado con éxito.";
} else {
    echo "Error al eliminar Piso: " . mysqli_error($conn);
}

// Cerrar la conexión
mysqli_close($conn);
?>


?>