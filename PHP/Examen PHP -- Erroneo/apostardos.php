<?php
$madrid = trim(strip_tags($_POST['madrid']));
$barcelona = trim(strip_tags($_POST['barcelona']));
$archivo = "porra.txt";
$file = fopen($archivo, 'a');
		fwrite($file, "$madrid" . PHP_EOL);
		fwrite($file, "$barcelona" . PHP_EOL);
		fwrite($file, "usuario" . PHP_EOL);
		fclose($file);

?>