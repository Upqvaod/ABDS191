--Crea una consulta para obtener el nombre del cómic con los disponibles en el inventario
SELECT nombre , cantidad_disponible 
FROM Comics c
JOIN Inventario i ON c.id_comic = i.id_comic


--Crea una consulta para desplegar los detalles de las compras realizadas por cada cliente y los cómics comprados
SELECT cli.nombre, com.id_compra, com.fecha_compra, c.nombre , cc.cantidad
FROM Clientes cli
JOIN Compras com ON cli.id_cliente = com.id_cliente
JOIN Comic_Compras cc ON com.id_compra = cc.id_compra
JOIN Comics c ON cc.id_comic = c.id_comic



--Crea una consulta para obtener todas las compras junto con la cantidad disponible de cómics en el inventario incluidos los que no han sido comprados
SELECT c.id_compra, nombre AS nombre_comic, cantidad_disponible
FROM Compras c
LEFT JOIN Comic_Compras cc ON c.id_compra = cc.id_compra
LEFT JOIN Comics co ON cc.id_comic = co.id_comic
LEFT JOIN Inventario i ON co.id_comic = i.id_comic;

--Consulta para enlistar todos los cómics y su cantidad disponible en el inventario
SELECT nombre AS nombre_comic, cantidad_disponible
FROM Comics c
JOIN Inventario i ON c.id_comic = i.id_comic;

--Crea una consulta todos datos de los comics, comics compras e inventario disponible.
SELECT c.id_comic, nombre AS nombre_comic, anio, precio, id_inventario, cantidad_disponible, disponibilidad, id_CC, cantidad, id_compra
FROM Comics c
LEFT JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
LEFT JOIN Inventario i ON c.id_comic = i.id_comic;

--Crea una consulta que muestre solo los clientes que compraron algo con su id de compra nombre del comic ,cantidad de compra y los disponibles en inventario.
SELECT cl.nombre AS nombre_cliente, co.id_compra, cm.nombre AS nombre_comic, cc.cantidad, i.cantidad_disponible
FROM Clientes cl
JOIN Compras co ON cl.id_cliente = co.id_cliente
JOIN Comic_Compras cc ON co.id_compra = cc.id_compra
JOIN Comics cm ON cc.id_comic = cm.id_comic
JOIN Inventario i ON cm.id_comic = i.id_comic

