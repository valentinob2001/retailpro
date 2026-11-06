-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Propósito: lograr una visión única que cruce toda la información del negocio para el equipo de análisis
SELECT *
FROM ventas v
INNER JOIN clientes c on v.id_cliente = c.id_cliente
INNER JOIN productos p on v.id_producto = p.id_producto
INNER JOIN territorios t on v.id_territorio = t.id_territorio;
-- Hallazgo: Se realizaron 10 ventas en 10 días. Todos los clientes realizaron 2 compras cada uno. EL 50% de las ventas se dieron en Brasil Sur y el otro 50% en las distintas zonas de Argentina.


-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: detectar clientes registrados que nunca compraron, para que CRM los contacte. 
SELECT
nombre, email, fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
-- Hallazgo: no existen clientes que no hayan realizado compras, lo que implica un registro exitoso de los clientes


-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Propósito: detectar productos del catálogo sin vender, para que el área de productos los promocione.
SELECT
nombre_producto, c.nombre_categoria, precio_unitario
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;
-- Hallazgo: no existen productos que no hayan tenido al menos una venta, lo que implica un catálogo efectivo y funcional en términos de ventas.


-- Consulta 4: Consolidado por segmento etario (UNION ALL)
-- Propósito: detectar el patrón de ventas en relación a los segmentos etarios +50 y -50 respectivamente, en vistas a incentivar la compra por parte del grupo que corresponda.
SELECT segmento, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Edad +50' AS segmento
    FROM ventas v
    INNER JOIN clientes c ON v.id_cliente = c.id_cliente
    WHERE c.fecha_nacimiento < '1974-11-06'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Edad -50' AS segmento
    FROM ventas v
    INNER JOIN clientes c ON v.id_cliente = c.id_cliente
    WHERE c.fecha_nacimiento >= '1974-11-06'
) AS consolidado
GROUP BY segmento;
-- Hallazgo: El total del grupo -50 supera con creces al del +50 por un 400%, esto debe ser una señal para el área de CRM en vistas a incentivar la compra de este segmento etario. 
