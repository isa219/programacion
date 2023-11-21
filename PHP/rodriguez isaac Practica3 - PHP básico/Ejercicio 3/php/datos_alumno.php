<?php
$nombre = trim(strip_tags($_POST['nombre']));
$telefono = trim(strip_tags($_POST['telefono']));
$matricula = trim(strip_tags($_POST['matricula']));
$op = trim(strip_tags($_POST['op']));
$mostrar = trim(strip_tags($_POST['datos']));

if ($mostrar == "Por pantalla") {
	if ($matricula == "on") {
	$matriculado="está matriculado";
} else {
	$matriculado="no está matriculado";
}

if ($nombre == "") {
	echo "No has rellenado el nombre, escribalo por favor.";
} elseif ($telefono == "") {
	echo "No has rellenado el telefono, escribalo por favor.";
} elseif (strlen($telefono) != 9) {
	echo "El número de telefono debe tener 9 caracteres exactos.";
} else {
	if ($mostrar == "Por pantalla") {
	if ($matricula == "on" && $op != "") {
		echo "El alumno $nombre, con teléfono $telefono, $matriculado en $op";
	} elseif ($matricula != "on" && $op != "") {
		echo "El alumno $nombre, con teléfono $telefono, $matriculado en $op";
	} elseif ($matricula == "on" && $op == "") {
		echo "El alumno $nombre, con teléfono $telefono, $matriculado";
	} else {
		echo "El alumno $nombre, con teléfono $telefono, $matriculado";
	}
}
}
} else {
	if ($matricula == "on") {
		$matriculado="está matriculado";
	} else {
		$matriculado="no está matriculado";
	}
	
	if ($nombre == "") {
		echo "No has rellenado el nombre, escribalo por favor.";
	} elseif ($telefono == "") {
		echo "No has rellenado el telefono, escribalo por favor.";
	} elseif (strlen($telefono) != 9) {
	echo "El número de telefono debe tener 9 caracteres exactos.";
	} else {
		if ($matricula == "on" && $op != "") {
			$mensaje = "El alumno $nombre, con teléfono $telefono, $matriculado en $op";
		} elseif ($matricula != "on" && $op != "") {
			$mensaje = "El alumno $nombre, con teléfono $telefono, $matriculado en $op";
		} elseif ($matricula == "on" && $op == "") {
			$mensaje = "El alumno $nombre, con teléfono $telefono, $matriculado";
		} else {
			$mensaje = "El alumno $nombre, con teléfono $telefono, $matriculado";
		}
	$nombre_f = "datos.txt";
	$fichero = fopen($nombre_f, "w");
	fwrite($fichero, $mensaje);
	fclose($fichero);
	echo "<a href='./mostrardatos.php'>Mostrar archivo</a>";
	}
}
?>