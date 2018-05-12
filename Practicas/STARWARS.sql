DROP DATABASE IF EXISTS STARWARS;
CREATE DATABASE STARWARS;
USE STARWARS;

CREATE TABLE ACTORES( 
	Codigo  INT(2) UNSIGNED AUTO_INCREMENT,
	Nombre VARCHAR(80),
	Fecha DATE,
	Nacionalidad VARCHAR (20),
	CONSTRAINT PK_ACTORES PRIMARY KEY (Codigo));

CREATE TABLE PERSONAJES(
	Nombre VARCHAR(20),
	Codigo INT(2) UNSIGNED AUTO_INCREMENT,
	Raza VARCHAR(20),
	Grado VARCHAR(10),
	Codigo_ACTORES INT NOT NULL UNSIGNED ,
	CodigoSuperior_PERSONAJES INT NOT NULL UNSIGNED ,
	CONSTRAINT PK_PERSONAJES PRIMARY KEY (Codigo),
	CONSTRAINT FK_ACTORES FOREIGN KEY (Codigo_ACTORES) REFERENCES ACTORES (Codigo));
	CONSTRAINT FK_PERSONAJES FOREIGN KEY (CodigoSuperior_PERSONAJES) REFERENCES PERSONAJE (Codigo));

CREATE TABLE PLANETAS(
	Codigo INT(2) UNSIGNED AUTO_INCREMENT,
	Galaxia VARCHAR(20),
	Nombre VARCHAR(20),
	CONSTRAIN PK_PLANETAS PRIMARY KEY (Codigo));

CREATE TABLE PELICULAS(
	Codigo INT(2) UNSIGNED AUTO_INCREMENT,
	Titulo VARCHAR(20),
	Director VARCHAR(20),
	Año YEAR,
	CONSTRAIN PK_PELICULAS PRIMARY KEY (Codigo));

CREATE TABLE PERSONAJES_PELICULAS(
	Codigo_PERSONAJES INT(2) NOT NULL UNSIGNED ,
	Codigo_PELICULAS INT(2) NOT NULL UNSIGNED ,
	CONSTRAIN FK_PERSONAJES FOREIGN KEY (Codigo_PERSONAJES) REFERENCES PERSONAJES (Codigo);
	CONSTRAIN FK_PELICULAS FOREIGN KEY (Codigo_PELICULAS) REFERENCES PELICULAS (Codigo));

CREATE TABLE NAVES (
	Codigo INT(2)  UNSIGNED AUTOINCREMENT,
	NºTripulantes INT(11),
	Nombre VARCHAR (30),
	CONSTRAIN PK_NAVES PRIMARY KEY (Codigo));

CREATE TABLE VISITAS(
	Codigo_NAVES INT NOT NULL UNSIGNED,
	Codigo_PLANETAS INT NOT NULL UNSIGNED,
	Codigo_PELICULAS INT NOT NULL UNSIGNED,
	CONSTRAIN FK_NAVES FOREIGN KEY (Codigo_NAVES) REFERENCES NAVES (Codigo),
	CONSTRAIN FK_PLANETAS FOREIGN KEY (Codigo_PLANETAS) REFERENCES PLANETAS (Codigo),
	CONSTRAIN FK_PELICULAS FOREIGN KEY (Codigo_PELICULAS) REFERENCES PELICULAS (Codigo));

INSERT INTO ACTORES (Codigo,Nombre,Fecha,Nacionalidad) VALUES
	('1','Mark Hamill ','1951/11/25','Estadounidense'),
	('2','Ian McDiamid', '1944/08/11', 'Escoces'),
	('3','Hayden Christensen','1981/04/19','Canadiense'),
	('4','Ewan McGregor','1971/03/31,','Britanico'),
	('5','Carrie Fisher','1956/10/21','Estadounidense'),
	('6','Harrison Ford','1942/06/13', 'Estadounidense'));

INSERT INTO PERSONAJE (Nombre,Codigo,Raza,Grado,Codigo_Actores,CodigoSuperior_PERSONAJES) VALUES
	('Luke Skywalker','1','Humano','1','1','1'),
	('Sheec Palpatine','2','Humano','1','2','2'),
	('Darth Vader', '3','Humano','1','3','3'),
	('Obi-Wan Kenovi','4','Humano','1','4','4'),
	('Leia Organa','5','Huamano','2','5','5'),
	('Han Solo','6','Humano','2','6','6',));

INSERT INTO PLANETAS (Codigo,Galaxia,Nombre) VALUES
	('1','Arkanis','Tatooine'),
	('2','Borde Exterior','Hoth'),
	('3','Alderann','Alderaan'),
	('4','Corusant','Coruscant'),
	('5','Moddel','Endor'),
	('6','Borde Medio','Naboo'));

INSERT INTO PELICULAS (Codigo,Titulo,Director,Año) VALUES
	('1','Star Wars:Episodio I - La Amenaza Fantasma','George Lucas','1999'),
	('2','Star Wars:Episodio II - El ataque de los clones','George Lucas','2002'),
	('3','Star Wars:Episodio III - La Venganza de los Sith','George Lucas','2005'),
	('4','Star Wars:Episodio IV - Una nueva esperanza','George Lucas','1977'),
	('5','Star Wars:Episodio V - El Imperio contraataca','Irvin Kershner','1980'),
	('6','Star Wars:Episodio VI - El Retorno del Jedi','Richar Marquand','1983'),
	('7','Star Wars:Episodio VII - El desperetar de la fuerza ','J.J.Abrams','2015'),
	('8','Star Wars:Episodio VIII - El ultimo Jedi','Rian Johnson','2017'),
	('9','Star Wars:Episodio IX ','NULL','2018'));

INSERT INTO PERSONAJES_PELICULAS (Codigo_PERSONAJES,Codigo_PELICULAS) VALUES
	('1','3'),('1','4'),('1','5'),('1','6'),('1','7'),('1','8'),
	('2','1'),('2','2'),('2','3'),('2','4'),('2','5'),('2','6'),
	('3','3'),('3','4'),('3','5'),('3','6'),
	('4','1'),('4','2'),('4','3'),('4','4'),,
	('5','3'),('5','4'),('5','5'),('5','6'),('5','7'),
	('6','3'),('6','4'),('6','6'),('6','7'),('6','8'));

INSERT INTO NAVES(Codigo,NºTripulantes,Nombre) VALUES 
	('1','20','Halcon Milenario'),
	('2','4','Ala Y'),
	('3','2','Ala X'),
	('4','4','Firespray-31'),
	('5','2','Caza TIE'),
	('6','2','Aerodeslizador T-47'));

INSERT INTO VISITAS(Codigo_NAVES,Codigo_Planetas,Codigo_PELICULAS) VALUES 
	('1','1','4'),
	('1','2','5'),
	('1','3','4'),
	('1','5','6'),
	('6','2','5'));




 
	
