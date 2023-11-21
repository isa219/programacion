<html>
<head>
</head>
<body>
<?php
print "<hr>";
print "<h1>Jugador 1</h1>";
for ($i=1;$i<=5;$i++) {
	$dadouno=rand(1,6);
	echo "<img src='img/$dadouno.jpg'>";
	$resultadouno=$resultadouno+$dadouno;
	
}
print "<h1>Jugador 2</h1>";
for ($i=1;$i<=5;$i++) {
	$dadodos=rand(1,6);
	echo "<img src='img/$dadodos.jpg'>";
	$resultadodos=$resultadodos+$dadodos;
	
}
if ($resultadouno>$resultadodos) {
	$ganador="1";
	print "<h1>Resultado</h1>";
	print "<br>";
	echo "En conjunto, ha ganado el jugador "."$ganador";
} elseif ($resultadouno<$resultadodos) {
	$ganador="2";
	print "<h1>Resultado</h1>";
	print "<br>";
	echo "En conjunto, ha ganado el jugador "."$ganador";
} else {
	print "<h1>Resultado</h1>";
	print "<br>";
	echo "Han ganado el jugador 1 y 2";
}



?>
</body>
</html>