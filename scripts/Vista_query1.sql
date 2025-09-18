CREATE OR REPLACE VIEW relacion_tablas AS
SELECT 
    T2.cuenta_principal || '-' || UPPER(T2.tipo_operacion)  AS "Cuenta y tipo operación", 
    CASE
        WHEN T1.tipo_relacion = 'Titular'   THEN 'TIT'
        ELSE                                     'NO_TIT'
    END                                                     AS "Tipo relación",
    T3.nombre || ' ' || T3.apellido1 || ' ' || T3.apellido2 AS "Persona asociada",
    TO_NUMBER(T2.importe * (T1.PARTICIPACION/100), 10, 2)   AS "Importe operación",   
    COUNT(T1.persona_id) OVER(PARTITION BY T1.operacion_id) AS "Personas por operación",
    T1.participacion || '%'                                 AS "Porcentaje participación"
        
       
FROM operaciones   T2
JOIN relaciones    T1 ON T1.operacion_id = T2.operaciones_id
JOIN personas      T3 ON T1.persona_id = T3.persona_id
WHERE T2.divisa = 'EUR'
;