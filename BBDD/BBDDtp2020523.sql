DROP DATABASE SALES;
USE [master]
GO
/****** Object:  Database [SALES]    Script Date: 23/05/2020 2:30:34 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id_empl] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_role] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[usuario] [nvarchar](50) NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_empl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDU]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDU](
	[PDUTABLA] [nvarchar](500) NOT NULL,
	[PDUCLAVE] [nvarchar](500) NOT NULL,
	[PDUVALOR] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 23/05/2020 2:30:35 ******/
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
	[visible] [bit] NOT NULL,
	[id_Categoria] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesiones]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sesiones](
	[id] [int] NOT NULL,
	[fecha] [int] NOT NULL,
	[hora] [int] NOT NULL,
	[sesion] [nvarchar](100) NOT NULL,
	[id_usuario] [int] NULL,
	[id_empleado] [int] NULL,
 CONSTRAINT [PK_Sesiones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [nvarchar](50) NOT NULL,
	[cuil] [bigint] NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[nTarjeta] [int] NOT NULL,
	[fechaVencimiento] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[pin] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Tarjetas] PRIMARY KEY CLUSTERED 
(
	[nTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 23/05/2020 2:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_role] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](300) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (1, N'Aceesorios')
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (2, N'ropa      ')
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (3, N'utileria  ')
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (6, N'pelotas   ')
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (7, N'botines   ')
GO
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (8, N'Animales  ')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (3, N'juan', N'P7T8s3og68I=', 1, 4, N'jjmadeo')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (4, N'salvador', N'P7T8s3og68I=', 2, 4, N'salvador')
GO
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (5, N'juan', N'P7T8s3og68I=', 1, 4, N'juanEmpl')
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (2, N'mesa', N'mesa blanca baño', 3.35, 1, 20200508, 1, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (3, N'remera', N'remera de boca', 7500, 34, 20200508, 1, 2)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (4, N'pelota', N'pelota mundial 2010', 1535, 0, 20200508, 1, 3)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (5, N'botines ', N'talle 45 total 90', 5600, 12, 20200508, 0, 6)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (6, N'Medias', N'media soquete', 3586, 0, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (7, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (8, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (9, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (10, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (11, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (12, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (13, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (14, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (15, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (16, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (17, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (18, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (19, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (20, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (21, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (22, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (23, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (24, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (25, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (26, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (27, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (28, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (29, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (30, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (31, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (32, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (33, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (34, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (35, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (36, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (37, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (38, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (39, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (40, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (41, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (42, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (43, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (44, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (45, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (46, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (47, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (48, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (49, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (50, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (51, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (52, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (53, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (54, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (55, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (56, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (57, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (58, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (59, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (60, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (61, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (62, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (63, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (64, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (65, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (66, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (67, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (68, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (69, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (70, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (71, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (72, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (73, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (74, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (75, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (76, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (77, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (78, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (79, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (80, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (81, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (82, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (83, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (84, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (85, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (86, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (87, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (88, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (89, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (90, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (91, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (92, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (93, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (94, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (95, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (96, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (97, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (98, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (99, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (100, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (101, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (102, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (103, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (104, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (105, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (106, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (107, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (108, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (109, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (110, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (111, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (112, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (113, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (114, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (115, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (116, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (117, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (118, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (119, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (120, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (121, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (122, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (123, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (124, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (125, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (126, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (127, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (128, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (129, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (130, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (131, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (132, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (133, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (134, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (135, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (136, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (137, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (138, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (139, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (140, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (141, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (142, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (143, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (144, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (145, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (146, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (147, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (148, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (149, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (150, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (151, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (152, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (153, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (154, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (155, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (156, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (157, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (158, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (159, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (160, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (161, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (162, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (163, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (164, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (165, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (166, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (167, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (168, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (169, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (170, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (171, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (172, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (173, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (174, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (175, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (176, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (177, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (178, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (179, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (180, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (181, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (182, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (183, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (184, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (185, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (186, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (187, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (188, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (189, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (190, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (191, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (192, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (193, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (194, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (195, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (196, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (197, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (198, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (199, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (200, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (201, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (202, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (203, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (204, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (205, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (206, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (207, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (208, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (209, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (210, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (211, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (212, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (213, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (214, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (215, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (216, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (217, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (218, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (219, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (220, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (221, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (222, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (223, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (224, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (225, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (226, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (227, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (228, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (229, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (230, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (231, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (232, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (233, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (234, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (235, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (236, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (237, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (238, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (239, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (240, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (241, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (242, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (243, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (244, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (245, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (246, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (247, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (248, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (249, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (250, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (251, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (252, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (253, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (254, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (255, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (256, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (257, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (258, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (259, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (260, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (261, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (262, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (263, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (264, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (265, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (266, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (267, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (268, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (269, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (270, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (271, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (272, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (273, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (274, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (275, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (276, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (277, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (278, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (279, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (280, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (281, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (282, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (283, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (284, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (285, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (286, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (287, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (288, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (289, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (290, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (291, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (292, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (293, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (294, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (295, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (296, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (297, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (298, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (299, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (300, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (301, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (302, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (303, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (304, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (305, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (306, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (307, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (308, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (309, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (310, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (311, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (312, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (313, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (314, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (315, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (316, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (317, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (318, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (319, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (320, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (321, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (322, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (323, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (324, N'Medias', N'media soquete', 3586, 23, 20200509, 1, 7)
GO
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria]) VALUES (325, N'perro', N'beagle', 15000, 2, 20200521, 1, 8)
GO
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([id], [nombre]) VALUES (1, N'ADM')
GO
INSERT [dbo].[Roles] ([id], [nombre]) VALUES (2, N'VENTAS')
GO
INSERT [dbo].[Roles] ([id], [nombre]) VALUES (3, N'CLIENTE')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursales] ON 
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (4, N'Deportes Lomas', 1, N'Alen Doble  188')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (5, N'Deporte llavallol', 30252252236995, N'bahia blanca 234')
GO
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (6, N'adrogue Deportes', 248115, N'almt Brown 3598')
GO
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (24, N'jjmadeo', N'P7T8s3og68I=', 3, N'JUAN JOSE MADEO', N'sadasd', N'NULLasdasd@asdsa')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (25, N'jjmadeoaa', N'sad', 3, N'Juan', N'sad', N'@sadsad')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (26, N'string', N'P7T8s3og68I=', 3, N'string', N'asdasd', N'@sadsad')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (27, N'asdasd', N'P7T8s3og68I=', 3, N'123123', N'123213', N'123123')
GO
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (28, N'juanEmpl', N'P7T8s3og68I=', 3, N'juan', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Roles]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Sucursales] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Sucursales]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_Categorias] FOREIGN KEY([id_Categoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_Categorias]
GO
ALTER TABLE [dbo].[Sesiones]  WITH CHECK ADD  CONSTRAINT [FK_Sesiones_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([id_empl])
GO
ALTER TABLE [dbo].[Sesiones] CHECK CONSTRAINT [FK_Sesiones_Empleados]
GO
ALTER TABLE [dbo].[Sesiones]  WITH CHECK ADD  CONSTRAINT [FK_Sesiones_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[Sesiones] CHECK CONSTRAINT [FK_Sesiones_usuarios]
GO
ALTER TABLE [dbo].[Tarjetas]  WITH CHECK ADD  CONSTRAINT [FK_Tarjetas_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[Tarjetas] CHECK CONSTRAINT [FK_Tarjetas_usuarios]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_Roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_Roles]
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 23/05/2020 2:30:35 ******/
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
