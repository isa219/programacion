<?php
$buscador=$_REQUEST['buscador'];
$nombre_archivo = "correos.txt";
$fichero_abierto = fopen($nombre_archivo, "r");
while (!feof($fichero_abierto)) {
	$lectura = fgets($fichero_abierto);
	if (strstr($lectura,$buscador) != false) {
		echo "$lectura<br>";
	}
}
?>