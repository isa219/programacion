<?php
$usuario = trim(strip_tags($_POST['usuario']));
$passwd = trim(strip_tags($_POST['passwd']));
$archivo = "porra.txt";

if ($passwd != "2asir") {
	echo "<a href='entrar.php'>Mal, vuelve a intentarlo.</a>";
} else {
	echo "PORRA ONLINE. Usuario activo: $usuario";
	echo "<table border='1'>";
	echo "<tr>";
	echo "<td>MADRID</td>";
	echo "<td>BARCELONA</td>";
	echo "<td>USUARIO</td>";
	echo "</tr>";
	$file = fopen($archivo, "r");
	while (!feof($file)) {
		$lectura = fgets($file);
		echo "<tr>";
		echo "<td>$lectura</td>";
		echo "<td>$lectura</td>";
		echo "<td>$lectura</td>";
		echo "</tr>";
	}
	echo "</table>";
	echo "SU APUESTA:<br><br>";
	echo "<form action='apostardos.php'>";
	echo "MADRID <input type='text' name='madrid'><br>";
	echo "BARCELONA <input type='text' name='barcelona'><br>";
	echo '<br><br>';
	echo "<input type='submit' value='Apostar'> <input type='reset' value='Limpiar'>";
	echo "</form>";
}
?>