--1. Crea un procedimiento almacenado con el cual podremos Insertar usuarios atreves de los parámetros--
CREATE PROCEDURE sp_InsertarUsuario
	@Nombre nvarchar(100),
	@Email nvarchar(100),
	@Pass nvarchar(100),
	@FechaRegistro date
AS
BEGIN

	INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES
	(@Nombre, @Email, @Pass, @FechaRegistro);
END

EXEC sp_InsertarUsuario @Nombre = 'Lucía Martínez', @Email = 'lucia.martinez@example.com', @Pass = '12345q', @FechaRegistro = '2023-11-15';
EXEC sp_InsertarUsuario @Nombre = 'Diego Gómez', @Email = 'diego.gomez@example.com', @Pass = 'qwerrtd', @FechaRegistro = '2023-11-20'
EXEC sp_InsertarUsuario @Nombre = 'Sofía Hernández', @Email = 'sofia.hernandez@example.com', @Pass = '123werg', @FechaRegistro = '2023-11-25'

SELECT * FROM Usuarios

--2.	Crea un procedimiento almacenado para Editar una Suscripción.--
CREATE PROCEDURE sp_EditarSuscripcion
    @SuscripcionID int,
    @FechaInicio date,
    @FechaFin date,
    @Tipo nvarchar(50)
AS
BEGIN
    UPDATE Suscripciones
    SET 
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Tipo = @Tipo
    WHERE
        SuscripcionID = @SuscripcionID;
END

EXEC sp_EditarSuscripcion @SuscripcionID = 1, @FechaInicio = '2023-02-10', @FechaFin = '2024-03-10', @Tipo = 'Basica'
EXEC sp_EditarSuscripcion @SuscripcionID = 2, @FechaInicio = '2024-05-23', @FechaFin = '2024-06-23', @Tipo = 'Suspendida'
EXEC sp_EditarSuscripcion @SuscripcionID = 3, @FechaInicio = '2024-01-02', @FechaFin = '2025-06-02', @Tipo = 'Premium'

SELECT * FROM Suscripciones

--3. Crea un procedimiento para Eliminar un registro en la tabla de Historial Visualización.--
CREATE PROCEDURE sp_EliminarRegistroHistorial
	@HistorialID int
AS
BEGIN
	
	DELETE FROM HistorialVisualizacion 
	WHERE HistorialID = @HistorialID

END

EXEC sp_EliminarRegistroHistorial @HistorialID = 67
EXEC sp_EliminarRegistroHistorial @HistorialID = 68
EXEC sp_EliminarRegistroHistorial @HistorialID = 69

SELECT * FROM HistorialVisualizacion

--4. Crea un procedimiento para consultar los usuarios con su suscripción, que use como parámetro el tipo de suscripción.
CREATE PROCEDURE sp_ConsultaTipoSuscripcion
	@Tipo nvarchar(50)
AS
BEGIN
	
	SELECT u.UsuarioID, u.Nombre, u.Email, u.FechaRegistro, s.Tipo
	FROM Usuarios u
	JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
	WHERE Tipo = @Tipo

END

EXEC sp_ConsultaTipoSuscripcion @Tipo = 'Basica'
EXEC sp_ConsultaTipoSuscripcion @Tipo = 'Premium'
EXEC sp_ConsultaTipoSuscripcion @Tipo = 'Suspendida'

SELECT * FROM Suscripciones
SELECT * FROM Usuarios