<?php
//recoger el valor
$num= trim(strip_tags($_REQUEST['num']));

if (is_numeric($num)) {
	$cuadrado=$num*$num;
	echo "el cuadrado es $cuadrado";
}
else { echo "No es un número"; }

?>