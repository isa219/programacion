<HTML LANG="es">
<HEAD>
</HEAD>
<BODY>
<H1>Consulta de noticias</H1>

<?PHP

   // Conectar con el servidor de base de datos
      $conexion = mysqli_connect ("localhost", "root", "rootroot")
	      or die ("No se puede conectar con el servidor");
   // Seleccionar base de datos : Use
      mysqli_select_db ($conexion,"pisos")
         or die ("No se puede seleccionar la base de datos");
   // Enviar consulta
      $instruccion = "select * from noticias";
      $consulta = mysqli_query ($conexion,$instruccion)
         or die ("Fallo en la consulta");
   // Mostrar resultados de la consulta
      $nfilas = mysqli_num_rows ($consulta);
	  echo $nfilas."<br>";
      if ($nfilas > 0)
      {
         print ("<TABLE border=1>\n");
         print ("<TR>\n");
         print ("<TH>Titulo</TH>\n");
         print ("<TH>Texto</TH>\n");
         print ("<TH>Categoria</TH>\n");
         print ("<TH>Fecha</TH>\n");
        
         print ("</TR>\n");
		 for ($i=0; $i<$nfilas; $i++)
         {
            $resultado = mysqli_fetch_array ($consulta);
            print ("<TR>\n");
            print ("<TD>" . $resultado[0] . "</TD>\n");
			print ("<TD>" . $resultado[1] . "</TD>\n");
            print ("<TD>" . $resultado['texto'] . "</TD>\n");
            print ("<TD>" . $resultado['categoria'] . "</TD>\n");
            print ("<TD>" . $resultado['fecha'] . "</TD>\n");

            
            print ("</TR>\n");
         }
        

         print ("</TABLE>\n");
      }
      else
         print ("No hay noticias disponibles");

// Cerrar 
mysqli_close ($conexion);

?>

</BODY>
</HTML>
