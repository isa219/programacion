<?php
	$nombre = trim(strip_tags($_POST['nombre']));
	$trabajo = trim(strip_tags($_POST['trabajo']));
	$telefono = trim(strip_tags($_POST['telefono']));
	$direccion = trim(strip_tags($_POST['direccion']));
	$otras = trim(strip_tags($_POST['otras']));
	$guardar = trim(strip_tags($_POST['guardar']));
	$mostrar = trim(strip_tags($_POST['mostrar']));
	$buscador = trim(strip_tags($_POST['buscador']));
	$buscar = trim(strip_tags($_POST['buscar']));
	$archivo = 'correos.txt';
	
	if ($guardar == "Guardar!") {
		if ($nombre == "") {
			echo "No has escrito un nombre, escríbelo.";
		} elseif ($telefono == "") {
			echo "No has escrito un número de teléfono, escríbelo.";
		} elseif (strlen($telefono) != 9) {
			echo "El número de telefono debe tener 9 caracteres exactos.";
		} else {
			if (!file_exists($archivo)) {
				fopen($archivo, 'w');
			}
			$file = fopen($archivo, 'a');
			fwrite($file, "Nombre: $nombre - Trabajo: $trabajo - Teléfono: $telefono - Dirección: $direccion - Otras: $otras" . PHP_EOL);
			fclose($file);
		}
	} elseif ($mostrar == "Mostrar") {
		$file = fopen($archivo, "r");
		while (!feof($file)){
			$lectura = fgets($file);
			echo $lectura."<br>";
		}
		fclose($file);
	} elseif ($buscar == "Buscar") {
		if ($buscador == "") {
			echo "El buscador esta vacio, escriba algo.";
		} else {
			$file = fopen($archivo, "r");
			while (!feof($file)) {
				$lectura = fgets($file);
				$resultado = strpos($lectura, "Nombre: $buscador");
				if ($resultado !== false) {
					echo "$lectura<br>";
				}
			}
		}
	}
?>
