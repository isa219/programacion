<?php
/*Leer archivo de texto con PHP*/
$nombre_archivo = "nombres.txt";
$num_lineas = 0;
$caracteres = 0;
$fd = fopen($nombre_archivo, "r"); # Modo r, read
echo "El número de lineas del fichero es: <br>";

while (!feof($fd)){
	$lectura = fgets($fd); //lee del fichero una línea
	//echo $lectura."<br>"
	$num_lineas++;
	$caracteres = $caracteres + strlen($lectura);
}
echo $lineas;

// No olvides cerrar el fich
fclose($fd);
echo "Líneas: " . $num_lineas;
echo "Caracteres " . $caracteres;

?>