<?php
//recoger el valor
$num= trim(strip_tags($_REQUEST['num']));
$cuadrado=$num*$num;
echo "el cuadrado es $cuadrado";
?>