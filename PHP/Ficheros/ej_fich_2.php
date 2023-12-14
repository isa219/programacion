<?php
$nombreArchivo = "nombres.txt";
$archivo = fopen($nombreArchivo,"w");
echo $archivo;
$nombres = array (
"Luis","Maria","Carlos","Paco","Lucia"
);
for ($i=0;$i<=count($nombres);$i++)
{
	fwrite($archivo, $nombres[$i] . PHP_EOL);//End of Line
}
//foreach ($nombres as $n) {
//	fwrite($archivo, $n . PHP_AEOL);
//}
fclose($archivo);
echo "fichero creado...";
?>