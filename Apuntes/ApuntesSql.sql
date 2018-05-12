/*Sacar cliente que hizo el pedido de mayor cuantia*/

SELECT Clientes.CodigoCliente , Clientes.NombreCliente , Pedidos.CodigoCliente , Pedidos.CodigoPedido, Detalle.CodigoPedido ,SUM(Detalle.PrecioUnidad*Detalle.Cantidad) as Precio FROM DetallePedidos as Detalle JOIN Pedidos as Pedidos JOIN Clientes as Clientes ON Detalle.CodigoPedido = Pedidos.CodigoPedido AND Pedidos.CodigoCliente = Clientes.CodigoCliente GROUP BY Detalle.CodigoPedido HAVING Precio = (SELECT  SUM(PrecioUnidad*Cantidad) as Precio FROM DetallePedidos GROUP BY CodigoPedido ORDER BY Precio DESC LIMIT 1);


SELECT  C.NombreCliente,P.CodigoPedido,SUM(D.PrecioUnidad*D.Cantidad) as Precio  FROM DetallePedidos as D JOIN Pedidos as P JOIN Clientes as C ON D.CodigoPedido = P.CodigoPedido AND P.CodigoCliente = C.CodigoCliente  GROUP BY D.CodigoPedido HAVING Precio = (SELECT  SUM(PrecioUnidad*Cantidad) as Precio FROM DetallePedidos GROUP BY CodigoPedido ORDER BY Precio DESC LIMIT 1);

/*Sacar cuantos clientes tienen las ciudades que empiezan por M*/

SELECT COUNT(Clientes.CodigoCliente) FROM Clientes as Clientes  GROUP BY Ciudad HAVING Ciudad REGEXP "^M";

/*Sacar CodEmpleado, numero clientes al que atiende cada representante de ventas*/
 
SELECT  E.CodigoEmpleado, COUNT(C.CodigoCliente) as NºClientes FROM Empleados as E JOIN Clientes as C ON C.CodigoEmpleadoRepVentas = E.CodigoEmpleado GROUP BY C.CodigoEmpleadoRepVentas;

SELECT CodigoEmpleadoRepVentas, COUNT(CodigoCliente) as NºClientes FROM Clientes GROUP BY CodigoEmpleadoRepVentas; /*Manera mas eficiente*/

/*Sacar numero de clientes que no tienen asignado RepVentas*/
SELECT COUNT(CodigoCliente) as NºClientes FROM Clientes GROUP BY CodigoEmpleadoRepVentas HAVING CodigoEmpleadoRepVentas IS NULL;  

/*Sacar el primer pago y el ultimo de algún cliente*/
SELECT MAX(FechaPago) ,MIN(FechaPago),CodigoCliente FROM Pagos GROUP BY CodigoCliente;

/*Sacar el codigo cliente de aquellos clientes que hicieron pago en 2008*/


/*Sacar numero pedido, codigo cliente, fecha requerida y fecha entrega de los pedidos que no han sido integrados a tiempo*/


/*Sacar cuantos productos existen cada linea de pedido*/


/*Sacar listado de los 20 codigos de producto mas pedidos ordenados por cantidad pedida*/


/*Sacar numero pedido, codigo clientes, fecha entrega, fecha requerida de los pedidos cuya fecha entrega ha sido al menos 2 dias antes de la fecha requerida*/


/*Sacar la facturacion que ha tenido la empresa en toda la historia indicando la mas imposible suma(costeproducto*numero udsvendidas), el IVA y el total facturado(suma dos campos anteriores)*/


/*Sacar la misma que la anterior agrupando por codigoProducto filtrada por los codigos que empiecen por fr*/


/*Obtener listado del nombre de empleados con el nombre de sus jefes*/


/*Sacar listado de jefes y sacar empleados a su cargo ordenado por numero empleados subordinados*/


/*Obtener nombre de clientes a los que no se les ha entregado a tiempo un pedido*/


/*Sacar em importe medio de los pedidos*/


/*Cual es el pedido mas caro del empleado que mas clientes tiene*/

