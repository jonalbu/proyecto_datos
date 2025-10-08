-- 05_unicidad_dimensiones.sql

USE jardineria_dw;

-- Unicidad de claves en dimensiones
SELECT id_cliente, COUNT(*) AS c FROM dim_cliente GROUP BY id_cliente HAVING COUNT(*) > 1;
SELECT id_producto, COUNT(*) AS c FROM dim_producto GROUP BY id_producto HAVING COUNT(*) > 1;
SELECT id_empleado, COUNT(*) AS c FROM dim_empleado GROUP BY id_empleado HAVING COUNT(*) > 1;
SELECT id_oficina, COUNT(*) AS c FROM dim_oficina GROUP BY id_oficina HAVING COUNT(*) > 1;

-- Unicidad de fechas en dimensión tiempo
SELECT id_fecha, COUNT(*) AS c FROM dim_tiempo GROUP BY id_fecha HAVING COUNT(*) > 1;
