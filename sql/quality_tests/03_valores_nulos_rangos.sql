-- 03_valores_nulos_rangos.sql

USE jardineria_dw;

-- Dimensiones con claves o atributos críticos nulos
SELECT * FROM dim_cliente WHERE id_cliente IS NULL OR nombre_cliente IS NULL;
SELECT * FROM dim_producto WHERE id_producto IS NULL OR nombre_producto IS NULL;

-- Precios no válidos
SELECT * FROM dim_producto WHERE precio_venta IS NULL OR precio_venta <= 0;

-- Totales inconsistentes
SELECT * FROM hechos_ventas
WHERE total_venta <> cantidad * precio_unitario;
