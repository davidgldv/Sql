SELECT Estado,CodigoPedido FROM Pedidos;
/*Muestra los campos de las columnas señaladas de la tabla señalada*/

SELECT Estado,CodigoPedido FROM Pedidos GROUP BY Estado;
/*El group by agrupa las columnas*/

SELECT Estado,CodigoPedido FROM Pedidos WHERE Estado = Rechazado GROUP BY Estado;
/*Con el where le indicamos una condicion que es donde el campo  estado = rechazado*/

SELECT Estado,COUNT(*) FROM Pedidos GROUP BY Estado;
SELECT Pais,COUNT(*) FROM Oficinas GROUP BY Pais;
/*Siempre que usamos un group by tenemos que añadir las funciones de agregacion */

SELECT MAX(PrecioVenta) FROM Productos;
/*Las funciones de agregacion se pueden usar sin el group by con solo usar una columna*/
/*Esta funcion indica el valor maximo de la columna*/

SELECT Gama,AVG(PrecioVenta) FROM Productos GROUP BY Gama;
/*Esta funcion de agregacion hace medias entre los datos que colisionen*/

SELECT CodigoPedido,SUM(Cantidad)  FROM DetallePedidos GROUP BY CodigoPedido;
/*Esta funcion de agregacion sirve para sumar los campos que colisionen*/


SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) FROM DetallePedidos GROUP BY CodigoPedido HAVING SUM(Cantidad*PrecioUnidad) > 1500 ;
SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) FROM DetallePedidos GROUP BY CodigoPedido HAVING SUM(Cantidad*PrecioUnidad) > 1500 ;
SELECT CodigoPedido,SUM(Cantidad*PrecioUnidad) AS 'PrecioFinal' FROM DetallePedidos GROUP BY CodigoPedido HAVING  PrecioFinal> 1500 ;
/*El having sirve para indicar como un where porque las consulta se realiza de izquierdas a derechas entonces por sintaxsis el instruccion con where no valdria*/

SELECT CodigoProducto,PrecioVenta FROM Productos WHERE PrecioVenta>(SELECT AVG(PrecioVenta) FROM Productos);
/*Se pueden usar subconsultas para realizar diferentes consultas mas complejas*/

/*Mostrar producto más caro*/
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta>(SELECT MAX(PrecioVenta) FROM Productos);

/*Mostrar productos que esten entre 200 y 300 */
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta>200 AND PrecioVenta<300;
SELECT CodigoProducto, PrecioVenta FROM Productos WHERE PrecioVenta BETWEEN 200 AND 300;

/*Muestra el codigo de oficina de España y EEUU */
SELECT CodigoOficina, Pais FROM Oficinas WHERE Pais IN ('España', 'EEUU');

/*Muestra los empleados que no tengan jefe*/
SELECT CodigoEmpleado, CodigoJefe FROM Empleados WHERE CodigoJefe IS NULL;

/*Mostrar empleados que si tengan jefe*/
SELECT CodigoEmpleado, CodigoJefe FROM Empleados WHERE CodigoJefe IS NOT NULL;

/*Sacar el codigo oficina y la ciudad donde hay oficinas*/
SELECT CodigoOficina, Ciudad FROM Oficinas;
/*Sacar cuantos empleados hay en la compañia*/
SELECT COUNT (CodigoEmpleado) FROM Empleados;
/*Sacar cuantos clientes tiene cada pais*/
SELECT Pais, COUNT(CodigoCliente) FROM Clientes GROUP BY Pais;
/*Sacar cual fue el pago medio en 2009*/
/*Sacar cuantos pedidos estan en cada estado ordenado descendentemente por el número de pedido*/
SELECT Estado, COUNT(CodigoPedido)  FROM Pedidos GROUP BY Estado ORDER BY Pedido DESC; 
/*Sacar el precio del producto más caro y de el más barato*/
SELECT (SELECT MIN(PrecioVenta) FROM Productos) AS Minimo,(SELECT MAX(PrecioVenta) FROM Productos) AS Maximo FROM Productos LIMIT 1;






