/****** Object:  Table [dbo].[ml_Tendencia]    Script Date: 24/05/2024 12:35:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ml_Tendencia](
	[id] [bigint] identity(1,1) NOT NULL,
	[idGas] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 	[v30] numeric(10,4) NOT NULL,
	[v60] numeric(10,4) NOT NULL,
	[v90] numeric(10,4) NOT NULL,
 CONSTRAINT [PK_ml_Tendencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ml_Tendencia]  WITH NOCHECK ADD  CONSTRAINT [FK_Tendencia] FOREIGN KEY([idGas])
REFERENCES [dbo].[ml_Gas] ([id]);
GO

ALTER TABLE [dbo].[ml_Tendencia] CHECK CONSTRAINT [FK_Tendencia];
GO






