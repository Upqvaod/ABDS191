CREATE PROCEDURE sp_InsertarCliente
	@nombre VARCHAR(100),
	@correo_electronico NVARCHAR(70),
	@pass VARCHAR(255)
AS
BEGIN
	INSERT INTO Clientes (nombre, correo_electronico, pass)
	VALUES (@nombre, @correo_electronico, @pass);
END;

EXEC sp_InsertarCliente @nombre = 'Juan Pérez', @correo_electronico = 'juan@example.com', @pass = 'password123';
EXEC sp_InsertarCliente @nombre = 'Ana López', @correo_electronico = 'ana@example.com', @pass = 'password456';
EXEC sp_InsertarCliente @nombre = 'Carlos García', @correo_electronico = 'carlos@example.com', @pass = 'password789';

SELECT * FROM Clientes



CREATE PROCEDURE sp_InsertarCompra
	@id_cliente BIGINT,
	@fecha_compra DATE,
	@total DECIMAL(10,2)
AS
BEGIN
	INSERT INTO Compras (id_cliente, fecha_compra, total)
	VALUES (@id_cliente, @fecha_compra, @total);
END;

EXEC sp_InsertarCompra @id_cliente = 1, @fecha_compra = '2024-06-28', @total = 150.50;
EXEC sp_InsertarCompra @id_cliente = 2, @fecha_compra = '2024-06-29', @total = 200.75;
EXEC sp_InsertarCompra @id_cliente = 3, @fecha_compra = '2024-06-30', @total = 120.00;

SELECT * FROM Compras
---------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_EditarCliente
	@id_cliente BIGINT,
	@nombre VARCHAR(100),
	@correo_electronico NVARCHAR(70),
	@pass VARCHAR(255)
AS
BEGIN
	UPDATE Clientes
	SET nombre = @nombre, correo_electronico = @correo_electronico, pass = @pass
	WHERE id_cliente = @id_cliente;
END;

EXEC sp_EditarCliente @id_cliente = 1, @nombre = 'Juan Pérez', @correo_electronico = 'juan.perez@example.com', @pass = 'newpassword123';
EXEC sp_EditarCliente @id_cliente = 2, @nombre = 'Ana López', @correo_electronico = 'ana.lopez@example.com', @pass = 'newpassword456';
EXEC sp_EditarCliente @id_cliente = 3, @nombre = 'Carlos García', @correo_electronico = 'carlos.garcia@example.com', @pass = 'newpassword789';

SELECT * FROM Clientes



CREATE PROCEDURE sp_EditarComic
	@id_comic BIGINT,
	@nombre VARCHAR(100),
	@anio INT,
	@precio DECIMAL(10,2)
AS
BEGIN
	UPDATE Comics
	SET nombre = @nombre, anio = @anio, precio = @precio
	WHERE id_comic = @id_comic;
END;

EXEC sp_EditarComic @id_comic = 14, @nombre = 'Spiderman: Shattered Dimensions', @anio = 2021, @precio = 29.99;
EXEC sp_EditarComic @id_comic = 16, @nombre = 'Batman #8', @anio = 2020, @precio = 19.99;
EXEC sp_EditarComic @id_comic = 18, @nombre = 'Spiderman', @anio = 2019, @precio = 24.99;

SELECT * FROM Comics
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_EliminarCliente
    @id_cliente BIGINT
AS
BEGIN
    DELETE FROM Comic_Compras
    WHERE id_compra IN (SELECT id_compra FROM Compras WHERE id_cliente = @id_cliente);

    DELETE FROM Compras
    WHERE id_cliente = @id_cliente;

    DELETE FROM Clientes
    WHERE id_cliente = @id_cliente;
END;

EXEC sp_EliminarCliente @id_cliente = 1;
EXEC sp_EliminarCliente @id_cliente = 2;
EXEC sp_EliminarCliente @id_cliente = 3;

SELECT * FROM Clientes


CREATE PROCEDURE sp_EliminarCompra
    @id_compra BIGINT
AS
BEGIN
    DELETE FROM Comic_Compras
    WHERE id_compra = @id_compra;

    DELETE FROM Compras
    WHERE id_compra = @id_compra;
END;

EXEC sp_EliminarCompra @id_compra = 4;
EXEC sp_EliminarCompra @id_compra = 6;
EXEC sp_EliminarCompra @id_compra = 7;

SELECT * FROM Compras
---------------------------------------------------------------------------
CREATE PROCEDURE sp_ConsultarComprasPorCliente
	@id_cliente BIGINT
AS
BEGIN
	SELECT C.id_compra, C.fecha_compra, C.total
	FROM Compras C
	INNER JOIN Clientes CL ON C.id_cliente = CL.id_cliente
	WHERE CL.id_cliente = @id_cliente;
END;

EXEC sp_ConsultarComprasPorCliente @id_cliente = 1;
EXEC sp_ConsultarComprasPorCliente @id_cliente = 5;
EXEC sp_ConsultarComprasPorCliente @id_cliente = 10;



CREATE PROCEDURE sp_ConsultarDetallesCompra
	@id_compra BIGINT
AS
BEGIN
	SELECT CC.id_CC, CM.nombre AS ComicNombre, CC.cantidad, CM.precio
	FROM Comic_Compras CC
	INNER JOIN Comics CM ON CC.id_comic = CM.id_comic
	WHERE CC.id_compra = @id_compra;
END;

EXEC sp_ConsultarDetallesCompra @id_compra = 1;
EXEC sp_ConsultarDetallesCompra @id_compra = 5;
EXEC sp_ConsultarDetallesCompra @id_compra = 10;

select * from 



CREATE PROCEDURE sp_ConsultarInventarioComics
	@id_comic BIGINT
AS
BEGIN
	SELECT I.id_inventario, I.cantidad_disponible, I.disponibilidad
	FROM Inventario I
	INNER JOIN Comics CM ON I.id_comic = CM.id_comic
	WHERE CM.id_comic = @id_comic;
END;

EXEC sp_ConsultarInventarioComics @id_comic = 14;
EXEC sp_ConsultarInventarioComics @id_comic = 20;
EXEC sp_ConsultarInventarioComics @id_comic = 28;


