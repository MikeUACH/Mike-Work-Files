/****** Object:  StoredProcedure [dbo].[sp_ML_AgregarTendencias]    Script Date: 6/20/2024 1:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ML_AgregarTendencias]
	@archivo varchar(100), @gas varchar(50),@limite numeric(10,4),@valoractual numeric(10,4),@valor30 numeric(10,4),@valor60 numeric(10,4),@valor90 numeric(10,4)
/*
 cargar datos de tendencias de Machine learning
 parametros
 		@archivo	nombre  del archivo original lde datos (gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls)
					Incluye fecha y hora de generacion del aarchivo de gas-in-oil
		@gas		el nombre del gas usado en las tendencias
		@limite		valor limite del gas para determinar si se rebasa o no el valor de tendencias
		@valoractual valor del gas actualmente
		@valor30	valor esperado a 30 dias para el gas reportado
		@valor60	valor esperado a 60 dias para el gas reportado
		@valor90	valor esperado a 90 dias para el gas reportado



begin transaction

DELETE [ml_Tendencia]
DELETE [ml_Gas_Limite]
DELETE [ml_LlavesG]
DELETE [ml_Gas_Alerta]
DELETE [Usuarios_Gas]

DBCC CHECKIDENT (ml_Gas_Limite, RESEED,0)
DBCC CHECKIDENT (ml_Tendencia, RESEED,0)
DBCC CHECKIDENT (ml_LlavesG, RESEED,0)
DBCC CHECKIDENT (ml_Gas_Alerta, RESEED,0)
DBCC CHECKIDENT (Usuarios_Gas, RESEED,0)
begin transaction

Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','H',50,100,30,30,130
select * from [ml_Gas_Limite]
select * from [ml_Tendencia]
select * from [ml_LlavesG]
EXEC dbo.sp_ml_Alertas
SELECT * FROM ml_Gas_Alerta
SELECT * FROM Usuarios_Gas

rollback transaction
Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','L',300,110,80,90,120
select * from [ml_Gas_Limite]
select * from [ml_Tendencia]
select * from [ml_LlavesG]

Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','H',400,110,80,90,120
select * from [ml_Gas_Limite]
select * from [ml_Tendencia]
select * from [ml_LlavesG]

rollback transaction
INSERT INTO Usuarios_Gas(correoUser) VALUES ('a343441@uach.mx')
begin transaction
Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','H20',300,80,90,120
select * from [ml_Gas_Limite]
select * from [ml_Tendencia]
select * from [ml_LlavesG]
rollback transaction
*/	

AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    DECLARE @FileGOL varchar(100);
    DECLARE @combokey varchar(100);
    DECLARE @fechaV varchar(20);
    DECLARE @fecha datetime;
    DECLARE @idGas bigint;
    DECLARE @idPG int;
    DECLARE @idTend bigint;
    DECLARE @idLlave bigint;
    DECLARE @idAlerta bigint = NULL;
    DECLARE @idUser bigint;

    -- Extraer partes del archivo
    SET @FileGOL = SUBSTRING(@archivo, 1, LEN(@archivo) - 19);
    SET @fechaV = SUBSTRING(@archivo, LEN(@FileGOL) + 1, 15);
    SET @fecha = CONVERT(datetime, LEFT(@fechaV, 8), 112); -- 112 = ISO = yyyyMMdd

    -- Obtener ComboKey e idPG
    SELECT @combokey = [ComboKey], @idPG = [id]
    FROM [dbo].[PlantasGOL]
    WHERE [FileGOL] = @FileGOL;

    PRINT '@combokey=' + @combokey;
    PRINT '@fechaV=' + @fechaV;
    PRINT '@fecha=' + CAST(@fecha AS varchar);

    -- Insertar o actualizar ml_Gas_Limite
    IF EXISTS(SELECT * FROM [dbo].[ml_Gas_Limite] WHERE gas = @gas)
    BEGIN
        SELECT @idGas = [id]
        FROM [dbo].[ml_Gas_Limite]
        WHERE gas = @gas;

        UPDATE g
        SET limite = @limite
        FROM [dbo].[ml_Gas_Limite] g
        WHERE [id] = @idGas;
    END
    ELSE
    BEGIN 
        INSERT INTO [dbo].[ml_Gas_Limite]([gas], [limite])
        VALUES(@gas, @limite);
        SET @idGas = SCOPE_IDENTITY();
    END;

    PRINT '@idGas=' + CAST(@idGas AS varchar);

    -- Insertar en ml_Tendencia
    INSERT INTO [dbo].[ml_Tendencia] ([idGas], [idPG], [Fecha], [valorActual], [v30], [v60], [v90], [limit])
    VALUES (@idGas, @idPG, @fecha, @valoractual, @valor30, @valor60, @valor90, @limite);

    -- Obtener idTendencia
    SET @idTend = SCOPE_IDENTITY();

    -- Insertar en ml_Gas_Alerta (si es necesario)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[ml_Gas_Alerta] WHERE [idGas] = @idGas)
    BEGIN
        INSERT INTO [dbo].[ml_Gas_Alerta] ([mes], [tipoAlerta], [idTendencia], [idGas], [valorActual])
        VALUES (0, 'Default', @idTend, @idGas, @valoractual);
        SET @idAlerta = SCOPE_IDENTITY();
    END
    ELSE
    BEGIN
        SELECT @idAlerta = [id]
        FROM [dbo].[ml_Gas_Alerta]
        WHERE [idGas] = @idGas;
    END;

    PRINT '@idAlerta=' + CAST(@idAlerta AS varchar);

    -- Insertar en Usuarios_gas
    /*INSERT INTO dbo.Usuarios_gas (correoUser, alertaActiva, CuerpoCorreo, fechaEnvio, idAlerta)
    VALUES ('a343441@uach.mx', 1, 'Este es el cuerpo del correo', GETDATE(), @idAlerta);*/

    SET @idUser = SCOPE_IDENTITY();

    -- Insertar en ml_LlavesG
    INSERT INTO [dbo].[ml_LlavesG] ([idGOL], [idTend], [idGas], [idAlerta], [idUser])
    VALUES (@idPG, @idTend, @idGas, @idAlerta, @idUser);

    SET @idLlave = SCOPE_IDENTITY();

    COMMIT TRANSACTION;
END;

