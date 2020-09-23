-- Eliminación de Tablas --
/*
drop table Materiales
drop table Proveedores
drop table Proyectos
drop table Entregan
*/

-- Creación de Tablas --
CREATE TABLE Materiales
(
    Clave numeric(5) not null,
    Descripcion varchar(50),
    Costo numeric(8,2)
);

CREATE TABLE Proveedores
(
    RFC char(13) not null,
    RazonSocial varchar(50)
);

CREATE TABLE Proyectos
(
    Numero numeric(5) not null,
    Denominacion varchar(50)
);

CREATE TABLE Entregan
(
    Clave numeric(5) not null,
    RFC char(13) not null,
    Numero numeric(5) not null,
    Fecha DateTime not null,
    Cantidad numeric(8,2)
);


-- Carga de Archivos --
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

SET DATEFORMAT dmy

BULK INSERT a1705317.a1705317.[Entregan]
	FROM 'e:\wwwroot\rcortese\entregan.csv'
	WITH
		(
		    CODEPAGE = 'ACP',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR='\n'
		)
--
SELECT  * FROM Materiales