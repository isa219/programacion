<?php
print "<pre>"; print_r($_REQUEST); print "</pre>\n";

if ($_REQUEST["nombre"] == "") {
	print "<p>No has escrito ningún nombre</p>";
} else {
	print "<p>Su nombre es $_REQUEST[nombre]</p>\n";
	echo "longitud de la clave ".strlen($_REQUEST["pass"]);
}
?>