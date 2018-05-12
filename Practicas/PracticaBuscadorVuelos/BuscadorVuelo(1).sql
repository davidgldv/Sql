DROP DATABASE IF EXISTS BuscadorVuelos;
CREATE DATABASE IF NOT EXISTS BuscadorVuelos;
USE BuscadorVuelos;

CREATE TABLE AEROPUERTO(
	CodigoIATA CHAR(3) NOT NULL,
	Nombre VARCHAR(50) ,
	Ciudad VARCHAR(50),
	Pais VARCHAR(50),
	CONSTRAINT PK_AEROPUERTO PRIMARY KEY (CodigoIATA,Nombre));

/* Elegimos el codigo y el nombre como clave principal porque no se puede identificar de manera unica la una sin la otra*/

CREATE TABLE TERMINALES(
	Numero VARCHAR(3),
	CodigoIATA_AEROPUERTO CHAR(3) NOT NULL,
	Nombre_AEROPUERTO VARCHAR(50) NOT NULL,
	CONSTRAINT UK_NUMERO_TERMINALES   UNIQUE KEY (Numero),
	CONSTRAINT FK_CODIATA_NOMBRE_AEROPUERTO_TERMINALES FOREIGN KEY (CodigoIATA_AEROPUERTO, Nombre_AEROPUERTO) REFERENCES AEROPUERTO (CodigoIATA,Nombre));

/*Declaramos como foreing key CodigoIATA y nombre de la tabla AEROPUERTO*/

CREATE TABLE COMPAÑIA(
	Codigo VARCHAR(20),
	Nombre VARCHAR(40),
	Logo TEXT,
	CONSTRAINT PK_COMPAÑIA PRIMARY KEY (Codigo));

/*Elegimos codigo como clave principal porque se identifican de manera unica
La modificamos y la creamos la tercera para poder declararla despues*/

CREATE TABLE AVION(
	Codigo VARCHAR(20),
	Modelo VARCHAR(20),
	Codigo_COMPAÑIA VARCHAR(3),
	NºAsientos INT(4),
	CONSTRAINT PK_AVION PRIMARY KEY (Codigo),	
	CONSTRAINT FK_COMPAÑIA_AVION FOREIGN KEY (Codigo_COMPAÑIA) REFERENCES COMPAÑIA (Codigo));
/*Creamos la tabla vuelo porque en algunos vuelos te indican el modelo del avion y a que compañia pertenencen.Ademas para la tabla Asientos indicar a que avion pertenecen y añadimos algunos campos para completar al tabla.*/

CREATE TABLE ASIENTOS(
	Codigo VARCHAR(4),
	Clase ENUM ('Business','Turista', 'Turista superior', 'Primera'),
	Codigo_AVION VARCHAR(20),	
	CONSTRAINT PK_Codigo_ASIENTOS PRIMARY KEY(Codigo),
	CONSTRAINT FK_COIDGO_AVION FOREIGN KEY (Codigo_AVION) REFERENCES AVION (Codigo));

/*Tipo de clase lo declaramos con ENUM para poder elegir una de esas dos clases descritas y elegimos codigo como clave principal*/

CREATE TABLE VUELO(
	Codigo VARCHAR(20),
	Codigo_COMPAÑIA VARCHAR(20), 
	Modelo_AVION VARCHAR(30),
	CodigoIATA_Origen CHAR(3),
	Nombre_Origen VARCHAR(50),	
	CodigoIATA_Destino CHAR(3),
	Nombre_Destino VARCHAR(50),
	Numero_TERMINALES_ORIGEN VARCHAR(3),
	Numero_TERMINALES_DESTINO VARCHAR(3),
	DuraciónVuelo VARCHAR (20),
	Estado ENUM ('Cancelado','Retrasado','Embarque','Finalizado'),
	Fecha_IDA DATE NOT NULL,
	Fecha_VUELTA DATE,
	Hora_Salida TIME,
	Hora_Llegada TIME,
	Hora_Embarque TIME,
	Escalas ENUM ('Directo','1 escala','2 escalas'),	
	AsientosDisponibles INT ,
	Equipaje_de_Mano ENUM ('Incluido','No incluido'),	
	CONSTRAINT PK_CODIGO_VUELO PRIMARY KEY (Codigo),
	CONSTRAINT FK_CODIGO_COMPAÑIA_VUELO FOREIGN KEY (Codigo_COMPAÑIA) REFERENCES COMPAÑIA (Codigo),
	CONSTRAINT FK_CODIATA_NOMBRE_ORIGEN_VUELO FOREIGN KEY (CodigoIATA_Origen,Nombre_Origen) REFERENCES AEROPUERTO (CodigoIATA,Nombre),
	CONSTRAINT FK_CODIATA_NOMBRE_DESTINO_VUELO FOREIGN KEY (CodigoIATA_Destino, Nombre_Destino) REFERENCES AEROPUERTO (CodigoIATA, Nombre),
	CONSTRAINT FK_NUMERO_TERMINAL_ORIGEN_VUELO FOREIGN KEY  (Numero_TERMINALES_ORIGEN) REFERENCES TERMINALES (Numero),
	CONSTRAINT FK_NUMERO_TERMINAL_DESTINO_VUELO FOREIGN KEY (Numero_TERMINALES_DESTINO) REFERENCES TERMINALES (Numero));
	
/*Faltaban campos y hemos añadido Horade_Salida , Horade_Llegada, Terminal_Origen y Terminal_Destino,

Tambien hemos sustitudido el campo AeropuertoOrigen/Destino por CodigoIATA/Nombre_Origen/Destino para declararlas como foreign keys.

El campo fecha lo hemos sustituido por Fecha de Ida que no puede ser NULA y Fecha de Vuelta que si poruqe puede ser un billete solo de ida.

TAmbien añadimos el numero de la ternimal de ida y la de vuelta para saber a que terminal debe ir el cliente.

Los  campos ModeloAvion, DuracionVuelo,equipaje_de_Mano, AsientosDisponibleslo hemos añadido para completar la tabla.*/

CREATE TABLE PASAJEROS(
	DNI CHAR(9) NOT NULL,
	Nombre VARCHAR(20) ,
	Apellido1 VARCHAR(30) NOT NULL,
	Apellido2 VARCHAR(40) DEFAULT NULL,
	Edad  INT(3) NOT NULL,
	Tipo ENUM ('Adulto','Niño','Bebe'),
	Discapacidad ENUM ('Si', 'No'),
	CONSTRAINT PK_DNI_PASAJEROS PRIMARY KEY (DNI));

/*Elegimos DNI como clave principal.
Añadimos el campo Tipo para saber si es un adulto niño o bebe el pasajero.
Añadimos los campos de Edad y Discapacidad para completar la tabla */


CREATE TABLE RESERVA(
	Localizador VARCHAR(20),
	DNI_CLIENTE CHAR(9) NOT NULL,
	Codigo_ASIENTOS VARCHAR(4),
	MALETAS_PREFACTURADAS_IDA ENUM ( 'Sin equipaje','1 maleta hasta 23Kg') NOT NULL,
	MALETAS_PREFACTURADAS_VUELTA ENUM ( 'Sin equipaje','1 maleta hasta 23Kg') NOT NULL,
	MALETAS_MANO_IDA ENUM ('Si','No'),
	MALETAS_BODEGA ENUM ('0','1','2','3'),
	Precio FLOAT(4.2) UNSIGNED NOT NULL ,
	Codigo_VUELO VARCHAR (20),
	CONSTRAINT PK_RESERVA PRIMARY KEY (Localizador, DNI_CLIENTE),
	CONSTRAINT FK_CODIGO_ASIENTOS_RESERVA FOREIGN KEY (Codigo_ASIENTOS) REFERENCES ASIENTOS (Codigo),
	CONSTRAINT FK_CODIGO_VUELO_RESERVA FOREIGN KEY (Codigo_VUELO) REFERENCES VUELO (Codigo));

/*Declaramos localizador y DNI_CLIENTE como primary key para identificar de manera unica.
Borramos la tabla Reserva_Vuelos porque los datos eu contienen uno es de esta tabla y el otro deberia estar aqui para que todos los datos de la reserva concuerden.
Hemos añadido los campo de Maletas porque se pueden prefacturar para una reduccion de precio,Un campo de ida y otro de vuelta
Ademas hemso añadido los Codigo_ASIENTOS,Clase_ASIENTOS para completar la tabla */

CREATE TABLE  BILLETE (
	Localizador_RESERVA VARCHAR(20),
	DNI_PASAJERO CHAR(9), 
	Codigo_VUELO VARCHAR (20),
	GATE VARCHAR (10),
	Codigo_ASIENTOS VARCHAR(4),
	CONSTRAINT FK_LOCALIZADOR_RESERVA_BILLETE FOREIGN KEY (Localizador_RESERVA) REFERENCES RESERVA (Localizador),
	CONSTRAINT FK_DNI_PASAJEROS_BILLETE FOREIGN KEY (DNI_PASAJERO) REFERENCES PASAJEROS (DNI), 
	CONSTRAINT FK_VUELO_BILLETE FOREIGN KEY (Codigo_VUELO) REFERENCES VUELO (Codigo),
	CONSTRAINT FK_ASIENTO_BILLETE FOREIGN KEY (Codigo_ASIENTOS) REFERENCES ASIENTOS (Codigo));

/*Creamos la tabla billete para especificar la reserva del vuelo a cada pasajero ,con hacer una llamada a las tablas sacamos los datos que necesitamos mas unos campos extra*/
/*Para esta tabla damos por supuesto que el localizador de la reserva es el mismo para todos los pasajeros de una misma reserva pero cada uno tiene que tener su asiento y su billete especifico*/
/*La tabla billete se puede omitir porque podemos obtener todos los datos mediante consultas a otras tablas y no es necesario almacenar esos datos en otra tabla*/
/*Podemos eliminar la tabla RESERVA_VUELOS porque al suponer que la ida tiene una reserva y la vuelta otra no tendria que sugir conflictos ni es necesario la creaccion de otra tabla para almacenar varios codigos de vuelo en una misma reserva*/
/*Tambien pensamos en crear la tabla maletas pero vimos que no era necesario ya que realmente en el buscador de vuelo solo te deja o equipaje de mano o una malea prefacturada las demas tienen que ser en el checking  y no tienen porque pertenecer a la base de datos del comparador tendra que pertenecer a la de la compañia*/


