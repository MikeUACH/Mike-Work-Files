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
 CONSTRAINT [PK_ml_LlavesG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ml_LlavesG]  WITH NOCHECK ADD  CONSTRAINT [FK_ml_LlavesG_idGOL] FOREIGN KEY([idGOL])
REFERENCES [dbo].[PlantasGOL] ([id]);
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



drop table ml_LlavesG

