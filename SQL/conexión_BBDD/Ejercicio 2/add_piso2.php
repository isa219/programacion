Esto también se hace a veces. Poner en variables los valores del servidor y luego el nombre de la base de datos y luego ponerlo aquí con variables y se pueden poner a parte con un include.
El ‘USE’ de la base de datos si se pone, el nombre del servidor todo seguido.
¿Qué me falta aquí? El ‘OR DIE’. Lo ponemos aquí.
¿Como recuperamos los valores? así o con ‘$_REQUEST’ y luego ponemos el ‘INSERT’.
Lo metemos en una variable y ejecutamos con ‘mysqli_query’ la ejecución del programa
Si lo hacéis con un ‘IF’, este ‘IF’ ejecuta la conexión y devuelve ‘TRUE’, y si no, error al insertar el piso.
Una función interesante, ‘mysqli_error’. Probarla, os devolverá el error de la conexión MYSQL.

<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname = "Pisos";

// Crear conexión
$conn = mysqli_connect($servername, $username, $password, $dbname)
or die("Conexión fallida: " . mysqli_connect_error());
}
// Recuperar datos del formulario

$titulo = $_POST['titulo'];
$texto = $_POST['texto'];
$categoria = $_POST['categoria'];
$fecha = $_POST['fecha'];
$imagen = $_POST['imagen'];

// Preparar y ejecutar la consulta de inserción
$sql = "INSERT INTO noticias (titulo, texto, categoria, fecha, imagen) VALUES ('$titulo', '$categoria', '$fecha', 'imagen')";

if (mysqli_query($conn, $sql)) {
	echo "Noticia insertada con éxito.";
} else {
	echo "Error al insertar noticia:" . mysqli_error($conn);
}

// Cerrar la conexión
mysqli_close($conn);
add_piso2.php
?>