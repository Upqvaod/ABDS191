SELECT cc.id_CC, cc.cantidad, c.nombre AS nombre_comic, co.id_compra, co.fecha_compra, co.total
FROM Comic_Compras cc
JOIN Comics c ON cc.id_comic = c.id_comic
JOIN Compras co ON cc.id_compra = co.id_compra

SELECT c.id_cliente, c.nombre AS nombre_cliente, cc.cantidad AS cantidad_comics_comprados
FROM Clientes c
JOIN Comic_Compras cc ON c.id_cliente = cc.id_compra