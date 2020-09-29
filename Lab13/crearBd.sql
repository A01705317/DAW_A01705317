-- EJERCICIO 1 --


-- ELIMINACIÓN DE TABLAS --
/*
drop table Materiales
drop table Proveedores
drop table Proyectos
drop table Entregan
*/


-- CREACIÓN DE TABLAS --
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales
CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE  Proyectos
CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE  Entregan
CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)


-- CONSULTAS DE TABLAS EXISTENTES --
--select * from sysobjects where xtype='U'


-- CARGA DE DATOS A LAS TABLAS --
BULK INSERT a1705317.a1705317.[Materiales]
   FROM 'e:\wwwroot\rcortese\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1705317.a1705317.[Proveedores]
   FROM 'e:\wwwroot\rcortese\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1705317.a1705317.[Proyectos]
   FROM 'e:\wwwroot\rcortese\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1705317.a1705317.[Entregan]
	FROM 'e:\wwwroot\rcortese\entregan.csv'
	WITH
		(
		    CODEPAGE = 'ACP',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR='\n'
		)


-- CONSULTAS DE TABLAS EXISTENTES --
--select * from sysobjects where xtype='U'





-- EJERCICIO 2 --

--INSERT INTO Materiales values(1000, 'xxx', 1000)
--SELECT  * FROM Materiales

--Delete from Materiales where Clave = 1000 and Costo = 1000
--SELECT  * FROM Materiales

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)
ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Entregan add constraint llaveEntregan  PRIMARY KEY (clave,rfc,numero,fecha)

--NOTE:     ALTER TABLE tableName drop constraint ConstraintName

--INSERT INTO Materiales values(1000, 'xxx', 1000)

/*sp_helpconstraint Materiales
sp_helpconstraint Proyectos
sp_helpconstraint Proveedores
sp_helpconstraint Entregan*/





-- EJERCICIO 3 --

--NOTE:     SELECT * from nombre de la tabla ;

/*SELECT * from Materiales
SELECT * from Proyectos
SELECT * from Proveedores
SELECT * from Entregan*/

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);
Delete from Entregan where Clave = 0

--ALTER TABLE entregan add constraint cfentreganclave
--foreign key (clave) references materiales(clave);

--INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);

/*sp_helpconstraint Materiales
sp_helpconstraint Proyectos
sp_helpconstraint Proveedores
sp_helpconstraint Entregan*/





-- EJERCICIO 4 --

--INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
--Delete from Entregan where cantidad = 0

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;
--INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
