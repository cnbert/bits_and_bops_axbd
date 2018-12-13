# crear un trigger sobre la tabla DEPT de forma que si el departamento tiene 
# empleados asociados no permita borrar los datos del depatramento
# y si no tiene si los borre

DELIMITER $$ 
DUMP TRIGGER IF EXISTS T4 $$
CREATE TRIGGER T4 ON DEPT
    AFTER DELETE
    ON EACH ROW
BEGIN
   IF (SELECT COUNT(*) FROM deleted,EMP
	WHERE deleted.DEPTNO = EMP.DEPTNO) > 0
   THEN
	ROLLBACK TRAN
   END IF;
END;$$

DELIMITER ;
