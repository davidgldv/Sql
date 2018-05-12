CREATE USER IF NOT EXISTS 'administrador'@'localhost' IDENTIFIED BY 'toor';
GRANT ALL PRIVILEGES ON BuscadorVuelos.* TO 'administrador'@'localhost';
CREATE USER IF NOT EXISTS 'cliente'@'localhost' IDENTIFIED BY 'reservaVuelos';
GRANT INSERT ON BuscadorVuelos.PASAJEROS TO 'cliente'@'localhost';
CREATE USER IF NOT EXISTS 'anonimo'@'localhost' IDENTIFIED BY 'consultaVuelos';
GRANT SELECT ON BuscadorVuelos.BILLETE TO 'anonimo'@'localhost';
GRANT SELECT ON BuscadorVuelos.RESERVA TO 'anonimo'@'localhost';

