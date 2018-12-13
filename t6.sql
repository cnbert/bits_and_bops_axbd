# crear un trigger que cuando se inserte empleado compuerbe el numero de dep  
# en la tabla EMP, si existe inserta si no existe  muestre el mensaje 
# INSERCION NO PERMITIDA PORQUE NO EXISTE EL DEPARTAMENTO

DELIMITER $$ 
DUMP TRIGGER IF EXISTS T6 $$
CREATE TRIGGER T6 ON EMP
    AFTER INSERT
    ON EACH ROW
BEGIN
   IF (SELECT COUNT(*) FROM inserted, DEPT
	WHERE inserted.DEPTNO = DEPT.DEPTNO) = 0
   THEN
	ROLLBACK TRAN;
	SELECT 'INSERCION NO PERMITIDA PORQUE NO EXISTE EL DEPARTAMENTO';
   END IF;
END;$$

DELIMITER ;
