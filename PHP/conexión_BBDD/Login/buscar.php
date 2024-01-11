		<h1>buscar usuario</h1>
		<?php
			$nombre= $_REQUEST["txtusuario"];
			//conectar con el servidor de base de datos
			$conexion = mysqli_connect ("localhost", "root", "css99") or die ("No se puede conectar con el servidor");
			//seleccionar base de datos
			mysqli_select_db ($conexion,"login") or die ("No se puede seleccionar la base de datos");
			
			$query="Select * from usuarios where nombre='$nombre'";
			//echo $query."<br>"	; //Para comprobar errores de mysqli_connect
			
			$consulta = mysqli_query ($conexion,$query) or die ("Fallo en la consulta");
			//Mostrar resultados en la consulta
			$nfilas = mysqli_num_rows ($consulta); //devuelve el número de filas
			if ($nfilas ==1)
			{
				echo "Error no existe ese usuario";
			}
			else
			{
				$resultado = mysqli_fetch_array ($consulta);
				echo "Usuario Correcto<br>";
				echo "id:".$resultado['id_usuario'];
				echo "Usuario:".$resultado['nombre'];
				echo "Contraseña:".$resultado['password']."<br>";
			}
			//cerrar
			mysqli_close ($conexion);
		?>