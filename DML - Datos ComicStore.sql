INSERT INTO Clientes(nombre, correo_electronico, pass) VALUES 
	('Ana Torres', 'ana.torres@example.com', 'pass1234'),
    ('Carlos García', 'carlos.garcia@example.com', 'securePass1'),
    ('Beatriz Martín', 'beatriz.martin@example.com', 'myPassword!'),
    ('David Fernández', 'david.fernandez@example.com', 'P@ssw0rd'),
    ('Elena Ruiz', 'elena.ruiz@example.com', 'easypassword'),
    ('Fernando López', 'fernando.lopez@example.com', 'LopezPass'),
    ('Gabriela Sánchez', 'gabriela.sanchez@example.com', 'g@bby123'),
    ('Hugo Díaz', 'hugo.diaz@example.com', 'DiazSecure'),
    ('Isabel Gómez', 'isabel.gomez@example.com', 'IzzyPass!'),
    ('Jorge Jiménez', 'jorge.jimenez@example.com', 'Jorge1234'),
    ('Laura Herrera', 'laura.herrera@example.com', 'HerreraPWD'),
    ('Manuel Morales', 'manuel.morales@example.com', 'm@nuel789');

INSERT INTO Compras(id_cliente,fecha_compra, total) VALUES
	(1,'2024-05-01', 59.99),
    (2, '2024-05-03', 120.50),
    (3,'2024-05-05', 45.00),
    (4, '2024-05-07', 200.75),
    (5, '2024-05-10', 99.99),
    (6, '2024-05-12', 150.20),
    (7, '2024-05-14', 75.00),
	(1,'2024-05-16', 80.00),
    (3,'2024-05-18', 110.50),
    (5, '2024-05-20', 60.00);

INSERT INTO Comics(nombre, anio, precio) VALUES
	('X-MEN', 2020, 399.80),
    ('Batman', 2021, 599.80),
    ('Spider-man ', 2019, 310.00),
    ('Watchmen', 2023, 900.00),
    ('Captain America', 2022, 655.00),
    ('Daredevil', 2021, 546.00),
    ('Deadpool', 2020, 442.00),
    ('Teenage Mutant Ninja Turtles', 2018, 279.80),
    ('DeathStroke', 2019, 365.00),
    ('Invincible', 2023, 1110.00),
    ('Scott Pilgrim vs The World', 2022, 800.00),
    ('The Avengers', 2020, 435.00),
    ('Superman', 2021, 676.00),
    ('The Punisher', 2019, 508.00),
    ('Peanuts', 2023, 999.80);

INSERT INTO Inventario(cantidad_disponible, disponibilidad) VALUES
	(5, 'Disponible'),
    (3, 'Disponible'),
    (0, 'Agotado'),          
    (10, 'Disponible'),
    (2, 'Disponible'),
    (0, 'Agotado'),          
    (25, 'Disponible'),
    (4, 'Disponible'),
    (20, 'Disponible'),
    (1, 'Disponible'),
    (7, 'Disponible'),
    (3, 'Disponible'),
    (15, 'Disponible'),
    (8, 'Disponible'),
    (6, 'Disponible');

INSERT INTO Comic_Compras(cantidad, id_compra, id_comic) VALUES
	(3, 1, 1),
    (2, 2, 2),
    (5, 3, 1),
    (1, 4, 3),
    (4, 5, 2),
    (2, 6, 1),
    (3, 7, 2),
    (1, 8, 3),
    (5, 9, 1),
    (2, 10, 2);