CREATE TABLE Clientes(
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre nvarchar(100),
	Direccion Nvarchar(200),
	Telefono nvarchar(15),
	Email nvarchar(100)
);

CREATE TABLE Cuentas(
	CuentaID INT IDENTITY(1,1) PRIMARY KEY,
	ClienteID INT,
	TipoCuenta nvarchar(50),
	Saldo DECIMAL(18,2),
	FechaApertura DATE,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Transacciones (
	TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
	CuentaID INT,
	TipoTransaccion NVARCHAR(50),
	Monto DECIMAL(18,2),
	FechaTransaccion DATETIME,
	FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

CREATE TABLE Empleados(
	EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre nvarchar(100),
	Posicion nvarchar(50),
	Departamento nvarchar(50),
	FechaContratacion DATE
);

--------------------------------------------------
CREATE PROCEDURE sp_NuevoCliente
	@Nombre nvarchar(100),
	@Direccion nvarchar(100),
	@Telefono nvarchar(15),
	@Email nvarchar(100)

AS
BEGIN

	INSERT INTO Clientes(Nombre, Direccion, Telefono, Email)
	VALUES (@Nombre, @Direccion, @Telefono, @Email)

END;

EXEC sp_NuevoCliente 'JUAN', 'Av. Hercules #172, Queretaro, Qro.', '4421234567', '122044299@upq.edu.mx'
EXEC sp_NuevoCliente 'BERNARDO', 'Col. Santiago de Queretaro', '4427772039', 'correo.ejemplo@mail.com'
EXEC sp_NuevoCliente 'Martin', 'Blvd. Bernardo Quintana #21 INT: #124', '5438921204', 'Ale.perez_M@example.com'

SELECT * FROM Clientes

-----------------------------------------
CREATE PROCEDURE sp_EliminarCliente
	@ClienteID int
AS
BEGIN

	DELETE FROM Clientes WHERE ClienteID = @ClienteID
END;

EXEC sp_EliminarCliente 5
EXEC sp_EliminarCliente 6
EXEC sp_EliminarCliente 7

SELECT * FROM Clientes
-------------------------------------------------------

INSERT INTO Cuentas VALUES 
(4, 'Debito', 500.00, '2024-07-10'),
(3, 'Debito', 2000.99, '2024-07-10'),
(2, 'Nomina', 1000.00, '2024-07-10') ;

INSERT INTO Transacciones VALUES (1, 'Deposito', 100.00, SYSDATETIME()), (2, 'Deposito', 600.00, SYSDATETIME()), (3, 'Retiro', 50.00, SYSDATETIME());

SELECT * FROM Cuentas

----------------------------------------------------
SELECT * FROM Transacciones

CREATE PROCEDURE t_OperacionCliente
	@CuentaID int,
	@TipoTransaccion nvarchar(50),
	@Monto decimal(18,2)
AS
BEGIN
    BEGIN TRANSACTION;
	INSERT INTO Transacciones(CuentaID, TipoTransaccion, Monto)
	VALUES (@CuentaID, @TipoTransaccion, @Monto, SYSDATETIME());
	
	UPDATE Cuentas WHERE Saldo = @CuentaID SET Saldo ;

    BEGIN TRY
	
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;

			DECLARE @ErrorMessage NVARCHAR(4000);
			PRINT @ErrorMessage

    END CATCH
END;
GO
