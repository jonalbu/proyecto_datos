-- 01_dim_completitud.sql

USE jardineria_dw;

SELECT 'dim_cliente' AS tabla, COUNT(*) AS filas FROM dim_cliente;
SELECT 'dim_producto' AS tabla, COUNT(*) AS filas FROM dim_producto;
SELECT 'dim_empleado' AS tabla, COUNT(*) AS filas FROM dim_empleado;
SELECT 'dim_oficina' AS tabla, COUNT(*) AS filas FROM dim_oficina;
SELECT 'dim_estado_pedido' AS tabla, COUNT(*) AS filas FROM dim_estado_pedido;
SELECT 'dim_tiempo' AS tabla, COUNT(*) AS filas FROM dim_tiempo;
SELECT 'hechos_ventas' AS tabla, COUNT(*) AS filas FROM hechos_ventas;
