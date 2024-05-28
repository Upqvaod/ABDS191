CREATE TABLE Clientes(
	id_cliente BIGINT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(100),
	correo_electronico NVARCHAR(70),
	pass VARCHAR(255) 
);

CREATE TABLE Compras(
	id_compra BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_cliente BIGINT,
	fecha_compra DATE,
	total DECIMAL(10,2),
	FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
);

CREATE TABLE Comics (
	id_comic BIGINT IDENTITY(10,2) PRIMARY KEY,
	nombre VARCHAR(100),
	anio TINYINT,
	precio DECIMAL(10,2)
);

CREATE TABLE Inventario(
	id_inventario BIGINT IDENTITY(1000,2) PRIMARY KEY,
	cantidad TINYINT,
	cantidad_disponible INT,
	disponibilidad BINARY,
);


CREATE TABLE Comic_Compras(
	id_CC BIGINT IDENTITY(1000,2) PRIMARY KEY,
	cantidad TINYINT,
	id_compra BIGINT,
	id_comic BIGINT,
	FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
	FOREIGN KEY (id_comic) REFERENCES Comics(id_comic),
);

