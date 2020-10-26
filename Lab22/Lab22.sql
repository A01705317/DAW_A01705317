--------------- Materiales ---------------
-- Procedimiento Almacenado Crear Material --
IF EXISTS (SELECT name FROM sysobjects
            WHERE name = 'creaMaterial' AND type = 'P')
    DROP PROCEDURE creaMaterial
GO

CREATE PROCEDURE creaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

-- Ejecuta Stored Procedure --
EXECUTE creaMaterial 5000,'Martillos Acme',250,15

-- Consulta de Tabla --
SELECT * FROM Materiales





-- Procedimiento Almacenado Modifica Material --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial
            GO

            CREATE PROCEDURE modificaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                Update Materiales set Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
				where clave=@uclave
            GO

-- Ejecuta Stored Procedure --
EXECUTE modificaMaterial 5000,'Martillos Acme',300,10

-- Consulta de Tabla --
SELECT * FROM Materiales





-- Procedimiento Almacenado Elimina Material --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial
            GO

            CREATE PROCEDURE eliminaMaterial
                @uclave NUMERIC(5,0)
            AS
                Delete from Materiales  where clave= @uclave
            GO

-- Ejecuta Stored Procedure --
EXECUTE eliminaMaterial 5000

-- Consulta de Tabla --
SELECT * FROM Materiales





--------------- Proyectos ---------------

-- Procedimiento Almacenado Crear Proyecto --
 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyectos' AND type = 'P')
                DROP PROCEDURE creaProyectos
            GO
            CREATE PROCEDURE creaProyectos
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO

-- Ejecuta Stored Procedure --
EXECUTE creaProyectos 6000,'Route 66'

-- Consulta de Tabla --
SELECT * FROM Proyectos





-- Procedimiento Almacenado Modificar Proyecto --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProyecto' AND type = 'P')
                DROP PROCEDURE modificaProyecto
            GO

            CREATE PROCEDURE modificaProyecto
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                Update Proyectos set Numero=@unumero, Denominacion=@udenominacion where Numero=@unumero
            GO

-- Ejecuta Stored Procedure --
EXECUTE modificaProyecto 6000,'Route 99'

-- Consulta de Tabla --
SELECT * FROM Proyectos





-- Procedimiento Almacenado Eliminar Proyecto --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProyecto' AND type = 'P')
                DROP PROCEDURE eliminaProyecto
            GO

            CREATE PROCEDURE eliminaProyecto
               @unumero NUMERIC(5,0)
            AS
                Delete from Proyectos where Numero= @unumero
            GO

-- Ejecuta Stored Procedure --
EXECUTE eliminaProyecto 6000

-- Consulta de Tabla --
SELECT * FROM Proyectos





--------------- Proveedor ---------------

-- Procedimiento Almacenado Crear Proveedor --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedores' AND type = 'P')
                DROP PROCEDURE creaProveedores
            GO
            CREATE PROCEDURE creaProveedores
                @uRFC CHAR(13),
                @uRazonSocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@uRFC, @uRazonSocial)
            GO

-- Ejecuta Stored Procedure --
EXECUTE creaProveedores IIII800101,'Home Depot'

-- Consulta de Tabla --
SELECT * FROM Proveedores





-- Procedimiento Almacenado Modificar Proveedor --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProveedores' AND type = 'P')
                DROP PROCEDURE modificaProveedores
            GO

            CREATE PROCEDURE modificaProveedores
                 @uRFC CHAR(13),
                @uRazonSocial VARCHAR(50)
            AS
                Update Proveedores set RFC=@uRFC, RazonSocial=@uRazonSocial where RFC=@uRFC
            GO

-- Ejecuta Stored Procedure --
EXECUTE modificaProveedores IIII800101,'PCL Construction'

-- Consulta de Tabla --
SELECT * FROM Proveedores





-- Procedimiento Almacenado Eliminar Proveedor --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProveedores' AND type = 'P')
                DROP PROCEDURE eliminaProveedores
            GO

            CREATE PROCEDURE eliminaProveedores
               @uRFC CHAR(13)
            AS
                Delete from Proveedores where RFC= @uRFC
            GO

-- Ejecuta Stored Procedure --
EXECUTE eliminaProveedores IIII800101

-- Consulta de Tabla --
SELECT * FROM Proveedores





--------------- Entregan ---------------

-- Procedimiento Almacenado Crear Entrega --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaEntregan' AND type = 'P')
                DROP PROCEDURE creaEntregan
            GO
            CREATE PROCEDURE creaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                INSERT INTO Entregan VALUES(@uclave, @uRFC, @unumero,@ufecha, @uCantidad)
            GO

-- Ejecuta Stored Procedure --
EXECUTE creaEntregan 100, EEEE800101, 5035, '12/10/2020', 500

-- Consulta de Tabla --
SELECT * FROM Entregan




-- Procedimiento Almacenado Modificar Entrega --
--SET DATETIME dmy
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaEntregan' AND type = 'P')
                DROP PROCEDURE modificaEntregan
            GO

            CREATE PROCEDURE modificaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                Update Entregan set Clave=@uclave, RFC=@uRFC, Numero=@unumero, Cantidad=@uCantidad where Clave=@uclave and  RFC=@uRFC and  Numero=@unumero and Cantidad=@uCantidad
            GO

-- Ejecuta Stored Procedure --
EXECUTE modificaEntregan 100, EEEE800101, 5035, '13/10/2020', 150

-- Consulta de Tabla --
SELECT * FROM Entregan





-- Procedimiento Almacenado Eliminar Entrega --
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaEntregan' AND type = 'P')
                DROP PROCEDURE eliminaEntregan
            GO

            CREATE PROCEDURE eliminaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                Delete from Entregan where Clave=@uclave and  RFC=@uRFC and  Numero=@unumero and Fecha=@ufecha and Cantidad=@uCantidad 
            GO

-- Ejecuta Stored Procedure --
EXECUTE eliminaEntregan EEEE800101

-- Consulta de Tabla --
SELECT * FROM Entregan





-------------- Store Procedure en Base de Datos ---------------

-- Define el siguiente stored procedure en tu base de datos --
IF EXISTS (SELECT name FROM sysobjects
            WHERE name = 'queryMaterial' AND type = 'P')
            DROP PROCEDURE queryMaterial
            GO

            CREATE PROCEDURE queryMaterial
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2)

            AS
                SELECT * FROM Materiales WHERE descripcion
                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
            GO

-- Ejecuta Stored Procedure --
EXECUTE queryMaterial 'Lad',20







/*Ejecutar Stored Procedures desde la aplicación cliente
Para uno de tus laboratorios anteriores o proyecto, crea un stored procedure en MySQL de manera similar a como lo acabas de hacer en SQL Server.*/

-- Crear Nadador --
CREATE PROCEDURE '​crearNadador' ​(nadador_Nombre VARCHAR(50), nadador_Apellido VARCHAR(50), nadador_Estilo VARCHAR(250) , nadador_Distancia INT(4) , nadador_Tiempo INT(2))
BEGIN
INSERT INTO accesorio(id_accesorio, nombre, descripcion, cantidad, precio) VALUES (uIdAccesorio, uNombre , uDescripcion, uCantidad, uPrecio);


-- Modificar Nadador --
CREATE PROCEDURE '​modificarNadador' ​nadador_Nombre VARCHAR(50), nadador_Apellido VARCHAR(50), nadador_Estilo VARCHAR(250) , nadador_Distancia INT(4) , nadador_Tiempo INT(2))
BEGIN
UPDATE accesorio SET Nombre=nadador_Nombre, Epellido=nadador_Apellido, Estilo=nadador_Estilo, Distancia=nadador_Distancia, Tiempo=nadador_Tiempo where d_accesorio=uIdAccesorio;

-- Eliminar Nadador --
CREATE PROCEDURE '​eliminarNadador' ​(nadador_Nombre VARCHAR(50))
BEGIN
DELETE FROM id_accesorio=uIdAccesorio;


CALL crearNadador('Michael', 'Andrew', Mariposa, 100, 54)
CALL modificarNadador('Michael', 'Andrew', Mariposa, 100, 53)
CALL eliminarNadador('Michael')


/*Para reforzar el entendimiento de los SP, crea un SP que sea de utilidad en tu proyecto
(en caso de usar otra tecnología, se deberá asumir). Incorpora dicho SP en tu reporte.*/
DROP PROCEDURE IF EXISTS '​crearCliente';
CREATE PROCEDURE '​crearCliente' ​(cliente_IdCliente INT(5), cliente_Nombre VARCHAR(30),cliente_Apellido VARCHAR(30), cliente_Edad INT(3), cliente_CP INT(5), cliente_CorreoElectronico VARCHAR(30), cliente_Telefono INT(10), cliente_Sexo VARCHAR(8), cliente_TipoSeguro VARCHAR(20), cliente_DatoRequerido1 VARCHAR(20), cliente_DatoRequerido2 VARCHAR(20), cliente_DatoRequerido3 VARCHAR(20), cliente_DatoRequerido4 VARCHAR(20), cliente_DatoRequerido5 VARCHAR(20))
BEGIN
INSERT INTO Cliente(IdCliente, Nombre, Apellido, Edad, CP, CorreoElectronico, Telefono, Sexo, TipoSeguro, DatoRequerido1, DatoRequerido2, DatoRequerido3, DatoRequerido4, DatoRequerido5) VALUES (cliente_IdCliente, cliente_Nombre, cliente_Apellido, cliente_Edad, cliente_CP, cliente_CorreoElectronico, cliente_Telefono, cliente_Sexo, cliente_TipoSeguro, cliente_DatoRequerido1, cliente_DatoRequerido2, cliente_DatoRequerido3, cliente_DatoRequerido4, cliente_DatoRequerido5);
END