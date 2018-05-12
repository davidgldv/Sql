INSERT INTO AEROPUERTO VALUES 
('MAD','Adolfo Suarez Madrid-Barajas','Madrid','España'),
('DME','Aeropuerto internacional de Moscu-Domodedovo','Moscu','Rusia'),
('EGE','Aeropuerto Regional del Condado de Eagle','Colorado','Estados Unidos'),
('HOR','Aeropuerto de Horta','Azores','Portugal'),
('IBZ','Aeropuerto de Ibiza','Ibiza','España');

INSERT INTO TERMINALES VALUES 
('T4','MAD','Adolfo Suarez Madrid-Barajas'),
('T1','IBZ','Aeropuerto de Ibiza'),
('T5','DME','Aeropuerto internacional de Moscu-Domodedovo'),
('T2','HOR','Aeropuerto de Horta'),
('T3','EGE','Aeropuerto Regional del Condado de Eagle');

INSERT INTO COMPAÑIA VALUES
('IBE','Iberia','/home/dani/imagenes/iberia.jpg'),
('ACA','AirCanada','/home/dani/imagenes/AirCanada.jpg'),
('EGF','EagleFlight','/home/dani/imagenes/EagleFlight.jpg'),
('EZY','EasyJet','/home/dani/imagenes/EasyJet.jpg'),
('AEA','AirEuropa','/home/dani/imagenes/AirEuropa.jpg');

INSERT INTO AVION VALUES 
('A255','Airbus','IBE','300'),
('B305','Boeing','ACA','500'),
('T200','Tupolev','EGF','250'),
('B777','Bombardier','AEA','400'),
('I804','Ilyushin','EZY','100');

INSERT INTO ASIENTOS VALUES 
('1A','Business','A255'),
('16G','Primera','B305'),
('10B','Turista','T200'),
('5C','Turista superior','B777'),
('4D','Primera','I804');

INSERT INTO VUELO VALUES 
('IB4572','IBE','Airbus','MAD','Adolfo Suarez Madrid-Barajas','IBZ','Aeropuerto de Ibiza','T4','T1','2H','Embarque','2018-03-12','2018-03-17','09:00:00','10:30:00','07:15:00','Directo','3','Incluido'),
('ACA557','ACA','Boeing','HOR','Aeropuerto de Horta','EGE','Aeropuerto Regional del Condado de Eagle','T2','T3','7H','Finalizado','2018-01-18','2018-02-23','12:30:00','19:30:00','10:30:00','Directo','0','Incluido'),
('EGF266', 'EGF','Tupolev','DME','Aeropuerto internacional de Moscu-Domodedovo','MAD','Adolfo Suarez Madrid-Barajas','T5','T4','4H','Retrasado','2018-03-02','2018-03-02','13:15:00','17:15:00','11:00:00','1 escala','2','Incluido'),
('EZY411','EZY','Ilyushin', 'EGE', 'Aeropuerto Regional del Condado de Eagle', 'IBZ', 'Aeropuerto de Ibiza','T3','T1','9H','Finalizado','2017-12-22','2018-01-2','17:55:00','02:55:00','15:55:00','2 escalas','25','Incluido'),
('AEA965','AEA','Bombardier', 'MAD','Adolfo Suarez Madrid-Barajas','HOR', 'Aeropuerto de Horta','T4','T2', '1H', 'Embarque','2018-03-03','2018-03-15','10:00:00','11:00:00','08:00:00','Directo','10','Incluido');

INSERT INTO PASAJEROS VALUES 
('51500473T','Alvaro','Gonzalez','Rodriguez','19','Adulto','No'), 
('75923648B','Raul','Perez','Garcia','22','Adulto','No'),
('57762314C','Alvaro','Jimenez','Zorrilla','18','Adulto','No'),
('66902123F','Alvaro','Villaseca','ALvarez','18','Niño','Si'),
('00658428T','Juan','Hurtado','Blanco','16','Niño','No');

INSERT INTO RESERVA VALUES
('M00386A','51500473T','1A','1 maleta hasta 23Kg','1 maleta hasta 23Kg','No','0','175.50','IB4572'),
('N11297B','75923648B','5C','Sin equipaje','1 maleta hasta 23Kg','Si','0','220.00','ACA557'),
('T12757A','57762314C','10B','1 maleta hasta 23Kg','1 maleta hasta 23Kg','No','1','50.00','EGF266'),
('A23569C','66902123F','16G','1 maleta hasta 23Kg','1 maleta hasta 23Kg','Si','1','550.00','EZY411'),
('B51587J','00658428T','4D','Sin equipaje','Sin equipaje','Si','2','335.74','AEA965');

INSERT INTO BILLETE VALUES
('M00386A','51500473T','IB4572','19','1A'),
('N11297B','75923648B','ACA557','26','5C'),
('T12757A','57762314C','EGF266','8','10B'),
('A23569C','66902123F','EZY411','12','16G'),
('B51587J','00658428T','AEA965','22','4D');












 
