-- Consulta 1: resumen ejecutivo mensual
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) total_facturado,
COUNT(id_venta) cantidad_pedidos,
AVG(cantidad * precio_unitario) ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);


-- Consulta 2: ranking de productos
SELECT
TOP 5 id_producto,
SUM(cantidad) unidades_vendidas,
SUM(cantidad * precio_unitario) total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- Consulta 3: clientes recurrentes
SELECT
id_cliente,
COUNT(id_venta) pedidos,
SUM(cantidad * precio_unitario) total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1;


-- Consulta 4: productos por encima/por debajo de promedio
WITH ventas_productos AS (
    SELECT
        id_producto producto,
        SUM(cantidad * precio_unitario) total_facturado
    FROM ventas
    GROUP BY id_producto  
)
SELECT
    producto,
    total_facturado,
CASE
    WHEN total_facturado > (SELECT AVG(total_facturado) FROM ventas_productos) THEN 'Por encima'
    ELSE 'Por debajo'
END AS comparacion
FROM ventas_productos;

-- Hallazgos
-- El producto 1 concentra el 55% del total facturado
-- El 60% de los clientes no supera o supera ligeramente en gastos totales el ticket promedio
-- El 66% de los productos no supera el promedio de facturación por producto
