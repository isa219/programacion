<?php
	$ancho=trim(strip_tags($_REQUEST['ancho']));
	$alto=trim(strip_tags($_REQUEST['alto']));
	if ($ancho > 0 && $ancho <= 100) {
		if ($alto > 0 && $alto <= 100) {
			echo "Ancho es igual a: "."$ancho<br>";
			echo "Alto es igual a: "."$alto<br><br>";
			for ($x=0;$x<$alto;$x++){
				for ($i=0;$i<$ancho;$i++){
				echo "*";
			}
			print "<br>";
			}
		} else {
			echo "Valor de 'alto' incorrecto.";
		}
	} else {
		echo "Valor de 'ancho' incorrecto.";
	}
?>