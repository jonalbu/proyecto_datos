--ALTER DATABASE jardineria_staging SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--DROP DATABASE jardineria_staging;

USE jardineria_staging;
GO;

-- Se extrae los datos desde la base de datos de Jardineria

-- Extracción de la BD jardinería a la BD Staging (Stg_oficina)
INSERT INTO jardineria_staging.dbo.Stg_oficina (ID_oficina, ciudad, pais, region)
SELECT ID_oficina
      ,ciudad
      ,pais
      ,region
FROM jardineria.dbo.oficina;

-- Extracción de la BD jardinería a la BD Staging (Stg_empleado)
INSERT INTO jardineria_staging.dbo.Stg_empleado (ID_empleado
      ,nombre
      ,apellido1
      ,apellido2
      ,puesto
      ,ID_oficina)
SELECT ID_empleado
      ,nombre
      ,apellido1
      ,apellido2
      ,puesto
      ,ID_oficina
  FROM jardineria.dbo.empleado;

-- Extracción de la BD jardinería a la BD Staging (Stg_cliente)
INSERT INTO jardineria_staging.dbo.Stg_cliente (ID_cliente
      ,nombre_cliente
      ,ciudad
      ,region
      ,pais
      ,ID_empleado_rep_ventas)
SELECT ID_cliente
      ,nombre_cliente
      ,ciudad
      ,region
      ,pais
      ,ID_empleado_rep_ventas
  FROM jardineria.dbo.cliente;

-- Extracción de la BD jardinería a la BD Staging (Stg_pedido)
INSERT INTO jardineria_staging.dbo.Stg_pedido (ID_pedido, fecha_pedido
      ,estado
      ,ID_cliente)
SELECT ID_pedido
      ,fecha_pedido
      ,estado
      ,ID_cliente
FROM jardineria.dbo.pedido;

-- Extracción de la BD jardinería a la BD Staging (Stg_detalle_pedido)
INSERT INTO jardineria_staging.dbo.Stg_detalle_pedido (ID_detalle_pedido 
      ,ID_pedido
      ,ID_producto
      ,cantidad
      ,precio_unidad)
SELECT ID_detalle_pedido
      ,ID_pedido
      ,ID_producto
      ,cantidad
      ,precio_unidad
  FROM jardineria.dbo.detalle_pedido

-- Extracción de la BD jardinería a la BD Staging (Stg_producto)
INSERT INTO jardineria_staging.dbo.Stg_producto (ID_producto
      ,nombre
      ,ID_Categoria
      ,proveedor
      ,descripcion
      ,precio_venta)
SELECT ID_producto
      ,nombre
      ,ID_Categoria
      ,proveedor
      ,descripcion
      ,precio_venta
  FROM jardineria.dbo.producto;

-- Extracción de la BD jardinería a la BD Staging (Stg_pago)
INSERT INTO jardineria_staging.dbo.Stg_pago (ID_cliente,
  forma_pago,
  id_transaccion,
  fecha_pago,
  total)
SELECT ID_cliente,
  forma_pago,
  id_transaccion,
  fecha_pago,
  total FROM jardineria.dbo.pago;

INSERT INTO jardineria_staging.dbo.Stg_Categoria_producto (Id_Categoria
      ,Desc_Categoria)
SELECT Id_Categoria
      ,Desc_Categoria
FROM jardineria.dbo.Categoria_producto;
