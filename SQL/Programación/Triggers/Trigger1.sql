--Tema 8. Triggers/Disparadores

--¿Que son los triggers?

--Se ejecutarán de manera automática cuando sucede algo.
--Las bases de datos están funcionando de manera dinámica, borra, inserta elimina y actualiza.
--Si queréis que cuando pase algo suceda un cambio. Se modifique, se borre... esos se controlarán con triggers.
--Hay 3 eventos que podremos controlar, los eventos son un INSERT lo puedo controlar, un DELETE lo puede controlar, un UPDATE lo puede controlar, SELECT no lo puede controlar porque no modifica.
--Los triggers se pueden ejecutar en 2 momentos del evento, BEFORE INSERT, BEFORE DELETE o BEFORE UPDATE, antes de un INSERT está en un INSERT.
--Un DELETE después del DELETE.
--Como la transacción será solo para nosotros podremos controlar esto, antes o después de un INSERT, UPDATE o un DELETE... para controlar esto hay 2 palabras reservadas, OLD y NEW.
--El instante viejo, y NEW el instante después.
--Los INSERT normalmente solo permiten NEW, el DELETE solo permite OLD por que el NEW no existe y UPDATE tiene antes y después del cambio.

--Cont. Ejemplo

--Cuando inserte un nuevo pedido, la base de datos tiene que hacer algo, que hará, actualizara la comisión del comercial.
--Por cada pedido que alguien haga le sumare un 2% de comisión. Y el trigger asegura que se actualice solo.
--Hay que manejar DELIMITER igual.
--Ya no es ‘;’ es ‘/’, porque, porque cuando ponga ‘;’ termina el trigger.
--¿Como se crea el trigger? CREATE TRIGGER nombre, como se borrará, DROP TRIGGER.
--A continuación, se pone el evento que queremos, el evento con INSERT DELETE y UPDATE, aquí pongo AFTER INSERT.
--Después de insertar se ejecutará lo que viene a continuación.
--Luego se pone ON y la tabla que queremos actualizar, en este caso pedido y luego se pone la palabra reservada FOR EACH ROW.
--BEGIN y END.
--Aquí se pondrá el procedimiento o función almacenados exactamente igual.
--Actualizaremos la comisión del comercial sumando, más NEW.total * 0.0.2.
--Al nuevo valor le multiplicamos el nuevo valor.
--O podemos hacerlo sin NEW y OLD.


--El trigger ya está creado, ¿cuándo se ejecutará este trigger? Ni SELECT... ¿cuándo se ejecutará? después de un INSERT en la tabla pedido.
--Los triggers se usarán en PHP para hacer cosas de manera automática, para automatizar una base de datos. Esto se hace 1 vez en la vida y se queda para siempre.
--Solo podemos tener 1 trigger por evento. O poneis todos en el trigger o el trigger llamaran a funciones para hacer varias cosas.


DELIMITER //
CREATE TRIGGER ActualizarComision
AFTER INSERT
ON pedido FOR EACH ROW
BEGIN
	-- Actualizar la comision del comercial.
	UPDATE comercial
	SET comision = comision + 0.02
	WHERE id = NEW.id_comercial;
END //
DELIMITER ;