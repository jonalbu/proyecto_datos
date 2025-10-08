-- 04_tiempo_coherencia.sql

USE jardineria_dw;

-- Fechas en hechos no presentes en dim_tiempo
SELECT DISTINCT hv.id_fecha
FROM hechos_ventas hv
LEFT JOIN dim_tiempo dt ON hv.id_fecha = dt.id_fecha
WHERE dt.id_fecha IS NULL;
