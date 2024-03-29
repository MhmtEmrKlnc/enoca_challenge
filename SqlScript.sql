USE [master]
GO
/****** Object:  Database [enoca_carrier]    Script Date: 14.02.2024 21:47:39 ******/
CREATE DATABASE [enoca_carrier]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'enoca_carrier', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\enoca_carrier.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'enoca_carrier_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\enoca_carrier_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Turkish_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [enoca_carrier] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [enoca_carrier].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [enoca_carrier] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [enoca_carrier] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [enoca_carrier] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [enoca_carrier] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [enoca_carrier] SET ARITHABORT OFF 
GO
ALTER DATABASE [enoca_carrier] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [enoca_carrier] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [enoca_carrier] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [enoca_carrier] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [enoca_carrier] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [enoca_carrier] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [enoca_carrier] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [enoca_carrier] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [enoca_carrier] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [enoca_carrier] SET  DISABLE_BROKER 
GO
ALTER DATABASE [enoca_carrier] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [enoca_carrier] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [enoca_carrier] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [enoca_carrier] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [enoca_carrier] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [enoca_carrier] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [enoca_carrier] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [enoca_carrier] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [enoca_carrier] SET  MULTI_USER 
GO
ALTER DATABASE [enoca_carrier] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [enoca_carrier] SET DB_CHAINING OFF 
GO
ALTER DATABASE [enoca_carrier] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [enoca_carrier] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [enoca_carrier] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [enoca_carrier] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [enoca_carrier] SET QUERY_STORE = ON
GO
ALTER DATABASE [enoca_carrier] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [enoca_carrier]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14.02.2024 21:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) COLLATE Turkish_CI_AS NOT NULL,
	[ProductVersion] [nvarchar](32) COLLATE Turkish_CI_AS NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrierConfigurations]    Script Date: 14.02.2024 21:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierConfigurations](
	[CarrierConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierMaxDesi] [int] NOT NULL,
	[CarrierMinDesi] [int] NOT NULL,
	[CarrierCost] [real] NOT NULL,
	[CarriersCarrierId] [int] NOT NULL,
 CONSTRAINT [PK_CarrierConfigurations] PRIMARY KEY CLUSTERED 
(
	[CarrierConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 14.02.2024 21:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[CarrierId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[CarrierIsActive] [bit] NOT NULL,
	[CarrierPlusDesiCost] [int] NOT NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14.02.2024 21:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDesi] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderCarrierCost] [real] NOT NULL,
	[CarriersCarrierId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240213152729_InitialCreate', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] ON 

INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (12, 10, 1, 32, 1)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (13, 20, 11, 70, 1)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (14, 30, 21, 150, 1)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (15, 5, 1, 10, 4)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (16, 15, 6, 30, 4)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (17, 30, 16, 110, 4)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (18, 5, 1, 15, 9)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (19, 15, 6, 45, 9)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (20, 10, 1, 35, 13)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (21, 25, 11, 100, 13)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (22, 10, 1, 33, 14)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (23, 25, 11, 79, 14)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarriersCarrierId]) VALUES (24, 30, 26, 150, 14)
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Carriers] ON 

INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (1, N'PTT Kargo', 1, 4)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (4, N'Yurtiçi Kargo', 1, 5)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (9, N'MNG Kargo', 1, 4)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (13, N'Aras Kargo', 1, 6)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (14, N'Sürat Kargo', 1, 7)
SET IDENTITY_INSERT [dbo].[Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (22, 3, CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), 10, 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (23, 23, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), 79, 14)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (24, 8, CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2), 30, 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (26, 33, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 125, 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (27, 45, CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), 185, 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarriersCarrierId]) VALUES (29, 80, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 350, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
/****** Object:  Index [IX_CarrierConfigurations_CarriersCarrierId]    Script Date: 14.02.2024 21:47:39 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConfigurations_CarriersCarrierId] ON [dbo].[CarrierConfigurations]
(
	[CarriersCarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CarriersCarrierId]    Script Date: 14.02.2024 21:47:39 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CarriersCarrierId] ON [dbo].[Orders]
(
	[CarriersCarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarrierConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_CarrierConfigurations_Carriers_CarriersCarrierId] FOREIGN KEY([CarriersCarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrierConfigurations] CHECK CONSTRAINT [FK_CarrierConfigurations_Carriers_CarriersCarrierId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Carriers_CarriersCarrierId] FOREIGN KEY([CarriersCarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Carriers_CarriersCarrierId]
GO
USE [master]
GO
ALTER DATABASE [enoca_carrier] SET  READ_WRITE 
GO
