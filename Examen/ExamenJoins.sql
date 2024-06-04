CREATE TABLE Autores (
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);

ALTER TABLE Comics
ADD id_autor bigint,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);

SELECT * FROM Comics;

SELECT * FROM Autores;

SELECT * FROM Comic_Compras;

INSERT INTO Autores(nombre, pais_origen) VALUES 

('Robert Kirkman', 'USA'),
('Allan Moore', 'Canada'),
('Stan Lee', 'USA'),
('Pepito', 'Mexico');

INSERT INTO Comics(id_autor) VALUES 
(300),(301),(302),(303),(300),(301),(302),(303),(300),(301),(302) ;


SELECT c.nombre as 'Nombre del comic', a.nombre as 'Autor', a.pais_origen as 'Pais de Origen'
FROM Comics c
LEFT JOIN Autores a ON c.id_autor = a.id_autor


SELECT a.nombre, c.cantidad
FROM Autores a
JOIN Comics co ON a.id_autor = co.id_autor
JOIN comic_compras c on c.id_comic = co.id_comic


SELECT * FROM Comic_Compras;

