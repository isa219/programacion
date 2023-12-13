--- Esta variable está en el fichero de configuración. Cuando arranque se ponga o si no debemos poner este comando antes de ejecutar una función. Borro la función si existe.
--- DELIMITER que era, porque lo cambio, para que no se ejecute.
--- Ponemos nombre de la función y si recibe algún parámetro, nombre de parámetro. Aquí que no tiene la función, debe devolver algo, debe devolver algo. RETURNS, el tipo de dato porque devuelvo algo.
--- Estábamos haciendo que hace la función. Voy a calcular el beneficio que le doy a un cliente utilizando una variable que declaro de tipo FLOAT, y guardo el SUM de todos los pedidos entre ese pedido y ese cliente y hago el JOIN de relacionar pedido y cliente. En lugar de total se llama cantidad.
--- Beneficio es una variable. En la función se debe retornar algo. CREATE FUNCTION, el nombre, recibe un argumento, el nombre de un cliente, y retornara su beneficio, BEGIN y END cuando son varias instrucciones.
--- Declaro la variable, este SELECT ni entrara en la variable ni guardara en la variable beneficio. 
--- Las funciones no se llaman, se ejecutan, el comando de mostrar es SELECT.

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION calcularBeneficio;

DELIMITER $$
CREATE FUNCTION calcularBeneficio(nombre varchar(100))
RETURNS FLOAT
BEGIN
	DECLARE beneficio FLOAT;
		select sum(total) into beneficio from pedido,cliente
		where id_cliente = cliente.id and nombre = nombre;
	RETURN beneficio; -- retorna al programa
END$$
DELIMITER ;
SELECT calcularBeneficio("Aaron") AS beneficio;