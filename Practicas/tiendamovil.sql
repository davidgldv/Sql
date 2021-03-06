DROP DATABASE IF EXISTS tiendamovil;
CREATE DATABASE tiendamovil;
USE tiendamovil;
CREATE TABLE CLIENTE( 
	DNI CHAR(9),
	Nombre VARCHAR(20),
	Apellidos VARCHAR(50),
	Telefono CHAR(9),
	Email TEXT,
	CONSTRAINT PK_CLIENTE PRIMARY KEY (DNI));
CREATE TABLE TIENDAS ( 
	Nombre VARCHAR (20) , 
	Provincia VARCHAR(20), 
	Localidad VARCHAR (30), 
	Dirección VARCHAR(50),
	Telefono CHAR(9),
	DiaApertura SET('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'),
	DiaCierre SET('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'),
	HoraApertura TIME NOT NULL,
	HoraCierre TIME NOT NULL, 
	CONSTRAINT PK_TIENDAS PRIMARY KEY (Nombre));
CREATE TABLE OPERADORAS(
	Nombre VARCHAR (20),
 	ColorLogo VARCHAR(20),
	PorcentajeCobertura int(3), 
	FrecuenciaGSM FLOAT (4.1),
	PaginaWeb TEXT ,
	CONSTRAINT PK_OPERADORAS PRIMARY KEY (Nombre));
CREATE TABLE TARIFAS(
	Nombre VARCHAR (20),
	Nombre_operadora VARCHAR(20),
	TamañoDatos INT(2),
	TipoDatos CHAR(2),
	MinutosGratis INT(11),
	SMSGratis INT(11),
	CONSTRAINT PK_TARIFAS PRIMARY KEY (Nombre));
CREATE TABLE MOVILES(
	Marca VARCHAR (20),
	Modelo VARCHAR(40),
	Descripcion TEXT,
	SO VARCHAR(20) NOT NULL,
	RAM VARCHAR(30) NOT NULL,
	PulgadasPantalla INT(2),
	CamaraMpx INT(2),
	CONSTRAINT PK_MOVILES PRIMARY KEY (Marca,Modelo));
CREATE TABLE MOVIL_LIBRE(
	Marca_MOVILES VARCHAR(20),
	Modelo_MOVILES VARCHAR(30),
	precio FLOAT NOT NULL,
	CONSTRAINT FK_MOVILES FOREIGN KEY (Marca_MOVILES,Modelo_MOVILES) REFERENCES MOVILES(Marca,Modelo));
CREATE TABLE MOVIL_CONTRATO(
	Marca_MOVILES VARCHAR(20),
	Modelo_MOVILES VARCHAR(30),
	Nombre_OPERADORAS VARCHAR(20),
	precio FLOAT NOT NULL, 
	CONSTRAINT FK_MOVILES FOREIGN KEY (Marca_MOVILES,Modelo_MOVILES) REFERENCES MOVILES(Marca,Modelo),
	CONSTRAINT FK_OPERADORA FOREIGN KEY (Nombre_OPERADORAS) REFERENCES OPERADORA (Nombre));
CREATE TABLE OFERTAS(
	Nombre_OPERADORAS_TARIFAS VARCHAR(20),
	Nombre_TARIFAS VARCHAR(20),
	Marca_MOVIL_CONTRATO VARCHAR(20),
	Modelo_MOVIL_CONTRATO VARCHAR(20),
	CONSTRAINT FK_TARIFAS FOREIGN KEY (Nombre_OPERADORAS_TARIFAS,Nombre_TARIFAS) REFRENCES TARIFAS (Nombre_OPERADORAS ,Nombre)
	CONSTRAINT FK_CONTRATO FOREIGN KEY (Marca_MOVIL_CONTRATO,Modelo_MOVIL_CONTRATO) REFERENCES MOVIL_CONTRATO (Marca_MOVILES,Modelo_MOVILES));
CREATE TABLE COMPRAS(
	DNI_CLIENTE CHAR(9),
	Nombre_TIENDA VARCHAR(20),
	Marca_MOVILES_LIBRE VARCHAR(20),
	Modelo_MOVILES_LIBRE VARCHAR(20),
	Dia DATE,
	CONSTRAINT FK_CLIENTE FOREING KEY (DNI_CLIENTE) REFERENCES CLIENTE (DNI),
	CONSTRAINT FK_TIENDA FOREING KEY (Nombre_TIENDA) REFERENCES TIENDA (Nombre),
	CONSTRAINT FK_LIBRE FOREIGN KEY (Marca_MOVIL_LIBRE,Modelo_MOVIL_LIBRE) REFERENCES MOVIL_CONTRATO (Marca_MOVILES,Modelo_MOVILES));
CREATE TABLE CONTRATOS(
	DNI_CLIENTE CHAR(9),
	Nombre_TIENDA VARCHAR(20),
	Nombre_OPERADORAS_TARIFAS_OFERTAS VARCHAR(20),
	Nombre_TARIFAS_OFERTAS VARCHAR(20),
	Marca_MOVILES_OFERTAS VARCHAR(20),
	Modelo_MOVILES_OFERTAS VARCHAR(20),
	Dia DATE,
	CONSTRAINT FK_CLIENTE1 FOREING KEY (DNI_CLIENTE) REFERENCES CLIENTE (DNI),
	CONSTRAINT FK_TIENDA1 FOREING KEY (Nombre_TIENDA) REFERENCES TIENDA (Nombre),
	CONSTRAINT FK_OFERTAS FOREIGN KEY (Nombre_OPERADORAS_TARIFAS_OFERTAS,Nombre_TARIFAS_OFERTAS) REFERENCES OFERTAS (Nombre_OPERADORAS_TARIFAS,Nombre_TARIFAS));
	CONSTRAINT FK_MOVILES_OFERTAS FOREIGN KEY (Marca_MOVILES_OFERTAS,Modelo_MOVILES_OFERTAS) REFERENCES OFERTAS (Marca_MOVILES,Modelo_MOVILES));


	



