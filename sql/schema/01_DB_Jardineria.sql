CREATE DATABASE jardineria;

CREATE TABLE oficina (
  ID_oficina int identity(1,1), 
  Descripcion VARCHAR(10) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (ID_oficina)
);

CREATE TABLE empleado (
  ID_empleado INT identity(1,1) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  ID_oficina int NOT NULL,
  ID_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_oficina) REFERENCES oficina (ID_oficina),
  FOREIGN KEY (ID_jefe) REFERENCES empleado (ID_empleado)
);

CREATE TABLE Categoria_producto (
  Id_Categoria int identity(1,1),
  Desc_Categoria VARCHAR(50) NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (Id_Categoria)
);

CREATE TABLE cliente (
  ID_cliente INTEGER identity(1,1) NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  ID_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (ID_cliente),
  FOREIGN KEY (ID_empleado_rep_ventas) REFERENCES empleado (ID_empleado)
);

CREATE TABLE pedido (
  ID_pedido INTEGER identity(1,1) NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios TEXT,
  ID_cliente INTEGER NOT NULL,
  PRIMARY KEY (ID_pedido),
  FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente)
);

CREATE TABLE producto (
  ID_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  Categoria int NOT NULL,
  dimensiones VARCHAR(25) NULL,
  proveedor VARCHAR(50) DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (ID_producto),
  FOREIGN KEY (Categoria) REFERENCES Categoria_producto (Id_Categoria)
);

CREATE TABLE detalle_pedido (
  ID_pedido INTEGER NOT NULL,
  ID_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (ID_pedido, ID_producto),
  FOREIGN KEY (ID_pedido) REFERENCES pedido (ID_pedido),
  FOREIGN KEY (ID_producto) REFERENCES producto (ID_producto)
);

CREATE TABLE pago (
  ID_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (ID_cliente, id_transaccion),
  FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente)
);