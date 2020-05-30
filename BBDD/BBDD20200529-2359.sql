USE [SALES]
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 29/05/2020 23:58:47 ******/
DROP PROCEDURE [dbo].[sp_usuarios]
GO
ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_Ventas_Empleados]
GO
ALTER TABLE [dbo].[usuarios] DROP CONSTRAINT [FK_usuarios_Roles]
GO
ALTER TABLE [dbo].[Tarjetas] DROP CONSTRAINT [FK_Tarjetas_usuarios]
GO
ALTER TABLE [dbo].[ProductoSucursalRela] DROP CONSTRAINT [FK_ProductoSucursalRela_Sucursales]
GO
ALTER TABLE [dbo].[ProductoSucursalRela] DROP CONSTRAINT [FK_ProductoSucursalRela_productos]
GO
ALTER TABLE [dbo].[productos] DROP CONSTRAINT [FK_productos_Categorias]
GO
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_Empleados_Sucursales]
GO
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_Empleados_Roles]
GO
ALTER TABLE [dbo].[DetalleVenta] DROP CONSTRAINT [FK_DetalleVenta_Ventas]
GO
ALTER TABLE [dbo].[DetalleVenta] DROP CONSTRAINT [FK_DetalleVenta_productos]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Ventas]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[usuarios]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Tarjetas]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Sucursales]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductoSucursalRela]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[ProductoSucursalRela]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[productos]
GO
/****** Object:  Table [dbo].[PDU]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[PDU]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[DetalleVenta]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Categorias]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 29/05/2020 23:58:47 ******/
DROP TABLE [dbo].[Auditoria]
GO
USE [master]
GO
/****** Object:  Database [SALES]    Script Date: 29/05/2020 23:58:47 ******/
DROP DATABASE [SALES]
GO
/****** Object:  Database [SALES]    Script Date: 29/05/2020 23:58:47 ******/
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
/****** Object:  Table [dbo].[Auditoria]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [nvarchar](50) NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[detalle] [nvarchar](500) NULL,
	[fecha_hora] [smalldatetime] NOT NULL,
	[role] [int] NULL,
	[id_empl] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 29/05/2020 23:58:47 ******/
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
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 29/05/2020 23:58:47 ******/
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
/****** Object:  Table [dbo].[PDU]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDU](
	[PDUCLAVE] [nvarchar](500) NOT NULL,
	[PDUVALOR] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[detalle] [nvarchar](1000) NOT NULL,
	[precio] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[fecha] [int] NOT NULL,
	[visible] [bit] NOT NULL,
	[id_Categoria] [int] NULL,
	[imgurl] [nvarchar](500) NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoSucursalRela]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoSucursalRela](
	[id_producto] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK_ProductoSucursalRela] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29/05/2020 23:58:47 ******/
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
/****** Object:  Table [dbo].[Sucursales]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [nvarchar](50) NOT NULL,
	[cuil] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[nTarjeta] [nvarchar](16) NOT NULL,
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 29/05/2020 23:58:47 ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 29/05/2020 23:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_empl] [int] NOT NULL,
	[id_usua] [int] NULL,
	[Medio_Pago] [nchar](10) NOT NULL,
	[nombreClie] [nvarchar](50) NULL,
	[cuilClie] [nvarchar](50) NULL,
	[DireccionClie] [nvarchar](150) NULL,
	[fecha] [timestamp] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auditoria] ON 

INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (1, N'asd', N'sad', N'asd', CAST(N'2020-05-28T22:25:00' AS SmallDateTime), 1, 14)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (2, N'asd', N'sad', N'asd', CAST(N'2020-05-28T22:28:00' AS SmallDateTime), 1, 14)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (5, N'asd', N'sad', N'asd', CAST(N'2020-05-28T22:51:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (6, N'asd', N'sad', N'asd', CAST(N'2020-05-28T22:51:00' AS SmallDateTime), 1, 22)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (8, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (9, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (10, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (11, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (12, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (13, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (14, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (15, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (16, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (17, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (18, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (19, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (20, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (21, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (22, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (23, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (24, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (25, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:57:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (26, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (27, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (28, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (29, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (30, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (31, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (32, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (33, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (34, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (35, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (36, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (37, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (38, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (39, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (40, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (41, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (42, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (43, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (44, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (45, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (46, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (47, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (48, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (49, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (50, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (51, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (52, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (53, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (54, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (55, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (56, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (57, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (58, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (59, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (60, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (61, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (62, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (63, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (64, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (65, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (66, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (67, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (68, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (69, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (70, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (71, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (72, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (73, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (74, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (75, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (76, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (77, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (78, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (79, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (80, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (81, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (82, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (83, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (84, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (85, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (86, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (87, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (88, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (89, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (90, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (91, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (92, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (93, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (94, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (95, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (96, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (97, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (98, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (99, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (100, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (101, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (102, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
GO
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (103, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (104, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (105, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (106, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (107, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (108, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (109, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (110, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (111, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (112, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (113, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (114, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (115, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (116, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (117, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (118, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (119, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (120, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (121, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (122, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (123, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (124, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (125, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (126, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (127, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (128, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (129, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (130, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (131, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (132, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (133, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (134, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (135, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (136, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (137, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (138, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (139, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (140, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (141, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (142, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (143, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (144, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (145, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (146, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (147, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (148, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (149, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (150, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (151, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (152, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (153, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (154, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (155, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (156, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (157, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (158, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (159, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (160, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (161, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (162, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (163, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (164, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (165, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (166, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (167, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (168, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (169, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (170, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (171, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (172, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (173, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (174, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (175, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (176, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (177, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (178, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (179, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (180, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (181, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (182, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (183, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (184, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (185, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (186, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (187, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (188, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (189, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (190, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (191, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (192, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Auditoria] ([id], [Modulo], [Usuario], [detalle], [fecha_hora], [role], [id_empl]) VALUES (193, N'asd', N'asd', N'sad', CAST(N'2020-05-29T01:58:00' AS SmallDateTime), 1, 3)
SET IDENTITY_INSERT [dbo].[Auditoria] OFF
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (1, N'Aceesorios')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (2, N'ropa      ')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (3, N'utileria  ')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (6, N'pelotas   ')
INSERT [dbo].[Categorias] ([id], [nombre]) VALUES (7, N'botines   ')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (3, N'Juan jose', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 1, 5, N'jjmadeo')
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (22, N'Maria Adriazola', N'B2-9F-17-90-49-41-5C-CD-DF-46-38-7B-3B-1E-7A-D9', 2, 7, N'madriazola')
INSERT [dbo].[Empleados] ([id_empl], [nombre], [password], [id_role], [id_sucursal], [usuario]) VALUES (23, N'Juan Jose', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 2, 6, N'jjmadeo1')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (326, N'REMERA NIKE BREATHE SQUADE', N'La remera Nike Breathe Squad no puede faltarte nunca en tus entrenamientos. Confeccionada con materiales livianos y antitranspirantes, incorpora una tela de red en la espalda que ayuda a mantenerte seco y cómodo. El calce ceñido tiene un corte personalizado.', 2999, 300, 20200, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557893-1000-1000/BQ3770011_1.jpg?v=637262717909530000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (327, N'PANTALON NIKE FLEX STRIKE', N'Exhibí tu velocidad con un estilo de arte callejero. Los pantalones Nike Flex strike están confeccionados con tecnología Nike Flex que se estira con tu cuerpo y brinda máxima elasticidad y abrigo que no impedirán tus movimientos en el campo. Los detalles inspirados en la pintura en aerosol agregan un toque de estilo de arte callejero. La cintura Nick Flyvent está hecha de tela de red elástica para mayor ventilación. El Fast Fit se agarra a tus piernas para ofrecer una sensación aerodinámica. Los bolsillos laterales con cierre brindan un almacenamiento seguro.', 5199, 130, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557927-1000-1000/CD7775010_1.jpg?v=637262718242230000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (329, N'CAMPERA NIKE DRY ACADEMY I96', N'Preparate para salir a la cancha con la campera Nike DryAcademy I96. El diseño icónico de bloques de colores está confeccionado con tela suave con la cantidad justa de elasticidad. Los bolsillos con cierre almacenan tus elementos esenciales y ofrecen abrigo a tus manos. La tecnología Dri-FIT te ayuda mantenerte seco, cómodo y concentrado.', 4199, 56, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557888-1000-1000/AV5414010_1.jpg?v=637262717866370000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (330, N'REMERA NIKE BOCA JUNIORS', N'Entrená o alentá a tu equipo con la Remera Nike Boca Juniors. Confeccionada con materiales de alta calidad, es ideal para usar tanto dentro como fuera de la cancha.
', 2149, 35, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557830-1000-1000/AQ1527739_1.jpg?v=637262717285930000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (332, N'SHORT NIKE BOCA JUNIORS', N'Shoty de boca', 899, 10, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557824-540-540/AO8392492_1.jpg?v=637262717225570000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (333, N'CAMPERA NIKE FC BARCELONA I96', N'Campera Barcelona', 6299, 0, 20200529, 1, 2, N'https://dexter.vteximg.com.br/arquivos/ids/557818-540-540/AO7514451_1.jpg?v=637262717175830000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (334, N'BOLSO LOTTO DELTA PLUS MEDIUM', N'bolso lotto', 2199, 3, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/557772-540-540/601-0563-059_zoom1.jpg?v=637261976870700000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (335, N'MOCHILA LOTTO DELTA PLUS', N'mochila', 2199, 20, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/557763-540-540/601-0565-002_zoom1.jpg?v=637261959891500000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (336, N'BOTINES TOPPER STINGRAY MACH 1', N'botines topper', 2849, 300, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/558528-540-540/TO51446_1.jpg?v=637262824657430000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (337, N'BOTINES NIKE PHANTOM VENOM PRO FG', N'botines nike', 11299, 120, 20200529, 0, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557632-540-540/IMG_1115.jpg?v=637253995206470000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (338, N'BOTINES NIKE PHANTOM VISION PRO DF FG', N'botines kine', 11299, 10, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557650-540-540/IMG_1165.jpg?v=637254004418430000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (339, N'BOTINES NIKE PHANTOM VENOM ACADEMY FG', N'botines nike', 7299, 35, 20200529, 1, 7, N'https://dexter.vteximg.com.br/arquivos/ids/557638-540-540/IMG_1144.jpg?v=637253997523900000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (340, N'PELOTA ADIDAS RIVER PLATE', N'pelota', 2549, 693, 20200529, 1, 6, N'https://dexter.vteximg.com.br/arquivos/ids/557551-540-540/IMG_1013.jpg?v=637250721333900000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (341, N'GORRO NIKE FC BARCELONA', N'Gorro Nike Fc Barcelona', 1999, 32, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/548635-1000-1000/BV4073455_1.jpg?v=637197175394330000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (342, N'MEDIAS ADIDAS SANTOS', N'medias adidas', 899, 32, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/548595-540-540/ADCV8106_1.jpg?v=637197174981600000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (343, N'MEDIAS ADIDAS SOCK 18', N'medias adidas', 899, 99, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/548593-540-540/ADCF3582_1.jpg?v=637197174963330000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (344, N'MUÑEQUERAS NIKE SWOOSH', N'muñequeras', 899, 13, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/398032-540-540/AC2286924_1.jpg?v=636706251181130000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (345, N'MUÑEQUERAS NIKE SWOOSH', N'muñequea', 1299, 22, 20200529, 1, 1, N'https://dexter.vteximg.com.br/arquivos/ids/398034-540-540/AC2287313_1.jpg?v=636706251198370000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (346, N'CANILLERA NIKE GUARD', N'canilleras', 1479, 22, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/205080-540-540/SP0040009_1.jpg?v=635687882066070000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (347, N'CANILLERA PUMA EVOFORCE III', N'canilleras', 799, 1, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/322568-540-540/PU030636-01_1.jpg?v=636435066996230000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (348, N'GUANTE UNDER ARMOUR TRAINING GLOVE', N'guantes sin dedos', 2199, 32, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/489140-540-540/UA1328620012_1.jpg?v=637020811958970000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (349, N'
GUANTE NIKE MATCH', N'guantes arquero', 2499, 15, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/476473-540-540/GS3370657_1.jpg?v=636972399545030000')
INSERT [dbo].[productos] ([id], [nombre], [detalle], [precio], [stock], [fecha], [visible], [id_Categoria], [imgurl]) VALUES (350, N'PALO DE HOCKEY MALIK COMPO SQUARE 6 36.5', N'palo ', 4199, 25, 20200529, 1, 3, N'https://dexter.vteximg.com.br/arquivos/ids/380246-540-540/MK01365218_1.jpg?v=636646722087800000')
SET IDENTITY_INSERT [dbo].[productos] OFF
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 4, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 5, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 6, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (326, 7, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 4, 13)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 5, 13)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 6, 13)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (327, 7, 13)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 4, 24)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 5, 24)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 6, 24)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (329, 7, 24)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 4, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 5, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 6, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (330, 7, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 4, 64)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 5, 64)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 6, 64)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (332, 7, 64)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 4, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 5, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 6, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (333, 7, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 4, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 5, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 6, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (334, 7, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 4, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 5, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 6, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (335, 7, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 4, 34)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 5, 34)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 6, 34)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (336, 7, 34)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 4, 2)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 5, 2)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 6, 2)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (337, 7, 2)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 4, 39)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 5, 39)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 6, 39)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (338, 7, 39)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 4, 166)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 5, 166)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 6, 166)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (339, 7, 166)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 4, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 5, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 6, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (340, 7, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 4, 19)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 5, 19)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 6, 19)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (341, 7, 19)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 4, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 5, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 6, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (342, 7, 32)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 4, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 5, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 6, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (343, 7, 1)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 4, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 5, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 6, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (344, 7, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 4, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 5, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 6, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (345, 7, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 4, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 5, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 6, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (346, 7, 0)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 4, 369)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 5, 369)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 6, 369)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (347, 7, 369)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 4, 36)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 5, 36)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 6, 36)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (348, 7, 36)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 4, 3)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 5, 3)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 6, 3)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (349, 7, 3)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 4, 9)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 5, 9)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 6, 9)
INSERT [dbo].[ProductoSucursalRela] ([id_producto], [id_sucursal], [stock]) VALUES (350, 7, 9)
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [nombre]) VALUES (1, N'ADM')
INSERT [dbo].[Roles] ([id], [nombre]) VALUES (2, N'VENTAS')
INSERT [dbo].[Roles] ([id], [nombre]) VALUES (3, N'CLIENTE')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Sucursales] ON 

INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (4, N'Deportes Lomas', N'32599653', N'Alen Doble  188')
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (5, N'Deporte llavallol', N'30252252236995', N'bahia blanca 234')
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (6, N'adrogue Deportes', N'24811532', N'almt Brown 3598')
INSERT [dbo].[Sucursales] ([id], [razon_social], [cuil], [direccion]) VALUES (7, N'megatlon', N'359896532', N'lberdi 1623')
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (49, N'juan', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'jjmadeo@gmail.com', N'Alberdi 1637 , Luis Guillon', N'Juan Jose')
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (50, N'svaldez', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'svaldez@gmail.com', N'Presidente Peron 1661,Adrogue', N'Sergio Valdez')
INSERT [dbo].[usuarios] ([id], [usuario], [password], [id_role], [nombre], [direccion], [email]) VALUES (51, N'mta', N'81-DC-9B-DB-52-D0-4D-C2-00-36-DB-D8-31-3E-D0-55', 3, N'madriazola@gmail.com', N'Piedra Buena 1234', N'Maria Adriazola')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_productos]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Ventas] FOREIGN KEY([id_venta])
REFERENCES [dbo].[Ventas] ([id])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Ventas]
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
ALTER TABLE [dbo].[ProductoSucursalRela]  WITH CHECK ADD  CONSTRAINT [FK_ProductoSucursalRela_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[ProductoSucursalRela] CHECK CONSTRAINT [FK_ProductoSucursalRela_productos]
GO
ALTER TABLE [dbo].[ProductoSucursalRela]  WITH CHECK ADD  CONSTRAINT [FK_ProductoSucursalRela_Sucursales] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[ProductoSucursalRela] CHECK CONSTRAINT [FK_ProductoSucursalRela_Sucursales]
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
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Empleados] FOREIGN KEY([id_empl])
REFERENCES [dbo].[Empleados] ([id_empl])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Empleados]
GO
/****** Object:  StoredProcedure [dbo].[sp_usuarios]    Script Date: 29/05/2020 23:58:47 ******/
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
