
---0. create database bancoudea : Para crear la base de datos del banco

--1.Creaci�n de tablas relacionales

--1.1 Creaci�n de tabla est�tica 

create table clientes
(
id serial,
nombre varchar(100),
numero_cuenta varchar(50),
cantidad_dinero integer,
constraint clientes_pkey primary key (id)
)

--1.2 Creaci�n de tablas transaccionales 

create table transacciones
(
	id serial, 
	id_cliente integer,
	numero_transacciones integer,
	cantidad_dinero_mes integer,
	mes varchar(50),
	constraint transacciones_pkey primary key (id),
	foreign key (id_cliente) references clientes(id)
)

select count(*) from transacciones 

create table cuentas
(
 id serial,
 mes varchar(50),
 id_cliente integer,
 ciudad integer,
 constraint cuentas_pkey primary key (id),
 foreign key (id_cliente) references clientes (id)
)

-- El banco est� interesado en saber cu�nto dinero tiene cada uno de sus clientes

select id, cantidad_dinero from clientes 

--  El banco est� interesado en saber cu�ntas transacciones hace cada cliente al mes

select sum(numero_transacciones), mes, id_cliente  from transacciones
group by mes, id_cliente 
order by id_cliente, mes 
-- El banco est� interesado en conocer cu�l es el mes con mayor n�mero de transacciones

select count(numero_transacciones), mes from transacciones 
group by mes 
order by mes 

select sum(numero_transacciones), mes from transacciones 
group by mes
order by sum(numero_transacciones) desc 

--El banco est� interesado en saber en qu� mes se movi� la mayor cantidad de dinero

select sum(cantidad_dinero_mes), mes from transacciones 
group by mes 
order by mes desc

-- El banco est� interesado en saber en cu�l mes se crearon la mayor cantidad de cuentas

select count(id_cliente), mes from cuentas 
group by mes
order by count(id_cliente) desc

--El banco quiere saber en que ciudades tiene mayor presencia.


select count(ciudad), ciudad from cuentas 
group by ciudad
order by count(ciudad) desc