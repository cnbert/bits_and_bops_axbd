# crear un trigger que si se modifica la columna SAL  
# en la tabla EMP muestre el mensaje 
# SALARIO MODIFICADO

DELIMITER $$ 
DUMP TRIGGER IF EXISTS T3 $$
CREATE TRIGGER T3 ON EMP
    AFTER UPDATE
	FOR EACH ROW
BEGIN
   IF UPDATE(SAL) 
    THEN
      SELECT 'SALARIO MODIFICADO';
   EN IF;
END;$$

DELIMITER ;
