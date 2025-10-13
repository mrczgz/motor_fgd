CREATE OR REPLACE PROCEDURE proc2 (nombreTablaA STRING , nombreTablaB STRING , campoTablaB STRING , campoTablaA STRING)
RETURNS STRING
LANGUAGE SQL  
AS
$$
DECLARE 
 
     num_errores INT;
     query       STRING;
     resultado   RESULTSET;

BEGIN
    
    query := 'SELECT COUNT(*) as total
              FROM       '|| nombreTablaA || ' A 
              LEFT JOIN  '|| nombreTablaB || ' B    ON  A.' || campoTablaA || ' = B.' || campoTablaB ||
              ' WHERE      B.' || campoTablaB || ' IS NULL';

    resultado := (EXECUTE IMMEDIATE query);
    let c1 cursor for resultado;
    open c1;
    fetch c1 into num_errores;
    close c1;
    
    CASE WHEN num_errores = 0 THEN 
      RETURN 'OK - todos los códigos son correctos';
    ELSE
      RETURN 'KO - Hay ' || num_errores || ' registros con el código mal informado';
    END;   

END;
$$
;

    
CALL proc2('personas', 'paises', 'codigo_ISO', 'pais');
CALL proc2('operaciones', 'monedas', 'codigo', 'moneda');