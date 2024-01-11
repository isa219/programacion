--- Como si fuera un bucle. Fijaros, ahora repaso las DECLARE, pero para declarar un cursor, o para usar un cursor hay que declararlo, con el comando DECLARE CURSOR FOR y la SELECT ira recorriendo paso a paso. Se recorrerá paso a paso, la trato siguiente fila la trato... trato fila a fila.
--- Los cursores tienen una cosa llamada HANDLER, si continua o no continua el cursor, porque lo puedo parar en su momento dado o solo. Se para cuando no hay más datos, NOT FOUND. En caso de que no haya más datos, como si se llegara a final de fichero, declaramos una variable a TRUE, la declaramos a FALSE…
--- Cambia de FALSE a TRUE o de TRUE a FALSE dependiendo de lo que yo haga. Es la misma dinámica que los ficheros. Mientras donde sea FALSE, mientras done sea FALSE FETCH cliente CURSOR INTO, léeme una línea de la SELECT que he creado aquí arriba y copia los valores en cliente nombre, cliente apellido y cliente apellido2.
--- 2 variables que declaramos arriba. aquí puedo hacer un IF, otro bucle, lo que sea, que he hecho, concatenarlo. Un CONCAT de nombre... este bucle esta mientras ‘done’.
--- Cuando cambara done a TRUE, cuando NOT FOUND, cuando llega a final de SELECT, cuando no encuentra más datos el FETCH.
--- Se cierra el cursor. Este es el cursor más sencillo, con un FETCH y 1 SELECT.
--- Declaro cursor, el manejador, abro el cursor luego se cierra y mientras por cada fila de la SELECT se necesita usar FETCH. Cursores solo funciona con SELECT, si, solo con SELECT. No puede haber aquí otro comando porque es recorrer una SELECT. Este ejercicio lo podemos hacer en la base de datos de ventas.

DELIMITER //
CREATE PROCEDURE ImprimirClientes()
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE cliente_nombre VARCHAR(100);
	DECLARE cliente_apellido1 VARCHAR(100);
	DECLARE cliente_apellido2 VARCHAR(100);
	-- Declarar el cursor para obtener los clientes
	DECLARE clientes_cursor CURSOR FOR
		SELECT nombre, apellido1, apellido2
		FROM cliente;
	-- Manejo de errores
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	-- Abrir el cursor
	OPEN clientes_cursor;
	-- Bucle WHILE para recorrer los clientes e imprimir nombres y apellidos
	WHILE NOT done DO
		-- Obtener el nombre y apellidos del cliente actual
		FETCH clientes_cursor INTO cliente_nombre, cliente_apellido1, cliente_apellido2;
	
		-- Imprimir los datos del cliente
		SELECT CONCAT(cliente_nombre, ' ', cliente_apellido1, ' ', IFNULL(cliente_apellido2, '')) AS NombreCompleto;
	
	END WHILE;
	-- Cerrar el cursor
	CLOSE clientes_cursor;
END //