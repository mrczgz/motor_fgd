CREATE OR REPLACE PROCEDURE proc1 (
    p_entidad             VARCHAR(100),
    p_periodo             VARCHAR(100) 
)
RETURNS STRING
LANGUAGE SQL  
AS
$$
BEGIN
    
    DELETE FROM  fgd_salida
    WHERE        entidad = :p_entidad
    AND          periodo = :p_periodo;

    INSERT INTO fgd_salida
    (operacion,relacion,persona,importe,intervinientes,participacion,entidad,periodo,fecha_insercion)
        SELECT 
             T2.cuenta_principal || '-' || UPPER(T2.tipo_operacion)  AS "Cuenta y tipo operación",
             CASE
                WHEN T1.tipo_relacion = 'Titular'   THEN 'TIT'
                ELSE                                     'NO_TIT'
             END, 
             T3.nombre || ' ' || T3.apellido1 || ' ' || T3.apellido2 AS "Persona asociada",
             TO_NUMBER(T2.importe * (T1.PARTICIPACION/100), 10, 2)   AS "Importe operación",   
             COUNT(T1.persona_id) OVER(PARTITION BY T1.operacion_id) AS "Personas por operación",
             T1.participacion                                        AS "Participación",
             T1.entidad                                              AS "Entidad",
             T1.periodo                                              AS "Periodo de tiempo",
             SYSDATE()                                               AS "Fecha inserción"
                           
        FROM operaciones   T2
        JOIN relaciones    T1 ON T1.operacion_id = T2.operaciones_id
        JOIN personas      T3 ON T1.persona_id = T3.persona_id
        WHERE T2.divisa  = 'EUR'
        AND T1.entidad = :p_entidad
        AND T1.periodo = :p_periodo;

    RETURN 'OK';

END;
$$;
    

CALL proc1('0049','0925');