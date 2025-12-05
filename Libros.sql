USE Libros;

--Crear la tabla Autores
CREATE TABLE Autores (
   id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   Nombre VARCHAR(64) NOT NULL,
   Apellidos VARCHAR(64) NOT NULL
);

--Crear la tabla titulos
CREATE TABLE Titulos(
     Isbn VARCHAR(20) NOT NULL PRIMARY KEY,
     Titulo VARCHAR(120) NOT NULL,
     NumeroDeEdicion INT,
     AnioDePublicacion CHAR(4),
);

CREATE TABLE TituloAutor(
   Isbn VARCHAR(20) NOT NULL,
   IdAutor INT NOT NULL, 
   PRIMARY KEY (Isbn,IdAutor),
   FOREIGN KEY (Isbn) REFERENCES Titulos(Isbn),
   FOREIGN KEY (IdAutor) REFERENCES Autores(id)
);

-- Insertar datos en la tabla Autores
INSERT INTO Autores
   (Nombre,Apellidos)
   VALUES('Roger','Pressmann');

INSERT INTO Autores
(Apellidos,Nombre)
   VALUES ('Summmerville','Ian');

INSERT INTO Autores
   VALUES('Robert','Martin');

INSERT INTO Autores
   VALUES('Harvey','Deitel'),
         ('Paul','Deitel'),
         ('Andrew','Deitel');


DROP TABLE Autores;
DROP TABLE Titulos;

INSERT INTO Titulos
VALUES ('013183452703','Ingenieria de Software','10','2017'),
       ('013145771287','C# Como Programar','4','2014'),
       ('013145771976','Visual Basic Como Programar','2','2011'),
       ('013155761784','Ingenieria del Software','11','2018');

INSERT INTO TituloAutor
VALUES ('013183452703', 1),
	   ('013145771287', 4),
       ('013145771287', 5),
	   ('013145771976', 4),
       ('013145771976', 5),
       ('013145771976', 6),
	   ('013155761784',2);

UPDATE Titulos
SET AnioDePublicacion = '2018',
    NumeroDeEdicion = 11
WHERE Isbn = '013183452703'

UPDATE Titulos
SET AnioDePublicacion = '2013'
WHERE Isbn = '013183452703' OR Isbn = '013145771976'

-- El comando SELECT 
-- Permite obtener datos de una o más tablas
SELECT id, Nombre, Apellidos 
      FROM Autores;

SELECT * 
   FROM Autores;

SELECT * 
   FROM Titulos;

SELECT * 
   FROM TituloAutor;

SELECT Nombre, Apellidos
   FROM Autores; 

SELECT * 
   FROM Autores
   WHERE id= 2

SELECT * 
   FROM Autores
   WHERE Apellidos = 'Deitel';

SELECT * 
   FROM Titulos;

SELECT * 
   FROM Titulos
   WHERE NumeroDeEdicion = 2 
   OR AnioDePublicacion = '2013';

SELECT * 
   FROM Titulos
   WHERE NumeroDeEdicion < 4;

SELECT Titulo
   FROM TituloAutor 
   INNER JOIN Autores ON TituloAutor.IdAutor = Autores.id
   INNER JOIN Titulos ON TituloAutor.Isbn = Titulos.Isbn
   WHERE Apellidos = 'Summmerville'

