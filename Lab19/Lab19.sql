-- Consulta 1 --
-- La suma de las cantidades e importe total de todas las entregas realizadas durante el 97--
SELECT SUM(E.cantidad) AS 'Total_Cantidades', SUM(Cantidad*Costo) AS 'Importe_Total'
FROM Entregan E, Materiales M
WHERE E.Fecha BETWEEN '1997-01-01' AND '1997-12-31'

-- Consulta 2 --
-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.--
SELECT P.RazonSocial AS 'Nombre', COUNT(E.RFC) AS 'Numero Entregas', SUM(E.Cantidad*M.Costo) AS 'Importe Total'
FROM Proveedores P, Entregan E, Materiales M
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial

-- Consulta 3 --
/* Por cada material obtener la clave y descripción del material, la cantidad total entregada,
la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas 
de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.*/
SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) AS 'Cantidad Total', MIN(E.Cantidad) AS 'Cantidad Mínima',MAX(E.Cantidad) AS 'Cantidad Máxima', AVG(E.Cantidad) AS 'Cantidad Promedio'
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400

-- Consulta 4 --
/*Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, 
detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500.*/
SELECT DISTINCT P.RazonSocial, AVG(E.Cantidad) AS 'Cantidad Promedio', M.Clave, M.Descripcion
FROM Materiales M, Entregan E, Proveedores P
WHERE M.Clave = E.Clave AND P.RFC = E.RFC
GROUP BY P.RazonSocial, M.Clave, M.Descripcion HAVING AVG(E.Cantidad) > 500

-- Consulta 5 --
/*Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores:
aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450.*/
SELECT DISTINCT P.RazonSocial, AVG(E.Cantidad) AS 'Cantidad Promedio', M.Clave, M.Descripcion
FROM Entregan E, Proveedores P, Materiales M
WHERE E.Clave = M.Clave AND P.RFC = E.RFC
GROUP BY P.RazonSocial, M.Clave, M.Descripcion HAVING AVG(E.Cantidad) < 370 OR AVG(E.Cantidad) > 450


-- 6 Inserciones --
INSERT INTO Materiales VALUES (1440, 'Madera', 250.00)
INSERT INTO Materiales VALUES (1450, 'Clavos', 100.00)
INSERT INTO Materiales VALUES (1460, 'Biga Metálica', 1500.00)
INSERT INTO Materiales VALUES (1470, 'Acero', 1700.00)
INSERT INTO Materiales VALUES (1480, 'Poliestireno', 200.00)

-- Consulta 7 --
/* Clave y descripción de los materiales que nunca han sido entregados. */
SELECT M.Clave, M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN
(SELECT E.Clave FROM entregan E)

-- Consulta 8 --
/*Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'.*/
SELECT P.RazonSocial
FROM Entregan E, Proveedores P
WHERE P.RFC = E.RFC AND E.Numero IN (SELECT numero FROM proyectos WHERE denominacion LIKE 'Vamos%' OR denominacion LIKE 'Quer%') GROUP BY P.RazonSocial

-- Consulta 9 --
/*Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.*/
SELECT M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN ( SELECT DISTINCT E.Clave FROM Entregan E, Proyectos P WHERE P.Numero = E.Numero AND P.Denominacion LIKE 'CIT Yucatán')

-- Consulta 10 --
/*Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor 
al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'.*/
SELECT P.RazonSocial, AVG(E.Cantidad) AS 'Promedio de Entregas'
FROM Entregan E, proveedores P
WHERE P.RFC = E.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad) > (SELECT AVG(Cantidad) FROM Entregan WHERE RFC = 'VAGO780901');

-- Consulta 11 --
/* RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas
cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.*/
SET DATEFORMAT dmy
SELECT Pv2000.RFC, Pv2000.RazonSocial
FROM (SELECT P.RFC, P.RazonSocial, SUM(E.Cantidad) AS 'CantidadTotal'
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC AND Fecha BETWEEN '01/01/2000' AND '31/12/2000' AND P.RFC IN (SELECT Pv.RFC FROM Proveedores Pv, Entregan E, Proyectos Py
WHERE Pv.RFC = E.RFC AND E.Numero = Py.Numero AND Py.Denominacion = 'Infonavit Durango')
GROUP BY P.RFC, P.RazonSocial) AS Pv2000,(SELECT P.RFC, P.RazonSocial, SUM(E.Cantidad) AS CantidadTotal
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC AND Fecha BETWEEN '01/01/2001' AND '31/12/2001'AND P.RFC IN		 
(SELECT Pv.RFC FROM Proveedores Pv, Entregan E, Proyectos Py WHERE Pv.RFC = E.RFC AND E.Numero = Py.Numero AND Py.Denominacion = 'Infonavit Durango')
GROUP BY P.RFC, P.RazonSocial) AS Pv2001
WHERE Pv2000.RFC = Pv2001.RFC AND Pv2000.CantidadTotal > Pv2001.CantidadTotal
