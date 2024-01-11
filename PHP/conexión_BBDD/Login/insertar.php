				<h1>Añadir usuario</h1>
		<?php
			$nombre= $_REQUEST["txtusuario"];//mas controles
			$pass = $_REQUEST["txtpassword"];
			
			//conectar con el servidor de base de datos
			$conexion = mysqli_connect ("localhost", "root", "css99") or die ("No se puede conectar con el servidor");
			//seleccionar base de datos
			mysqli_select_db ($conexion,"login") or die ("No se puede seleccionar la base de datos");
			
			$query="insert into usuarios(nombre,password) values ('$nombre','$pass')";
			//echo $query."<br>"	; //Para comprobar errores de mysqli_connect
			
			$consulta = mysqli_query ($conexion,$query) or die ("Fallo en la consulta");
			//Mostrar resultados en la consulta
			$nfilas = mysqli_num_rows ($consulta); //devuelve el número de filas
			if (mysqli_query($conexion,$query))
			{
				echo "Usuario Dado de alta";
			}
			else
			{
				echo "Usuario No dado de alta";
			}
			//cerrar
			mysqli_close ($conexion);
		?>