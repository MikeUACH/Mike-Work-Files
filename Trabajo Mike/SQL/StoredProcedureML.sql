/****** Object:  StoredProcedure [dbo].[sp_ML_AgregarTendencias]    Script Date: 5/24/2024 1:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ML_AgregarTendencias]
	@archivo varchar(100), @gas varchar(50),@limite numeric(10,4),@valor30 numeric(10,4),@valor60 numeric(10,4),@valor90 numeric(10,4)
/*
 cargar datos de tendencias de Machine learning
 parametros
 		@archivo	nombre  del archivo original lde datos (gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls)
					Incluye fecha y hora de generacion del aarchivo de gas-in-oil
		@gas		el nombre del gas usado en las tendencias
		@limite		valor limite del gas para determinar si se rebasa o no el valor de tendencias
		@valor30	valor esperado a 30 dias para el gas reportado
		@valor60	valor esperado a 60 dias para el gas reportado
		@valor90	valor esperado a 90 dias para el gas reportado



begin transaction
Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','C2H2_Acetylene',100,80,90,120
select * from [ml_Gas]
select * from [ml_Tendencia]
Exec sp_ML_AgregarTendencias 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls','C2H2_Acetylene',300,80,90,120
select * from [ml_Gas]
select * from [ml_Tendencia]
rollback transaction

*/	


AS
declare @FileGOL varchar(100)
declare @combokey varchar(100)
declare @fechaV varchar(20)
declare @fecha datetime
declare @idGas bigint
BEGIN
--gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls
	set @FileGOL=substring(@archivo,1,len(@archivo)-19)
	set @fechaV=substring(@archivo,len(@FileGOL)+1,15)
	set @fecha=convert(datetime,left(@fechaV,8),112)-- 112	ISO	12 = yyyymmdd
SELECT @combokey=[ComboKey]
  FROM [dbo].[PlantasGOL]
  where [FileGOL]=@FileGOL

print '@FileGOL='+@FileGOL
print '@combokey='+@combokey
print '@fechaV='+@fechaV
print '@fecha='+cast(@fecha as varchar)
	if exists(select * from [dbo].[ml_Gas] where combokey=@combokey and gas=@gas)
	begin
	
		select @idGas=[id] 
		from [dbo].[ml_Gas] where combokey=@combokey and gas=@gas

		update g 
		set limite=@limite
		from [dbo].[ml_Gas] g
		where [id]=@idGas
	end
	else
	begin 
		insert into [dbo].[ml_Gas]([comboKey],[gas],[limite])
		values(@combokey,@gas,@limite)
		set @idGas=SCOPE_IDENTITY() 
	end
	SELECT 

	print '@idGas='+cast(@idGas as varchar)

	INSERT INTO [dbo].[ml_Tendencia] ([idGas], [Fecha], [v30], [v60], [v90])
    VALUES (@idGas, @fecha, @valor30, @valor60, @valor90);

	-- Get the ID of the newly inserted trend
    SET @idTendencia = SCOPE_IDENTITY();
	
	  -- Check for alerts and insert them into ml_Avisos if necessary
    IF @valor30 >= @limite
    BEGIN
        INSERT INTO [dbo].[ml_Avisos] ([Comentario], [idTendencia], [FechaAviso], [Gas], [Valor])
        VALUES (@idTendencia, CONVERT (date, GETDATE()), 'v30', @valor30, 'Alerta: en 30 dias el limite sera rebasado');
    END

    IF @valor60 >= @limite
    BEGIN
        INSERT INTO [dbo].[ml_Avisos] ([Comentario], [idTendencia], [FechaAviso], [TipoAviso], [Valor])
        VALUES (@idTendencia, CONVERT (date, GETDATE()), 'v60', @valor60, 'Alerta: en 60 dias el limite sera rebasado');
    END

    IF @valor90 >= @limite
    BEGIN
        INSERT INTO [dbo].[ml_Avisos] ([Comentario], [idTendencia], [FechaAviso], [TipoAviso], [Valor])
        VALUES (@idTendencia, CONVERT (date, GETDATE()), 'v90', @valor90, 'Alerta: en 90 dias el limite sera rebasado');
    END

	-- Handle email notifications
    DECLARE email_cursor CURSOR FOR
    SELECT u.email, u.recibirCorreos
    FROM [dbo].[UsuariosPlantas] u
    WHERE u.idPlanta = @idPlanta;

    OPEN email_cursor;

    FETCH NEXT FROM email_cursor INTO @email, @recibirCorreos;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @recibirCorreos = 1
        BEGIN
            -- Insert logic to send email notification
            -- For example, you could call a stored procedure or use SQL Server Agent to send emails
            PRINT 'Sending email to ' + @email;
        END

        FETCH NEXT FROM email_cursor INTO @email, @recibirCorreos;
    END

    CLOSE email_cursor;
    DEALLOCATE email_cursor;
END

