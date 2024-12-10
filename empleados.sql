DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


-- EJERCICIOS

select nombre, apellido1, apellido2 from empleado; -- Lista Nombre y Apellidos
select distinct apellido1 from empleado; -- Lista apellidos eliminando los repetidos
select * from empleado; -- Lista todas las columnas 
select id_departamento from empleado; -- Lista el ID de los departamentos
select distinct id_departamento from empleado; -- Lista el ID de los departamentos eliminando los repetidos
select concat_ws(' ', nombre, apellido1, apellido2) as 'Nombre Completo' from empleado; -- Creamos una tambla nueva 'Nombre completo' donde aparezca nombre y apellidos
select lower(concat_ws(' ', nombre, apellido1, apellido2)) as 'Nombre Completo Minusculas' from empleado; -- Creamos una tambla nueva 'Nombre completo' donde aparezca nombre y apellidos en minuscula.
select id, 
left(nif, length(nif) -1) as 'Dígitos DNI',
right(nif, 1) as 'Número DNI' from empleado; -- Lista ID y crea una tabla con los digitos del dni y otra con la letra
select nombre, presupuesto - gastos as 'Presupuesto Actual' from departamento; -- Creamos una columna 'Presupuesto Actual' calculando desde otras tablas
select nombre, presupuesto from departamento order by presupuesto; -- Lista y ordena de manera ascendente en base al presupuesto
select nombre from departamento order by nombre desc; -- Lista y ordena de manera descendente en base al rpesupuesto
select nombre, apellido1, apellido2 from empleado order by 2,3,1;  -- Lista Nombre y apellidos y ordena de manera ascendente en base al apellido
select nombre, presupuesto from departamento order by presupuesto desc limit 3; -- Lista y ordena de manera descendente los 3 primeros en base al presupuesto
select nombre, presupuesto from departamento order by presupuesto limit 3; -- Lista y ordena de manera descendente los 3 primeros en base al presupuesto
select nombre, gastos from departamento order by gastos desc limit 2; -- Lista y ordena de manera descendente los 2 primeros en base a los gastos
select nombre, gastos from departamento order by gastos limit 2;  -- Lista y ordena de manera ascendente los 2 primeros en base a los gastos
select * from empleado limit 5 offset 2; -- Lista 5 filas empezando desde donde queramos
select nombre, presupuesto from departamento where presupuesto >= 150000; -- Lista nombre y presupuesto de las filas que tenga un presupuesto determinado
select nombre, presupuesto from departamento where presupuesto between 100000 and 200000; -- Lista nombre y presupuesto de las filas que tengan un presupuesto entre dos valores.
select nombre, presupuesto from departamento where not presupuesto between 100000 and 200000;
select nombre, presupuesto, gastos from departamento where gastos > presupuesto;  -- Lista nombre y ID de departamento su los gastos son mayores que el presupuesto
select nombre, presupuesto, gastos from departamento where gastos < presupuesto;  -- Lista nombre y ID de departamento su los gastos son menores que el presupuesto
select nombre, presupuesto, gastos from departamento where gastos = presupuesto;  -- Lista nombre y ID de departamento su los gastos son iguales que el presupuesto
select * from empleado where apellido2 is null; -- Lista todas las columnas cuando el apellido 2 sea nulo
select * from empleado where apellido2 is not null; -- Lista todas las columnas cuando el apellido2 no sea nulo
select * from empleado where apellido2 like 'López'; -- Lista todas las columnas cuando el apellido2 sea LOPEZ
select * from empleado where apellido2 like 'Diaz' or 'Moreno'; -- Lista todas las columnas cuando el apellido2 sea DIAZ o MORENO
select * from empleado where apellido2 in ('Diaz' or 'Moreno'); -- Lo mismo que arriba pero con otro operador
select nombre, apellido1, apellido2, nif where id_departamento = 3; -- Lista nombre, apellidos y nif cuando id_departamento sea igual a 3
select nombre, apellido1, apellido2, nif where id_departamento = 2 or id_departamento = 4 or id_departamento = 5; -- Lista nombre, apellidos y nif cuando id_departamento sea igual a 2, 4 o 5
select sum(presupuesto) from departamento; -- Calcula la suma de todos los presupuestos
select round(avg(presupuesto),2) from departamento; -- Calcula la media de presupuesto ROUND SIRVER PARA REDONDEAR
select min(presupuesto) from departamento; -- Calcula el minimo de presupuesto
select nombre, presupuesto from departamento order by presupuesto limit 1; -- Lista la fila con el menor presupuesto
-- select nombre, presupuesto from departamento where presupuesto = (select min(presupuesto) from departamento); LO MISMO CON SUBCONSULTA 
select max(presupuesto) from departamento; -- Calcula la máxima de presupuesto
select nombre, presupuesto from departamento where presupuesto = (select max(presupuesto) from departamento); -- Lista la fila con mayor presupuesto
select count(id) from empleado;
select count(id) from empleado where apellido2 is not null; 
select count(id) from empleado where id_departamento = 1;
select count(id) from empleado where presupuesto > 200000;















