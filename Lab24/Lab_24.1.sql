-- ELIMINACIÓN DE TABLAS --

/*
DROP TABLE Clientes_Banca
DROP TABLE Tipos_Movimiento
DROP TABLE Movimientos
*/





-- CREACIÓN DE TABLAS --
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Clientes_Banca')
DROP TABLE Clientes_Banca
CREATE TABLE Clientes_Banca
(
    NoCuenta varchar(5),
    Nombre varchar(30),
    Saldo numeric(10,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tipos_Movimiento')
DROP TABLE Tipos_Movimiento
CREATE TABLE Tipos_Movimiento
(
    ClaveM varchar(2),
    Descripcion varchar(30)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Movimientos')
DROP TABLE Movimientos
CREATE TABLE Movimientos
(    
    NoCuenta varchar(5),
    ClaveM varchar(2),
    Fecha datetime,
    Monto numeric(10,2)
)

-- CONSULTAS DE TABLAS EXISTENTES --
select * from sysobjects where xtype='U'



BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1


SELECT * FROM Clientes_Banca;

SELECT * FROM Clientes_Banca;


BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4


SELECT * FROM Clientes_Banca;

SELECT * FROM Movimientos;



BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000);


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

SELECT * FROM Clientes_Banca;

SELECT * FROM Movimientos;


/*
CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
    @unoCuenta  varchar(5),
    @umontoRetiro numeric(10,2)
AS
    BEGIN TRANSACTION RETIRO
    INSERT INTO Cliente_movimiento
VALUES(@unoCuenta,'A',GETDATE(),@umontoRetiro);
    UPDATE Cliente SET SALDO = SALDO -@umontoRetiro
    WHERE noCuenta = @unoCuenta
    COMMIT TRANSACTION RETIROGO
GO*/

CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
    @NoCuenta VARCHAR(5),
    @Monto NUMERIC(10,2)
AS
    BEGIN TRANSACTION T1
        INSERT INTO MOVIMIENTOS VALUES(@NoCuenta,'A',GETDATE(),@Monto);
        UPDATE CLIENTES_BANCA SET SALDO = SALDO - @Monto
        WHERE NoCuenta = @NoCuenta
    IF @@ERROR = 0
        COMMIT TRANSACTION T1
    ELSE
        BEGIN
            PRINT 'El retiro se tuvo que cancelar.'
        ROLLBACK TRANSACTION T1
    END
GO


/*
CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
	@unoCuenta  varchar(5),
	@umontoDeposito numeric(10,2)

AS
	BEGIN TRANSACTION RETIRO
	INSERT INTO Cliente_movimiento VALUES(@unoCuenta,'B',GETDATE(),@umontoDeposito);
	UPDATE Cliente SET SALDO = SALDO +@umontoDeposito WHERE noCuenta = @unoCuenta
	COMMIT TRANSACTION RETIRO
GO
*/

CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
    @NoCuenta VARCHAR(5),
    @Monto NUMERIC(10,2)
AS
    BEGIN TRANSACTION T2
        UPDATE CLIENTES_BANCA SET SALDO = SALDO + @Monto
        WHERE NoCuenta = @NoCuenta;
        INSERT INTO MOVIMIENTOS
VALUES(@NoCuenta,'B',GETDATE(),@Monto)
    IF @@ERROR = 0
        COMMIT TRANSACTION T2
    ELSE
        BEGIN
            PRINT 'El deposito se tuvo que cancelar.'
        ROLLBACK TRANSACTION T2
    END
GO



