CREATE TABLE logClientes(
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	Operacion NVARCHAR(10),
	FechaHora DATETIME DEFAULT GETDATE()
	);
------------------------------------------
CREATE TRIGGER T_NuevoCliente
ON Clientes
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha añadido un nuevo cliente a la BD.'
END;

INSERT INTO Clientes VALUES ('Eustaquio Gama', 'Blvd. Nacion de paz', '5527891465', 'Correo_trabajo@ejemplo.gov');
----------------------------------------------------
CREATE TRIGGER T_Eliminado_Cliente
ON Clientes
AFTER DELETE
AS
BEGIN
    PRINT 'Se ha eliminado un cliente de la BD.'
END;

DELETE  FROM Clientes WHERE ClienteID = 9
SELECT * FROM Clientes
SELECT * FROM Cuentas
-----------------------------------------------------
CREATE TRIGGER T_VerificarExistenciaClient
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM Clientes c
            WHERE c.ClienteID = i.ClienteID
        )
    )
    BEGIN
        PRINT 'Error: Uno o más ClienteID no existen en la tabla Clientes.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (CuentaID, ClienteID, Saldo)
        SELECT CuentaID, ClienteID, Saldo
        FROM inserted;

        PRINT 'Las cuentas se han insertado exitosamente.';
    END
END;
INSERT INTO Cuentas VALUES (2, 10, 'Debito', 1000, GETDATE());



-------------------------------------------------------
CREATE TRIGGER T_negativo
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.Saldo < 0
    )
    BEGIN
        PRINT 'Error: No se permite ingresar valores negativos en el campo Saldo.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        UPDATE Cuentas
        SET ClienteID = i.ClienteID,
            Saldo = i.Saldo
        FROM inserted i
        WHERE Cuentas.CuentaID = i.CuentaID;

        PRINT 'Actualización exitosa.';
    END
END;

UPDATE Cuentas
SET Saldo = 500
WHERE ClienteID = 2; 


-------------------------------------------------------------

CREATE TRIGGER trg_LogClientes
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        SELECT 'INSERT', GETDATE()
        FROM inserted;
    END
    
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        SELECT 'UPDATE', GETDATE()
        FROM inserted;
    END

    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO logClientes (Operacion, FechaHora)
        SELECT 'DELETE', GETDATE()
        FROM deleted;
    END
END;

INSERT INTO Clientes  VALUES ('Juan Pérez', 'juan.perez@example.com');

INSERT INTO Clientes  VALUES ('Ana Gómez', 'n/v', 5641253, 'ana.gomez@example.com');


SELECT * FROM Clientes
UPDATE Clientes
SET Nombre = 'Juan Pérez Jr.'
WHERE ClienteID = 11;

DELETE FROM Clientes
WHERE ClienteID = 11;

SELECT * FROM logClientes;
