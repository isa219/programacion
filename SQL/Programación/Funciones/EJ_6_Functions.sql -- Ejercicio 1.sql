-- Hacer una funcion que me diga cuantos comerciales hay en la BBDD

DROP FUNCTION comerciales;

DELIMITER $$
CREATE FUNCTION comerciales()
RETURNS INT
BEGIN
	DECLARE comercialess INT;
		SELECT COUNT(id) into comercialess FROM comercial;
	RETURN comercialess;
END$$
DELIMITER ;
SELECT comerciales();