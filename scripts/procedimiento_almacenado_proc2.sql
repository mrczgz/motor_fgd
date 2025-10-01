
CREATE OR REPLACE PROCEDURE proc2 ()
RETURNS STRING
LANGUAGE SQL  
AS
$$
DECLARE 
 
     num_errores INT;

BEGIN
    
    SELECT COUNT(*) INTO num_errores
    FROM       PERSONAS A 
    LEFT JOIN  PAISES   B   ON  A.PAIS = B.CODIGO_ISO 
    WHERE      B.CODIGO_ISO IS NULL;

    CASE WHEN num_errores = 0 THEN 
      RETURN 'OK - todos los códigos de países son correctos';
    ELSE
      RETURN 'KO - Hay ' || num_errores || ' registros con el código de país mal informado';
    END;

END;
$$;


    
CALL proc2();