--Entonces, he añadido otro campo que va a tener 2 valores, si tiene crédito o no, es otro ALTER TABLE.
--Vamos a hacer le siguiente trigger: Después de actualizar la tabla cliente, voy a cambiar el estado del crédito de un cliente, de un estado pendiente a aprobado si el total de compras es superior a 5000 de manera que el estado pasara a aprobado si el señor se gasta más de 5000 euros.
--La primera parte es un TRUE y la otra un FALSE. Lo copio... Hago un UPDATE que me actualice el ID 1.

--Voy a guardar aprobado o pendiente dependiendo del IF y se guardar en una variable arriba. 
--Muéstrame el SUM si es mayor de 5000 pones aprobado o pendiente, de manera que en ‘nuevo_estado’ tendré aprobado o pendiente.
--Al actualizar el nuevo estado ya puedo hacer el UPDATE. El nuevo estado es del ID que se está calculando o haciendo en el nuevo ID cliente. Esto se probaría haciendo un UPDATE de la tabla pedido.


--UPDATE pedido SET total=5000 WHERE id =1; lo que queráis, 1.




-- Este trigger debe ejecutarse automátiucamente después de actualizar un rewgistro en la tabla cliente. Su función es verificar si el campo total_compras del clioente ha superado un límite predefinido (por ejemplo, 5000).
--Si es aí, debe actualizar el campo estado_credito del cliente a "Aprobado"; de lo contrario, debe estalbecerlo como "Pendiente".

ALTER TABLE cliente
ADD COLUMN estado_credito VARCHAR(20) DEFAULT 'Pendiente';

DELIMITER //
CREATE TRIGGER actualizarClienteDespuesPedido
AFTER UPDATE
ON pedido FOR EACH ROW
BEGIN
	-- Verificar el estado de crédito del cliente(aprobado/pendiente)
	SET nuevo_estado_credito = (
		SELECT IF(SUM(p.total) > 5000, 'Aprobado', 'Pendiente')
		FROM pedido
		WHERE p.id_cliente = NEW.id_cliente
	);
	
	-- Actualizar el estado_credito del cliente
	UPDATE cliente
	SET estado_credito = nuevo_estado_credito
	WHERE cliente.id = NEW.id_cliente;
END //
DELIMITER ;

update pedido
set total=5000 WHERE id=1;