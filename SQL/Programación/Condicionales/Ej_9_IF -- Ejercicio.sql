-- Crear un procedimiento almacenado que realice un cálculo en función del total de pedidos de un comercial y ajusta su comisión. El procedimiento tomará el ID del comercial y calculará la comisión basándose en un aumento del 5% si el total de los pedidos supera los 2000.

DROP PROCEDURE ActualizarComisionComercial;
DELIMITER //
CREATE PROCEDURE ActualizarComisionComercial(IN comercial_id INT)
BEGIN
	DECLARE total_pedidos DOUBLE;
	DECLARE nueva_comision FLOAT;
	
	-- Calcular el total de pedidos para el comercial
	SELECT SUM(total) INTO total_pedidos
	FROM pedido
	WHERE id_comercial = comercial_id;
	
	-- Determinar la nueva comisión
	IF total_pedidos > 2000 THEN
		SET nueva_comision = (SELECT comisión FROM comercial WHERE id = comercial_id) * 1.05;
	ELSE
		SET nueva_comision = (SELECT comisión FROM comercial WHERE id = comercial_id);
	END IF;
	
	-- Actualizar la comisión del comercial
	UPDATE comercial
	SET comisión = nueva_comision
	WHERE id = comercial_id;
END //

DELIMITER ;
CALL ActualizarComisionComercial(1);

-- Si total_pedidos menor de 2000 dejar la comision igual
-- Si total_pedidos entre 2000 y 3000 subir la comision un 5%
-- Si total_pedidos entre 3000 y 5000 subir la comision un 8%
-- Si total_pedidos mayor de 5000 subir la comision un 10%

DELIMITER //
CREATE PROCEDURE ActualizarComisionComercialConCase(IN comercial_id INT)
BEGIN
	DECLARE total_pedidos DOUBLE;
	DECLARE nueva_comision FLOAT;
	
	-- Calcular el total de pedidos para el comercial
	SELECT SUM(total) INTO total_pedidos
	FROM pedido
	WHERE id_comercial = comercial_id;
	
	-- Determinar la nueva comisión
	SET nueva_comision =
	CASE
		WHEN total_pedidos > 5000 THEN
			(SELECT comisión FROM comercial WHERE id = comercial_id) * 1.10
		WHEN total_pedidos > 3000 THEN
			(SELECT comisión FROM comercial WHERE id = comercial_id) * 1.08
		WHEN total_pedidos > 2000 THEN
			(SELECT comisión FROM comercial WHERE id = comercial_id) * 1.05
		ELSE
			(SELECT comisión FROM comercial WHERE id = comercial_id)
		END;
		
	-- Actualizar la comisión del comercial
	UPDATE comercial
	SET comisión = nueva_comision
	WHERE id = comercial_id;
END //

DELIMITER ;
CALL ActualizarComisionComercialConCase(1);

-- Ejercicio de Luis

delimiter $
create procedure comision(in c int)
begin
declare com float;
declare dinero double;
select sum(total) into dinero from pedido where id_comercial=c;
if dinero > 2000 and dinero <=3000 THEN
set com=0.05;
end if;
if dinero > 3000 and dinero <=3000 THEN
set com=0.08;
end if;
if dinero > 5000 THEN
set com=0.10;
end if;
if dinero < 2000 THEN
set com=0.00;
end if;
 
update comercial set comisión=comisión+com where id=c;
end$
delimiter ;