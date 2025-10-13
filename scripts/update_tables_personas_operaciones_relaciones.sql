UPDATE operaciones
SET entidad = '0049',
    periodo = '0925';

    
UPDATE personas
SET entidad = '0049',
    periodo = '0925';


UPDATE relaciones
SET entidad = '0049',
    periodo = '0925';
	
ALTER TABLE personas
ADD COLUMN 
    Pais                      VARCHAR(2)                       COMMENT 'País origen cuenta'
;

UPDATE personas
SET    pais = 'ES'
;
