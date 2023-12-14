<?php
//recoger el valor
$num1= trim(strip_tags($_REQUEST['numero1']));
$num2= trim(strip_tags($_REQUEST['numero2']));
$suma=$num1+$num2;
$resta=$num1-$num2;
$mul=$num1*$num2;
$div=$num1/$num2;
print "La suma es: ".$suma."<br>";
print "La resta es: ".$resta."<br>";
print "La multiplicación es: ".$mul."<br>";
print "La división: ".$div."<br>";
?>