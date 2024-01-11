<?php
echo "<h1>Lista de correos electronicos</h1>";
$nombre_archivo = "correos.txt";
$fichero_abierto = fopen($nombre_archivo, "r");
while (!feof($fichero_abierto)){
	$lectura = fgets($fichero_abierto);
	echo $lectura."<br>";
}
?>