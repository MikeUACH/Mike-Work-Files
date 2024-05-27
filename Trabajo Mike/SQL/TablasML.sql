/****** Object:  Table [dbo].[ml_Gas]    Script Date: 24/05/2024 12:35:21 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ml_Gas](
	[id] [bigint] identity(1,1) NOT NULL,
	[comboKey] varchar(50) not null,
	[gas] [varchar](250) NOT NULL,
	[limite] numeric(10,4) NOT NULL,
 CONSTRAINT [PK_ml_Gas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ml_Gas]  WITH NOCHECK ADD  CONSTRAINT [FK_ComboKeyGas] FOREIGN KEY([comboKey])
REFERENCES [dbo].[PlantasGOL] ([comboKey])
GO

ALTER TABLE [dbo].[ml_Gas] CHECK CONSTRAINT [FK_ComboKeyGas]
GO

