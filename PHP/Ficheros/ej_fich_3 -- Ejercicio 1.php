<?php
/*Leer archivo de texto con PHP*/
$nombre_archivo = "nombres.txt";
$fd = fopen($nombre_archivo, "r"); # Modo r, read
$lineas=0;
echo "El número de lineas del fichero es: <br>";

while (!feof($fd)){
	$lectura = fgets($fd); //lee del fichero una línea
	$lineas=$lineas+1;
}
echo $lineas;

// No olvides cerrar el fich
fclose($fd);

?>