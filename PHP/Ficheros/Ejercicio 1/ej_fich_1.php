<?php

$nombreArchivo = "clase2.txt";
$mensaje=" pasado es domingo";

//abrir un fichero
$archivo = fopen($nombreArchivo, "a"); // w - write a-append
//echo $archivo;
fwrite($archivo, $mensaje);

fclose($archivo); // cierra el fichero.

?>