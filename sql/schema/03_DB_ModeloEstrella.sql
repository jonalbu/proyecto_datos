
-- Crear base de datos del modelo estrella
CREATE DATABASE jardineria_dw;
GO
USE jardineria_dw

-- Dimensión Cliente
CREATE TABLE dim_cliente (
  id_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(50),
  ciudad VARCHAR(50),
  pais VARCHAR(50),
  region VARCHAR(50)
);

-- Dimensión Producto
CREATE TABLE dim_producto (
  id_producto VARCHAR(15) PRIMARY KEY,
  nombre_producto VARCHAR(70),
  categoria INT,
  desc_categoria VARCHAR(50),
  proveedor VARCHAR(50),
  precio_venta NUMERIC(15,2)
);

-- Dimensión Empleado (Representante de ventas)
CREATE TABLE dim_empleado (
  id_empleado INT PRIMARY KEY,
  nombre_empleado VARCHAR(100),
  puesto VARCHAR(50)
);

-- Dimensión Oficina
CREATE TABLE dim_oficina (
  id_oficina INT PRIMARY KEY,
  ciudad VARCHAR(30),
  pais VARCHAR(50),
  region VARCHAR(50)
);

-- Dimensión Estado del Pedido
CREATE TABLE dim_estado_pedido (
  id_estado INT IDENTITY(1,1) PRIMARY KEY,
  estado VARCHAR(15) UNIQUE
);

-- Dimensión Tiempo
CREATE TABLE dim_tiempo (
  id_fecha INT PRIMARY KEY,  -- formato YYYYMMDD
  fecha DATE,
  anio INT,
  mes INT,
  dia INT
);

-- Tabla de Hechos
CREATE TABLE hechos_ventas (
  id_hecho INT IDENTITY(1,1) PRIMARY KEY,
  id_fecha INT,
  id_cliente INT,
  id_producto VARCHAR(15),
  id_empleado INT,
  id_oficina INT,
  id_estado INT,
  cantidad INT,
  precio_unitario NUMERIC(15,2),
  total_venta NUMERIC(15,2),
  FOREIGN KEY (id_fecha) REFERENCES dim_tiempo(id_fecha),
  FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES dim_producto(id_producto),
  FOREIGN KEY (id_empleado) REFERENCES dim_empleado(id_empleado),
  FOREIGN KEY (id_oficina) REFERENCES dim_oficina(id_oficina),
  FOREIGN KEY (id_estado) REFERENCES dim_estado_pedido(id_estado)
);
