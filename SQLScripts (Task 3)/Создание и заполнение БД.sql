USE [master]
GO
CREATE DATABASE [HeatingDatabase]
 
USE [HeatingDatabase]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[idNetworkArea] [int] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumer]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumer](
	[PersonalAccount] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Consumer] PRIMARY KEY CLUSTERED 
(
	[PersonalAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeatObject]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeatObject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RegistryDate] [date] NOT NULL,
	[idBuilding] [int] NOT NULL,
	[idConsumer] [int] NOT NULL,
 CONSTRAINT [PK_HeatObject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insulation]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insulation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Insulation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Layer]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Layer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkArea]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkArea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NetworkArea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkSection]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkSection](
	[Num] [int] NOT NULL,
	[idInsulation] [int] NOT NULL,
	[idLayer] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
 CONSTRAINT [PK_NetworkSection] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectSection]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectSection](
	[idSection] [int] NOT NULL,
	[idObject] [int] NOT NULL,
	[idType] [int] NOT NULL,
 CONSTRAINT [PK_ObjectSection] PRIMARY KEY CLUSTERED 
(
	[idSection] ASC,
	[idObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeObjectSection]    Script Date: 19.09.2019 23:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeObjectSection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeObjectSection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([id], [Address], [idNetworkArea]) VALUES (1, N'ул. Снежная, д. 3', 1)
INSERT [dbo].[Building] ([id], [Address], [idNetworkArea]) VALUES (2, N'ул. Снежная, д. 40', 5)
INSERT [dbo].[Building] ([id], [Address], [idNetworkArea]) VALUES (3, N'ул. Давыдова, д. 111', 3)
INSERT [dbo].[Building] ([id], [Address], [idNetworkArea]) VALUES (4, N'пр-т Декабристов, д. 43', 5)
INSERT [dbo].[Building] ([id], [Address], [idNetworkArea]) VALUES (5, N'ул. Ким', 2)
SET IDENTITY_INSERT [dbo].[Building] OFF
INSERT [dbo].[Consumer] ([PersonalAccount], [Name]) VALUES (124, N'Потребитель 1')
INSERT [dbo].[Consumer] ([PersonalAccount], [Name]) VALUES (58, N'Потребитель 2')
INSERT [dbo].[Consumer] ([PersonalAccount], [Name]) VALUES (7012, N'Потребитель 3')
INSERT [dbo].[Consumer] ([PersonalAccount], [Name]) VALUES (89611, N'Потребитель 4')
INSERT [dbo].[Consumer] ([PersonalAccount], [Name]) VALUES (99, N'Потребитель 5')
SET IDENTITY_INSERT [dbo].[HeatObject] ON 

INSERT [dbo].[HeatObject] ([id], [Name], [RegistryDate], [idBuilding], [idConsumer]) VALUES (2, N'Объект 1', CAST(N'2008-12-21' AS Date), 3, 124)
INSERT [dbo].[HeatObject] ([id], [Name], [RegistryDate], [idBuilding], [idConsumer]) VALUES (3, N'Объект 2', CAST(N'2012-02-01' AS Date), 1, 7012)
INSERT [dbo].[HeatObject] ([id], [Name], [RegistryDate], [idBuilding], [idConsumer]) VALUES (4, N'Объект 3', CAST(N'2001-03-06' AS Date), 1, 124)
INSERT [dbo].[HeatObject] ([id], [Name], [RegistryDate], [idBuilding], [idConsumer]) VALUES (5, N'Объект 4', CAST(N'2011-04-07' AS Date), 4, 89611)
INSERT [dbo].[HeatObject] ([id], [Name], [RegistryDate], [idBuilding], [idConsumer]) VALUES (6, N'Объект 5', CAST(N'2019-08-08' AS Date), 3, 7012)
SET IDENTITY_INSERT [dbo].[HeatObject] OFF
SET IDENTITY_INSERT [dbo].[Insulation] ON 

INSERT [dbo].[Insulation] ([id], [Name]) VALUES (1, N'Битум')
INSERT [dbo].[Insulation] ([id], [Name]) VALUES (4, N'Минеральная вата')
INSERT [dbo].[Insulation] ([id], [Name]) VALUES (2, N'Пенополиуретан')
INSERT [dbo].[Insulation] ([id], [Name]) VALUES (5, N'Полиэтилен')
INSERT [dbo].[Insulation] ([id], [Name]) VALUES (3, N'Стекловата')
SET IDENTITY_INSERT [dbo].[Insulation] OFF
SET IDENTITY_INSERT [dbo].[Layer] ON 

INSERT [dbo].[Layer] ([id], [Name]) VALUES (1, N'Надземная')
INSERT [dbo].[Layer] ([id], [Name]) VALUES (3, N'По подвалу')
INSERT [dbo].[Layer] ([id], [Name]) VALUES (2, N'Подземная')
SET IDENTITY_INSERT [dbo].[Layer] OFF
SET IDENTITY_INSERT [dbo].[NetworkArea] ON 

INSERT [dbo].[NetworkArea] ([id], [Name]) VALUES (1, N'Сетевой район 1')
INSERT [dbo].[NetworkArea] ([id], [Name]) VALUES (2, N'Сетевой район 2')
INSERT [dbo].[NetworkArea] ([id], [Name]) VALUES (3, N'Сетевой район 3')
INSERT [dbo].[NetworkArea] ([id], [Name]) VALUES (4, N'Сетевой район 4')
INSERT [dbo].[NetworkArea] ([id], [Name]) VALUES (5, N'Сетевой район 5')
SET IDENTITY_INSERT [dbo].[NetworkArea] OFF
INSERT [dbo].[NetworkSection] ([Num], [idInsulation], [idLayer], [Year]) VALUES (9, 5, 2, 2016)
INSERT [dbo].[NetworkSection] ([Num], [idInsulation], [idLayer], [Year]) VALUES (12, 1, 2, 2008)
INSERT [dbo].[NetworkSection] ([Num], [idInsulation], [idLayer], [Year]) VALUES (67, 1, 3, 2001)
INSERT [dbo].[NetworkSection] ([Num], [idInsulation], [idLayer], [Year]) VALUES (666, 2, 1, 2018)
INSERT [dbo].[NetworkSection] ([Num], [idInsulation], [idLayer], [Year]) VALUES (771, 3, 3, 2018)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (9, 2, 2)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (9, 6, 1)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (12, 2, 1)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (12, 3, 2)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (666, 5, 1)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (771, 2, 2)
INSERT [dbo].[ObjectSection] ([idSection], [idObject], [idType]) VALUES (771, 5, 1)
SET IDENTITY_INSERT [dbo].[TypeObjectSection] ON 

INSERT [dbo].[TypeObjectSection] ([id], [Name]) VALUES (2, N'Внутренний')
INSERT [dbo].[TypeObjectSection] ([id], [Name]) VALUES (1, N'Наружный')
SET IDENTITY_INSERT [dbo].[TypeObjectSection] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [ind_1]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ind_1] ON [dbo].[Building]
(
	[Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ind_2]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ind_2] ON [dbo].[Consumer]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [id_3]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [id_3] ON [dbo].[Insulation]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ind_4]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ind_4] ON [dbo].[Layer]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ind_5]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ind_5] ON [dbo].[NetworkArea]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ind_6]    Script Date: 19.09.2019 23:54:50 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ind_6] ON [dbo].[TypeObjectSection]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_NetworkArea] FOREIGN KEY([idNetworkArea])
REFERENCES [dbo].[NetworkArea] ([id])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_NetworkArea]
GO
ALTER TABLE [dbo].[HeatObject]  WITH CHECK ADD  CONSTRAINT [FK_HeatObject_Building] FOREIGN KEY([idBuilding])
REFERENCES [dbo].[Building] ([id])
GO
ALTER TABLE [dbo].[HeatObject] CHECK CONSTRAINT [FK_HeatObject_Building]
GO
ALTER TABLE [dbo].[HeatObject]  WITH CHECK ADD  CONSTRAINT [FK_HeatObject_Consumer1] FOREIGN KEY([idConsumer])
REFERENCES [dbo].[Consumer] ([PersonalAccount])
GO
ALTER TABLE [dbo].[HeatObject] CHECK CONSTRAINT [FK_HeatObject_Consumer1]
GO
ALTER TABLE [dbo].[NetworkSection]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection_Insulation] FOREIGN KEY([idInsulation])
REFERENCES [dbo].[Insulation] ([id])
GO
ALTER TABLE [dbo].[NetworkSection] CHECK CONSTRAINT [FK_NetworkSection_Insulation]
GO
ALTER TABLE [dbo].[NetworkSection]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection_Layer] FOREIGN KEY([idLayer])
REFERENCES [dbo].[Layer] ([id])
GO
ALTER TABLE [dbo].[NetworkSection] CHECK CONSTRAINT [FK_NetworkSection_Layer]
GO
ALTER TABLE [dbo].[ObjectSection]  WITH CHECK ADD  CONSTRAINT [FK_ObjectSection_HeatObject] FOREIGN KEY([idObject])
REFERENCES [dbo].[HeatObject] ([id])
GO
ALTER TABLE [dbo].[ObjectSection] CHECK CONSTRAINT [FK_ObjectSection_HeatObject]
GO
ALTER TABLE [dbo].[ObjectSection]  WITH CHECK ADD  CONSTRAINT [FK_ObjectSection_NetworkSection] FOREIGN KEY([idSection])
REFERENCES [dbo].[NetworkSection] ([Num])
GO
ALTER TABLE [dbo].[ObjectSection] CHECK CONSTRAINT [FK_ObjectSection_NetworkSection]
GO
ALTER TABLE [dbo].[ObjectSection]  WITH CHECK ADD  CONSTRAINT [FK_ObjectSection_TypeObjectSection] FOREIGN KEY([idType])
REFERENCES [dbo].[TypeObjectSection] ([id])
GO
ALTER TABLE [dbo].[ObjectSection] CHECK CONSTRAINT [FK_ObjectSection_TypeObjectSection]
GO
USE [master]
GO
ALTER DATABASE [HeatingDatabase] SET  READ_WRITE 
GO
