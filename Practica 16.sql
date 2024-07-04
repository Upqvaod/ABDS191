CREATE PROCEDURE sp_InsertarPelicula_e_Historial
	@PeliculaID int,
	@UsuarioID int,
	@Titulo nvarchar(100),
	@Genero nvarchar (50),
	@FechaEstreno date,
	@FechaVisualizacion datetime
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		INSERT INTO Peliculas(Titulo, Genero, FechaEstreno)
		VALUES (@Titulo, @Genero, @FechaEstreno);


		INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion)
		VALUES (@UsuarioID, @PeliculaID, @FechaVisualizacion)
		
		COMMIT TRANSACTION;
	END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	DECLARE @ErrorMessage nvarchar (4000);
	SET @ErrorMessage = ERROR_MESSAGE();
PRINT @ErrorMessage
END CATCH
END;

EXEC sp_InsertarPelicula_e_Historial 26,1,'Kill Bill Vol. 2', 'Accion', '2003-09-16', '2024-07-03 17:56:32'
EXEC sp_InsertarPelicula_e_Historial 27, 6, 'Avengers: Endgame', 'Acción', '2019-04-26', '2024-07-03 18:00:00';
EXEC sp_InsertarPelicula_e_Historial 28, 10, 'El Origen', 'Ciencia ficción', '2010-07-16', '2024-07-01 19:00:00';



SELECT * FROM Peliculas
SELECT * FROM HistorialVisualizacion
-----------------------------------------------------------------------------
CREATE PROCEDURE sp_InsertarUsuario_Suscripcion_Visualizacion
	@Nombre nvarchar(100),
	@Email nvarchar(100),
	@Pass nvarchar(100),
	@FechaRegistro date,
	@FechaInicio date,
	@FechaFin date,
	@Tipo nvarchar(50),
	@PeliculaID int,
	@FechaVisualizacion datetime
AS
BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY
		INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro)
		VALUES (@Nombre, @Email, @Pass, @FechaRegistro);

		DECLARE @UsuarioID int;
		SET @UsuarioID = SCOPE_IDENTITY();

		INSERT INTO Suscripciones(UsuarioID, FechaInicio, FechaFin, Tipo)
		VALUES (@UsuarioID, @FechaInicio, @FechaFin, @Tipo);


		INSERT INTO HistorialVisualizacion(UsuarioID, PeliculaID, FechaVisualizacion)
		VALUES (@UsuarioID, @PeliculaID, @FechaVisualizacion)	

		COMMIT TRANSACTION;
	END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	DECLARE @ErrorMessage nvarchar (4000);
	SET @ErrorMessage = ERROR_MESSAGE();
PRINT @ErrorMessage
END CATCH
END;

EXEC sp_InsertarUsuario_Suscripcion_Visualizacion 'Juan Pérez', 'juan@example.com', 'password123', '2024-07-01', '2024-07-01', '2024-12-31', 'Premium', 1, '2024-07-02 18:30:00';
EXEC sp_InsertarUsuario_Suscripcion_Visualizacion 'María López', 'maria@example.com', 'maria456', '2024-07-03', '2024-07-03', '2024-12-31', 'Estándar', 4, '2024-07-03 20:45:00';
EXEC sp_InsertarUsuario_Suscripcion_Visualizacion 'Carlos Rodríguez', 'carlos@example.com', 'carlos789', '2024-06-30', '2024-06-30', '2024-12-31', 'Premium', 9, '2024-07-01 22:15:00';


SELECT * FROM Usuarios
SELECT * FROM Suscripciones
SELECT * FROM HistorialVisualizacion
----------------------------------------------------------------
CREATE PROCEDURE sp_ActualizarCorreoYTipoSuscripcion
    @UsuarioID INT,
    @Email NVARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Usuarios
        SET Email = @Email
        WHERE UsuarioID = @UsuarioID;

        UPDATE Suscripciones
        SET Tipo = 'Anual (Premium)'
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH
END;

EXEC sp_ActualizarCorreoYTipoSuscripcion 1, 'juan.nuevo@example.com';
EXEC sp_ActualizarCorreoYTipoSuscripcion 2, 'maria.nuevo@example.com';
EXEC sp_ActualizarCorreoYTipoSuscripcion 3, 'carlos.nuevo@example.com';

SELECT * FROM Usuarios
SELECT * FROM Suscripciones
-------------------------------------------------------------------
CREATE PROCEDURE sp_EliminarUsuarioYSusDatos
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH
END;


EXEC sp_EliminarPeliculaYBorrarRegistroHistorial 1, 70;
EXEC sp_EliminarPeliculaYBorrarRegistroHistorial 2, 71;
EXEC sp_EliminarPeliculaYBorrarRegistroHistorial 3, 72;

SELECT * FROM HistorialVisualizacion

---------------------------------------------------------------------------
CREATE PROCEDURE sp_EliminarUsuarioYSusDatos
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH
END;

EXEC sp_EliminarUsuarioYSusDatos 6;
EXEC sp_EliminarUsuarioYSusDatos 5;
EXEC sp_EliminarUsuarioYSusDatos 8;

SELECT * FROM Usuarios


