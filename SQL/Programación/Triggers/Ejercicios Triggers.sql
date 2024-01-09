Enunciado 1: Crear Trigger antes de Insertar en la Tabla pedido


Crea un trigger llamado actualizarTotalComprasCliente en la base de datos "ventas". Este trigger debe ejecutarse automáticamente antes de insertar un nuevo registro en la tabla pedido. Su función es aumentar el campo ttoal_compras del cliente asociado al nuevo pedidop en una cantidad especifica, por ejemplo, el 5% del total de nuevo pedido.

Mio:

DELIMITER //
CREATE TRIGGER actualizarTotalComprasCliente
BEFORE INSERT
BEGIN
ON pedido FOR EACH ROW
declare porcen FLOAT
SET porcen = new.total * 0.05
UPDATE cliente SET total_compras = total_compras + porcen WHERE cliente.id = new.id_cliente;

Profesor:

--Todo esto es sintaxis, no hay que hacer nada. Declaro la variable incremento, lo podríamos haber hecho en el UPDATE pero a lo mejor los cálculos se pueden hacer de manera parcial. Para cambiar el valor de una variable se pone SET delante. Incremento será igual al nuevo total por el nuevo total y actualizar cliente sumándoselo al cliente siempre y cuando cliente sea ese cliente.

DELIMITER //
CREATE TRIGGER actualizarTotalComprasCliente
BEFORE INSERT
ON pedido FOR EACH ROW
BEGIN
	DECLARE incremento FLOAT;
	SET incremento = NEW.total * 0.05; -- Incrementar en un 5% del todo del nuevo pedido
	
	-- Actualizar el total_compras del cliente
	UPDATE cliente
	SET total_compras = total_compras + incremento
	WHERE cliente.id = NEW.id_cliente;
END //
DELIMITER ;

INSERT INTO pedido (total, id_cliente, id_comercial, fecha)
VALUES (500.00, 2, 1, NOW());

Enunciado 2: Crear Trigger Después de Eliminar en la Tabla pedido

Crea un trigger llamado ajustarTotalComprasCliente en la base de datos "ventas". Este trigger debe ejecutarse automáticamente después de eliminar un registro en la tabla pedido. Su funciób es disminuir el campo total_compras del cliente asociado al pedido eliminado en una cantidad específica, por ejemplo, el 10% del total del pedido eliminado.

--El segundo trigger es parecido al anterior, cambia el evento, es AFTER DELETE de la tabla pedido y declaro un decremento de tipo FLOAT. Calculo el decremento y actualizo. Uso DELETE, es importante.

DELIMITER //
CREATE TRIGGER ajustarTotalComprasCliente
AFTER delete
ON pedido FOR EACH ROW
BEGIN
	DECLARE decremento FLOAT;
	SET decremento = OLD.total * 0.10 -- Decrementar en un 10% del totoal del pedido eliminado
	
	-- Ajustar el total_compras del cliente
	UPDATE cliente
	SET total_compras = total_compras - decremento WHERE cliente.id = OLD.id_cliente;
END //
DELIMITER ;
--Para probarlo:
delete from pedido where id=18;