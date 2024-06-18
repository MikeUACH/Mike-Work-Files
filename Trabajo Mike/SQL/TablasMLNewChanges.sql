drop table if exists ml_Gas_Limite
drop table if exists ml_Tendencia
drop table if exists ml_Gas_Alerta
drop table if exists Usuarios_gas
drop table if exists ml_LlavesG
/****** Object:  Table [dbo].[ml_Gas_Limite]    Script Date: 24/05/2024 12:35:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ml_Gas_Limite] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [gas] [varchar](50) NOT NULL,
    [limite] numeric(10,4) NOT NULL,
    CONSTRAINT [PK_ml_Gas_Limite] PRIMARY KEY CLUSTERED ([id] ASC),
);
GO
/****** Object:  Table [dbo].[ml_Tendencia]    Script Date: 24/05/2024 12:35:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ml_Tendencia](
	[id] [bigint] identity(1,1) NOT NULL,
	[idGas] [bigint] NOT NULL,
	[idPG] [int] NOT NULL,
	[valorActual] numeric(10,4) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 	[v30] numeric(10,4) NOT NULL,
	[v60] numeric(10,4) NOT NULL,
	[v90] numeric(10,4) NOT NULL,
	[limit] numeric(10,4) NULL,
 CONSTRAINT [PK_ml_Tendencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ml_Tendencia]  WITH NOCHECK ADD  CONSTRAINT [FK_Tendencia_idGas] FOREIGN KEY([idGas])
REFERENCES [dbo].[ml_Gas_Limite] ([id]);
GO

ALTER TABLE [dbo].[ml_Tendencia]  WITH NOCHECK ADD  CONSTRAINT [FK_Tendencia_idPG] FOREIGN KEY([idPG])
REFERENCES [dbo].[PlantasGOL] ([id]);
GO

ALTER TABLE [dbo].[ml_Tendencia] CHECK CONSTRAINT [FK_Tendencia_idGas];
GO
ALTER TABLE [dbo].[ml_Tendencia] CHECK CONSTRAINT [FK_Tendencia_idPG];
GO

/****** Object:  Table [dbo].[ml_Gas_Alerta]    Script Date: 3/06/2024 4:36 p. m. ******/
CREATE TABLE dbo.ml_Gas_Alerta (
    idAlerta BIGINT IDENTITY(1,1) PRIMARY KEY,
    mes INT,
    tipoAlerta VARCHAR(10),
    -- alertaActiva BIT,
    idTendencia BIGINT,
    idLlave BIGINT,
    idGas BIGINT,
    valorActual NUMERIC(10,4),
    FOREIGN KEY (idTendencia) REFERENCES dbo.ml_Tendencia(id),
    FOREIGN KEY (idLlave) REFERENCES dbo.ml_LlavesG(id),
    FOREIGN KEY (idGas) REFERENCES dbo.ml_Gas_Limite(id)
);


/****** Object:  Table [dbo].[ml_Gas_Alerta]    Script Date: 3/06/2024 4:36 p. m. ******/
CREATE TABLE dbo.Usuarios_gas(
    idUser BIGINT IDENTITY(1,1) PRIMARY KEY,
    correoUser VARCHAR (50),
    alertaActiva BIT,
    CuerpoCorreo VARCHAR(200),
    fechaEnvio [datetime] NOT NULL,
    idLlave BIGINT,
    idAlerta BIGINT,
    FOREIGN KEY (idLlave) REFERENCES dbo.ml_LlavesG(id),
    FOREIGN KEY (idAlerta) REFERENCES dbo.ml_Gas_Alerta(idAlerta)
);

/****** Object:  Table [dbo].[ml_LlavesG]    Script Date: 27/05/2024 12:35:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ml_LlavesG](
	[id] [bigint] identity(1,1) NOT NULL,
	[idGOL] [int] NOT NULL,
	[idTend] [bigint] NOT NULL,
	[idGas] [bigint] NOT NULL,
    [idAlerta] [bigint] NOT NULL,
    [idUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_ml_LlavesG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ml_LlavesG]  WITH NOCHECK ADD  CONSTRAINT [FK_ml_LlavesG_idGOL] FOREIGN KEY([idGOL])
REFERENCES [dbo].[PlantasGOL] ([id]);
GO

ALTER TABLE [dbo].[ml_LlavesG]  WITH NOCHECK ADD  CONSTRAINT [FK_ml_LlavesG_idUsuario] FOREIGN KEY([idUser])
REFERENCES [dbo].[Usuarios_gas] ([id]);
GO

ALTER TABLE [dbo].[ml_LlavesG]  WITH NOCHECK ADD  CONSTRAINT [FK_ml_LlavesG_idTend] FOREIGN KEY([idTend])
REFERENCES [dbo].[ml_Tendencia] ([id]);
GO

ALTER TABLE [dbo].[ml_LlavesG]  WITH NOCHECK ADD  CONSTRAINT [FK_ml_LlavesG_idGas] FOREIGN KEY([idGas])
REFERENCES [dbo].[ml_Gas_Limite] ([id]);
GO

ALTER TABLE [dbo].[ml_LlavesG] CHECK CONSTRAINT [FK_ml_LlavesG_idGOL];
GO

ALTER TABLE [dbo].[ml_LlavesG] CHECK CONSTRAINT [FK_ml_LlavesG_idGas];
GO

Alter TABLE [dbo].[ml_LlavesG] CHECK CONSTRAINT [FK_ml_LlavesG_idTend];
GO

Alter TABLE [dbo].[ml_LlavesG] CHECK CONSTRAINT [FK_ml_LlavesG_idUsuario];
GO




