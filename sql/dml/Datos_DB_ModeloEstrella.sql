
USE jardineria_dw;
GO

-- Poblar dim_cliente
INSERT INTO dim_cliente (id_cliente, nombre_cliente, ciudad, pais, region)
SELECT DISTINCT ID_cliente, nombre_cliente, ciudad, pais, region
FROM jardineria_staging.dbo.Stg_cliente;
GO

-- Poblar dim_producto
INSERT INTO dim_producto (id_producto, nombre_producto, categoria, desc_categoria, proveedor, precio_venta)
SELECT DISTINCT p.ID_producto, p.nombre, p.ID_Categoria, c.Desc_Categoria, p.proveedor, p.precio_venta
FROM jardineria_staging.dbo.Stg_producto p
JOIN jardineria_staging.dbo.Stg_Categoria_producto c
  ON p.ID_Categoria = c.Id_Categoria;
GO

-- Poblar dim_empleado (solo representantes de ventas)
INSERT INTO dim_empleado (id_empleado, nombre_empleado, puesto)
SELECT DISTINCT ID_empleado, CONCAT(nombre, ' ', apellido1) AS nombre_empleado, puesto
FROM jardineria_staging.dbo.Stg_empleado;
GO

-- Poblar dim_oficina
INSERT INTO dim_oficina (id_oficina, ciudad, pais, region)
SELECT DISTINCT ID_oficina, ciudad, pais, region
FROM jardineria_staging.dbo.Stg_oficina;
GO

-- Poblar dim_estado_pedido
INSERT INTO dim_estado_pedido (estado)
SELECT DISTINCT estado FROM jardineria_staging.dbo.Stg_pedido;
GO

-- Poblar dim_tiempo con fechas de pedido
INSERT INTO dim_tiempo (id_fecha, fecha, anio, mes, dia)
SELECT DISTINCT
  CAST(CONVERT(VARCHAR, fecha_pedido, 112) AS INT) AS id_fecha,
  fecha_pedido,
  YEAR(fecha_pedido),
  MONTH(fecha_pedido),
  DAY(fecha_pedido)
FROM jardineria_staging.dbo.Stg_pedido
WHERE fecha_pedido IS NOT NULL;
GO

-- Poblar hechos_ventas
INSERT INTO hechos_ventas (
  id_fecha, id_cliente, id_producto, id_empleado, id_oficina, id_estado,
  cantidad, precio_unitario, total_venta
)
SELECT
  CAST(CONVERT(VARCHAR, p.fecha_pedido, 112) AS INT) AS id_fecha,
  p.ID_cliente,
  dp.ID_producto,
  c.ID_empleado_rep_ventas,
  o.ID_oficina,
  ep.id_estado,
  dp.cantidad,
  dp.precio_unidad,
  dp.cantidad * dp.precio_unidad AS total_venta
FROM jardineria_staging.dbo.Stg_detalle_pedido dp
JOIN jardineria_staging.dbo.Stg_pedido p ON dp.ID_pedido = p.ID_pedido
JOIN jardineria_staging.dbo.Stg_cliente c ON p.ID_cliente = c.ID_cliente
JOIN jardineria_staging.dbo.Stg_empleado e ON c.ID_empleado_rep_ventas = e.ID_empleado
JOIN jardineria_staging.dbo.Stg_oficina o ON e.ID_oficina = o.ID_oficina
JOIN dim_estado_pedido ep ON p.estado = ep.estado;
GO