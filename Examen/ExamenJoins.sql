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

INSERT INTO Autores(nombre, pais_origen) VALUES 

('Robert Kirkman', 'USA',),
('Allan Moore', 'Canada'