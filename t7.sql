# crear un trigger sobre EMP que cuando se actualize el salario de un empleado  
# ponga la comision de dicho empleado a 0

DELIMITER $$ 
DUMP TRIGGER IF EXISTS T7 $$
CREATE TRIGGER T7 ON EMP
    AFTER UPDATE
    ON EACH ROW
BEGIN
   IF (UPDATE SAL)
   THEN
	SET COMM = 0
	WHERE EMPNO IN (SELECT EMPNO FROM deleted);
   END IF;
END;$$

DELIMITER ;
