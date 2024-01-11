<?php
//recoger el valor
$base= trim(strip_tags($_REQUEST['base']));
$altura= trim(strip_tags($_REQUEST['altura']));
$resultado=($base*$altura)/2;
print "El area del triangulo es: ".$resultado;
?>