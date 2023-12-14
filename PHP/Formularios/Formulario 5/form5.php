
<?php
//print "<pre>"; print_r($_REQUEST); print "</pre>\n";

if (isset($_REQUEST["nombre"] )) {
	$nombre = trim(strip_tags($_REQUEST["nombre"]));
} else {
	$nombre = "";
}
if ($nombre == "") {
	print "<p>No ha escrito ningún nombre</p>\n";
} else {
	print "<p>Su nombre es $nombre</p>\n";
	
}
?>