-- Haz un procedimiento almacenado que recibe un parámetro (el ID del cliente) y devuelve todos los pedidos realizados por ese cliente.
-- Lo mismo con una funcion???

drop procedure pedidos_realizados;
delimiter $$
create procedure pedidos_realizados(IN cliente_id INT)
begin
	SELECT * FROM pedido WHERE id_cliente = cliente_id;
end
$$
delimiter ;
call pedidos_realizados(1);

--La función GROUP_CONCAT se utiliza aquí para concatenar los ID de los pedidos en una cadena. Puedes ajustar el tipo de retorno y el contenido de la función según tus necesidades específica

DELIMITER //
CREATE FUNCTION ObtenerPedidosCliente(cliente_id INT) RETURNS VARCHAR(255)
begin
	DECLARE resultado VARCHAR(255);

	SELECT GROUP_CONCAT(id) INTO resultado
	FROM pedido
	WHERE id_cliente = cliente_id;
	
	RETURN resultado;
END //

DELIMITER ;
SELECT ObtenerPedidosCliente(1);