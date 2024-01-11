<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname = "Pisos";

// Crear conexión
$conn = mysqli_connect($servername, $username, $password, $dbname)
or  die("Conexión fallida: " . mysqli_connect_error());

// Recuperar el ID del formulario
$id = $_POST['id'];

$sql = "SELECT * FROM noticias WHERE id = '$id'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
?>
      
    <form action="actualizar_piso3.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
        
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" value="<?php echo $row['titulo']; ?>" required><br>
        
        <label for="texto">Texto:</label>
        <textarea name="texto" required><?php echo $row['texto']; ?></textarea><br>
        
        <label for="categoria">Categoría:</label>
        <select name="categoria">
            <option value="promociones" <?php if ($row['categoria'] == 'promociones') echo 'selected'; ?> >Promociones</option>
            <option value="ofertas" <?php if ($row['categoria'] == 'ofertas') echo 'selected'; ?> >Ofertas</option>
            <option value="costas" <?php if ($row['categoria'] == 'costas') echo 'selected'; ?> >Costas</option>
        </select><br>
        
        <label for="fecha">Fecha:</label>
        <input type="date" name="fecha" value="<?php echo $row['fecha']; ?>" required><br>
        
        <label for="imagen">Imagen:</label>
        <input type="text" name="imagen"><br>
        
        <input type="submit" value="Actualizar">
    </form>

</body>
</html>

<?php
} else {
    echo "No se encontró la noticia.";
}

// Cerrar la conexión
mysqli_close($conn);
?>