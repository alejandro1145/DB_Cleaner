/sentencias DML/

/RETO 1 Retorna un listado con el código de oficina y la ciudad donde hay oficinas/

DESCRIBE oficina;

select cod_oficina,
ciudad,
pais,
region,
codigo_postal,
telefono,
linea_direccion1,
linea_direccion2
from oficina;


select codigo_oficina, ciudad
from oficina;

/RETO 2 Retorna un listado con la ciudad y el teléfono de las oficinas de España/

DESCRIBE OFICINA;

select cod_oficina,
ciudad,
pais,
region,
codigo_postal,
telefono,
linea_direccion1,
linea_direccion2
from oficina;

select ciudad, telefono
from oficina
where pais = 'españa';

/RETO 3 Retorna un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7/

DESCRIBE empleado;

select codigo_empleado,
nombre,
apellido1,
apellido2,
extension,
email,
codigo_oficina,
codigo_jefe,
puesto
from empleado;

select nombre, apellido1, email
from empleado
where codigo_jefe = 7;

/RETO 4 Retorna el nombre del puesto, nombre, apellidos y email del jefe de la empresa/

describe empleado;

select codigo_empleado,
nombre,
apellido1,
apellido2,
extension,
email,
codigo_oficina,
codigo_jefe,
puesto
from empleado;

select puesto, nombre, apellido1, email
from empleado
where codigo_jefe is null;

/RETO 5 Retorna un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas/

describe empleado;

select codigo_empleado,
nombre,
apellido1,
apellido2,
extension,
email,
codigo_oficina,
codigo_jefe,
puesto
from empleado;

SELECT nombre apellido1, apellido2, puesto
from empleado
where puesto !='representante de ventas';

/* RETO 6 Retorna un listado con el nombre de los todos los clientes españoles*/

DESCRIBE cliente;

select codigo_cliente,
nombre_cliente,
nombre_contacto,
apellido_contact,
telefono,
fax,
linea_direccion1,
linea_direccion2,
ciudad,
region,
pais,
codigo_postal,
codigo_empleado_rep_ventas,
limite_credito
from cliente;

select nombre_cliente
from cliente
where pais = 'spain';

/RETO 7 Retorna un listado con los distintos estados por los que puede pasar un pedido/
 describe pedido;
 
select codigo_pedido,
fecha_pedido,
fecha_esperada
fecha_esperada,
estado,
comentarios,
codigo_cliente
from pedido;

select estado
from pedido;


 
/RETO 8  Genera un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos/


DESCRIBE cliente;

select codigo_cliente,
nombre_cliente,
nombre_contacto,
apellido_contacto,
telefono,
fax,
linea_direccion1,
linea_direccion2,
ciudad,
region,
pais,
codigo_postal,
codigo_empleado_rep_ventas,
limite_credito
from cliente;

select codigo_cliente,
forma_pago,
id_transaccion,
fecha_pago,
total
from pago;


SELECT DISTINCT codigo_cliente
FROM pago
where fecha_pago between '2008/01/01' and '2008/12/31';

/RETO 9 Genera un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo/

describe pedido;

select codigo_pedido,
fecha_pedido,
fecha_esperada,
fecha_entrega,
estado,
comentarios,
codigo_cliente
from pedido;

select codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;

/RETO 10 Genera un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada/

describe pedido;

select codigo_pedido,
fecha_pedido,
fecha_esperada,
fecha_entrega,
estado,
comentarios,
codigo_cliente
from pedido;

select codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
from pedido
where fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

/RETO 11  Genera un listado de todos los pedidos que fueron rechazados en 2009/

DESCRIBE PEDIDO;

SELECT codigo_pedido,
fecha_pedido,
fecha_esperada,
fecha_entrega,
estado,
comentarios,
codigo_cliente
FROM PEDIDO;

DESCRIBE PAGO;

SELECT codigo_cliente,
forma_pago,
id_transaccion,
fecha_pago,
total
FROM PAGO;

SELECT 
    codigo_pedido,codigo_cliente,fecha_pedido,estado
FROM pedido
WHERE estado = 'Rechazado'AND fecha_pedido BETWEEN '2009-01-01' AND '2009-12-31';

/reto 12  Genera un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año/

describe pedido;

select codigo_pedido,
fecha_pedido,
fecha_esperada,
fecha_entrega,
estado,
comentarios,
codigo_cliente
from pedido;


select codigo_pedido,fecha_pedido,estado
from pedido
where estado = 'entregado' and fecha_pedido between '2009/01/01' and '2009/01/31';

/RETO 13  Genera un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor/

describe pago;

select codigo_cliente,
forma_pago,
id_transaccion,
fecha_pago,
total
from pago;

select fecha_pago,forma_pago
from pago
where fecha_pago between '2008/01/01' and '2008/12/31' and forma_pago = 'Paypal' order by total desc;

/* RETO 14  Genera un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas*/

DESCRIBE PAGO;

SELECT codigo_cliente,
forma_pago,
id_transaccion,
fecha_pago,
total
FROM PAGO;

SELECT DISTINCT forma_pago
from pago;

/RETO 15  Genera un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio/

describe producto;

SELECT codigo_producto,
nombre,
gama,
dimensiones,
proveedor,
descripcion,
cantidad_en_stock,
precio_venta,
precio_proveedor
FROM producto;


select gama,cantidad_en_stock,precio_venta
from producto
where gama = 'Ornamentales'and cantidad_en_stock > 100 order by precio_venta desc;

/RETO 16  Genera un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30/

DESCRIBE CLIENTE;


SELECT codigo_cliente,
nombre_cliente,
nombre_contacto,
apellido_contacto,
telefono,
fax,
linea_direccion1,
linea_direccion2,
ciudad,
region,
pais,
codigo_postal,
codigo_empleado_rep_ventas,
limite_credito
FROM CLIENTE;

SELECT codigo_cliente,nombre_cliente,ciudad,codigo_empleado_rep_ventas
from cliente
where ciudad = 'MARDID' AND codigo_empleado_rep_ventas = 11 OR codigo_empleado_rep_ventas = 30;
