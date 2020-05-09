USE [master]
GO
/****** Object:  Database [SALES]    Script Date: 09/05/2020 18:50:56 ******/
CREATE DATABASE [SALES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SALES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SALES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SALES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SALES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SALES] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SALES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SALES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SALES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SALES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SALES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SALES] SET ARITHABORT OFF 
GO
ALTER DATABASE [SALES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SALES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SALES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SALES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SALES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SALES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SALES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SALES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SALES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SALES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SALES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SALES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SALES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SALES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SALES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SALES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SALES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SALES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SALES] SET  MULTI_USER 
GO
ALTER DATABASE [SALES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SALES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SALES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SALES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SALES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SALES] SET QUERY_STORE = OFF
GO
USE [SALES]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 09/05/2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[detalle] [nvarchar](500) NOT NULL,
	[precio] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[fecha] [int] NOT NULL,
	[visible] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 09/05/2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (2, N'mesa', N'mesa blanca baño', 3525.35, 54, 20200508, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (3, N'remera', N'remera de boca', 7500, 34, 20200508, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (4, N'pelota', N'pelota mundial 2010', 1535, 2, 20200508, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (5, N'botines ', N'talle 45 total 90', 5600, 12, 20200508, 0)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (6, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (7, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (8, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (9, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (10, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (11, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (12, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (13, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (14, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (15, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (16, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (17, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (18, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (19, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (20, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (21, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (22, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (23, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (24, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (25, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (26, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (27, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (28, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (29, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (30, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (31, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (32, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (33, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (34, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (35, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (36, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (37, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (38, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (39, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (40, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (41, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (42, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (43, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (44, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (45, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (46, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (47, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (48, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (49, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (50, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (51, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (52, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (53, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (54, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (55, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (56, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (57, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (58, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (59, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (60, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (61, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (62, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (63, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (64, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (65, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (66, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (67, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (68, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (69, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (70, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (71, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (72, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (73, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (74, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (75, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (76, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (77, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (78, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (79, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (80, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (81, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (82, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (83, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (84, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (85, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (86, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (87, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (88, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (89, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (90, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (91, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (92, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (93, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (94, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (95, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (96, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (97, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (98, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (99, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (100, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (101, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (102, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (103, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (104, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (105, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (106, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (107, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (108, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (109, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (110, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (111, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (112, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (113, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (114, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (115, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (116, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (117, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (118, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (119, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (120, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (121, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (122, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (123, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (124, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (125, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (126, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (127, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (128, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (129, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (130, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (131, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (132, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (133, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (134, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (135, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (136, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (137, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (138, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (139, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (140, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (141, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (142, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (143, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (144, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (145, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (146, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (147, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (148, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (149, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (150, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (151, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (152, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (153, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (154, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (155, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (156, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (157, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (158, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (159, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (160, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (161, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (162, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (163, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (164, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (165, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (166, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (167, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (168, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (169, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (170, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (171, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (172, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (173, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (174, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (175, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (176, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (177, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (178, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (179, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (180, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (181, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (182, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (183, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (184, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (185, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (186, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (187, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (188, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (189, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (190, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (191, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (192, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (193, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (194, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (195, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (196, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (197, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (198, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (199, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (200, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (201, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (202, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (203, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (204, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (205, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (206, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (207, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (208, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (209, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (210, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (211, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (212, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (213, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (214, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (215, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (216, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (217, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (218, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (219, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (220, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (221, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (222, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (223, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (224, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (225, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (226, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (227, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (228, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (229, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (230, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (231, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (232, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (233, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (234, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (235, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (236, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (237, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (238, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (239, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (240, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (241, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (242, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (243, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (244, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (245, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (246, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (247, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (248, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (249, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (250, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (251, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (252, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (253, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (254, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (255, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (256, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (257, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (258, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (259, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (260, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (261, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (262, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (263, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (264, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (265, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (266, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (267, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (268, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (269, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (270, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (271, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (272, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (273, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (274, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (275, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (276, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (277, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (278, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (279, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (280, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (281, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (282, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (283, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (284, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (285, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (286, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (287, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (288, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (289, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (290, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (291, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (292, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (293, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (294, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (295, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (296, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (297, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (298, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (299, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (300, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (301, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (302, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (303, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (304, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (305, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (306, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (307, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (308, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (309, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (310, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (311, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (312, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (313, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (314, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (315, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (316, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (317, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (318, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (319, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (320, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (321, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (322, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (323, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible]) VALUES (324, N'Medias', N'media soquete', 3586, 23, 20200509, 1)
GO
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (1, N'juan', N'P7T8s3og68I', N'ADM       ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (2, N'maria', N'1234', N'VENTAS    ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (3, N'sergio', N'1234', N'CLIENTE   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (4, N'salvador', N'1234', N'INVICTADO ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (5, N'pedro', N'P7T8s3og68I=', N'cliente   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (6, N'pedro', N'P7T8s3og68I=', N'cliente   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (7, N'pedro', N'P7T8s3og68I=', N'cliente   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (17, N'sergiogomez', N'P7T8s3og68I=', N'CLIENTE   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (18, N'juan1', N'P7T8s3og68I=', N'CLIENTE   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (19, N'maria222', N'P7T8s3og68I=', N'CLIENTE   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (20, N'gonzalo', N'Hnz3IfXZ6zY=', N'CLIENTE   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (8, N'pedro', N'P7T8s3og68I=', N'cliente   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (9, N'pedro', N'P7T8s3og68I=', N'cliente   ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (15, N'asdsadsadssasdadadas123dsad', N'P7T8s3og68I=', N'ADM       ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (16, N'pepegrillo', N'P7T8s3og68I=', N'ADM       ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (10, N'juantopo', N'P7T8s3og68I=', N'admi      ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (11, N'asdsadasd', N'P7T8s3og68I=', N'admi      ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (12, N'asdassadasd', N'P7T8s3og68I=', N'admi      ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (13, N'asdsadsadsadasdsad', N'P7T8s3og68I=', N'admi      ')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [role]) VALUES (14, N'asdsadsadssadadasdsad', N'P7T8s3og68I=', N'ADMI      ')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 09/05/2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_usuarios]
as
select * from usuarios
GO
USE [master]
GO
ALTER DATABASE [SALES] SET  READ_WRITE 
GO
