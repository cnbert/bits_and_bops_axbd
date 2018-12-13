# crear un trigger que si se borra más que una fila 
# en la tabla EMP muestre el mensaje 
# CUIDADO CON BORRADO

DELIMITER $$ 
DUMP TRIGGER IF EXISTS T5 $$
CREATE TRIGGER T5 ON EMP
    AFTER DELETE
BEGIN
   IF (SELECT COUNT (*) FROM deleted) > 1
    THEN
	SELECT 'CUIDADO CON BORRADO';
    END IF;
END;$$

DELIMITER ;
