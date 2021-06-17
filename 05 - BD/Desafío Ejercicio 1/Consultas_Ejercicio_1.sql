-- 2.1 obtener los apellidos de los empleados
select persona.apellidos as ape from persona order by ape asc;
-- 2.2 obtener los apellidos de los empleados sin repeticiones
select distinct persona.apellidos as ape from persona order by ape asc;
-- 2.3 obtener los datos de los empleados que tengan el apellido Lopez
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona join departamento on persona.departamento_id = departamento.id where persona.apellidos = "Lopez";
-- 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez
 select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona join departamento on persona.departamento_id = departamento.id where persona.apellidos = "Lopez" or persona.apellidos = "Perez" order by persona.apellidos asc;
-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14.
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where departamento.numero_departamento = 14;
-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77 
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where departamento.numero_departamento = 37 or departamento.numero_departamento = 77;
-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P.
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
where persona.apellidos like 'P%';
-- 2.8 Obtener el presupuesto total de todos los departamentos
select departamento.numero_departamento as "Nro Depto", departamento.nombre_departamento as "Nombre Depto", sum(persona.presupuesto) as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
group by departamento.nombre_departamento
order by departamento.numero_departamento asc;
-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado  y de su departamento.
select persona.dni as DNI, persona.nombre, persona.apellidos, departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
ORDER BY persona.apellidos asc;
-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto  al nombre y presupuesto de su departamento 
select persona.dni as DNI, concat(persona.nombre,' ', persona.apellidos) as Nombre, departamento.nombre_departamento as "Nombre Depto", persona.presupuesto as Presupuesto
from persona
join departamento on persona.departamento_id = departamento.id
ORDER BY persona.apellidos asc;
-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo  presupuesto sea mayor de 60000 
-- 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un  empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109 
-- 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos 
-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de  informática (código 14) 
-- 2.15 Despedir a los empleados del departamento de informática (código 14) 
-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000
