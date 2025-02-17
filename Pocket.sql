USE [DigitalPocket]
GO
/****** Object:  Table [dbo].[PocketUser]    Script Date: 7/12/2019 3:48:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PocketUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_PocketUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/12/2019 3:48:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TransactionName] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Ammount] [money] NULL,
	[OriginAccount] [varchar](50) NULL,
	[DateTime] [datetime] NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UWallet]    Script Date: 7/12/2019 3:48:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UWallet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Ammount] [money] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_UWallet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_PocketUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[PocketUser] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_PocketUser]
GO
ALTER TABLE [dbo].[UWallet]  WITH CHECK ADD  CONSTRAINT [FK_UWallet_PocketUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[PocketUser] ([Id])
GO
ALTER TABLE [dbo].[UWallet] CHECK CONSTRAINT [FK_UWallet_PocketUser]
GO
