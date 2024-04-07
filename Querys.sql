USE Base;
--ejercicio 1.
-----Ejercicio 1: Obtener los nombres y apellidos de los empleados 
-----junto con los nombres de los proyectos a los que están asignados.

SELECT
CONCAT(e.Nombre,' , ',e.Apellido) as 'Empleado',
p.Nombre as 'Proyecto'
FROM Empleados e
JOIN AsignacionesProyectos ap On  e.EmpleadoID = ap.EmpleadoID
JOIN Proyectos p ON ap.ProyectoID=p.ProyectoID;

--Ejercicio 1.2: Ordenar por apellido y nombre
SELECT
CONCAT(e.Apellido,', ',e.Nombre) as Empleado,
p.Nombre as 'Proyecto'
FROM Empleados e
JOIN AsignacionesProyectos ap On  e.EmpleadoID = ap.EmpleadoID
JOIN Proyectos p ON ap.ProyectoID=p.ProyectoID
ORDER BY Empleado ASC;

--Ejercicio 2
--Obtener los departamentos que tienen al menos un proyecto asignado.
SELECT * FROM AsignacionesProyectos 
SELECT * FROM Empleados
SELECT * FROM Proyectos

SELECT * FROM Proyectos P
INNER JOIN AsignacionesProyectos AP ON p.ProyectoID = AP.ProyectoID
ORDER BY p.ProyectoID ASC;

--estructuramos la tabla en base a lo solicitado
SELECT P.Departamento, COUNT(DISTINCT AP.ProyectoID) AS NumeroDeProyectos
FROM Proyectos P
INNER JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
GROUP BY P.Departamento
ORDER BY NumeroDeProyectos ASC;

--Ejercicio 3: Contar el número de empleados por departamento

SELECT Departamento, COUNT(*) AS Empleados
FROM Empleados
GROUP BY Departamento;

--Ejercicio 4: Obtener los empleados que no tienen ningún proyecto asignado.
SELECT * FROM AsignacionesProyectos 
SELECT * FROM Empleados
SELECT * FROM Proyectos

SELECT E.*
FROM Empleados E
LEFT JOIN AsignacionesProyectos AP ON E.EmpleadoID = AP.EmpleadoID
WHERE AP.EmpleadoID IS NULL;

--Ejercicio 5: Obtener los proyectos que no tienen ningún empleado asignado.
-Ejercicio 4: Obtener los empleados que no tienen ningún proyecto asignado.
SELECT * FROM AsignacionesProyectos 
SELECT * FROM Empleados
SELECT * FROM Proyectos

INSERT INTO Proyectos (ProyectoID, Nombre, Descripcion, Departamento)
VALUES
    (5, 'Proyecto E', 'Contratación de Personal', 'Recursos Humanos'),
    (6, 'Proyecto F', 'Rediseño de la página web', 'Marketing'),
    (7, 'Proyecto G', 'Nuevo plan de ventas', 'Ventas'),
    (8, 'Proyecto H', 'Actualización del sistema contable', 'Contabilidad');

SELECT P.*
FROM Proyectos P
LEFT JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
WHERE AP.ProyectoID IS NULL;

--Ejercicio 6: Obtener los empleados y los proyectos en los que trabajan, incluyendo los empleados sin proyectos asignados y los proyectos sin empleados asignados.

SELECT E.EmpleadoID, E.Nombre, E.Apellido, P.ProyectoID, P.Nombre AS NombreProyecto
FROM Empleados E
LEFT JOIN AsignacionesProyectos AP ON E.EmpleadoID = AP.EmpleadoID
LEFT JOIN Proyectos P ON AP.ProyectoID = P.ProyectoID
UNION
SELECT NULL, NULL, NULL, P.ProyectoID, P.Nombre
FROM Proyectos P
LEFT JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
WHERE AP.ProyectoID IS NULL;

--Ejercicio 7: Obtener la cantidad de proyectos asignados a cada empleado.
SELECT E.EmpleadoID, E.Nombre, E.Apellido, COUNT(AP.ProyectoID) AS NumeroDeProyectos
FROM Empleados E
LEFT JOIN AsignacionesProyectos AP ON E.EmpleadoID = AP.EmpleadoID
GROUP BY E.EmpleadoID, E.Nombre, E.Apellido
ORDER BY E.EmpleadoID ASC;

--Ejercicio 8: Obtener los empleados que trabajan en el departamento de "Ventas" y los proyectos en los que están asignados.

SELECT E.EmpleadoID, E.Nombre, E.Apellido,E.Departamento,  P.ProyectoID, P.Nombre AS NombreProyecto
FROM Empleados E   
INNER JOIN AsignacionesProyectos AP ON E.EmpleadoID = AP.EmpleadoID
INNER JOIN Proyectos P ON AP.ProyectoID = P.ProyectoID
WHERE E.Departamento = 'Ventas';

--Ejercicio 9: Obtener los proyectos que tienen empleados asignados del departamento de "Marketing" y del departamento de "Ventas".

SELECT P.ProyectoID, E.Departamento, P.Nombre AS NombreProyecto
FROM Proyectos P
INNER JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
INNER JOIN Empleados E ON AP.EmpleadoID = E.EmpleadoID
WHERE E.Departamento IN ('Marketing', 'Ventas')
ORDER BY p.ProyectoID;


--Ejercicio 10: Obtener los departamentos que tienen más de un proyecto asignado.
SELECT P.Departamento, COUNT(DISTINCT P.ProyectoID) AS NumeroDeProyectos
FROM Proyectos P
INNER JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
GROUP BY P.Departamento
ORDER BY NumeroDeProyectos DESC;


SELECT P.Departamento, COUNT(DISTINCT P.ProyectoID) AS NumeroDeProyectos
FROM Proyectos P
INNER JOIN AsignacionesProyectos AP ON P.ProyectoID = AP.ProyectoID
GROUP BY P.Departamento
HAVING COUNT(DISTINCT P.ProyectoID) > 1;

