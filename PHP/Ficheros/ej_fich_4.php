<body>
<?php
 $numero=$_REQUEST['numero'];
 //hacer las comprobaciones
 $fichero="numeros.txt";
 $cont=0;
 $fd = fopen($fichero, "r"); #Modo r, read
 while (!feof($fd)){ //lee del fichero una linea
	$linea = fgets($fd); //lee del fichero una linea
	if (intval($linea) == intval($numero)) { //funcion intval--convierte a int
	 $cont++;
	}
 }
 print "El numero $numero aparece $cont veces en el fichero $fichero\n"
?>
</body>
</html>