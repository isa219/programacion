<?php
/*Leer archivo de texto con PHP*/
$nombre_archivo = "nombres.txt";
$fd = fopen($nombre_archivo, "r"); # Modo r, read
echo "Elcontenido del fichero es: <br>";

while (!feof($fd)){
	$lectura = fgets($fd); //lee del fichero una línea
	echo $lectura."<br>";
}

// No olvides cerrar el fich
fclose($fd);

?>