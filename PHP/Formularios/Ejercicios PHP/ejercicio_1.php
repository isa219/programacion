<?php
//recoger el valor
$num= trim(strip_tags($_REQUEST['pesetas']));
if (is_numeric($num))
{
	echo $num , " euros son ", round($num * 166.386), " pesetas.";
}
else { echo "No es un número"; }
?>