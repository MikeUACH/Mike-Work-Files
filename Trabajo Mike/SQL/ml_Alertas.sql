SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ml_Alertas]
AS
BEGIN
    DECLARE @idTendencia BIGINT;
    DECLARE @idGas BIGINT;
    DECLARE @mes INT;
    DECLARE @tipoAlerta VARCHAR(10);
    DECLARE @alertaActiva BIT;
    DECLARE @idLlave BIGINT;
    DECLARE @limite NUMERIC(10,4);
    DECLARE @valor30 NUMERIC(10,4);
    DECLARE @valor60 NUMERIC(10,4);
    DECLARE @valor90 NUMERIC(10,4);
    DECLARE @fecha DATETIME;

    -- Obtener todas las tendencias que superan los límites
    DECLARE tendencia_cursor CURSOR FOR
    SELECT t.id AS idTendencia, t.idGas, t.Fecha, t.v30, t.v60, t.v90, l.limite, ll.id AS idLlave
    FROM dbo.ml_Tendencia t
    JOIN dbo.ml_Gas_Limite l ON t.idGas = l.id
    JOIN dbo.ml_LlavesG ll ON t.id = ll.idTend
    WHERE t.v30 > l.limite OR t.v60 > l.limite OR t.v90 > l.limite;

    OPEN tendencia_cursor;
    FETCH NEXT FROM tendencia_cursor INTO @idTendencia, @idGas, @fecha, @valor30, @valor60, @valor90, @limite, @idLlave;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determinar el mes de la alerta
        SET @mes = MONTH(@fecha);

        -- Insertar alerta para v30
        IF @valor30 > @limite
        BEGIN
            SET @tipoAlerta = 'v30';
            SET @alertaActiva = 1; -- Asumimos que todas las alertas están activas al momento de creación

            INSERT INTO dbo.ml_Gas_Alerta (mes, tipoAlerta, alertaActiva, idTendencia, idLlave, idGas, valorActual)
            VALUES (@mes, @tipoAlerta, @alertaActiva, @idTendencia, @idLlave, @idGas, @valor30);
        END

        -- Insertar alerta para v60
        IF @valor60 > @limite
        BEGIN
            SET @tipoAlerta = 'v60';
            SET @alertaActiva = 1; -- Asumimos que todas las alertas están activas al momento de creación

            INSERT INTO dbo.ml_Gas_Alerta (mes, tipoAlerta, alertaActiva, idTendencia, idLlave, idGas, valorActual)
            VALUES (@mes, @tipoAlerta, @alertaActiva, @idTendencia, @idLlave, @idGas, @valor60);
        END

        -- Insertar alerta para v90
        IF @valor90 > @limite
        BEGIN
            SET @tipoAlerta = 'v90';
            SET @alertaActiva = 1; -- Asumimos que todas las alertas están activas al momento de creación

            INSERT INTO dbo.ml_Gas_Alerta (mes, tipoAlerta, alertaActiva, idTendencia, idLlave, idGas, valorActual)
            VALUES (@mes, @tipoAlerta, @alertaActiva, @idTendencia, @idLlave, @idGas, @valor90);
        END

        FETCH NEXT FROM tendencia_cursor INTO @idTendencia, @idGas, @fecha, @valor30, @valor60, @valor90, @limite, @idLlave;
    END

    CLOSE tendencia_cursor;
    DEALLOCATE tendencia_cursor;
END
GO
