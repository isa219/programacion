<?php
$nombre_f = "datos.txt";
$fichero = fopen($nombre_f, "r");
while (!feof($fichero)){
	$lectura = fgets($fichero);
	echo $lectura."<br>";
}
fclose($fd);
?>