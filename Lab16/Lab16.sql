-- Consulta 1 --
 select *from Materiales

-- Consulta 2 --
select * from materiales
where clave=1000

-- Consulta 3 --
select clave,rfc,fecha from entregan

-- Consulta 4 --
select * from materiales,entregan
where materiales.clave = entregan.clave

-- Consulta 5 --
select * from entregan,proyectos
where entregan.numero < = proyectos.numero

-- Consulta 6  A --
(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300)

-- Consulta 6  B --
Select *from entregan where clave=1450 or clave=1300

-- Consulta 7 --
(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)

-- Consulta 8 --
select * from entregan where clave=1000

-- Consulta 9 --
select * from entregan, materiales

-- Consulta 10 --
SET DATEFORMAT dmy
Select Descripcion
From Materiales, Entregan
Where materiales.clave = entregan.clave and Entregan.Fecha >= '01-01-2000' and Entregan.Fecha <= '31-12-2000'

-- Consulta 11 --
SET DATEFORMAT dmy
Select distinct Descripcion
From Materiales, Entregan
Where Materiales.clave=Entregan.clave and Entregan.fecha >= '01/01/00' and Entregan.fecha <= '31/12/00'

-- Consulta 12 --
Select P.Numero, P.Denominacion, E.Fecha, E.Cantidad
From Proyectos P, Entregan E
Where E.Numero = P.Numero
Order by P.Numero, E.Fecha DESC

-- Consulta 13 A --
SELECT * FROM Materiales where Descripcion LIKE 'Si%'

-- Consulta 13 B --
SELECT * FROM Materiales where Descripcion LIKE 'Si'

-- Consulta 14 --
/*DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado’;
SET @bar = ' ¿¿¿??? ‘
SET @foo += ' obtienes?’;
PRINT @foo + @bar;*/

-- Consulta 15 --
SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';

-- Consulta 16 --
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';

-- Consulta 17 --
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

-- Consulta 18 --
SET DATEFORMAT dmy
Select Distinct Descripcion
From Materiales M, Entregan E
Where M.Clave = E.Clave and E.Fecha Between '01-01-2000' and '31-12-2000'

-- Consulta 19 --
SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

-- Consulta 20 --
Select RFC, Cantidad, Fecha, Numero
From Entregan E
Where E.RFC IN (Select RFC from Proveedores where RazonSocial Like 'La%' and Numero Between 5000 and 5010)

-- Consulta 21 --
SELECT E.RFC, Cantidad, Fecha, Numero
FROM Entregan E, Proveedores P
WHERE E.RFC = P.RFC AND E.RFC NOT IN (SELECT E.RFC FROM Proveedores WHERE Numero < 5000
UNION
SELECT RFC FROM Proveedores where numero > 5010) AND P.RazonSocial LIKE 'La%' 

-- Consulta 22 --
SELECT E.Cantidad 
FROM Entregan E 
WHERE E.Clave = ANY (SELECT M.Clave FROM Materiales M WHERE M.Costo >450)

-- Consulta 23 --
SELECT TOP 2 * FROM Proyectos

-- Consulta 24 --
SELECT TOP Numero FROM Proyectos

-- Consulta 25 --
ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);

-- Consulta 26 --
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

-- Consulta 27 --
Select SUM(Costo) + SUM(PorcentajeImpuesto) as 'TOTAL'
FROM Materiales M, Entregan E
WHERE E.Clave = M.Clave

-- Vistas Para 5 de las Consultas que Planteaste Anteriormente --

--1.
CREATE VIEW TERMINANEN6
AS SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

--2.
CREATE VIEW EntreganTodo
AS SELECT Clave, RFC, Fecha from Entregan

--3.
CREATE VIEW Materiales1000
AS SELECT * from Materiales WHERE Clave=1000

--4.
CREATE VIEW Descripcionanio2000
AS SELECT DISTINCT Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave and E.Fecha BETWEEN '01_01_2000' and '31-12-2000'

--5.
CREATE VIEW DescMateriales
AS SELECT * FROM Materiales WHERE Descripcion LIKE 'Si%'

--6.
CREATE VIEW PROYPORFECHA 	AS SELECT P.Numero, P.Denominacion, E.Fecha, E.Cantidad 
FROM Proyectos P, Entregan  E
ORDER BY P.Numero, E.Fecha DESC

--7.
CREATE VIEW MaterialesEnEl2000
AS SELECT DISTINCT M.Descripcion
FROM Materiales M,Entregan E
WHERE M.Clave = E.Clave AND E.Fecha > '2000-01-01' AND E.Fecha < '2000-12-31'

--8.
CREATE VIEW ENTREGAS_EN2000
AS SELECT Clave, RFC, Numero, Fecha, Cantidad
FROM Entregan
WHERE Fecha BETWEEN '2000-01-01' AND '2000-12-21'

--9.
CREATE VIEW EMPIEZANCONSI
AS SELECT *
FROM Materiales WHERE Descripcion LIKE 'Si%'



-- Consulta 28 --
SELECT E.Clave, M.Descripcion
FROM Materiales M, Entregan E, Proyectos P
WHERE M.Clave = E.Clave and P.Numero = E.Numero AND P.Denominacion = 'Mexico sin ti no estamos completos'

-- Consulta 29 --
SELECT M.Descripcion, E.Clave
FROM Materiales M, Entregan E, Proveedores P
WHERE M.Clave = E.Clave AND E.RFC = P.RFC AND P.RazonSocial = 'Acme tools'

-- Consulta 30 --
SET DATEFORMAT dmy
SELECT RFC, SUM(Cantidad) AS SUM FROM Entregan E 
WHERE E.Fecha BETWEEN '01-01-2000' AND '31-12-2000'
GROUP BY RFC
HAVING SUM(Cantidad) >= 300

-- Consulta 31 --
SET DATEFORMAT dmy
SELECT Clave, SUM(E.Cantidad) AS 'Total'
FROM Entregan E
WHERE E.Fecha BETWEEN '01-01-2000' AND '31-12-2000' GROUP BY Clave

-- Consulta 32 --
SET DATEFORMAT dmy
CREATE VIEW masVendido
AS SELECT Clave
FROM Entregan
WHERE Fecha BETWEEN '2001-01-01' AND '2001-12-31' GROUP BY Clave
ORDER BY Cantidad DESC
LIMIT 1

CREATE VIEW Vendido AS (SELECT E.Clave, SUM(Cantidad) AS Total FROM Entregan E 
WHERE E.Fecha Between '01-01-2001' and '31-12-2001'
GROUP BY E.Clave )
SELECT TOP 1 Clave 
FROM Vendido

-- Consulta 33 --
Select Descripcion
FROM Materiales
WHERE Descripcion LIKE '%ub%'

/*Select * From Materiales Where Descripcion Like '%ub%'*/

-- Consulta 34 --
SELECT Denominacion, SUM(Cantidad) 'Suma Total'
FROM Proyectos P, Entregan E 
WHERE P.Numero = E.Numero
GROUP BY Denominacion

-- Consulta 35 A --
CREATE VIEW VTelevisa
AS SELECT Pro.Denominacion, E.RFC, P.RazonSocial
FROM Entregan E, Proveedores P, Proyectos Pro
WHERE P.RFC = E.RFC AND E.Numero = Pro.Numero AND Pro.Denominacion LIKE 'Televisa%'

CREATE VIEW Educando
AS SELECT Pro.Denominacion, E.RFC, P.RazonSocial
FROM Entregan E, Proveedores P, Proyectos Pro
WHERE P.RFC = E.RFC AND E.Numero = Pro.Numero AND Pro.Denominacion LIKE 'Educando%'

SELECT T.Denominacion, T.RFC, T.RazonSocial
FROM vtelevisa T
WHERE T.RFC
NOT IN (SELECT RFC FROM educando)

-- Consulta 35 B --
SELECT Pro.Denominacion, E.RFC, P.RazonSocial
FROM Entregan E, Proveedores P, Proyectos Pro
WHERE P.RFC = E.RFC and E.Numero = Pro.Numero and Pro.Denominacion
LIKE 'Televisa%' AND P.RFC NOT IN
(SELECT E.RFC FROM Entregan E, Proyectos Pro WHERE E.Numero = Pro.Numero and Pro.Denominacion LIKE 'Educando%')

/*SELECT Distinct Pro.Denominacion, P.RFC, P.Razonsocial
FROM Proveedores P, Proyectos Pro, Entregan E
WHERE Pro.Numero = E.Numero and E.RFC = P.RFC and E.RFC IN(
SELECT DISTINCT E.TFC FROM Proyectos Pro, Entregan E, Proveedores P WHERE Pro.Numero = E.Numero AND P.RFC = E.RFC AND Denominacion like 'Televisa en %' )
AND E.RFC NOT IN ( SELECT DISTINCT E.RFC FROM Proyectos Pro, Entregan E, Proveedores P WHERE Pro.numero = E.numero AND P.rfc = E.rfc AND Denominacion like 'Educa%')*/

-- Consulta 36 --
CREATE VIEW ProvEdCuahuila
AS SELECT * FROM Entregan
WHERE numero = 5004

SELECT DISTINCT M.Costo, M.Descripcion
FROM Materiales M, Proyectos P, Entregan E, Proveedores Pv
WHERE E.Clave = M.Clave AND E.Numero = P.Numero AND E.RFC = Pv.RFC AND P.Denominacion AND P.Denominacion LIKE 'Televisa%' AND Pv.RFC IN(SELECT RFC FROM ProvEdCuahuila)

-- Consulta 37 --
SELECT M.Descripcion, SUM(E.Cantidad) AS Total, COUNT(*) AS Entregas
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave GROUP BY E.Clave, M.Descripcion