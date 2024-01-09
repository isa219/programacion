alter table cliente ADD COLUMN total_compras FLOAT DEFAULT 0.0;

--Después de eliminar una fila de la tabla, un registro, en total de compras ir acumulando los pedidos.
--Por cada pedido que borro de la tabla pedidos, como si el cliente lo recibiera y le sumo en total de compras.
--El pedido es algo intermedio, como si aún no lo ha pagado, si lo borro, al cliente le sumare su compra.


--¿Se puede hacer BEFORE DELETE? no, no hay ningún cambio.
--Después de borrar actualiza cliente donde total de compras es la suma del total de los pedidos, de manera que el pedido sea igual que el cliente.
--OLD, aquí igual tenemos que sacar el cliente... este OLD, que significa, el cliente que estaba antes de borrarlo.
--Solo se actualizará ese cliente.


--Borrara el 18 del cliente 1 y el cliente 1 no tiene nada.
--Hago un DELETE del pedido que queramos borrar, el 18.
--Se ha borrado y automáticamente se ha tenido que crear el triger. Automáticamente se generó el total de compras de ese cliente.
--Podríamos haber hecho que en lugar de... para que vierais como hacerlo con una función.



DEKUNUTER //
CREATE TRIGGER actualizarTotalComprasCliente
AFTER DELETE
ON ventas.pedido FOR EACH ROW
BEGIN
	--- Actualizar el total de compras del cliente
	UPDATE cliente
	SET total_compras = (
		SELECT SUM(total)
		FROM pedido
		WHERE pedido.id_cliente = cliente.id
	)
	WHERE cliente.id = OLD.id_cliente;
END //
DELIMITER ;


SELECT id, total_compras FROM cliente WHERE id = 1;
--Anotar el valor del campo total_compras para comprarlo después.
--Ahora, puedes eliminar un pedido de la tabla pedido. Usa el siguiente comando como ejemplo:
DELETE FROM pedido WHERE id = <id_pedido>;
--Este comando eliminará un pedido y actuvará el trigger actualizarTotalComprasCliente.
--Vuelve a realizar la consulta para verificar el total de compras del cliente después de eliminar el pedido. Compara este valor con el que anotastes antes de la prueba.