<?php
	//Obtener los datos del formulario
	$nombre = $_POST['nombre'];
	$email = $_POST['email'];
	//control de errores
	// Comprobar que el archivo existe o crearlo si no existe
	$archivo = 'correos.txt';
	if (!file_exists($archivo)) {
		fopen($archivo, 'w'); // crea el archivo vacio
	}
	// Abrir el archivo en modo escritura y agregar los datos
	$file = fopen($archivo, 'a');
	fwrite($file, "Nombre: $nombre - Correo: $email" . PHP_EOL);
	fclose($file);
	
	
	
?>