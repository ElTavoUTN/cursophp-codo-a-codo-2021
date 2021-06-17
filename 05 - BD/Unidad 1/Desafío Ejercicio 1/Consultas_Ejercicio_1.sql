-- 2.1 obtener los apellidos de los empleados
select persona.apellidos as ape from persona order by ape asc;
-- 2.2 obtener los apellidos de los empleados sin repeticiones
select distinct persona.apellidos as ape from persona order by ape asc;
-- 2.3 obtener los datos de los empleados que tengan el apellido Lopez
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona join departamento on persona.departamento_id = departamento.id where persona.apellidos = "Lopez";
-- 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez
 select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona join departamento on persona.departamento_id = departamento.id where persona.apellidos = "Lopez" or persona.apellidos = "Perez" order by persona.apellidos asc;
-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14.
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where departamento.numero_departamento = 14;
-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77 
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where departamento.numero_departamento = 37 or departamento.numero_departamento = 77;
-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P.
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where persona.apellidos like 'P%';
-- 2.8 Obtener el presupuesto total de todos los departamentos
select departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", sum(departamento.presupuesto) as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
group by departamento.nombre_departamento
order by departamento.numero_departamento asc;
-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado  y de su departamento.
select persona.dni as DNI, persona.nombre, persona.apellidos, departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
ORDER BY persona.apellidos asc;
-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto  al nombre y presupuesto de su departamento 
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
ORDER BY persona.apellidos asc;
-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo  presupuesto sea mayor de 60000.
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.nombre_departamento as "Nombre Depto", departamento.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where departamento.presupuesto > 60000
ORDER BY departamento.presupuesto asc;
-- 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un  empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109 
INSERT INTO departamento (`id`, `numero_departamento`, `nombre_departamento`, `presupuesto`) VALUES ('11', '11', 'Calidad', '40000');
INSERT INTO persona (`id`, `dni`, `nombre`, `apellidos`,`departamento_id`) VALUES ('15', '89267109', 'Esther', 'Vazquez','11');
-- 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos.
select departamento.nombre_departamento, round(departamento.presupuesto - departamento.presupuesto * 0.1) as descuento from departamento where departamento.presupuesto;
UPDATE departamento SET departamento.presupuesto = round(departamento.presupuesto - departamento.presupuesto * 0.1);
select * from departamento;
-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de  informática (código 14)
update persona set persona.departamento_id = 14 where persona.departamento_id = 77;
-- 2.15 Despedir a los empleados del departamento de informática (código 14).
update persona set persona.departamento_id = 1 where persona.departamento_id = 14; 
-- Se puede hacer el delete, pero es necesario preservar los datos en la BD
delete from persona where persona.departamento_id = 14;
-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000.
update persona join departamento on departamento.id = persona.departamento_id 
set persona.departamento_id = 1
where departamento.presupuesto > 90000; 
-- Se puede hacer el delete, pero es necesario preservar los datos en la BD
delete p from persona p join departamento d on d.id = p.departamento_id  
where d.presupuesto > 90000;
