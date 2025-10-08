--CREATE DATABASE jardineria_staging;
--GO

USE jardineria_staging;
GO

ALTER TABLE dbo.stg_oficina
ADD region VARCHAR(50) NOT NULL;

-- Tabla de oficinas
CREATE TABLE Stg_oficina (
  ID_oficina INT,
  ciudad VARCHAR(30),
  pais VARCHAR(50),
  region VARCHAR(50),
);

-- Tabla de empleados
CREATE TABLE Stg_empleado (
  ID_empleado INT,
  nombre VARCHAR(50),
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  puesto VARCHAR(50),
  ID_oficina INT
);

-- Tabla de clientes
CREATE TABLE Stg_cliente (
  ID_cliente INT,
  nombre_cliente VARCHAR(50),
  ciudad VARCHAR(50),
  region VARCHAR(50),
  pais VARCHAR(50),
  ID_empleado_rep_ventas INTEGER DEFAULT NULL,
);

-- Tabla de pedidos
CREATE TABLE Stg_pedido (
  ID_pedido INT,
  fecha_pedido date NOT NULL,
  estado VARCHAR(15),
  ID_cliente INT
);

-- Tabla de productos
CREATE TABLE Stg_producto (
  ID_producto VARCHAR(15),
  nombre VARCHAR(70),
  proveedor VARCHAR(50),
  ID_Categoria INT,
  descripcion TEXT,
  precio_venta NUMERIC(15,2),
);

-- Tabla de detalle de pedidos
CREATE TABLE Stg_detalle_pedido (
  ID_detalle_pedido INT,
  ID_pedido INT,
  ID_producto INT,
  cantidad INT,
  precio_unidad NUMERIC(15,2),
);

-- Tabla de pagos
CREATE TABLE Stg_pago (
  ID_cliente INT,
  forma_pago VARCHAR(40),
  id_transaccion VARCHAR(50),
  fecha_pago DATE,
  total NUMERIC(15,2)
);

-- Tabla de categorías de producto
CREATE TABLE Stg_Categoria_producto (
  Id_Categoria INT,
  Desc_Categoria VARCHAR(50),
);
