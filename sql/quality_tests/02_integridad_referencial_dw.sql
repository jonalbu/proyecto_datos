-- 02_integridad_referencial_dw.sql
-- Se busca verificar que en la tabla de hechos debe tener una clave válida en cada dimensión
-- Que esto no estén nulos y posean un valor id relacionado.

USE jardineria_dw;

-- Hechos sin dimensiones válidas
SELECT hv.id_hecho FROM hechos_ventas hv
LEFT JOIN dim_cliente c ON hv.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

SELECT hv.id_hecho FROM hechos_ventas hv
LEFT JOIN dim_producto p ON hv.id_producto = p.id_producto
WHERE p.id_producto IS NULL;

SELECT hv.id_hecho FROM hechos_ventas hv
LEFT JOIN dim_empleado e ON hv.id_empleado = e.id_empleado
WHERE e.id_empleado IS NULL;

SELECT hv.id_hecho FROM hechos_ventas hv
LEFT JOIN dim_oficina o ON hv.id_oficina = o.id_oficina
WHERE o.id_oficina IS NULL;

SELECT hv.id_hecho FROM hechos_ventas hv
LEFT JOIN dim_tiempo t ON hv.id_fecha = t.id_fecha
WHERE t.id_fecha IS NULL;
