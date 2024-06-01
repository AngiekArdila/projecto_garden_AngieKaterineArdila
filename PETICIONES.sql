use garden1;
-- 1
SELECT codigo_oficina, ciudad
FROM oficina;

-- 2
SELECT ciudad, telefono
FROM oficina
WHERE id_ciudad = (SELECT id_ciudad FROM ciudad WHERE pais = 'España');

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
-- jefe tiene un código de jefe igual a 7.

SELECT e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado e
WHERE codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
-- empresa.
SELECT e.puesto AS cargo, e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado as e
WHERE e.codigo_jefe IS NULL;


-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
-- empleados que no sean representantes de ventas.
 SELECT nombre, apellido1, apellido2, puesto
FROM empleado
WHERE puesto != 'Representante de ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente
FROM cliente
WHERE pais = (SELECT id_pais FROM pais WHERE nombre = 'España');

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un
-- pedido.
SELECT estado
FROM estado_pedido;

-- 8.8. Devuelve un listado con el código de cliente de aquellos clientes que
-- realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
-- aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
SELECT DISTINCT codigo_cliente
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago < '2009-01-01';

-- 9.SELECT codigo_pedido, codigo_cliente, fecha_pedido, fecha_entrega
FROM pedido
WHERE estado != 'Entregado' AND fecha_entrega > fecha_pedido;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha
-- esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
-- menos dos días antes de la fecha esperada.
SELECT codigo_pedido, codigo_cliente, fecha_pedido, fecha_entrega
FROM pedido
WHERE fecha_entrega < ADDDATE(fecha_pedido, -2);

-- 11 Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT * FROM pedido
JOIN estado_pedido  ON pedido.estado = estado_pedido.id_estado_pedido
WHERE estado_pedido.estado = "Rechazado"
AND YEAR(pedido.fecha_pedido) = 2009 ;
-- 12  Devuelve un listado de todos los pedidos que han sido entregados en el
-- mes de enero de cualquier año.
select * FROM pedido
WHERE month(pedido.fecha_entrega)=01;
-- 13 Devuelve un listado con todos los pagos que se realizaron en el
-- año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

SELECT 
	p.id_transaccion, fp.tipo, p.fecha_pago 
FROM 
	pago AS p
INNER JOIN 
	forma_pago AS fp ON p.forma_pago = fp.id_forma_pago 
WHERE 
	YEAR(p.fecha_pago) = 2008 
	AND fp.tipo = "PayPal"
ORDER BY total DESC;

-- 14 Devuelve un listado con todas las formas de pago que aparecen en la
-- tabla pago. Tenga en cuenta que no deben aparecer formas de pago
-- repetidas.

select distinct tipo from forma_pago;

-- 15 Devuelve un listado con todos los productos que pertenecen a la
-- gama gama10 y que tienen más de 100 unidades en stock. El listado
-- deberá estar ordenado por su precio de venta, mostrando en primer lugar
-- los de mayor precio.
select * FROM producto p 
WHERE p.cantidad_en_stock > 100 
AND p.gama = "gama10"
ORDER BY precio_venta DESC;
-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
-- cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT *
FROM cliente c
JOIN ciudad ci ON c.ciudad = ci.id_ciudad
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE ci.nombre = 'Madrid'
AND (e.codigo_empleado = 11 OR e.codigo_empleado = 30);

-- Consultas multitabla (Composición interna)


-- 1 Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
-- representante de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2 Muestra el nombre de los clientes que hayan realizado pagos junto con el
-- nombre de sus representantes de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e, pago p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
AND c.codigo_cliente = p.codigo_cliente;
-- 3 Muestra el nombre de los clientes que no hayan realizado pagos junto con
-- el nombre de sus representantes de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c, empleado e, pago p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
AND c.codigo_cliente = p.codigo_cliente;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- 4 Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre
FROM cliente c, empleado e, pago p, ciudad ci
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
AND c.codigo_cliente = p.codigo_cliente
AND e.ciudad = ci.id_ciudad;

-- 5 Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
-- de sus representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.

SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
INNER JOIN ciudad ci ON e.ciudad = ci.id_ciudad
WHERE p.codigo_cliente IS NULL;

-- 6 Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT DISTINCT o.linea_direccion1, o.linea_direccion2
FROM cliente c, ciudad ci, oficina o
WHERE c.ciudad = ci.id_ciudad
AND ci.nombre = 'Fuenlabrada'
AND ci.id_ciudad = o.ciudad;

-- 7 Devuelve el nombre de los clientes y el nombre de sus representantes junto
-- con la ciudad de la oficina a la que pertenece el representante.

SELECT c.nombre_cliente, e.nombre, e.apellido1, ci.nombre
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN ciudad ci ON e.ciudad = ci.id_ciudad
INNER JOIN oficina o ON ci.id_ciudad = o.ciudad;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre
-- de sus jefes.

SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1
INNER JOIN empleado e2 ON e1.jefe = e2.codigo_empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
-- de su jefe y el nombre del jefe de sus jefe.

SELECT e1.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_del_jefe
FROM empleado e1
INNER JOIN empleado e2 ON e1.jefe = e2.codigo_empleado
INNER JOIN empleado e3 ON e2.jefe = e3.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a
-- tiempo un pedido.

SELECT c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.fecha_entrega > p.fecha_limite_entrega;

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado
-- cada cliente.

SELECT DISTINCT c.nombre_cliente, p.nombre_gama
FROM cliente c, pedido pe, linea_pedido lp, producto p
WHERE c.codigo_cliente = pe.codigo_cliente
AND pe.numero_pedido = lp.numero_pedido
AND lp.codigo_producto = p.codigo_producto;

-- consultas multitabla (composicion externa)

-- 1
SELECT c.nombre_cliente
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;
-- 2 
SELECT c.nombre_cliente
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedido pe
    WHERE pe.codigo_cliente = c.codigo_cliente
-- 3 

SELECT c.nombre_cliente
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
WHERE p.codigo_cliente IS NULL AND pe.codigo_cliente IS NULL;

-- 4 
SELECT e.nombre
FROM empleado e
WHERE NOT EXISTS (
    SELECT 1
    FROM oficina o
    WHERE o.codigo_oficina = e.codigo_oficina
);

-- 5 
SELECT e.nombre
FROM empleado e
WHERE NOT EXISTS (
    SELECT 1
    FROM cliente c
    WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
);

-- 6
 SELECT e.nombre, o.*
FROM empleado e, oficina o
WHERE e.codigo_oficina = o.codigo_oficina
AND NOT EXISTS (
    SELECT 1
    FROM cliente c
    WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
);

-- 7
 SELECT e.nombre
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE o.codigo_oficina IS NULL OR c.codigo_empleado_rep_ventas IS NULL;

-- 8 
SELECT p.nombre_producto
FROM producto p
LEFT JOIN linea_pedido lp ON p.codigo_producto = lp.codigo_producto
WHERE lp.codigo_producto IS NULL;

-- 9
 SELECT p.nombre_producto, p.descripcion, p.imagen
FROM producto p
LEFT JOIN linea_pedido lp ON p.codigo_producto = lp.codigo_producto
WHERE lp.codigo_producto IS NULL;

-- 10

SELECT o.*
FROM oficina o
WHERE NOT EXISTS (
    SELECT 1
    FROM empleado e, cliente c, pedido pe, linea_pedido lp, producto p
    WHERE e.codigo_oficina = o.codigo_oficina
    AND e.codigo_empleado = c.codigo_empleado_rep_ventas
    AND c.codigo_cliente = pe.codigo_cliente
    AND pe.numero_pedido = lp.numero_pedido
    AND lp.codigo_producto = p.codigo_producto
    AND p.nombre_gama = 'Frutales'
);

-- 11
SELECT DISTINCT c.nombre_cliente
FROM cliente c
INNER JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- 12 

SELECT e.nombre AS empleado, ej.nombre AS jefe
FROM empleado e, empleado ej
WHERE e.jefe = ej.codigo_empleado
AND NOT EXISTS (
    SELECT 1
    FROM cliente c
    WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
);
