CREATE TABLE [dbo].[ml_Alerta] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [idTendencia] [bigint] NOT NULL,
    [FechaAviso] [datetime] NOT NULL,
      NOT NULL,
    [Valor] [numeric](10,4) NOT NULL,
    [Comentario] varchar(50) NOT NULL
    CONSTRAINT [PK_ml_Avisos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Avisos_Tendencia] FOREIGN KEY ([idTendencia]) REFERENCES [dbo].[ml_Tendencia] ([id])
);
GO
