INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) VALUES
('Juan Perez', 'juan.perez@example.com', 'password123', '2023-01-15'),
('Maria Lopez', 'maria.lopez@example.com', 'maria2023', '2023-02-10'),
('Carlos Ramirez', 'carlos.ramirez@example.com', 'carlosPass!', '2023-03-05'),
('Ana Torres', 'ana.torres@example.com', 'ana_1234', '2023-04-20'),
('Luis Fernandez', 'luis.fernandez@example.com', 'luisPass', '2023-05-30'),
('Elena Sanchez', 'elena.sanchez@example.com', 'elenaSecure', '2023-06-12'),
('Roberto Diaz', 'roberto.diaz@example.com', 'roberto2024', '2023-07-19'),
('Laura Mendoza', 'laura.mendoza@example.com', 'laura789', '2023-08-25'),
('Fernando Gutierrez', 'fernando.gutierrez@example.com', 'fernando!pass', '2023-09-11'),
('Gabriela Ruiz', 'gabriela.ruiz@example.com', 'gabriela_pw', '2023-10-06');

INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) VALUES
('El Padrino', 'Drama', '1972-03-24'),
('Titanic', 'Romance', '1997-12-19'),
('Inception', 'Ciencia Ficción', '2010-07-16'),
('Jurassic Park', 'Aventura', '1993-06-11'),
('Matrix', 'Acción', '1999-03-31'),
('Toy Story', 'Animación', '1995-11-22'),
('El Señor de los Anillos: La Comunidad del Anillo', 'Fantasía', '2001-12-19'),
('Pulp Fiction', 'Crimen', '1994-10-14'),
('Avatar', 'Ciencia Ficción', '2009-12-18'),
('La La Land', 'Musical', '2016-12-09'),
('Parasite', 'Thriller', '2019-05-30');

INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES
(1, '2023-01-15', '2023-12-31', 'Premium'),
(2, '2023-02-10', NULL, NULL),
(3, '2023-03-05', '2024-03-04', 'Basica'),
(4, '2023-04-20', NULL, NULL),
(5, '2023-05-30', '2024-05-29', 'Premium'),
(6, '2023-06-12', '2024-06-11', 'Basica'),
(7, '2023-07-19', '2024-07-18', 'Basica');

INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion) VALUES
(1, 1, '2023-01-20'),
(2, 2, '2023-02-15'),
(3, 3, '2023-03-12'),
(4, 4, '2023-04-25'),
(5, 5, '2023-05-10'),
(6, 6, '2023-06-18'),
(7, 7, '2023-07-21'),
(8, 8, '2023-08-05'),
(9, 9, '2023-09-09'),
(10, 10, '2023-10-13'),
(11, 11, '2023-01-25'),
(12, 1, '2023-02-20'),
(13, 2, '2023-03-17'),
(14, 3, '2023-04-30'),
(15, 4, '2023-05-14'),
(16, 5, '2023-06-22'),
(17, 6, '2023-07-26'),
(18, 7, '2023-08-09'),
(19, 8, '2023-09-13'),
(20, 9, '2023-10-17');
