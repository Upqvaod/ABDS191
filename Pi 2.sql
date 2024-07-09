-------Joins---------
CREATE VIEW vista_usuarios_membresias AS
SELECT 
    Usuario.id_usuario,
    Usuario.nombre,
    Usuario.apellido,
    Usuario.correo_electronico,
    Membresias.nombre_membresia,
    Membresias.costo,
    Membresias.fecha_inicio,
    Membresias.fecha_caducidad
FROM 
    Usuario
JOIN 
    Membresias ON Usuario.id_membresia = Membresias.id_membresia;

SELECT * FROM vista_usuarios_membresias;


CREATE VIEW vista_consultas_expertos AS
SELECT 
    Consulta.id_consulta,
    Consulta.fecha_consulta,
    Consulta.hora,
    Consulta.duracion,
    Experto.especialidad,
    Usuario.nombre AS nombre_usuario,
    Usuario.apellido AS apellido_usuario
FROM 
    Consulta
JOIN 
    Experto ON Consulta.id_experto = Experto.id_experto
JOIN 
    Usuario ON Consulta.id_usuario = Usuario.id_usuario;

SELECT * FROM vista_consultas_expertos;


CREATE VIEW sp_vista_publicaciones_comentarios AS
SELECT 
    Publicaciones.id_publicacion,
    Publicaciones.titulo AS titulo_publicacion,
    Publicaciones.descripcion AS descripcion_publicacion,
    Publicaciones.fecha_publicacion AS fecha_publicacion_publicacion,
    Comentarios.id_comentarios,
    Comentarios.descripcion AS descripcion_comentario,
    Comentarios.fecha_publicacion AS fecha_publicacion_comentario
FROM 
    Publicaciones
JOIN 
    Comentarios ON Publicaciones.id_usuario = Comentarios.id_usuario;


SELECT * FROM sp_vista_publicaciones_comentarios;

-----Stored Procedures-----
CREATE PROCEDURE sp_insertar_usuario
	@id_usuario int, 
    @nombre NVARCHAR(100),
    @apellido NVARCHAR(100),
	@correo_electronico NVARCHAR(100),
    @id_membresia INT,
    @id_genero INT
AS
BEGIN

    INSERT INTO Usuario (id_usuario, nombre, apellido, correo_electronico, id_membresia, id_genero)
    VALUES (@id_usuario, @nombre, @apellido, @correo_electronico, @id_membresia, @id_genero);
END;

EXEC sp_insertar_usuario 15, 'Karen', 'Ortiz', 'K.aren@example.com', 1, 1;
EXEC sp_insertar_usuario 16, 'Israel', 'Fernandez', 'Pedro.123@example.com', 1, 2;
EXEC sp_insertar_usuario 17, 'Juan', 'Chavero', 'juan@example.com', 1, 1;

SELECT * FROM Usuario

CREATE PROCEDURE sp_insertar_membresia
	@id_membresia int,
    @nombre_membresia NVARCHAR(100),
    @costo DECIMAL(10, 2),
    @fecha_inicio DATE,
    @fecha_caducidad DATE
AS
BEGIN
    INSERT INTO Membresias (id_membresia, nombre_membresia, costo, fecha_inicio, fecha_caducidad)
    VALUES (@id_membresia, @nombre_membresia, @costo, @fecha_inicio, @fecha_caducidad);
END;

EXEC sp_insertar_membresia 3,'Estandar con anuncios', 99.99, '2024-01-01', '2025-01-01';
EXEC sp_insertar_membresia 4, 'Gratuita', 0, '2024-01-01', '2025-01-01';
EXEC sp_insertar_membresia 5, 'Estandar', 200.00, '2024-01-01', '2025-01-01';

SELECT * FROM Membresias

CREATE PROCEDURE sp_insertar_consulta
    @id_consulta int,
	@fecha_consulta DATE,
    @hora TIME,
    @duracion INT,
    @id_experto INT,
    @id_usuario INT
AS
BEGIN
    INSERT INTO Consulta (id_consulta,  fecha_consulta, hora, duracion, id_experto, id_usuario)
    VALUES (@id_consulta, @fecha_consulta, @hora, @duracion, @id_experto, @id_usuario);
END;

EXEC sp_insertar_consulta 3,'2024-07-10', '00:23:54', 60, 2, 15;
EXEC sp_insertar_consulta 4,'2025-03-12', '22:02:00', 40, 2, 16;
EXEC sp_insertar_consulta 5, '2023-12-20', '15:12:00', 120, 3, 17;


SELECT * FROM Consulta


CREATE PROCEDURE sp_insertar_publicacion
	@id_publicacion int,
    @titulo NVARCHAR(200),
    @descripcion TEXT,
    @fecha_publicacion DATE,
    @id_usuario INT
AS
BEGIN
    INSERT INTO Publicaciones (id_publicacion, titulo, descripcion, fecha_publicacion, id_usuario)
    VALUES (@id_publicacion, @titulo, @descripcion, @fecha_publicacion, @id_usuario);
END;

EXEC sp_insertar_publicacion 6, 'Nuevas plagas en verano', 'Lorem ipsum', '2024-07-04', 4;
EXEC sp_insertar_publicacion 7, 'Nuevas plagas primavera', 'Lorem ipsum', '2024-03-04', 2;
EXEC sp_insertar_publicacion 8, 'Nuevas plagas en invierno', 'Lorem ipsum', '2024-10-04', 3;

SELECT * FROM Publicaciones

	CREATE PROCEDURE sp_insertar_comentario
		@id_comentarios int,
		@descripcion TEXT,
		@fecha_publicacion DATE,
		@id_usuario INT
	AS
	BEGIN
		INSERT INTO Comentarios (id_comentarios, descripcion, fecha_publicacion, id_usuario)
		VALUES (@id_comentarios, @descripcion, @fecha_publicacion, @id_usuario);
	END;

	EXEC sp_insertar_comentario 1, 'Creo que puede emplear este otro metodo en...', '2024-07-04', 2;
	EXEC sp_insertar_comentario 11, 'Deberias utilizar este otro producto sobre...', '2024-07-04', 3;
	EXEC sp_insertar_comentario 12, 'Si ocurre con frecuencia en tus zanahorias es porque...', '2024-07-04', 14;

SELECT * FROM Comentarios

---------Transacciones---------
CREATE PROCEDURE t_insertar_usuario_y_membresia
	@id_membresia INT,
	@id_usuario INT,
    @nombre NVARCHAR(100),
    @correo_electronico NVARCHAR(100),
    @apellido NVARCHAR(100),
    @id_genero INT,
    @nombre_membresia NVARCHAR(100),
    @costo DECIMAL(10, 2),
    @fecha_inicio DATE,
    @fecha_caducidad DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO Membresias (id_membresia, nombre_membresia, costo, fecha_inicio, fecha_caducidad)
        VALUES (@id_membresia ,@nombre_membresia, @costo, @fecha_inicio, @fecha_caducidad);


        INSERT INTO Usuario (id_usuario, nombre, correo_electronico, apellido, id_membresia, id_genero)
        VALUES (@id_usuario, @nombre, @correo_electronico, @apellido, @id_membresia, @id_genero);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

EXEC t_insertar_usuario_y_membresia 6, 18, 'Diego', 'qwerty@example.com', 'Valdelamar', 1, 'Pase anual', 599.99, '2024-07-01', '2025-07-01';
EXEC t_insertar_usuario_y_membresia 7, 19, 'Sergio', 'juan.perez@example.com', 'Olmedo', 1, 'Pase LTM', 1000.00, '2024-07-01', '2025-07-01';
EXEC t_insertar_usuario_y_membresia 8, 20, 'Artemio', 'juan.perez@example.com', 'Lopez', 1, 'Gratuito', 0.00, '2024-07-01', '2025-07-01';


SELECT * FROM Usuario
SELECT * FROM Genero
SELECT * FROM Membresias




