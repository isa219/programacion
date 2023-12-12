--- No lleva paréntesis. La manera de terminar la condición es THEN en los IF, luego empezó a desaparecer.
--- Yo recibo un total, si el total es mayor o igual de mil, utilizo nueva_categoría = 1. La instrucción SET es para dar valor a una variable. ELSE, sin condiciones. SET nueva_categoria = 2.
--- Podría hacer un SELECT para mostrarlo, SELECT nueva_categoria y a continuación actualizo la categoría del cliente con un UPDATE.

-- Cliente en función de la cantidad total de la compra.

-- Si la cantidad total de la compra es mayor o igual a 1000, la categoría se establecerá en 1; de lo contrario, se establecerá en 2.

DELIMITER //

CREATE PROCEDURE ActualizarCategoriaCliente(IN cliente_id INT, IN total_compra float)
BEGIN
	DECLARE nueva_categoria INT;
	
	IF total_compra >= 1000 THEN
		SET nueva_categoria = 1;
	ELSE
		SET nueva_categoria = 2;
	END IF;
	
	select nueva_categoria;
	
	UPDATE cliente
	SET categoría = nueva_categoria
	WHERE id = cliente_id;
END //
DELIMITER ;

CALL ActualizarCategoriaCliente(1,1200);
select * from cliente;