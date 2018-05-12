/*Estas modificacion son para poder añadir a los campos el caracter 'ñ' o los acentos y que no nos de erros a la hora de introducir datos*/
ALTER TABLE AEROPUERTO 	CHARACTER SET "UTF8mb4";
ALTER TABLE TERMINALES 	CHARACTER SET "UTF8mb4";
ALTER TABLE COMPAÑIA  	CHARACTER SET "UTF8mb4";
ALTER TABLE ASIENTOS  	CHARACTER SET "UTF8mb4";
ALTER TABLE AVION 	CHARACTER SET "UTF8mb4";
ALTER TABLE VUELO 	CHARACTER SET "UTF8mb4";
ALTER TABLE PASAJEROS 	CHARACTER SET "UTF8mb4";
ALTER TABLE RESERVA 	CHARACTER SET "UTF8mb4";
ALTER TABLE BILLETE 	CHARACTER SET "UTF8mb4";

/*Estas modificaciones son simplemente para ver que se pueden realizar las modificaciones requeriadas en la practica pero los campos que añadimos o propiedades luego desaremos esas modificaciones para que la estructura se quede como estaba excepto alguna peuqeña modificacion*/

/*Añadimos un campo a la tabla AEROPUERTO para completarla, al final borramos el data para la posterior inserccion de datos*/
ALTER TABLE AEROPUERTO ADD COLUMN VuelosMaxDisponibles INT(11);
ALTER TABLE AEROPUERTO DROP COLUMN VuelosMaxDisponibles;

/*Creamos un campo id para declararlo como primary key aunque luego lo borremos para su posteriorinserccion de datos con la estructura actual,ademas eliminos uan foreign key*/

ALTER TABLE BILLETE ADD COLUMN ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL;
ALTER TABLE BILLETE DROP FOREIGN KEY FK_ASIENTO_BILLETE;
ALTER TABLE BILLETE ADD CONSTRAINT FK_ASIENTO_BILLETE1 FOREIGN KEY (Codigo_ASIENTOS) REFERENCES ASIENTOS(Codigo);
ALTER TABLE BILLETE DROP COLUMN ID;

/*Para borrar el campo numero de terminal debemos eliminar todas las foreign key a las que apunta luego quitarle la propiedad UNIQUE aunque al eliminar el campo se elimina la propiedad y despues volvemos a crearlas para su posterior utilizacion en la inserccion de datos*/

ALTER TABLE VUELO DROP FOREIGN KEY FK_NUMERO_TERMINAL_ORIGEN_VUELO;
ALTER TABLE VUELO DROP FOREIGN KEY FK_NUMERO_TERMINAL_DESTINO_VUELO;
ALTER TABLE TERMINALES DROP INDEX UK_NUMERO_TERMINALES;
/*Entre estas modificaciones borrariamos la tabla numero y luego la volvriamos a crear para añadir las foreign keys de nuevo para su posterior uso*/
/*ALTER TABLE TERMINALES DROP COLUMN Numero;
/*ALTER TABLE TERMINALES ADD COLUMN Numero VARCHAR(3);*/
ALTER TABLE TERMINALES ADD CONSTRAINT UK_NUMERO_TERMINALES UNIQUE KEY (Numero);
ALTER TABLE VUELO ADD CONSTRAINT FK_NUMERO_TERMINAL_DESTINO_VUELO1  FOREIGN KEY (Numero_TERMINALES_DESTINO) REFERENCES TERMINALES(Numero);
ALTER TABLE VUELO ADD CONSTRAINT FK_NUMERO_TERMINAL_ORIGEN_VUELO1  FOREIGN KEY (Numero_TERMINALES_ORIGEN) REFERENCES TERMINALES(Numero);



 

