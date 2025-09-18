CREATE OR REPLACE TABLE fgd_salida (
    id                  INT                         COMMENT 'Identificador salida',
    operacion           VARCHAR(100)                COMMENT 'operacion de salida',
    persona             VARCHAR(100)                COMMENT 'persona operacion de salida',
    relacion            VARCHAR(100)                COMMENT 'relacion operacion',
    importe             DECIMAL(10,2)               COMMENT 'importe salida',
    intervinientes      VARCHAR(100)                COMMENT 'intervinientes en la operacion',
    participacion       VARCHAR(100)                COMMENT 'participacion de los intervinientes',
    entidad             VARCHAR(100)                COMMENT 'entidad donde se produce la operacion',
    periodo             VARCHAR(100)                COMMENT 'periodo de la operacion',
    fecha_insercion     DATE                        COMMENT 'fecha de la operacion'
);