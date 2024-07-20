CREATE TRIGGER T_MSGNuevaTabla
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
    PRINT 'Se ha creado una nueva tabla en DBBANK';
END;

CREATE TABLE Prestamos (
	PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
	ClienteID INT,
	Monto DECIMAL(18,2),
	TasaIntereses DECIMAL(5,2),
	FechaInicio DATE,
	FechaFin DATE,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Prestamos (ClienteID, Monto, TasaIntereses, FechaInicio, FechaFin)
VALUES
(2, 3000.00, 4.75, '2024-02-20', '2025-02-20'),
(3, 10000.00, 6.00, '2024-03-10', '2026-03-10'),
(4, 2500.00, 4.50, '2024-04-25', '2025-04-25');

SELECT * FROM Prestamos

CREATE TABLE PagoPrestamos (
	PagoID INT IDENTITY(1,1) PRIMARY KEY,
	PrestamoID INT,
	MontoPagado DECIMAL(18,2),
	FechaPago DATE,
	FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);	

INSERT INTO PagoPrestamos (PrestamoID, MontoPagado, FechaPago)
VALUES
(14, 300.00, '2024-03-20'),
(15, 1000.00, '2024-07-10'),
(16, 250.00, '2024-05-25');

SELECT * FROM PagoPrestamos

-------------------------------------------------------------

CREATE TRIGGER T_MSGProcedimientoAlmacenado
ON DATABASE
FOR CREATE_PROCEDURE
AS
BEGIN
    PRINT 'Se ha creado un Nuevo Procedimiento en DBBANK.'
END;
--------------------------------------------
CREATE PROCEDURE sp_InsertarPrestamoYPago
    @ClienteID INT,
    @Monto DECIMAL(18,2),
    @TasaIntereses DECIMAL(5,2),
    @FechaInicio DATE,
    @FechaFin DATE,
    @MontoPagado DECIMAL(18,2),
    @FechaPago DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @PrestamoID INT;

        INSERT INTO Prestamos (ClienteID, Monto, TasaIntereses, FechaInicio, FechaFin)
        VALUES (@ClienteID, @Monto, @TasaIntereses, @FechaInicio, @FechaFin);

        SET @PrestamoID = SCOPE_IDENTITY();

        INSERT INTO PagoPrestamos (PrestamoID, MontoPagado, FechaPago)
        VALUES (@PrestamoID, @MontoPagado, @FechaPago);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        SELECT @ErrorMessage = ERROR_MESSAGE();
	PRINT @ErrorMessage 
    END CATCH
END;

EXEC sp_InsertarPrestamoYPago 2, 5000.00, 5.00, '2024-07-01', '2025-07-01', 500.00, '2024-07-10';
EXEC sp_InsertarPrestamoYPago 3, 3000.00, 4.75, '2024-08-01', '2025-08-01', 300.00, '2024-08-15';


CREATE PROCEDURE sp_ConsultarClientesConPrestamosYPagos
AS
BEGIN
    SELECT
        c.ClienteID, c.Nombre, c.Direccion, c.Email, p.PrestamoID, p.Monto AS MontoPrestamo, p.TasaIntereses, p.FechaInicio, p.FechaFin, pp.PagoID, pp.MontoPagado, pp.FechaPago
    FROM
        Clientes c
    LEFT JOIN
        Prestamos p ON c.ClienteID = p.ClienteID
    LEFT JOIN
        PagoPrestamos pp ON p.PrestamoID = pp.PrestamoID
END;

EXEC sp_ConsultarClientesConPrestamosYPagos
